unit UnConvenio_OpInt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm, Dialogs, InterMemo,
    IntProemioICB, InterGri, IntHead;    { Pantalla de Seleccion de Parametros para Proemio ICB }

type
  TConvenio_OpInt = class(TQuickRep)
    SummaryBand: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRInterMemo14: TQRInterMemo;
    QRInterMemo15: TQRInterMemo;
    DetailConvenio: TQRBand;
    QRInterMemo2: TQRInterMemo;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRInterMemo1: TQRInterMemo;
    QRLabel1: TQRLabel;
    QRInterMemo3: TQRInterMemo;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBandConvenio1: TQRChildBand;
    QRInterMemo6: TQRInterMemo;
    QRInterMemo7: TQRInterMemo;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRInterMemo8: TQRInterMemo;
    QRLabel15: TQRLabel;
    QRInterMemo9: TQRInterMemo;
    QRInterMemo10: TQRInterMemo;
    ChildBandConvenio2: TQRChildBand;
    QRInterMemo13: TQRInterMemo;
    QRInterMemo16: TQRInterMemo;
    QRInterMemo17: TQRInterMemo;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    QRMemo15: TQRMemo;
    QRMemo16: TQRMemo;
    QRMemo17: TQRMemo;
    QRMemo18: TQRMemo;
    QRMemo19: TQRMemo;
    QRMemo20: TQRMemo;
    QRMemo21: TQRMemo;
    QRMemo22: TQRMemo;
    QRMemo23: TQRMemo;
    QRMemo24: TQRMemo;
    QRMemo25: TQRMemo;
    QRMemo26: TQRMemo;
    QRInterMemo28: TQRInterMemo;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRInterMemo30: TQRInterMemo;
    QRInterMemo31: TQRInterMemo;
    QRInterMemo32: TQRInterMemo;
    ChildBandConvenio3: TQRChildBand;
    QRMemo27: TQRMemo;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    lblFecha: TQRLabel;
    QRInterMemo12: TQRInterMemo;
    QRInterMemo5: TQRInterMemo;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRInterMemo4: TQRInterMemo;
    QRInterMemo11: TQRInterMemo;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRInterMemo18: TQRInterMemo;
    QRInterMemo19: TQRInterMemo;
    QRLabel32: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRInterMemo22: TQRInterMemo;
    QRInterMemo33: TQRInterMemo;
    QRLabel43: TQRLabel;
    QRInterMemo29: TQRInterMemo;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRInterMemo20: TQRInterMemo;
    QRInterMemo21: TQRInterMemo;

  private

  public

  end;

var
  Convenio_OpInt: TConvenio_OpInt;

Procedure Execute_Convenio_OpInt(padre: TProemioICB; pPreview: Boolean);

implementation

{$R *.DFM}

Uses
  unGene;     { Funciones Generales de Interacciones }


Procedure Execute_Convenio_OpInt(padre: TProemioICB; pPreview: Boolean);
Var proemio: TConvenio_OpInt;
Begin
  proemio:= TConvenio_OpInt.Create(nil);
  Try
    With proemio do
    Begin

      if (padre <> nil) and padre.Contrato.Active then
      begin
        {***********************************************************************
         Inicializacion de Controles especiales del Reporte
         **********************************************************************}
        QRInterMemo2.SetParam(0, UpperCase(padre.Representantes.GetRepresentantes('', ', ')));
        QRLabel38.Caption := padre.Contrato.TitNombre.AsString;
        QRLabel39.Caption := padre.Contrato.ID_Contrato.AsString;


        QRLabel40.Caption := FmtFecha(padre.Contrato.Apli.DameFechaEmpresa, '@DD-@MMM-@YYYY');
        lblFecha.Caption:= FmtFecha(padre.Contrato.Apli.DameFechaEmpresa, 'El presente Convenio Complementario se firma en la Ciudad de México, Distrito Federal, a los @D días del mes de @MMMM del año @YYYY.');

        QRLabel41.Caption := UpperCase(padre.Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));

        If padre.Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PF' Then
        Begin
                //QRLabel38.Caption := padre.Contrato.TitNombre.AsString;
                QRLabel42.Caption := padre.Contrato.TitNombre.AsString;
        end
        else
        Begin
                //QRLabel38.Caption := UpperCase(padre.Cliente.AsString);
                QRLabel42.Caption := UpperCase(padre.Cliente.AsString);
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

