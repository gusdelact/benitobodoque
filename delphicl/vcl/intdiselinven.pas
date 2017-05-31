// Sistema         : Clase de DI_INVENTARIO_TC
// Fecha de Inicio : 24/03/2008
// Función forma   : Clase de DI_INVENTARIO_TC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alicia Beatriz Maya Ramirez
// Comentarios     :
Unit IntDiSelInven;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, 
Grids, Aligrid, UnConDiAme, IntSGCtrl, qrCompTC;

Type
 TDiSelInve= class; 

  TWDiSelInventario=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_MESA_CAMBIO : TLabel; 
    edID_MESA_CAMBIO : TEdit;
    lbID_DOTACION : TLabel;
    edID_CONTRATO: TEdit;
    lbID_ORDEN : TLabel;
    edID_TRANSACCION: TEdit;
    lbCVE_PROD_AME : TLabel;
    edCVE_PRODUCTO: TEdit;
    lbID_INVENTARIO : TLabel;
    edIMP_TRANS_PROD: TEdit;
    qDatos: TQuery;
    bbProducto: TBitBtn;
    sagConsulta: TSGCtrl;
    Label1: TLabel;
    edCVE_MONEDA: TEdit;
    qDatosID_SUC_AMERI: TFloatField;
    qDatosCVE_PROD_AME: TStringField;
    qDatosIMP_DENOMINACION: TFloatField;
    qDatosCVE_LETRA: TStringField;
    qDatosNUM_SERIE: TFloatField;
    qDatosMARCAR: TStringField;
    qDatosCVE_MONEDA: TStringField;
    bbRefrescar: TBitBtn;
    qDatosID_MESA_CAMBIO: TFloatField;
    qDatosID_DOTACION: TFloatField;
    qDatosID_ORDEN: TFloatField;
    qDatosID_INVENTARIO: TFloatField;
    Label2: TLabel;
    edSit: TEdit;
    Label3: TLabel;
    edMonto: TEdit;
    cbTodos: TCheckBox;
    qDet: TQuery;
    qDatosCANTDISP: TFloatField;
    qDatosNUM_DISPO: TFloatField;
    sgDet: TSGCtrl;
    cbDet: TCheckBox;
    Label4: TLabel;
    qDetID_MESA_CAMBIO: TFloatField;
    qDetID_DOTACION: TFloatField;
    qDetID_ORDEN: TFloatField;
    qDetCVE_PROD_AME: TStringField;
    qDetID_INVENTARIO: TFloatField;
    qDetID_DET_INV: TFloatField;
    qDetNUM_SERIE: TFloatField;
    qDetNUM_SERIE_INI: TFloatField;
    qDetCVE_SITUACION: TStringField;
    qDetCVE_USU_ASIG: TStringField;
    qDetFH_ASIGNACION: TDateTimeField;
    qDetCVE_USU_CANC: TStringField;
    qDetFH_CANCELAC: TDateTimeField;
    qDetMARCAR: TStringField;
    edAsignado: TEdit;
    Label5: TLabel;
    qTrans: TQuery;
    qTransASIGNADO: TFloatField;
    qTransSINASIG: TFloatField;
    qTransSIT: TStringField;
    qTransIMP_TRANSACCION: TFloatField;
    edIMP: TEdit;
    bbCancel: TBitBtn;
    qCanc: TQuery;
    qDetC: TQuery;
    qCancMARCAR: TStringField;
    qCancID_VENTA_TC: TFloatField;
    qCancID_TRANSACCION: TFloatField;
    qCancNUM_DENOMINACION: TFloatField;
    qCancCVE_LETRA: TStringField;
    qCancNUM_SERIE: TFloatField;
    qCancIMP_CHEQUES: TFloatField;
    qCancFH_VENTA: TDateTimeField;
    qCancCVE_SITUACION: TStringField;
    qCancCVE_USU_VENTA: TStringField;
    qCancCVE_MONEDA: TStringField;
    qCancID_SUCURSAL_AE: TFloatField;
    qDetCID_MESA_CAMBIO: TFloatField;
    qDetCID_DOTACION: TFloatField;
    qDetCID_ORDEN: TFloatField;
    qDetCCVE_PROD_AME: TStringField;
    qDetCID_INVENTARIO: TFloatField;
    qDetCID_DET_INV: TFloatField;
    qDetCNUM_SERIE: TFloatField;
    qDetCNUM_SERIE_INI: TFloatField;
    qDetCCVE_SITUACION: TStringField;
    qDetCCVE_USU_ASIG: TStringField;
    qDetCFH_ASIGNACION: TDateTimeField;
    qDetCCVE_USU_CANC: TStringField;
    qDetCFH_CANCELAC: TDateTimeField;
    qDetCID_TRANSACCION: TFloatField;
    qDetCMARCAR: TStringField;
    bbReversa: TBitBtn;
    bbRecibo: TBitBtn;
    Panel1: TPanel;
    edSerieDe: TEdit;
    edSerie_A: TEdit;
    edSerie: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    edTotal: TEdit;
    bbMuestra: TBitBtn;
    Panel2: TPanel;
    Label10: TLabel;
    edImpTot: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure MuestraInventario;
    procedure MuestraAsignacion;
    procedure sagConsultaDblClick(Sender: TObject);
    procedure bbProductoClick(Sender: TObject);
    procedure bbRefrescarClick(Sender: TObject);
    procedure RevisaOpn;
    procedure cbTodosClick(Sender: TObject);
    procedure sagConsultaMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure cbDetClick(Sender: TObject);
    procedure sgDetDblClick(Sender: TObject);
    function  ConstruyeSQLUpd:String;
    procedure bbCancelClick(Sender: TObject);
    procedure bbReversaClick(Sender: TObject);
    procedure bbReciboClick(Sender: TObject);
    procedure AsignaManual;
    procedure edSerie_AExit(Sender: TObject);
    procedure bbMuestraClick(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TDiSelInve;
end; 
 TDiSelInve= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_MESA_CAMBIO           : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_TRANSACCION           : TInterCampo;
        CVE_PRODUCTO             : TInterCampo;
        IMP_TRANS_PROD           : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TDiSelInve.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_MESA_CAMBIO :=CreaCampo('ID_MESA_CAMBIO',ftFloat,tsNinguno,tsNinguno,False);
      ID_CONTRATO    :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      ID_TRANSACCION :=CreaCampo('ID_TRANSACCION',ftFloat,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO   :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
      IMP_TRANS_PROD :=CreaCampo('IMP_TRANS_PROD',ftString,tsNinguno,tsNinguno,False);
      CVE_MONEDA     :=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
end;

Destructor TDiSelInve.Destroy;
begin inherited;
end;


function TDiSelInve.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDiSelInventario;
begin
   W:=TWDiSelInventario.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TDiSelInve.InternalBusca:Boolean;
begin //
end;

function TDiSelInve.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA DI_INVENTARIO_TC********************)
(*                                                                              *)
(*  FORMA DE DI_INVENTARIO_TC                                                            *)
(*                                                                              *)
(***********************************************FORMA DI_INVENTARIO_TC********************)

procedure TWDiSelInventario.FormShow(Sender: TObject);
begin
      Objeto.ID_MESA_CAMBIO.Control:=edID_MESA_CAMBIO;
      Objeto.ID_CONTRATO.Control   :=edID_CONTRATO;
      Objeto.ID_TRANSACCION.Control:=edID_TRANSACCION;
      Objeto.CVE_PRODUCTO.Control  :=edCVE_PRODUCTO;
      Objeto.IMP_TRANS_PROD.Control:=edIMP_TRANS_PROD;
      Objeto.CVE_MONEDA.Control    :=edCVE_MONEDA;
      qDatos.DatabaseName:=Objeto.Apli.DataBaseName;
      qDatos.SessionName:=Objeto.Apli.SessionName;
      qDet.DatabaseName:=Objeto.Apli.DataBaseName;
      qDet.SessionName:=Objeto.Apli.SessionName;
      qTrans.DatabaseName:=Objeto.Apli.DataBaseName;
      qTrans.SessionName:=Objeto.Apli.SessionName;
      qCanc.DatabaseName:=Objeto.Apli.DataBaseName;
      qCanc.SessionName:=Objeto.Apli.SessionName;
      qDetC.DatabaseName:=Objeto.Apli.DataBaseName;
      qDetC.SessionName:=Objeto.Apli.SessionName;
      RevisaOpn;
end;

procedure TWDiSelInventario.FormDestroy(Sender: TObject);
begin
      Objeto.ID_MESA_CAMBIO.Control:=nil;
      Objeto.ID_CONTRATO.Control   :=nil;
      Objeto.ID_TRANSACCION.Control:=nil;
      Objeto.CVE_PRODUCTO.Control  :=nil;
      Objeto.IMP_TRANS_PROD.Control:=nil;
      Objeto.CVE_MONEDA.Control    :=nil;
end;

procedure TWDiSelInventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDiSelInventario.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWDiSelInventario.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWDiInventarioTc.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWDiSelInventario.MuestraInventario;
begin
  qDatos.Close;
  qDatos.ParamByName('parametro').AsString:=Objeto.Apli.Usuario;
  qDatos.ParamByName('parametro1').AsString:=Objeto.CVE_PRODUCTO.AsString;
 
  qDatos.Open;
  if qDatos.RecordCount>0 then
  begin
    sagConsulta.AddQry(qDatos,True,True,-1,-1,-1,True);
    sagConsulta.ColumnByName('MARCAR').IsCheck := True;
    sagConsulta.EndGrid;
    sagConsulta.MoveRow(self, 1,1);
  end
  else  sagConsulta.Clear('No se encontró información'#30'>C');
  edSerie.Text:='';
  edSerieDe.Text:='';
  edSerie_A.Text:='';
  edTotal.Text:='';
  edImpTot.Text:='';
end;

procedure TWDiSelInventario.sagConsultaDblClick(Sender: TObject);
var irow:Integer; 
begin                      
   irow:=sagConsulta.sg.Selection.Top;
   if sagConsulta.CellStr['MARCAR',irow]='SI' 
   then begin
        sagConsulta.CellStr['MARCAR',irow]:='';
        if bbProducto.Enabled then
        edIMP.Text:=FloatToStr(StrToFloat(edIMP.text)- StrToFloat(sagConsulta.CellStr['CANTDISP',irow]) );
   end
   else begin
        sagConsulta.CellStr['MARCAR',irow]:='SI';
        if bbProducto.Enabled then
        begin
          edIMP.Text:=FloatToStr(StrToFloat(edIMP.text)+ StrToFloat(sagConsulta.CellStr['CANTDISP',irow]) );
          FOR iRow:=1 to sgDet.SG.RowCount do
             if sgDet.CellStr['MARCAR',iRow]='SI' THEN
             begin
                edIMP.Text:=FloatToStr(StrToFloat(edIMP.text)- StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]) );
                sgDet.CellStr['MARCAR',iRow]:='';
             end;
        end;
   end;
