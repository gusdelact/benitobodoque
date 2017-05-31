unit UnRpConv;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables,Dialogs;

type
  TrpConv = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRInterMemo2: TQRInterMemo;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRInterMemo3: TQRInterMemo;
    QRLabel7: TQRLabel;
    QRInterMemo4: TQRInterMemo;
    QRInterMemo5: TQRInterMemo;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRInterMemo9: TQRInterMemo;
    QRInterMemo10: TQRInterMemo;
    QRInterMemo6: TQRInterMemo;
    QRInterMemo7: TQRInterMemo;
    QRInterMemo8: TQRInterMemo;
    QRInterMemo11: TQRInterMemo;
    QRInterMemo12: TQRInterMemo;
    QRInterMemo13: TQRInterMemo;
    QryCtto: TQuery;
    QryCttoID_CONTRATO: TFloatField;
    QryCttoID_TITULAR: TFloatField;
    QryCttoNOMBRE: TStringField;
    QryCttoFECHA: TStringField;
    QryCttoCORREO: TStringField;
    QRChildBand1: TQRChildBand;
    QRInterMemo21: TQRInterMemo;
    QRInterMemo22: TQRInterMemo;
    QRInterMemo23: TQRInterMemo;
    QRInterMemo24: TQRInterMemo;
    QRInterMemo25: TQRInterMemo;
    QRInterMemo26: TQRInterMemo;
    QRInterMemo27: TQRInterMemo;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRInterMemo14: TQRInterMemo;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    function    Reporte:Boolean; //override;
  private

  public

  end;

var
  rpConv: TrpConv;

implementation

{$R *.DFM}

procedure TrpConv.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    //QRInterMemo7.Parametro.Strings[0]:= 'wlopez@interacciones.com';
    ////QRInterMemo7.Parametro.Strings[0]:= QryCtto.FieldByName('CORREO').AsString;
    {MakeIntQRPreview;

    Rp := TrpConv.Create(Self);
    Rp.QryCtto.Active := False;
    Rp.QryCtto.DatabaseName := DataBaseName;
    Rp.QryCtto.SessionName  := SessionName;
    Rp.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrTOInt(Contrato.Id_Contrato.asString); //Objeto.CLAVE.AsInteger;  //100034462;
    Rp.QryCtto.Active := True;
    //Rp.detailRepresentanteICB.Items.Text:= UpperCase(Representantes.GetRepresentantes('', chr(VK_RETURN)));

    Rp.QRLabel41.Caption := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));
    Rp.QRLabel42.Caption := Rp.QryCtto.FieldByName('NOMBRE').AsString;
    }

    ////QRLabel41.Caption := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));
    ///QRLabel42.Caption := Rp.QryCtto.FieldByName('NOMBRE').AsString;

end;

procedure TrpConv.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
{   QRMemo1.Caption:='';
   QRMemo1.Transparent:=true;
   QRMemo2.Caption:='';
   QRMemo2.Transparent:=true;
   QRMemo3.Caption:='';
   QRMemo3.Transparent:=true;  }
end;
function TrpConv.Reporte:Boolean;
begin
  ShowMessage('ip...');
  //Impresion;
end;


end.
