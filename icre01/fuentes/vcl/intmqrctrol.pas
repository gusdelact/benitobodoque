unit IntMQrCtrol;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrCtrol = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel25: TQRLabel;
    QRShape10: TQRShape;
    QRLabel27: TQRLabel;
    QRShape13: TQRShape;
    QRLabel30: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrGpoAcred: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    qrGpoMoneda: TQRGroup;
    QRDBText13: TQRDBText;
    QRDBText12: TQRDBText;
    qrGpoClasif: TQRGroup;
    qrGpoCveGarant: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    stp: TStoredProc;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape19: TQRShape;
    QRLabel10: TQRLabel;
    stpCLASIF: TStringField;
    stpCLASIFICACION: TStringField;
    stpID_ACREDITADO: TFloatField;
    stpNOMBRE: TStringField;
    stpCVE_MONEDA: TFloatField;
    stpDESC_MONEDA: TStringField;
    stpCVE_TIPO_GAR: TStringField;
    stpDESC_TIPO_GAR: TStringField;
    stpCVE_GARANTIA: TStringField;
    stpDESC_GARANTIA: TStringField;
    stpID_SOLICITUD: TFloatField;
    stpSIT_REG_GARANTIA: TStringField;
    stpPORCENTAJE_PONDERADO: TFloatField;
    stpID_SECUENCIA: TFloatField;
    stpVALOR_PONDERADO: TFloatField;
    stpB_APLICA_GAR_FID: TStringField;
    stpID_FIDEICOMISO: TFloatField;
    stpNOMBRE_FIDUCIARIO: TStringField;
    stpF_REVISION_GAR: TDateTimeField;
    stpSIT_INSC_RPP: TStringField;
    stpINSCRIPCION_RPP: TStringField;
    stpFECHA_INSC_RPP: TDateTimeField;
    stpSIT_INSC_RPC: TStringField;
    stpINSCRIPCION_RPC: TStringField;
    stpFECHA_INSC_RPC: TDateTimeField;
    stpID_DISPOSICION: TFloatField;
    stpB_INTEG_MASA_GAR: TStringField;
    stpCVE_TIPO_SEGURO: TStringField;
    stpVALOR_GARANTIA: TFloatField;
    stpTX_COMENTARIO: TStringField;
    stpID_SOL_MUEB: TFloatField;
    stpNOM_VAL_MUEB: TStringField;
    stpF_VALUACION_MUEB: TDateTimeField;
    stpMARCA: TStringField;
    stpMODELO: TStringField;
    stpID_FACTURA: TStringField;
    stpSERIE_MUEB: TStringField;
    stpNOM_NOT_PUB_MUEB: TStringField;
    stpID_SOL_NAVE: TFloatField;
    stpIMP_GARANTIA: TFloatField;
    stpB_INMUEBLE: TStringField;
    stpID_SOL_INMUEB: TFloatField;
    stpNOMBRE_VALUADOR: TStringField;
    stpF_VALUACION_INMUEB: TDateTimeField;
    stpNOM_NOT_PUB_INMUEB: TStringField;
    stpID_DOMICILIO: TFloatField;
    stpCALLE_NUMERO: TStringField;
    stpID_SOL_PREND: TFloatField;
    stpID_CONTRATO: TFloatField;
    stpNOMBRE_OTORGANTE: TStringField;
    stpIMP_DEPOSITO: TFloatField;
    stpNUM_ACC_TIT: TFloatField;
    stpEMISORA: TStringField;
    stpSERIE_PREND: TStringField;
    stpTIPO_VALOR: TStringField;
    stpIMP_VALUACION: TFloatField;
    stpID_SOL_PERS: TFloatField;
    stpID_AVAL: TFloatField;
    stpNOM_AVAL: TStringField;
    stpPCT_GARANTIZA: TFloatField;
    stpB_AVAL_CR: TStringField;
    stpID_AVAL_CR: TFloatField;
    stpNOM_AVAL_CR: TStringField;
    stpID_SOL_CESION: TFloatField;
    stpTX_TIPO_CESION: TStringField;
    stpNOMBRE_CEDENTE: TStringField;
    stpDESC_DEPENDENCIA: TStringField;
    stpPCT_CESION: TFloatField;
    stpUNIDAD_TIEMPO_CE: TStringField;
    stpNUM_UNIDADES_CE: TFloatField;
    stpDIA_COBRO_CE: TFloatField;
    stpF_VIGENCIA_INI: TDateTimeField;
    stpF_VIGENCIA_FIN: TDateTimeField;
    stpIMP_EJECUTAR: TFloatField;
    stpIMP_EJECUTADA: TFloatField;
    stpID_SOL_PAR: TFloatField;
    stpCVE_TIPO_RAMO: TStringField;
    stpDESC_TIPO_RAMO: TStringField;
    stpNOM_CEDENTE: TStringField;
    stpB_FIDE_MAESTRO: TStringField;
    stpCUENTA_BANCO: TStringField;
    stpID_CTO_PAR: TFloatField;
    stpID_SOL_DOC: TFloatField;
    stpIMP_DOC_COB: TFloatField;
    stpID_SOL_SIN_CLAS: TFloatField;
    stpIMP_SIN_CLAS: TFloatField;
    stpGRUPO: TStringField;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    stpPORCION: TStringField;
    qrGpoFooAcred: TQRBand;
    stpPCT_GTIA_FEGA_EF: TFloatField;
    stpPCT_GTIA_FEGA_NO: TFloatField;
    stpCVE_NOT_PUB_MUEB: TFloatField;
    stpCVE_NOT_PUB_INMUEB: TFloatField;
    stpIMPORTE_PREND: TFloatField;
    GpoDisp: TQRGroup;
    GpoDetalle: TQRGroup;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRLabel94: TQRLabel;
    QRDBText107: TQRDBText;
    GpoNave: TQRGroup;
    QRDBText108: TQRDBText;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRDBText109: TQRDBText;
    QRLabel98: TQRLabel;
    QRDBText110: TQRDBText;
    QRLabel99: TQRLabel;
    QRDBText111: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText112: TQRDBText;
    QRLabel101: TQRLabel;
    QRDBText113: TQRDBText;
    QRLabel102: TQRLabel;
    QRDBText114: TQRDBText;
    GpoInmuebles: TQRGroup;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    GpoMuebles: TQRGroup;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel93: TQRLabel;
    QRDBText88: TQRDBText;
    QRLabel103: TQRLabel;
    QRDBText115: TQRDBText;
    QRLabel104: TQRLabel;
    QRDBText116: TQRDBText;
    GpoPrendarias: TQRGroup;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText44: TQRDBText;
    GpoPersonales: TQRGroup;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText53: TQRDBText;
    GpoCesion: TQRGroup;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel105: TQRLabel;
    QRDBText117: TQRDBText;
    QRLabel106: TQRLabel;
    QRDBText118: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText119: TQRDBText;
    GpoPartApor: TQRGroup;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText63: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText69: TQRDBText;
    GpoDocCob: TQRGroup;
    QRDBText70: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    GpoSinClas: TQRGroup;
    QRDBText71: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    SummaryBand1: TQRBand;
    procedure stpCalcFields(DataSet: TDataSet);
    procedure GpoDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoNaveBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoInmueblesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoMueblesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoPrendariasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoPersonalesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoPartAporBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoDocCobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GpoSinClasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
  end;

