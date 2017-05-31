// Sistema         : Clase de CRVEEMIPRO
// Fecha de Inicio : 28/01/2004
// Función forma   : Clase de CRVEEMIPRO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrveemipr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, IntQRPreview, QRPrntr, Printers,

IntGenCre,        //Datos Comunes
IntCrEmisor,      //Emisor
IntCrProveed,     //Proveedor
IntMPers,         //Promotor
IntCrCredito,      //Disposición
IntMInstDesc       // ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA
;

Type
  TArrayInteger = Array Of Integer;

Type
 TCrveemipr= class; 

  TWCrveemipro=Class(TForm)
    InterForma1             : TInterForma;
    rgSituacion: TRadioGroup;
    rgOPERADOPOR: TRadioGroup;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    dtpLiqF_INICIO: TInterDateTimePicker;
    edLiqF_INICIO: TEdit;
    edLiqF_FINAL: TEdit;
    dtpLiqF_FINAL: TInterDateTimePicker;
    chbxF_Liq: TCheckBox;
    lbID_EMISOR: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    chbxEmisor: TCheckBox;
    lbID_PROVEEDOR: TLabel;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    chbxProveedor: TCheckBox;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    chbxPromotor: TCheckBox;
    Label1: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    chbxDisposicion: TCheckBox;
    lbAplica: TLabel;
    btnSend: TButton;
    edEMAIL: TEdit;
    Label2: TLabel;
    ilEMISOR: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    ilPROMOTOR: TInterLinkit;
    ilCREDITO: TInterLinkit;
    Label3: TLabel;
    eNombreEntiDesc: TEdit;
    Label4: TLabel;
    eNombreEntiDescProv: TEdit;
    chbxEntDescEmisor: TCheckBox;
    chbxEntDescProveedor: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btnSendClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure chbxF_LiqClick(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure chbxDisposicionClick(Sender: TObject);
    private
    { Private declarations }
      function GeneraCorreodeVencimientos(var ACorreos : TArrayString; var AEmisores : TArrayInteger) : Boolean;
      function ObtenDestinatarios(nID_EMISOR : Integer) : String;
      function DatosValidos(bRequiereCorreo : Boolean) : Boolean;
      procedure MuestraReporte(bPreview : Boolean);
      function CreateStpRegistraEmailEnvio( nID_CREDITO : Integer;
                                            strID_TIPO_EMAIL,
                                            strTITULO_FINAL,
                                            strTEXTO_FINAL,
                                            strDESTINATARIO,
                                            strCVE_USU_ENVIO,
                                            strSIT_ENVIO_EMAIL,
                                            strBCOMMIT : String;
                                            var strTXRESULTADO : String
                                            ) : Integer;
    public
    { Public declarations }
      Objeto : TCrveemipr;
     end;


 TCrveemipr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        Promotor                 : TMPersona; //Promotor Responsable
        Credito                  : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation

uses IntRpNoti;

{$R *.DFM}


constructor TCrveemipr.Create( AOwner : TComponent );
begin Inherited;
      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
{/ROIM}
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Emisor.FieldByName('CVE_EMISOR_NAFIN').MasterField:='CVE_EMISOR_NAFIN';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_EXT';
{/ROIM}

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
{/ROIM}
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      Promotor := TMPersona.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrveemipr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrveemipr.Destroy;
begin
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if Promotor <> nil then
      Promotor.Free;
   if Credito <> nil then
      Credito.Free;
 inherited;
end;


function TCrveemipr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrveemipro;
begin
   W:=TWCrveemipro.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      // W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrveemipr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrveemi.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrveemipr.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CRVEEMIPRO********************)
(*                                                                              *)
(*  FORMA DE CRVEEMIPRO                                                            *)
(*                                                                              *)
(***********************************************FORMA CRVEEMIPRO********************)

procedure TWCrveemipro.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   Emisor.ID_ACREDITADO.Control := edID_EMISOR;
   Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
   Emisor.MInstDesc.DESC_ENT_DES.Control := eNombreEntiDesc;
   Emisor.GetParams(Objeto);
   edNOM_EMISOR.Hint := Emisor.Acreditado.Persona.Nombre.AsString;
   edNOM_EMISOR.ShowHint := True;

   Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
   Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
   Proveedor.MInstDesc.DESC_ENT_DES.Control := eNombreEntiDescProv;
//   Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
   Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{/ROIM}
   Proveedor.GetParams(Objeto);
   edNOM_PROVEEDOR.Hint := Proveedor.Persona.Nombre.AsString;
   edNOM_PROVEEDOR.ShowHint := True;

   Promotor.ID_Persona.Control :=edID_PROMOTOR;
   Promotor.Nombre.Control :=edNOM_PROMOTOR;
   Promotor.GetParams(Objeto);
   edNOM_PROMOTOR.Hint := Promotor.Nombre.AsString;
   edNOM_PROMOTOR.ShowHint := True;

   Credito.ID_CREDITO.Control := edID_CREDITO;
   Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;
   Credito.GetParams(Objeto);
   edNOM_ACREDITADO.Hint := Credito.ContratoCre.Contrato.TITNombre.AsString;
   edNOM_ACREDITADO.ShowHint := True;

   edLiqF_INICIO.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresaDia('D000'));
   edLiqF_FINAL.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresaDia('D000'));

   If (edID_EMISOR.CanFocus) Then edID_EMISOR.SetFocus;
   End;
