unit IntMTrasCheq;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre, jpeg;

type
  TTrasCheq = class(TQuickRep)
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
    qyTrasCheq: TQuery;
    QRBand2: TQRBand;
    QRLabel29: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRImageABONO: TQRImage;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRLabel12: TQRLabel;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    qyTrasCheqID_CREDITO: TFloatField;
    qyTrasCheqID_GRUPO_TRANSAC: TFloatField;
    qyTrasCheqMONEDA: TFloatField;
    qyTrasCheqCUENTA: TFloatField;
    qyTrasCheqNOMB_CTA_BCO: TStringField;
    qyTrasCheqCVE_PPO_MOV: TStringField;
    qyTrasCheqDESC_PPO_MOV: TStringField;
    qyTrasCheqIMP_BRUTO: TFloatField;
    qyTrasCheqIMP_IVA: TFloatField;
    qyTrasCheqIMP_NETO: TFloatField;
    qyTrasCheqF_AUTORIZA: TDateTimeField;
    qyTrasCheqID_CONTRATO_DV: TStringField;
    qyTrasCheqNOMBRE_CLIENTE: TStringField;
    qyTrasCheqNOM_OPERA: TStringField;
    qyTrasCheqNOM_TESOR: TStringField;
    QRShape14: TQRShape;
    QRDBText18: TQRDBText;
    procedure QRFooterDiaBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);

  private


  public
    function FormaQuery( sF_IdCredito, sF_IdGpoTrans : String):String;



  end;

var
  TrasCheq: TTrasCheq;
  sArchivo:String;
  titrep : String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;
  Query1 : TQuery;


  procedure TrasCheqe(  sF_IdCredito, sF_IdGpoTrans : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);



implementation

{$R *.DFM}

procedure TrasCheqe( sF_IdCredito, sF_IdGpoTrans : String;
                     pPreview : Boolean;
                     pApli    : TInterApli);

var
    TrasCheq   : TTrasCheq;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    TrasCheq:= TTrasCheq.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, TrasCheq);
    Apli := pApli;
      Try
        vgFechaHoy  := pAPli.DameFechaEmpresa;

        TrasCheq.qyTrasCheq.DatabaseName := pApli.DataBaseName;
        TrasCheq.qyTrasCheq.SessionName  := pApli.SessionName;

        TrasCheq.qyTrasCheq.Active:=False;

        TrasCheq.qyTrasCheq.SQL.Text:= TrasCheq.FormaQuery(sF_IdCredito,sF_IdGpoTrans);


        TrasCheq.qyTrasCheq.SQL.SaveToFile('c:\TrasCheqe.txt');
        TrasCheq.qyTrasCheq.Active:=True;


        If pPreview Then
            TrasCheq.Preview
        Else
            TrasCheq.Print;
     Finally
      If Trim(sArchivo)<>'' Then Begin
         CloseFile(F);
      End;
      TrasCheq.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

function TTrasCheq.FormaQuery(sF_IdCredito, sF_IdGpoTrans : String):String;
Var
    sSQL : String;

begin
      sSQL := 'SELECT pppd.id_credito, pppd.id_grupo_transac, '+ coCRLF+
              '       (SELECT cve_moneda FROM contrato WHERE id_contrato = pppd.id_contrato_dv) AS moneda, '+ coCRLF+
              '       (CASE '+ coCRLF+
              '           WHEN (SELECT cve_moneda '+ coCRLF+
              '                   FROM contrato '+ coCRLF+
              '                  WHERE id_contrato = pppd.id_contrato_dv) = 484 '+ coCRLF+
              '              THEN (SELECT id_cto_binter '+ coCRLF+
              '                      FROM cr_ppo_param) '+ coCRLF+
              '           ELSE (SELECT id_cto_usdd '+ coCRLF+
              '                   FROM cr_ppo_param) '+ coCRLF+
              '        END) AS cuenta, '+ coCRLF+
              '       CAST(pkgcrconsolidado.fun_nom_tit_cred( '+ coCRLF+
              '		           (SELECT id_titular '+ coCRLF+
              '                      FROM contrato '+ coCRLF+
              '                     WHERE id_contrato = '+ coCRLF+
              '                              CASE '+ coCRLF+
              '                                 WHEN (SELECT cve_moneda '+ coCRLF+
              '                                         FROM contrato '+ coCRLF+
              '                                        WHERE id_contrato = '+ coCRLF+
              '                                                    pppd.id_contrato_dv) = 484 '+ coCRLF+
              '                                    THEN (SELECT id_cto_binter '+ coCRLF+
              '                                            FROM cr_ppo_param) '+ coCRLF+
              '                                 ELSE (SELECT id_cto_usdd '+ coCRLF+
              '                                         FROM cr_ppo_param) '+ coCRLF+
              '                              END)) AS VARCHAR2(80)) NOMB_CTA_BCO, '+ coCRLF+
              '       pppd.cve_ppo_mov, movp.desc_ppo_mov, pppd.imp_bruto, pppd.imp_iva, '+ coCRLF+
              '       imp_neto, pppd.f_autoriza, pppd.id_contrato_dv, '+ coCRLF+
              '       CAST(pkgcrconsolidado.fun_nom_tit_cred((SELECT id_titular  FROM contrato WHERE id_contrato = pppd.id_contrato_dv))AS VARCHAR2(80)) AS NOMBRE_CLIENTE, '+ coCRLF+
              '       CAST(pkgcrconsolidado.fun_nom_tit_cred((SELECT id_operacion FROM cr_ppo_param)) AS VARCHAR2(80)) AS nom_opera, '+ coCRLF+
              '       CAST(pkgcrconsolidado.fun_nom_tit_cred((SELECT id_tesorero  FROM cr_ppo_param))AS VARCHAR2(80))  AS nom_tesor '+ coCRLF+
              '   FROM cr_ppo_mov_premio pppd, cr_ppo_premio comp, cr_ppo_mov movp '+ coCRLF+
              '  WHERE 1 = 1 '+ coCRLF+
              '    AND pppd.id_credito = comp.id_credito '+ coCRLF+
              '    AND movp.cve_ppo_mov = pppd.cve_ppo_mov '+ coCRLF+
              '    AND movp.b_genera_factura = ''V'' '+ coCRLF+
              '    AND pppd.id_credito = ' + sF_IdCredito+
              '    AND pppd.id_grupo_transac = ' +sF_IdGpoTrans;
    Result:= sSQL;
end;


procedure TTrasCheq.QRFooterDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyTrasCheq.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         CloseFile(F);
      End;
   End;
end;


end.

