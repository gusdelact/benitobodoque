unit IntMQrCaMor;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre;

type
  TQrCaMor = class(TQuickRep)
    qyCoCaMor: TQuery;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape14: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRLabelID_CREDITO: TQRLabel;
    QRShape31: TQRShape;
    QRBandDetalle: TQRBand;
    QRDBFHOPER: TQRDBText;
    QRDBCOMIS: TQRDBText;
    QRDBText3: TQRDBText;
    QRBNombre: TQRBand;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr66: TQRExpr;
    QRExpr67: TQRExpr;
    QRExpr68: TQRExpr;
    QRExpr69: TQRExpr;
    QRExpr70: TQRExpr;
    QRExpr71: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBDESCCOM: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape5: TQRShape;
    QRDBDESC_MONEDA: TQRDBText;
    qyCoCaMorF_OPERACION: TStringField;
    qyCoCaMorCVE_COMISION: TStringField;
    qyCoCaMorDESC_COMISION: TStringField;
    qyCoCaMorCVE_CONCEPTO: TStringField;
    qyCoCaMorID_CONTRATO: TFloatField;
    qyCoCaMorID_CREDITO: TFloatField;
    qyCoCaMorID_PERSONA: TFloatField;
    qyCoCaMorNOMBRE: TStringField;
    qyCoCaMorIMP_CONCEPTO: TFloatField;
    qyCoCaMorCVE_PRODUCTO_CRE: TStringField;
    qyCoCaMorCVE_TIPO_SECTOR: TStringField;
    qyCoCaMorCVE_OPERACION: TStringField;
    qyCoCaMorTX_NOTA: TStringField;
    qyCoCaMorCVE_TIPO_MOVTO: TStringField;
    qyCoCaMorCVE_USU_CANC: TStringField;
    qyCoCaMorFH_CANCELA: TDateTimeField;
    qyCoCaMorSIT_TRANSACCION: TStringField;
    qyCoCaMorID_TRANS_CANCELA: TFloatField;
    qyCoCaMorCVE_MONEDA: TFloatField;
    qyCoCaMorDESC_MONEDA: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText4: TQRDBText;
    QRFooterMoneda: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr6: TQRExpr;
    procedure QRBandDetalleBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
    procedure QRFooterDiaBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);

  private

     //para el footer de Moneda
    VL_M_Capital    : Double;
    VL_M_FINAN_ADIC : Double;
    VL_M_INTERES    : Double;
    VL_M_Importe    : Double;
    stotal          : String;


  public
    function FormaQuery(sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                        sCVE_PRODUCTO_CRE, sID_CONTRATO,
                        sIdEmpresa, SIDSucursal :String):String;


  end;

var
  QrCaMor: TQrCaMor;
  bGenArch: Boolean;
  sArchivo:String;
  Tiporep : String;
  titrep : String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;


  procedure RepCocamor( sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                        sCVE_PRODUCTO_CRE, sID_CONTRATO, sIdEmpresa, sIDSucursal,
                        SNbrArch : String;
                        tiprep   : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);


implementation

{$R *.DFM}

procedure RepCocamor(  sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                       sCVE_PRODUCTO_CRE, sID_CONTRATO, sIdEmpresa, sIDSucursal,
                       SNbrArch : String;
                       tiprep   : String;
                       pPreview : Boolean;
                       pApli    : TInterApli);