end;

procedure TWCrveemipro.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  Emisor.ID_ACREDITADO.Control := nil;
  Emisor.Acreditado.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
  Emisor.MInstDesc.DESC_ENT_DES.Control := nil;
{/ROIM}  
  Proveedor.ID_ACREDITADO.Control := nil;
  Proveedor.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
   Proveedor.MInstDesc.DESC_ENT_DES.Control := nil;
//  Proveedor.ID_PROV_NAFINSA.Control := nil;
  Proveedor.ID_PROV_EXTERNO.Control := nil;
{/ROIM}
  Promotor.Nombre.Control :=nil;
  Promotor.Id_Persona.Control :=nil;
  Credito.ContratoCre.Contrato.TITNombre.Control := nil;
  Credito.ID_CREDITO.Control := nil;
  End;
end;

procedure TWCrveemipro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TWCrveemipro.GeneraCorreodeVencimientos(var ACorreos : TArrayString; var AEmisores : TArrayInteger) : Boolean;
var
    qMovimientos : TQuery;
    cadenSQL,vlCadena,vlCadenaX,vlCadenaA,vlCadenaB,vlCadenaC,vlCadenaD,vlCadenaE,vlCadenaF,vlCadenaG  : String;
    sSituacion :String;
    iSit :Integer;
    vlOper : Integer; //ALES
    vlOperadoNafin : String;
    VlProveedor, VLEmisor : String;
    VLNominalE, VLInteresE, VLIVAE : Double;
    VLNominalP, VLInteresP, VLIVAP : Double;

    strHeader, strBuf : String;
    nCount : Integer;
begin
    nCount := 0;
    
    iSit:=rgSituacion.ItemIndex;
    case iSit of
        0: sSituacion:='';  //Todos
        1: sSituacion:='AC';  //Activos
        2: sSituacion:='NA';  //En transito
        3: sSituacion:='LQ';  //Liquidados
        4: sSituacion:='IM';  //Impagados
        5: sSituacion:='CA';  //Cancelados
    end;

    //ALES----
    vlOper:=rgOPERADOPOR.ItemIndex;
    case vlOper of
        0: vlOperadoNafin:='';   //Crédito
        1: vlOperadoNafin:='V'; //Persona
    end;

     //TOTAL DE REGISTROS
     cadenSQL :=
        ' SELECT ' +
        ' CD.ID_CESION, ' +
        ' CD.ID_DOCUMENTO, ' +
        ' CD.IMP_NOMINAL, ' +
        ' CD.F_COMPRA, ' +
        ' CCA.PLAZO, ' +
        ' CCA.F_VENCIMIENTO, ' +
        ' 0 IMP_INTERES, ' +
        ' 0 IMP_IVA, ' +
        ' PE.NOMBRE NOMBRE_EMISOR, ' +
        ' CCE.ID_EMISOR, ' + // SATV4766
        ' PP.NOMBRE NOMBRE_PROVEEDOR ' +
        ' FROM ' +
        ' CR_DOCUMENTO  CD, ' +
        ' CR_CAPITAL    CCA, ' +