var
  QrCtrol: TQrCtrol;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepCtrolGarantias(  sAcreditado, sMoneda, sClasif, sCveGar,
                              sFIni  , sFFin  , sSituacion, sNbrArch,
                              sEmpresa, sSucursal :String;
                              pAPli     : TInterApli;
                              pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepCtrolGarantias(sAcreditado, sMoneda, sClasif, sCveGar,
                            sFIni  , sFFin  , sSituacion, sNbrArch,
                            sEmpresa, sSucursal :String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrCtrol  : TQrCtrol;
   VLTitulo : String;
   Preview  : TIntQRPreview;
Begin
   VLTitulo := '';
   QrCtrol:=TQrCtrol.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCtrol);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrCtrol.QRInterEncabezado1.Apli:=pAPli;
      QrCtrol.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCtrol.QRInterEncabezado1.NomReporte:='IntMQrCtrol';
      QrCtrol.QRInterEncabezado1.Titulo1:='Reporte de Control de Garantías';

      QrCtrol.stp.DatabaseName := pApli.DataBaseName;
      QrCtrol.stp.SessionName := pApli.SessionName;
      QrCtrol.stp.Active:=False;
      QrCtrol.stp.Params.Clear;
      QrCtrol.stp.StoredProcName:='PKGCRDOCUMENTACION.STP_REP_CTROL_GAR';
      QrCtrol.stp.Params.CreateParam(ftFloat,'PE_ACREDITADO',ptInput);
      QrCtrol.stp.Params.CreateParam(ftFloat,'PE_MONEDA',ptInput);
      QrCtrol.stp.Params.CreateParam(ftString,'PE_CLASIFICACION',ptInput);
      QrCtrol.stp.Params.CreateParam(ftString,'PE_CVE_GARANTIA',ptInput);
      QrCtrol.stp.Params.CreateParam(ftDate,'PE_F_INICIO',ptInput);
      QrCtrol.stp.Params.CreateParam(ftDate,'PE_F_FIN',ptInput);
      QrCtrol.stp.Params.CreateParam(ftString,'PE_SITUACION',ptInput);
      QrCtrol.stp.Params.CreateParam(ftString,'PE_EMPRESA',ptInput);
      QrCtrol.stp.Params.CreateParam(ftCursor,'PCURSOR',ptInputOutput);

      QrCtrol.stp.ParamByName('PE_ACREDITADO').AsString := sAcreditado;
      QrCtrol.stp.ParamByName('PE_MONEDA').AsString := sMoneda;
      QrCtrol.stp.ParamByName('PE_CLASIFICACION').AsString := sClasif;
      QrCtrol.stp.ParamByName('PE_CVE_GARANTIA').AsString := sCveGar;
      QrCtrol.stp.ParamByName('PE_F_INICIO').AsString := sFIni;
      QrCtrol.stp.ParamByName('PE_F_FIN').AsString := sFFin;
      QrCtrol.stp.ParamByName('PE_SITUACION').AsString := sSituacion;
      QrCtrol.stp.ParamByName('PE_EMPRESA').AsString := sEmpresa;
      QrCtrol.stp.Open;

      If (Trim(sAcreditado)<>'') Then
          VLTitulo := VLTitulo + ' Por Acreditado';
      If (Trim(sMoneda)<>'') Then
          VLTitulo := VLTitulo + ' Por Moneda';
      If (Trim(sClasif)<>'') Then
          VLTitulo := VLTitulo + ' Por Clasificación';
      If (Trim(sCveGar)<>'') Then
          VLTitulo := VLTitulo + ' Por Garantía';
      If (Trim(sFIni)<>'')and(Trim(sFFin)<>'') Then
          VLTitulo := VLTitulo + ' del '+Trim(sFIni)+ ' al '+Trim(sFFin);
      If (Trim(sSituacion)<>'') Then
          VLTitulo := VLTitulo + ' Por Situación';

      QrCtrol.QRInterEncabezado1.Titulo2 := VLTitulo;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrCtrol.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrCtrol.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,
             'Acreditado'+ #09 +
             'Nombre Acreditado'+ #09 +
             'Moneda'+ #09 +
             'Descripción Moneda'+ #09 +
             'Clave de Clasificación'+ #09 +
             'Clasificación'+ #09 +
             'Clave Tipo Garantía'+ #09 +
             'Tipo Garantía'+ #09 +
             'Número' +  #09+
             'Situación' +  #09 +
             'Porcentaje Ponderado'+  #09 +
             'Grado de Prelación' +  #09 +
             'Valor Ponderado' +  #09 +
             'Requiere Fideicomiso' +#09 +
             'Número de Fideicomiso'+ #09+
             'Número de Disposición'+ #09 +
             'Fiduciario'+#09 +
             'F.Última revisión'+ #09 +
             'Sit. Ins. R.P.P.'+ #09 +
             'Folio Real R.P.P.'+ #09 +
             'F.Ins. R.P.P.'+ #09 +
             'Sit.Ins. R.P.C.'+ #09 +
             'Folio Real  R.P.C'+ #09 +
             'F.Ins. R.P.C.'+ #09 +
             'Integra masa Gtías'+ #09 +
             'Tipo de Seguro'+ #09 +
             'Datos / Comentarios Gtías');
         Writeln(F, '');
      End;
      If pPreview Then
          QrCtrol.Preview
      Else
          QrCtrol.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCtrol.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

