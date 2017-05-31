// MODIFICADO 18 MAY 04 : QUITA LOS DOCUMENTOS CANCELADOS DE LOS AVISOS
// MODIFICADO 24 SEP 04 : BUSCA POR FECHA DE AUTORIZACION
// MODIFICADO 21 DIC 04 : INCORPORA FILTRO EMISOR PROVEEDOR
                                  
unit IntMQrAvMail;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc,Psock,
  Unzip,ZipTypes,NMsmtp, ShellApi, NMFtp;

type
  TQrAvMail = class(TQuickRep)
    QRGroup1: TQRGroup;
    qyAvMail: TQuery;
    QRBand2: TQRBand;
    qrlFecha: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel30: TQRLabel;
    QRLConcepto: TQRLabel;
    QRLConceptoIVA: TQRLabel;
    QRLTotal: TQRLabel;
    QRShape1: TQRShape;
    QRNombre: TQRLabel;
    QRLRFC: TQRLabel;
    QRDireccion: TQRLabel;
    QRColonia: TQRLabel;
    QRDelegacion: TQRLabel;
    QRCP: TQRLabel;
    QRCiudad: TQRLabel;
    QRCuenta: TQRLabel;
    qyAvMailID_CESION: TFloatField;
    qyAvMailNOM_EMISOR: TStringField;
    qyAvMailNOM_PROVEEDOR: TStringField;
    qyAvMailRFC_E: TStringField;
    qyAvMailRFC_P: TStringField;
    qyAvMailDIRECCION_E: TStringField;
    qyAvMailCOLONIA_E: TStringField;
    qyAvMailDELEGACION_E: TStringField;
    qyAvMailCODIGO_POSTAL_E: TStringField;
    qyAvMailCIUDAD_E: TStringField;
    qyAvMailDIRECCION_P: TStringField;
    qyAvMailCOLONIA_P: TStringField;
    qyAvMailDELEGACION_P: TStringField;
    qyAvMailCODIGO_POSTAL_P: TStringField;
    qyAvMailCIUDAD_P: TStringField;
    qyAvMailDESC_L_PRODUCTO: TStringField;
    qyAvMailCTA_EMI: TStringField;
    qyAvMailCTA_PROV: TStringField;
    qyAvMailDESC_MONEDA: TStringField;
    qyAvMailIMP_CAPITAL: TFloatField;
    qyAvMailIMP_INTERES: TFloatField;
    qyAvMailIMP_IVA: TFloatField;
    qyAvMailIMP_TOTAL_INT: TFloatField;
    qyAvMailAVISO: TStringField;
    qyAvMailF_ALTA: TDateTimeField;
    qyAvMailCERO: TFloatField;
    qyAvMailCONCEPTO: TFloatField;
    qyAvMailIVA: TFloatField;
    qyAvMailIMPORTE_TOT: TFloatField;
    qyAvMailF_AUTORIZA: TDateTimeField;
    QRConcepto: TQRLabel;
    QRIvaConcepto: TQRLabel;
    QRImpTotal: TQRLabel;
    QRRFC: TQRLabel;
    QRImageCARGO: TQRImage;
    QRImageABONO: TQRImage;
    QRLFechaSello: TQRLabel;
    qyAvMailB_APLICA_IVA: TStringField;
    qyAvMailCVE_PER_JURIDICA: TStringField;
    qyAvMailPCT_IVA: TFloatField;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    EtiquetaAviso: TQRLabel;
    QRImage1: TQRImage;
    InterDigDoc1: TInterDigDoc;
    NMSMTP1: TNMSMTP;
    NMFTP1: TNMFTP;
    Memo2: TQRMemo;
    Memo1: TQRMemo;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlFechaPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QRLFechaSelloPrint(sender: TObject; var Value: String);
  private
    VLRelacion : String;
    Apli       : TInterApli;
  public

    Function FormaQuery(sF_Inicio, sF_Fin : String;
                        sEmisor, sProveedor : String;
                        iIdCesionFo, iIdCesionFf : Integer;
                        sAviso, sRelacion : String; iCopias : Integer; sCesiones, sOrden : String ): String;
  end;

const coCRLF = #13#10;

var
  QrAvMail: TQrAvMail;
  vgApli: TInterApli;
  vgArchivoDig , vgDirMail, vgFAviso : String;

Procedure RepAvisosxCsMail( sF_Inicio, sF_Fin   : String;
                            sEmisor     : String;
                            sProveedor  : String;
                            sIdCesionFo : Integer;
                            sIdCesionFf : Integer;
                            sAviso      : String;
                            sRelacion   : String;
                            iCopias     : Integer;
                            sCesiones   : String; // Cesiones a Ignorar para su Impresión
                            sOrden      : String;
                            pAPli       : TInterApli;
                            pPreview    : Boolean;
                            grOpcion    : TGenRepOption;
                            sArchivoDig : String;
                            sDirMail    : String
                            );

//function RegistraEmailAviso(nID_CREDITO : Integer; pbMail, strID_DOCUMENTO, strCVE_AVISO : String;
//                            nCopias : Integer;  Apli : TInterApli) : Integer;

