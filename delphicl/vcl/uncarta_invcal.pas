unit UnCarta_InvCal;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm, Dialogs, InterMemo,
    IntProemioICB, InterGri, IntHead;    { Pantalla de Seleccion de Parametros para Proemio ICB }

type
  TCarta_InvCal = class(TQuickRep)
    DetailConvenio: TQRBand;
    QRInterMemo2: TQRInterMemo;
    QRInterMemoContrato: TQRInterMemo;
    QRInterMemoParrafo1: TQRInterMemo;
    QRInterMemoParrafo2: TQRInterMemo;
    QRInterMemoParrafo3: TQRInterMemo;
    QRInterMemoAtte: TQRInterMemo;
    lblFecha: TQRLabel;
    lblElCliente: TQRLabel;
    QRInterMemo31: TQRInterMemo;
  private

  public

  end;

var
  Carta_InvCal: TCarta_InvCal;

Procedure Execute_Carta_InvCal(padre: TProemioICB; pPreview: Boolean);

implementation

{$R *.DFM}

Uses
  unGene;     { Funciones Generales de Interacciones }


Procedure Execute_Carta_InvCal(padre: TProemioICB; pPreview: Boolean);
Var proemio: TCarta_InvCal;
Begin
  proemio:= TCarta_InvCal.Create(nil);
  Try
    With proemio do
    Begin

      if (padre <> nil) and padre.Contrato.Active then
      begin
        {***********************************************************************
         Inicializacion de Controles especiales del Reporte
         **********************************************************************}
         lblFecha.Caption := FmtFecha(padre.Contrato.Apli.DameFechaEmpresa, 'México, Distrito Federal, a @D de @MMMM de @YYYY.');
         QRInterMemoContrato.SetParam(0, UpperCase(padre.Contrato.ID_Contrato.AsString));


        If padre.Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PF' Then
        Begin
                lblElCliente.Caption := padre.Contrato.TitNombre.AsString;
        end
        else
        Begin
                lblElCliente.Caption := UpperCase(padre.Cliente.AsString);
        end;

        If pPreview then
          Preview
        else Print;

      end
      else
        MessageDlg('Error al Identificar el Contrato ' + Padre.Contrato.Id_Contrato.AsString, mtError, [mbOK], 0);
    end;

  Finally
    proemio.Free; proemio:= nil;
  end;
end;

end.