end;

procedure TWDiSelInventario.bbProductoClick(Sender: TObject);
var vlSQL:String;
    iSuma:Real;vlReg:Integer;
begin
  //REVISA MONTO
  iSuma:=0;
  FOR vlReg:=1 TO sagConsulta.SG.RowCount-1 DO
     if sagConsulta.CellStr['MARCAR',vlReg]='SI' THEN
        iSuma:=iSuma+StrToFloat(sagConsulta.CellStr['CANTDISP',vlReg]);
  FOR vlReg:=1 TO sgDet.SG.RowCount-1 DO
     if sgDet.CellStr['MARCAR',vlReg]='SI' THEN
        iSuma:=iSuma+StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]);
  
  if iSuma>0 then
  begin
     if iSuma > StrToFloat(edMonto.Text) then
        ShowMessage('La cantidad indicada es incorrecta favor de verificar.')
     else
     begin
       if (iSuma < StrToFloat(edMonto.Text)) and
          (MessageDlg('Se realizará una asignación parcial, ¿desea continuar?',mtconfirmation,[mbyes,mbno],0)=mrno) then exit;
       vlSQL:=ConstruyeSQLUPD;
       runsql(vlSQL,Objeto.Apli.Databasename,Objeto.Apli.sessionName,True);
       RevisaOpn;
       ShowMessage('Proceso concluido');
     end;
  end
  else
  begin
    AsignaManual;
  end;