//        ' CR_INTERES    CCI, ' +
        ' CR_CESION     CCE, ' +
        ' PERSONA       PE, ' +
        ' PERSONA       PP, ' +
        ' CR_CREDITO    CC '+
        ' WHERE CCA.ID_CREDITO = CD.ID_CESION ' +
        ' AND   CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC '+
        ' AND   CCA.SIT_CAPITAL = ' + #39 + 'AC' + #39;

    If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCA.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)='') Then Begin
         cadenSQL:= cadenSQL + ' AND CCA.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)='')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCA.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End;

{     cadenSQL := cadenSQL +
        ' AND   CCI.ID_CREDITO (+)= CD.ID_CESION ' +
        ' AND   CCI.NUM_PERIODO (+)= CD.NUM_PERIODO_DOC ' +
        ' AND   CCI.SIT_INTERES = ' + #39 + 'AC' + #39;

    If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCI.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)='') Then Begin
         cadenSQL:= cadenSQL + ' AND CCI.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)='')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCI.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End;
}

     cadenSQL := cadenSQL +
        ' AND   CCE.ID_CESION = CD.ID_CESION ' +
        ' AND   PE.ID_PERSONA = CCE.ID_EMISOR ' +
        ' AND   PP.ID_PERSONA = CCE.ID_PROVEEDOR ' +
        ' AND   CC.ID_CREDITO = CD.ID_CESION ';

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
    If (Trim(edID_EMISOR.Text)<>'') Then
    begin
        cadenSQL:= cadenSQL + ' AND   CCE.ID_EMISOR  ='+edID_EMISOR.Text;
        if chbxEntDescEmisor.Checked then
           cadenSQL:= cadenSQL + ' AND   CCE.CVE_FND_ENT_DES  = ' + Objeto.Emisor.CVE_FND_ENT_DES.AsSQL;
        //end if
    end;
{/ROIM}

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
    If (Trim(edID_PROVEEDOR.Text)<>'') Then
    begin
        cadenSQL:= cadenSQL + ' AND CCE.ID_PROVEEDOR  ='+ edID_PROVEEDOR.Text;
        if chbxEntDescProveedor.Checked then
           cadenSQL:= cadenSQL + ' AND   CCE.CVE_FND_ENT_DES  = ' + Objeto.Emisor.CVE_FND_ENT_DES.AsSQL;
        //end if
    end;
{/ROIM}

    If (Trim(edID_PROMOTOR.Text)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CC.ID_PROM_ADM  ='+ edID_PROMOTOR.Text;
    If (Trim(edID_CREDITO.Text)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CC.ID_CREDITO   ='+ edID_CREDITO.Text;
    If (Trim(sSituacion)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CD.SIT_DOCUMENTO='''+ sSituacion +'''';
    If (Trim(vlOperadoNafin)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CCE.B_OPERADO_NAFIN='''+ vlOperadoNafin +'''';

     cadenSQL := cadenSQL + 'ORDER BY NOMBRE_EMISOR, NOMBRE_PROVEEDOR , CC.ID_CREDITO,  CD.ID_DOCUMENTO, CCA.F_VENCIMIENTO';

     qMovimientos := TQuery.Create(Nil);

    If Assigned(qMovimientos) Then
     Begin
           qMovimientos.SQL.text:=cadenSQL;
           qMovimientos.DatabaseName:=Objeto.Apli.DataBaseName;
           qMovimientos.SessionName:=Objeto.Apli.SessionName;
           qMovimientos.Open;
           try
              VlProveedor := '';
              VLEmisor := '';
              vlCadenaX := '';
              vlCadenaA := '';
              vlCadenaB := '';
              vlCadenaC := '';
              vlCadenaD := '';
              vlCadenaE := '';
              vlCadenaF := '';
              vlCadenaG := '';
              VLNominalE := 0;
              VLInteresE := 0;
              VLIVAE := 0;
              VLNominalP := 0;
              VLInteresP := 0;
              VLIVAP := 0;

              strHeader := 'REPORTE DE VENCIMIENTOS PERIODO DEL : ' + edLiqF_INICIO.Text + ' AL ' + edLiqF_FINAL.Text + #13#10#13#10;

              while not qMovimientos.eof do
              begin

                 if VLEmisor <> qMovimientos.FieldByName('NOMBRE_EMISOR').AsString then
                 begin
                     strBuf := strHeader;
                     vlCadena :=  'EMISOR : ' + qMovimientos.FieldByName('NOMBRE_EMISOR').AsString;
                     strBuf := strBuf + vlCadena + #13#10;
                     VLNominalE := 0;
                     VLInteresE := 0;
                     VLIVAE := 0;
                     VLNominalP := 0;
                     VLInteresP := 0;
                     VLIVAP := 0;
                 end;
                 if  VlProveedor <> qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString then
                 begin
                     strBuf := strBuf + #13#10;
                     vlCadena :=  '  PROVEEDOR : ' + qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString;
                     strBuf := strBuf + vlCadena + #13#10;
                     VLNominalP := 0;
                     VLInteresP := 0;
                     VLIVAP := 0;
      //                               1234567890 12345678901234567890 1234567890123456 1234567890 12345 1234567890 1234567890123456 1234567890123456
                     vlCadena :=  '     CREDITO       No DOCUMENTO      IMPORTE NOMINAL  F COMPRA  PLAZO  F VENTO.  IMPORTE INTERES  IVA DE INTERES';
                     strBuf := strBuf + vlCadena + #13#10;
                 end;

                 VLNominalE := VLNominalE + qMovimientos.FieldByName('IMP_NOMINAL').AsFloat;
                 VLInteresE := VLInteresE + qMovimientos.FieldByName('IMP_INTERES').AsFloat;
                 VLIVAE := VLIVAE + qMovimientos.FieldByName('IMP_IVA').AsFloat;
                 VLNominalP := VLNominalP + qMovimientos.FieldByName('IMP_NOMINAL').AsFloat;
                 VLInteresP := VLInteresP + qMovimientos.FieldByName('IMP_INTERES').AsFloat;
                 VLIVAP := VLIVAP + qMovimientos.FieldByName('IMP_IVA').AsFloat;

                 vlCadenaX :=  qMovimientos.FieldByName('ID_CESION').AsString + '                      ';
                 vlCadenaX :=  copy(vlCadenaX,1,10);

                 vlCadenaA :=  qMovimientos.FieldByName('ID_DOCUMENTO').AsString + '                      ';
                 vlCadenaA :=  copy(vlCadenaA,1,20);

                 vlCadenaB :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',qMovimientos.FieldByName('IMP_NOMINAL').AsFloat);
                 vlCadenaB := copy(vlCadenaB,length(vlCadenaB)- 15,16);

                 vlCadenaC := qMovimientos.FieldByName('F_COMPRA').AsString;

                 vlCadenaD :=  '               ' + qMovimientos.FieldByName('PLAZO').AsString;
                 vlCadenaD := copy(vlCadenaD,length(vlCadenaD)- 4,5);

                 vlCadenaE := qMovimientos.FieldByName('F_VENCIMIENTO').AsString;

                 vlCadenaF :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',qMovimientos.FieldByName('IMP_INTERES').AsFloat);
                 vlCadenaF := copy(vlCadenaF,length(vlCadenaF)- 15,16);

                 vlCadenaG :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',qMovimientos.FieldByName('IMP_IVA').AsFloat);
                 vlCadenaG := copy(vlCadenaG,length(vlCadenaG)- 15,16);

                 strBuf := strBuf + '    '+vlCadenaX+' '+vlCadenaA+' '+
                                           vlCadenaB+' '+vlCadenaC+' '+
                                           vlCadenaD+' '+vlCadenaE+' '+
                                           vlCadenaF+' '+vlCadenaG + #13#10;
                                     
                 vlCadenaX := '';          vlCadenaA := '';
                 vlCadenaB := '';          vlCadenaC := '';
                 vlCadenaD := '';          vlCadenaE := '';
                 vlCadenaF := '';          vlCadenaG := '';

                 VLEmisor := qMovimientos.FieldByName('NOMBRE_EMISOR').AsString;
                 VlProveedor := qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString;

                 qMovimientos.next;

                 if  ((VlProveedor <> qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString) or (qMovimientos.eof)) then
                 begin
                       vlCadenaB :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLNominalP);
                       vlCadenaB := copy(vlCadenaB,length(vlCadenaB)- 15,16);

                       vlCadenaF :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLInteresP);
                       vlCadenaF := copy(vlCadenaF,length(vlCadenaF)- 15,16);

                       vlCadenaG :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLIVAP);
                       vlCadenaG := copy(vlCadenaG,length(vlCadenaG)- 15,16);
                       strBuf := strBuf + '    '+'TOTAL     '+' '+'PROVEEDOR:          '+' '+vlCadenaB+' '+
                                          '          '+' '+'     '+' '+'          '+' '+vlCadenaF+' '+vlCadenaG+#13#10;
                       vlCadenaB := '';
                       vlCadenaF := '';
                       vlCadenaG := '';
                 end;
                 if ((VLEmisor <> qMovimientos.FieldByName('NOMBRE_EMISOR').AsString) or (qMovimientos.eof)) then
                 begin
                       vlCadenaB :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLNominalE);
                       vlCadenaB := copy(vlCadenaB,length(vlCadenaB)- 15,16);

                       vlCadenaF :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLInteresE);
                       vlCadenaF := copy(vlCadenaF,length(vlCadenaF)- 15,16);

                       vlCadenaG :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLIVAE);
                       vlCadenaG := copy(vlCadenaG,length(vlCadenaG)- 15,16);

                       strBuf := #13#10 + strbuf + '___________________________________________________________________________________________________________________________________________ '+#13#10;
                       strBuf := strBuf + '    '+'TOTAL     '+' '+'EMISOR:             '+' '+vlCadenaB+' '+'          '+' '+'     '+' '+'          '+' '+vlCadenaF+' '+vlCadenaG+#13#10;

                       vlCadenaB := '';
                       vlCadenaF := '';
                       vlCadenaG := '';

                       SetLength(ACorreos, nCount+1);
                       ACorreos[nCount] := strBuf;

                       SetLength(AEmisores, nCount+1);
                       AEmisores[nCount] := qMovimientos.FieldByName('ID_EMISOR').AsInteger;
                       
                       Inc(nCount);
                       strBuf := '';
                 end;
              end;

           Finally
            qMovimientos.close;
           end;
   End; // IF

   Result := nCount > 0;
