unit IntMCoOp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,IntFrm,IntTesoOpera, IntFind;

type
  TWMeConOpe = class(TForm)
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    RGConOpe: TRadioGroup;
    CBConOpe: TComboBox;
    CBConOpeTodos: TCheckBox;
    PConOpe: TPanel;
    btConOpe: TSpeedButton;
    edConOpeDesc: TEdit;
    edConOpe: TEdit;
    CBRelConOpe: TCheckBox;
    procedure RGConOpeClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBConOpeTodosClick(Sender: TObject);
    procedure CBConOpeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btConOpeClick(Sender: TObject);
    procedure CBRelConOpeClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Ejecuta_Rep_OpeConc;
    procedure Ejecuta_Rep_Concepto;
    procedure Ejecuta_Rep_Operacion;
  public
    OPERACION         : TTesoOpera;
    { Public declarations }
  end;

var   ReporteConOpe     : TWMeConOpe;
      PadreLocal        : TInterFrame;

  Procedure Execute_MenuRepOpeCon(ShowPreview:Boolean; Padre:TInterFrame);

implementation

uses IntQRCon, IntQROpe, IntQRRCO;


{$R *.DFM}

Procedure Execute_MenuRepOpeCon(ShowPreview:Boolean; Padre:TInterFrame);
begin
     Try
        PadreLocal:=Padre;
        PadreLocal.GetParams(Padre);
        ReporteConOpe:=TWMeConOpe.Create(Padre);
        ReporteConOpe.OPERACION.GetParams(Padre);
        ReporteConOpe.ShowModal;
     finally
        ReporteConOpe.Free;
     end;
end;

procedure TWMeConOpe.Ejecuta_Rep_OpeConc;
var CadenaSQL:String;  // permite almacenar el query formado con los parametros seleccionados
begin
     Application.CreateForm(TWQRRelConOpe, WQRRelConOpe);

     CadenaSQL:='';

     WQRRelConOpe.QRInterEncabezado1.Apli:=PadreLocal.Apli;

     WQRRelConOpe.QRelConOpe.DatabaseName:=PadreLocal.DataBaseName;
     WQRRelConOpe.QRelConOpe.SessionName:=PadreLocal.SessionName;
     WQRRelConOpe.QRelConOpe.Active:=False;
     WQRRelConOpe.QRelConOpe.Close;    //Activa y limpia el Query de la forma de REPORTE
     WQRRelConOpe.QRelConOpe.SQL.Clear;

     CadenaSQL:=' SELECT TESO_OPER_CONCEP.*,TESO_OPERACION.DESC_C_ID_PRIM DESCOROPE, TESO_CONCEPTO.DESC_C_ID_PRIM DESCORCON FROM TESO_OPER_CONCEP, TESO_OPERACION, TESO_CONCEPTO';

     CadenaSQL:=CadenaSQL+' WHERE TESO_OPERACION.CVE_OPERACION = TESO_OPER_CONCEP.CVE_OPERACION';
     CadenaSQL:=CadenaSQL+' AND TESO_CONCEPTO.CVE_CONCEPTO = TESO_OPER_CONCEP.CVE_CONCEPTO';

     if Length(edConOpe.Text) > 0 then
     begin
          CadenaSQL:=CadenaSQL+' AND TESO_OPER_CONCEP.CVE_OPERACION = ' + #39+edConOpe.Text+#39;
     end;

     WQRRelConOpe.QRelConOpe.SQL.Add(CadenaSQL);
     WQRRelConOpe.QRelConOpe.Open;          //
     WQRRelConOpe.QRelConOpe.Active:=True;  //  Abre y activa el QUERY

     if WQRRelConOpe.QRelConOpe.RecordCount <> 0 then
          WQRRelConOpe.QRRelConOpe.preview       //Verifica que el resultado del Query no sea CERO; si lo es avisa al usuario y no despliga reporte
     else Showmessage('No se encontrarón Datos');

     WQRRelConOpe.free;
end;

