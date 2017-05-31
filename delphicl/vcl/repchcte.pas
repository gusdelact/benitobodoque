// Sistema         : Reporte de Clase de Poblaciones
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Poblaciones
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepChCte;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteCheqCte = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
  private
  public
  end;

Procedure Execute_RepCheqCte(ShowPreview:Boolean; Padre:TInterFrame);
Procedure Execute_RepCheqPer(ShowPreview:Boolean; Padre:TInterFrame; idPersona: String);

implementation

{$R *.DFM}

Procedure Execute_RepCheqCte(ShowPreview:Boolean; Padre:TInterFrame);
var
 Reporte: TReporteCheqCte;
begin
  Reporte:=TReporteCheqCte.Create(Padre);
  Try
    Reporte.Query1.DataBaseName := Padre.DataBaseName;
    Reporte.Query1.SessionName  := Padre.SessionName;
    Reporte.Query1.Open;
    Reporte.QRMacvHeader1.Apli  := Padre.Apli;
    if ShowPreview then begin
       Reporte.Preview;
    end
    else
       Reporte.Print;
  Finally
    Reporte.Free;
  end;
end;

Procedure Execute_RepCheqPer(ShowPreview:Boolean; Padre:TInterFrame; idPersona: String);
var
 Reporte: TReporteCheqCte;
begin
  Reporte:=TReporteCheqCte.Create(Padre);
  Try
    Reporte.Query1.Close;
    Reporte.Query1.DataBaseName := Padre.DataBaseName;
    Reporte.Query1.SessionName  := Padre.SessionName;
    Reporte.Query1.SQL.Clear;
    Reporte.Query1.SQL.Append('Select '+
                              ' Chequera_Cte.*, '+
                              ' Persona.Nombre, '+
                              ' Persona_moral.Nom_razon_social Intermediario, '+
                              ' Pza_Compensacion.Nom_plaza '+
                              'From '+
                              ' Chequera_Cte, '+
                              ' Persona, '+
                              ' Persona_Moral, '+
                              ' Pza_Compensacion '+
                              'Where '+
                              ' Chequera_Cte.Id_persona = '+idPersona+' and '+
                              ' persona.Id_persona = Chequera_Cte.Id_persona and '+
                              ' Persona_moral.id_persona = Chequera_Cte.id_banco_chqra and '+
                              ' pza_compensacion.id_plaza = Chequera_cte.id_plaza '+
                              'Order By '+
                              ' Persona.Nombre, '+
                              ' Persona_moral.Nom_razon_social, '+
                              ' Pza_Compensacion.Nom_plaza');
    Reporte.Query1.Open;
    Reporte.QRMacvHeader1.Apli  := Padre.Apli;
    if ShowPreview then begin
       Reporte.Preview;
    end
    else
       Reporte.Print;
  Finally
    Reporte.Free;
  end;
end;

end.