var
    cNomArchivoPDF    : String;
    cNomArchivoUNZIP  : String;
    cNomPathTemp      : String;
    cMascaraUnzip     : String;
    Count             : longint;
    BytesExtracted    : longint;
    CompressedSize    : longint;
    UnzippedSize      : longint;

Implementation

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

Procedure RepAvisosxCsMail( sF_Inicio, sF_Fin   : String;
                            sEmisor     : String;
                            sProveedor  : String;
                            sIdCesionFo : Integer;
                            sIdCesionFf : Integer;
                            sAviso      : String;
                            sRelacion   : String;
                            iCopias     : Integer;
                            sCesiones   : String;
                            sOrden      : String;
                            pAPli       : TInterApli;
                            pPreview    : Boolean;
                            grOpcion    : TGenRepOption;
                            sArchivoDig : String;
                            sDirMail    : String
                            );
Var
    QrAvMail  : TQrAvMail;
    Preview     : TIntQRPreview;
    Directorio : String;
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
    s, d, ss : ShortString;
    Count2, nCount   : Integer;
    vlMsg: String;
    pArchivo: PChar;

  function AbreConexion( pCURPATH: String): Boolean;
  begin
    Result := False;
    // Si no esta conectado abre la conexion
    if not QrAvMail.NMFTP1.Connected then
    begin
      QrAvMail.NMFTP1.Connect;
      QrAvMail.NMFTP1.Mode(MODE_IMAGE);
      Result := True;
    end else begin
      QrAvMail.NMFTP1.DoCommand('PWD');
      Result := True;
    end;
    //
    //
    if QrAvMail.NMFTP1.Connected then
    Begin
      QrAvMail.NMFTP1.ChangeDir( pCURPATH);
    End;
    //
  end;

  function ObtSmtpHost(Apli: TInterApli): String;
  const
   coSMTPIP        = 'SELECT TX_QUERY_DATA FROM EMAIL_MSG WHERE CVE_MSG = ''ENV_MSG'' AND B_BLOQUEADO = ''V'' ';
  begin
    result := '';
    GetSQLStr( coSMTPIP, Apli.DataBaseName, Apli.SessionName, 'TX_QUERY_DATA', Result, False );
    if result = '' then
      result := '132.1.6.62';
    //ends_if
  end;