end;

function TWCrveemipro.ObtenDestinatarios(nID_EMISOR : Integer) : String;
var Qry : TQuery;
    strBuf, strSeparator : String;
    VLSQL : String;
begin
 strSeparator := ''; strBuf := '';
 Qry := TQuery.Create(Nil);
 If Assigned(Qry) Then
  With (Qry) Do
   Try
    DatabaseName := Objeto.Apli.DataBaseName;
    SessionName := Objeto.Apli.SessionName;
    SQL.Clear;
    VLSQL := ' SELECT EMAIL'+
             ' FROM CR_EMAIL_EMISOR'+
             ' WHERE ID_EMISOR = '+IntToStr(nID_EMISOR)+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//             '   AND CVE_EMISOR_NAFIN = 0');
             '   AND (CVE_EMISOR_EXT = 0 or CVE_EMISOR_EXT = ID_EMISOR) ';
        if chbxEntDescEmisor.Checked then
           VLSQL:= VLSQL + ' AND   CVE_FND_ENT_DES  = ' + Objeto.Emisor.CVE_FND_ENT_DES.AsSQL;
        //end if
    SQL.Add(VLSQL);
{/ROIM}

    Open; First;
    While Not Eof Do
     Begin
     strBuf := strBuf + strSeparator + FieldByName('EMAIL').AsString;
     strSeparator := C_SEPARATOR_MAIL + ' ';
     Next;
     End;

   Finally
    Close;
    Free;
   End;
  Result := strBuf;
