unit qrCompTC;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, IntFrm, Db,
  DBTables,Dialogs, jpeg;

type
  TqrComTC = class(TQuickRep)
    qry: TQuery;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qryID_SUCURSAL_AE: TFloatField;
    qryNOMBRE: TStringField;
    qryDESC_UNI_NEGOCIO: TStringField;
    qryREFERENCIA: TStringField;
    qryNOMBRE_CLIENTE: TStringField;
    qryCVE_PRODUCTO: TStringField;
    qryDESC_C_ID_PRIM: TStringField;
    qryCVE_MONEDA: TStringField;
    qryIMP_TRANSACCION: TFloatField;
    QRGroup1: TQRGroup;
    bChild: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    qryFH_VENTA: TDateTimeField;
    QRImage1: TQRImage;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrDenom: TQRMemo;
    qrCant: TQRMemo;
    qrLetra: TQRMemo;
    qrSerie: TQRMemo;
    qrValor: TQRMemo;
    QRLabel17: TQRLabel;
    bFooter: TQRBand;
    procedure bChildBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    iTrans:String;
  end;


var
  qrComTC: TqrComTC;

procedure Execute_CompTC(Objeto:TInterFrame; pIDTrans:String);

implementation

{$R *.DFM}
procedure Execute_CompTC(Objeto:TInterFrame; pIDTrans:String);
begin
  qrComTC:=TqrComTC.Create(nil);
  qrComTC.iTrans:=PIDTrans;
  try  
    qrComTC.qry.DatabaseName:=Objeto.Apli.DataBaseName;
    qrComTC.qry.SessionName:=Objeto.Apli.SessionName;
    qrComTC.qry.Active:=False;
    qrComTC.qry.SQL.Text:=
' SELECT A.ID_SUCURSAL_AE, P.NOMBRE, e.DESC_UNI_NEGOCIO, c.ID_CONTRATO||''-''||B.ID_TRANSACCION AS REFERENCIA, C.NOMBRE_CLIENTE, '+
'        B.CVE_PRODUCTO, F.DESC_C_ID_PRIM, A.CVE_MONEDA, A.IMP_TRANSACCION,  '+
'        MAX(A.FH_VENTA) AS fh_venta '+
' FROM DI_VENTA_TC A, DI_TRANSACCION b, DI_CONTRATO c, DI_UNIDAD_CAMBIO d, DI_UNIDAD_NEGOC E, PERSONA P, DI_OPERACION F'+
' WHERE A.id_transaccion = '+pIDTrans+
' AND b.id_mesa_cambio=1 '+
' AND b.id_transaccion=A.id_transaccion '+
' AND c.ID_MESA_CAMBIO=B.ID_MESA_CAMBIO '+
' AND c.ID_CONTRATO=B.ID_CONTRATO '+
' AND d.id_mesa_cambio=b.id_mesa_cambio '+
' AND d.cve_usuario=A.cve_usu_venta '+
' AND e.id_mesa_cambio=d.id_mesa_cambio '+
' AND e.ID_REGION_CAMBIO=d.ID_REGION_CAMBIO '+
' AND e.ID_ENTIDAD=d.ID_ENTIDAD '+
' AND P.ID_PERSONA=2 '+
' AND F.CVE_OPERACION = B.CVE_OPERACION '+
' GROUP BY A.ID_SUCURSAL_AE, P.NOMBRE, e.DESC_UNI_NEGOCIO, c.ID_CONTRATO,B.ID_TRANSACCION, C.NOMBRE_CLIENTE, '+
'        B.CVE_PRODUCTO, F.DESC_C_ID_PRIM, A.CVE_MONEDA, A.IMP_TRANSACCION ';

    qrComTC.qry.Active:=True;
    if qrComTC.qry.RecordCount<>0 then
       qrComTC.Preview
    else showmessage('No Existen Registros ')
  finally
    If qrComTC <> nil then qrComTC.Free;
  end;
end;


procedure TqrComTC.bChildBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var qr:TQuery; iReg :Integer;
begin
  qrDenom.Lines.Clear;
  qrCant.Lines.Clear;
  qrLetra.Lines.Clear;
  qrSerie.Lines.Clear;
  qrValor.Lines.Clear;
  qr:=TQuery.Create(nil);
  try  
    qr.DatabaseName:=qrComTC.qry.DataBaseName;
    qr.SessionName:=qrComTC.qry.SessionName;
    qr.Active:=False;
    qr.SQL.Text:=
    ' SELECT ''AMEX'' AS EMISOR, A.IMP_DENOMINACION, B.CVE_LETRA, '+
    '        MIN(D.NUM_SERIE)||''/''||MAX(D.NUM_SERIE) SERIE, COUNT(A.IMP_DENOMINACION) CUENTA, SUM(A.IMP_DENOMINACION) SUMA '+
    ' FROM DI_DET_INV_TC d, DI_PROD_AME A, DI_INVENTARIO_TC B '+
    ' WHERE id_transaccion='+ qrComTC.iTrans+
    ' AND D.CVE_PROD_AME=A.CVE_PROD_AME '+
    ' AND B.ID_MESA_CAMBIO=D.ID_MESA_CAMBIO '+
    ' AND B.ID_DOTACION=D.ID_DOTACION '+
    ' AND B.ID_ORDEN=D.ID_ORDEN '+
    ' AND B.ID_INVENTARIO=D.ID_INVENTARIO '+
    ' GROUP BY A.IMP_DENOMINACION, B.CVE_LETRA, D.NUM_SERIE_INI '+
    ' ORDER BY A.IMP_DENOMINACION, B.CVE_LETRA, D.NUM_SERIE_INI ';

    iReg:=0;
    qr.Active:=True;
    if qr.RecordCount>0 then
    begin
       qr.First;
       while not(qr.EOF) do
       begin
            qrDenom.Lines.Add(qr.FieldByName('IMP_DENOMINACION').AsString);
            qrCant.Lines.Add(FormatFloat('###,##0.00',qr.FieldByName('CUENTA').AsInteger));
            qrLetra.Lines.Add(qr.FieldByName('CVE_LETRA').AsString);
            qrSerie.Lines.Add(qr.FieldByName('SERIE').AsString);
            qrValor.Lines.Add(FormatFloat('###,##0.00',qr.FieldByName('SUMA').AsInteger));
            Inc(iReg);
            qr.Next;
       end;
    end;
  finally
    If qr <> nil then qr.Free;
  end;
  qrDenom.Height:=iReg*15;
  qrCant.Height :=iReg*15;
  qrLetra.Height:=iReg*15;
  qrSerie.Height:=iReg*15;
  qrValor.Height:=iReg*15;
  bChild.Height:=iReg*15+10;
