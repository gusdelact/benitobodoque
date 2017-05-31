// MODIFICADO 18 MAY 04 : QUITA LOS DOCUMENTOS CANCELADOS DE LOS AVISOS
// MODIFICADO 24 SEP 04 : BUSCA POR FECHA DE AUTORIZACION
// MODIFICADO 21 DIC 04 : INCORPORA FILTRO EMISOR PROVEEDOR

unit IntMQrEtqAvCe;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrEtqAvCe = class(TQuickRep)
    QRGroup1: TQRGroup;
    qyEtqAvCe: TQuery;
    qyEtqAvCeDESC_MONEDA: TStringField;
    qyEtqAvCeNOMBRE_P: TStringField;
    qyEtqAvCeCALLE_P: TStringField;
    qyEtqAvCeDIR_P: TStringField;
    qyEtqAvCeTEL_P: TStringField;
    qyEtqAvCeATN: TStringField;
    qyEtqAvCeCOL_P: TStringField;
    QRBand2: TQRBand;
    QRNombre: TQRLabel;
    QRNombre1: TQRLabel;
    QRNombre2: TQRLabel;
    qrATN: TQRLabel;
    qrCALLE: TQRLabel;
    qrTEL: TQRLabel;
    qrDIR: TQRLabel;
    qrATN1: TQRLabel;
    qrCALLE1: TQRLabel;
    qrDIR1: TQRLabel;
    qrTEL1: TQRLabel;
    qrATN2: TQRLabel;
    qrCALLE2: TQRLabel;
    qrDIR2: TQRLabel;
    qrTEL2: TQRLabel;
    qrCOLONIA: TQRLabel;
    qrCOLONIA1: TQRLabel;
    qrCOLONIA2: TQRLabel;
    QRBand1: TQRBand;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Apli       : TInterApli;
  public

    Function FormaQuery(sF_Inicio, sF_Fin : String;
                        sEmisor, sProveedor : String;
                        iIdCesionFo, iIdCesionFf : Integer;
                        sCesiones, sOrden : String ): String;
  end;

const coCRLF = #13#10;

var
  QrEtqAvCe: TQrEtqAvCe;


Procedure RepEtiqtaAvisCes( sF_Inicio, sF_Fin   : String;
                            sEmisor     : String;
                            sProveedor  : String;
                            sIdCesionFo : Integer;
                            sIdCesionFf : Integer;
                            sCesiones   : String; // Cesiones a Ignorar para su Impresión
                            sOrden      : String;
                            pAPli       : TInterApli;
                            pPreview    : Boolean);

Implementation
{$R *.DFM}

Procedure RepEtiqtaAvisCes( sF_Inicio, sF_Fin   : String;
                            sEmisor     : String;
                            sProveedor  : String;
                            sIdCesionFo : Integer;
                            sIdCesionFf : Integer;
                            sCesiones   : String; // Cesiones a Ignorar para su Impresión
                            sOrden      : String;
                            pAPli       : TInterApli;
                            pPreview    : Boolean);
Var
    QrEtqAvCe : TQrEtqAvCe;
    Preview   : TIntQRPreview;
Begin
    QrEtqAvCe:=TQrEtqAvCe.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrEtqAvCe);
    Try
        QrEtqAvCe.qyEtqAvCe.DatabaseName := pApli.DataBaseName;
        QrEtqAvCe.qyEtqAvCe.SessionName := pApli.SessionName;
        QrEtqAvCe.Apli := pApli;

        QrEtqAvCe.qyEtqAvCe.Active:=False;
        QrEtqAvCe.qyEtqAvCe.SQL.Text:= QrEtqAvCe.FormaQuery(sF_Inicio, sF_Fin,
                                                    sEmisor, sProveedor, // lols
                                                    sIdCesionFo, sIdCesionFf,
                                                    sCesiones, sOrden);

        QrEtqAvCe.qyEtqAvCe.SQL.SaveToFile('c:\EtiqAviso.txt');
        QrEtqAvCe.qyEtqAvCe.Active:=True;

        If Not QrEtqAvCe.qyEtqAvCe.IsEmpty Then
         Begin
          If pPreview Then
              QrEtqAvCe.Preview
          Else
              QrEtqAvCe.Print;
         End
       Else
        ShowMessage('No hay datos que mostrar');

    Finally
        QrEtqAvCe.qyEtqAvCe.Close;
        QrEtqAvCe.free;
    End;

    If Assigned(Preview) Then Preview.Free;
End;

Function TQrEtqAvCe.FormaQuery(sF_Inicio, sF_Fin : String;
                                sEmisor, sProveedor : String;
                                iIdCesionFo, iIdCesionFf : Integer;
                                sCesiones, sOrden : String ): String;
var
    sSQL:String;
    sIdCesion:String;
