// Sistema         : Clase de IntCrCartera
// Fecha de Inicio : SEP 2006
// Función forma   : Clase de IntCrCartera
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alicia Maya
Unit IntCrCartera;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntMensaje, ComObj,IntXls,
  IntSGCtrl, IntGenCre;



Type
 TCrCartera= class; 

  TWCrCartera=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SaveDialog1: TSaveDialog;
    btReporte: TBitBtn;
    GroupBox1: TGroupBox;
    cbCte: TCheckBox;
    cbCto: TCheckBox;
    cbAmbas: TCheckBox;
    cbSinGpo: TCheckBox;
    Panel2: TPanel;
    btArchivo: TBitBtn;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    Panel3: TPanel;
    EDFecha: TEdit;
    Label1: TLabel;
    dtFecha: TInterDateTimePicker;
    rgArchivo: TRadioGroup;
    pbCartera: TProgressBar;
    qDatos: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure btArchivoClick(Sender: TObject);
    procedure btReporteClick(Sender: TObject);
    procedure cbCteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbCtoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbAmbasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbSinGpoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCartera;
    sFechaR, sFecha2,sFecha3 :STring; 

    Procedure  Imprimir(bImprimir : Boolean);                   
    Procedure  EscribeRegistro;
    Procedure  EscribeInformacion;
    procedure  AbreCursor;
    function   FunSQLDisposicion(sTipDol,sTipUDI:String):String;
    function   FunSQLContrato(sTipDol,sTipUDI:String):String;
    function   FunSQLCliente(sTipDol,sTipUDI:String):String;
    procedure  EscribeEncabezado;   
    procedure  BuscaSDOConta2609(var sCte, sSdo, sCta:String; sFecha:String);  //MARA4356 SE AGREGA PARA SALDO CONTABLE DE LA CUENTA 26096222

end;
 TCrCartera= class(TInterFrame)
      private
      protected
      public
        ParamCre                 : TParamCre;
        { Public declarations }
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;
VAR
    vgnRowExcel : Integer;
    vgB_SALIDA_EXCEL : Boolean;
    vgExcelApp : OleVariant;
    vgFileName : String;


implementation
Uses RptCartera, RptCartTot;

{$R *.DFM}


constructor TCrCartera.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCartera.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCartera.Destroy;
begin inherited;
end;


function TCrCartera.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCartera;
begin
   W:=TWCrCartera.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo :=ftConsulta; //ftImprimir;//FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCartera.InternalBusca:Boolean;
begin //
end;

function TCrCartera.Reporte:Boolean;
begin //Execute_Reporte();
end;

(***********************************************FORMA IntCrTAS********************)
(*                                                                               *)
(*  FORMA DE IntCrCartera                                                         *)
(*                                                                               *)
(***********************************************FORMA IntCrTAS********************)
procedure TWCrCartera.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
   qDatos.DataBaseName:= Objeto.Apli.DataBaseName;
   qDatos.SessionName := Objeto.Apli.SessionName;
   EDFecha.Text       := DateToStr(Objeto.Apli.DameFechaEmpresa);
end;

procedure TWCrCartera.FormDestroy(Sender: TObject);
begin   //Objeto
end;

procedure TWCrCartera.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCartera.Imprimir(bImprimir : Boolean);
begin 
  if (cbSinGpo.Checked) or ((not cbCte.Checked) and (not cbCto.Checked) and (not cbAmbas.Checked) and (not cbSinGpo.Checked)) then
     EXE_REP_CARTERA(Objeto, EDFecha.Text, bImprimir)
  else
    if (cbAmbas.Checked) or ((cbCte.Checked) and (cbCto.Checked)) then
       EXE_REP_CARTERA_TOT(Objeto, EDFecha.Text, -1, bImprimir)
    else
      if cbCte.Checked then
        EXE_REP_CARTERA_TOT(Objeto, EDFecha.Text,  0, bImprimir)
      else
        EXE_REP_CARTERA_TOT(Objeto, EDFecha.Text,  1, bImprimir);
end;

procedure TWCrCartera.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.XLS';
  End Else
    edNbrArch.Text := '';
end;

procedure TWCrCartera.InterForma1Imprimir(Sender: TObject);
begin //
end;

procedure TWCrCartera.InterForma1Preview(Sender: TObject);
begin //
end;

procedure TWCrCartera.AbreCursor;
var Anio, Mes, Dia: Word;
    sTipDol,sTipUDI:Real; 