var
    QrCaMor   : TQrCaMor;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    QrCaMor:= TQrCaMor.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrCaMor);
    Apli := pApli;
      Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;
        Tiporep     :=  tiprep;

        if Tiporep = 'CMS' then
           Titrep := 'Comisiones';

        if Tiporep = 'CAS' then
           Titrep := 'Castigos';

        if Tiporep = 'MOR' then
           Titrep := 'Moras';

        QrCaMor.QRInterEncabezado1.Apli := pApli;

        QrCaMor.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrCaMor.QRInterEncabezado1.NomReporte:='IntMQrCaMor';
        QrCaMor.QRInterEncabezado1.Titulo1:= 'Reporte de ' + Titrep + ' del ' + sF_CORTEIni + ' al ' + sF_CORTEFin ;


        If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto de Crédito';

        If (Trim(sACREDITADO)<>'') Then
            VLTitulo := VLTitulo + ' Por Acreditado';

        If (Trim(sID_CESION)<>'') Then
            VLTitulo := VLTitulo + ' Por Cesión';

        If (Trim(sID_CONTRATO)<>'') Then
            VLTitulo := VLTitulo + ' Por Autorización';

        QrCaMor.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrCaMor.qyCoCaMor.DatabaseName := pApli.DataBaseName;
        QrCaMor.qyCoCaMor.SessionName  := pApli.SessionName;

        QrCaMor.qyCoCaMor.Active:=False;

        QrCaMor.qyCoCaMor.SQL.Text:= QrCaMor.FormaQuery( sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                                                         sCVE_PRODUCTO_CRE, sID_CONTRATO, sIdEmpresa, sIDSucursal);

        QrCaMor.qyCoCaMor.SQL.SaveToFile('c:\RepCoCaMor.txt');
        QrCaMor.qyCoCaMor.Active:=True;


        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrCaMor.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrCaMor.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
                   'F. OPERACION' + #09 +
                   'COMISION' + #09 +
                   'DESCRIPCION' + #09 +
                   'CONCEPTO' + #09 +
                   'CONTRATO' + #09 +
                   'CREDITO' + #09 +
                   'PERSONA' + #09 +
                   'CLIENTE' + #09 +
                   'IMPORTE' + #09 +
                   'PRODUCTO' + #09 +
                   'SECTOR' + #09 +
                   'OPERACION' + #09 +
                   'TX_NOTA' + #09 +
                   'CVE_TIPO_MOVTO' + #09 +
                   'CVE_USU_CANC' + #09 +
                   'FH_CANCELA' + #09 +
                   'SITUACION' + #09 +
                   'ID_TRANS_CANCELA' + #09 +
                   'MONEDA' + #09 +
                   'DESC. MONEDA');


      End;
        If pPreview Then
            QrCaMor.Preview
        Else
            QrCaMor.Print;
     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCaMor.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

function TQrCaMor.FormaQuery(sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                             sCVE_PRODUCTO_CRE, sID_CONTRATO, sIdEmpresa, SIDSucursal:String):String;
Var
    sSQL : String;

begin

      sSQL:= '  SELECT TO_CHAR(F_OPERACION,''DD/MM/YYYY'') F_OPERACION, ' + coCRLF +
             '         CT.CVE_COMISION, CCCO.DESC_COMISION, CDT.CVE_CONCEPTO, ' + coCRLF +
             '         CT.ID_CONTRATO,CT.ID_CREDITO, ' + coCRLF +
             '         PP.ID_PERSONA, PP.NOMBRE, ' + coCRLF +
             '         CDT.IMP_CONCEPTO,  CCTO.CVE_PRODUCTO_CRE,  PP.CVE_TIPO_SECTOR, ct.CVE_OPERACION, ' + coCRLF +
             '         DECODE(CT.CVE_OPERACION,''CASTIN'',''CASTIN'',''CASTCP'',''CASTCP'',''CASTFN'',''CASTFN'',''RCASIN'',''RCASIN'',''CASTCN'',''CASTCN'',''CODNFN'',''CODNFN'',''CODNCP'',''CODNCP'',TX_NOTA) AS TX_NOTA, ' + coCRLF +
             '         CVE_TIPO_MOVTO,CVE_USU_CANC,FH_CANCELA,SIT_TRANSACCION, ' + coCRLF +
             '         ID_TRANS_CANCELA, ' + coCRLF +
             '         CCTO.CVE_MONEDA, ' + coCRLF +
             '         MON.DESC_MONEDA ' + coCRLF +
             '    FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERACION CO, CONTRATO CTO, PERSONA PP, CR_CREDITO CCR, CR_CAT_COMISION CCCO, MONEDA MON, '+ coCRLF;

                If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
                  begin
                     If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
                     begin
                        sSQL:= sSQL +
                        ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE, CVE_MONEDA FROM CR_CONTRATO '+  coCRLF +
                        ' WHERE CVE_PRODUCTO_CRE IN ('''+sCVE_PRODUCTO_CRE+''')'+  coCRLF +
                        ' ) CCTO '+  coCRLF;
                     end;
                  end
                  else
                     sSQL := sSQL + ' CR_CONTRATO CCTO '+  coCRLF;

        sSQL := sSQL +

             '   WHERE 1 = 1 ' + coCRLF;

             if tiporep = 'CMS' then
                begin
                  // COMISIONES
                sSQL:= sSQL +
             '     AND CT.CVE_OPERACION NOT IN (''MORACP'',''MORAFN'',''MORACN'',''FDVTCN'',''CIIMVD'',''AJFVCN'',''AJFVCP'',''AJFVFN'',''DVMRFR'',''FDVTCN'') ' + coCRLF;
                end
                else begin
                sSQL:= sSQL +
             '     AND CT.CVE_OPERACION NOT IN (''MORACP'',''MORAFN'',''MORACN'',''FDVTCN'',''CIIMVD'',''AJFVCN'',''AJFVCP'',''AJFVFN'',''DVMRFR'',''FDVTCN'',''PVCICN'') ' + coCRLF;
                end;

         sSQL := sSQL +

             '     AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
             '     AND CDT.CVE_OPERACION = CT.CVE_OPERACION ' + coCRLF;

                if tiporep = 'CMS' then   // COMISIONES
                sSQL:= sSQL +
             '     AND CDT.CVE_CONCEPTO IN (''IMPBRU'')'+  coCRLF;

                if tiporep = 'MOR' then   // MORAS
                sSQL:= sSQL +
             '     AND CDT.CVE_CONCEPTO IN (''IMPMOR'')'+  coCRLF;

                if tiporep = 'CAS' then   // CASTIGOS
                sSQL:= sSQL +
             '     AND CT.CVE_OPERACION LIKE ''CAST%'''+  coCRLF;

            sSQL := sSQL +

             '     AND CO.CVE_OPERACION = CT.CVE_OPERACION ' + coCRLF +
             '     AND F_OPERACION >= ' + SQLFecha( StrToDate(sF_CORTEIni))+ coCRLF +
             '     AND F_OPERACION <= ' + SQLFecha( StrToDate(sF_CORTEFin))+ coCRLF +
             '     AND CCCO.CVE_COMISION (+)= CT.CVE_COMISION ' + coCRLF;

                if tiporep = 'CMS' then
                sSQL:= sSQL +
             '     AND CT.CVE_COMISION IS NOT NULL'+  coCRLF;

            sSQL := sSQL +                

             '     AND CT.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
             '     AND MON.CVE_MONEDA = CCTO.CVE_MONEDA ' + coCRLF +
             '     AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
             '     AND PP.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF +
             '     AND CCR.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
             '     AND SIT_TRANSACCION <> ''CA'' ' + coCRLF +
             '     AND CTO.ID_EMPRESA = ' + sIdEmpresa ;

                If (Trim(sACREDITADO)<>'') Then
             sSQL:= sSQL +
             '     AND CTO.ID_TITULAR ='+ sACREDITADO  +  coCRLF ;

                If (Trim(sID_CESION)<>'') Then
             sSQL:= sSQL +
             '     AND CT.ID_CESION = '+ sID_CESION +  coCRLF ;

                If (Trim(sID_CONTRATO)<>'') Then
             sSQL:= sSQL +
             '     AND CTO.ID_CONTRATO ='+ sID_CONTRATO+ coCRLF;

    Result:= sSQL;
