unit IntMQrCto;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntMQrPreview, IntGenCre;

type
  TQrCto = class(TQuickRep)
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRLProemio: TQRLabel;
    stpCto: TStoredProc;
    DetailBand1: TQRBand;
    NOMBRE_1: TQRDBText;
    TIPO_1: TQRDBText;
    LINEA_1: TQRShape;
    LINEA_2: TQRShape;
    NOMBRE_2: TQRDBText;
    TIPO_2: TQRDBText;
    LINEA_3: TQRShape;
    NOMBRE_3: TQRDBText;
    TIPO_3: TQRDBText;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRGroup7: TQRGroup;
    QRGroup8: TQRGroup;
    QRGroup9: TQRGroup;
    QRGroup10: TQRGroup;
    QRGroup11: TQRGroup;
    QRGroup12: TQRGroup;
    QRGroup13: TQRGroup;
    QRGroup14: TQRGroup;
    QRGroup4: TQRGroup;
    QRGroup18: TQRGroup;
    QRGroup19: TQRGroup;
    QRGroup20: TQRGroup;
    QRGroup21: TQRGroup;
    QRGroup22: TQRGroup;
    QRGroup23: TQRGroup;
    QRGroup24: TQRGroup;
    QRGroup25: TQRGroup;
    QRChildBand2: TQRChildBand;
    qrFinal: TQRLabel;
    QRGroup15: TQRGroup;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRGroup16: TQRGroup;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape2: TQRShape;
    qrEncabezado: TQRMemo;
    qrObjetoSocial: TQRMemo;
    qrAcrEscNumero: TQRMemo;
    qrAcrRegNumero: TQRMemo;
    qrNomRepresenAcr: TQRMemo;
    qrRepAEscNumero: TQRMemo;
    qrRepARegNumero: TQRMemo;
    qrNomRepresenBin: TQRMemo;
    qrRepBEscNumero: TQRMemo;
    qrRepBRegNumero: TQRMemo;
    qrOpeDestinoCred: TQRMemo;
    qrOpeDisposicion: TQRMemo;
    qrOpeComision: TQRMemo;
    qrOpeFVenc: TQRMemo;
    qrOpePagoCredito: TQRMemo;
    qrOpePagoInter: TQRMemo;
    qrOpeTasaIntOrd: TQRMemo;
    qrOpeTasaIntMor: TQRMemo;
    qrOpeGarantiaCre: TQRMemo;
    qrTxDetalle: TQRMemo;
    qyDatos: TQuery;
    qrlTitulo: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRChildBand3: TQRChildBand;
    QRChildBand4: TQRChildBand;
    QRChildBand1: TQRChildBand;
    QRChildBand6: TQRChildBand;
    QRChildBand7: TQRChildBand;
    QRChildBand13: TQRChildBand;
    QRChildBand8: TQRChildBand;
    QRChildBand9: TQRChildBand;
    QRChildBand10: TQRChildBand;
    QRChildBand11: TQRChildBand;
    QRChildBand5: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel45: TQRLabel;
    QRChildBand14: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    procedure GpoEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup12BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup14BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup18BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup19BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup20BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup21BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup22BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup23BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup24BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup25BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup16BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
    iSolicitud, iImpresion:Integer;
    Apli : TInterApli;
    Procedure LeerCampo(sTableName,sCveDet,sCampoBlob:String; Memo : TQRMemo);    
    Function FormaQuery( iIdSolicitud, iNumImp : Integer): String;
    function CortaPalabra(cadenas : tstrings; size : integer; fuente : TFont): tstrings;
    function LargoTexto(texto : string; f : TFont) : integer;
    function MenorEspacioEntrePalabras(cad : string) : integer;
    function Distancia(a,b : integer) : integer;
  public
  end;

var
  QrCto: TQrCto;

Procedure RepCto( iIdSolicitud, iNumImp : Integer;
                     pAPli    : TInterApli;
                     pPreview, bImprimir : Boolean);
