// Sistema         : Reporte de Grupo de Accesos
// Fecha de Inicio : Agosto de 1998
// Función forma   : Reporte de Grupo de Accesos
// Desarrollo por  : Alejandro Villalobos Bahena
// Comentarios     :

unit RepSecIndAdi;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TQrSecInAdi = class(TQuickRep)
    qIndAdic: TQuery;
    qrbDetail: TQRBand;
    qrbGroupFooter: TQRBand;
    qrbPageHeader: TQRBand;
    qrmHeader: TQRMacvHeader;
    qrgGroup: TQRGroup;
    qrtCve_Aplicacion: TQRDBText;
    qrtNom_Aplicacion: TQRDBText;
    qrbColumnHeader: TQRBand;
    qrtCve_Ind_Adic: TQRDBText;
    qrtDesc_Ind_Adic: TQRDBText;
    qIndAdicCVE_APLICACION: TStringField;
    qIndAdicNOM_APLICACION: TStringField;
    qIndAdicCVE_IND_ADIC: TStringField;
    qIndAdicDESC_IND_ADIC: TStringField;
    qrlClave: TQRLabel;
    qrlIndicador: TQRLabel;
    qrlAplicacion: TQRLabel;
    qrlNombre: TQRLabel;
    qrsLinea1: TQRShape;
    qrsLinea2: TQRShape;
    qrsLinea3: TQRShape;
  private

  public

  end;

  //ejecucion
Procedure Execute_RepSecInAdi(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);

implementation

{$R *.DFM}
Procedure Execute_RepSecInAdi(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);
var Reporte: TQrSecInAdi;
    SQL,SqlExt: String;
begin
   Reporte := TQrSecInAdi.Create(Padre);
   Try
      Reporte.qIndAdic.DataBaseName := Padre.DataBaseName;
      Reporte.qIndAdic.SessionName := Padre.SessionName;
      Reporte.qIndAdic.SQL.Clear;
      if Padre.Active and not Todos and (Length(Padre.FieldByname('CVE_APLICACION').AsString) > 0)
      then SqlExt:=' AND SECU_IND_ADICION.CVE_APLICACION = ' + Padre.FieldByname('CVE_APLICACION').AsSql
      else SqlExt:= ' ';
      SQL:= 'SELECT SECU_IND_ADICION.CVE_APLICACION,'
           +'       SECU_APLICACION.NOM_APLICACION,'
           +'       SECU_IND_ADICION.CVE_IND_ADIC,'
           +'       SECU_INDICADOR.DESC_IND_ADIC'
           +' FROM SECU_IND_ADICION, SECU_INDICADOR, SECU_APLICACION'
           +' WHERE SECU_IND_ADICION.CVE_IND_ADIC = SECU_INDICADOR.CVE_IND_ADIC'
           +' AND SECU_IND_ADICION.CVE_APLICACION = SECU_APLICACION.CVE_APLICACION'
            +SqlExt
           +' ORDER BY SECU_IND_ADICION.CVE_APLICACION,SECU_IND_ADICION.CVE_IND_ADIC';
      Reporte.qIndAdic.SQL.ADD(SQL);
      Reporte.qIndAdic.Open;
      Reporte.qrmHeader.Apli := Padre.Apli;
      if ShowPreview then
         begin
            Reporte.Preview;
         end
      else
         Reporte.Print;
      Finally
             Reporte.Free;
      end;
end;
































end.
