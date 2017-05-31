// Sistema         : Clase de CrRepInfr
// Fecha de Inicio : 13/05/2013
// Función forma   : Clase de CrRepInfr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : JUAN FCO. ORTEGA FLORES
// Comentarios     :
Unit IntCrrepinfr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//UNIDADES ADICIONALES
IntParamCre, IntLinkit, CheckLst,
IntCrCredito,    //Disposición
IntCrCto,        //Linea / Contrato
IntCrAcredit,    //Acreditado
IntMPers,        //PromotorAsoc
IntEmple,        //PromADM
IntMQrRepInfr,   //REPORTE-DETALLE/TRANSACCION
IntMQrRepInff,   //REPORTE-DETALLE/AÑOMES
IntMQrRepInRs    //REPORTE-RESUMEN
;


Type
 TCrrepinfr= class; 

  TWCrrepinfr=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgTipRep: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    dtpFECHA: TInterDateTimePicker;
    edFECHA: TEdit;
    edID_CONTRATO: TEdit;
    btnCONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    chbxContrato: TCheckBox;
    cbCveGpoProd: TCheckListBox;
    cbGpoProducto: TCheckListBox;
    RGSitCred: TRadioGroup;
    ilACREDITADO: TInterLinkit;
    ilCesion: TInterLinkit;
    SaveDialog1: TSaveDialog;
    ilCONTRATO: TInterLinkit;
    RBDetalle: TRadioButton;
    RBResumen: TRadioButton;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    chbxPromotor: TCheckBox;
    ilPROMOTOR: TInterLinkit;
    Label7: TLabel;
    edID_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    edNOM_PROM: TEdit;
    chbxPromAmon: TCheckBox;
    ilPromAdmon: TInterLinkit;
    RBDetalleTrans: TRadioButton;
    Label3: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btnCONTRATOClick(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure cbGpoProductoClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxContratoClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure edID_PROMExit(Sender: TObject);

    private
    Procedure ImprimeReporte(bPreview:Boolean);

    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrrepinfr;
    VlIndexGpoProd : Integer;
end;
 TCrrepinfr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre          : TParamCre;
        Acreditado        : TCrAcredit;
        Credito           : TCrCredito;        
        ContratoCre       : TCrCto;
        Promotor          : TEmpleado;   //Promotor Responsable
        PromotorAdmon     : TEmpleado;   //Promotor Admon

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


constructor TCrrepinfr.Create( AOwner : TComponent ); 
begin Inherited; 
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrrepinfr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrrepinfr.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If ContratoCre <> Nil then
      ContratoCre.Free;
   If Credito <> Nil Then
      Credito.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;

inherited;
end;


function TCrrepinfr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrrepinfr;
begin
   W:=TWCrrepinfr.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrrepinfr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrrepin.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrrepinfr.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrRepInfr********************)
(*                                                                              *)
(*  FORMA DE CrRepInfr                                                            *)
(*                                                                              *)
(***********************************************FORMA CrRepInfr********************)

procedure TWCrrepinfr.FormShow(Sender: TObject);
var qyQuery: TQuery;
    sSQL: String;
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpFECHA.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edFECHA.text:=FormatDateTime('dd/mm/yyyy',dtpFECHA.DateTime);


      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.ContratoCre.ID_CONTRATO.Control := edID_CONTRATO ;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_C_PRODUCTO ;
      Objeto.GetParams(Objeto);
      edDESC_C_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString ;
      edDESC_C_PRODUCTO.ShowHint := True ;

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);
      edNOM_PROM.Hint := Objeto.PromotorAdmon.Persona.Nombre.AsString;
      edNOM_PROM.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      oBJETO.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;



      sSQL := ' SELECT CVE_PRODUCTO_GPO, CVE_PRODUCTO_GPO || '' - '' || DESC_L_PROD_GPO AS CVE_PRO_GPO_DES FROM CR_PRODUCTO_GPO '+
        ' WHERE CVE_PRODUCTO_GPO IN (SELECT CR_PRODUCTO.CVE_PRODUCTO_GPO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = ''F'' '+
        ' AND SIT_PRODUCTO = ''AC'' '+
        ' AND CR_PRODUCTO.CVE_PRODUCTO_GPO IN (''BCACOM'',''INFRA'',''OBRPUB'')'+  // OBTIENE GPO PRODUCTOS UNICAMENTE DE INFRAESTRUCTURA JFOF
        '  AND ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +') '+
        ' ORDER BY CVE_PRODUCTO_GPO ';
      qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
      Try
         If qyQuery <> Nil Then
         begin
           While not(qyQuery.Eof) do
              begin
                 VlIndexGpoProd := cbGpoProducto.Items.Add(qyQuery.FieldByName('CVE_PRO_GPO_DES').AsString);
                 cbCveGpoProd.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO_GPO').AsString);
                 qyQuery.Next;
              end;
         end;
      Finally
         qyQuery.Free;
      End;

      RBDetalle.Checked := True;
