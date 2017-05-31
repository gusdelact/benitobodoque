// Sistema         : Clase de TMAvCesion
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMAvCesion
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMAvCesion;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,Math,
Unzip,ZipTypes,NMsmtp, ShellApi,
//Unidades Adicionales
IntCrEmisor,      //Emisor
IntCrProveed,     //Prooveedor
IntCrCredito,     //Disposición
IntMQrAvCesion,   //Reporte
IntMQrEtqAvCe,    //Etiquetas
IntMQrAvMail,      //Envio de Mail
IntParamCre,      //Parametros
IntGenCre, Psock, NMFtp         //Funciones y Constantes
;

Type
 TMAvCesion= class;

  TwMAvCesion=Class(TForm)
    InterForma1             : TInterForma;
    rgRelacion: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    rgTipo_Av: TRadioGroup;
    Label1: TLabel;
    edCopias: TEdit;
    updCopias: TUpDown;
    Label2: TLabel;
    chbxDisposicion: TCheckBox;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    Label3: TLabel;
    edIdCreditoIni: TEdit;
    btCreditoIni: TBitBtn;
    edNomAcredIni: TEdit;
    ilCreditoIni: TInterLinkit;
    ilCREDITO: TInterLinkit;
    Label5: TLabel;
    Label6: TLabel;
    edID_EMISOR: TEdit;
    btEmisor: TBitBtn;
    edNOMBRE_EMISOR: TEdit;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    cbEmisor: TCheckBox;
    cbProveedor: TCheckBox;
    ilEmisor: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    rgOrden: TRadioGroup;
    cbETIQUETAS: TCheckBox;
    GroupBox2: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label7: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    btSendMail: TBitBtn;
    NMFTP1: TNMFTP;
    NMSMTP1: TNMSMTP;
    Memo2: TMemo;
    Memo1: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure chbxDisposicionClick(Sender: TObject);
    procedure edIdCreditoIniExit(Sender: TObject);
    procedure btCreditoIniClick(Sender: TObject);
    procedure ilCreditoIniCapture(Sender: TObject; var Show: Boolean);
    procedure ilCreditoIniEjecuta(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edF_CesionExit(Sender: TObject);
    procedure btEmisorClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure ilEmisorEjecuta(Sender: TObject);
    procedure cbEmisorClick(Sender: TObject);
    procedure cbProveedorClick(Sender: TObject);
    procedure btSendMailClick(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        function ValidaciondeImpresiones(sF_Inicio, sF_Fin : String;
                                         sEmisor, sProveedor : String;
                                         iIdCesionFo, iIdCesionFf : Integer;
                                         sAviso, sRelacion, sOrden : String; iCopias : Integer;
                                         var aCesiones : TArrayInteger ): Boolean;
    public
    { Public declarations }
    Objeto : TMAvCesion;
end;
  //
  TMAvCesion= class(TInterFrame)
  private
  protected
  // procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
        { Public declarations }
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        Credito                  : TCrCredito;
        CreditoIni               : TCrCredito;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure   ObtieneCesiones( peInicio, peFFin : TDateTime; var IdCesionFo, IdCesionFf : Integer );
  published
  end;

var
    cNomArchivoPDF    : String;
    cNomArchivoUNZIP  : String;
    cNomPathTemp      : String;
    cMascaraUnzip     : String;
    Count             : longint;
    BytesExtracted    : longint;
    CompressedSize    : longint;
    UnzippedSize      : longint;

implementation
//Uses RepMon;


Function TmpDir : AnsiString;
var p : array [ 0 .. 259 ] of char;
Begin
  if GetTempPath( sizeof(p), p) > 0
  then Result := StrPas(p)
  else Result := 'c:\temp\';
End;
//
procedure Report ( Retcode : longint; R : pReportRec ); stdcall;
var pct : Byte;
    R1  : Real;
begin
  WITH r^ DO BEGIN
  CASE Status of
    file_starting  :
    begin
      Application.ProcessMessages;
      //Form1.Panel1.Caption := StrPas(FileName);
    end;

    file_completed :
    begin
      Application.ProcessMessages;
      //Form1.Panel1.Caption := '';
    end;

    file_unzipping :
    if Retcode > 0 then
    begin
      Inc ( BytesExtracted, Retcode);
      R1 := ( BytesExtracted / UnzippedSize ) * 100;
      Pct := Round ( R1 );
      Application.ProcessMessages;
      Application.ProcessMessages;
    end;
    unzip_completed :
    begin
      Application.ProcessMessages;
    end;
 END {case}
 END;

end; {report}
//

PROCEDURE Report2 ( Retcode : longint;R : pReportRec ); STDCALL;
Var
s:String;
BEGIN
   WITH r^ DO begin
        if Status <> unzip_completed then begin
           s := strpas ( filename );
           cNomArchivoPDF := s;
        end;
   end;
END; {Report2}

{$R *.DFM}


constructor TMAvCesion.Create( AOwner : TComponent );
begin Inherited;

      {$WARNINGS OFF}
      Emisor    := TCrEmisor.Create(Self);
      Emisor.MasterSource := Self;
      {$WARNINGS ON}

      {$WARNINGS OFF}
      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource := Self;
      {$WARNINGS ON}

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      {$WARNINGS OFF}
      CreditoIni := TCrCredito.Create(Self);
      {$WARNINGS ON}
      CreditoIni.MasterSource:=Self;
      CreditoIni.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      UseQuery := False;
      HelpFile := 'InTMAvCesion.Hlp';
      ShowMenuReporte:=True;
end;
{}
procedure TMAvCesion.ObtieneCesiones(peInicio, peFFin: TDateTime; var IdCesionFo, IdCesionFf: Integer);
var vlSql  : String;
    vlTQry : TQuery;
begin
  IdCesionFo := 0;        IdCesionFf := 0;
  try
    //Arma el query
    vlSql := 'SELECT NVL( MIN(ID_CESION), 0 ) ID_CESION_MIN, NVL( MAX(ID_CESION), 0 ) ID_CESION_MAX' + #13#10 +
             'FROM   CR_CESION' + #13#10 +
             'WHERE F_AUTORIZA >= ' + SQLFecha(peInicio) +
             '  AND F_AUTORIZA <= ' + SQLFecha(peFFin);   //'WHERE  F_ALTA = ' + SQLFecha(peFecha); // LOLS 24 09 2004
    vlTQry := GetSQLQuery( vlSql, Apli.DataBaseName, Apli.SessionName, False );
    if Assigned( vlTQry ) then
    begin
      IdCesionFo := vlTQry.FieldByName('ID_CESION_MIN').AsInteger;
      IdCesionFf := vlTQry.FieldByName('ID_CESION_MAX').AsInteger;
      vlTQry.Close;
      vlTQry.Free;
    end;
  except
    on e : exception do begin
      IdCesionFo := 0;        IdCesionFf := 0;
    end;
  end;
end;
{}
Destructor TMAvCesion.Destroy;
begin
   if Emisor <> nil then
     Emisor.Free;
   //ends_if
   if Proveedor <> nil then
     Proveedor.Free;
   //ends_if
   if Credito <> nil then
      Credito.Free;
   if CreditoIni <> nil then
      CreditoIni.Free;
   inherited;
end;


function TMAvCesion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMAvCesion;
begin
   W:=TwMAvCesion.Create(Self);
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


Function TMAvCesion.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMAvCesion.Reporte:Boolean;
begin //Execute_Reporte();
  result := true;
end;

(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMAvCesion.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
      dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

      Objeto.Emisor.ID_ACREDITADO.Control             := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOMBRE_EMISOR;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.Proveedor.ID_ACREDITADO.Control   := edID_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{/ROIM}
      Objeto.Proveedor.Persona.Nombre.Control  := edNOM_PROVEEDOR;
      Objeto.Proveedor.GetParams(Objeto);


      Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;
      Objeto.Credito.GetParams(Objeto);
      edNOM_ACREDITADO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edNOM_ACREDITADO.ShowHint := True;

      Objeto.CreditoIni.ID_CREDITO.Control := edIdCreditoIni;
      Objeto.CreditoIni.ContratoCre.Contrato.TITNombre.Control := edNomAcredIni;
      Objeto.CreditoIni.GetParams(Objeto);
      edNomAcredIni.Hint := Objeto.CreditoIni.ContratoCre.Contrato.TITNombre.AsString;
      edNomAcredIni.ShowHint := True;

end;

procedure TwMAvCesion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMAvCesion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMAvCesion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMAvCesion.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TwMAvCesion.FormDestroy(Sender: TObject);
begin
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.CreditoIni.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.CreditoIni.ID_CREDITO.Control := nil;

end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.ilEmisorEjecuta(Sender: TObject);
begin
  if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
  begin
    cbEmisor.Checked := True;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.btEmisorClick(Sender: TObject);
begin
  Objeto.Emisor.ShowAll := True;
  if Objeto.Emisor.Busca then
  begin
    cbEmisor.Checked := True;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.cbEmisorClick(Sender: TObject);
begin
  if not(cbEmisor.Checked) then
  begin
    if Objeto.Emisor.Active then
    begin
      Objeto.Emisor.Active := False;
    end;
  end;
  //
  if not(Objeto.Emisor.Active) then
     cbEmisor.Checked := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.ilPROVEEDOREjecuta(Sender: TObject);
begin
  if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
  begin
    cbProveedor.Checked := True;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.btPROVEEDORClick(Sender: TObject);
begin
  Objeto.Proveedor.ShowAll := True;
  if Objeto.Proveedor.Busca then
  begin
    cbProveedor.Checked := True;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.cbProveedorClick(Sender: TObject);
begin
  if not(cbProveedor.Checked) then
  begin
    if Objeto.Proveedor.Active then
    begin
      Objeto.Proveedor.Active := False;
    end;
  end;
  //
  if not(Objeto.Proveedor.Active) then
     cbProveedor.Checked := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvCesion.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMAvCesion.ilCREDITOCapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TwMAvCesion.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TwMAvCesion.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMAvCesion.chbxDisposicionClick(Sender: TObject);
begin
    If not chbxDisposicion.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxDisposicion.Checked:=False;
        chbxDisposicion.Enabled:=False;
    End Else Begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
    End;
end;

procedure TwMAvCesion.edIdCreditoIniExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edIdCreditoIni,True,'',True);
end;

procedure TwMAvCesion.btCreditoIniClick(Sender: TObject);
begin
   Objeto.CreditoIni.ShowAll := True;
   if Objeto.CreditoIni.Busca then begin
        InterForma1.NextTab(edIdCreditoIni);
   End;
end;

procedure TwMAvCesion.ilCreditoIniCapture(Sender: TObject;
  var Show: Boolean);
begin
     Show := True;
end;

procedure TwMAvCesion.ilCreditoIniEjecuta(Sender: TObject);
begin
   if Objeto.CreditoIni.FindKey([ilCreditoIni.Buffer]) then begin
        InterForma1.NextTab(edIdCreditoIni);
   end;
end;

function TwMAvCesion.ValidaciondeImpresiones(sF_Inicio, sF_Fin : String;
                                             sEmisor, sProveedor : String;
                                             iIdCesionFo, iIdCesionFf : Integer;
                                             sAviso, sRelacion, sOrden : String; iCopias : Integer;
                                             var aCesiones : TArrayInteger ): Boolean;


    function YaFueImpreso(nID_CESION : Integer; strCVE_AVISO : String;
                          var nNUM_IMPRESION : Integer) : Boolean;
    var Qry : TQuery;
    begin
        Result := False;
        Qry := TQuery.Create(Nil);
        If Assigned(Qry) Then
        With Qry Do
         Try
          DataBaseName := Objeto.Apli.DataBaseName;
          SessionName := Objeto.Apli.SessionName;
          SQL.Clear;
          SQL.Add(' SELECT NUM_IMPRESION '+
                  ' FROM CR_CTRL_AVISO '+
                  ' WHERE ID_CREDITO = '+IntToStr(nID_CESION)+
                  '   AND ID_DOCUMENTO = 0'+
                  '   AND CVE_AVISO = '#39+strCVE_AVISO+#39
                  );
          Open; Last;

          nNUM_IMPRESION := FieldByName('NUM_IMPRESION').AsInteger;
          Result := RecordCount > 0;
         Finally
          Close;
          Free;
         End;
    end;

var QrAvCesion : TQrAvCesion;
    Qry : TQuery;
    strSQL, sDescTipoAv, sDescRelacion : String;
    nCount, nNUM_IMPRESION, nID_CESION : Integer;
begin
 Result := True;

 sDescTipoAv := rgTipo_Av.Items[rgTipo_Av.ItemIndex];
 If (rgTipo_Av.ItemIndex = 2) Then
  sDescTipoAv := rgTipo_Av.Items[0] + ' y ' + rgTipo_Av.Items[1];

 sDescRelacion := rgRelacion.Items[rgRelacion.ItemIndex];

 QrAvCesion := TQrAvCesion.Create(Nil);
 Qry := TQuery.Create(Nil);

 If Assigned(QrAvCesion) And Assigned(Qry) Then
  Begin
  strSQL := QrAvCesion.FormaQuery(sF_Inicio, sF_Fin, sEmisor, sProveedor,
                                  iIdCesionFo, iIdCesionFf,
                                  sAviso, sRelacion, iCopias, '', sOrden);

  With Qry Do
   Try
   DataBaseName := Objeto.Apli.DataBaseName;
   SessionName := Objeto.Apli.SessionName;
   SQL.Clear;
   SQL.Add(strSQL);
   Open;
   First;

    nCount := 0;  SetLength(aCesiones,0); nID_CESION := 0;

    While Not Eof Do
     Begin

      If (FieldByName('ID_CESION').AsInteger <> nID_CESION) Then
       Begin
           nID_CESION := FieldByName('ID_CESION').AsInteger;
           If YaFueImpreso(FieldByName('ID_CESION').AsInteger, FieldByName('AVISO').AsString, nNUM_IMPRESION) Then
            Case MessageDlg('El aviso "'+sDescTipoAv+'" con relación "'+sDescRelacion+'" de la cesión '+FieldByName('ID_CESION').AsString+', ya fué impresa con anterioridad.'#13#10+
                            '¿Deseá volver a imprimirla?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) Of
             mrNo  :  Begin
                      // Agrega la Cesión en un arreglo para posteriormente descartarla en su Impresión
                      // NOTA: Este arreglo es un parámetro de salida
                      SetLength(aCesiones, nCount+1);
                      aCesiones[nCount] := FieldByName('ID_CESION').AsInteger;
                      Inc(nCount);
                      End;

             mrCancel : Begin
                        Result := False;
                        Exit;
                        End;
            End;
       End;

       Next;
       Application.ProcessMessages;
     End;

   Finally
    Qry.Close;
   End;

  End;

  If Assigned(Qry) Then Qry.Free;
  If Assigned(QrAvCesion) Then QrAvCesion.Free;
end;


Procedure TwMAvCesion.ImprimeReporte(bPreview:Boolean);
Var
    sTipoAv,sRelacion,sCesiones, sComa, sOrden:String;
    iSit,iIdCesion1,iIdCesion2, I :Integer;
    aCesiones : TArrayInteger;
    sEmisor, sProveedor : String;
Begin
    sEmisor := '';
    sProveedor := '';
    //
    if ( ( Objeto.Emisor.Active ) and ( Objeto.Emisor.ID_ACREDITADO.AsString <> '' ) ) then
      sEmisor := Objeto.Emisor.ID_ACREDITADO.AsString;
    //
    if ( ( Objeto.Proveedor.Active ) and ( Objeto.Proveedor.ID_ACREDITADO.AsString <> '' )) then
      sProveedor := Objeto.Proveedor.ID_ACREDITADO.AsString;
    //
    iIdCesion2:=0;
    iSit:=rgTipo_Av.ItemIndex;
    case iSit of
        0: sTipoAv:='CARGO'; //Cargo
        1: sTipoAv:='ABONO'; //Abono
        2: sTipoAv:='';      //Ambos
    end;
    iSit:=rgRelacion.ItemIndex;
    case iSit of
        0: sRelacion:='EP';  //Emisor-Proveedor
        1: sRelacion:='EE';  //Emisor-Emisor
    end;

    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden :='EM';  //Emisor
        1: sOrden :='PR';  //Proveedor
    end;

    If Trim(edIdCreditoIni.Text)<>'' Then
        iIdCesion1:= StrToInt(edIdCreditoIni.Text)
    Else iIdCesion1:=0;
    If Trim(edID_CREDITO.Text)<>'' Then
        iIdCesion2:= StrToInt(edID_CREDITO.Text)
    Else iIdCesion2:=0;

    {LOLS}
    //Validaciones
    if ( iIdCesion1 = 0 ) and ( iIdCesion2 > 0 ) then
    begin
      ShowMessage('Indique el número de disposición inicial');
      exit;
    end;
    //Validaciones
    if ( iIdCesion1 > iIdCesion2 ) and ( iIdCesion2 > 0  ) then
    begin
      ShowMessage('El número de disposición inicial no puede ser mayor al final.');
      exit;
    end;

    //Determina el rango de cesiones
    if iIdCesion1 = 0 then  {Todas las cesiones que se colocaron en la fecha dada }
    begin
      Objeto.ObtieneCesiones( StrToDate(edF_Inicio.Text), StrToDate(edF_FIN.Text), iIdCesion1, iIdCesion2 );
    end else                {Aplica un rango de cesiones }
    begin
      if iIdCesion2 = 0 then
         iIdCesion2 := iIdCesion1;
      //ends_if
    end;

  IF cbETIQUETAS.Checked THEN BEGIN
     sCesiones:= '0';
     RepEtiqtaAvisCes(edF_Inicio.Text,edF_Fin.Text, sEmisor,                sProveedor,
                      iIdCesion1,           iIdCesion2,             sCesiones,
                      sOrden,               Objeto.Apli,            bPreview);
  END
  ELSE BEGIN
    If ValidaciondeImpresiones(edF_Inicio.Text,edF_Fin.Text,
                               sEmisor, sProveedor,
                               iIdCesion1, iIdCesion2,
                               sTipoAv, sRelacion, sOrden, StrToInt(edCopias.Text), aCesiones) Then
      Begin
      { Obtiene las Cesiones Rechazadas }
      sCesiones := ''; sComa := '';
       For I := 0 To High(aCesiones) Do
        Begin
        sCesiones := sCesiones + sComa + IntToStr(aCesiones[I]);
        sComa := ',';
        End;
        { Muestra el reporte }
        RepAvisosxCesion( edF_Inicio.Text,        edF_Fin.Text,    sEmisor,        sProveedor,
                          iIdCesion1,               iIdCesion2,     sTipoAv,
                          sRelacion,                StrToInt(edCopias.Text),
                          sCesiones,                sOrden,         Objeto.Apli, bPreview);
        if MessageDlg('¿Desea imprimir las etiquetas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  RepEtiqtaAvisCes(edF_Inicio.Text,edF_Fin.Text, sEmisor,                sProveedor,
                                   iIdCesion1,           iIdCesion2,             sCesiones,
                                   sOrden,               Objeto.Apli,            bPreview);
      End;
    {ENDS_LOLS}
  END;
  SetLength(aCesiones,0);

    {
    If Trim(edID_CREDITO.Text)<>'' Then Begin
        iMax:=Max(iIdCesion1,iIdCesion2);
        iMin:=Min(iIdCesion1,iIdCesion2);
        iReg:=iMin;
        While iReg<=iMax Do Begin
                RepAvisosxCesion(   edF_Cesion.Text, IntToStr(iReg), sTipoAv ,
                                sRelacion      , StrToInt(edCopias.Text),
                                Objeto.Apli,bPreview);
            inc(iReg);
        End;
    End Else Begin
        RepAvisosxCesion(   edF_Cesion.Text, IntToStr(iIdCesion1), sTipoAv ,
                            sRelacion      , StrToInt(edCopias.Text),
                            Objeto.Apli,bPreview);
    End;
    }
End;

procedure TwMAvCesion.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

procedure TwMAvCesion.edF_CesionExit(Sender: TObject);
begin
   Objeto.CreditoIni.BuscaWhereString := 'CR_CREDITO.F_AUTORIZA >= ' + SQLFecha(StrToDateTime(edF_Inicio.Text)) +
                                         ' AND CR_CREDITO.F_AUTORIZA >= ' + SQLFecha(StrToDateTime(edF_FIN.Text));
   Objeto.CreditoIni.FilterString := Objeto.CreditoIni.BuscaWhereString;

   Objeto.Credito.BuscaWhereString := 'CR_CREDITO.F_AUTORIZA >= ' + SQLFecha(StrToDateTime(edF_Inicio.Text))+
                                         ' AND CR_CREDITO.F_AUTORIZA >= ' + SQLFecha(StrToDateTime(edF_FIN.Text));
   Objeto.Credito.FilterString := Objeto.Credito.BuscaWhereString;
end;


procedure TwMAvCesion.btSendMailClick(Sender: TObject);
Var
    sTipoAv,sRelacion,sCesiones, sComa, sOrden:String;
    iSit,iIdCesion1,iIdCesion2, I :Integer;
    aCesiones : TArrayInteger;
    sEmisor, sProveedor : String;
    grOpcion : TGenRepOption;
    sFileName,vlSql, Directorio : String;
    Qry : TQuery;
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
    s, d, ss : ShortString;
    Count2, nCount   : Integer;
    vlMsg: String;
  function AbreConexion( pCURPATH: String): Boolean;
  begin
    Result := False;
    // Si no esta conectado abre la conexion
    if not NMFTP1.Connected then
    begin
      NMFTP1.Connect;
      NMFTP1.Mode(MODE_IMAGE);
      Result := True;
    end else begin
      NMFTP1.DoCommand('PWD');
      Result := True;
    end;
    //
    //
    if NMFTP1.Connected then
    Begin
      NMFTP1.ChangeDir( pCURPATH);
    End;
    //
  end;

  function ObtSmtpHost: String;
  const
   coSMTPIP        = 'SELECT TX_QUERY_DATA FROM EMAIL_MSG WHERE CVE_MSG = ''ENV_MSG'' AND B_BLOQUEADO = ''V'' ';
  begin
    result := '';
    GetSQLStr( coSMTPIP, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TX_QUERY_DATA', Result, False );
    if result = '' then
      result := '132.1.6.62';
    //ends_if
  end;

Begin
    sEmisor := '';
    sProveedor := '';
    nCount := 1;
    //
    if ( ( Objeto.Emisor.Active ) and ( Objeto.Emisor.ID_ACREDITADO.AsString <> '' ) ) then
      sEmisor := Objeto.Emisor.ID_ACREDITADO.AsString;
    //
    if ( ( Objeto.Proveedor.Active ) and ( Objeto.Proveedor.ID_ACREDITADO.AsString <> '' )) then
      sProveedor := Objeto.Proveedor.ID_ACREDITADO.AsString;
    //
    iIdCesion2:=0;
    iSit:=rgTipo_Av.ItemIndex;
    case iSit of
        0: sTipoAv:='CARGO'; //Cargo
        1: sTipoAv:='ABONO'; //Abono
        2: sTipoAv:='';      //Ambos
    end;
    iSit:=rgRelacion.ItemIndex;
    case iSit of
        0: sRelacion:='EP';  //Emisor-Proveedor
        1: sRelacion:='EE';  //Emisor-Emisor
    end;

    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden :='EM';  //Emisor
        1: sOrden :='PR';  //Proveedor
    end;

    If Trim(edIdCreditoIni.Text)<>'' Then
        iIdCesion1:= StrToInt(edIdCreditoIni.Text)
    Else iIdCesion1:=0;
    If Trim(edID_CREDITO.Text)<>'' Then
        iIdCesion2:= StrToInt(edID_CREDITO.Text)
    Else iIdCesion2:=0;

    {LOLS}
    //Validaciones
    if ( iIdCesion1 = 0 ) and ( iIdCesion2 > 0 ) then
    begin
      ShowMessage('Indique el número de disposición inicial');
      exit;
    end;
    //Validaciones
    if ( iIdCesion1 > iIdCesion2 ) and ( iIdCesion2 > 0  ) then
    begin
      ShowMessage('El número de disposición inicial no puede ser mayor al final.');
      exit;
    end;

    //Determina el rango de cesiones
    if iIdCesion1 = 0 then  {Todas las cesiones que se colocaron en la fecha dada }
    begin
      Objeto.ObtieneCesiones( StrToDate(edF_Inicio.Text), StrToDate(edF_FIN.Text), iIdCesion1, iIdCesion2 );
    end else                {Aplica un rango de cesiones }
    begin
      if iIdCesion2 = 0 then
         iIdCesion2 := iIdCesion1;
      //ends_if
    end;

      { Obtiene las Cesiones Rechazadas }
      sCesiones := ''; sComa := '';
       For I := 0 To High(aCesiones) Do
        Begin
        sCesiones := sCesiones + sComa + IntToStr(aCesiones[I]);
        sComa := ',';
        End;
      vlSql := ObtQryAviso('V',edID_CREDITO.Text, coCveColoca,'CARGO', '',sEmisor, sProveedor, StrToDateTime(edF_Inicio.Text), StrToDateTime(edF_Fin.Text));
      if vlSql = '' then
        exit;
      //end

      Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          //Muestra el reporte
          sFileName := 'CESION_' + Qry.FieldByName('ID_CESION').AsString +'_'+ FormatDateTime('dd_mm_yyyy', StrToDateTime(edF_Fin.Text) );
          RepAvisosxCsMail( edF_Inicio.Text,        edF_Fin.Text,
                          Qry.FieldByName('ID_EMISOR').AsString,  Qry.FieldByName('ID_PROVEEDOR').AsString,
                          Qry.FieldByName('ID_CESION').AsInteger,  Qry.FieldByName('ID_CESION').AsInteger,
                          sTipoAv, sRelacion,              StrToInt(edCopias.Text),
                          '0',              sOrden,          Objeto.Apli,
                          True, grDigitaliza, sFileName , Qry.FieldByName('MAIL_PROV').AsString
                          );
          Qry.Next;
        end;//ends_if
        ShowMessage('Proceso Conluido');
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;

end;

end.