end;

procedure TWDiSelInventario.bbRefrescarClick(Sender: TObject);
begin
      MuestraInventario;
end;

procedure TWDiSelInventario.RevisaOpn;
begin
  if qTrans.Active then qTrans.Active:=False;
  qTrans.Close;
  qTrans.ParamByName('parametro').AsString:=edID_TRANSACCION.Text;
  qTrans.ParamByName('parametro1').AsString:=edIMP_TRANS_PROD.Text;
  qTrans.Open;
  if qTrans.RecordCount>0 then
   begin
    edSit.Text:=qTrans.FieldByName('SIT').AsString;
    edAsignado.Text:=qTrans.FieldByName('ASIGNADO').AsString;
    edMonto.Text:=qTrans.FieldByName('SINASIG').AsString;
    if qTrans.FieldByName('SINASIG').AsFloat <=0 
    then bbProducto.Enabled:=False
    else bbProducto.Enabled:=True;
   end
  else
   begin
    edSit.Text:='NA';
    edAsignado.Text:='0';
    edMonto.Text:=edIMP_TRANS_PROD.Text;
    bbProducto.Enabled:=True;
    bbRefrescar.Enabled:=True;
   end;
  edIMP.Text:='0';

  if (edMonto.Text='0') and (edSit.Text='AS') 
  then MuestraAsignacion
  else MuestraInventario;
end;

procedure TWDiSelInventario.cbTodosClick(Sender: TObject);
var iRow:Integer; vSTR:String;
begin
  if cbTodos.Checked 
  then vSTR:='SI'
  else vSTR:='';

  for irow:=1 to SagConsulta.SG.rowcount do
  begin
    if (sagConsulta.CellStr['MARCAR',irow]='SI') and (vSTR='') and (bbProducto.Enabled) then 
       edIMP.Text:=FloatToStr(StrToFloat(edIMP.text)- StrToFloat(sagConsulta.CellStr['CANTDISP',irow]) );
    if (sagConsulta.CellStr['MARCAR',irow]='') and (vSTR='SI') and (bbProducto.Enabled) then 
       edIMP.Text:=FloatToStr(StrToFloat(edIMP.text)+ StrToFloat(sagConsulta.CellStr['CANTDISP',irow]) );
    sagConsulta.CellStr['MARCAR',irow]:=vSTR;
  end;
end;

procedure TWDiSelInventario.sagConsultaMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  edSerie.Text:='';
  if bbProducto.Enabled then
  begin
    if qDet.Active then qDet.Active:=False;
    qDet.Close;
    qDet.ParamByName('parametro1').AsString:=sagConsulta.CellStr['id_mesa_cambio',ToIndex];
    qDet.ParamByName('parametro2').AsString:=sagConsulta.CellStr['id_dotacion',ToIndex];
    qDet.ParamByName('parametro3').AsString:=sagConsulta.CellStr['id_orden',ToIndex];
    qDet.ParamByName('parametro4').AsString:=sagConsulta.CellStr['cve_prod_ame',ToIndex];
    qDet.ParamByName('parametro5').AsString:=sagConsulta.CellStr['ID_INVENTARIO',ToIndex];
    qDet.Open;
    if qDet.RecordCount>0 then
    begin
      sgDet.AddQry(qDet,True,True,-1,-1,-1,True);
      sgDet.ColumnByName('MARCAR').IsCheck := True;
      sgDet.EndGrid;
      sgDet.MoveRow(self, 1,1);
      edSerie.Text:=sagConsulta.CellStr['NUM_SERIE',ToIndex];
    end
    else  sgDet.Clear('No hay disponibilidad. Refresque Inventario.'#30'>C');
  end
  else
  begin
    if qDetC.Active then qDetC.Active:=False;
    qDetC.Close;
    qDetC.ParamByName('parametro1').AsString:=edID_TRANSACCION.Text;
    qDetC.ParamByName('parametro2').AsString:=sagConsulta.CellStr['NUM_SERIE',ToIndex];
    qDetC.Open;
    if qDetC.RecordCount>0 then
    begin
      sgDet.AddQry(qDetC,True,True,-1,-1,-1,True);
      sgDet.ColumnByName('MARCAR').IsCheck := True;
      sgDet.EndGrid;
      sgDet.MoveRow(self, 1,1);
    end
    else  sgDet.Clear('Sin información.'#30'>C');
  end
end;

procedure TWDiSelInventario.cbDetClick(Sender: TObject);
var iRow:Integer; vSTR:String;
begin
  if cbDet.Checked 
  then vSTR:='SI'
  else vSTR:='';

  for irow:=1 to sgDet.SG.rowcount-1 do
  begin
    if (sgDet.CellStr['MARCAR',irow]='SI') and (vSTR='') and (bbProducto.Enabled) then 
       edIMP.Text:=FloatToStr (StrToFloat(edIMP.text)- StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]) );
    if (sgDet.CellStr['MARCAR',irow]='') and (vSTR='SI') and (bbProducto.Enabled) then 
       edIMP.Text:=FloatToStr (StrToFloat(edIMP.text)+ StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]) );
    sgDet.CellStr['MARCAR',irow]:=vSTR;
  end
