unit IntQrSDesembolso;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrSDesemb = class(TQuickRep)
    qyConsulta: TQuery;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRGroup1: TQRGroup;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape5: TQRShape;
    qrMemo: TQRMemo;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrMemo2: TQRMemo;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup2: TQRGroup;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    ColumnHeaderBand1: TQRBand;
    QRShape17: TQRShape;
    QRLabel6: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel8: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRExpr1: TQRExpr;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    function CortaPalabra(cadenas : tstrings; size : integer; fuente : TFont): tstrings;
    function LargoTexto(texto : string; f : TFont) : integer;
    function Distancia(a,b : integer) : integer;
    function MenorEspacioEntrePalabras(cad : string) : integer;
  public
     Apli : TInterApli;
     dImporteCP, dImporteIN: Double;
     Function FormaQuery( iSolicitud,iCredito: Integer): String;
  end;

var
  QrSDesemb: TQrSDesemb;

Procedure RepDesembolso(iSolicitud, iCredito:Integer; pAPli :TInterApli; pPreview  :Boolean);
Implementation
{$R *.DFM}

Procedure RepDesembolso(iSolicitud, iCredito:Integer; pAPli :TInterApli; pPreview  :Boolean);
Var
   QrSDesemb   : TQrSDesemb;
   Preview     : TIntQRPreview;
Begin
   QrSDesemb   := TQrSDesemb.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrSDesemb);
   QrSDesemb.Apli := pAPli;
   Try
      QrSDesemb.qyConsulta.DatabaseName := pApli.DataBaseName;
      QrSDesemb.qyConsulta.SessionName := pApli.SessionName;
      QrSDesemb.qyConsulta.Active:=False;
      QrSDesemb.qyConsulta.SQL.Text:= QrSDesemb.FormaQuery(iSolicitud,iCredito);
      //QrSDesemb.qyConsulta.SQL.SaveToFile('C:\SQL.txt');
      QrSDesemb.qyConsulta.Active:=True;
      If pPreview Then
         QrSDesemb.Preview
      Else QrSDesemb.Print;
   Finally
      QrSDesemb.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrSDesemb.FormaQuery( iSolicitud, iCredito: Integer): String;
Var sSQL:String;
Begin
   sSQL:= ' SELECT  DATOS.*,'+ #13#10 +
          '         DETALLE.* '+ #13#10 +
          '   FROM (SELECT SOL.ID_CREDITO, SOL.ID_CREDITO AS FINANCIAMIENTO, '+ #13#10 +
          '                INTER.VALOR AS INTERMEDIARIO, '+ #13#10 +
          '                TIT.NOMBRE AS NOM_ACRED, '+ #13#10 +
          '                CAUSAINC.VALOR AS TX_CAUSA_INC , '+ #13#10 +
          '                CC.F_VENCIMIENTO, '+ #13#10 +
          '                SOL.IMP_ADEUDO_CAP,'+ #13#10 +
          '                SOL.IMP_ADEUDO_INT,'+ #13#10 +
          '                SOL.IMP_SOLICITAR,'+ #13#10 +
          '                SOL.PCT_NAFIN_APLIC AS PCT_PART, '+ #13#10 +
          '                '' '' AS COPIA,  ---FALTA '+ #13#10 +
          '                '' '' AS ESO_CTA,  ---FALTA '+ #13#10 +
          '                '' '' AS DOCTOS,  ---FALTA '+ #13#10 +
          '                '' '' AS CARTA,  ---FALTA '+ #13#10 +
          '                SOL.CVE_INTER_FINAN,'+ #13#10 +
          '                INTER.VALOR AS NOMBRE  '+ #13#10 +
          '           FROM CR_GA_SOL_NAFIN SOL, CR_CREDITO CC, CONTRATO CTO, PERSONA TIT, '+ #13#10 +
          '                (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ''INTERM'') INTER, '+ #13#10 +
          '                (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ''CAUSIN'') CAUSAINC '+#13#10 +
          '          WHERE SOL.ID_SOLICITUD = '+ IntToStr(iSolicitud) + #13#10 +
          '            AND CC.ID_CREDITO = SOL.ID_CREDITO '+ #13#10 +
          '            AND CTO.ID_CONTRATO = CC.ID_CONTRATO '+ #13#10 +
          '            AND TIT.ID_PERSONA = CTO.ID_TITULAR '+ #13#10 +
          '            AND INTER.CVE_REFERENCIA (+)= SOL.CVE_INTER_FINAN '+ #13#10 +
          '            AND CAUSAINC.CVE_REFERENCIA (+)= SOL.CVE_CAUSA_INC '+ #13#10 ;

   If iCredito>0 Then
      sSQL:= sSQL + '            AND SOL.ID_CREDITO='+ IntToStr(iCredito)+ #13#10;
   If iSolicitud>0 Then
      sSQL:= sSQL + '            AND SOL.ID_SOLICITUD='+ IntToStr(iSolicitud)+ #13#10;

   sSQL:= sSQL +
          '        )DATOS, '+ #13#10 +
          '        (SELECT ID_CREDITO, '+ #13#10 +
          '                MAX(DECODE(ROWNUM,1, F_VENCIMIENTO, NULL)) AS F_VENC_01, '+ #13#10 +
          '                MAX(DECODE(ROWNUM,2, F_VENCIMIENTO, NULL)) AS F_VENC_02, '+ #13#10 +
          '                MAX(DECODE(ROWNUM,3, F_VENCIMIENTO, NULL)) AS F_VENC_03, '+ #13#10 +
          '                MAX(DECODE(ROWNUM,4, F_VENCIMIENTO, NULL)) AS F_VENC_04, '+ #13#10 +
          '                MAX(DECODE(ROWNUM,5, F_VENCIMIENTO, NULL)) AS F_VENC_05, '+ #13#10 +
          '                MAX(DECODE(ROWNUM,6, F_VENCIMIENTO, NULL)) AS F_VENC_06 '+ #13#10 +
          '           FROM (SELECT CDA.ID_CREDITO, CDA.CVE_ACCESORIO, CI.F_VENCIMIENTO, ROWNUM '+ #13#10 +
          '                 FROM   CR_CB_DET_ADEUDO CDA,'            + #13#10 +
          '                        CR_INTERES CI '                   + #13#10 +
          '                 WHERE  CDA.CVE_ACCESORIO =''IN'' '       + #13#10 +
          '                   AND  CDA.CVE_TIPO_SOL=''SOLNAF'''      + #13#10 +
          '                   AND  CI.ID_CREDITO  = CDA.ID_CREDITO'  + #13#10 +
          '                   AND  CI.NUM_PERIODO = CDA.NUM_PERIODO';
   If iCredito>0 Then
      sSQL:= sSQL +'                    AND CDA.ID_CREDITO='+ IntToStr(iCredito)+ #13#10;
   If iSolicitud>0 Then
      sSQL:= sSQL +'                    AND CDA.ID_SOLICITUD='+ IntToStr(iSolicitud)+ #13#10;

   sSQL:= sSQL +
          '                  ORDER BY CDA.ID_CREDITO, CI.F_VENCIMIENTO) '+ #13#10 +
          '          GROUP BY ID_CREDITO )DETALLE '+ #13#10 +
          '  WHERE DETALLE.ID_CREDITO(+)= DATOS.ID_CREDITO '+ #13#10;
   Result:= sSQL;