procedure TQrCtrol.stpCalcFields(DataSet: TDataSet);
Var
   dPorcion: Double;
begin
   If stpVALOR_GARANTIA.AsFloat <> 0 Then
      dPorcion:= (stpVALOR_PONDERADO.AsFloat * 100)/ stpVALOR_GARANTIA.AsFloat
   Else
      dPorcion:= 0;
   stpPORCION.AsString:= FormatFloat('###,###,##0.00',dPorcion);

   GpoNave.Enabled:= False;
   GpoNave.Expression:='';
   GpoInmuebles.Enabled:= False;
   GpoInmuebles.Expression:='';
   GpoMuebles.Enabled:= False;
   GpoMuebles.Expression:='';
   GpoPrendarias.Enabled:= False;
   GpoPrendarias.Expression:='';
   GpoPersonales.Enabled:= False;
   GpoPersonales.Expression:='';
   GpoCesion.Enabled:= False;
   GpoCesion.Expression:='';
   GpoPartApor.Enabled:= False;
   GpoPartApor.Expression:='';
   GpoDocCob.Enabled:= False;
   GpoDocCob.Expression:='';
   GpoSinClas.Enabled:= False;
   GpoSinClas.Expression:='';

   If Trim(stpCLASIF.AsString) = 'NVI' Then Begin
      GpoNave.Enabled:=True;
      GpoNave.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'INM' Then Begin
      GpoInmuebles.Enabled:=True;
      GpoInmuebles.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'MUE' Then Begin
      GpoMuebles.Enabled:=True;
      GpoMuebles.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'PRE' Then Begin
      GpoPrendarias.Enabled:=True;
      GpoPrendarias.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'PER' Then Begin
      GpoPersonales.Enabled:=True;
      GpoPersonales.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'CES' Then Begin
      GpoCesion.Enabled:=True;
      GpoCesion.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'PAR' Then Begin
      GpoPartApor.Enabled:=True;
      GpoPartApor.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'DOC' Then Begin
      GpoDocCob.Enabled:=True;
      GpoDocCob.Expression:='stp.CLASIF';
   End Else If Trim(stpCLASIF.AsString) = 'SCL' Then Begin
      GpoSinClas.Enabled:= True;
      GpoSinClas.Expression:='stp.CLASIF';
   End;