Implementation
{$R *.DFM}

Procedure RepCto( iIdSolicitud, iNumImp : Integer;
                     pAPli    : TInterApli;
                     pPreview, bImprimir : Boolean);
Var
    QrCto: TQrCto;
    Preview     : TMQrPreview;
Begin
    QrCto:=TQrCto.Create(Nil);
    Preview := TMQrPreview.CreatePreview(Application, QrCto);
    Try
      QrCto.iSolicitud:= iIdSolicitud;
      QrCto.iImpresion:= iNumImp;
      QrCto.Apli := pApli;
      QrCto.qyDatos.DatabaseName := pApli.DataBaseName;
      QrCto.qyDatos.SessionName := pApli.SessionName;
      QrCto.qyDatos.Active:=False;
      QrCto.qyDatos.SQL.Text:= QrCto.FormaQuery( iIdSolicitud, iNumImp);
      QrCto.qyDatos.Active:=True;

      {QrCto.stpCto.DatabaseName := pApli.DataBaseName;
      QrCto.stpCto.SessionName := pApli.SessionName;
      QrCto.stpCto.ParamByName('PE_ID_SOLICITUD').AsFloat := iIdSolicitud;
      QrCto.stpCto.ParamByName('PE_NUM_IMPRESION').AsFloat := iNumImp;
      QrCto.stpCto.Open;}

      Preview.Imprimir:= bImprimir;
      If pPreview Then Begin
         QrCto.Preview;
      End Else Begin
         If bImprimir Then
            QrCto.Print;
      End;
   Finally
      QrCto.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

function TQrCto.CortaPalabra(cadenas : tstrings; size : integer; fuente : TFont): tstrings;
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

function TQrCto.LargoTexto(texto : string; f : TFont) : integer;
var
  aux : TFont;
begin
  aux:= Screen.ActiveForm.Canvas.Font;
  Screen.ActiveForm.Canvas.font:=f;
  result:=Screen.ActiveForm.Canvas.textwidth(texto);
  Screen.ActiveForm.Canvas.font:=aux;
end;

function TQrCto.MenorEspacioEntrePalabras(cad : string) : integer;
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

function TQrCto.Distancia(a,b : integer) : integer;
begin
  result:=(b-a);
end;

procedure TQrCto.GpoEncabezadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   LeerCampo('CR_CT_ENCABEZADO', qyDatos.FieldByName('CVE_ENCABEZADO').AsString,
             'TX_ENCABEZADO', qrEncabezado);
   CortaPalabra(qrEncabezado.Lines,qrEncabezado.Width ,qrEncabezado.Font);
end;

procedure TQrCto.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrObjetoSocial.Lines.Text:= Trim(qyDatos.FieldByName('OBJETO_SOCIAL').AsString);
   CortaPalabra(qrObjetoSocial.Lines,qrObjetoSocial.Width ,qrObjetoSocial.Font);
end;

procedure TQrCto.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrAcrEscNumero.Lines.Text:= Trim(qyDatos.FieldByName('ACR_ESC_NUMERO').AsString);
   CortaPalabra(qrAcrEscNumero.Lines,qrAcrEscNumero.Width ,qrAcrEscNumero.Font);
end;

procedure TQrCto.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrAcrRegNumero.Lines.Text:= Trim(qyDatos.FieldByName('ACR_REG_NUMERO').AsString);
   CortaPalabra(qrAcrRegNumero.Lines,qrAcrRegNumero.Width ,qrAcrRegNumero.Font);
end;

procedure TQrCto.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrNomRepresenAcr.Lines.Text:= Trim(qyDatos.FieldByName('NOM_REPRESEN_ACR').AsString);
   CortaPalabra(qrNomRepresenAcr.Lines,qrNomRepresenAcr.Width ,qrNomRepresenAcr.Font);
end;

