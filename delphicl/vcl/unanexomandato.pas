unit UnAnexoMandato;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo,
    IntProemioICB;  { Pantalla de Impresion del Proemio ICB }

type
  TRepAnexoMandato = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qrlPiePagina: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape2: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrlNomEmp: TQRLabel;
    QRMacvMemo1: TQRMacvMemo;
    DetailBand1: TQRBand;
    qrmNomRepresenta: TQRMemo;
    qrlContratoFecha: TQRLabel;
    procedure RepAnexoMandatoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
{
  public
      Contrato  : String;
      Fecha     : String;
      Hora      : String;
      Represen  : String;
      Leyenda2  : String;
      NombrePersona : String;
}
  end;


var
  RepAnexoMandato : TRepAnexoMandato;

Procedure Execute_AnexoMandato(Padre: TProemioICB; pPreview: Boolean);


Implementation

uses
  UnSql2,         { Funciones para Base de Datos de Interacciones }
  unGene;         { Funciones Generales de Interacciones }

{$R *.DFM}


Procedure Execute_AnexoMandato(Padre: TProemioICB; pPreview: Boolean);
Var mandato: TRepAnexoMandato;
    bProspecto: String;
Begin
  mandato:= TRepAnexoMandato.Create(nil);
  Try
    { Determina si el contrato es de un prospecto }
    GetSQLStr(' Select PkgCorporativo.BProspecto(' + Padre.Contrato.Id_Contrato.AsString  + ') B_Prospecto ' +
              ' From dual ', Padre.DataBaseName, Padre.SessionName, 'B_Prospecto', bProspecto, False);

    With mandato do
    Begin
{
      NombrePersona:= Padre.Contrato.TitNombre.AsString;
      If bProspecto  = 'V' Then
      Begin
        Contrato:= '_____________________________________________';
        Fecha:= '___________________________________' + '.';
      end
      else
      Begin
        Contrato:= Padre.contrato.Id_Contrato.asString;
        Fecha:= UpperCase(FmtFecha(Padre.Contrato.F_Alta.AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';
      end;
      //Hora     :=edHora.text;
      Represen:= Padre.Cliente.AsString;
      Leyenda2:= Padre.TextoPiePagina.AsString;
}

      { Inicialización de Controles }
      qrmNomRepresenta.Lines.Clear;
      qrmNomRepresenta.Lines.Add(Padre.Cliente.AsString);
      qrlPiePagina.Caption:= Padre.TextoPiePagina.AsString;
      qrlNomEmp.Caption:= 'y ' + Padre.Contrato.TitNombre.AsString + ',';
      If bProspecto  = 'V' Then
        qrlContratoFecha.Caption:= 'con número  _____________________________________________  de fecha  ' +
          '___________________________________.'
      else
        qrlContratoFecha.Caption:= 'con número  ' + Padre.contrato.Id_Contrato.asString + '  de fecha  ' +
          UpperCase(FmtFecha(Padre.Contrato.F_Alta.AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';



      if pPreview then Preview
      else Print;


{
          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            qrMandato.NombrePersona:=dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else qrMandato.NombrePersona:=dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;
          qrMandato.Contrato:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
          If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'V' Then
            qrMandato.Fecha:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString + '.'
          else qrMandato.Fecha:= UpperCase(FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';
          qrMandato.Hora     :=edHora.text;
          qrMandato.Represen :=cbRepresen.text;
          qrMandato.Leyenda2 :=edLeyenda2.text;
          if chbOpc7.checked  then ImprimeReporte(qrMandato,pImprimir);
}
    end;

  Finally
    mandato.Free; mandato:= nil;
  end;
end;


procedure TRepAnexoMandato.RepAnexoMandatoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
{
   qrmNomRepresenta.Lines.Clear;
   qrmNomRepresenta.Lines.Add(Represen);
   qrlPiePagina.Caption:= Leyenda2;
   qrlNomEmp.Caption:= 'Y ' + NombrePersona + ',';
   qrlContratoFecha.Caption:= 'CON NÚMERO  ' + Contrato + '  DE FECHA  ' + Fecha;
}
end;



end.