end;

procedure TWCrrepinfr.FormDestroy(Sender: TObject);
begin
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;

    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := nil;

    Objeto.Promotor.Persona.Nombre.Control :=nil;
    Objeto.Promotor.Id_Persona.Control :=nil;
    Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;
    Objeto.PromotorAdmon.Id_Persona.Control :=nil;

    Objeto.Credito.ID_CREDITO.Control := nil;
    oBJETO.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
end;

procedure TWCrrepinfr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrrepinfr.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrrepinfr.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrrepinfr.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrrepinfr.btACREDITADOClick(Sender: TObject);
var Cadena : String ;
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWCrrepinfr.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrrepinfr.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWCrrepinfr.btnCONTRATOClick(Sender: TObject);
var Cadena: String ;
begin
      Objeto.ContratoCre.ShowAll := True;
   if Objeto.ContratoCre.Busca then begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TWCrrepinfr.ilCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True ;
end;

procedure TWCrrepinfr.ilCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilCONTRATO.Buffer,1]) Then Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TWCrrepinfr.btID_CESIONClick(Sender: TObject);
var Cadena: String ;
begin
   Cadena:= ' SELECT DISTINCT CR_CREDITO.ID_CONTRATO  '+
            ' FROM CONTRATO , CR_CREDITO '+//, CR_PPO_PREMIO  '+
            ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO ';// AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
   If chbxACREDITADO.Checked then
      begin
         Cadena := Cadena + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
      end ;

   If chbxContrato.Checked then
      begin
         Cadena := Cadena + ' AND CR_CREDITO.ID_CONTRATO = '+Objeto.ContratoCre.ID_CONTRATO.AsString+' ' ;
      end ;

   Objeto.Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+Cadena+') ' ;
   Objeto.Credito.FilterString:= Objeto.Credito.BuscaWhereString ;
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWCrrepinfr.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrrepinfr.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWCrrepinfr.cbGpoProductoClick(Sender: TObject);
var VlIndex, c: Integer;
begin
  c:= 0;
  for VlIndex := 0 to VlIndexGpoProd do
  begin
      if cbGpoProducto.Checked[VlIndex] = true then
         Inc(c);
  end ;
  cbxCVE_PRODUCTO_GPO.Enabled := (c>=1);
  cbxCVE_PRODUCTO_GPO.Checked := cbxCVE_PRODUCTO_GPO.Enabled;

  if cbxCVE_PRODUCTO_GPO.Checked then
   begin
   edID_CESION.Enabled := False;
   btID_CESION.Enabled := False;
   end
   else
   begin
   edID_CESION.Enabled := True;
   btID_CESION.Enabled := True;
   end;


end;

procedure TWCrrepinfr.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
var VlIndex: Integer;
begin
   if not (cbxCVE_PRODUCTO_GPO.Checked) then
      begin
        for VlIndex := 0 to VlIndexGpoProd do
           begin
             cbGpoProducto.Checked[VlIndex] :=  cbxCVE_PRODUCTO_GPO.Checked;
           end ;
       cbxCVE_PRODUCTO_GPO.Enabled := cbxCVE_PRODUCTO_GPO.Checked;
      end;
       edID_CESION.Enabled := True;
       btID_CESION.Enabled := True;      
end;

procedure TWCrrepinfr.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
        Objeto.ContratoCre.BuscaWhereString := '';
        Objeto.ContratoCre.FilterString := '';
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWCrrepinfr.chbxContratoClick(Sender: TObject);
begin
    If not chbxContrato.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxContrato.Checked:=False;
        chbxContrato.Enabled:=False;
        Objeto.Credito.BuscaWhereString := '';
        Objeto.Credito.FilterString := '';
    End Else Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
    End;
end;

procedure TWCrrepinfr.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TWCrrepinfr.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
     sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
     If UpperCase(sExt)= '.PRN' Then
        edNbrArch.Text := SaveDialog1.FileName
     Else
        edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End
  Else
     edNbrArch.Text := '';
end;

procedure TWCrrepinfr.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;


procedure TWCrrepinfr.cbxArchivoClick(Sender: TObject);
begin
    If not cbxArchivo.Checked Then Begin
        edNbrArch.Text:= '';
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End Else Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End;
end;

procedure TWCrrepinfr.ImprimeReporte(bPreview: Boolean);
Var
    sTipRep, sSitCred, sGpoProd:String;
    VlIndex: Integer;
    VlPrimero: Boolean;