procedure TQrCto.QRGroup8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrRepARegNumero.Lines.Text:= Trim(qyDatos.FieldByName('REP_A_REG_NUMERO').AsString);
   CortaPalabra(qrRepARegNumero.Lines,qrRepARegNumero.Width ,qrRepARegNumero.Font);
end;

procedure TQrCto.QRGroup7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrRepAEscNumero.Lines.Text:= Trim(qyDatos.FieldByName('REP_A_ESC_NUMERO').AsString);
   CortaPalabra(qrRepAEscNumero.Lines,qrRepAEscNumero.Width ,qrRepAEscNumero.Font);
end;

procedure TQrCto.QRGroup10BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrNomRepresenBin.Lines.Text:= Trim(qyDatos.FieldByName('NOM_REPRESEN_BIN').AsString);
   CortaPalabra(qrNomRepresenBin.Lines,qrNomRepresenBin.Width ,qrNomRepresenBin.Font);
end;

procedure TQrCto.QRGroup11BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrRepBEscNumero.Lines.Text:= Trim(qyDatos.FieldByName('REP_B_ESC_NUMERO').AsString);
   CortaPalabra(qrRepBEscNumero.Lines,qrRepBEscNumero.Width ,qrRepBEscNumero.Font);
end;

procedure TQrCto.QRGroup12BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrRepBRegNumero.Lines.Text:= Trim(qyDatos.FieldByName('REP_B_REG_NUMERO').AsString);
   CortaPalabra(qrRepBRegNumero.Lines,qrRepBRegNumero.Width ,qrRepBRegNumero.Font);
end;

procedure TQrCto.QRGroup14BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeDestinoCred.Lines.Text:= Trim(qyDatos.FieldByName('OPE_DESTINO_CRED').AsString);
   CortaPalabra(qrOpeDestinoCred.Lines,qrOpeDestinoCred.Width ,qrOpeDestinoCred.Font);
end;

procedure TQrCto.QRGroup4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeDisposicion.Lines.Text:= Trim(qyDatos.FieldByName('OPE_DISPOSICION').AsString);
   CortaPalabra(qrOpeDisposicion.Lines,qrOpeDisposicion.Width ,qrOpeDisposicion.Font);
end;

procedure TQrCto.QRGroup18BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeComision.Lines.Text:= Trim(qyDatos.FieldByName('OPE_COMISION').AsString);
   CortaPalabra(qrOpeComision.Lines,qrOpeComision.Width ,qrOpeComision.Font);
end;

procedure TQrCto.QRGroup19BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeFVenc.Lines.Text:= Trim(qyDatos.FieldByName('OPE_F_VENC').AsString);
   CortaPalabra(qrOpeFVenc.Lines,qrOpeFVenc.Width ,qrOpeFVenc.Font);
end;

procedure TQrCto.QRGroup20BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpePagoCredito.Lines.Text:= Trim(qyDatos.FieldByName('OPE_PAGO_CREDITO').AsString);
   CortaPalabra(qrOpePagoCredito.Lines,qrOpePagoCredito.Width ,qrOpePagoCredito.Font);
end;

procedure TQrCto.QRGroup21BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpePagoInter.Lines.Text:= Trim(qyDatos.FieldByName('OPE_PAGO_INTER').AsString);
   CortaPalabra(qrOpePagoInter.Lines,qrOpePagoInter.Width ,qrOpePagoInter.Font);
end;

procedure TQrCto.QRGroup22BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeTasaIntOrd.Lines.Text:= Trim(qyDatos.FieldByName('OPE_TASA_INT_ORD').AsString);
   CortaPalabra(qrOpeTasaIntOrd.Lines,qrOpeTasaIntOrd.Width ,qrOpeTasaIntOrd.Font);
end;

procedure TQrCto.QRGroup23BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeTasaIntMor.Lines.Text:= Trim(qyDatos.FieldByName('OPE_TASA_INT_MOR').AsString);
   CortaPalabra(qrOpeTasaIntMor.Lines,qrOpeTasaIntMor.Width ,qrOpeTasaIntMor.Font);
