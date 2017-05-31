unit UnQRRechTes;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,  StdCtrls,
     ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl, UnConDV;

type
  TQRRechTes = class(TQuickRep)
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qRechazo: TQuery;
    qRechazoid_contrato: TFloatField;
    qRechazoNOMBRE: TStringField;
    qRechazoOPERACION: TStringField;
    qRechazoID_GPO_TRANS: TFloatField;
    qRechazoIMP_TRANS: TFloatField;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlDescProc: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    procedure qRechazoCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  QRRechTes: TQRRechTes;
  VIdContrato : Double;
  vIdGpoTrans : Double;
  vNombre  : String;
  vOperacion :String;
  vImpTrans : Double;


procedure EXECUTE_RECHAZOTESO(pPreview : Boolean;
                             pIdGpoTrans : Double;
                             pIdContrato : Double;
                             pNombre  : String;
                             pOperacion :String;
                             pImpTrans : Double;
                             pApli : TInterApli;
                             pBInterFin:Boolean;
                             pDescProceso:String);

implementation

{$R *.DFM}


procedure EXECUTE_RECHAZOTESO(pPreview : Boolean;
                              pIdGpoTrans : Double;
                              pIdContrato : Double;
                              pNombre  : String;
                              pOperacion :String;
                              pImpTrans : Double;
                              pApli : TInterApli;
                              pBInterFin:Boolean;
                              pDescProceso:String);
Var   QRRechTes: TQRRechTes;
begin QRRechTes:=TQRRechTes.Create(Nil);
      vIdGpoTrans:=pIdGpoTrans;
      vIdContrato:=pIdContrato;
      vNombre    :=pNombre;
      vOperacion :=pOperacion;
      vImpTrans  :=pImpTrans;

      try QRRechTes.QRInterEncabezado1.Apli:=pApli;
          if pBInterFin
          then begin
                 QRRechTes.QRInterEncabezado1.Titulo1:='Aplicación de Ingresos y Egresos';
                 QRRechTes.QRInterEncabezado1.Apli.IdEmpresa:=cEmpifs;
               end
          else begin
                 QRRechTes.QRInterEncabezado1.Titulo1:='Aplicación de Ingresos y Egresos por SPEUA / SIAC';
                 QRRechTes.QRInterEncabezado1.Apli.IdEmpresa:=cEmpBanco;
               end;
          QRRechTes.qRechazo.DatabaseName:=pApli.DataBaseName;
          QRRechTes.qRechazo.SessionName :=pApli.SessionName;
          QRRechTes.qRechazo.Open;
          QRRechTes.qrlDescProc.Caption:=pDescProceso;
          if pPreview
          then QRRechTes.Preview
          else QRRechTes.Print;
      finally QRRechTes.free;
      end;
end;

procedure TQRRechTes.qRechazoCalcFields(DataSet: TDataSet);
begin DataSet.FieldByName('Id_Contrato').AsFloat:=vIdContrato;
      DataSet.FieldByName('Nombre').AsString:=VNombre;
      DataSet.FieldByName('Operacion').AsString:=vOperacion;
      DataSet.FieldByName('Imp_Trans').AsFloat:=vImpTrans;
      DataSet.FieldByName('Id_Gpo_Trans').AsFloat:=vIdGpoTrans;
end;

end.