begin

  for VlIndex := 0 to VlIndexGpoProd do
    begin
       CBCveGpoProd.Checked[VlIndex] := cbGpoProducto.Checked[VlIndex];
    end;

    sGpoProd:= '(''A''';
    for VlIndex := 0 to VlIndexGpoProd do
    begin
      if cbCveGpoProd.Checked[VlIndex] then
         sGpoProd := sGpoProd + ', '+''''+cbCveGpoProd.Items.Strings[VlIndex]+''''
    end;
    sGpoProd:= sGpoProd + ')';

    If sGpoProd = '(''A'')' then
       sGpoProd := '';

  if (sGpoProd = '') and (edACREDITADO.Text = '') and (edID_CONTRATO.Text = '') and
     (edID_CESION.text = '') and (edID_PROMOTOR.Text = '') and (edID_PROM.Text = '') then
  begin
  Showmessage('     ¡ Por favor, selecciona al menos un filtro !');
  end
  else
  begin
    if RBDetalle.Checked then
    sTipRep := 'DET';

    if RBResumen.Checked then
    sTipRep := 'RES';

    if RBDetalleTrans.Checked then
    sTipRep := 'RTR';


    case rgSitCred .ItemIndex of
{        0: sSitCred:=' = ''AC'' ';  //Autorizados
        1: sSitCred:=' = ''LQ'' ' ;  //Liquidados
        2: sSitCred:=' <> ''CA'' ';  //Todos, menos los cancelados
        }
        0: sSitCred:='AC';  //Autorizados
        1: sSitCred:='LQ';  //Liquidados
        2: sSitCred:='';  //Todos, menos los cancelados
    end;

    if sTipRep = 'RTR' then
    begin
     RepInfr( edFECHA.Text,
              sGpoProd,
              edACREDITADO.Text,
              edNOMBRE_ACRED.Text,
              edID_CONTRATO.Text,
              edDESC_C_PRODUCTO.Text,
              edID_CESION.Text ,
              edID_PROMOTOR.Text ,
              edNOM_PROMOTOR.text ,
              edID_PROM.Text ,
              edNOM_PROM.Text ,
              sTipRep,
              sSitCred,
              edNbrArch.Text,
              Objeto.Apli,
              bPreview);

    end
    else
    if sTipRep = 'RES'  then
    begin

     RepInRs( edFECHA.Text,
              sGpoProd,
              edACREDITADO.Text,
              edNOMBRE_ACRED.Text,
              edID_CONTRATO.Text,
              edDESC_C_PRODUCTO.Text,
              edID_CESION.Text ,
              edID_PROMOTOR.Text ,
              edNOM_PROMOTOR.text ,
              edID_PROM.Text ,
              edNOM_PROM.Text ,
              sTipRep,
              sSitCred,
              edNbrArch.Text,
              Objeto.Apli,
              bPreview);
    end
    else
    if sTipRep = 'DET' then
    begin
    RepInff(  edFECHA.Text,
              sGpoProd,
              edACREDITADO.Text,
              edNOMBRE_ACRED.Text,
              edID_CONTRATO.Text,
              edDESC_C_PRODUCTO.Text,
              edID_CESION.Text ,
              edID_PROMOTOR.Text ,
              edNOM_PROMOTOR.text ,
              edID_PROM.Text ,
              edNOM_PROM.Text ,
              sTipRep,
              sSitCred,
              edNbrArch.Text,
              Objeto.Apli,
              bPreview);
    end;                        

    If Trim(edNbrArch.Text)<>'' Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente');
  end;



end;

procedure TWCrrepinfr.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRREPINFR_IMPR',True,True) then
   ImprimeReporte(False);
end;

procedure TWCrrepinfr.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRREPINFR_PREV',True,True) then
   ImprimeReporte(True);
end;

procedure TWCrrepinfr.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWCrrepinfr.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrrepinfr.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWCrrepinfr.btPROM_ADMONClick(Sender: TObject);
begin
      Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWCrrepinfr.ilPromAdmonCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrrepinfr.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWCrrepinfr.chbxPromotorClick(Sender: TObject);
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

procedure TWCrrepinfr.chbxPromAmonClick(Sender: TObject);
begin
    If not chbxPromAmon.Checked Then Begin
        Objeto.PromotorAdmon.Active:=False;
        chbxPromAmon.Checked:=False;
        chbxPromAmon.Enabled:=False;
    End Else Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
    End;
end;

procedure TWCrrepinfr.edACREDITADOExit(Sender: TObject);
begin
  if edACREDITADO.Text = '' then
  chbxAcreditado.Checked := False
end;

procedure TWCrrepinfr.edID_CONTRATOExit(Sender: TObject);
begin
  if edID_CONTRATO.Text = '' then
  chbxContrato.Checked := False
end;

procedure TWCrrepinfr.edID_CESIONExit(Sender: TObject);
begin
  if edID_CESION.Text = '' then
  chbxCESION.Checked := False
end;

procedure TWCrrepinfr.edID_PROMOTORExit(Sender: TObject);
begin
  if edID_PROMOTOR.Text = '' then
  chbxPromotor.Checked := False
end;

procedure TWCrrepinfr.edID_PROMExit(Sender: TObject);
begin
  if edID_PROM.Text = '' then
  chbxPromAmon.Checked := False
end;

end.