end;

procedure TQrCtrol.GpoDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   sComent, sFRevGar, sFInsRPP, sFInsRPC: String;
   options       : TReplaceFlags;
begin

   If sArchivo <>'' Then Begin
      options := [rfReplaceAll];
      sComent:= StringReplace(stp.FieldByName('TX_COMENTARIO').AsString,
                    #13, #32, options);

      If stp.FieldByName('F_REVISION_GAR').AsDateTime > 0 Then
         sFRevGar:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_REVISION_GAR').AsDateTime);
      If stp.FieldByName('FECHA_INSC_RPP').AsDateTime > 0 Then
         sFInsRPP:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('FECHA_INSC_RPP').AsDateTime);
      If stp.FieldByName('FECHA_INSC_RPC').AsDateTime > 0 Then
         sFInsRPC:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('FECHA_INSC_RPC').AsDateTime);

      Writeln(F,
                 stp.FieldByName('ID_ACREDITADO').AsString + #09 +
                 stp.FieldByName('NOMBRE').AsString + #09 +
                 stp.FieldByName('CVE_MONEDA').AsString + #09 +
                 stp.FieldByName('DESC_MONEDA').AsString + #09 +
                 stp.FieldByName('CVE_TIPO_GAR').AsString + #09 +
                 stp.FieldByName('DESC_TIPO_GAR').AsString + #09 +
                 stp.FieldByName('CVE_GARANTIA').AsString + #09 +
                 stp.FieldByName('DESC_GARANTIA').AsString + #09 +

                 stp.FieldByName('ID_SOLICITUD').AsString + #09 +
                 stp.FieldByName('SIT_REG_GARANTIA').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('PORCION').AsFloat) + #09 +
                 stp.FieldByName('ID_SECUENCIA').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_PONDERADO').AsFloat) + #09 +
                 stp.FieldByName('B_APLICA_GAR_FID').AsString + #09 +
                 stp.FieldByName('ID_FIDEICOMISO').AsString + #09 +
                 stp.FieldByName('ID_DISPOSICION').AsString + #09 +
                 stp.FieldByName('NOMBRE_FIDUCIARIO').AsString + #09 +
                 sFRevGar + #09 +
                 stp.FieldByName('SIT_INSC_RPP').AsString + #09 +
                 stp.FieldByName('INSCRIPCION_RPP').AsString + #09 +
                 sFInsRPP + #09 +
                 stp.FieldByName('SIT_INSC_RPC').AsString + #09 +
                 stp.FieldByName('INSCRIPCION_RPC').AsString + #09 +
                 sFInsRPC + #09 +
                 stp.FieldByName('B_INTEG_MASA_GAR').AsString + #09 +
                 stp.FieldByName('CVE_TIPO_SEGURO').AsString + #09 +
                 sComent);
   End;