end;


procedure TQrCaMor.QRBandDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin

If sArchivo <>'' Then Begin


         Writeln(F,
                  FormatDateTime('DD/MM/YYYY',qyCoCaMor.FieldByName('F_OPERACION').AsDateTime) + #09 +
                  qyCoCaMor.FieldByName('CVE_COMISION').AsString + #09 +
                  qyCoCaMor.FieldByName('DESC_COMISION').AsString + #09 +
                  qyCoCaMor.FieldByName('CVE_CONCEPTO').AsString + #09 +
                  qyCoCaMor.FieldByName('ID_CONTRATO').AsString + #09 +
                  qyCoCaMor.FieldByName('ID_CREDITO').AsString + #09 +
                  qyCoCaMor.FieldByName('ID_PERSONA').AsString + #09 +
                  qyCoCaMor.FieldByName('NOMBRE').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyCoCaMor.FieldByName('IMP_CONCEPTO').AsFloat) + #09+
                  qyCoCaMor.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyCoCaMor.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                  qyCoCaMor.FieldByName('CVE_OPERACION').AsString + #09 +
                  qyCoCaMor.FieldByName('TX_NOTA').AsString + #09 +
                  qyCoCaMor.FieldByName('CVE_TIPO_MOVTO').AsString + #09 +
                  qyCoCaMor.FieldByName('CVE_USU_CANC').AsString + #09 +
                  qyCoCaMor.FieldByName('FH_CANCELA').AsString + #09 +
//                  FormatDateTime('DD/MM/YYYY',qyCoCaMor.FieldByName('FH_CANCELA').AsDateTime) + #09 +
                  qyCoCaMor.FieldByName('SIT_TRANSACCION').AsString + #09 +
                  qyCoCaMor.FieldByName('ID_TRANS_CANCELA').AsString + #09 +
                  qyCoCaMor.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyCoCaMor.FieldByName('DESC_MONEDA').AsString);


   End;
end;

procedure TQrCaMor.QRFooterDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyCoCaMor.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;


end.