end;

procedure TQrCto.QRGroup24BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrOpeGarantiaCre.Lines.Text:= Trim(qyDatos.FieldByName('OPE_GARANTIA_CRE').AsString);
   CortaPalabra(qrOpeGarantiaCre.Lines,qrOpeGarantiaCre.Width ,qrOpeGarantiaCre.Font);
end;

procedure TQrCto.QRGroup25BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   LeerCampo('CR_CT_DETALLE', qyDatos.FieldByName('CVE_DETALLE').AsString,
             'TX_DETALLE', qrTxDetalle);
   CortaPalabra(qrTxDetalle.Lines,qrTxDetalle.Width ,qrTxDetalle.Font);
end;

procedure TQrCto.QRChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrFinal.Caption:= 'El presente contrato previa lectura por las partes contratantes, '+
                     'es firmado por triplicado en la ciudad de México, Distrito Federal el día '+
                     FormatDateTime('d " de " mmmm " de " yyyy', qyDatos.FieldByName('F_CONTRATO').AsDateTime)+
                     ' quedando una copia del mismo en poder de cada una de las partes contratantes.';
end;

Function TQrCto.FormaQuery( iIdSolicitud, iNumImp : Integer): String;
Var
   sSQL: String;
Begin
   sSQL:='SELECT T1.*, DETALLE.CVE_DETALLE, DETALLE.TX_DETALLE, '+
                'IM.TX_ENCABEZADO ADD_TX_ENCABEZADO, '+
                'IM.CVE_CTO_CRE, '+
                'IM.F_IMPRESION, '+
                'IM.F_CONTRATO, '+
                'ENC.TX_ENCABEZADO, '+
                'P.NOMBRE,(RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC)REGISTRO, '+
					 '(DOM.CALLE_NUMERO||'' ''||DOM.COLONIA||'' ''||DOM.CODIGO_POSTAL)DOMICILIO, '+
                'PM.* '+
           'FROM '+
         '( '+
           'SELECT ORD_TIPO, TRUNC((NUM_TIPO+1)/2) INDICE, '+
                  'ID_SOLICITUD,NUM_IMPRESION,CVE_ENCABEZADO, '+
              		'CVE_DETALLE,TIPO,ROL, '+
              		'MAX(DECODE( MOD(Num_Tipo,2) ,0, '' '', CVE_USUARIO)) CVE_USU_1, '+
              		'MAX(DECODE( MOD(Num_Tipo,2) ,0, '' '', NOMBRE)) NOMBRE_1, '+
              		'MAX(DECODE( MOD(Num_Tipo,2) ,0, CVE_USUARIO, '' '')) CVE_USU_2, '+
              		'MAX(DECODE( MOD(Num_Tipo,2) ,0, NOMBRE, '' '')) NOMBRE_2 '+
             'FROM '+
            '( '+
                  'SELECT 1 ord_tipo, '+
								 'Rownum Num_Tipo, '+
								 'CTROL.ID_SOLICITUD, '+
                         'CTROL.NUM_IMPRESION, '+
                         'CTO.CVE_ENCABEZADO, '+
                         'CTO.CVE_DETALLE, '+
                         'FIR.CVE_USUARIO, '+
                         'FIR.CVE_TIPO_ROL, '+
                         '''APODERADO'' TIPO, '+
                         '''AP'' ROL, '+
                         'P.NOMBRE '+
                    'FROM CR_CT_CONTRATO_C CTO, '+
                         'CR_CT_CONTROL_IM CTROL, '+
                         'CR_CT_USU_FIRMA FIR, '+
                         'USUARIO USU, '+
                         'PERSONA P '+
                   'WHERE CTO.CVE_CTO_CRE = CTROL.CVE_CTO_CRE '+
                     'AND CTO.CVE_FIRMA  = FIR.CVE_FIRMA '+
                     'AND FIR.CVE_USUARIO = USU.CVE_USUARIO '+
                     'AND USU.ID_PERSONA = P.ID_PERSONA '+
  							'AND FIR.CVE_TIPO_ROL = ''AP'' '+
                     'AND CTROL.ID_SOLICITUD = '+ IntToStr(iIdSolicitud) +
                     'AND CTROL.NUM_IMPRESION= '+ IntToStr(iNumImp)+
               'UNION ALL '+
                  'SELECT 2 ord_tipo, '+
        						 'rownum Num_Tipo, '+
								 'IM.ID_SOLICITUD, '+
        						 'IM.NUM_IMPRESION, '+
                         'CTO.CVE_ENCABEZADO CVE_ENCABEZADO, '+
                         'CTO.CVE_DETALLE CVE_DETALLE, '+
                         ''' '' CVE_USUARIO, '+
                         '''AC'' CVE_TIPO_ROL, '+
                         '''APODERADO'' TIPO, '+
								 '''AC'' ROL, '+
                         'P.NOMBRE '+
                    'FROM CR_CT_CONTROL_IM IM,CR_CT_PROEMIO_PM PR, '+
                         'CR_CT_CONTRATO_C CTO, PERSONA P '+
                   'WHERE IM.ID_SOLICITUD = PR.ID_SOLICITUD(+) '+
                     'AND IM.ID_SOLICITUD = '+ IntToStr(iIdSolicitud) +
                     'AND IM.NUM_IMPRESION = '+ IntToStr(iNumImp)+
                     'AND IM.CVE_CTO_CRE = CTO.CVE_CTO_CRE '+
                     'AND PR.ID_PERSONA = P.ID_PERSONA(+) '+
               'UNION ALL '+
                  'SELECT 3 ord_tipo, '+
		         			'rownum Num_Tipo, '+
	 							'CTROL.ID_SOLICITUD, '+
                        'CTROL.NUM_IMPRESION, '+
                        'CTO.CVE_ENCABEZADO, '+
                        'CTO.CVE_DETALLE, '+
                        'FIR.CVE_USUARIO, '+
                        'FIR.CVE_TIPO_ROL, '+
                        '''TESTIGO'' TIPO, '+
                        '''TE'' ROL, '+
                        'P.NOMBRE '+
                   'FROM CR_CT_CONTRATO_C CTO, '+
                        'CR_CT_CONTROL_IM CTROL, '+
                        'CR_CT_USU_FIRMA FIR, '+
                        'USUARIO USU, '+
                        'PERSONA P '+
                  'WHERE CTO.CVE_CTO_CRE = CTROL.CVE_CTO_CRE '+
                    'AND CTO.CVE_FIRMA  = FIR.CVE_FIRMA '+
                    'AND FIR.CVE_USUARIO = USU.CVE_USUARIO '+
                    'AND USU.ID_PERSONA = P.ID_PERSONA '+
                    'AND FIR.CVE_TIPO_ROL = ''TE'' '+
                    'AND CTROL.ID_SOLICITUD = '+ IntToStr(iIdSolicitud) +
                    'AND CTROL.NUM_IMPRESION = '+ IntToStr(iNumImp)+
                ') '+
           'GROUP BY ORD_TIPO, TRUNC((NUM_TIPO+1)/2), '+
                 'ID_SOLICITUD,NUM_IMPRESION,CVE_ENCABEZADO, '+
                 'CVE_DETALLE,TIPO,ROL) T1, '+
                 'CR_CT_DETALLE DETALLE, '+
                 'CR_CT_CONTROL_IM IM, '+
                 'CR_CT_PROEMIO_PM PM, PERSONA P, RFC, DOMICILIO DOM, '+
                 'CR_CT_ENCABEZADO ENC '+
           'WHERE T1.CVE_DETALLE = DETALLE.CVE_DETALLE '+
             'AND T1.CVE_ENCABEZADO = ENC.CVE_ENCABEZADO '+
             'AND T1.ID_SOLICITUD = IM.ID_SOLICITUD '+
             'AND T1.NUM_IMPRESION = IM.NUM_IMPRESION '+
             'AND T1.ID_SOLICITUD = PM.ID_SOLICITUD(+) '+
             'AND PM.ID_PERSONA = P.ID_PERSONA(+) '+
  			    'AND PM.ID_PERSONA = RFC.ID_PERSONA(+) '+
             'AND PM.ID_DOMICILIO = DOM.ID_DOMICILIO(+)';
   Result:= sSQL;
