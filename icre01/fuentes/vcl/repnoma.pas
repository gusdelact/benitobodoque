unit RepNomA;

interface          

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  IntQRPreview, InterApl;
                               
type
  TRepDNom = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qNomina: TQuery;
    QRInterEncabezado1: TQRInterEncabezado;
    bHEmpresa: TQRGroup;
    qNominaID_CREDITO: TFloatField;
    qNominaNUM_EMPLEADO: TFloatField;
    qNominaNBR_PERSONA: TStringField;
    qNominaIMP_CAPITAL: TFloatField;
    qNominaTOTAL: TFloatField;
    qNominaNOMBRE: TStringField;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    qNominaF_VENCIMIENTO: TDateTimeField;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qNominaIMP_INTERES: TFloatField;
    qNominaIMP_COMISION: TFloatField;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    lbCapitalV: TQRLabel;
    lbInteresV: TQRLabel;
    lbSegurosV: TQRLabel;
    lbTotalV: TQRLabel;
    QRDBText10: TQRDBText;
    qNominaCVE_PRODUCTO: TStringField;
    QRLabel17: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText18: TQRDBText;
    qNominaIMP_CAP_PAG: TFloatField;
    qNominaIMP_INT_PAG: TFloatField;
    qNominaIMP_IVA_INT_PAG: TFloatField;
    qNominaIMP_COM_PAG: TFloatField;
    qNominaIMP_IVA_COM_PAG: TFloatField;
    qNominaSIT_CAPITAL: TStringField;
    qNominaSIT_INTERES: TStringField;
    qNominaSIT_COMISION: TStringField;
    qNominaF_PAGO: TDateTimeField;
    qNominaIMP_INT_PAG_T: TFloatField;
    qNominaIMP_COM_PAG_T: TFloatField;
    qNominaIMP_PAG_T: TFloatField;
    qNominaDIF_CAP: TFloatField;
    qNominaDIF_INT: TFloatField;
    qNominaDIF_COM: TFloatField;
    qNominaDIF_TOT: TFloatField;
    qNominaSIT_CREDITO: TStringField;
    qNominaSIT_EMPLEADO: TStringField;
    qNominaID_PERSONA: TFloatField;
    qNominaNUM_PERIODO: TFloatField;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText19: TQRDBText;
    qNominaCHEQUERA: TStringField;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText27: TQRDBText;
    qNominaEMPRESA: TStringField;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    lbCapitalP: TQRLabel;
    lbInteresP: TQRLabel;
    lbSegurosP: TQRLabel;
    lbTotalP: TQRLabel;
    lbCapitalD: TQRLabel;
    lbInteresD: TQRLabel;
    lbSegurosD: TQRLabel;
    lbTotalD: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
      vgCapitalV,
      vgInteresV,
      vgSegurosV,
      vgCliente,
      vgTotalV ,
      vgCapitalP,
      vgInteresP,
      vgSegurosP,
      vgTotalP,
      vgCapitalD,
      vgInteresD,
      vgSegurosD,
      vgTotalD : Extended;



     RepDNom: TRepDNom;
     vlArchPol : TextFile;
  public
    vlArch    : String;

  end;

  Procedure RepNomina( sQuery, sFecha, sEmpresa:string;
                       pAPli     : TInterApli);

implementation

{$R *.DFM}

Procedure RepNomina( sQuery, sFecha, sEmpresa:string;
                     pAPli     : TInterApli);

var  RepDNom   : TRepDNom;
     Preview     : TIntQRPreview;
     Apli : TInterApli;     
begin
    RepDNom:=TRepDNom.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, RepDNom);
    Apli := pApli;

    try
      RepDNom.QRInterEncabezado1.Titulo1 := 'Reporte de Vencimientos de Créditos ABCD al '+sFecha;
      RepDNom.QRInterEncabezado1.Titulo2 := copy(sEmpresa, 1, 55);

      RepDNom.qNomina.DatabaseName := Apli.DataBaseName;
      RepDNom.qNomina.SessionName  := Apli.SessionName;
      RepDNom.qNomina.close;
      RepDNom.qNomina.sql.clear;
      RepDNom.qNomina.SQL.Text:=sQuery;
      //qNomina.sql.add(sQuery);
      RepDNom.qNomina.SQL.SaveToFile('c:\IntCrCoABRep.SQL');
      //  qNomina.open;

      RepDNom.qNomina.Active := True;
      //QRInterEncabezado1.Apli := Objeto.Apli;
      RepDNom.Preview;

    finally
      RepDNom.Free;
    end;  
end;


