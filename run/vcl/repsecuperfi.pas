// Sistema         : Reporte Perfiles
// Fecha de Inicio : Agosto de 1998
// Función forma   : Reporte Perfiles
// Desarrollo por  : Alejandro Villalobos Bahena
// Comentarios     :

unit RepSecuPerfi;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TQrSecuPerfi = class(TQuickRep)
    qPerfil: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public
   Todos: Boolean;
  end;

Procedure Execute_RepSecuPerfi(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);

implementation

{$R *.DFM}
Procedure Execute_RepSecuPerfi(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);
var Reporte: TQrSecuPerfi;
    SQL,SQLif:String;
begin
   Reporte := TQrSecuPerfi.Create(Padre);
   Reporte.Todos:=Todos;
   Try
      Reporte.QPerfil.DataBaseName := Padre.DataBaseName;
      Reporte.QPerfil.SessionName := Padre.SessionName;
      if (not Todos) and (Length(Padre.FieldByName('ID_GPO_ACCESO').AsString) > 0) then  SQLif := 'WHERE ID_GPO_ACCESO ='+ Padre.FieldByName('ID_GPO_ACCESO').AsSql;
      SQL:= 'SELECT * '+
            'FROM SECU_PERFIL '+
             SQLif+
            'ORDER BY ID_GPO_ACCESO';
      Reporte.qPerfil.SQL.Clear;
      Reporte.qPerfil.SQL.Add(SQL);
      Reporte.QPerfil.Open;
      Reporte.QRMacvHeader1.Apli := Padre.Apli;
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