Begin
    QrAvMail:=TQrAvMail.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAvMail);
    vgApli:= pApli;
    Try
        QrAvMail.VLRelacion := sRelacion;
        QrAvMail.qyAvMail.DatabaseName := pApli.DataBaseName;
        QrAvMail.qyAvMail.SessionName := pApli.SessionName;
        QrAvMail.Apli := pApli;

        QrAvMail.qyAvMail.Active:=False;
        QrAvMail.qyAvMail.SQL.Text:= QrAvMail.FormaQuery(sF_Inicio, sF_Fin,
                                                    sEmisor, sProveedor, // lols
                                                    sIdCesionFo, sIdCesionFf,
                                                    sAviso   , sRelacion ,  iCopias, sCesiones, sOrden);

        QrAvMail.qrlFecha.Caption:= FormatDateTime('"MÉXICO D.F. A " dd " DE " mmmm " DEL " yyyy',
                            pAPli.DameFechaEmpresaDia('D000'));
        QrAvMail.EtiquetaAviso.Caption := sAviso;
        vgArchivoDig := sArchivoDig ;
        vgDirMail    := sDirMail;
        vgFAviso     := sF_Fin;

        QrAvMail.qyAvMail.Active:=True;
        QrAvMail.qyAvMail.SQL.SaveToFile('c:\avisomail.txt');

        If Not QrAvMail.qyAvMail.IsEmpty Then
         Begin
          If grOpcion = grPreview Then
             QrAvMail.Preview
          Else if grOpcion = grPrint Then
             QrAvMail.Print
          Else if grOpcion = grDigitaliza Then
          Begin
                QrAvMail.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'AVISOSDIR',   pApli );
                QrAvMail.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
                QrAvMail.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
                QrAvMail.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
                QrAvMail.InterDigDoc1.SendTo   := '/';//ObtSendTo( sF_Inicio );
                QrAvMail.InterDigDoc1.FileName := sArchivoDig;
                QrAvMail.PrinterSettings.PrinterIndex := QrAvMail.InterDigDoc1.SetPrinter;
                QrAvMail.Print;
                QrAvMail.InterDigDoc1.Compress;
                QrAvMail.InterDigDoc1.SendFile;
                QrAvMail.PrinterSettings.PrinterIndex := QrAvMail.InterDigDoc1.RestorePrinter;

                nCount := 1;
                Try
                  if QrAvMail.NMFTP1.Connected then QrAvMail.NMFTP1.Disconnect;
                  //
                  QrAvMail.NMFTP1.Host     := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
                  QrAvMail.NMFTP1.UserID   := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
                  QrAvMail.NMFTP1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
                  //
                  Directorio := obtValorGpoCve( 'CONFRH', 'AVISOSDIR',   pApli );
                  //extrae archivo
                  sRemoteFile:= sArchivoDig+'.zip';
                  sLocalFile := TmpDir + sArchivoDig+'.zip';
                  if AbreConexion(obtValorGpoCve( 'CONFRH', 'AVISOSDIR',  pApli )) then
                  Begin
                      QrAvMail.NMFTP1.Download( sRemoteFile, sLocalFile );
                      if UpperCase( ExtractFileExt( sLocalFile ) ) = '.ZIP' then
                      Begin
                        cNomArchivoUNZIP := sLocalFile;
                        cNomPathTemp  := ExtractFilePath(sLocalFile);
                        cMascaraUnzip := '*.*';

                        CompressedSize := 0;
                        BytesExtracted := 0;
                        s := cNomArchivoUNZIP + #0;
                        d := cNomPathTemp + #0;
                        ss:= cMascaraUnzip + #0;
                        UnzippedSize := UnzipSize(@s[1], CompressedSize);
                        Count2 := ViewZip(@s[1], '*.*', Report2);
                        Count := FileUnzip( @s[1], @d[1], @ss[1], Report, nil);
                        //
                        sAcrobatFile := TmpDir + cNomArchivoPDF;
                      End;

                      if sDirMail <> '' then
                      begin
                        if sAcrobatFile <> '' then
                        Begin
                          RenameFile(sAcrobatFile, ChangeFileExt(sAcrobatFile,'.pdf')) ;
                          Begin
                            sAcrobatFile := ChangeFileExt(sAcrobatFile,'.pdf');
                            QrAvMail.Memo1.Lines.Clear;
                            QrAvMail.Memo2.Lines.Clear;
                            QrAvMail.Memo1.Lines.Add(sDirMail); //Se agrega el correo del cliente como destinatario
                            QrAvMail.Memo1.Lines.Add(obtValorGpoCve( 'CONFRH', 'MAIL_SEND', pApli ));  //Se agrega el correo de Ricardo tambien como destinatario
                            msgBodyMail(QrAvMail.Memo2, 'CONFRH', pApli); // Se parsea el mensaje del body del correo. 
                            QrAvMail.NMSMTP1.Host:=  ObtSmtpHost(pApli); //'132.1.4.130'
                            QrAvMail.NMSMTP1.Connect;
                            QrAvMail.NMSMTP1.PostMessage.ToAddress.Assign(QrAvMail.Memo1.Lines); //Se agregan las cuentas del cliente y Ricardo
                            QrAvMail.NMSMTP1.PostMessage.FromAddress  :=obtValorGpoCve( 'CONFRH', 'MAIL_SEND', pApli ); //El remitente es Ricardo
                            QrAvMail.NMSMTP1.PostMessage.FromName:= 'Aviso de Cargo Operacion ' + sF_Fin;
                            QrAvMail.NMSMTP1.PostMessage.Subject:='Aviso de Cargo Cesion: '  + IntToStr(sIdCesionFf)+' ' + sF_Fin;
                            QrAvMail.NMSMTP1.PostMessage.date := FormatDateTime('m/d/yyyy hh:nn am/pm',Now);
                            QrAvMail.NMSMTP1.PostMessage.Attachments.Clear;
                            QrAvMail.NMSMTP1.PostMessage.Attachments.Add(sAcrobatFile);
                            //En la siguiente validacion se asegura que el credito indicado en el subject debe corresponder al documento adjunto.
                            if Pos(IntToStr(sIdCesionFf), sArchivoDig)<=1 then
                              begin
                                //En caso de error sólo se envía el correo con el documento adjunto a Ricardo.
                                QrAvMail.Memo1.Lines.Clear;
                                QrAvMail.Memo1.Lines.Add(obtValorGpoCve( 'CONFRH', 'MAIL_SEND', pApli ));
                                QrAvMail.NMSMTP1.PostMessage.ToAddress.Assign(QrAvMail.Memo1.Lines);
                                //Se agrega texto de NO ENVIADO al principio del subject, para que lo identifique Ricardo.
                                QrAvMail.NMSMTP1.PostMessage.Subject:='(NO ENVIADO) Aviso de Cargo Cesion: '  + IntToStr(sIdCesionFf)+' ' + sF_Fin;
                                //Se agrega leyenda DE ADVENTENCIA al cuerpo del correo.
                                QrAvMail.Memo2.Lines.Clear;
                                QrAvMail.Memo2.Lines.Add('********************************************************');
                                QrAvMail.Memo2.Lines.Add('    EL CORREO NO FUE ENVIADO A SU DESTINATARIO. ');
                                QrAvMail.Memo2.Lines.Add(' -- El documento adjunto no corresponde al destinatario: '+sDirMail);
                                QrAvMail.Memo2.Lines.Add('********************************************************');
                                QrAvMail.Memo2.Lines.Add(' ');
                                msgBodyMail(QrAvMail.Memo2, 'CONFRH', pApli); //Se agrega el mensaje original
                              end;
                            QrAvMail.NMSMTP1.PostMessage.Body.Assign(QrAvMail.Memo2.Lines);
                            QrAvMail.NMSMTP1.SubType:=mtHTML;
                            QrAvMail.NMSMTP1.SendMail;
                            QrAvMail.NMSMTP1.Disconnect;
                          end;
                       end;
{                        StpInsertUpdAv(sAviso, IntToStr(sIdCesionFf), '0','V',
                                    'Se envio Archivo ' + sArchivoDig + ' de Colocación al correo: '+ sDirMail,
                                    DateTimeToStr(Now), nCount,
                                    pApli, vlMsg);
}
                       end
                       else
                       Begin
                        StpInsertUpdAv(sAviso,IntToStr(sIdCesionFf), '0','F',
                                    'NO SE ENVIO ARCHIVO. PROVEEDOR NO TIENE CORREO ASIGNADO',
                                    DateTimeToStr(Now),DateTimeToStr(Now), 1,
                                    pApli, vlMsg);
                       end;