end;

function TWCrveemipro.DatosValidos(bRequiereCorreo : Boolean) : Boolean;
begin
 Result := True;
 If (Trim(edLiqF_INICIO.Text) = '') Then
   Begin
   ShowMessage('Favor de indicar el rango de inicio de la fecha de vencimiento.');
   If (edLiqF_INICIO.CanFocus) Then edLiqF_INICIO.SetFocus;
   Result := False;
   End
 Else
   If (Trim(edLiqF_FINAL.Text) = '') Then
     Begin
     ShowMessage('Favor de indicar el rango de final de la fecha de vencimiento.');
     If (edLiqF_FINAL.CanFocus) Then edLiqF_FINAL.SetFocus;
     Result := False;
     End
 Else
  Begin
     If (Objeto.Emisor.ID_ACREDITADO.AsInteger = 0) Then
         Begin
         ShowMessage('Favor de Indicar el Emisor, al cual se le va mandar el correo');
         If (edID_EMISOR.CanFocus) Then edID_EMISOR.SetFocus;
         Result := False;
         End
     Else If (edEMAIL.Text = '') And (bRequiereCorreo) Then
        Begin
         ShowMessage('El Emisor "'+Objeto.Emisor.NOMBRE_EMISOR.AsString+'", no tiene configurado ningún correo electrónico.'#13#10+
                     'No se puede enviar el correo.');
         If (edID_EMISOR.CanFocus) Then edID_EMISOR.SetFocus;
         Result := False;
        End;
  End;