procedure TRepDNom.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgCapitalV := vgCapitalV + qNomina.fieldbyName('IMP_CAPITAL').AsFloat;
  vgInteresV := vgInteresV + qNomina.fieldbyName('IMP_INTERES').AsFloat;
  vgSegurosV := vgSegurosV + qNomina.fieldbyName('IMP_COMISION').AsFloat;
  vgTotalV   := vgTotalV + qNomina.fieldbyName('TOTAL').AsFloat;

  vgCapitalP := vgCapitalP + qNomina.fieldbyName('IMP_CAP_PAG').AsFloat;
  vgInteresP := vgInteresP + qNomina.fieldbyName('IMP_INT_PAG').AsFloat;
  vgSegurosP := vgSegurosP + qNomina.fieldbyName('IMP_COM_PAG').AsFloat;
  vgTotalP   := vgTotalP + qNomina.fieldbyName('IMP_PAG_T').AsFloat;

  vgCapitalD := vgCapitalD + qNomina.fieldbyName('DIF_CAP').AsFloat;
  vgInteresD := vgInteresD + qNomina.fieldbyName('DIF_INT').AsFloat;
  vgSegurosD := vgSegurosD + qNomina.fieldbyName('DIF_COM').AsFloat;
  vgTotalD   := vgTotalD + qNomina.fieldbyName('DIF_TOT').AsFloat;

  vgCliente := vgCliente + qNomina.fieldbyName('TOTAL').AsFloat;

  if vlArch <> '' then
    writeln(vlArchPol, '15020100203201@' +
                       qNomina.fieldbyName('F_VENCIMIENTO').AsString + '@' +
                       'C@' +
                       FloatToStr(qNomina.FieldByName('IMP_CAPITAL').AsFloat) + '@' +
                       FloatToStr(qNomina.FieldByName('IMP_INTERES').AsFloat) + '@' +
                       FloatToStr(qNomina.FieldByName('IMP_COMISION').AsFloat)+ '@' +
                       FloatToStr(qNomina.FieldByName('IMP_CAPITAL_PAG').AsFloat) + '@' +
                       FloatToStr(qNomina.FieldByName('IMP_INTERES_PAG').AsFloat) + '@' +
                       FloatToStr(qNomina.FieldByName('IMP_COMISION_PAG').AsFloat)+ '@' +
                       FloatToStr(qNomina.FieldByName('DIF_IMP_CAPITAL').AsFloat) + '@' +
                       FloatToStr(qNomina.FieldByName('DIF_IMP_INTERES').AsFloat) + '@' +
                       FloatToStr(qNomina.FieldByName('DIF_IMP_COMISION').AsFloat));

end;

procedure TRepDNom.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgCliente := 0;
end;

procedure TRepDNom.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 // lbClienteCaption := Format('%14.2n',[vgCliente]);
end;

procedure TRepDNom.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vgCapitalV := 0;
  vgInteresV := 0;
  vgSegurosV := 0;
  vgTotalV   := 0;

  vgCapitalP := 0;
  vgInteresP := 0;
  vgSegurosP := 0;
  vgTotalP   := 0;

  vgCapitalD := 0;
  vgInteresD := 0;
  vgSegurosD := 0;
  vgTotalD   := 0;

  if vlArch <> '' then
  begin
    AssignFile(vlArchPol, vlArch);
    Rewrite(vlArchPol);
  end;
end;

procedure TRepDNom.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lbCapitalV.Caption := Format('%14.2n',[vgCapitalV]);
  lbInteresV.Caption := Format('%14.2n',[vgInteresV]);
  lbSegurosV.Caption := Format('%14.2n',[vgSegurosV]);
  lbTotalV.Caption := Format('%14.2n',[vgTotalV]);

  lbCapitalP.Caption := Format('%14.2n',[vgCapitalP]);
  lbInteresP.Caption := Format('%14.2n',[vgInteresP]);
  lbSegurosP.Caption := Format('%14.2n',[vgSegurosP]);
  lbTotalP.Caption := Format('%14.2n',[vgTotalP]);

  lbCapitalD.Caption := Format('%14.2n',[vgCapitalD]);
  lbInteresD.Caption := Format('%14.2n',[vgInteresD]);
  lbSegurosD.Caption := Format('%14.2n',[vgSegurosD]);
  lbTotalD.Caption := Format('%14.2n',[vgTotalD]);

  if vlArch <> '' then
  begin
    writeln(vlArchPol, '24080000026001@' +
                       'NOMINA ' + qNomina.fieldbyName('F_VENCIMIENTO').AsString + ' ABCD @' +
                       'D@' +
                       FloatToStr(vgCapitalV) + '@' +
                       FloatToStr(vgInteresV) + '@' +
                       FloatToStr(vgSegurosV) + '@' +
                       FloatToStr(vgCapitalP) + '@' +
                       FloatToStr(vgInteresP) + '@' +
                       FloatToStr(vgSegurosP) + '@' +
                       FloatToStr(vgCapitalD) + '@' +
                       FloatToStr(vgInteresD) + '@' +
                       FloatToStr(vgSegurosD));
    CloseFile(vlArchPol);
  end;
end;



end.