End;
procedure TQrCto.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(qyDatos.FieldByName('NOMBRE_2').AsString) <>'' Then Begin
      LINEA_1.Enabled:=True;
      NOMBRE_1.Enabled:=True;
      TIPO_1.Enabled:=True;

      LINEA_2.Enabled:=True;
      NOMBRE_2.Enabled:=True;
      TIPO_2.Enabled:=True;

      LINEA_3.Enabled:=False;
      NOMBRE_3.Enabled:=False;
      TIPO_3.Enabled:=False;
      QRMemo1.Enabled:=False;
   End Else Begin
      LINEA_1.Enabled:=False;
      NOMBRE_1.Enabled:=False;
      TIPO_1.Enabled:=False;

      LINEA_2.Enabled:=False;
      NOMBRE_2.Enabled:=False;
      TIPO_2.Enabled:=False;

      LINEA_3.Enabled:=True;
      NOMBRE_3.Enabled:=True;
      TIPO_3.Enabled:=True;
      QRMemo1.Enabled:=True;
   End;
end;

procedure TQrCto.QRGroup16BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(qyDatos. FieldByName('ROL').AsString)= 'TE' Then Begin
      qrlTitulo.Caption:= '" TESTIGOS "';
      TIPO_1.Enabled:= False;
      TIPO_2.Enabled:= False;             
      TIPO_3.Enabled:= False;
   End Else If Trim(qyDatos.FieldByName('ROL').AsString)= 'AC' Then Begin
      qrlTitulo.Caption:= '" LA ACREDITADA "';
   End Else Begin
      qrlTitulo.Caption:= '';
      QRGroup16.Enabled:= False;
   End;
   QRMemo1.Lines.Text:= Trim(qyDatos.FieldByName('NOM_REPRESEN_ACR').AsString);
   CortaPalabra(QRMemo1.Lines,QRMemo1.Width ,QRMemo1.Font);
