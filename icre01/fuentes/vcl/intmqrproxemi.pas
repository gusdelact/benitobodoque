unit IntMQrProxEmi;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, QRExport;
type
  TQrProxEmi = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PFooterEmisor: TQRBand;
    QRGroupEmisor: TQRGroup;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel23: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    qyProxEmi: TQuery;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText40: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText25: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel24: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText39: TQRDBText;
    QRShape1: TQRShape;
    QRExcelFilter1: TQRExcelFilter;
  private
  public
    Function FormaQuery(sEmisor:String; sProveedor:String):String;
  end;

var
  QrProxEmi: TQrProxEmi;

Procedure RepProxEmi(   sEmisor:String;
                        sProveedor: String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepProxEmi( sEmisor:String;
                      sProveedor: String;
                      pAPli     : TInterApli;
                      pPreview  : Boolean);
Var
    QrProxEmi: TQrProxEmi;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    VLTitulo := '';
    QrProxEmi:=TQrProxEmi.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrProxEmi);
    Try

        QrProxEmi.QRInterEncabezado1.Apli:=pApli;
        QrProxEmi.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrProxEmi.QRInterEncabezado1.NomReporte:= 'IntMQrProxEmi';
        QrProxEmi.QRInterEncabezado1.Titulo1:='Relación de Proveedores por Emisor';

        If (Trim(sEmisor)<>'') Then
            VLTitulo := VLTitulo + ' Por Emisor';
        If (Trim(sProveedor)<>'') Then
            VLTitulo := VLTitulo + ' Por Prov.';

        QrProxEmi.QRInterEncabezado1.Titulo2 := VLTitulo;

        QrProxEmi.qyProxEmi.DatabaseName := pApli.DataBaseName;
        QrProxEmi.qyProxEmi.SessionName := pApli.SessionName;
        QrProxEmi.qyProxEmi.Active:=False;
        QrProxEmi.qyProxEmi.SQL.Text:= QrProxEmi.FormaQuery(sEmisor,sProveedor);
        QrProxEmi.qyProxEmi.Active:=False;
        QrProxEmi.qyProxEmi.Active:=True;

        If pPreview Then
            QrProxEmi.Preview
        Else
            QrProxEmi.Print;
    Finally
        QrProxEmi.free;
    End;
End;

Function TQrProxEmi.FormaQuery(  sEmisor:String; sProveedor:String):String;
Var
    sSQL:String;
    
Begin
    sSQL:=  ' SELECT '+
            ' CEP.ID_PROVEEDOR, '+
            ' CEP.ID_EMISOR, '+
            ' CEP.ID_PROMOTOR, '+
            ' CEP.SIT_EMISOR_PROV, '+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            ' CP.ID_PROV_NAFINSA, '+
            ' CP.ID_PROV_EXTERNO AS ID_PROV_NAFINSA, '+
{/ROIM}
//            ' CP.CUENTA_BANCO, '+
            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(CP.ID_ACREDITADO,NULL,NULL,''PR'',''AD'',''AB''),1,9) CUENTA_BANCO, '+
            ' PP.NOMBRE NOM_PROVEEDOR, '+
            ' PP.TELEF_CASA, '+
            ' PP.TELEF_OFICINA, '+
            ' PP.TELEF_FAX, '+
            ' DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+
            ' PPR.NOMBRE NOM_PROMOTOR '+

            ' FROM '+
            ' CR_EMISOR_PROV CEP, '+
            ' CR_PROVEEDOR  CP, '+
            ' PERSONA       PP, '+
            ' PERSONA_FISICA  PE, '+
            ' PERSONA       PCE, '+
            ' PERSONA       PPR '+

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            ' WHERE CP.ID_ACREDITADO = CEP.ID_PROVEEDOR '+
            ' WHERE CP.CVE_FND_ENT_DES = CEP.CVE_FND_ENT_DES ' +
            ' AND   CP.ID_ACREDITADO = CEP.ID_PROVEEDOR '+
{/ROIM}
            ' AND   PP.ID_PERSONA = CEP.ID_PROVEEDOR '+
            ' AND   PE.ID_PERSONA(+)= CEP.ID_EMISOR '+
            ' AND   PCE.ID_PERSONA = CEP.ID_EMISOR '+
            ' AND   PPR.ID_PERSONA = CEP.ID_PROMOTOR ';

    If (Trim(sEmisor)<>'') Then
        sSQL:= sSQL + ' AND   CEP.ID_EMISOR  ='+sEmisor;

    If (Trim(sProveedor)<>'') Then
        sSQL:= sSQL + ' AND   CEP.ID_PROVEEDOR  ='+sProveedor;

    sSQL:= sSQL + ' ORDER BY NOM_EMISOR,ID_PROMOTOR, NOM_PROVEEDOR ';
    Result:= sSQL;
End;
End.