end;

{
procedure TqrComTC.bChildBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var qr:TQuery; vlSeriI, vlSeriF, vlSerie, vlSeriA:Double; iCuantos, iReg :Integer;
begin
  qrDenom.Lines.Clear;
  qrCant.Lines.Clear;
  qrLetra.Lines.Clear;
  qrSerie.Lines.Clear;
  qrValor.Lines.Clear;
  qr:=TQuery.Create(nil);
  try  
    qr.DatabaseName:=qrComTC.qry.DataBaseName;
    qr.SessionName:=qrComTC.qry.SessionName;
    qr.Active:=False;
    qr.SQL.Text:=
    ' SELECT ''AMEX'' AS EMISOR, A.IMP_DENOMINACION, B.CVE_LETRA, D.NUM_SERIE, D.NUM_SERIE_INI '+
    ' FROM DI_DET_INV_TC d, DI_PROD_AME A, DI_INVENTARIO_TC B '+
    ' WHERE id_transaccion= '+ qrComTC.iTrans+
    ' AND D.CVE_PROD_AME=A.CVE_PROD_AME '+
    ' AND B.ID_MESA_CAMBIO=D.ID_MESA_CAMBIO '+
    ' AND B.ID_DOTACION=D.ID_DOTACION '+
    ' AND B.ID_ORDEN=D.ID_ORDEN '+
    ' AND B.ID_INVENTARIO=D.ID_INVENTARIO '+
    ' ORDER BY B.CVE_LETRA, D.NUM_SERIE_INI, D.NUM_SERIE ';
    qr.Active:=True;
    if qr.RecordCount>0 then
    begin
       qr.First;
       iCuantos:=0;
       iReg:=0;
       vlSeriI:=qr.FieldByName('NUM_SERIE').AsFloat;
       vlSerie:=qr.FieldByName('NUM_SERIE').AsFloat;
       vlSeriA:=qr.FieldByName('NUM_SERIE').AsFloat;
       vlSeriF:=0;
       while not(qr.EOF) do
       begin
         if vlSeriA<>vlSerie then
            vlSeriF:=vlSeriA-1
         else inc(iCuantos);
         if (vlSeriF<>0) and (vlSeriI<>0) then
         begin
            Inc(iReg);
            qr.Prior;
            if iCuantos=0 then iCuantos:=1;
            qrDenom.Lines.Add(qr.FieldByName('IMP_DENOMINACION').AsString);
            qrCant.Lines.Add(IntToStr(iCuantos));
            qrLetra.Lines.Add(qr.FieldByName('CVE_LETRA').AsString);
            qrSerie.Lines.Add(FloatToStr(vlSeriI)+' / '+FloatToStr(vlSeriF));
            qrValor.Lines.Add(FormatFloat('###,##0.00',iCuantos*qr.FieldByName('IMP_DENOMINACION').AsInteger));
            iCuantos:=1;
            vlSeriF:=0;
            qr.Next;
            vlSeriI:=qr.FieldByName('NUM_SERIE').AsFloat;
         end;
         vlSeriA:=qr.FieldByName('NUM_SERIE').AsFloat+1;
         qr.Next;
         vlSerie:=qr.FieldByName('NUM_SERIE').AsFloat;
       end;
       vlSeriF:=vlSeriA-1;
       Inc(iReg);
       qr.Last;
       if iCuantos=0 then iCuantos:=1;
       qrDenom.Lines.Add(qr.FieldByName('IMP_DENOMINACION').AsString);
       qrCant.Lines.Add(IntToStr(iCuantos));
       qrLetra.Lines.Add(qr.FieldByName('CVE_LETRA').AsString);
       qrSerie.Lines.Add(FloatToStr(vlSeriI)+' / '+FloatToStr(vlSeriF));
       qrValor.Lines.Add(FormatFloat('###,##0.00',iCuantos*qr.FieldByName('IMP_DENOMINACION').AsInteger));
    end;
  finally
    If qr <> nil then qr.Free;
  end;
  qrDenom.Height:=iReg*15;
  qrCant.Height :=iReg*15;
  qrLetra.Height:=iReg*15;
  qrSerie.Height:=iReg*15;
  qrValor.Height:=iReg*15;
  bChild.Height:=iReg*15+10;
end;
}
end.