end;

procedure TQrCtrol.GpoNaveBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFValInm : String;
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Nave / Unidad Industrial'+ #09 +
                 'Valor de Garantía' + #09 +
                 'Inmueble' + #09 +
                 'Nombre de Valuador' + #09 +
                 'Fecha de Valuación' + #09 +
                 'Domicilio' + #09 +
                 'Código Notario / Corredor' + #09 +
                 'Nombre del Notario / Corredor');

      If stp.FieldByName('F_VALUACION_INMUEB').AsDateTime > 0 Then
         sFValInm:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_VALUACION_INMUEB').AsDateTime);

      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 stp.FieldByName('B_INMUEBLE').AsString + #09 +
                 stp.FieldByName('NOMBRE_VALUADOR').AsString + #09 +
                 sFValInm + #09 +
                 stp.FieldByName('CALLE_NUMERO').AsString + #09 +
                 stp.FieldByName('CVE_NOT_PUB_INMUEB').AsString + #09 +
                 stp.FieldByName('NOM_NOT_PUB_INMUEB').AsString);
   End;
end;

procedure TQrCtrol.GpoInmueblesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFValInm : String;
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Bienes Inmuebles' + #09 +
                 'Valor de Garantía' + #09 +
                 'Nombre de Valuador' + #09 +
                 'Fecha de Valuación' + #09 +
                 'Domicilio' + #09 +
                 'Código Notario / Corredor' + #09 +
                 'Nombre del Notario / Corredor');

      If stp.FieldByName('F_VALUACION_INMUEB').AsDateTime > 0 Then
         sFValInm:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_VALUACION_INMUEB').AsDateTime);

      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 stp.FieldByName('NOMBRE_VALUADOR').AsString + #09 +
                 sFValInm + #09 +
                 stp.FieldByName('CALLE_NUMERO').AsString + #09 +
                 stp.FieldByName('CVE_NOT_PUB_INMUEB').AsString + #09 +
                 stp.FieldByName('NOM_NOT_PUB_INMUEB').AsString);
   End;
end;

procedure TQrCtrol.GpoMueblesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFValMueb : String;
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Bienes Muebles' + #09 +
                 'Valor de Garantía' + #09 +
                 'Nombre de Valuador' + #09 +
                 'Fecha de Valuación' + #09 +
                 'Marca' + #09 +
                 'Modelo' + #09 +
                 'Factura' + #09 +
                 'Serie' + #09 +
                 'Código Notario / Corredor' + #09 +
                 'Nombre del Notario / Corredor');

      If stp.FieldByName('F_VALUACION_MUEB').AsDateTime > 0 Then
         sFValMueb:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_VALUACION_MUEB').AsDateTime);

      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 stp.FieldByName('NOM_VAL_MUEB').AsString + #09 +
                 sFValMueb + #09 +
                 stp.FieldByName('MARCA').AsString + #09 +
                 stp.FieldByName('MODELO').AsString + #09 +
                 stp.FieldByName('ID_FACTURA').AsString + #09 +
                 stp.FieldByName('SERIE_MUEB').AsString + #09 +
                 stp.FieldByName('CVE_NOT_PUB_MUEB').AsString + #09 +
                 stp.FieldByName('NOM_NOT_PUB_MUEB').AsString );
   End;
end;

procedure TQrCtrol.GpoPrendariasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Prendarias'+ #09 +
                 'Valor de Garantía' + #09 +
                 'Contrato' + #09 +
                 'Otorgante' + #09 +
                 'Valor del depósito' + #09 +
                 'Número de Acciones/Títulos' + #09 +
                 'Valuación' + #09 +
                 'Emisora' + #09 +
                 'Serie' + #09 +
                 'Tipo Valor');

      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 stp.FieldByName('ID_CONTRATO').AsString + #09 +
                 stp.FieldByName('NOMBRE_OTORGANTE').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMP_DEPOSITO').AsFloat) + #09 +
                 stp.FieldByName('NUM_ACC_TIT').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMPORTE_PREND').AsFloat) + #09 +
                 stp.FieldByName('EMISORA').AsString + #09 +
                 stp.FieldByName('SERIE_PREND').AsString + #09 +
                 stp.FieldByName('TIPO_VALOR').AsString );
   End;