end;


procedure TWCrveemipro.ilCREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrveemipro.ilEMISOREjecuta(Sender: TObject);
begin
    if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
        edEMAIL.Text := ObtenDestinatarios(Objeto.Emisor.ID_ACREDITADO.AsInteger);
    End;
end;

procedure TWCrveemipro.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
      InterForma1.NextTab(edID_PROVEEDOR);
   end;
end;

procedure TWCrveemipro.ilPROMOTOREjecuta(Sender: TObject);
begin
   if Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) then begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   end;
end;

procedure TWCrveemipro.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWCrveemipro.btEMISORClick(Sender: TObject);
begin
    Objeto.Emisor.ShowAll := True;
    if Objeto.Emisor.Busca then Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
        edEMAIL.Text := ObtenDestinatarios(Objeto.Emisor.ID_ACREDITADO.AsInteger);
    end;
end;

procedure TWCrveemipro.btPROVEEDORClick(Sender: TObject);
begin
   Objeto.Proveedor.ShowAll := True;
   if Objeto.Proveedor.Busca then Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
      InterForma1.NextTab(edID_PROVEEDOR);
   end;
end;

procedure TWCrveemipro.btPROMOTORClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   if Objeto.Promotor.Busca then begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TWCrveemipro.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

function TWCrveemipro.CreateStpRegistraEmailEnvio( nID_CREDITO : Integer;
                                                    strID_TIPO_EMAIL,
                                                    strTITULO_FINAL,
                                                    strTEXTO_FINAL,
                                                    strDESTINATARIO,
                                                    strCVE_USU_ENVIO,
                                                    strSIT_ENVIO_EMAIL,
                                                    strBCOMMIT : String;
                                                    var strTXRESULTADO : String
                                                    ) : Integer;
