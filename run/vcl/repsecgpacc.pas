// Sistema         : Reporte de Grupo de Accesos
// Fecha de Inicio : Agosto de 1998
// Función forma   : Reporte de Grupo de Accesos
// Desarrollo por  : Alejandro Villalobos Bahena
// Comentarios     :

unit RepSecGpAcc;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TQrSecGpAcc = class(TQuickRep)
    qSecGPAcc: TQuery;
    qrbDetail: TQRBand;
    qrbPageHeader: TQRBand;
    qSecGPAccCVE_APLICACION: TStringField;
    qSecGPAccNOM_APLICACION: TStringField;
    qSecGPAccID_GPO_ACCESO: TFloatField;
    qSecGPAccB_BLOQUEADO: TStringField;
    qSecGPAccNOM_GPO_ACCESO: TStringField;
    qSecGPAccTX_DESC_GPO_AC: TMemoField;
    qrGGroup: TQRGroup;
    qrlAplicacion: TQRLabel;
    qrtCve_Aplicacion: TQRDBText;
    qrtNom_Aplicacion: TQRDBText;
    qrbColumnHeader: TQRBand;
    qrtId_Gpo_Acceso: TQRDBText;
    qrtNom_Gpo_Acceso: TQRDBText;
    qrTsino: TQRDBText;
    qrsLinea3: TQRShape;
    qrlClave: TQRLabel;
    qrlPerfil: TQRLabel;
    qrlBloqueado: TQRLabel;
    qrlNombre: TQRLabel;
    qrsLinea1: TQRShape;
    qrsLinea2: TQRShape;
    qrbGroupFooter: TQRBand;
    qSecGPAccSINO: TStringField;
    procedure qSecGPAccCalcFields(DataSet: TDataSet);
  private

  public

  end;

  //ejecucion
Procedure Execute_RepSecGpAcc(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);

implementation

{$R *.DFM}
Procedure Execute_RepSecGpAcc(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);
var Reporte: TQrSecGpAcc;
    SQL,ExSQL:String;

begin
   Reporte := TQrSecGpAcc.Create(Padre);
   Try
      Reporte.qSecGPAcc.DataBaseName := Padre.DataBaseName;
      Reporte.qSecGPAcc.SessionName := Padre.SessionName;
      Reporte.qSecGPAcc.SQL.Clear;

      if Padre.Active and not Todos and (Length(Padre.FieldByName('CVE_APLICACION').AsString) > 0)
         then ExSQL:='  AND  SECU_GPO_ACCESO.CVE_APLICACION ='+Padre.FieldByName('CVE_APLICACION').AsSQL
         else ExSQL:='';

      SQL:=' SELECT SECU_GPO_ACCESO.CVE_APLICACION, '
          +'  SECU_APLICACION.NOM_APLICACION, '
          +'  SECU_GPO_ACCESO.ID_GPO_ACCESO, '
          +'  SECU_GPO_ACCESO.B_BLOQUEADO, '
          +'  SECU_PERFIL.NOM_GPO_ACCESO, '
          +'  SECU_PERFIL.TX_DESC_GPO_AC '
          +' FROM SECU_GPO_ACCESO, SECU_PERFIL,SECU_APLICACION '
          +' WHERE SECU_GPO_ACCESO.ID_GPO_ACCESO = SECU_PERFIL.ID_GPO_ACCESO '
          +'  AND SECU_GPO_ACCESO.CVE_APLICACION = SECU_APLICACION.CVE_APLICACION '
          +ExSQL
          +' ORDER BY SECU_GPO_ACCESO.CVE_APLICACION,SECU_GPO_ACCESO.ID_GPO_ACCESO ';

      Reporte.qSecGPAcc.SQL.Add(SQL);
      Reporte.qSecGPAcc.Open;
      //Reporte.qrmhSecGpAcc.Apli := Padre.Apli;
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

procedure TQrSecGpAcc.qSecGPAccCalcFields(DataSet: TDataSet);
begin
     if qSecGPAcc.FieldByName('B_BLOQUEADO').AsString = 'V' then
          qSecGPAcc.FieldByName('SINO').AsString:= 'Si';
     if qSecGPAcc.FieldByName('B_BLOQUEADO').AsString = 'F' then
          qSecGPAcc.FieldByName('SINO').AsString:= 'No';
end;

end.