//                       pArchivo := sAcrobatFile;
//                       If (sAcrobatFile<>'') And (FileExists(sAcrobatFile)) then DeleteFile(pArchivo));


                       if AbreConexion(obtValorGpoCve( 'CONFRH', 'AVISOSDIR',   pApli )) then
                          QrAvMail.NMFTP1.Delete(Directorio + '/' +sArchivoDig+'.zip');
                       sAcrobatFile := '';

                  end;

                  Application.ProcessMessages;
                  if QrAvMail.NMFTP1.Connected then QrAvMail.NMFTP1.Disconnect;

                Except
                  on e : exception do
                  begin
                    showmessage(e.Message);
                    StpInsertUpdAv(sAviso,IntToStr(sIdCesionFf), '0','F',
                                   'NO SE ENVIO ARCHIVO.' + e.Message,
                                    DateTimeToStr(Now),DateTimeToStr(Now), 1,
                                    pApli, vlMsg);
                  end;
                End;//Ends_Try..Except
          End;
         end
        Else
          ShowMessage('No hay datos que mostrar');

    Finally
        QrAvMail.qyAvMail.Close;
        QrAvMail.free;
    End;

    If Assigned(Preview) Then Preview.Free;
End;
{
function RegistraEmailAviso(nID_CREDITO : Integer; pbMail, strID_DOCUMENTO, strCVE_AVISO : String;
                            nCopias : Integer;  Apli : TInterApli) : Integer;
var Stp : TStoredProc;
Begin
 Result := 0;
 Stp := TStoredProc.Create(Nil);
 If Assigned(Stp) Then
  With Stp Do
   Try
     DataBaseName := Apli.DataBaseName;
     SessionName := Apli.SessionName;
     StoredProcName := 'PKGCRPERIODO.STPACTIMPRAVISO';
     Params.Clear;
     Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
     Params.CreateParam(ftString,'PEID_DOCUMENTO',ptInput);
     Params.CreateParam(ftString,'PECVE_AVISO',ptInput);
     Params.CreateParam(ftInteger,'PENUM_IMPRESION',ptInput);
     Params.CreateParam( ftString,   'peB_MAIL', ptInput  );
     Params.CreateParam( ftDateTime, 'peFHMAIL', ptInput  );
     Params.CreateParam( ftString,   'peTxMAIL', ptInput  );
     Params.CreateParam( ftString,   'peUSUARIO', ptInput  );
     Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
     Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
     Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);

     // Actualiza el número de Impresión en la tabla "CR_CTRL_AVISO"
     ParamByName('PEID_CREDITO').AsInteger := nID_CREDITO;
     ParamByName('PEID_DOCUMENTO').AsString := strID_DOCUMENTO;
     ParamByName('PECVE_AVISO').AsString := strCVE_AVISO;
     ParamByName('PENUM_IMPRESION').AsInteger := nCopias;
     ParamByName( 'peB_MAIL'        ).AsString  := pbMail;
     ParamByName( 'peFHMAIL'        ).AsString  := pFhMail;
     ParamByName( 'peTxMAIL'        ).AsString  := pTxMail;
     ParamByName( 'peUSUARIO'        ).AsString  := MiApli.Usuario;
     ParamByName('PEBCOMMIT').AsString := 'V';
     ExecProc;
     If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
       ShowMessage(ParamByName('PSTXRESULTADO').AsString);
     Result := ParamByName('PSRESULTADO').AsInteger;
   Finally
      Stp.Free;
   End;
End;
}

Function TQrAvMail.FormaQuery(sF_Inicio, sF_Fin : String;
                                sEmisor, sProveedor : String;
                                iIdCesionFo, iIdCesionFf : Integer;
                                sAviso, sRelacion : String; iCopias : Integer; sCesiones, sOrden : String ): String;
var
    sSQLCargo,sSQLAbono,sSQLTotal:String;
    sIdCesion:String;