var StoredProc : TStoredProc;
begin
  StoredProc := TStoredProc.Create(Self);
  strTXRESULTADO := ''; Result := 0;

  If Assigned(StoredProc) Then
  With StoredProc Do
   Try
    DataBaseName := Objeto.Apli.DataBaseName;
    SessionName  := Objeto.Apli.SessionName;
    StoredProcName := 'PKGCRPERIODO.STPREGISTRAEMAILENVIO';
    Params.Clear;
    Params.CreateParam(ftFloat,'PEID_CREDITO',ptInput);
    Params.CreateParam(ftString,'PEID_TIPO_EMAIL',ptInput);
    Params.CreateParam(ftString,'PETITULO_FINAL',ptInput);
    Params.CreateParam(ftMemo,'PETEXTO_FINAL',ptInput);
    Params.CreateParam(ftMemo,'PEDESTINATARIO',ptInput);
    Params.CreateParam(ftString,'PECVE_USU_ENVIO',ptInput);
    Params.CreateParam(ftString,'PESIT_ENVIO_EMAIL',ptInput);
    Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
    Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
    Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);

    ParamByName('PEID_CREDITO').AsFloat := nID_CREDITO;
    ParamByName('PEID_TIPO_EMAIL').AsString := strID_TIPO_EMAIL;
    ParamByName('PETITULO_FINAL').AsString := strTITULO_FINAL;
    ParamByName('PETEXTO_FINAL').AsMemo := strTEXTO_FINAL;
    ParamByName('PEDESTINATARIO').AsMemo := strDESTINATARIO;
    ParamByName('PECVE_USU_ENVIO').AsString := strCVE_USU_ENVIO;
    ParamByName('PESIT_ENVIO_EMAIL').AsString := strSIT_ENVIO_EMAIL;
    ParamByName('PEBCOMMIT').AsString := strBCOMMIT;

    ExecProc;

    strTXRESULTADO := ParamByName('PSTXRESULTADO').AsString;
    Result := ParamByName('PSRESULTADO').AsInteger;
   Finally
    Free;
   End;
end;

procedure TWCrveemipro.btnSendClick(Sender: TObject);
var ACorreos : TArrayString;
    AEmisores : TArrayInteger;
    strFileName, strTITULO_EMAIL, strCUERPO_EMAIL,
    strError, strSIT_ENVIO_EMAIL, strTXRESULTADO : String;
    FRpNoti : TFRpNoti;
    A : Array [0..255]  of Char;
    I : Integer;
begin
 If DatosValidos(True) Then
   If  GeneraCorreodeVencimientos(ACorreos, AEmisores)  Then
     For I := 0 To High(ACorreos) Do
      Begin
      ArmaMail(Objeto.Apli, AEmisores[I], 'NOTVEN', '', ACorreos[I],
               strTITULO_EMAIL, strCUERPO_EMAIL, strError);
      strCUERPO_EMAIL := Correccion(strCUERPO_EMAIL);

      { Digitaliza el Documento }
      Application.CreateForm(TFRpNoti, FRpNoti);
      If Assigned(FRpNoti) Then
       With (FRpNoti) Do
        Try

         // strFileName := ExtractFileDir(Application.ExeName) + '\'+strTITULO_EMAIL+'.pdf';
         GetTempPath(255, A);
         strFileName := String(A) + strTITULO_EMAIL+'.pdf';
         qFRpNoti.Page.Orientation := poLandscape;
         qFRpNoti.PrinterSettings.PrinterIndex := InterDigDoc1.SetPrinter;
         qFRpNoti.PrinterSettings.Orientation  := poLandscape;
         InterDigDoc1.FileName := strFileName;
         FillDataToMemo(strCUERPO_EMAIL);
         qFRpNoti.Print;
        Finally
         FRpNoti.Free;
        End;


      If EnviaMailInternet(Objeto.Apli, strTITULO_EMAIL, '', edEMAIL.Text, strFileName) Then
       Begin
       strSIT_ENVIO_EMAIL := CSIT_EN;
       ShowMessage('El Correo de "'+strTITULO_EMAIL+'" se envío satisfactoriamente '#13#10'a los siguiente(s) destinatario(s)'#13#10+
                   edEMAIL.Text)
       End
      Else
       Begin
       strSIT_ENVIO_EMAIL := CSIT_ER;
       ShowMessage('ERROR en la comunicación, para poder enviar el Correo de "'+strTITULO_EMAIL+'"'#13#10+
                   'Vuelva a intentarlo otra vez ó mas tarde...');
       End;

     If (CreateStpRegistraEmailEnvio(Objeto.Credito.ID_CREDITO.AsInteger,
                                     'NOTVEN',
                                     strTITULO_EMAIL,
                                     Copy(strCUERPO_EMAIL,1,4000),
                                     edEMAIL.Text,
                                     Objeto.DameUsuario,
                                     strSIT_ENVIO_EMAIL,
                                     'V',
                                     strTXRESULTADO
                                    ) <> 0) Then
       ShowMessage(strTXRESULTADO);

     End
    Else
     ShowMessage('No existen vencimientos por enviar del emisor '+Objeto.Emisor.NOMBRE_EMISOR.AsString+
                 'al rango de fechas solicitado');

   { Elmina el Archivo Temporal }
   If FileExists(strFileName) Then
    If Not DeleteFile(strFileName) Then
     ShowMessage('No se pudo borrar el archivo temporal ubicado en: '+strFileName);

 SetLength(ACorreos,0);
 SetLength(AEmisores,0);