procedure TWMeConOpe.Ejecuta_Rep_Concepto;
var CadenaSQL:String;  // permite almacenar el query formado con los parametros seleccionados
begin
     Application.CreateForm(TWQRCon, WQRCon);

     CadenaSQL:='';

     WQRCon.QRInterEncabezado1.Apli:=PadreLocal.Apli;

     WQRCon.QConcepto.DatabaseName:=PadreLocal.DataBaseName;
     WQRCon.QConcepto.SessionName:=PadreLocal.SessionName;
     WQRCon.QConcepto.Active:=False;
     WQRCon.QConcepto.Close;    //Activa y limpia el Query de la forma de REPORTE
     WQRCon.QConcepto.SQL.Clear;

     CadenaSQL:=' SELECT *  FROM TESO_CONCEPTO';

     WQRCon.QConcepto.SQL.Add(CadenaSQL);
     WQRCon.QConcepto.Open;          //
     WQRCon.QConcepto.Active:=True;  //  Abre y activa el QUERY

     if WQRCon.QConcepto.RecordCount <> 0 then
          WQRCon.QRConcepto.preview       //Verifica que el resultado del Query no sea CERO; si lo es avisa al usuario y no despliga reporte
     else Showmessage('No se encontrarón Datos');

     WQRCon.free;
end;

procedure TWMeConOpe.Ejecuta_Rep_Operacion;
var CadenaSQL:String;  // permite almacenar el query formado con los parametros seleccionados
begin
     Application.CreateForm(TWQROpe, WQROpe);

     CadenaSQL:='';

     WQROpe.QRInterEncabezado1.Apli:=PadreLocal.Apli;

     WQROpe.QOperacion.DatabaseName:=PadreLocal.DataBaseName;
     WQROpe.QOperacion.SessionName:=PadreLocal.SessionName;
     WQROpe.QOperacion.Active:=False;
     WQROpe.QOperacion.Close;    //Activa y limpia el Query de la forma de REPORTE
     WQROpe.QOperacion.SQL.Clear;

     CadenaSQL:='SELECT';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_OPERACION,TESO_OPERACION.B_RETIENE_ISR,TESO_OPERACION.CVE_AF_COSTO,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_AF_POS_COMP,TESO_OPERACION.CVE_AF_POSICION,TESO_OPERACION.CVE_AF_SALDO,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_AF_SDO_BLOQ,TESO_OPERACION.CVE_AF_SDO_COMP,TESO_OPERACION.CVE_AF_SDO_SBC,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_MONEDA_BASE,TESO_OPERACION.CVE_OPER_CPDA,TESO_OPERACION.CVE_OPER_VMTO,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_TIP_POSIC,TESO_OPERACION.CVE_TIPO_OPER CTO,TESO_OPERACION.DESC_C_ID_PRIM,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.DESC_C_ID_SEC,TESO_OPERACION.DESC_L_ID_PRIM,TESO_OPERACION.DESC_L_ID_SEC,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.B_CORTE_INFORM,TESO_OPERACION.B_GENERA_TRAN,TESO_OPERACION.CVE_AF_CAPITAL,';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_AF_INTERES,';

     CadenaSQL:=CadenaSQL+' MONEDA.DESC_MONEDA, TIPO_POSICION.DESC_TIPO_POSIC';
     CadenaSQL:=CadenaSQL+' FROM TESO_OPERACION, MONEDA, TIPO_POSICION WHERE';
     CadenaSQL:=CadenaSQL+' TESO_OPERACION.CVE_MONEDA_BASE = MONEDA.CVE_MONEDA AND';
     CadenaSQL:=CadenaSQL+' TIPO_POSICION.CVE_TIP_POSIC   (+)= TESO_OPERACION.CVE_TIP_POSIC';

     if Not(CBConOpeTodos.Checked) then
     begin
          if CBConOpe.Text = 'Mercado de  Valores' then
               CadenaSQL:=CadenaSQL+' AND TESO_OPERACION.CVE_TIPO_OPER =' + #39 +'MV'+#39
          else if CBConOpe.Text = 'Crédito' then
               CadenaSQL:=CadenaSQL+' AND TESO_OPERACION.CVE_TIPO_OPER =' + #39 +'CR'+#39
          else if CBConOpe.Text = 'Inversión' then
               CadenaSQL:=CadenaSQL+' AND TESO_OPERACION.CVE_TIPO_OPER =' + #39 +'IN'+#39
          else if CBConOpe.Text = 'Movimiento de Efectivo' then
               CadenaSQL:=CadenaSQL+' AND TESO_OPERACION.CVE_TIPO_OPER =' + #39 +'EF'+#39
          else if CBConOpe.Text = 'Leyenda' then
               CadenaSQL:=CadenaSQL+' AND TESO_OPERACION.CVE_TIPO_OPER =' + #39 +'LE'+#39
     end;

     CadenaSQL:=CadenaSQL+' ORDER BY TESO_OPERACION.CVE_TIPO_OPER';

     WQROpe.QOperacion.SQL.Add(CadenaSQL);
     WQROpe.QOperacion.Open;          //
     WQROpe.QOperacion.Active:=True;  //  Abre y activa el QUERY

     if WQROpe.QOperacion.RecordCount <> 0 then
          WQROpe.QROperacion.preview       //Verifica que el resultado del Query no sea CERO; si lo es avisa al usuario y no despliga reporte
     else Showmessage('No se encontrarón Datos');

     WQROpe.free;