Begin
    if sEmisor <> '' then
      sEmisor := 'AND CE.ID_ACREDITADO = ' + sEmisor;
    if sProveedor <> '' then
      sProveedor := 'AND CPV.ID_ACREDITADO = ' + sProveedor;
    //

    sIdCesion:= 'BETWEEN ' + IntToStr(iIdCesionFo) + ' AND ' + IntToStr(iIdCesionFf);
    sSQLCargo:= '';
    sSQLAbono:= '';
    sSQLTotal:= '';
    sSQLAbono:=   ' SELECT CCE.ID_CESION, '+ coCRLF +
                  '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
                  '        PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
                  '        (RFC.SIGLAS_RFC||''-''||RFC.F_RFC||''-''||RFC.HOMOCLAVE_RFC) RFC_E, '+ coCRLF +
                  '        (RFC_P.SIGLAS_RFC||''-''||RFC_P.F_RFC||''-''||RFC_P.HOMOCLAVE_RFC) RFC_P, '+ coCRLF +
                  '        DME.CALLE_NUMERO DIRECCION_E, '+ coCRLF +
                  '        DME.COLONIA COLONIA_E, '+ coCRLF +
                  '        PBDE.DESC_POBLACION DELEGACION_E, '+ coCRLF +
                  '        DME.CODIGO_POSTAL CODIGO_POSTAL_E, '+ coCRLF +
                  '        PBCE.DESC_POBLACION CIUDAD_E, '+ coCRLF +
                  '        DMP.CALLE_NUMERO DIRECCION_P, '+ coCRLF +
                  '        DMP.COLONIA COLONIA_P, '+ coCRLF +
                  '        PBDP.DESC_POBLACION DELEGACION_P, '+ coCRLF +
                  '        DMP.CODIGO_POSTAL CODIGO_POSTAL_P, '+ coCRLF +
                  '        PBCP.DESC_POBLACION CIUDAD_P, '+ coCRLF +
                  '        CPR.DESC_L_PRODUCTO, '+ coCRLF +
                  '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CTA_EMI,'+ coCRLF +
                  '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CTA_PROV, '+ coCRLF +
                  '        M.DESC_MONEDA, '   + coCRLF +
                  '        SCAP.IMP_CAPITAL, '+ coCRLF +
                  '        0 IMP_INTERES, '   + coCRLF +
                  '        0 IMP_IVA, '       + coCRLF +
                  '        0 IMP_TOTAL_INT, ' + coCRLF +
                  '        ''ABONO'' AVISO, ' + coCRLF +
                  '        CCE.F_ALTA, '      + coCRLF +
                  '        CCE.F_AUTORIZA, '  + coCRLF +
                  '        0 CERO,0 CONCEPTO,0 IVA,0 IMPORTE_TOT, '+ coCRLF +
                  '        CPR.B_APLICA_IVA,  '  + coCRLF +
                  '        PP.CVE_PER_JURIDICA,'  + coCRLF +
                  '        0 PCT_IVA'  + coCRLF +
                  ' FROM CR_CESION     CCE, ' + coCRLF +
                  '      PERSONA_FISICA  PE, '+ coCRLF +
                  '      PERSONA       PCE, ' + coCRLF +
                  '      PERSONA       PP, '  + coCRLF +
                  '      RFC, '      + coCRLF +
                  '      RFC RFC_P, '+ coCRLF +
                  '      CR_CREDITO    CC, '  + coCRLF +
                  '      CONTRATO      CTO, ' + coCRLF +
                  '      DOMICILIO     DME, ' + coCRLF +
                  '      POBLACION     PBDE, '+ coCRLF +
                  '      POBLACION     PBCE, '+ coCRLF +
                  '      DOMICILIO     DMP, ' + coCRLF +
                  '      POBLACION     PBDP, '+ coCRLF +
                  '      POBLACION     PBCP, '+ coCRLF +
                  '      CR_CONTRATO   CCTO, '+ coCRLF +
                  '      CR_PRODUCTO   CPR, ' + coCRLF +
                  '      CR_EMISOR     CE, '  + coCRLF +
                  '      CR_PROVEEDOR  CPV, ' + coCRLF +
                  '      MONEDA        M, '   + coCRLF +
                  '      (SELECT SUM(IMP_CAPITAL) IMP_CAPITAL, ID_CREDITO '+ coCRLF +
                  '        FROM CR_CAPITAL '+ coCRLF +
                  '        WHERE ID_CREDITO  '+ sIdCesion + coCRLF +
                  '          AND SIT_CAPITAL <> ''CA'' '  + coCRLF +
                  '        GROUP BY ID_CREDITO) SCAP '+ coCRLF +
                  ' WHERE CCE.ID_CESION  '+  sIdCesion + coCRLF +
                  '   AND CCE.SIT_CESION <> ''CA''  '  + coCRLF +
                  sEmisor  + coCRLF + sProveedor + coCRLF +
                  '   AND PE.ID_PERSONA(+)     = CCE.ID_EMISOR '+ coCRLF +
                  '   AND PCE.ID_PERSONA       = CCE.ID_EMISOR '+ coCRLF +
                  '   AND PP.ID_PERSONA        = CCE.ID_PROVEEDOR '+ coCRLF +
                  '   AND RFC.ID_PERSONA(+)    = PCE.ID_PERSONA '+ coCRLF +
                  '   AND RFC_P.ID_PERSONA(+)  = PP.ID_PERSONA '+ coCRLF +
                  '   AND CC.ID_CREDITO        = CCE.ID_CESION '      + coCRLF +
                  '   AND CTO.ID_CONTRATO      = CC.ID_CONTRATO '   + coCRLF +
                  '   AND DMP.ID_DOMICILIO     = PP.ID_DOMICILIO ' + coCRLF +
                  '   AND PBDP.CVE_POBLACION   = DMP.CVE_CIUDAD '+ coCRLF +
                  '   AND PBCP.CVE_POBLACION   = DMP.CVE_ESTADO '+ coCRLF +
                  '   AND DME.ID_DOMICILIO     = CTO.ID_DOMICILIO '+ coCRLF +
                  '   AND PBDE.CVE_POBLACION   = DME.CVE_CIUDAD '+ coCRLF +
                  '   AND PBCE.CVE_POBLACION   = DME.CVE_ESTADO '+ coCRLF +
                  '   AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO '  + coCRLF +
                  '   AND CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO '+ coCRLF +
                  '   AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
                  '   AND CE.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '+ coCRLF +
                  '   AND CE.ID_ACREDITADO     = CCE.ID_EMISOR '+ coCRLF +
                  '   AND CE.CVE_EMISOR_EXT    = CCE.CVE_EMISOR_NAFIN '+ coCRLF +
                  '   AND CPV.CVE_FND_ENT_DES  = CCE.CVE_FND_ENT_DES '+ coCRLF +
                  '   AND CPV.ID_ACREDITADO    = CCE.ID_PROVEEDOR '+ coCRLF +
                  '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA '+ coCRLF +
                  '   AND SCAP.ID_CREDITO      = CCE.ID_CESION ';
    If ( Trim(sF_Inicio) <> '' )  OR  ( Trim(sF_Fin)  <> '' ) Then
        sSQLAbono:= sSQLAbono+' AND CCE.F_AUTORIZA >= TO_DATE('''+ sF_Inicio +''',''DD/MM/YYYY'')'+
        '  AND CCE.F_AUTORIZA <= TO_DATE('''+ sF_Fin +''',''DD/MM/YYYY'')' ;

    sSQLCargo:=  ' SELECT '+ coCRLF +
                 '        CCE.ID_CESION, '+ coCRLF +
                 '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
                 '        PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
                 '        (RFC.SIGLAS_RFC||''-''||RFC.F_RFC||''-''||RFC.HOMOCLAVE_RFC) RFC_E, '+ coCRLF +
                 '        (RFC_P.SIGLAS_RFC||''-''||RFC_P.F_RFC||''-''||RFC_P.HOMOCLAVE_RFC) RFC_P, '+ coCRLF +
                 '        DME.CALLE_NUMERO DIRECCION_E, '+ coCRLF +
                 '        DME.COLONIA COLONIA_E, '+ coCRLF +
                 '        PBDE.DESC_POBLACION DELEGACION_E, '+ coCRLF +
                 '        DME.CODIGO_POSTAL CODIGO_POSTAL_E, '+ coCRLF +
                 '        PBCE.DESC_POBLACION CIUDAD_E, '+ coCRLF +
                 '        DMP.CALLE_NUMERO DIRECCION_P, '+ coCRLF +
                 '        DMP.COLONIA COLONIA_P, '+ coCRLF +
                 '        PBDP.DESC_POBLACION DELEGACION_P, '+ coCRLF +
                 '        DMP.CODIGO_POSTAL CODIGO_POSTAL_P, '+ coCRLF +
                 '        PBCP.DESC_POBLACION CIUDAD_P, '+ coCRLF +
                 '        CPR.DESC_L_PRODUCTO, '+ coCRLF +
                 '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CTA_EMI,'+ coCRLF +
                 '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CTA_PROV, '+ coCRLF +
                 '        M.DESC_MONEDA, '+ coCRLF +
                 '        0 IMP_CAPITAL,'+ coCRLF +
                 '        SINT.IMP_INTERES, '+ coCRLF +
                 '        SIIV.IMP_IVA, '+ coCRLF +
                 '        (SINT.IMP_INTERES + SIIV.IMP_IVA) IMP_TOTAL_INT, '+ coCRLF +
                 '        ''CARGO'' AVISO, '+ coCRLF +
                 '        CCE.F_ALTA, '    + coCRLF +
                 '        CCE.F_AUTORIZA, '+ coCRLF +
                 '        0 CERO,0 CONCEPTO,0 IVA,0 IMPORTE_TOT, '+ coCRLF +
                 '        CPR.B_APLICA_IVA,  '  + coCRLF +
                 '        PP.CVE_PER_JURIDICA,'  + coCRLF +
                 '        0 PCT_IVA'  + coCRLF +
                 ' FROM '+ coCRLF +
                 '      CR_CESION     CCE, '  + coCRLF +
                 '      PERSONA_FISICA  PE, ' + coCRLF +
                 '      PERSONA       PCE, '  + coCRLF +
                 '      PERSONA       PP, '   + coCRLF +
                 '      RFC, '                + coCRLF +
                 '      RFC RFC_P, '          + coCRLF +
                 '      CR_CREDITO    CC, '   + coCRLF +
                 '      CONTRATO      CTO, '  + coCRLF +
                 '      DOMICILIO     DME, '  + coCRLF +
                 '      POBLACION     PBDE, ' + coCRLF +
                 '      POBLACION     PBCE, ' + coCRLF +
                 '      DOMICILIO     DMP, '  + coCRLF +
                 '      POBLACION     PBDP, ' + coCRLF +
                 '      POBLACION     PBCP, ' + coCRLF +
                 '      CR_CONTRATO   CCTO, ' + coCRLF +
                 '      CR_PRODUCTO   CPR, '  + coCRLF +
                 '      CR_EMISOR     CE, '   + coCRLF +
                 '      CR_PROVEEDOR  CPV, '  + coCRLF +
                 '      MONEDA        M, '    + coCRLF +
                 '      (SELECT SUM(IMP_INTERES) IMP_INTERES, ID_CREDITO '+ coCRLF +
                 '       FROM CR_INTERES '                        + coCRLF +
                 '       WHERE ID_CREDITO  '+  sIdCesion          + coCRLF +
                 '         AND SIT_INTERES <> ''CA'' '            + coCRLF +
                 '       GROUP BY ID_CREDITO) SINT, '             + coCRLF +
                 '      (SELECT SUM(IMP_IVA) IMP_IVA, ID_CREDITO '+ coCRLF +
                 '       FROM CR_INTERES '                + coCRLF +
                 '       WHERE ID_CREDITO '+  sIdCesion   + coCRLF +
                 '         AND SIT_INTERES <> ''CA'' '             + coCRLF +
                 '       GROUP BY ID_CREDITO) SIIV '      + coCRLF +
                 ' WHERE CCE.ID_CESION '+    sIdCesion        + coCRLF +
                 '   AND CCE.SIT_CESION <> ''CA''  '+  coCRLF +
         sEmisor  + coCRLF + sProveedor + coCRLF +
                 '   AND PE.ID_PERSONA(+)     = CCE.ID_EMISOR '   + coCRLF +
                 '   AND PCE.ID_PERSONA       = CCE.ID_EMISOR '     + coCRLF +
                 '   AND PP.ID_PERSONA        = CCE.ID_PROVEEDOR '   + coCRLF +
                 '   AND RFC.ID_PERSONA(+)    = PCE.ID_PERSONA '  + coCRLF +
                 '   AND RFC_P.ID_PERSONA(+)  = PP.ID_PERSONA '+ coCRLF +
                 '   AND CC.ID_CREDITO        = CCE.ID_CESION '      + coCRLF +
                 '   AND CTO.ID_CONTRATO      = CC.ID_CONTRATO '   + coCRLF +
                 '   AND DME.ID_DOMICILIO     = CTO.ID_DOMICILIO '+ coCRLF +
                 '   AND PBDE.CVE_POBLACION   = DME.CVE_CIUDAD '+ coCRLF +
                 '   AND PBCE.CVE_POBLACION   = DME.CVE_ESTADO '+ coCRLF +
                 '   AND DMP.ID_DOMICILIO     = PP.ID_DOMICILIO ' + coCRLF +
                 '   AND PBDP.CVE_POBLACION   = DMP.CVE_CIUDAD '+ coCRLF +
                 '   AND PBCP.CVE_POBLACION   = DMP.CVE_ESTADO '+ coCRLF +
                 '   AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO '  + coCRLF +
                 '   AND CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO '+ coCRLF +
                 '   AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
                 '   AND CE.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '            + coCRLF +
                 '   AND CE.ID_ACREDITADO     = CCE.ID_EMISOR '            + coCRLF +
                 '   AND CE.CVE_EMISOR_EXT  = CCE.CVE_EMISOR_NAFIN '  + coCRLF +
                 '   AND CPV.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '            + coCRLF +
                 '   AND CPV.ID_ACREDITADO    = CCE.ID_PROVEEDOR '        + coCRLF +
                 '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA '  + coCRLF +
                 '   AND SINT.ID_CREDITO      = CCE.ID_CESION '+ coCRLF +
                 '   AND SIIV.ID_CREDITO      = CCE.ID_CESION ';

    If ( Trim(sF_Inicio)<>'' ) OR ( Trim(sF_Fin)<>'' )Then
        sSQLCargo:= sSQLCargo+' AND CCE.F_AUTORIZA >= TO_DATE('''+ sF_Inicio +''',''DD/MM/YYYY'')'+
                              ' AND CCE.F_AUTORIZA <= TO_DATE('''+ sF_Fin +''',''DD/MM/YYYY'')';

    If (Trim(sCesiones) <> '') Then
      sSQLCargo:= sSQLCargo+' AND CC.ID_CREDITO NOT IN ('+sCesiones+')';

    If  Trim(sAviso)='ABONO' Then Begin
        sSQLTotal:=sSQLAbono;
        IF Trim(sOrden) = 'EM' THEN
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA, ID_CESION'
        ELSE
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA,NOM_PROVEEDOR, ID_CESION';
    end
    Else If Trim(sAviso)='CARGO'Then Begin
        sSQLTotal:=sSQLCargo;
        IF Trim(sOrden) = 'EM' THEN
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA,ID_CESION'
        ELSE
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA,NOM_PROVEEDOR, ID_CESION';
    end
    Else If Trim(sAviso)='' Then Begin
        sSQLTotal:=sSQLAbono + ' UNION ALL ' + sSQLCargo;
        IF Trim(sOrden) = 'EM' THEN
           sSQLTotal:=sSQLTotal + ' ORDER BY AVISO, F_AUTORIZA,ID_CESION'
        ELSE
           sSQLTotal:=sSQLTotal + ' ORDER BY AVISO, F_AUTORIZA,NOM_PROVEEDOR, ID_CESION'
    End;
    Result:= sSQLTotal;
End;
procedure TQrAvMail.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
        If ((Trim(VLRelacion)='EP') AND (qyAvMailAVISO.AsString='CARGO')) Then Begin
            //PROVEEDOR
            QRNombre.Caption := qyAvMailNOM_PROVEEDOR.AsString;
            QRRFC.Caption := qyAvMailRFC_P.AsString;
            QRDireccion.Caption := qyAvMailDIRECCION_P.AsString;
            QRColonia.Caption := qyAvMailCOLONIA_P.AsString;
            QRDelegacion.Caption := qyAvMailDELEGACION_P.AsString;
            QRCP.Caption := qyAvMailCODIGO_POSTAL_P.AsString;
            QRCuenta.Caption := qyAvMailCTA_PROV.AsString;
            QRCiudad.Caption := qyAvMailCIUDAD_P.AsString;
            QRConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvMailIMP_INTERES.asFloat);
            QRIvaConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvMailIMP_IVA.asFloat);
            QRImpTotal.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvMailIMP_TOTAL_INT.asFloat);
        End Else Begin
            //EMISOR
            QRNombre.Caption := qyAvMailNOM_EMISOR.AsString;
            QRRFC.Caption := qyAvMailRFC_E.AsString;
            QRDireccion.Caption := qyAvMailDIRECCION_E.AsString;
            QRColonia.Caption := qyAvMailCOLONIA_E.AsString;;
            QRDelegacion.Caption := qyAvMailDELEGACION_E.AsString;
            QRCP.Caption := qyAvMailCODIGO_POSTAL_E.AsString;
            QRCuenta.Caption := qyAvMailCTA_EMI.AsString;
            QRCiudad.Caption := qyAvMailCIUDAD_E.AsString;
            QRConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvMailIMP_CAPITAL.asFloat);
            QRIvaConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvMailCERO.asFloat);
            QRImpTotal.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvMailIMP_CAPITAL.asFloat);
        End;


        // DETERMINA LA ETIQUETA DE ACUERDO AL TIPO DE AVISO
        If  Trim(qyAvMailAVISO.AsString)='ABONO' Then
        Begin
            QRLConcepto.Caption := 'CAPITAL';
            QRLConceptoIVA.Caption := '';
            QRIvaConcepto.Caption := '';
            QRLTotal.Caption := 'CAPITAL';
            QRImageABONO.Enabled := True;
            QRImageCARGO.Enabled := False;
        end
        else
        Begin
            QRLConcepto.Caption := 'INTERESES COBRADOS POR ANTICIPADO';
            QRLConceptoIVA.Caption := 'IVA ';
            QRIvaConcepto.Enabled := True;
            IF Trim(qyAvMailB_APLICA_IVA.AsString)= 'F' THEN BEGIN
              IF Trim(qyAvMailCVE_PER_JURIDICA.AsString)= 'PM' THEN BEGIN
                 QRLConceptoIVA.Caption := QRLConceptoIVA.Caption + ' EXENTO'
              END;
            END;
            QRLTotal.Caption := 'IMPORTE';
            QRImageABONO.Enabled := False;
            QRImageCARGO.Enabled := True;
        end;
end;

procedure TQrAvMail.qrlFechaPrint(sender: TObject; var Value: String);
begin
  Value:= FormatDateTime('"México D.F. a " dd " de " mmmm " del " yyyy',
                         qyAvMail.FieldByName('F_AUTORIZA').AsDateTime );
end;

procedure TQrAvMail.QuickRepAfterPrint(Sender: TObject);
Var vlMsg, vlTxMail, vlBMail : String;
begin
  If qyAvMail.Active Then
   Begin
   qyAvMail.First;
   While Not qyAvMail.Eof Do
    Begin

    IF vgDirMail = '' then Begin
       vlTxMail :='NO SE ENVIO ARCHIVO. PROVEEDOR NO TIENE CORREO ASIGNADO';
       vlBMail := 'F'
    end
    else bEGIN
       vlTxMail :='Envio Notificación por correo a ' + vgDirMail;
       vlBMail := 'V'
    END;
    StpInsertUpdAv(qyAvMail.FieldByName('AVISO').AsString,
                   qyAvMail.FieldByName('ID_CESION').AsString,
                   '0',vlBMail,vlTxMail,
                   DateTimeToStr(Now), vgFAviso, 1,
                   vgApli, vlMsg);

    qyAvMail.Next;
    Application.ProcessMessages;
    End;
   End;
end;

procedure TQrAvMail.QRLFechaSelloPrint(sender: TObject;
  var Value: String);
begin
  Value:= FormatDateTime('dd" "mmm" "yyyy',
                         qyAvMail.FieldByName('F_AUTORIZA').AsDateTime );
end;

End.