end;

procedure TWDiSelInventario.sgDetDblClick(Sender: TObject);
var irow:Integer; 
begin
   irow:=sgDet.sg.Selection.Top;
   if sgDet.CellStr['MARCAR',irow]='SI' 
   then begin
        sgDet.CellStr['MARCAR',irow]:='';
        if bbProducto.Enabled then
        edIMP.Text:=FloatToStr (StrToFloat(edIMP.text)- StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]) );
   end
   else begin
        sgDet.CellStr['MARCAR',irow]:='SI';
        if bbProducto.Enabled then
        begin
          edIMP.Text:=FloatToStr (StrToFloat(edIMP.text)+ StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]) );
          if sagConsulta.CellStr['MARCAR',sagConsulta.SG.Selection.Top]='SI' THEN
             begin
                edIMP.Text:=FloatToStr(StrToFloat(edIMP.text)- StrToFloat(sagConsulta.CellStr['CANTDISP',sagConsulta.SG.Selection.Top]) );
                sagConsulta.CellStr['MARCAR',sagConsulta.SG.Selection.Top]:='';
             end;
        end;
   end;
end;

function  TWDiSelInventario.ConstruyeSQLUpd:String;
var vlReg:Integer; vlSQL,vUpd:String;
    iUtil:Real;
begin
    vUpd:='';
    vlSQL:=' BEGIN ';
    FOR vlReg:=1 TO sagConsulta.SG.RowCount-1 DO
     if sagConsulta.CellStr['MARCAR',vlReg]='SI' THEN
     BEGIN
       vlSQL:=vlSQL+
        '   INSERT INTO DI_VENTA_TC '+
        '      (ID_VENTA_TC,ID_TRANSACCION,NUM_DENOMINACION,CVE_LETRA,NUM_SERIE,IMP_CHEQUES,'+
        '       IMP_TRANSACCION,CVE_MONEDA,ID_SUCURSAL_AE, FH_VENTA,CVE_USU_VENTA,CVE_SITUACION)  '+
        '   VALUES ('+
              IntToStr(GeneraFolio('FOLIO','VENTA',Objeto.Apli,FALSE)) +', '+
              edID_TRANSACCION.Text +', '+
              sagConsulta.CellStr['IMP_DENOMINACION',vlReg] + ', '''+
              sagConsulta.CellStr['CVE_LETRA',vlReg] + ''', '+
              sagConsulta.CellStr['NUM_SERIE',vlReg] + ', '+
              sagConsulta.CellStr['NUM_DISPO',vlReg] + ', '+
              edIMP_TRANS_PROD.Text + ', '''+
              sagConsulta.CellStr['CVE_MONEDA',vlReg] + ''', '+
              sagConsulta.CellStr['ID_SUC_AMERI',vlReg] + ', SYSDATE, '''+Objeto.Apli.Usuario+''',''NE'');'+
        '   UPDATE DI_INVENTARIO_TC '+
        '   SET IMP_UTILIZADO = IMP_UTILIZADO +'+ sagConsulta.CellStr['CANTDISP',vlReg]+', '+
        '       cve_sit_inven=decode(IMP_UTILIZADO +'+ sagConsulta.CellStr['CANTDISP',vlReg]+',imp_cheques,''AG'',''DI'') '+
        '   WHERE ID_MESA_CAMBIO='+sagConsulta.CellStr['ID_MESA_CAMBIO',vlReg]+
        '   AND ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',vlReg]+
        '   AND ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',vlReg]+
        '   AND CVE_PROD_AME = '''+sagConsulta.CellStr['CVE_PROD_AME',vlReg]+''' '+
        '   AND ID_INVENTARIO = '+sagConsulta.CellStr['ID_INVENTARIO',vlReg]+';';
       vUpd:=vUpd+
             ' UPDATE DI_DET_INV_TC '+
             ' SET CVE_SITUACION=''AS'', CVE_USU_ASIG='''+Objeto.Apli.Usuario+''', '+
                 ' FH_ASIGNACION=SYSDATE, ID_TRANSACCION= '+edID_TRANSACCION.Text +
             ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
             ' and ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',vlReg]+
             ' and ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',vlReg]+
             ' and CVE_PROD_AME ='''+sagConsulta.CellStr['CVE_PROD_AME',vlReg]+''' '+
             ' and ID_INVENTARIO ='+sagConsulta.CellStr['ID_INVENTARIO',vlReg]+
             ' AND CVE_SITUACION=''NA''; ';
     END;
    iUtil:=0;
    FOR vlReg:=1 TO sgDet.SG.RowCount-1 DO
     if sgDet.CellStr['MARCAR',vlReg]='SI' THEN
        begin
           iUtil:=iUtil+StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top]);
           vUpd:=vUpd+
             ' UPDATE DI_DET_INV_TC '+
             ' SET CVE_SITUACION=''AS'', CVE_USU_ASIG='''+Objeto.Apli.Usuario+''', FH_ASIGNACION=SYSDATE, ID_TRANSACCION= '+edID_TRANSACCION.Text +
             ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
             ' and ID_DOTACION = '+sgDet.CellStr['ID_DOTACION',vlReg]+
             ' and ID_ORDEN = '+sgDet.CellStr['ID_ORDEN',vlReg]+
             ' and CVE_PROD_AME ='''+sgDet.CellStr['CVE_PROD_AME',vlReg]+''' '+
             ' and ID_INVENTARIO ='+sgDet.CellStr['ID_INVENTARIO',vlReg]+
             ' and ID_DET_INV ='+sgDet.CellStr['ID_DET_INV',vlReg]+';';
        end;
    if iUtil<>0 then
       vlSQL:=vlSQL+
        '   INSERT INTO DI_VENTA_TC '+
        '      (ID_VENTA_TC,ID_TRANSACCION,NUM_DENOMINACION,CVE_LETRA,NUM_SERIE,IMP_CHEQUES,'+
        '       IMP_TRANSACCION,CVE_MONEDA,ID_SUCURSAL_AE, FH_VENTA,CVE_USU_VENTA,CVE_SITUACION)  '+
        '   VALUES ('+
              IntToStr(GeneraFolio('FOLIO','VENTA',Objeto.Apli,FALSE)) +', '+
              edID_TRANSACCION.Text +', '+
              sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top] + ', '''+
              sagConsulta.CellStr['CVE_LETRA',sagConsulta.SG.Selection.Top] + ''', '+
              sagConsulta.CellStr['NUM_SERIE',sagConsulta.SG.Selection.Top] + ', '+
              FloatToStr(iUtil/StrToFloat(sagConsulta.CellStr['IMP_DENOMINACION',sagConsulta.SG.Selection.Top])) + ', '+
              edIMP_TRANS_PROD.Text + ', '''+
              sagConsulta.CellStr['CVE_MONEDA',sagConsulta.SG.Selection.Top] + ''', '+
              sagConsulta.CellStr['ID_SUC_AMERI',sagConsulta.SG.Selection.Top] + ', SYSDATE, '''+Objeto.Apli.Usuario+''',''NE'');'+
        '   UPDATE DI_INVENTARIO_TC '+
        '   SET IMP_UTILIZADO = IMP_UTILIZADO +'+ FloatToStr(iUtil)+', '+
        '       cve_sit_inven=decode(IMP_UTILIZADO +'+ FloatToStr(iUtil)+',imp_cheques,''AG'',''DI'') '+
        '   WHERE ID_MESA_CAMBIO='+sagConsulta.CellStr['ID_MESA_CAMBIO',sagConsulta.SG.Selection.Top]+
        '   AND ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',sagConsulta.SG.Selection.Top]+
        '   AND ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',sagConsulta.SG.Selection.Top]+
        '   AND CVE_PROD_AME = '''+sagConsulta.CellStr['CVE_PROD_AME',sagConsulta.SG.Selection.Top]+''' '+
        '   AND ID_INVENTARIO = '+sagConsulta.CellStr['ID_INVENTARIO',sagConsulta.SG.Selection.Top]+';';
    vlSQL:=vlSQL+vUpd+
        '   COMMIT;'+
        ' END; ';
    ConstruyeSQLUpd:=vlSQL;
end;

procedure TWDiSelInventario.bbCancelClick(Sender: TObject);
var vlSQL, vlUPD:String; vlreg:Integer;
begin
    //la cancelación es sin importar si ya se envio a american expreess
    if MessageDlg('¿Esta seguro de cancelar los travelers completamente? '+chr(13)+'(Ya no podrá asignarlos a otra venta)',
     mtConfirmation,[mbyes,mbno],0) = mrNo then Exit;
    vlSQL:=' DECLARE '+
           ' VLNUM NUMBER(7);  '+
           ' BEGIN ';
    vlUPD:='';
    FOR vlReg:=1 TO sagConsulta.SG.RowCount-1 DO
      if sagConsulta.CellStr['MARCAR',vlReg]='SI' THEN
       vlSQL:=vlSQL+
             ' UPDATE DI_DET_INV_TC '+
             ' SET CVE_SITUACION=''CA'', CVE_USU_CANC='''+Objeto.Apli.Usuario+''', FH_CANCELAC=SYSDATE '+
             ' WHERE CVE_SITUACION=''AS'' '+
             ' AND id_transaccion= '+sagConsulta.CellStr['ID_TRANSACCION',vlReg]+
             ' AND NUM_SERIE_INI='+sagConsulta.CellStr['NUM_SERIE',vlReg]+';';
             
    FOR vlReg:=1 TO sgDet.SG.RowCount-1 DO
     if sgDet.CellStr['MARCAR',vlReg]='SI' THEN
        vlUPD:=vlUPD+
             ' UPDATE DI_DET_INV_TC '+
             ' SET CVE_SITUACION=''CA'', CVE_USU_CANC='''+Objeto.Apli.Usuario+''', FH_CANCELAC=SYSDATE '+
             ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
             ' and ID_DOTACION = '+sgDet.CellStr['ID_DOTACION',vlReg]+
             ' and ID_ORDEN = '+sgDet.CellStr['ID_ORDEN',vlReg]+
             ' and CVE_PROD_AME ='''+sgDet.CellStr['CVE_PROD_AME',vlReg]+''' '+
             ' and ID_INVENTARIO ='+sgDet.CellStr['ID_INVENTARIO',vlReg]+
             ' and ID_DET_INV ='+sgDet.CellStr['ID_DET_INV',vlReg]+';';

    vlSQL:=vlSQL+ vlUPD+
           ' BEGIN '+
           '   SELECT NVL(COUNT(*),0) INTO VLNUM FROM DI_DET_INV_TC '+
           '   WHERE ID_TRANSACCION='+ sagConsulta.CellStr['ID_TRANSACCION',sagConsulta.SG.Selection.Top] +
           '   AND CVE_SITUACION<>''CA''; '+
           ' END; '+
           ' UPDATE DI_VENTA_TC SET CVE_SITUACION=decode(VLNUM,0,''CA'',CVE_SITUACION) '+
           ' WHERE ID_VENTA_TC = '+sagConsulta.CellStr['ID_VENTA_TC', sagConsulta.SG.Selection.Top]+
           ' AND ID_TRANSACCION ='+sagConsulta.CellStr['ID_TRANSACCION', sagConsulta.SG.Selection.Top]+';'+
        '   COMMIT;'+
        ' END; ';
    runsql(vlSQL,Objeto.Apli.Databasename,Objeto.Apli.sessionName,True);
    ShowMessage('Proceso Concluido');
    RevisaOpn;
end;

procedure TWDiSelInventario.MuestraAsignacion;
begin
  bbProducto.Enabled:=False;
//  bbRefrescar.Enabled:=False;
  if qCanc.Active then qCanc.Active:=False;
  qCanc.Close;
  qCanc.ParamByName('parametro').AsString:=edID_TRANSACCION.Text;
  
  qCanc.Open;
  if qCanc.RecordCount>0 then
  begin
    sagConsulta.AddQry(qCanc,True,True,-1,-1,-1,True);
    sagConsulta.ColumnByName('MARCAR').IsCheck := True;
    sagConsulta.EndGrid;
    sagConsulta.MoveRow(self, 1,1);
  end
  else  sagConsulta.Clear('No se encontró información'#30'>C');
end;


procedure TWDiSelInventario.bbReversaClick(Sender: TObject);
var vlSQL, vlUPD : String; vlReg : Integer;
begin
//se reversa si no se ha enviado a american express
    if MessageDlg('¿Esta seguro de cancelar esta asignación? '+chr(13)+'(Los travelers quedarán disponibles para otra venta)',
     mtConfirmation,[mbyes,mbno],0) = mrNo then Exit;
    vlSQL:=' BEGIN ';
    vlUPD:='';
    FOR vlReg:=1 TO sagConsulta.SG.RowCount-1 DO
      if sagConsulta.CellStr['MARCAR',vlReg]='SI' THEN
       vlSQL:=vlSQL+
             //VENTA
             ' UPDATE DI_VENTA_TC SET CVE_SITUACION=DECODE(imp_cheques-1,0,''CA'',cve_situacion), IMP_CHEQUES=IMP_CHEQUES - 1 '+
             ' WHERE ID_VENTA_TC = '+sagConsulta.CellStr['ID_VENTA_TC',vlReg]+
             ' AND ID_TRANSACCION ='+sagConsulta.CellStr['ID_TRANSACCION',vlReg]+';'+
             //INVENTARIO
             ' UPDATE DI_INVENTARIO_TC '+
             ' SET IMP_UTILIZADO = IMP_UTILIZADO -('+ sagConsulta.CellStr['NUM_DENOMINACION',vlReg]+'*'+
                                                      sagConsulta.CellStr['IMP_CHEQUES',vlReg]+'), '+
             '   cve_sit_inven=decode(IMP_UTILIZADO -('+ sagConsulta.CellStr['NUM_DENOMINACION',vlReg]+'*'+
                                                        sagConsulta.CellStr['IMP_CHEQUES',vlReg]+'),imp_cheques,''AG'',''DI'') '+
             ' WHERE (ID_MESA_CAMBIO,ID_DOTACION, ID_ORDEN, CVE_PROD_AME, ID_INVENTARIO) IN '+
             '  (SELECT ID_MESA_CAMBIO,ID_DOTACION, ID_ORDEN, CVE_PROD_AME, ID_INVENTARIO '+
             '   FROM DI_DET_INV_TC '+
             '   WHERE CVE_SITUACION=''AS'' '+
             '   AND id_transaccion= '+sagConsulta.CellStr['ID_TRANSACCION',vlReg]+
             '   AND NUM_SERIE_INI='+sagConsulta.CellStr['NUM_SERIE_INI',vlReg]+');'+
             //DETALLE DE INVENTARIO
             ' UPDATE DI_DET_INV_TC '+
             ' SET CVE_SITUACION=''NA'', ID_TRANSACCION='', CVE_USU_CANC='''+Objeto.Apli.Usuario+''', FH_CANCELAC=SYSDATE '+
             ' WHERE CVE_SITUACION=''AS'' '+
             ' AND id_transaccion= '+sagConsulta.CellStr['ID_TRANSACCION',vlReg]+
             ' AND NUM_SERIE_INI='+sagConsulta.CellStr['NUM_SERIE_INI',vlReg]+';';
             
    FOR vlReg:=1 TO sgDet.SG.RowCount-1 DO
     if sgDet.CellStr['MARCAR',vlReg]='SI' THEN
        vlUpd:=vlUpd+
             //VENTA
             ' UPDATE DI_VENTA_TC SET IMP_CHEQUES=IMP_CHEQUES - 1, CVE_SITUACION=DECODE(imp_cheques-1,0,''CA'',cve_situacion) '+
             ' WHERE ID_VENTA_TC = '+sagConsulta.CellStr['ID_VENTA_TC',sagConsulta.SG.Selection.Top]+
             ' AND ID_TRANSACCION ='+sagConsulta.CellStr['ID_TRANSACCION',sagConsulta.SG.Selection.Top]+
             ' AND NUM_SERIE='+sgDet.CellStr['NUM_SERIE_INI',vlReg]+ ';'+
             //INVENTARIO
             ' UPDATE DI_INVENTARIO_TC '+
             ' SET IMP_UTILIZADO = IMP_UTILIZADO -'+ sagConsulta.CellStr['NUM_DENOMINACION',sagConsulta.SG.Selection.Top]+','+
             '   cve_sit_inven=decode(IMP_UTILIZADO -'+ sagConsulta.CellStr['NUM_DENOMINACION',sagConsulta.SG.Selection.Top]+',imp_cheques,''AG'',''DI'') '+
             ' WHERE (ID_MESA_CAMBIO,ID_DOTACION, ID_ORDEN, CVE_PROD_AME, ID_INVENTARIO) IN '+
             '  (SELECT ID_MESA_CAMBIO,ID_DOTACION, ID_ORDEN, CVE_PROD_AME, ID_INVENTARIO '+
             '   FROM DI_DET_INV_TC '+
             '   WHERE CVE_SITUACION=''AS'' '+
             '   AND id_transaccion= '+sagConsulta.CellStr['ID_TRANSACCION',sagConsulta.SG.Selection.Top]+
             '   AND NUM_SERIE='+sgDet.CellStr['NUM_SERIE',vlReg]+
             '   AND NUM_SERIE_INI='+sgDet.CellStr['NUM_SERIE_INI',vlReg]+');'+
             //DETALLE INVETNARIO
             ' UPDATE DI_DET_INV_TC '+
             ' SET CVE_SITUACION=''NA'', ID_TRANSACCION=NULL, CVE_USU_CANC='''+Objeto.Apli.Usuario+''', FH_CANCELAC=SYSDATE '+
             ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
             ' and ID_DOTACION = '+sgDet.CellStr['ID_DOTACION',vlReg]+
             ' and ID_ORDEN = '+sgDet.CellStr['ID_ORDEN',vlReg]+
             ' and CVE_PROD_AME ='''+sgDet.CellStr['CVE_PROD_AME',vlReg]+''' '+
             ' and ID_INVENTARIO ='+sgDet.CellStr['ID_INVENTARIO',vlReg]+
             ' and ID_DET_INV ='+sgDet.CellStr['ID_DET_INV',vlReg]+';';

    vlSQL:=vlSQL + vlUpd +
        '   COMMIT;'+
        ' END; ';
    runsql(vlSQL,Objeto.Apli.Databasename,Objeto.Apli.sessionName,True);
    ShowMessage('Proceso Concluido');
    RevisaOpn;
end;

procedure TWDiSelInventario.bbReciboClick(Sender: TObject);
begin
Execute_CompTC(Objeto, edID_TRANSACCION.Text);
end;

procedure TWDiSelInventario.AsignaManual;
var vlSQL:String; vlRevisa, vlReg:Integer; vlTotal:Real;
begin
  if (edSerie_A.Text='')or(edSerieDe.Text='') then
  begin
     MessageDlg('Debe indicar la serie para la Asignación de Travelers',mtInformation,[mbok],0);
     Exit;
  end;
  
  vlReg:=sagConsulta.SG.Selection.Top;
  if MessageDlg('Se realizará la asignación de Travelers:'+chr(13)+
                '  Moneda: '+sagConsulta.CellStr['CVE_MONEDA',vlReg]+chr(13)+
                '  Letra: '+sagConsulta.CellStr['CVE_LETRA',vlReg]+chr(13)+
                '  Denominación: '+sagConsulta.CellStr['IMP_DENOMINACION',vlReg]+chr(13)+
                '  Serie Inicial:'+edSerieDe.Text+chr(13)+
                '  Serie Final:'+edSerie_A.Text+ chr(13)+chr(13)+
                '¿Esta seguro de realizar esta asignación?',mtConfirmation,[mbyes,mbno],0) = mrNo then Exit;

  vlSQL:=
        ' SELECT COUNT(*) REVISA  FROM DI_DET_INV_TC '+
        ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
        ' and ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',vlReg]+
        ' and ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',vlReg]+
        ' and CVE_PROD_AME ='''+sagConsulta.CellStr['CVE_PROD_AME',vlReg]+''' '+
        ' and ID_INVENTARIO ='+sagConsulta.CellStr['ID_INVENTARIO',vlReg]+
        ' and NUM_SERIE BETWEEN '+ edSerieDe.Text +' AND '+edSerie_A.Text+
        ' AND CVE_SITUACION=''NA'' ';
  GetSQLInt(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'REVISA', vlRevisa,TRUE);

  if vlRevisa=0 then
  begin
     MessageDlg('No existe inventario disponible con las series deseas. Favor de revisar.',mtInformation,[mbok],0);
     Exit;
  end
  else
  begin
     vlTotal:=vlRevisa * StrToInt(sagConsulta.CellStr['IMP_DENOMINACION',vlReg]);
     if (vlTotal > StrToFloat(edMonto.Text)) then
     begin
         MessageDlg('No se puede realizar la asignación porque excede el Monto por Asignar. Por favor verifique.',mtInformation,[mbok],0);
         exit;
     end;
  end;
  
  vlTotal:=vlRevisa * StrToInt(sagConsulta.CellStr['IMP_DENOMINACION',vlReg]);
  //construye query de actualización
  vlSQL:='BEGIN '+
        '   INSERT INTO DI_VENTA_TC '+
        '      (ID_VENTA_TC,ID_TRANSACCION,NUM_DENOMINACION,CVE_LETRA,NUM_SERIE,IMP_CHEQUES,'+
        '       IMP_TRANSACCION,CVE_MONEDA,ID_SUCURSAL_AE, FH_VENTA,CVE_USU_VENTA,CVE_SITUACION)  '+
        '   VALUES ('+
              IntToStr(GeneraFolio('FOLIO','VENTA',Objeto.Apli,FALSE)) +', '+
              edID_TRANSACCION.Text +', '+
              sagConsulta.CellStr['IMP_DENOMINACION',vlReg] + ', '''+
              sagConsulta.CellStr['CVE_LETRA',vlReg] + ''', '+
              sagConsulta.CellStr['NUM_SERIE',vlReg] + ', '+
              edTotal.Text + ', '+
              edIMP_TRANS_PROD.Text + ', '''+
              sagConsulta.CellStr['CVE_MONEDA',vlReg] + ''', '+
              sagConsulta.CellStr['ID_SUC_AMERI',vlReg] + ', SYSDATE, '''+Objeto.Apli.Usuario+''',''NE'');'+
        '   UPDATE DI_INVENTARIO_TC '+
        '   SET IMP_UTILIZADO = IMP_UTILIZADO +'+ FloatToStr(vlTotal) +', '+
        '       cve_sit_inven=decode(IMP_UTILIZADO +'+ FloatToStr(vlTotal)+',imp_cheques,''AG'',''DI'') '+
        '   WHERE ID_MESA_CAMBIO='+sagConsulta.CellStr['ID_MESA_CAMBIO',vlReg]+
        '   AND ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',vlReg]+
        '   AND ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',vlReg]+
        '   AND CVE_PROD_AME = '''+sagConsulta.CellStr['CVE_PROD_AME',vlReg]+''' '+
        '   AND ID_INVENTARIO = '+sagConsulta.CellStr['ID_INVENTARIO',vlReg]+';'+
        ' UPDATE DI_DET_INV_TC '+
        ' SET CVE_SITUACION=''AS'', CVE_USU_ASIG='''+Objeto.Apli.Usuario+''', '+
            ' FH_ASIGNACION=SYSDATE, ID_TRANSACCION= '+edID_TRANSACCION.Text +
        ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
        ' and ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',vlReg]+
        ' and ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',vlReg]+
        ' and CVE_PROD_AME ='''+sagConsulta.CellStr['CVE_PROD_AME',vlReg]+''' '+
        ' and ID_INVENTARIO ='+sagConsulta.CellStr['ID_INVENTARIO',vlReg]+
        ' and NUM_SERIE BETWEEN '+ edSerieDe.Text +' AND '+edSerie_A.Text+
        ' AND CVE_SITUACION=''NA''; '+
        ' END; ';
  runsql(vlSQL,Objeto.Apli.Databasename,Objeto.Apli.sessionName,True);
  //termina el proceso
  RevisaOpn;
  ShowMessage('Proceso concluido');
end;

procedure TWDiSelInventario.edSerie_AExit(Sender: TObject);
var vlRevisa, vlDenom:Integer; vlSQL:String;
begin
  if (edSerie_A.Text<>'')and(edSerieDe.Text<>'') then
  begin
    vlSQL:=
        ' SELECT COUNT(*) REVISA  FROM DI_DET_INV_TC '+
        ' WHERE ID_MESA_CAMBIO = '+Objeto.ID_MESA_CAMBIO.AsString +
        ' and ID_DOTACION = '+sagConsulta.CellStr['ID_DOTACION',sagConsulta.SG.Selection.Top]+
        ' and ID_ORDEN = '+sagConsulta.CellStr['ID_ORDEN',sagConsulta.SG.Selection.Top]+
        ' and CVE_PROD_AME ='''+sagConsulta.CellStr['CVE_PROD_AME',sagConsulta.SG.Selection.Top]+''' '+
        ' and ID_INVENTARIO ='+sagConsulta.CellStr['ID_INVENTARIO',sagConsulta.SG.Selection.Top]+
        ' and NUM_SERIE BETWEEN '+ edSerieDe.Text +' AND '+edSerie_A.Text+
        ' AND CVE_SITUACION=''NA'' ';
    GetSQLInt(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'REVISA', vlRevisa,TRUE);
    edTotal.Text:=IntToStr(vlRevisa);
    vlSQL:=
        ' SELECT IMP_DENOMINACION FROM DI_PROD_AME '+
        ' WHERE CVE_PROD_AME ='''+sagConsulta.CellStr['CVE_PROD_AME',sagConsulta.SG.Selection.Top]+''' ';
    GetSQLInt(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'IMP_DENOMINACION', vlDenom,TRUE);
    edImpTot.Text:=IntToStr(vlRevisa* vlDenom);
  end;
end;

procedure TWDiSelInventario.bbMuestraClick(Sender: TObject);
begin
MuestraAsignacion
end;

end.

