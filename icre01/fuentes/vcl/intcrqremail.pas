unit IntCrQREmail;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs,
  IntFrm, InterApl, UnSQL2, UnGene, UnSubGen,IntTraduce, IntHead, Db,
  DBTables,IntQRPreview, InterMemo, IntGenCre;

type
  TWCrQREmail = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QEmail: TQuery;
    QRGAcred: TQRGroup;
    QRShape10: TQRShape;
    QRLabel23: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRInterEncabezado1: TQRInterEncabezado;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QEmailNUM_FOLIO: TFloatField;
    QEmailID_CREDITO: TFloatField;
    QEmailF_ENVIO: TDateTimeField;
    QEmailSIT_ENVIO_EMAIL: TStringField;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QEmailNOMBRE: TStringField;
    QRDBText12: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QEmailDESTINATARIO: TMemoField;
    QRMDestinatarios: TQRMemo;
    QEmailTEXTO_FINAL: TMemoField;
    QRDBText2: TQRDBText;
    QEmailTITULO_FINAL: TStringField;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRMTextoFinal: TQRMemo;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public
    cadenSQL      : String;
    FApli         : TInterApli;          //Corresponde al Objeto Apli
    VLCAD :STRING;
    vlFolio       : Integer;
  end;

var
  WCrQREmail: TWCrQREmail;

  procedure Execute_RepEmail(ShowPreview: Boolean; Padre: TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepEmail(ShowPreview: Boolean; Padre: TInterFrame);
VAR     vlFolio         : String;
        vlSit           : String;
        vlCredito       : String;
        vlFinicial      : String;
        vlFfinal        : String;
        Preview         : TIntQRPreview;
begin
    try
          WCrQREmail := TWCrQREmail.Create(Padre);
          WCrQREmail.vlFolio := 0;
          Preview := TIntQRPreview.CreatePreview(Application, WCrQREmail);
          WCrQREmail.QEmail.Active:=False;
          WCrQREmail.QEmail.Close;
          WCrQREmail.QEmail.SQL.Clear;

          WCrQREmail.FApli := Padre.Apli;

          vlSit           := Padre.FieldByName('SITUACION').AsSQL;
          vlCredito       := Padre.FieldByName('ID_CREDITO').AsSQL;
          vlFinicial      := Padre.FieldByName('F_INICIAL').AsSQL;
          vlFfinal        := Padre.FieldByName('F_FINAL').AsSQL;

          WCrQREmail.cadenSQL:= ' SELECT E.NUM_FOLIO , ' +
                                '        E.ID_CREDITO , ' +
                                '        P.NOMBRE ,' +
                                '        E.F_ENVIO , ' +
//                                '        SUBSTR( E.TITULO_FINAL ,    1 ,  255 ) TITULO_FINAL ,' +
                                '        E.TITULO_FINAL ,' +
                                '        E.TEXTO_FINAL,' +
//                                '        SUBSTR( E.TEXTO_FINAL  ,    1 ,  255 ) TEXTO_FINAL0 ,' +
//                                '        SUBSTR( E.TEXTO_FINAL  ,  256 ,  510 ) TEXTO_FINAL1 , ' +
//                                '        SUBSTR( E.TEXTO_FINAL  ,  511 ,  765 ) TEXTO_FINAL2 , ' +
//                                '        SUBSTR( E.TEXTO_FINAL  ,  766 , 1020 ) TEXTO_FINAL3 ,' +
//                                '        SUBSTR( E.TEXTO_FINAL  , 1021 , 1275 ) TEXTO_FINAL4 ,  ' +
//                                '        SUBSTR( E.DESTINATARIO ,    1 ,  255 ) DESTINATARIO ,' +
                                '        E.DESTINATARIO,' +
                                '        E.SIT_ENVIO_EMAIL' +
                                ' FROM   CR_EMAIL_ENVIO E,' +
                                '        PERSONA P,' +
                                '        CR_CREDITO CR,' +
                                '        CR_CONTRATO CC,' +
                                '        CONTRATO C' +
                                ' WHERE C.ID_CONTRATO = CC.ID_CONTRATO' +
                                ' AND CC.ID_CONTRATO = CR.ID_CONTRATO' +
                                ' AND CC.FOL_CONTRATO = CR.FOL_CONTRATO ' +
                                ' AND CR.ID_CREDITO = E.ID_CREDITO' +
                                ' AND P.ID_PERSONA = C.ID_TITULAR' +
                                ' AND E.F_ENVIO BETWEEN ' + vlFinicial + ' AND ' + vlFfinal;

          if Padre.FieldByName('B_APLICA_FOLIO').AsString = 'V' then
             WCrQREmail.cadenSQL:=WCrQREmail.cadenSQL + ' AND E.NUM_FOLIO =  ' + Padre.FieldByName('NUM_FOLIO').AsSQL;
          //end if
               //FALTA LINEAS  **************
          if Padre.FieldByName('B_APLICA_CREDITO').AsString = 'V' then
             WCrQREmail.cadenSQL:=WCrQREmail.cadenSQL + ' AND E.ID_CREDITO = ' + Padre.FieldByName('ID_CREDITO').AsSQL;
          //end if

          if vlSit <> '' then
             WCrQREmail.cadenSQL:=WCrQREmail.cadenSQL + ' AND E.SIT_ENVIO_EMAIL = ' + Padre.FieldByName('SITUACION').AsSQL;
          //end if


          WCrQREmail.cadenSQL:=WCrQREmail.cadenSQL + ' ORDER BY NUM_FOLIO,ID_CREDITO ';

          WCrQREmail.QEmail.SQL.Add(WCrQREmail.cadenSQL);
          WCrQREmail.QEmail.DatabaseName:=Padre.Apli.DataBaseName;
          WCrQREmail.QEmail.SessionName:=Padre.Apli.SessionName;
          WCrQREmail.QRInterEncabezado1.Apli := Padre.Apli;

          WCrQREmail.QEmail.Open;

          if WCrQREmail.QEmail.IsEmpty then
              ShowMessage('No Existen Datos para el Reporte,  Reintente mas tarde.  Gracias !!')
          else
          begin
               if ShowPreview then
                  WCrQREmail.Preview
               else
                   WCrQREmail.Print;
               //end if
          end;
     finally
            WCrQREmail.Free;
     end;
end;

procedure TWCrQREmail.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlTexto : String;
begin
   vlTexto := textcorre(QEmailTEXTO_FINAL.AsString);

   if vlFolio <> QEmailNUM_FOLIO.AsInteger then
   Begin
     QRMDestinatarios.Lines.Add(QEmailDESTINATARIO.AsString);
     QRMTextoFinal.Lines.Add(vlTexto);
//     QRMTextoFinal.Textos.Add(QEmailTEXTO_FINAL.AsString);
   end;
   vlFolio := QEmailNUM_FOLIO.AsInteger;
end;

procedure TWCrQREmail.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     QRMDestinatarios.Lines.Clear;
     QRMTextoFinal.Lines.Clear;
//     QRMTextoFinal.Textos.Add(QEmailTEXTO_FINAL.AsString);
end;

end.