begin
   sFechaR:=EDFecha.Text;
   sFecha3:=EDFecha.Text;
   DecodeDate(StrToDate(sFechaR), Anio, Mes, Dia);
   CASE MES OF
   1 ,2 ,3 :sFechaR:=IntTOStr(Anio-1)+'12';
   4, 5 ,6 :sFechaR:=IntTOStr(Anio)  +'03';
   7, 8 ,9 :sFechaR:=IntTOStr(Anio)  +'06';
   10,11,12:sFechaR:=IntTOStr(Anio)  +'09';
   end;
   GetSQLStr(' SELECT ID_ANIO_MES '+
             ' FROM   DM_CR_DIM_Mes@dwhc '+
             ' WHERE  ANIO  = TO_CHAR(TO_DATE('''+EDFecha.Text+'''),''YYYY'') '+
             ' AND    NUM_MES  = TO_CHAR(TO_DATE('''+EDFecha.Text+'''),''MM'') ',
               Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_ANIO_MES',sFecha2,False);
   GetSQLFloat(' SELECT TIPO_CAMBIO '+
               ' FROM TIPO_CAMBIO_MON '+
               ' WHERE CVE_MONEDA_BASE  = 484 AND '+
               '       CVE_MONEDA_REFER = 840 AND '+
               '       F_LIQUIDACION    = TO_DATE('''+EDFecha.Text+''',''DD/MM/YYYY'') AND '+
               '       CVE_MEDIO        = ''MK'' ',
               Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TIPO_CAMBIO',sTipDol,False);
   GetSQLFloat(' SELECT TIPO_CAMBIO '+
               ' FROM TIPO_CAMBIO_MON '+
               ' WHERE CVE_MONEDA_BASE  = 484 AND '+
               '       CVE_MONEDA_REFER = 800 AND '+
               '       F_LIQUIDACION    = TO_DATE('''+EDFecha.Text+''',''DD/MM/YYYY'') AND '+
               '       CVE_MEDIO        = ''MK'' ',
               Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TIPO_CAMBIO',sTipUDI,False);
  qDatos.Close;
  case rgArchivo.ItemIndex of
   0: qDatos.SQL.Text:=FunSQLCliente    (FloatToStr(sTipDol), FloatToStr(sTipUDI));
   1: qDatos.SQL.Text:=FunSQLContrato   (FloatToStr(sTipDol), FloatToStr(sTipUDI));
   2: qDatos.SQL.Text:=FunSQLDisposicion(FloatToStr(sTipDol), FloatToStr(sTipUDI));
  end;
  qDatos.SQL.SaveToFile('C:\Cartera1001.sql');
  qDatos.Open;
end;

procedure TWCrCartera.EscribeInformacion;
var fCredit, fCapVig, fCapImp, fCapVen, fImpRef, fIntVig, fIntImp, fTotCre :Double;
    sCLIENTE, sSALDO, sCUENTA:String; 
begin
   fCapVig:=0; fCapImp:=0; fCapVen:=0; fImpRef:=0; fIntVig:=0; fIntImp:=0; fTotCre:=0;
   vgnRowExcel:=1;;
   vgExcelApp := CreateOleObject('Excel.Application');
   vgExcelApp.Workbooks.Add;
   //Encabezado
   EscribeEncabezado;   
   qDatos.First;
   //escribe registros
   pbCartera.Position:= 3;
   while not(qDatos.Eof) do
   begin
     fCredit:=fCredit+qDatos.FieldByName('IMP_CREDITO').AsFloat;
     fCapVig:=fCapVig+qDatos.FieldByName('IMP_SDO_K_VIG_VP').AsFloat; 
     fCapImp:=fCapImp+qDatos.FieldByName('IMP_SDO_K_IMP_VP').AsFloat; 
     fCapVen:=fCapVen+qDatos.FieldByName('IMP_SDO_K_VEN_VP').AsFloat; 
     fImpRef:=fImpRef+qDatos.FieldByName('IMPORTEREF').AsFloat;
     fIntVig:=fIntVig+qDatos.FieldByName('IMP_INT_CORTE_VP').AsFloat;
     fIntImp:=fIntImp+qDatos.FieldByName('IMP_SDO_IO_IMP_VP').AsFloat; 
     fTotCre:=fTotCre+qDatos.FieldByName('TOTCREDITO').AsFloat;
     Inc(vgnRowExcel);
     EscribeRegistro;
     qDatos.Next;
   end;

   //Guarda archivo
   Inc(vgnRowExcel);
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Z' )].Value := fCredit;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AA')].Value := fCapVig;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AB')].Value := fCapImp;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AC')].Value := fCapVen;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AD')].Value := fImpRef;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AE')].Value := fIntVig;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AF')].Value := fIntImp;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AG')].Value := fCapVig + fCapImp + fCapVen + fIntVig + fIntImp;//fTotCre;09/03/2007 se quita el importe de refinanciamiento

   //MARA4356 BUSCA LA CUENTA CONTABLE 2609 INICIA
   BuscaSDOConta2609(sCLIENTE, sSALDO, sCUENTA, EDFecha.Text);
   vgnRowExcel:=vgnRowExcel+2;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := sCLIENTE;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := sCUENTA;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AG')].Value := sSALDO;   
   //MARA4356 BUSCA LA CUENTA CONTABLE 2609 TERMINA
   
   pbCartera.Position:= 4;
   vgExcelApp.ActiveWorkBook.SaveAs(edNbrArch.Text);
   CloseExcelFile(vgExcelApp);
end;

procedure TWCrCartera.btArchivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARTERA_EXCEL',True,True) then
   begin
     if Trim(edNbrArch.Text)='' then
        MessageDlg('Debe indicar el nombre del archivo a generar. Verifique',mtInformation,[mbok],0 )
     else
     begin
       if Trim(EDFecha.Text)='' then
          MessageDlg('Debe indicar una fecha. Verifique',mtInformation,[mbok],0 )
       else
       begin
         pbCartera.Position:= 1;
         AbreCursor;
         pbCartera.Position:= 2;
         if qDatos<> nil then
            EscribeInformacion;
         pbCartera.Position:= 5;
       end;
     end;
   end;
end;

procedure TWCrCartera.btReporteClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARTERA_REPOR',True,True) then
   begin
     if Trim(EDFecha.Text)='' then
        MessageDlg('Debe indicar una fecha. Verifique',mtInformation,[mbok],0 )
     else
     begin
       if (cbAmbas.Checked) or (cbSinGpo.Checked) then
       begin
         if MessageDlg('El número de hojas es mayor a 500 unidades. ¿Desea continuar?',mtInformation,[mbYES,mbno],0 )=mrYes then
            Imprimir(True);
       end
       else Imprimir(True);
     end;
   end;
end;

procedure TWCrCartera.cbCteMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbSinGpo.Checked:=False;
  cbAmbas.Checked:=False;
end;

procedure TWCrCartera.cbCtoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbSinGpo.Checked:=False;
  cbAmbas.Checked:=False;
end;

procedure TWCrCartera.cbAmbasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cbCte.Checked:=False;
  cbCto.Checked:=False;
  cbSinGpo.Checked:=False;
end;

procedure TWCrCartera.cbSinGpoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  cbCte.Checked:=False;
  cbCto.Checked:=False;
  cbAmbas.Checked:=False;
end;

function  TWCrCartera.FunSQLDisposicion(sTipDol,sTipUDI:String):String;
var SQL:STRING;
begin
SQL:=
' ( '+
' SELECT A.ID_OLTP_ACREDITADO, A.ID_OLTP_PROM_ASOC,A.ID_OLTP_PROM_ADMIN, A.producto, A.ORI_REC_GBL, C.TASA_APLICADA, '+
'        A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, TO_CHAR(C.CVE_TIPO_CRED_BC) AS t_credito,  '+
//'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP,    '+
'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP AS IMP_SDO_IO_IMP_VP,    '+
'        C.ID_CREDITO, C.T_PERS, C.CVE_ACTIV_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.F_INICIO,  '+
'        C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES,  '+
'        decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO) as IMP_CREDITO,  '+
'        C.CVE_TASA_REFER, C.SOBRETASA, C.CVE_GRUPO_ECO,  '+
'        D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP_EXPUESTO, E.IMP_RESERVA_CUB,  '+
'        E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, (E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA,  '+
'        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE,  '+
'        NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_CONTABLE,  '+
'        NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_INTERES,  '+
'        nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) as IMPORTEREF,    '+
//'        (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) +  '+
//'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP ) AS TOTCREDITO,  CVE_CALIFIC_EXP  '+
'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP ) AS TOTCREDITO,  CVE_CALIFIC_EXP,  '+ coCRLF +

//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 )'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CR_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CR_FINAN_ADIC'+ coCRLF +
'                   WHERE  ( ( SIT_FINAN_ADIC = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_FINAN_ADIC = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )   )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CR_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  C.ID_CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +

// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO,  '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE '+
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''ICRE'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'        P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'        decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'        p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'        C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, '+
'        CP.cve_producto_cre, CCT.cve_moneda, CT.id_empresa, CVE_GRUPO_ECO  ,CP.CVE_TIPO_CRED_BC, CH.TASA_APLICADA '+
'       from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CR_ACREDITADO CA, CR_PRODUCTO  CP, CR_HISTO_CRED ch '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CA.ID_ACREDITADO = P.ID_PERSONA '+
'       AND CCT.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '+
'       AND CH.ID_CREDITO (+)= C.ID_CREDITO '+
'       AND CH.F_CIERRE (+)= '''+sFecha3+''' ) C, '+
//     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'' ' +
'       GROUP BY id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'     ) E, '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' 	( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, '+
'              SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREVI, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '+
'  	  FROM '+
' 		 (SELECT CP.*, CRPM.CVE_MONEDA '+
'           FROM CR_PRODUCTO CP, '+
'               (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '+
'                WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'') '+
'                AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''INREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') INREVI, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''CAREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CAREVI '+
'           WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '+
'           AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '+
'           AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '+
'           AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '+
'           AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE  '+
'           AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TABCTAICRE,  '+
'          (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
'           FROM cr_producto CP, '+
'               (SELECT ''IN'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-''||  '+
'                       SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ //GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
'                AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+
'                AND GC.CLAVE_MONEDA = ''PESOS'' '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'' OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt, '+
'               (SELECT ''KA'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '+
'                       SUBSTR(GC.CUENTA_CONTABLE,1,4)|| ''-''|| SUBSTR(GC.CUENTA_CONTABLE,5,4)||''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2)AS CUENTA_VIGENTE '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ //GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (300000)    '+
'                AND GC.CLAVE_MONEDA = ''PESOS''  '+
'                AND GC.CAMPO_IMPORTE = ''02''   '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,   '+
'              (SELECT ''KA'' AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CTA_CONTABLE||''-''||SUBSTR(SUB_CTA_CONTABLE,1,4)||''-''||SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
'               FROM CR_CONT_PRODUCTO  CCP '+
'               WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK '+
'           WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )TABCTA, '+
//REFINANCIAMEINTO
'          (SELECT FINAN.ID_CREDITO, '+
'                 SUM(FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO) IMPORTEREF '+
'            FROM CR_FINAN_ADIC FINAN, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO '+
'           WHERE TO_DATE('''+sFecha3+''',''DD/MM/YYYY'') > FINAN.F_VENCIMIENTO '+
'             AND FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO > 0 '+
'             AND CRD.ID_CREDITO = FINAN.ID_CREDITO '+
'             AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
'             AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
'             AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
'           GROUP BY FINAN.ID_CREDITO ) TABREF '+
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//WHERE PRINCIPAL
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '+
' AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '+
' AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '+
' AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '+
' AND   C.ID_CREDITO = TABREF.ID_CREDITO(+) '+
' AND  (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+
'       A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) <> 0 '+
//' AND   SUBSTR(NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI),1,2)=''13'' '+// END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' ) '+
' UNION ALL '+
//--INTERCREDITOS CRE_CREDITO 12.48
' ( '+
' SELECT A.ID_OLTP_ACREDITADO, A.ID_OLTP_PROM_ASOC,A.ID_OLTP_PROM_ADMIN, A.producto, A.ORI_REC_GBL, '+
'        DECODE(A.IMP_SDO_K_VEN_VP, 0, C.TASA_APLICADA, C.TASA_APLI) AS TASA_APLICADA, '+
'        A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, TO_CHAR(C.TIPO_CUENTA) AS t_credito, '+
//'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP, '+
'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP AS IMP_SDO_IO_IMP_VP,    '+
'        C.ID_CREDITO, C.T_PERS, C.CVE_ACTIV_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.F_INICIO, '+
'        C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, '+
'        decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO) as IMP_CREDITO,  '+
'        C.CVE_TASA_REFER, C.SOBRETASA, C.CVE_GRUPO_ECO, '+
'        D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP_EXPUESTO, E.IMP_RESERVA_CUB, '+
'        E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, (E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, '+
'        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+
'        DECODE (TIPO_DISPOSICION,''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2), '+
'                                          ''1324-''||substr(TIPO_CUENTA,4,2)||''01-00''), '+
'            TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2) )  CUENTA_CONTABLE, '+
'        DECODE (TIPO_DISPOSICION, ''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0, '+
'             DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'                    SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)), '+
'              ''1319-2000-00''),  '+
'              DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'              SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)) )  CUENTA_INTERES, 0 AS IMPORTEREF, '+
'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO,  CVE_CALIFIC_EXP, '+ coCRLF +
//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 )'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CRE_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CRE_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  C.ID_CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +
// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/

//'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO,  CVE_CALIFIC_EXP '+
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP,IMP_INT_CORTE '+
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''INTERCREDITOS'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'         P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'         decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'         p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'         C.F_AUT_OPERACION AS F_INICIO, DECODE(C.F_TRASPASO_VENC,NULL,C.F_VALOR_CRED +C.DIAS_PLAZO,C.F_TRASPASO_VENC) AS F_VENCIMIENTO, ''N/A'' AS CVE_OPERATIVA,  '+
'         DECODE(C.B_CAPITAL_PER,''V'',''POR PERIODO'',''AL VENCIMIENTO'')AS CVE_AMORTIZACION, '+
'         DECODE(B_INTERES_PER,''V'',''POR PERIODOS'',DECODE(CVE_CALCULO,''AN'',''AL INICIO'',''AL VENCIMIENTO''))AS CVE_PAG_INTERES, '+
'         C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '+
'         CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_ECO, '+
'         TA.TASA_APLICADA, (SELECT TASA_APLICADA FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO '+
'                            AND F_PROVISION = (SELECT MAX(F_PROVISION) FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO)) AS TASA_APLI '+
'       from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_SUB_TIP_CNBV cnbv, '+
'            CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA, CRE_PROV_DIARIA TA '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+
'       AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '+
'       AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '+
'       AND CA.ID_PERSONA = P.ID_PERSONA '+
'       AND TA.ID_CREDITO (+)=C.ID_CREDITO '+
'       AND TA.F_PROVISION(+)='''+sFecha3+''' ) C, '+
//    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ 
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'' ' +
'       GROUP BY id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'     ) E, '+
'     ( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP)  <> 0 '+
//' AND   (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP )  <> 0 '+
//' AND  SUBSTR(TIPO_CUENTA,1,2)=''13'' '+// END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' ) ';
  FunSQLDisposicion:=SQL;
end;


function  TWCrCartera.FunSQLContrato(sTipDol,sTipUDI:String):String;
var SQL:STRING;
begin
 SQL:=
' ( '+
' SELECT A.ID_OLTP_ACREDITADO,                              decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+
'        C.CVE_GRUPO_ECO,                                   C.CVE_ACTIV_ECO_SITI,  '+
'        C.T_PERS,                                          C.LOCALIDAD,  '+
'        C.ID_CONTRATO,                                     A.producto, '+
'        A.ORI_REC_GBL,                                     C.CVE_OPERATIVA, '+
'        A.ID_OLTP_MONEDA,                                  A.CVE_CAT_MINIMO, '+
'        MIN(C.F_INICIO) AS F_INICIO,                       MAX(C.F_VENCIMIENTO) AS F_VENCIMIENTO, '+
'        NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_CONTABLE, '+
'        NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_INTERES,  '+
'        D.cve_cal_acred,                                   MAX(E.CVE_CALIFIC_CUB) AS CVE_CALIFIC_CUB, '+
'        SUM(decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO)) AS IMP_CREDITO, '+
'        SUM(A.IMP_SDO_K_VIG_VP) AS IMP_SDO_K_VIG_VP, '+
'        SUM(A.IMP_SDO_K_IMP_VP) AS IMP_SDO_K_IMP_VP, '+
'        SUM(A.IMP_SDO_K_VEN_VP) AS IMP_SDO_K_VEN_VP, '+
'        SUM(nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0)) AS IMPORTEREF, '+
'        SUM(A.IMP_INT_CORTE_VP) AS IMP_INT_CORTE_VP, '+
//'        SUM(A.IMP_SDO_IO_IMP_VP) AS IMP_SDO_IO_IMP_VP, '+
'        SUM(A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS IMP_SDO_IO_IMP_VP, '+
//'        SUM(nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+
//'            A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP) AS TOTCREDITO, '+
'        SUM(A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO, '+
'        SUM(E.IMP_CUBIERTO) AS IMP_CUBIERTO,               SUM(E.IMP_EXPUESTO) AS IMP_EXPUESTO, '+
'        SUM(E.IMP_RESERVA_CUB) AS IMP_RESERVA_CUB,         SUM(E.IMP_RESERVA_EXP) AS IMP_RESERVA_EXP, '+
'        SUM(E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, MAX(CVE_CALIFIC_EXP) AS CVE_CALIFIC_EXP, max(A.NUM_DIAS_VDO)NUM_DIAS_VDO '+
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE, '+
//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 )AS NUM_DIAS_VDO'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CR_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CR_FINAN_ADIC'+ coCRLF +
'                   WHERE  ( ( SIT_FINAN_ADIC = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_FINAN_ADIC = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )   )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CR_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  bb.CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +

// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''ICRE'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'        P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'        decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'        p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'        C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, '+
'        CP.cve_producto_cre, CCT.cve_moneda, CT.id_empresa, CVE_GRUPO_ECO  ,CP.CVE_TIPO_CRED_BC, CH.TASA_APLICADA '+
'       from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CR_ACREDITADO CA, CR_PRODUCTO  CP, CR_HISTO_CRED ch '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CA.ID_ACREDITADO = P.ID_PERSONA '+
'       AND CCT.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '+
'       AND CH.ID_CREDITO (+)= C.ID_CREDITO '+
'       AND CH.F_CIERRE (+)= '''+sFecha3+''' ) C, '+
//     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'') E, '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' 	( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, '+
'              SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREVI, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '+
'  	  FROM '+
' 		 (SELECT CP.*, CRPM.CVE_MONEDA '+
'           FROM CR_PRODUCTO CP, '+
'               (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '+
'                WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'') '+
'                AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''INREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') INREVI, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''CAREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CAREVI '+
'           WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '+
'           AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '+
'           AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '+
'           AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '+
'           AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE  '+
'           AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TABCTAICRE,  '+
'          (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
'           FROM cr_producto CP, '+
'               (SELECT ''IN'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-''||  '+
'                       SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ //GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
'                AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+
'                AND GC.CLAVE_MONEDA = ''PESOS'' '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'' OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt, '+
'               (SELECT ''KA'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '+
'                       SUBSTR(GC.CUENTA_CONTABLE,1,4)|| ''-''|| SUBSTR(GC.CUENTA_CONTABLE,5,4)||''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2)AS CUENTA_VIGENTE '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ //GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (300000)    '+
'                AND GC.CLAVE_MONEDA = ''PESOS''  '+
'                AND GC.CAMPO_IMPORTE = ''02''   '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,   '+
'              (SELECT ''KA'' AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CTA_CONTABLE||''-''||SUBSTR(SUB_CTA_CONTABLE,1,4)||''-''||SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
'               FROM CR_CONT_PRODUCTO  CCP '+
'               WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK '+
'           WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )TABCTA, '+
//REFINANCIAMEINTO
'          (SELECT FINAN.ID_CREDITO, '+
'                 SUM(FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO) IMPORTEREF '+
'            FROM CR_FINAN_ADIC FINAN, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO '+
'           WHERE TO_DATE('''+sFecha3+''',''DD/MM/YYYY'') > FINAN.F_VENCIMIENTO '+
'             AND FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO > 0 '+
'             AND CRD.ID_CREDITO = FINAN.ID_CREDITO '+
'             AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
'             AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
'             AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
'           GROUP BY FINAN.ID_CREDITO ) TABREF '+
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//WHERE PRINCIPAL
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '+
' AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '+
' AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '+
' AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '+
' AND   C.ID_CREDITO = TABREF.ID_CREDITO(+) '+
' AND  (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+
'       A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) <> 0 '+
//' AND   SUBSTR(NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI),1,2)=''13'' '+ // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' GROUP BY A.ID_OLTP_ACREDITADO,       decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF), '+
'        C.CVE_GRUPO_ECO,                C.CVE_ACTIV_ECO_SITI,  '+
'        C.T_PERS,                       C.LOCALIDAD,  '+
'        C.ID_CONTRATO,                  A.producto, '+
'        A.ORI_REC_GBL,                  C.CVE_OPERATIVA, '+
'        A.ID_OLTP_MONEDA,               A.CVE_CAT_MINIMO, '+
'        D.cve_cal_acred,  '+
'        NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) , '+
'        NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) '+
' )  '+
' union all '+
' (  '+
' SELECT A.ID_OLTP_ACREDITADO,   decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+
'        C.CVE_GRUPO_ECO,        C.CVE_ACTIV_ECO_SITI,       C.T_PERS,'+
'        C.LOCALIDAD,            C.ID_CONTRATO,              A.producto,'+
'        A.ORI_REC_GBL,          C.CVE_OPERATIVA,            A.ID_OLTP_MONEDA,       A.CVE_CAT_MINIMO,       '+
'        MIN(C.F_INICIO) AS F_INICIO,'+
'        MAX(C.F_VENCIMIENTO) AS F_VENCIMIENTO, '+
'        DECODE (TIPO_DISPOSICION,''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2), '+
'                                          ''1324-''||substr(TIPO_CUENTA,4,2)||''01-00''), '+
'            TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2) )  CUENTA_CONTABLE, '+
'        DECODE (TIPO_DISPOSICION, ''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0, '+
'             DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'                    SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)), '+
'              ''1319-2000-00''),  '+
'              DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'              SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)) )  CUENTA_INTERES, '+
'        D.cve_cal_acred, '+
'        MAX(E.CVE_CALIFIC_CUB) AS CVE_CALIFIC_CUB, '+
'        SUM(decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO)) AS IMP_CREDITO, '+
'        SUM(A.IMP_SDO_K_VIG_VP) AS IMP_SDO_K_VIG_VP, '+
'        SUM(A.IMP_SDO_K_IMP_VP) AS IMP_SDO_K_IMP_VP, '+
'        SUM(A.IMP_SDO_K_VEN_VP) AS IMP_SDO_K_VEN_VP, '+
'        SUM(0.0) AS IMPORTEREF, '+
'        SUM(A.IMP_INT_CORTE_VP) AS IMP_INT_CORTE_VP, '+
'        SUM(A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS IMP_SDO_IO_IMP_VP, '+
'        SUM(A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP) AS TOTCREDITO, '+
'        SUM(E.IMP_CUBIERTO) AS IMP_CUBIERTO,                   SUM(E.IMP_EXPUESTO) AS IMP_EXPUESTO, '+
'        SUM(E.IMP_RESERVA_CUB) AS IMP_RESERVA_CUB,             SUM(E.IMP_RESERVA_EXP) AS IMP_RESERVA_EXP, '+
'        SUM(E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, MAX(CVE_CALIFIC_EXP) AS CVE_CALIFIC_EXP, max(A.NUM_DIAS_VDO)NUM_DIAS_VDO '+
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP,IMP_INT_CORTE, '+
//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 ) NUM_DIAS_VDO'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CRE_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CRE_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  bb.CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +
// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''INTERCREDITOS'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'         P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'         decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'         p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'         C.F_AUT_OPERACION AS F_INICIO, DECODE(C.F_TRASPASO_VENC,NULL,C.F_VALOR_CRED +C.DIAS_PLAZO,C.F_TRASPASO_VENC) AS F_VENCIMIENTO, ''N/A'' AS CVE_OPERATIVA,  '+
'         DECODE(C.B_CAPITAL_PER,''V'',''POR PERIODO'',''AL VENCIMIENTO'')AS CVE_AMORTIZACION, '+
'         DECODE(B_INTERES_PER,''V'',''POR PERIODOS'',DECODE(CVE_CALCULO,''AN'',''AL INICIO'',''AL VENCIMIENTO''))AS CVE_PAG_INTERES, '+
'         C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '+
'         CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_ECO, '+
'         TA.TASA_APLICADA, (SELECT TASA_APLICADA FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO '+
'                            AND F_PROVISION = (SELECT MAX(F_PROVISION) FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO)) AS TASA_APLI '+
'       from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_SUB_TIP_CNBV cnbv, '+
'            CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA, CRE_PROV_DIARIA TA '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+
'       AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '+
'       AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '+
'       AND CA.ID_PERSONA = P.ID_PERSONA '+
'       AND TA.ID_CREDITO (+)=C.ID_CREDITO '+
'       AND TA.F_PROVISION(+)='''+sFecha3+''' ) C, '+
//    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'') E '+
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP)  <> 0 '+
//' AND  SUBSTR(TIPO_CUENTA,1,2)=''13'' '+ // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' GROUP BY A.ID_OLTP_ACREDITADO,       decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF), '+
'        C.CVE_GRUPO_ECO,              C.CVE_ACTIV_ECO_SITI,        C.T_PERS,  '+
'        C.LOCALIDAD,                  C.LOCALIDAD,                 C.ID_CONTRATO, '+
'        A.producto,                   A.ORI_REC_GBL,               C.CVE_OPERATIVA, '+
'        A.ID_OLTP_MONEDA,             A.CVE_CAT_MINIMO,            D.cve_cal_acred, '+
'        DECODE (TIPO_DISPOSICION,''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2), '+
'                                          ''1324-''||substr(TIPO_CUENTA,4,2)||''01-00''), '+
'            TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2) ) , '+
'        DECODE (TIPO_DISPOSICION, ''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0, '+
'             DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'                    SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)), '+
'              ''1319-2000-00''),  '+
'              DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'              SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)) )  '+
' ) ';
 FunSQLContrato:=SQL;
end;

function  TWCrCartera.FunSQLCliente(sTipDol,sTipUDI:String):String;
var SQL:STRING;
begin
 SQL:=
' ( '+
' SELECT A.ID_OLTP_ACREDITADO,                         decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+
'        C.CVE_GRUPO_ECO,                              C.CVE_ACTIV_ECO_SITI,  '+
'        C.T_PERS,                                     C.LOCALIDAD,  '+
'        D.cve_cal_acred,                              MAX(E.CVE_CALIFIC_CUB) AS CVE_CALIFIC_CUB, '+
'        MIN(C.F_INICIO) AS F_INICIO,                  MAX(C.F_VENCIMIENTO) AS F_VENCIMIENTO, '+
'        SUM(decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO)) AS IMP_CREDITO, '+
'        SUM(A.IMP_SDO_K_VIG_VP) AS IMP_SDO_K_VIG_VP, '+
'        SUM(A.IMP_SDO_K_IMP_VP) AS IMP_SDO_K_IMP_VP, '+
'        SUM(A.IMP_SDO_K_VEN_VP) AS IMP_SDO_K_VEN_VP, '+
'        SUM(nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0)) AS IMPORTEREF, '+
'        SUM(A.IMP_INT_CORTE_VP) AS IMP_INT_CORTE_VP, '+
'        SUM(A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP) AS IMP_SDO_IO_IMP_VP,  '+
//'        SUM(nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+
//'         A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP ) AS TOTCREDITO, '+
'        SUM(A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP ) AS TOTCREDITO, '+
'        SUM(E.IMP_CUBIERTO) AS IMP_CUBIERTO,         SUM(E.IMP_EXPUESTO) AS IMP_EXPUESTO, '+
'        SUM(E.IMP_RESERVA_CUB) AS IMP_RESERVA_CUB,   SUM(E.IMP_RESERVA_EXP) AS IMP_RESERVA_EXP, '+
'        SUM(E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, MIN(ID_OLTP_PROM_ASOC) as ID_OLTP_PROM_ASOC, MIN(ID_OLTP_PROM_ADMIN) as ID_OLTP_PROM_ADMIN, '+
'        MIN(TO_CHAR(C.CVE_TIPO_CRED_BC)) AS t_credito, MAX(CVE_CALIFIC_EXP) AS CVE_CALIFIC_EXP, max(A.NUM_DIAS_VDO) AS NUM_DIAS_VDO '+
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE, '+
//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 )AS NUM_DIAS_VDO'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CR_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CR_FINAN_ADIC'+ coCRLF +
'                   WHERE  ( ( SIT_FINAN_ADIC = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_FINAN_ADIC = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )   )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CR_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  bb.CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +

// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''ICRE'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'        P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'        decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'        p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'        C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, '+
'        CP.cve_producto_cre, CCT.cve_moneda, CT.id_empresa, CVE_GRUPO_ECO  ,CP.CVE_TIPO_CRED_BC, CH.TASA_APLICADA '+
'       from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CR_ACREDITADO CA, CR_PRODUCTO  CP, CR_HISTO_CRED ch '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CA.ID_ACREDITADO = P.ID_PERSONA '+
'       AND CCT.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '+
'       AND CH.ID_CREDITO (+)= C.ID_CREDITO '+
'       AND CH.F_CIERRE (+)= '''+sFecha3+''' ) C, '+
//     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/ 
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ 
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'') E, '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/ 
' 	( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, '+
'              SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREVI, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '+
'  	  FROM '+
' 		 (SELECT CP.*, CRPM.CVE_MONEDA '+
'           FROM CR_PRODUCTO CP, '+
'               (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '+
'                WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'') '+
'                AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''INREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') INREVI, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''CAREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CAREVI '+
'           WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '+
'           AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '+
'           AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '+
'           AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '+
'           AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE  '+
'           AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TABCTAICRE,  '+
'          (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
'           FROM cr_producto CP, '+
'               (SELECT ''IN'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-''||  '+
'                       SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ //GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
'                AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+
'                AND GC.CLAVE_MONEDA = ''PESOS'' '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'' OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt, '+
'               (SELECT ''KA'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '+
'                       SUBSTR(GC.CUENTA_CONTABLE,1,4)|| ''-''|| SUBSTR(GC.CUENTA_CONTABLE,5,4)||''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2)AS CUENTA_VIGENTE '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ //GUIA_CONTABLE@SICA GC '+ CAMBIO POR BAJA DE BASE SICA JFOF 03/08/2012
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (300000)    '+
'                AND GC.CLAVE_MONEDA = ''PESOS''  '+
'                AND GC.CAMPO_IMPORTE = ''02''   '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,   '+
'              (SELECT ''KA'' AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CTA_CONTABLE||''-''||SUBSTR(SUB_CTA_CONTABLE,1,4)||''-''||SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
'               FROM CR_CONT_PRODUCTO  CCP '+
'               WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK '+
'           WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )TABCTA, '+
//REFINANCIAMEINTO
'          (SELECT FINAN.ID_CREDITO, '+
'                 SUM(FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO) IMPORTEREF '+
'            FROM CR_FINAN_ADIC FINAN, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO '+
'           WHERE TO_DATE('''+sFecha3+''',''DD/MM/YYYY'') > FINAN.F_VENCIMIENTO '+
'             AND FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO > 0 '+
'             AND CRD.ID_CREDITO = FINAN.ID_CREDITO '+
'             AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
'             AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
'             AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
'           GROUP BY FINAN.ID_CREDITO ) TABREF '+
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//WHERE PRINCIPAL
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '+
' AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '+
' AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '+
' AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '+
' AND   C.ID_CREDITO = TABREF.ID_CREDITO(+) '+
' AND  (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+
'       A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) <> 0 '+
//' AND   SUBSTR(NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI),1,2)=''13'' '+ // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' GROUP BY A.ID_OLTP_ACREDITADO,        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF), '+
'        C.CVE_GRUPO_ECO,               C.CVE_ACTIV_ECO_SITI,  '+
'        C.T_PERS,                      C.LOCALIDAD,         D.cve_cal_acred '+ //, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN,TO_CHAR(C.CVE_TIPO_CRED_BC)  '+
' ) '+
' UNION ALL '+
//--INTERCREDITOS CRE_CREDITO 12.48
' ( '+
' SELECT A.ID_OLTP_ACREDITADO,                            decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+
'        C.CVE_GRUPO_ECO,                                   C.CVE_ACTIV_ECO_SITI,  '+
'        C.T_PERS,                                          C.LOCALIDAD,  '+
'        D.cve_cal_acred,                                   MAX(E.CVE_CALIFIC_CUB) AS CVE_CALIFIC_CUB, '+
'        MIN(C.F_INICIO) AS F_INICIO,                       MAX(C.F_VENCIMIENTO) AS F_VENCIMIENTO, '+
'        SUM(decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO)) AS IMP_CREDITO, '+
'        SUM(A.IMP_SDO_K_VIG_VP) AS IMP_SDO_K_VIG_VP, '+
'        SUM(A.IMP_SDO_K_IMP_VP) AS IMP_SDO_K_IMP_VP, '+
'        SUM(A.IMP_SDO_K_VEN_VP) AS IMP_SDO_K_VEN_VP, '+
'        SUM(0) AS IMPORTEREF, '+
'        SUM(A.IMP_INT_CORTE_VP) AS IMP_INT_CORTE_VP, '+
'        SUM(A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP) AS IMP_SDO_IO_IMP_VP, '+
'        SUM(A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP) AS TOTCREDITO, '+
'        SUM(E.IMP_CUBIERTO) AS IMP_CUBIERTO,               SUM(E.IMP_EXPUESTO) AS IMP_EXPUESTO, '+
'        SUM(E.IMP_RESERVA_CUB) AS IMP_RESERVA_CUB,         SUM(E.IMP_RESERVA_EXP) AS IMP_RESERVA_EXP, '+
'        SUM(E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, MIN(ID_OLTP_PROM_ASOC) as ID_OLTP_PROM_ASOC, '+
'        MIN(ID_OLTP_PROM_ADMIN) as ID_OLTP_PROM_ADMIN, MIN(TO_CHAR(C.TIPO_CUENTA)) AS t_credito '+
'        , MAX(CVE_CALIFIC_EXP) AS CVE_CALIFIC_EXP, max(A.NUM_DIAS_VDO)NUM_DIAS_VDO '+
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP,IMP_INT_CORTE, '+
//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 ) NUM_DIAS_VDO'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CRE_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CRE_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  bb.CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +
// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''INTERCREDITOS'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'         P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'         decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'         p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'         C.F_AUT_OPERACION AS F_INICIO, DECODE(C.F_TRASPASO_VENC,NULL,C.F_VALOR_CRED +C.DIAS_PLAZO,C.F_TRASPASO_VENC) AS F_VENCIMIENTO, ''N/A'' AS CVE_OPERATIVA,  '+
'         DECODE(C.B_CAPITAL_PER,''V'',''POR PERIODO'',''AL VENCIMIENTO'')AS CVE_AMORTIZACION, '+
'         DECODE(B_INTERES_PER,''V'',''POR PERIODOS'',DECODE(CVE_CALCULO,''AN'',''AL INICIO'',''AL VENCIMIENTO''))AS CVE_PAG_INTERES, '+
'         C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '+
'         CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_ECO, '+
'         TA.TASA_APLICADA, (SELECT TASA_APLICADA FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO '+
'                            AND F_PROVISION = (SELECT MAX(F_PROVISION) FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO)) AS TASA_APLI '+
'       from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_SUB_TIP_CNBV cnbv, '+
'            CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA, CRE_PROV_DIARIA TA '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+
'       AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '+
'       AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '+
'       AND CA.ID_PERSONA = P.ID_PERSONA '+
'       AND TA.ID_CREDITO (+)=C.ID_CREDITO '+
'       AND TA.F_PROVISION(+)='''+sFecha3+''' ) C, '+
//    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ 
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'') E '+
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP)  <> 0 '+
//' AND  SUBSTR(TIPO_CUENTA,1,2)=''13'' '+ // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' GROUP BY A.ID_OLTP_ACREDITADO,       decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF), '+
'        C.CVE_GRUPO_ECO,                C.CVE_ACTIV_ECO_SITI,  '+
'        C.T_PERS,                       C.LOCALIDAD,        D.cve_cal_acred '+//, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN,TO_CHAR(C.TIPO_CUENTA) '+
' ) ';
 FunSQLCliente:=SQL;
end;                                        

procedure TWCrCartera.EscribeEncabezado;
var sFecExc:STring;
begin
     sFecExc:=StringReplace(sFecha3,'/','',[rfReplaceAll]);
     vgExcelApp.Workbooks[1].WorkSheets[1].Name := 'Cartera '+sFecExc;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'Número de Cliente';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := 'Nombre del cliente';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := 'Clave de Grupo Económico';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := 'Clave de Actividad';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := 'Tipo de Persona';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := 'Localidad';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := 'Promotor Asociado';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := 'Promotor Administrador';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := 'Número de Contrato';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := 'Número de Crédito';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := 'Clave de Descripción de Producto';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := 'Recursos';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := 'Garantía de fondos (operativa)';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := 'Clave de Moneda';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := 'Clave de Catálogo mínimo';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := 'Tipo de Crédito ';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := 'Fecha de Otorgamiento';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := 'Fecha de Vencimiento';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := 'Clave de amortización (capital)';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := 'Clave Pago de Intereses';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U' )].Value := 'Cuenta de Capital';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V' )].Value := 'Clave Tasa de Referencia';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W' )].Value := 'Sobretasa';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('X' )].Value := 'Tasa Interés';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Y' )].Value := 'Cuenta de Intereses';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Z' )].Value := 'Monto del Crédito';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AA')].Value := 'Capital Vigente';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AB')].Value := 'Capital Impagado';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AC')].Value := 'Capital Vencido';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AD')].Value := 'Importe de Refinanciamiento';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AE')].Value := 'Interés Vigente';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AF')].Value := 'Interés Impagado';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AG')].Value := 'Total del Crédito';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AH')].Value := 'Calificación del Deudor';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AI')].Value := 'Calificación cubierta';                                                                             
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AJ')].Value := 'Calificación expuesta';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AK')].Value := 'Monto  cubierto';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AL')].Value := 'Monto Expuesto   ';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AM')].Value := '% cubierto';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AN')].Value := '% expuesto';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AO')].Value := 'Reserva / Cubierto';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AP')].Value := 'Reserva / Expuesto';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AQ')].Value := 'Total Reservas';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AR')].Value := 'Num. Días Vencidos';
end;

procedure TWCrCartera.EscribeRegistro;
begin//
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := qDatos.FieldByName('ID_OLTP_ACREDITADO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := qDatos.FieldByName('NOMBRE').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := qDatos.FieldByName('CVE_GRUPO_ECO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := qDatos.FieldByName('CVE_ACTIV_ECO_SITI').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := qDatos.FieldByName('T_PERS').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := qDatos.FieldByName('Localidad').AsString;

     if rgArchivo.ItemIndex=0 then //SOLO PARA TODAS  DISPOSICIONES
     begin
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := qDatos.FieldByName('ID_OLTP_PROM_ASOC').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := qDatos.FieldByName('ID_OLTP_PROM_ADMIN').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := qDatos.FieldByName('t_credito').AsString;
     end;
     if rgArchivo.ItemIndex=2 then //SOLO PARA TODAS  DISPOSICIONES
     begin
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := qDatos.FieldByName('ID_OLTP_PROM_ASOC').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := qDatos.FieldByName('ID_OLTP_PROM_ADMIN').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := qDatos.FieldByName('ID_CREDITO').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := qDatos.FieldByName('t_credito').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := qDatos.FieldByName('CVE_AMORTIZACION').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := qDatos.FieldByName('CVE_PAG_INTERES').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V' )].Value := qDatos.FieldByName('CVE_TASA_REFER').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W' )].Value := qDatos.FieldByName('SOBRETASA').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('X' )].Value := qDatos.FieldByName('TASA_APLICADA').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AM')].Value := qDatos.FieldByName('PCT_CUBIERTO').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AN')].Value := qDatos.FieldByName('PCT_EXPUESTO').AsString;
     END;
     if (rgArchivo.ItemIndex=2) or (rgArchivo.ItemIndex=1) then //SOLO PARA DISPOSICIONES Y CONTRATOS
     begin
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := qDatos.FieldByName('ID_CONTRATO').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := qDatos.FieldByName('producto').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := qDatos.FieldByName('ORI_REC_GBL').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := qDatos.FieldByName('CVE_OPERATIVA').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := qDatos.FieldByName('ID_OLTP_MONEDA').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := qDatos.FieldByName('CVE_CAT_MINIMO').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U' )].Value := qDatos.FieldByName('CUENTA_CONTABLE').AsString;
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Y' )].Value := qDatos.FieldByName('CUENTA_INTERES').AsString;
     END;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := qDatos.FieldByName('F_INICIO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := qDatos.FieldByName('F_VENCIMIENTO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Z' )].Value := qDatos.FieldByName('IMP_CREDITO').AsString;     
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AA')].Value := qDatos.FieldByName('IMP_SDO_K_VIG_VP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AB')].Value := qDatos.FieldByName('IMP_SDO_K_IMP_VP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AC')].Value := qDatos.FieldByName('IMP_SDO_K_VEN_VP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AD')].Value := qDatos.FieldByName('IMPORTEREF').AsString;      
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AE')].Value := qDatos.FieldByName('IMP_INT_CORTE_VP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AF')].Value := qDatos.FieldByName('IMP_SDO_IO_IMP_VP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AG')].Value := qDatos.FieldByName('TOTCREDITO').AsString;       
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AH')].Value := qDatos.FieldByName('cve_cal_acred').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AI')].Value := qDatos.FieldByName('CVE_CALIFIC_CUB').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AJ')].Value := qDatos.FieldByName('CVE_CALIFIC_EXP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AK')].Value := qDatos.FieldByName('IMP_CUBIERTO').AsString;   
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AL')].Value := qDatos.FieldByName('IMP_EXPUESTO').AsString;   
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AO')].Value := qDatos.FieldByName('IMP_RESERVA_CUB').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AP')].Value := qDatos.FieldByName('IMP_RESERVA_EXP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AQ')].Value := qDatos.FieldByName('TOT_RESERVA').AsString;
     //< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('AR')].Value := qDatos.FieldByName('NUM_DIAS_VDO').AsInteger;
     //< END_EASA4011
end;

//MARA4356 SE AGREGA PARA SALDO CONTABLE DE LA CUENTA 26096222
procedure   TWCrCartera.BuscaSDOConta2609(var sCte, sSdo, sCta:String; sFecha:String);
var qBusca:TQuery;
begin 
  qBusca:=TQuery.Create(nil);
  qBusca.DataBaseName:= Objeto.Apli.DataBaseName;
  qBusca.SessionName := Objeto.Apli.SessionName;
  sCte:='Cliente 2609 no encontrado';
  sSdo:=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',0);
  sCta:='Cuenta no localizada';
  try
    qBusca.Close;
    qBusca.SQL.Text:=
    ' SELECT substr(cp.CVE_CTA_CONTABLE,1,4) as cte, SDO_FIN_PER,DESC_CUENTAC '+
    ' FROM CG_PERIODO_CTA@CONT CP, CG_CUENTA@CONT CC '+
    ' WHERE CP.ID_EMPRESA       = 2 '+
    ' AND   CP.CVE_EJER_CONT    = TO_NUMBER(TO_CHAR(TO_DATE('''+sFecha+'''),''YYYY'')) '+
    ' AND   CP.CVE_CTA_CONTABLE = (''26096222'') '+
    ' AND   CP.NUM_PERIODOC     = TO_NUMBER(TO_CHAR(TO_DATE('''+sFecha+'''),''MM'')) '+
    ' AND   CC.ID_EMPRESA       = CP.ID_EMPRESA '+
    ' AND   CC.CVE_EJER_CONT    = CP.CVE_EJER_CONT '+
    ' AND   CC.CVE_CTA_CONTABLE = CP.CVE_CTA_CONTABLE ';  
    qBusca.Open;
    if qBusca<>nil then
    begin
      qBusca.First;
      sCte:=qBusca.FieldByName('cte').AsString;
      sSdo:=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',qBusca.FieldByName('SDO_FIN_PER').AsFloat);
      sCta:=qBusca.FieldByName('DESC_CUENTAC').AsString;
    end;
    qBusca.Close;  
  finally qBusca.Free;
  end;
end;

end.




