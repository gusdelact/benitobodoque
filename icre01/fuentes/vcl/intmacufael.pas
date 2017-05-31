unit IntMAcuFaEl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre, jpeg;

type
  TAcuFaEl = class(TQuickRep)
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
    qyAcuFaEl: TQuery;
    QRBand2: TQRBand;
    QRLabel29: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    qyAcuFaElEMISOR: TFloatField;
    qyAcuFaElNOM_EMISOR: TStringField;
    qyAcuFaElPROVEEDOR: TFloatField;
    qyAcuFaElNOM_PROVEDOR: TStringField;
    qyAcuFaElCVE_FND_ENT_DES: TStringField;
    qyAcuFaElID_DOCUMENTO: TStringField;
    qyAcuFaElFOL_ACUSE: TStringField;
    qyAcuFaElFOL_ACUSE_OPER: TStringField;
    qyAcuFaElF_ALTA: TDateTimeField;
    qyAcuFaElF_VENCIMIENTO: TDateTimeField;
    qyAcuFaElCVE_MONEDA: TStringField;
    qyAcuFaElDESC_MONEDA: TStringField;
    qyAcuFaElIMP_NOMINAL: TFloatField;
    qyAcuFaElIMP_AFORADO: TFloatField;
    qyAcuFaElIMP_INTERES: TFloatField;
    qyAcuFaElIMP_COMISION: TFloatField;
    qyAcuFaElTASA_BASE: TFloatField;
    qyAcuFaElSOBRETASA: TFloatField;
    qyAcuFaElCVE_USU_MODIFICA: TStringField;
    qyAcuFaElTX_LEYENDA_ACEPT: TMemoField;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRImageABONO: TQRImage;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel18: TQRLabel;
    QRUsuario: TQRLabel;
    QRLabel19: TQRLabel;
    QRHoraFech: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText20: TQRDBText;
    qyAcuFaElPLAZO: TFloatField;
    QRShape1: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    procedure QRFooterDiaBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);

  private


  public
    function FormaQuery( sF_VntoIni, sF_VntoFin, sCVE_MONEDA, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO,
                         sFOL_ACUSE, sFOL_OPER, sUsuario, sfechahr : String):String;



  end;

var
  AcuFaEl: TAcuFaEl;
  sArchivo:String;
  titrep : String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;
  Query1 : TQuery;


  procedure AcuFaEle(   sF_VntoIni, sF_VntoFin, sCVE_MONEDA, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO,
                        sFOL_ACUSE, sFOL_OPER, sUsuario, sfechahr : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);



implementation

{$R *.DFM}

procedure AcuFaEle(  sF_VntoIni, sF_VntoFin, sCVE_MONEDA, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO,
                     sFOL_ACUSE, sFOL_OPER, sUsuario, sfechahr : String;
                     pPreview : Boolean;
                     pApli    : TInterApli);

var
    AcuFaEl   : TAcuFaEl;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    AcuFaEl:= TAcuFaEl.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, AcuFaEl);
    Apli := pApli;
      Try
        vgFechaHoy  := pAPli.DameFechaEmpresa;

        AcuFaEl.qyAcuFaEl.DatabaseName := pApli.DataBaseName;
        AcuFaEl.qyAcuFaEl.SessionName  := pApli.SessionName;

        AcuFaEl.qyAcuFaEl.Active:=False;

        AcuFaEl.qyAcuFaEl.SQL.Text:= AcuFaEl.FormaQuery(sF_VntoIni, sF_VntoFin,sCVE_MONEDA, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO,
                                                        sFOL_ACUSE, sFOL_OPER,sUsuario, sfechahr);


        AcuFaEl.qyAcuFaEl.SQL.SaveToFile('c:\AcuFaEle.txt');
        AcuFaEl.qyAcuFaEl.Active:=True;

        AcuFaEl.QRUsuario.Caption := sUsuario;
        AcuFaEl.QRHoraFech.Caption := sfechahr;

        If pPreview Then
            AcuFaEl.Preview
        Else
            AcuFaEl.Print;
     Finally
      If Trim(sArchivo)<>'' Then Begin
         CloseFile(F);
      End;
      AcuFaEl.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