end;

procedure TQrCtrol.GpoPersonalesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Personales'+ #09 +
                 'Valor de Garantía' + #09 +
                 'Identificador Aval' + #09 +
                 'Aval' + #09 +
                 'Avales Cruzados' + #09 +
                 'Identificador Aval Cruzado' + #09 +
                 'Aval Cruzado' + #09 +
                 '% Garantiza' + #09 +
                 '% Gtía Efectiva' + #09 +
                 '% Gtía Nominal');

      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 stp.FieldByName('ID_AVAL').AsString + #09 +
                 stp.FieldByName('NOM_AVAL').AsString + #09 +
                 stp.FieldByName('B_AVAL_CR').AsString + #09 +
                 stp.FieldByName('ID_AVAL_CR').AsString + #09 +
                 stp.FieldByName('NOM_AVAL_CR').AsString + #09 +
                 FormatFloat('###,###,##0.0000',stp.FieldByName('PCT_GARANTIZA').AsFloat) + #09 +
                 FormatFloat('###,###,##0.0000',stp.FieldByName('PCT_GTIA_FEGA_EF').AsFloat) + #09 +
                 FormatFloat('###,###,##0.0000',stp.FieldByName('PCT_GTIA_FEGA_NO').AsFloat));
   End;
end;

procedure TQrCtrol.GpoCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFVigIni, sFVigFin : String;
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Cesión'+ #09 +
                 'F. Ini Vigencia' + #09 +
                 'Cedente' + #09 +
                 'Tipo de Cesión' + #09 +
                 'Dependencia' + #09 +
                 'F.Fin Vigencia' + #09 +
                 'Unidad de tiempo' + #09 +
                 'No.Udes. Tiempo' + #09 +
                 'Día de cobro' + #09 +
                 'Valor por Ejecutar' + #09 +
                 'Valor Ejecutada' + #09 +
                 'Valor Obra' + #09 +
                 '% de Cesión');

      If stp.FieldByName('F_VIGENCIA_INI').AsDateTime > 0 Then
         sFVigIni:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_VIGENCIA_INI').AsDateTime);

      If stp.FieldByName('F_VIGENCIA_FIN').AsDateTime > 0 Then
         sFVigFin:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_VIGENCIA_FIN').AsDateTime);

      Writeln(F, #09#09 + sFVigIni + #09 +
                 stp.FieldByName('NOMBRE_CEDENTE').AsString + #09 +
                 stp.FieldByName('TX_TIPO_CESION').AsString + #09 +
                 stp.FieldByName('DESC_DEPENDENCIA').AsString + #09 +
                 sFVigFin + #09 +
                 stp.FieldByName('UNIDAD_TIEMPO_CE').AsString + #09 +
                 stp.FieldByName('NUM_UNIDADES_CE').AsString + #09 +
                 stp.FieldByName('DIA_COBRO_CE').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMP_EJECUTAR').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMP_EJECUTADA').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 FormatFloat('###,###,##0.0000',stp.FieldByName('PCT_CESION').AsFloat));
   End;
end;

procedure TQrCtrol.GpoPartAporBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'PARTICIPACIONES / APORTACIONES FEDERALES'+ #09 +
                 'Ramo' + #09 +
                 'Descripción Ramo' + #09 +
                 'Cedente' + #09 +
                 'Fideicomiso Maestro' + #09 +
                 'Número de Cuenta' + #09 +
                 'Número de Contrato' + #09 +
                 'Valor');

      Writeln(F, #09#09 +stp.FieldByName('CVE_TIPO_RAMO').AsString + #09 +
                 stp.FieldByName('DESC_TIPO_RAMO').AsString + #09 +
                 stp.FieldByName('NOM_CEDENTE').AsString + #09 +
                 stp.FieldByName('B_FIDE_MAESTRO').AsString + #09 +
                 stp.FieldByName('CUENTA_BANCO').AsString + #09 +
                 stp.FieldByName('ID_CTO_PAR').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat));
   End;
end;

procedure TQrCtrol.GpoDocCobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Documentos por Cobrar'+ #09 +
                      'Valor de Garantía');
      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat));
   End;
end;

procedure TQrCtrol.GpoSinClasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Sin Clasificación'+ #09 +
                      'Valor de Garantía');
      Writeln(F, #09#09 +FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_GARANTIA').AsFloat));
   End;
end;

procedure TQrCtrol.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If stp.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