end;

procedure TWCrveemipro.InterForma1BtnPreviewClick(Sender: TObject);
begin
 MuestraReporte(True);
end;

procedure TWCrveemipro.InterForma1BtnImprimirClick(Sender: TObject);
begin
 MuestraReporte(False);
end;

procedure TWCrveemipro.MuestraReporte(bPreview : Boolean);
var ACorreos : TArrayString;
    AEmisores : TArrayInteger;
    ReportPreview : TIntQRPreview;
    FRpNoti : TFRpNoti;
    strTITULO_EMAIL, strCUERPO_EMAIL, strError : String;
    I : Integer;
begin

 If DatosValidos(False) Then
   If GeneraCorreodeVencimientos(ACorreos, AEmisores)  Then
    Begin
     For I := 0 To High(ACorreos) Do
      Begin
      ArmaMail(Objeto.Apli, AEmisores[I], 'NOTVEN', '', ACorreos[I], strTITULO_EMAIL, strCUERPO_EMAIL, strError);
      strCUERPO_EMAIL := Correccion(strCUERPO_EMAIL);

      Application.CreateForm(TFRpNoti, FRpNoti);
      If Assigned(FRpNoti) Then
       With (FRpNoti) Do
        Try
         ReportPreview := TIntQRPreview.CreatePreview(Application, FRpNoti.qFRpNoti);
         qFRpNoti.Page.Orientation := poLandscape;
         FillDataToMemo(strCUERPO_EMAIL);
         If bPreview Then qFRpNoti.Preview
         Else qFRpNoti.Print;
        Finally
         Close;
        End;
      FRpNoti.Free;
      End;
    End
   Else
     ShowMessage('No existen vencimientos por mostrar del emisor '+Objeto.Emisor.NOMBRE_EMISOR.AsString+
                 'al rango de fechas solicitado');
end;

procedure TWCrveemipro.chbxF_LiqClick(Sender: TObject);
begin
    If not chbxF_Liq.Checked Then Begin
        edLiqF_INICIO.Text:='';
        edLiqF_FINAL.Text:='';
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TWCrveemipro.chbxEmisorClick(Sender: TObject);
begin
    If not chbxEmisor.Checked Then Begin
        Objeto.Emisor.Active:=False;
        edEMAIL.Text := '';
        chbxEmisor.Checked:=False;
        chbxEmisor.Enabled:=False;
    End Else Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
    End;
end;

procedure TWCrveemipro.chbxProveedorClick(Sender: TObject);
begin
    If not chbxProveedor.Checked Then Begin
        Objeto.Proveedor.Active:=False;
        chbxProveedor.Checked:=False;
        chbxProveedor.Enabled:=False;
    End Else Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
    End;
end;

procedure TWCrveemipro.chbxPromotorClick(Sender: TObject);
begin
    If not chbxPromotor.Checked Then Begin
        Objeto.Promotor.Active:=False;
        chbxPromotor.Checked:=False;
        chbxPromotor.Enabled:=False;
    End Else Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
    End;
end;

procedure TWCrveemipro.chbxDisposicionClick(Sender: TObject);
begin
    If not chbxDisposicion.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxDisposicion.Checked:=False;
        chbxDisposicion.Enabled:=False;
    End else Begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
    End;
end;

end.