end;


procedure TWMeConOpe.RGConOpeClick(Sender: TObject);
begin
     if RGConOpe.ItemIndex=0 then
     begin
          CBConOpe.Visible:=True;
          CBConOpeTodos.Visible:=True;
          PConOpe.Visible:=False;
     end;
     if RGConOpe.ItemIndex=1 then
     begin
          CBConOpeTodos.Visible:=False;
          CBConOpe.Visible:=False;
          PConOpe.Visible:=False;
     end;
     if RGConOpe.ItemIndex=2 then
     begin
          CBConOpeTodos.Visible:=False;
          CBConOpe.Visible:=False;
          PConOpe.Visible:=True;
     end;
end;

procedure TWMeConOpe.BBCancelarClick(Sender: TObject);
begin
     close;
end;

procedure TWMeConOpe.FormCreate(Sender: TObject);
begin
      OPERACION:=TTesoOpera.Create(Self);
      OPERACION.MasterSource:=PadreLocal;
      OPERACION.CVE_OPERACION.MasterField:='CVE_OPERACION';
      RGConOpe.ItemIndex:=0;
end;

procedure TWMeConOpe.CBConOpeTodosClick(Sender: TObject);
begin
     if CBConOpeTodos.Checked then
     Begin
          CBConOpe.Style:=csDropDown;
          CBConOpe.Text:='';
          CBConOpe.Style:=csDropDownList;
     End;
end;

procedure TWMeConOpe.CBConOpeChange(Sender: TObject);
begin
     CBConOpeTodos.Checked:=False;
end;

procedure TWMeConOpe.FormShow(Sender: TObject);
begin
     OPERACION.CVE_OPERACION.Control:=edConOpe;     // EDIT DE CLAVE DE OPERACION
     OPERACION.DESC_C_ID_PRIM.Control:=edConOpeDesc;// EDIT MUESTRE DESCRIPCION
     OPERACION.MasterSourceEditControl:=btConOpe;   // MASTER SOURCE EDIT CONTROL
end;

procedure TWMeConOpe.FormDestroy(Sender: TObject);
begin
     OPERACION.CVE_OPERACION.Control:=NIL;
     OPERACION.DESC_C_ID_PRIM.Control:=NIL;
     OPERACION.MasterSourceEditControl:=NIL;
     // NO SE DESASIGNA edOperacion.PopupMenu:=Objeto.OPERACION.PopMenu; // MENU POP
end;

procedure TWMeConOpe.btConOpeClick(Sender: TObject);
begin
     if OPERACION.Busca then
        CBRelConOpe.Checked:=False;
     //end if
end;


procedure TWMeConOpe.CBRelConOpeClick(Sender: TObject);
begin
     if CBRelConOpe.Checked then
     begin
          edConOpeDesc.Clear;
          edConOpe.Clear;
     end;
end;

procedure TWMeConOpe.BBAceptarClick(Sender: TObject);
begin
     if RGConOpe.ItemIndex = 0 then
     begin
          Ejecuta_Rep_Operacion;
     end
     else if RGConOpe.ItemIndex = 1 then
     begin
          Ejecuta_Rep_Concepto;
     end
     else if RGConOpe.ItemIndex = 2 then
     begin
          if (Length(edConOpe.Text) > 0) or CBRelConOpe.Checked then
              Ejecuta_Rep_OpeConc
          else
              ShowMessage('Indique primero una CLAVE DE OPERACION');
     end;
end;


end.