function TAcuFaEl.FormaQuery(sF_VntoIni, sF_VntoFin, sCVE_MONEDA, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO,
                             sFOL_ACUSE, sFOL_OPER, sUsuario, sfechahr : String):String;
Var
    sSQL : String;

begin

      sSQL:= '   SELECT his.id_epo as emisor, (select NOMBRE from persona where id_persona = his.ID_EPO and sit_persona = ''AC'') as nom_emisor,'+ coCRLF+
  	     '	        rf.id_persona AS proveedor, crf.nombre_pyme as nom_provedor,'+ coCRLF+
	     '	        his.cve_fnd_ent_des, his.id_documento, his.fol_acuse,'+ coCRLF+
             '          his.fol_acuse_oper, his.f_alta, his.f_vencimiento,'+ coCRLF+
             '          (trunc(his.f_vencimiento) - trunc(his.f_alta)) as plazo,'+ coCRLF+
             '          crf.cve_moneda, decode(crf.cve_moneda,1,''PESOS'',''DOLARES'') as desc_moneda,'+ coCRLF+
             '          his.imp_nominal,'+ coCRLF+
             '          his.imp_aforado, his.imp_interes, his.imp_comision, his.tasa_base,'+ coCRLF+
             '          his.sobretasa, his.cve_usu_modifica, his.tx_leyenda_acept'+ coCRLF+
             '     FROM cr_fe_hist_docto his, cr_fe_documento crf, rfc rf, persona per'+ coCRLF+
             '    WHERE 1 = 1'+ coCRLF+
             '      AND crf.id_epo = his.id_epo'+ coCRLF+
             '      AND crf.id_documento = his.id_documento'+ coCRLF+
             '      AND crf.fol_acuse = his.fol_acuse'+ coCRLF+
             '      AND rf.siglas_rfc ||''''|| rf.f_rfc ||''''|| rf.homoclave_rfc = crf.rfc_pyme'+ coCRLF+
             '      AND per.id_persona = rf.id_persona'+ coCRLF+
             '      AND per.sit_persona = ''AC'''+ coCRLF;

          if Trim(sCVE_MONEDA) <> '' then
          begin
           if Trim(sCVE_MONEDA) = '484' then
           sSQL := sSQL +
             '      AND crf.cve_moneda = 1'+ coCRLF
           else
           sSQL := sSQL +
             '      AND crf.cve_moneda = 2'+ coCRLF
          end;

          if Trim(sID_EMISOR) <> '' then
           sSQL := sSQL +
             '     AND his.id_epo = '+ sID_EMISOR + coCRLF;

          if Trim(sID_PROVEEDOR) <> '' then
           sSQL := sSQL +
             '     and rf.id_persona = '+ sID_PROVEEDOR + coCRLF;


          if Trim(sDOCUMENTO) <> '' then
           sSQL := sSQL +
             '     and his.id_documento = '''+ sDOCUMENTO + ''''+ coCRLF;

          if Trim(sFOL_ACUSE) <> '' then
           sSQL := sSQL +
             '     and his.fol_acuse = '''+ sFOL_ACUSE + ''''+ coCRLF;


          if Trim(sFOL_OPER) <> '' then
           sSQL := sSQL +
             '     AND his.fol_acuse_oper = '''+ sFOL_OPER + ''''+ coCRLF;

          if Trim(sF_VntoIni) <> '' then
           sSQL := sSQL +
             '     AND his.F_ALTA between '+SQLFecha(StrToDate(sF_VntoIni))+' and '+SQLFecha(StrToDate(sF_VntoFin))+ coCRLF;


          sSQL := sSQL +

             '   ORDER BY 6, 1, 3, 9';


         Query1 :=  GetSQLQuery(sSQL, Apli.DataBaseName, Apli.SessionName, True );

            if Query1 = nil then
            Showmessage('  ATENCIÓN: ¡No existen datos con los criterios de búsqueda utilizados!');

    Result:= sSQL;

end;


procedure TAcuFaEl.QRFooterDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyAcuFaEl.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         CloseFile(F);
      End;
   End;
end;


end.