End;


procedure TQrSDesemb.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   CortaPalabra(qrMemo.Lines,qrMemo.Width ,qrMemo.Font);
   CortaPalabra(qrMemo2.Lines,qrMemo2.Width ,qrMemo2.Font);

   {   
   QRLabel11.Caption:= FormatFloat( '###,###,###,###,##0.00',(qyConsulta.FieldByName('IMP_ADEUDO_CAP').AsFloat + qyConsulta.FieldByName('IMP_ADEUDO_INT').AsFloat));
   QRLabel13.Caption:= FormatFloat( '###,###,###,###,##0.00',
   ((qyConsulta.FieldByName('IMP_ADEUDO_CAP').AsFloat + qyConsulta.FieldByName('IMP_ADEUDO_INT').AsFloat)*qyConsulta.FieldByName('PCT_PART').AsFloat));
   }
end;

function TQrSDesemb.CortaPalabra(cadenas : tstrings; size : integer; fuente : TFont): tstrings;
var
  i, lpalabra, iInicio, iFin, auxsize,auxsize2 : integer;
  cad, cad2,cadcom, aux, linea : string;
begin
   iInicio:=0;
   for i:=0 to cadenas.count-1 do begin
      cad:= Trim(cadenas[i]);
      lpalabra:= LargoTexto(cad,fuente);
      If lpalabra > size Then Begin
         cad2 := cad; cadcom:= ''; linea:='';
         auxsize:= 0; auxsize2:=0;

         While  LargoTexto(cad2,fuente)> 0 Do Begin
            iFin := Pos(' ', cad2);
            iInicio := 0;
            If iFin = 0 Then
               iFin := length(cad2);

            auxsize:= (auxsize2 + LargoTexto(Copy(cad2, iInicio, iFin),fuente));
            If auxsize < size Then Begin
               cadcom:= cadcom + Copy(cad2, iInicio, iFin);
               cad2 := Copy(cad2, iFin +1 , length(cad));
               auxsize2 := auxsize2 + LargoTexto(Copy(cad2, iInicio, iFin),fuente);
            End Else Begin
               while Distancia(LargoTexto(cadcom,fuente),size)>10 do begin
                  aux:=cadcom;
                  Insert(' ',aux,MenorEspacioEntrePalabras(aux));
                  cadcom:=aux;
               end;
               linea:= linea + cadcom;
               cadcom:= '';
               auxsize := 0;
               auxsize2:= 0;
            End;

            If length(cad2) = 0 Then
               linea:= linea + cadcom;
         End;
         cadenas[i]:= linea;
      End;
   End;
   CortaPalabra := cadenas;
end;
function TQrSDesemb.LargoTexto(texto : string; f : TFont) : integer;
var
  aux : TFont;
begin
  aux:= Screen.ActiveForm.Canvas.Font;
  Screen.ActiveForm.Canvas.font:=f;
  result:=Screen.ActiveForm.Canvas.textwidth(texto);
  Screen.ActiveForm.Canvas.font:=aux;
end;
function TQrSDesemb.MenorEspacioEntrePalabras(cad : string) : integer;
var
  menor,actual,i : integer;
  enespacio : boolean;
begin
  actual:=0;
  menor:=50;
  result:=0;
  enespacio:=false;
  for i:=1 to length(cad) do
    begin
      if cad[i]=' ' then
        begin
          if enespacio
            then actual:=actual+1
            else
              begin
                enespacio:=true;
                actual:=1;
              end;
        end
      else
        if enespacio then
          begin
            enespacio:=false;
            if actual<menor then
              begin
                menor:=actual;
                result:=i-actual;
                actual:=0;
              end;
          end;
    end;
end;

function TQrSDesemb.Distancia(a,b : integer) : integer;
begin
  result:=(b-a);
end;

End.