Begin
    if sEmisor <> '' then
      sEmisor := 'AND CCE.ID_EMISOR = ' + sEmisor;
    if sProveedor <> '' then
      sProveedor := 'AND CPV.ID_ACREDITADO = ' + sProveedor;
    //

    sIdCesion:= 'BETWEEN ' + IntToStr(iIdCesionFo) + ' AND ' + IntToStr(iIdCesionFf);
    
    sSQL:= ' SELECT '+ coCRLF +
           '       PP.NOMBRE AS NOMBRE_P,'+ coCRLF +
           '       DMP.CALLE_NUMERO CALLE_P,'+ coCRLF +
           '       ''COL. ''||DMP.COLONIA COL_P, '+ coCRLF +
           '       PBDP.DESC_POBLACION ||'', '' || PBCP.DESC_POBLACION AS DIR_P,'+ coCRLF +
           '       ''  C.P. '' ||DMP.CODIGO_POSTAL ||'' TEL. '' || PP.TELEF_OFICINA AS TEL_P,'  + coCRLF +
           '        M.DESC_MONEDA, '   + coCRLF +
           '       ''ATN: ''||CPV.NOM_CONTACTO ATN'+ coCRLF +
           ' FROM CR_CESION     CCE, ' + coCRLF +
           '      PERSONA       PP, '  + coCRLF +
           '      CR_CREDITO    CC, '  + coCRLF +
           '      CONTRATO      CTO, ' + coCRLF +
           '      DOMICILIO     DMP, ' + coCRLF +
           '      POBLACION     PBDP, '+ coCRLF +
           '      POBLACION     PBCP, '+ coCRLF +
           '      CR_PROVEEDOR  CPV, ' + coCRLF +
           '      MONEDA        M '   + coCRLF +
           ' WHERE CCE.ID_CESION  '+  sIdCesion + coCRLF +
           '   AND CCE.SIT_CESION <> ''CA''  '  + coCRLF +
                sEmisor  + coCRLF + sProveedor + coCRLF +
           '   AND PP.ID_PERSONA        = CCE.ID_PROVEEDOR '+ coCRLF +
           '   AND CC.ID_CREDITO        = CCE.ID_CESION '      + coCRLF +
           '   AND CTO.ID_CONTRATO      = CC.ID_CONTRATO '   + coCRLF +
           '   AND DMP.ID_DOMICILIO     = PP.ID_DOMICILIO ' + coCRLF +
           '   AND PBDP.CVE_POBLACION   = DMP.CVE_CIUDAD '+ coCRLF +
           '   AND PBCP.CVE_POBLACION   = DMP.CVE_ESTADO '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
           '   AND CPV.CVE_FND_ENT_DES  = CCE.CVE_FND_ENT_DES '+ coCRLF +
           '   AND CPV.ID_ACREDITADO    = CCE.ID_PROVEEDOR '+ coCRLF +
{/ROIM}
           '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA ';

    If ( Trim(sF_Inicio)<>'' ) OR ( Trim(sF_Fin)<>'' )Then
        sSQL:= sSQL+' AND CCE.F_AUTORIZA >=TO_DATE('''+ sF_Inicio +''',''DD/MM/YYYY'')' +
                    ' AND CCE.F_AUTORIZA <=TO_DATE('''+ sF_Fin +''',''DD/MM/YYYY'')';

    If (Trim(sCesiones) <> '') Then
      sSQL:= sSQL+' AND CC.ID_CREDITO NOT IN ('+sCesiones+')';

    sSQL :=sSQL + ' GROUP BY PP.NOMBRE, DMP.CALLE_NUMERO, DMP.COLONIA,'+ coCRLF +
                  '          PBDP.DESC_POBLACION, PBCP.DESC_POBLACION,'+ coCRLF +
                  '          DMP.CODIGO_POSTAL, PP.TELEF_OFICINA ,'+ coCRLF +
                  '          M.DESC_MONEDA, CPV.NOM_CONTACTO'+ coCRLF +
                  ' ORDER BY NOMBRE_P';
    Result:= sSQL;
End;
procedure TQrEtqAvCe.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
            //PROVEEDOR
            QRNombre.Caption := qyEtqAvCeNOMBRE_P.AsString;
            QRNombre1.Caption := qyEtqAvCeNOMBRE_P.AsString;
            QRNombre2.Caption := qyEtqAvCeNOMBRE_P.AsString;

            qrATN.Caption := qyEtqAvCeATN.AsString;
            qrATN1.Caption := qyEtqAvCeATN.AsString;
            qrATN2.Caption := qyEtqAvCeATN.AsString;

            qrCALLE.Caption := qyEtqAvCeCALLE_P.AsString;
            qrCALLE1.Caption := qyEtqAvCeCALLE_P.AsString;
            qrCALLE2.Caption := qyEtqAvCeCALLE_P.AsString;

            qrCOLONIA.Caption := qyEtqAvCeCOL_P.AsString;
            qrCOLONIA1.Caption := qyEtqAvCeCOL_P.AsString;
            qrCOLONIA2.Caption := qyEtqAvCeCOL_P.AsString;

            qrDIR.Caption := qyEtqAvCeDIR_P.AsString;
            qrDIR1.Caption := qyEtqAvCeDIR_P.AsString;
            qrDIR2.Caption := qyEtqAvCeDIR_P.AsString;

            qrTEL.Caption := qyEtqAvCeTEL_P.AsString;
            qrTEL1.Caption := qyEtqAvCeTEL_P.AsString;
            qrTEL2.Caption := qyEtqAvCeTEL_P.AsString;
end;

End.
