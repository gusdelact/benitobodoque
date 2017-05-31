//------------------------------------------------------------------------------
// Función    : Reporte Solicitud de Relacion (Chequera - Contrato)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 11 de Abril del 2011
//------------------------------------------------------------------------------
unit RepChCteCtoSol;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TwRepChCteCtoSol = class(TQuickRep)
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

  procedure Execute_RepChCteCtoSol(ShowPreview: Boolean; Padre: TInterFrame; IdPersona: String);

implementation
   {$R *.DFM}

procedure Execute_RepChCteCtoSol(ShowPreview: Boolean; Padre: TInterFrame; IdPersona: String);
var
   Reporte: TwRepChCteCtoSol;
begin
   Reporte := TwRepChCteCtoSol.Create(Padre);
   with Reporte do
      try
         Query1.Close;
         Query1.DataBaseName := Padre.DataBaseName;
         Query1.SessionName  := Padre.SessionName;
         Query1.SQL.Clear;
         Query1.SQL.Append('Select Chequera_Cte.*, '
                         + '       Persona.Nombre, '
                         + '       Persona_moral.Nom_razon_social Intermediario, '
                         + '       Pza_Compensacion.Nom_plaza '
                         + '  From Chequera_Cte, '
                         + '       Persona, '
                         + '       Persona_Moral, '
                         + '       Pza_Compensacion '
                         + ' Where Chequera_Cte.Id_persona   = ' + IdPersona
                         + '   and persona.Id_persona        = Chequera_Cte.Id_persona '
                         + '   and Persona_moral.id_persona  = Chequera_Cte.id_banco_chqra '
                         + '   and pza_compensacion.id_plaza = Chequera_cte.id_plaza '
                         + ' Order By Persona.Nombre, '
                         + '          Persona_moral.Nom_razon_social, '
                         + '          Pza_Compensacion.Nom_plaza');
         Query1.Open;
         QRMacvHeader1.Apli := Padre.Apli;
         if ShowPreview then
            Preview
         else
            Print;
      finally
         Free;
      end;
end;
end.