end;


Procedure TQrCto.LeerCampo(sTableName,sCveDet,sCampoBlob:String; Memo : TQRMemo);
Var
   tDetalleCam:   TTable;
   slLista: TStringList;
   msBufSal: TMemoryStream;
   i : Integer;
Begin
   Try
       slLista:= TStringList.Create;
       msBufSal := TMemoryStream.Create;
       tDetalleCam := TTable.Create(Nil);
       tDetalleCam.DatabaseName := Apli.DataBaseName;
       tDetalleCam.TableName := sTableName;
       tDetalleCam.Active := True;
       If tDetalleCam.FindKey([sCveDet]) Then Begin
           tDetalleCam.Edit;
           msBufSal.Clear;
           Memo.Lines.Text:=' ';

           TMemoField(tDetalleCam.FindField(sCampoBlob)).SaveToStream(msBufSal);
           msBufSal.Position:=0;
           slLista.Clear;
           slLista.LoadFromStream(msBufSal);
           slLista.Count;
           For i:=0 To slLista.Count-1 Do Begin
               slLista.Strings[i]:= ReplaceChar(slLista.Strings[i], #09, #32#32#32);
           End;
           Memo.Lines.AddStrings(slLista);
           tDetalleCam.Post;
       End;
   Finally
      slLista.Free;
      tDetalleCam.Close;
      tDetalleCam.Free;
      msBufSal.Free;
   End;
End;

End.

