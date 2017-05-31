// Sistema         : Clase de MEdoCtaCt
// Fecha de Inicio : 13/01/2010
// Función forma   : Clase de MEdoCtaCt
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMEdoCtaCt;

interface                         

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, DBGrids, IntXls,ComObj, InterMemo,

// Unidades adicionales HEGC 13/01/2010
IntPers,          //Persona
IntCrCredito,     //Disposición
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntMQREdoCC,    //Reporte
IntCrCto,         //Contrato
IntGenCre,IntParamCre, IntLinkit, InterEdit, IntCrEditor, QuickRpt;

Type
 TMEdoCtaCt= class;

  TWMEdoCtaCt=Class(TForm)
    InterForma1             : TInterForma;
    lbCAMPO1 : TLabel;
    edCAMPO1 : TEdit;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    edDESC_ID_CREDITO: TEdit;
    GroupBox1: TGroupBox;
    edF_Corte: TEdit;
    dtpF_Corte: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    BitBtn3: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    gbControl: TGroupBox;
    Label6: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    reEncabezado: TRichEdit;
    reFinDocumento: TRichEdit;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edFileNamexls: TEdit;
    cbxArchivo: TCheckBox;
    qryConsulta: TQuery;
    edRealizo: TEdit;
    EdCedula: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    BitBtn4: TBitBtn;
    rgOrden: TRadioGroup;
    Label7: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    ilIDCONTRATO: TInterLinkit;
    edDESC_PRODUCTO: TEdit;
    chbxAutorizacion: TCheckBox;
    DBGrid1: TDBGrid;
    dsConsultaXLs: TDataSource;
    qryConsultaxls: TQuery;
    SaveDialog: TSaveDialog;
    ProgressBar: TProgressBar;
    bbRestablece: TBitBtn;
    btID_CREDITO: TBitBtn;
    BitBtn5: TBitBtn;
    pnDatosContrato: TGroupBox;
    gbDatosdelContrato: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label13: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CargaEncabDocto(peNombre:String;carga:Boolean);
    procedure CargaPieDoc(Carga:Boolean);
    procedure edDESC_ID_CREDITOChange(Sender: TObject);
    procedure edNOMBRE_ACREDChange(Sender: TObject);
    procedure bbRestableceClick(Sender: TObject);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure edDESC_PRODUCTOChange(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    Function  GeneraArchivoXLS( sFCorte,sTitular,sCredito,sContrato, sEncabezado,sFinDocto,sRealizo,sCedula:String;
                     iOrden:integer) : String;
    procedure GeneraArchivoExcel(peFileName: String);
    procedure edF_CorteExit(Sender: TObject);
    procedure dtpF_CorteExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure edCVE_PRODUCTOChange(Sender: TObject);

    private
    { Private declarations }
        Procedure AsignaEmpresaSuc;
        Procedure ImprimeReporte(bPreview:Boolean;peFFirmoContrato,peImpCredConced,peIntOrdPact,PeIntMoraPact,peFecVenCont:String);
    public
    { Public declarations }
    Objeto : TMEdoCtaCt;
end;
 TMEdoCtaCt= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CAMPO1                   : TInterCampo;
        ParamCre   : TParamCre;
        Persona    : TPersona;       // Acreditado
        Credito    : TCrCredito;    // Disposicion
        Empresa    : TEmpresa;      // Empresa
        UnidadNegocio :TUnNegocio;  // Unidad de negocio
        ContratoCre: TCrCto; //Contrato Crédito
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
         {
Procedure RepEdoCtaC( sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor,
                        sCveFndEntDes, sNbrArch : String; sDiasImp, sMuestraProveedor : Boolean;
                        pAPli : TInterApli; pPreview : Boolean
                      );
          }
constructor TMEdoCtaCt.Create( AOwner : TComponent );
begin Inherited;
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';

      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}
      Persona.MasterSource := Self;

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource := Self;

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      Empresa.MasterSource := Self;
      UnidadNegocio := TUnNegocio.Create(Self);
      UnidadNegocio.MasterSource := Self;
      {$WARNINGS ON}

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';


      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMEdoCtaCt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMEdoCtaCt.Destroy;
begin
   If Persona <> nil then Persona.free;
   If Credito <> Nil Then Credito.Free;

   if Empresa <> nil then Empresa.free;

   if UnidadNegocio <> nil then UnidadNegocio.Free;

   if ContratoCre <> nil then  ContratoCre.Free;
   inherited;
end;


function TMEdoCtaCt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMEdoCtaCt;
begin
   W:=TWMEdoCtaCt.Create(Self);
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


Function TMEdoCtaCt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMEdoCtaCt.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMEdoCtaCt.Reporte:Boolean;
begin //Execute_Reporte();
end;


Procedure TWMEdoCtaCt.AsignaEmpresaSuc;
begin
     Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';

end;


(***********************************************FORMA MEdoCtaCt********************)
(*                                                                              *)
(*  FORMA DE MEdoCtaCt                                                            *)
(*                                                                              *)
(***********************************************FORMA MEdoCtaCt********************)

procedure TWMEdoCtaCt.FormShow(Sender: TObject);
begin
 //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;



      Objeto.CAMPO1.Control:=edCAMPO1;

      Objeto.Persona.Id_Persona.Control:= edACREDITADO;
      Objeto.Persona.Nombre.Control :=edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint:=Objeto.Persona.Nombre.AsString;
      edNombre_ACRED.ShowHint:=True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);

      Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      Objeto.ContratoCre.GetParams(Objeto);
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;

      AsignaEmpresaSuc;

      dtpF_Corte.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Corte.text:=FormatDateTime('dd/mm/yyyy',dtpF_Corte.DateTime);

      Application.CreateForm(TFrmEditor, FrmEditor);
      If EdAcreditado.Text <> ''
      then CargaEncabDocto(EdNOMBRE_ACRED.TEXT,true)
      else if edID_CREDITO.Text <> ''
           then CargaEncabDocto(EdDesc_ID_CREDITO.TEXT,true)
           ELSE if iedID_CONTRATO.Text <> ''
                THEN CargaEncabDocto(Objeto.ContratoCre.Acreditado.Persona.Nombre.AsString,true);

//      CargapieDoc(true);
end;

procedure TWMEdoCtaCt.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;

    Objeto.Persona.Id_Persona.Control := nil;
    Objeto.Persona.Nombre.Control := nil;

    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;

    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

    Objeto.ContratoCre.ID_CONTRATO.Control := nil;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;

   //Objeto
end;

procedure TWMEdoCtaCt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
   qryconsultaxls.close;
   frmeditor.free;
end;

procedure TWMEdoCtaCt.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMEdoCtaCt.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMEdoCtaCt.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWMEdoCtaCt.CargaEncabDocto(peNombre:String;Carga:Boolean);
Var vlFecha,vlNombre:String;
  vlinicio2,vlfin2,vlinicio,vlfin:integer;
begin
  vlNombre:='';
  vlInicio:=0;
  vlFin:=0;

  vlFEcha:=UpperCase(FormatDateTime('dd "de" mmmm "de" yyyy',dtpF_CORTE.Date));
{
  If EdNombre_Acred.Text <> ''
  then  vlNombre:=EdNombre_Acred.Text;

  If EdDesc_id_Credito.Text <> ''
  then vlNombre:=EdDesc_id_Credito.Text;
 }
  vlNombre:=peNombre;

 If Carga then  FrmEditor.Editor.Lines.LoadFromFile('c:\EdoCtaCt.rtf');
  vlInicio:=FrmEditor.Editor.FindText('@@NOMBRE@@',0,Length(FrmEditor.Editor.TEXT),[stMatchCase])-1;
  vlFin:=length(vlnombre)+1;
  FrmEditor.Editor.Text:=StringReplace(FrmEditor.Editor.Text,'@@NOMBRE@@',vlNombre,[rfReplaceAll]);
  vlInicio2:=FrmEditor.Editor.FindText('@@FECHA@@',0,Length(FrmEditor.Editor.TEXT),[stMatchCase])-1;
  vlFin2:=length(vlFecha)+1;
  FrmEditor.Editor.Text:=StringReplace(FrmEditor.Editor.Text,'@@FECHA@@',vlFecha,[rfReplaceAll]);

  FrmEditor.Editor.SelStart:=vlInicio;
  FrmEditor.Editor.SelLength:=vlFin;
  FrmEditor.Editor.SelAttributes.Style:=[fsBold];

  FrmEditor.Editor.SelStart:=vlInicio2;
  FrmEditor.Editor.SelLength:=vlFin2;
  FrmEditor.Editor.SelAttributes.Style:=[fsBold];

  FrmEditor.Editor.SelLength:=0;
  CargaPieDoc(carga);
  reEncabezado.text:=frmEditor.Editor.text;
  reFinDocumento.text:=frmEditor.Editor2.text;
End;

procedure TWMEdoCtaCt.CargaPieDoc(Carga:Boolean);
Var vlFecha,vlNombre:String;
  vlinicio2,vlfin2,vlinicio,vlfin:integer;
begin

  vlFEcha:=UpperCase(FormatDateTime('dd "de" mmmm "de" yyyy',dtpF_CORTE.Date));


If Carga then  FrmEditor.Editor2.Lines.LoadFromFile('c:\EdoCCPie.rtf');
  vlInicio2:=FrmEditor.Editor2.FindText('@@FECHA@@',0,Length(FrmEditor.Editor2.TEXT),[stMatchCase])-1;
  vlFin2:=length(vlFecha)+1;
  FrmEditor.Editor2.Text:=StringReplace(FrmEditor.Editor2.Text,'@@FECHA@@',vlFecha,[rfReplaceAll]);

  FrmEditor.Editor2.SelStart:=vlInicio;
  FrmEditor.Editor2.SelLength:=vlFin;
  FrmEditor.Editor2.SelAttributes.Style:=[fsBold];

  FrmEditor.Editor2.SelStart:=vlInicio2;
  FrmEditor.Editor2.SelLength:=vlFin2;
  FrmEditor.Editor2.SelAttributes.Style:=[fsBold];

  FrmEditor.Editor2.SelLength:=0;

  reFinDocumento.text:=frmEditor.Editor2.text;
End;



procedure TWMEdoCtaCt.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWMEdoCtaCt.ilACREDITADOEjecuta(Sender: TObject);
begin
If Objeto.Persona.FindKey([ilACREDITADO.BUFFER]) then Begin
     chbxACREDITADO.Enabled:=True;
     chbxACREDITADO.Checked:=True;
     Interforma1.NextTab(edACREDITADO);
end;
end;

procedure TWMEdoCtaCt.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll:=true;
   If Objeto.Persona.Busca then Begin
     chbxACREDITADO.Enabled:=true;
     chbxACREDITADO.Checked:=True;
     Interforma1.NextTab(edACREDITADO);
     CargaEncabDocto(edNOMBRE_ACRED.text,true);
   end;
end;

procedure TWMEdoCtaCt.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
With Objeto Do
Begin
  T:=CreaBuscador('ICRDIMCR.IT','I');
  Try
    If T.Execute then
    Begin
      edID_CREDITO.Text:=T.DameCampo(0);
      edDESC_ID_CREDITO.Text:=T.DameCampo(1);
      cbID_CREDITO.Checked:=True;
      CargaEncabDocto(edDesc_id_credito.text,true);
    End;
  Finally
    T.Free;
  End;
End;

end;

procedure TWMEdoCtaCt.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;
    bitBtn5.Enabled:=true;
    Edit1.clear;
    edit2.clear;
    edit3.clear;
    edit4.clear;
    edit5.clear;
   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';

   End;
end;

procedure TWMEdoCtaCt.chbxAcreditadoClick(Sender: TObject);
begin
  EnableCheckBox(chbxACREDITADO);
  Objeto.Persona.Active:=chbxACREDITADO.Checked;

        bitBtn5.Enabled:=false;
        Edit1.clear;
        edit2.clear;
        edit3.clear;
        edit4.clear;
        edit5.clear;

end;

procedure TWMEdoCtaCt.BitBtn1Click(Sender: TObject);
begin
{
   reTemp.clear;
   reTemp.text:='@@NOMBRE@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=10;
   reTemp.CopyToClipboard;
   reEncabezado.PasteFromClipboard;
   }
end;

procedure TWMEdoCtaCt.BitBtn2Click(Sender: TObject);
begin
{
   reTemp.clear;
   reTemp.text:='@@FECHA@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=9;
   reTemp.CopyToClipboard;
   reEncabezado.PasteFromClipboard;
   }
end;

procedure TWMEdoCtaCt.BitBtn3Click(Sender: TObject);
begin
{
   reTemp.clear;
   reTemp.text:='@@FECHA@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=9;
   reTemp.CopyToClipboard;
   reFinDocumento.PasteFromClipboard;
 }
end;

procedure TWMEdoCtaCt.ImprimeReporte(bPreview:Boolean;peFFirmoContrato,peImpCredConced,peIntOrdPact,PeIntMoraPact,peFecVenCont:String);
Var
   vlMsg,vlError,vlTextoEncab , vlFechaLarga, vlfinDocumento: String;
begin
 If (edAcreditado.Text='') and (edID_Credito.text='')  and (iedID_CONTRATO.Text='')
 then  showMessage('Se debe indicar un acreditado, autorizacion ó numero de disposición')
 else
 Begin
   //limpia tabla temporal
   ClearTblReport( Objeto.Apli, vlError );
   if vlError <> '' then
     ShowMessage(vlError)
   else
   Begin
   //Genera reporte
      If EdAcreditado.Text <> ''
      then CargaEncabDocto(EdNOMBRE_ACRED.TEXT,false)
      else if edID_CREDITO.Text <> ''
           then CargaEncabDocto(EdDesc_ID_CREDITO.TEXT,false)
           ELSE if iedID_CONTRATO.Text <> ''
                THEN CargaEncabDocto(Objeto.ContratoCre.Acreditado.Persona.Nombre.AsString,false);
     qrEdoCC.reEncabezado.ParentRichEdit:=FrmEditor.Editor;
     qrEdoCC.repieDocumento.ParentRichEdit:=FrmEditor.Editor2;
     VLMsg:=RepEdoCtaC(edF_Corte.text,edACREDITADO.Text,edID_CREDITO.Text,iedID_CONTRATO.Text,vlTextoEncab,vlFinDocumento,edRealizo.text,edCedula.text,
                       peFFirmoContrato,peImpCredConced,peIntOrdPact,PeIntMoraPact,peFecVenCont,
                    Objeto.Apli            ,
                    bPreview ,
                    rgOrden.itemindex  );
      If VlMsg <> '' then showMessage(vlMsg);
   end;
 end;
End;


procedure TWMEdoCtaCt.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOCTACT_IMPRI',True,True) then
      ImprimeReporte( False,edit1.text,edit2.text,edit3.text,edit4.text,edit5.text);
end;

procedure TWMEdoCtaCt.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOCTACT_PREVI',True,True) then
      ImprimeReporte(True,edit1.text,edit2.text,edit3.text,edit4.text,edit5.text);
end;


procedure TWMEdoCtaCt.BitBtn4Click(Sender: TObject);
Var vlNombre:String;
begin
  If EdAcreditado.Text <> ''
  then CargaEncabDocto(EdNOMBRE_ACRED.TEXT,false)
  else if edID_CREDITO.Text <> ''
       then CargaEncabDocto(EdDesc_ID_CREDITO.TEXT,false)
       ELSE if iedID_CONTRATO.Text <> ''
            THEN CargaEncabDocto(Objeto.ContratoCre.Acreditado.Persona.Nombre.AsString,false);

  FrmEditor.showModal;
  reEncabezado.Text:=frmEditor.Editor.text;
  reFinDocumento.Text:=FrmEditor.Editor2.text;
end;

procedure TWMEdoCtaCt.edDESC_ID_CREDITOChange(Sender: TObject);
begin
if edDESC_ID_CREDITO.Text<> ''
Then
begin
chbxAcreditado.Checked:=false;
chbxAutorizacion.Checked:=false;
end;
end;

procedure TWMEdoCtaCt.edNOMBRE_ACREDChange(Sender: TObject);
begin
if edNOMBRE_ACRED.Text<> ''
Then
Begin
cbID_CREDITO.Checked:=false;
chbxAutorizacion.Checked:=false;
end;
end;

procedure TWMEdoCtaCt.bbRestableceClick(Sender: TObject);
begin
{ CargaPieDoc;
  FrmEditor.showModal;
  reFinDocumento:=frmEditor.Editor;
  }
 FrmEditor.Editor.Lines.LoadFromFile('c:\EdoCtaCt.rtf');
 FrmEditor.Editor2.Lines.LoadFromFile('c:\EdoCCPie.rtf');
 reEncabezado.Text:=frmEditor.Editor.text;
 reFinDocumento.Text:=FrmEditor.Editor2.text;
  end;

procedure TWMEdoCtaCt.iedID_CONTRATOExit(Sender: TObject);
begin
    If iedID_CONTRATO.Text<>'' Then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
    End Else Begin
        chbxAutorizacion.Checked:= False;
        chbxAutorizacion.Enabled:= False;
    End;
    InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TWMEdoCtaCt.btCONTRATOClick(Sender: TObject);
begin
    //BUSCADOR DE LA CLASE CONTRATO CREDITO
    Objeto.ContratoCre.ShowAll := True;
    if Objeto.ContratoCre.Busca then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(btCONTRATO);
        CargaEncabDocto(Objeto.ContratoCre.Acreditado.Persona.Nombre.AsString,true);
    End;
end;

procedure TWMEdoCtaCt.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
Show := True;
end;

procedure TWMEdoCtaCt.ilIDCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(iedID_CONTRATO);
    End;
end;

procedure TWMEdoCtaCt.chbxAutorizacionClick(Sender: TObject);
begin
    If not chbxAutorizacion.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxAutorizacion.Checked:= False;
        chbxAutorizacion.Enabled:=False;

    End
    Else Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
        bitBtn5.Enabled:=false;
        Edit1.clear;
        edit2.clear;
        edit3.clear;
        edit4.clear;
        edit5.clear;
    End;
end;

procedure TWMEdoCtaCt.edDESC_PRODUCTOChange(Sender: TObject);
begin
If iedID_CONTRATO.Text <> ''
Then
Begin
  chbxAcreditado.Checked:=false;
  cbID_CREDITO.Checked:=false;
end;
end;

Function  TWMEdoCtaCt.GeneraArchivoXLS( sFCorte,sTitular,sCredito,sContrato, sEncabezado,sFinDocto,sRealizo,sCedula:String;
                     iOrden:integer) : String;
  Var
    VLTitulo : String;
    Parte1,VLMsg, vlCondicion,vlOrden    : String;

Begin

    VLMsg  := 'Edo Cta Crédito: '  + sCredito + ' NO SE PUEDE GENERAR';
    If iOrden=0
    Then vlOrden:=' f_vencimiento,ID_CREDITO  '
    Else vlorden:=' ID_CREDITO, f_vencimiento ';
        VLMsg := 'OK';
        qryConsultaXLS.DatabaseName :=Objeto.apli.databasename;
        qryConsultaXLS.SessionName := Objeto.apli.SessionName;
        qryConsultaXLS.Active:=False;



        if sCredito <> ''
        then vlCondicion:=' AND CCRE.ID_CREDITO='+sCredito+' '
        else vlCondicion:=ArmaCadena(Objeto.apli,sTitular,sContrato);

        If vlCondicion <> ''
        then
        Begin
        qryConsultaXLS.SQL.Text:= FormaQuery(sFCorte,vlCondicion,sEncabezado,sFinDocto,vlorden);

        qryConsultaXLS.SQL.SaveToFile('c:\EdoCtaCT.txt');
        qryConsultaXLS.Active:=True;



        VLMsg  := 'Edo Cta Certificado: '  + sCredito + ' OK ';



        //  INICIA ARCHIVO
        //
        if VLMsg <> 'OK' then
           VLMsg := VLMsg
        //end if;
       end
       else VLMsg:='No hay datos';
    Result:= VLMsg;
End;


procedure TWMEdoCtaCt.sbExcelClick(Sender: TObject);
begin
 If (edAcreditado.Text='') and (edID_Credito.text='')  and (iedID_CONTRATO.Text='')
 then  showMessage('Se debe indicar un acreditado, autorizacion ó numero de disposición')
 else
 Begin
    If SaveDialog.Execute Then
      edFileNameXLS.Text := SaveDialog.FileName;
    If (LowerCase(Trim(ExtractFileExt(edFileNameXLS.Text))) <> '.xls') Then
    Begin
      edFileNameXLS.Text := edFileNameXLS.Text + '.xls';
    End;

    If edFileNameXLS.TEXT <> ''
    Then GeneraArchivoExcel(edFileNameXLS.Text)
    else ShowMessage('Es necesario dar un nombre al archivo');
 end;
end;

procedure TWMEdoCtaCt.GeneraArchivoExcel(peFileName: String);
var
    vlRange : Variant;
    vlMoneda,vlHojas,vlContrato,vlCol, vlRow , vlConcepto,vlStatus, vlNumHoja: Integer;
    vlExcelApp : OleVariant;
    vlColumnRange : Variant;
    VLSalida,vlResumenAdeudo      : Boolean;
    vlTotConcepto,VltotDispuesto:real;
    TotImpDeposito,totCapPAg,totFinPag,TotIntPag,TotConPag,TotMorPag,TotIvaPag,
    vlTotFinadicPagado,vlTotInteresPagado,vlTotCapitalPagado,vlTotConceptosPagado,
    vlTotFinadicVencido,vlTotInteresVencido,vlTotInteresVencidoiva,vltotCapitalVencido,vlTotConceptosVencido,vlTotConceptosVencidoIva,
    vlTotFinadicVigente,vltotInteresVigente,vltotInteresVigenteIva,vltotCapitalVigente,vltotconceptosVigente,vltotconceptosVigenteIva,
    vltotMora,vlTotIvaMora,vlIvaConcepto,
    TotCapAd,TotFinAd,totIntAd,TotConAd,TotMorAd,TotIvaAd,TotMorCapital,TotMorFinadic,TotMorInteres,TotMorConceptos:Real;

    vltitulo1,vltitulo2,vltitulo3,vlTitulo4,vltitulo5,vltitulo6,vltitulo7,vltitulo8,vlTitulo9,vltitulo10,vltitulo11,vltitulo12,
    vlTasaAD, vlTasaAd2, vlFactorMora, vlOperadorTasa,
    vlsubtitulo1,vltasa1,vltasa2,vltasa3:String;

    function Convierteletras(Numero:real;Moneda:integer):String;
      var stpTotConLetra : TStoredProc;
      Begin
       Try
         stpTotConLetra:=TStoredProc.Create(Nil);
         stpTotConLetra.DatabaseName:=OBJETO.Apli.DataBaseName;
         stpTotConLetra.SessionName:=OBJETO.Apli.SessionName;
         stpTotConLetra.StoredProcName:='STPNUMEROATEXTO';
         stpTotConLetra.Params.Clear;

         stpTotConLetra.Params.CreateParam(ftFloat,'pNumero',ptInput);
         stpTotConLetra.Params.CreateParam(ftInteger,'pIdMoneda',ptInput);
         stpTotConLetra.Params.CreateParam(ftString,'pResultado',ptOutput);
         stpTotConLetra.Prepare;
         stpTotConLetra.ParamByName('pNumero').AsFloat := Numero;
         stpTotConLetra.ParamByName('pIdMoneda').asInteger:= Moneda;
         stpTotConLetra.ExecProc;
         Result:=stpTotConLetra.ParamByName('pResultado').asstring;
      Finally
         If  stpTotConLetra <> Nil Then Begin
             stpTotConLetra.UnPrepare;
             stpTotConLetra.Free;
         End;
      End;
  end;

begin

    TotImpDeposito:=0;
    totCapPAg:=0;
    totFinPag:=0;
    TotIntPag:=0;
    TotConPag:=0;
    TotMorPag:=0;
    TotIvaPag:=0;
    TotCapAd:=0;
    TotFinAd:=0;
    totIntAd:=0;
    TotConAd:=0;
    TotMorAd:=0;
    TotIvaAd:=0;

    vlTotMora:=0;
    vlTotIvaMora:=0;

    TotMorCapital:=0;
    TotMorInteres:=0;
    totMorFinadic:=0;
    TotMorConceptos:=0;

    ProgressBar.Min := 0;
    ProgressBar.Position := 0;


    VLSalida := False;

    GeneraArchivoxls(edF_Corte.text,edACREDITADO.Text,edID_CREDITO.Text,iedID_CONTRATO.Text,'','',edRealizo.text,edCedula.text,
                           rgOrden.itemindex  );


    If Not qryConsultaXLS.Active Then
      Exit;

    vlExcelApp := CreateOleObject('Excel.Application');
    Try
    vlContrato:=0;
    vlNumHoja:=0;
    vlExcelApp.Workbooks.Add;
    vlResumenAdeudo:=false;
    If EdAcreditado.Text <> ''
    then CargaEncabDocto(EdNOMBRE_ACRED.TEXT,false)
    else if edID_CREDITO.Text <> ''
         then CargaEncabDocto(EdDesc_ID_CREDITO.TEXT,false)
         ELSE if iedID_CONTRATO.Text <> ''
              THEN CargaEncabDocto(Objeto.ContratoCre.Acreditado.Persona.Nombre.AsString,false);

    while not qryConsultaXLS.eof do
    Begin
      // Otro contrato?
      If (vlContrato <> qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger )
      then
      Begin
            vlNumHoja:=vlNumHoja+1;
            vLExcelApp.Workbooks[1].WorkSheets[vlNumHoja].select;
            vlExcelApp.sheets.add;
            vLExcelApp.Workbooks[1].WorkSheets[vlNumHoja].name:=qryConsultaXLS.fieldbyname('ID_CONTRATO').asString;
            vlContrato:=qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger;
       End;

      if (qryConsultaXLS.fieldbyname('CONCEPTO').Asinteger= 6 ) AND (vlResumenAdeudo=false)
      then
      Begin
         Inc(vlRow);
         vlExcelApp.Cells[vlRow, 1 ].Value:='RESUMEN DE ADEUDO';
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+IntTostr(vlRow)+':A'+IntTostr(vlRow)];
         vlRange.Font.FontStyle := 'Bold';
         Inc(vlRow);
         Inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='CAPITAL VIGENTE';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotCapitalVigente);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='CAPITAL VENCIDO';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotCapitalVencido);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='MORAS AL CAPITAL';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',TotMorCapital);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='REFINANCIAMIENTO DE INTERES VIGENTES';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotFinadicVigente);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='REFINANCIAMIENTO DE INTERES VENCIDO';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotFinadicVencido);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='MORAS SOBRE REFINANCIAMIENTO';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',TotMorFinadic);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='INTERESES ORDINARIOS VIGENTES';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotinteresVigente);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='INTERESES ORDINARIOS VIGENTES (IVA)';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotinteresVigenteIva);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='INTERESES ORDINARIOS VENCIDOS';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotinteresVencido);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='INTERESES ORDINARIOS VENCIDOS (IVA)';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotinteresVencidoIva);
         inc(vlRow);
//         vlExcelApp.Cells[vlRow, 2 ].Value:='MORAS SOBRE INTERESES ORDINARIOS ';
//         vlExcelApp.Cells[vlRow, 3 ].Value:=FormatFloat('###,###,###,##0.00',TotMorInteres);
//         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='CONCEPTOS VIGENTES ';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotConceptosVigente);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='CONCEPTOS VIGENTES (IVA)';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotConceptosVigenteIva);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='CONCEPTOS VENCIDOS';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotConceptosVencido);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='CONCEPTOS VENCIDOS (IVA)';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotConceptosVencidoIva);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='MORAS SOBRE CONCEPTOS';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',TotMorConceptos);
         inc(vlRow);
         vlExcelApp.Cells[vlRow, 2 ].Value:='TOTAL DEL ADEUDO';
         vlExcelApp.Cells[vlRow, 6 ].Value:=FormatFloat('###,###,###,##0.00',vlTotCapitalVigente+vlTotCapitalVencido+TotMorCapital+
                                                                             vlTotFinadicVigente+vlTotFinadicVencido+TotMorFinadic+
                                                                             vlTotinteresVigente+vlTotinteresVigenteIva+vlTotinteresVencido+vlTotinteresVencidoIva+
                                                                             vlTotConceptosVigente+vlTotConceptosVigenteIva+vlTotConceptosVencido+vlTotConceptosVencidoIva+TotMorConceptos);
         inc(vlRow);

         vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['B'+IntTostr(vlRow-16)+':B'+IntTostr(vlRow)];
         vlRange.Font.FontStyle := 'Bold';

         inc(vlRow);
         inc(vlRow);
         vlResumenAdeudo:=true;
          TotMorCapital:=0;
          TotMorInteres:=0;
          totMorFinadic:=0;
          TotMorConceptos:=0;

      End;

      case qryConsultaXLS.fieldbyname('ESTATUS').Asinteger OF
      0:Begin
          // GRPO 01      ENCABEZADO, DATOS GENERALES

              // ENCABEZADO
          vlExcelApp.Cells[1, 1].Value:=FrmEditor.Editor.Text;
          vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A1:P1'];
             vlrange.Merge;
             vlrange.WrapText := True;
             vlrange.MergeCells := True;

          vlExcelApp.Cells[2, 2 ].Value:='Fecha en que se firmó el Contrato :';
          if trim(edit1.text) <> ''
          then   vlExcelApp.Cells[2, 3 ].Value :=edit1.text
          else   vlExcelApp.Cells[2, 3 ].Value :=FormatDateTime('dd "de" mmmm "de" yyyy',qryConsultaXLS.fieldbyname('F_AUT_COMITE').AsDateTime);

          vlExcelApp.Cells[3, 2 ].Value:='Importe del crédito concedido     :';
          If trim(edit2.text) <> ''
          then vlExcelApp.Cells[3, 3 ].Value:=Edit2.text
          else vlExcelApp.Cells[3, 3 ].Value:=qryConsultaXLS.fieldbyname('IMP_AUTORIZADO').ASfloat;

          vlExcelApp.Cells[4, 2 ].Value:='Intereses ordinarios pactados     :';
          If trim(edit3.Text) <> ''
          Then  vlExcelApp.Cells[4, 3 ].Value:=edit3.text
          Else  vlExcelApp.Cells[4, 3 ].Value:='TASA '+qryConsultaXLS.fieldbyname('CVE_TASA_REFER').AsString+' '+qryConsultaXLS.fieldbyname('OPERADOR_STASA').AsString+' '+qryConsultaXLS.fieldbyname('SOBRETASACONT').AsString+' PUNTOS PORCENTUALES';

          vlExcelApp.Cells[5, 2 ].Value:='Intereses moratorios pactados     :';
          If trim(edit4.text) <> ''
          then vlExcelApp.Cells[5, 3 ].Value:=edit4.text
          else vlExcelApp.Cells[5, 3 ].Value:=qryConsultaXLS.fieldbyname('FACT_MORAS').AsString+ ' VECES LA TASA PORCENTUAL';

          vlExcelApp.Cells[6, 2 ].Value:='Fecha de vencimiento del contrato :';
           If edit5.text <> ''
          then vlExcelApp.Cells[6, 3 ].Value:= edit5.text
          else vlExcelApp.Cells[6, 3 ].Value:=FormatDateTime('dd "de" mmmm "de" yyyy',qryConsultaXLS.fieldbyname('F_VEN_CONT').asDateTime);

          vlTitulo5:='TASA '+qryConsultaXLS.fieldbyname('CVE_TASA_REFER').AsString;
          vlTitulo7:='TASA '+qryConsultaXLS.fieldbyname('CVE_TASA_REFER').AsString+' '+qryConsultaXLS.fieldbyname('OPERADOR_STASA').AsString+' '+qryConsultaXLS.fieldbyname('SOBRETASACONT').AsString;
          vlFactorMora:=qryConsultaXLS.fieldbyname('FACT_MORAS').AsString;
          vlOperadorTasa:=qryConsultaXLS.fieldbyname('OPERADOR_STASA').AsString;
          vlTasaAd:=vlTitulo5;
          vlTasaAd2:=vlTitulo7;
          vltasa1:='TASA '+qryConsultaXLS.fieldbyname('CVE_TASA_REFER').AsString;
          vlTasa2:='TASA '+qryConsultaXLS.fieldbyname('CVE_TASA_REFER').AsString+' '+qryConsultaXLS.fieldbyname('OPERADOR_STASA').AsString+' '+qryConsultaXLS.fieldbyname('SOBRETASACONT').AsString;
          vlTasa3:='TASA MORAT. ORD POR '+qryConsultaXLS.fieldbyname('FACT_MORAS').AsString;
           //----------------------------------
           // INICIA COLOCACIÓN DE ENCABEZADOS

           // CAPITAL DISPUESTO
           // ENCABEZADOS
             vlExcelApp.Cells[10, 1 ].Value:='CAPITAL DISPUESTO';
             vlExcelApp.Cells[11, 2 ].Value:='CREDITO';
             vlExcelApp.Cells[11, 3 ].Value:='FECHA';
             vlExcelApp.Cells[11, 4].Value:='IMPORTE';

           // Colocación de colores de banda de titulos
              vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A10:P11'];
              vlRange.Font.FontStyle := 'Bold';
//              vlRange.Font.Color := clWhite;
//              vlRange.Columns.Interior.ColorIndex := 1; // Negro
              vlRange.WrapText := True;
             vlRow:=12;
             vlTotDispuesto:=0;
              While (vlContrato = qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger) and (dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger=0)and (not dbgrid1.DataSource.DataSet.eof) do
              Begin
                  vlExcelApp.Cells[vlRow , 2 ].Value :=dbgrid1.datasource.dataset.fieldbyname('ID_CREDITO').asstring;
                  vlExcelApp.Cells[vlRow , 3 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_INICIO').asDateTime);//dbgrid1.datasource.dataset.fieldbyname('F_INICIO').asstring;
                  vlExcelApp.Cells[vlRow , 4 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMPORTE').asstring;
                  vlTotDispuesto:=vlTotDispuesto+dbgrid1.datasource.dataset.fieldbyname('IMPORTE').asfloat;
                  Inc(vlRow);
                  dbgrid1.DataSource.DataSet.next;
              End;
              vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['C'+IntTostr(vlRow)+':C'+IntTostr(vlRow)];
              vlRange.Font.FontStyle := 'Bold';
              vlExcelApp.Cells[vlRow , 4 ].Value :=FloatTostr(vlTotDispuesto);
              Inc(vlRow);
        end;
  1,2,3:Begin   // DETALLE DE PAGADO, VENCIDO Y VIGENTE
                //  inicia con el detalle mas grande
                //   BUSCA LO PAGADO
            While (vlContrato = qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger) and (dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger in [1,2,3])and (not dbgrid1.DataSource.DataSet.eof) do
            Begin
                vlTotConcepto:=0;
                vlIvaConcepto:=0;
                vltotMora:=0;
                vlTotIvaMora:=0;

                if qryConsultaXLS.fieldbyname('concepto').Asinteger=1
                then TotMorFinadic:=totMorFinadic+qryConsultaXLS.fieldbyname('imp_mora').ASFloat+qryConsultaXLS.fieldbyname('imp_iva_mora').asfloat;

                if qryConsultaXLS.fieldbyname('concepto').Asinteger=2
                then TotMorInteres:=TotMorInteres+qryConsultaXLS.fieldbyname('imp_mora').ASFloat+qryConsultaXLS.fieldbyname('imp_iva_mora').asfloat;

                if qryConsultaXLS.fieldbyname('concepto').Asinteger=3
                then TotMorCapital:=TotMorCapital+qryConsultaXLS.fieldbyname('imp_mora').ASFloat+qryConsultaXLS.fieldbyname('imp_iva_mora').asfloat;

                if qryConsultaXLS.fieldbyname('concepto').Asinteger=4
                then TotMorConceptos:=TotMorConceptos+qryConsultaXLS.fieldbyname('imp_mora').ASFloat+qryConsultaXLS.fieldbyname('imp_iva_mora').asfloat;


                vlSubtitulo1:='';
                vlStatus:=dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger;
                vlConcepto:=dbgrid1.DataSource.DataSet.fieldbyname('concepto').asinteger;
                case dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger of
                1: vlSubtitulo1:='PAGADO';
                2: vlSubtitulo1:='VENCIDO';
                3: vlSubtitulo1:='VIGENTE';
                end;
                 case dbgrid1.DataSource.DataSet.fieldbyname('CONCEPTO').asinteger OF
                1: vlSubtitulo1:='INTERESES ORDINARIOS CAPITALIZADOS '+vlSubtitulo1+'S';
                2: vlSubtitulo1:='INTERESES ORDINARIOS '+vlSubtitulo1+'S';
                3: vlSubtitulo1:='CAPITAL '+vlSubtitulo1;
                4: vlSubtitulo1:='CONCEPTOS '+vlSubtitulo1+'S';
                END;
                // ENCABEZADOS DE COLUMNAS
                If vlConcepto=4 // conceptos
                then
                Begin
                   vlTitulo1:='CREDITO';
                   vlTitulo2:='FECHA DE VENCIMIENTO';
                   vlTitulo3:='MONTO';
                   If vlstatus=1
                   then vlTitulo7:='FECHA DEL PAGO'
                   else vlTitulo7:='';
                   vlTitulo4:='IVA';
                   vlTitulo5:='MORATORIOS';
                   vlTitulo6:='IVA MORAS';
                   vlTitulo8:='';
                   vlTitulo9:='';
                   vlTitulo10:='';
                   vlTitulo11:='';

                end
                else
                Begin
                   vlTitulo1:='CREDITO';
                   vlTitulo2:='INICIO';
                   vlTitulo3:='VENCIMIENTO';
                   vlTitulo4:='NO. DE DIAS';
                   vlTitulo5:=vlTasa1;
                   vlTitulo6:='PUNTOS PORCENTUALES';
                   vlTitulo7:=vlTasa2;
                   vlTitulo8:='IMPORTE';
                   vlTitulo9:='IVA';
                   vlTitulo10:='MORATORIOS';
                   vlTitulo11:='IVA MORAS';
                   If vlstatus=1
                   then vlTitulo12:='FECHA DE PAGO'
                   Else vlTitulo12:='';
                End;
               Inc(vlRow);
               vlExcelApp.Cells[vlRow, 1 ].Value:=vlSubtitulo1;
               INC(vlRow);
               vlExcelApp.Cells[vlrow, 2 ].Value:=vlTitulo1;
               vlExcelApp.Cells[vlrow, 3 ].Value:=vlTitulo2;
               vlExcelApp.Cells[vlRow, 4 ].Value:=vlTitulo3;
               vlExcelApp.Cells[vlrow, 5 ].Value:=vlTitulo4;
               vlExcelApp.Cells[vlrow, 6 ].Value:=vlTitulo5;
               vlExcelApp.Cells[vlRow, 7 ].Value:=vlTitulo6;
               vlExcelApp.Cells[vlRow, 8 ].Value:=vlTitulo7;
               vlExcelApp.Cells[vlRow, 9 ].Value:=vlTitulo8;
               vlExcelApp.Cells[vlRow, 10 ].Value:=vlTitulo9;
               vlExcelApp.Cells[vlRow, 11 ].Value:=vlTitulo10;
               vlExcelApp.Cells[vlRow, 12 ].Value:=vlTitulo11;
               vlExcelApp.Cells[vlRow, 13 ].Value:=vlTitulo12;
               // Colocación de colores de banda de titulos
                vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+intTostr(vlrow-1)+':P'+intToStr(vlrow)];
                vlRange.Font.FontStyle := 'Bold';
                vlRange.WrapText := True;
               INC(vlRow);
                While (vlContrato = qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger) and (dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger=vlStatus)and (dbgrid1.DataSource.DataSet.fieldbyname('concepto').asinteger=vlConcepto)and (not dbgrid1.DataSource.DataSet.eof) do
                Begin
                  If dbgrid1.DataSource.DataSet.fieldbyname('concepto').asinteger= 4
                  then
                  Begin
                    vlExcelApp.Cells[vlRow , 2 ].Value :=dbgrid1.datasource.dataset.fieldbyname('ID_CREDITO').asstring;
                    vlExcelApp.Cells[vlRow , 3 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_VENCIMIENTO').asDateTime);//dbgrid1.datasource.dataset.fieldbyname('F_VENCIMIENTO').asstring;
                    vlExcelApp.Cells[vlRow , 4 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMPORTE').asstring;
                    vlExcelApp.Cells[vlRow , 6 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IVA').asstring;
                    vlExcelApp.Cells[vlRow , 7 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMP_MORA').asstring;
                    vlExcelApp.Cells[vlRow , 8 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMP_IVA_MORA').asstring;
                    If vlstatus=1
                    then   vlExcelApp.Cells[vlRow , 9 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('f_pago').ASdatetime);

                    vlTotConcepto:=vlTotConcepto+dbgrid1.datasource.dataset.fieldbyname('IMPORTE').asfloat;

                  end
                  else
                  BEgin
                    vlExcelApp.Cells[vlRow , 2 ].Value :=dbgrid1.datasource.dataset.fieldbyname('ID_CREDITO').asstring;
                    vlExcelApp.Cells[vlRow , 3 ].value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_INICIO').asDateTime);//dbgrid1.datasource.dataset.fieldbyname('F_INICIO').asstring;
                    vlExcelApp.Cells[vlRow , 4 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_VENCIMIENTO').asDateTime);//dbgrid1.datasource.dataset.fieldbyname('F_VENCIMIENTO').asstring;
                    vlExcelApp.Cells[vlRow , 5 ].Value :=dbgrid1.datasource.dataset.fieldbyname('PLAZO').asstring;
                    if dbgrid1.datasource.dataset.fieldbyname('CONCEPTO').ASInteger <> 3
                    then
                    begin
                        vlExcelApp.Cells[vlRow , 6 ].Value :=dbgrid1.datasource.dataset.fieldbyname('TASA_BASE').asstring;
                        vlExcelApp.Cells[vlRow , 7 ].Value :=dbgrid1.datasource.dataset.fieldbyname('SOBRETASA').asstring;
                        vlExcelApp.Cells[vlRow , 8 ].Value :=dbgrid1.datasource.dataset.fieldbyname('TASA_FINAL').asstring;
                    end;
                    vlExcelApp.Cells[vlRow , 9 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMPORTE').asstring;
                    vlExcelApp.Cells[vlRow , 10 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IVA').asstring;
                    vlExcelApp.Cells[vlRow , 11 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMP_MORA').asstring;
                    vlExcelApp.Cells[vlRow , 12 ].Value :=dbgrid1.datasource.dataset.fieldbyname('IMP_IVA_MORA').asstring;
                    If vlstatus=1
                    then   vlExcelApp.Cells[vlRow , 13 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_PAGO').asDateTime);//dbgrid1.datasource.dataset.fieldbyname('f_pago').asstring;

                    vlTotConcepto:=vlTotConcepto+dbgrid1.datasource.dataset.fieldbyname('IMPORTE').asfloat;

                  end;
                    vlTotMora:=vlTotMora+dbgrid1.datasource.dataset.fieldbyname('IMP_MORA').AsFloat;
                    vlTotIvaMora:=vlTotIvaMora+dbgrid1.datasource.dataset.fieldbyname('IMP_IVA_MORA').asfloat;
                    vlIvaConcepto:=vlIvaConcepto+dbgrid1.datasource.dataset.fieldbyname('IVA').asfloat;
                    Inc(vlRow);
                    dbgrid1.DataSource.DataSet.next;
                End;
                vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['H'+IntTostr(vlRow)+':P'+IntTostr(vlRow)];
                vlRange.Font.FontStyle := 'Bold';
                if vlConcepto=4
                then
                Begin
                   vlExcelApp.Cells[vlRow , 4 ].Value :=FloatTostr(vlTotConcepto);
                   vlExcelApp.Cells[vlRow , 5 ].Value :=FloatTostr(vlIvaConcepto);
                   vlExcelApp.Cells[vlRow , 6 ].Value :=FloatTostr(vlTotMora);
                   vlExcelApp.Cells[vlRow , 7 ].Value :=FloatTostr(vlTotIvaMora);
                end
                else
                Begin
                   vlExcelApp.Cells[vlRow , 9 ].Value :=FloatTostr(vlTotConcepto);
                   vlExcelApp.Cells[vlRow , 10 ].Value :=FloatTostr(vlIvaConcepto);
                   vlExcelApp.Cells[vlRow , 11 ].Value :=FloatTostr(vlTotMora);
                   vlExcelApp.Cells[vlRow , 12 ].Value :=FloatTostr(vlTotIvaMora);
                end;
                case vlStatus of
                1: case vlConcepto of
                    1:  vlTotFinadicPagado:=vlTotConcepto+vlIvaconcepto;
                    2:  vlTotInteresPagado:=vlTotConcepto+vlIvaconcepto;
                    3:  vlTotCapitalPagado:=vlTotConcepto+vlIvaconcepto;
                    4:  vlTotConceptosPagado:=vlTotConcepto+vlIvaconcepto;
                    end;
                2:case vlConcepto of
                    1:  vlTotFinadicVencido:=vlTotConcepto+vlIvaconcepto;
                    2:  BEGIN
                           vlTotInteresVencido:=vlTotConcepto;
                           vlTotInteresVencidoIva:=vlIvaconcepto;
                        End;
                    3:  vlTotCapitalVencido:=vlTotConcepto+vlIvaconcepto;
                    4:  begin
                          vlTotConceptosVEncido:=vlTotConcepto;
                          vlTotConceptosVencidoIva:=vlIvaconcepto;
                       end;
                    end;
                3:case vlConcepto of
                    1:  vlTotFinadicVigente:=vlTotConcepto+vlIvaconcepto;
                    2:  begin
                          vlTotInteresVigente:=vlTotConcepto;
                          vlTotInteresVigenteIva:=vlIvaconcepto;
                        end;
                    3:  vlTotCapitalVigente:=vlTotConcepto+vlIvaconcepto;
                    4:  Begin
                          vlTotConceptosVigente:=vlTotConcepto;
                          vlTotConceptosVigenteIva:=vlIvaconcepto;
                        end;
                    end;
                end;
                Inc(vlRow);
            end;
       end;
  5:Begin   // Resumen de pagos
           // inicia con encabezados

          vlExcelApp.Cells[vlRow, 1 ].Value:='RESUMEN DE PAGOS';
          Inc(vlrow);
          vlExcelApp.Cells[vlRow, 2 ].Value:='IMPORTE PAGADO';
          vlExcelApp.Cells[vlRow, 3 ].Value:='FECHA';
          vlExcelApp.Cells[vlRow, 4 ].Value:='CAPITAL';
          vlExcelApp.Cells[vlRow, 5 ].Value:='FINANCIAMIENTO ADICIONAL';
          vlExcelApp.Cells[vlRow, 6 ].Value:='INTERESES ORDINARIOS';
          vlExcelApp.Cells[vlRow, 7 ].Value:='CONCEPTOS';
          vlExcelApp.Cells[vlRow, 8 ].Value:='MORATORIOS';
          vlExcelApp.Cells[vlRow, 9 ].Value:='IVA';
          vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+IntTostr(vlRow-1)+':P'+IntTostr(vlRow)];
          vlRange.Font.FontStyle := 'Bold';
          Inc(vlRow);
          TotCappag:=0;
          TotFinPag:=0;
          TotIntPag:=0;
          TotConPag:=0;
          TotMorPag:=0;
          TotIvaPag:=0;
          TotImpDeposito:=0;

          While (vlContrato = qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger)and (dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger=5)and (not dbgrid1.DataSource.DataSet.eof) do
          Begin
                vlExcelApp.Cells[vlRow, 2 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('IMP_DEPOSITO').ASSTRING;
                vlExcelApp.Cells[vlRow, 3 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_OPERACION').asDateTime);//dbgrid1.DataSource.DataSet.fieldbyname('F_OPERACION').AsString;
                vlExcelApp.Cells[vlRow, 4 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('CAPITAL').AsString;
                vlExcelApp.Cells[vlRow, 5 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('FINADIC').AsString;
                vlExcelApp.Cells[vlRow, 6 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('INTERES').AsString;
                vlExcelApp.Cells[vlRow, 7 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('CONCEPTOS').AsString;
                vlExcelApp.Cells[vlRow, 8 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('MORATORIOS').AsString;
                vlExcelApp.Cells[vlRow, 9 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('IVAS').AsString;
                TotCappag:=TotCapPag+dbgrid1.DataSource.DataSet.fieldbyname('CAPITAL').ASFloat;
                TotFinPag:=TotFinPag+dbgrid1.DataSource.DataSet.fieldbyname('FINADIC').ASFloat;
                TotIntPag:=TotIntPag+dbgrid1.DataSource.DataSet.fieldbyname('INTERES').ASFloat;
                TotConPag:=totConPag+dbgrid1.DataSource.DataSet.fieldbyname('CONCEPTOS').ASFloat;
                TotMorPag:=TotMorPag+dbgrid1.DataSource.DataSet.fieldbyname('MORATORIOS').ASFloat;
                TotIvaPag:=TotIvaPag+dbgrid1.DataSource.DataSet.fieldbyname('IVAS').ASFloat;
                TotImpDeposito:=TotImpDeposito+dbgrid1.DataSource.DataSet.fieldbyname('IMP_DEPOSITO').asfloat;
                dbgrid1.DataSource.DataSet.next;
                Inc(vlRow);
          End;

          vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+IntTostr(vlRow)+':I'+IntTostr(vlRow)];
          vlRange.Font.FontStyle := 'Bold';
          vlExcelApp.Cells[vlRow , 2 ].Value :=FloatTostr(TotImpDeposito);
          vlExcelApp.Cells[vlRow , 4 ].Value :=FloatTostr(TotCapPag);
          vlExcelApp.Cells[vlRow , 5 ].Value :=FloatTostr(TotFinPag);
          vlExcelApp.Cells[vlRow , 6 ].Value :=FloatTostr(TotIntPag);
          vlExcelApp.Cells[vlRow , 7 ].Value :=FloatTostr(TotConPag);
          vlExcelApp.Cells[vlRow , 8 ].Value :=FloatTostr(TotMorPag);
          vlExcelApp.Cells[vlRow , 9 ].Value :=FloatTostr(TotIvaPag);
          Inc(vlrow);
    End;
  6:Begin   // Resumen de pagos
           // inicia con encabezados
           vlTitulo6:='TASA '+qryConsultaXLS.fieldbyname('TASA_BASE_AD').AsString;
           vlTitulo8:='PUNTOS PORCENTUALES';
          vlExcelApp.Cells[vlRow, 1 ].Value:='LO ANTERIOR SE DESPRENDE TOMANDO COMO BASE:';
          Inc(vlrow);
          vlExcelApp.Cells[vlRow, 2 ].Value:='CREDITO';
          vlExcelApp.Cells[vlRow, 3 ].Value:='INICIO';
          vlExcelApp.Cells[vlRow, 4 ].Value:='FIN';
          vlExcelApp.Cells[vlRow, 5 ].Value:=vlTasa1;
          vlExcelApp.Cells[vlRow, 6 ].Value:='PUNTOS PORCENTUALES';
          vlExcelApp.Cells[vlRow, 7 ].Value:=vlTasa2;
          vlExcelApp.Cells[vlRow, 8 ].Value:=vlTasa3;
          vlExcelApp.Cells[vlRow, 9 ].Value:='CAPITAL';
          vlExcelApp.Cells[vlRow, 10 ].Value:='REFINAN';
          vlExcelApp.Cells[vlRow, 11 ].Value:='INTERES ORDINARIO';
          vlExcelApp.Cells[vlRow, 12 ].Value:='INTERES MORAT.';
          vlExcelApp.Cells[vlRow, 13 ].Value:='CONCEPTOS';
          vlExcelApp.Cells[vlRow, 14 ].Value:='IVA';
          vlExcelApp.Cells[vlRow, 15 ].Value:='TOTAL ADEUDO';
          vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+IntTostr(vlRow-1)+':P'+IntTostr(vlRow)];
          vlRange.Font.FontStyle := 'Bold';
          Inc(vlRow);
          TotCapAD:=0;
          TotFinAD:=0;
          TotIntAD:=0;
          TotConAD:=0;
          TotMorAD:=0;
          TotIvaAD:=0;
          While (vlContrato = qryConsultaXLS.fieldbyname('ID_CONTRATO').Asinteger) and (dbgrid1.DataSource.DataSet.fieldbyname('estatus').asinteger=6)and (not dbgrid1.DataSource.DataSet.eof) do
          Begin
                vlMoneda:=dbgrid1.DataSource.DataSet.fieldbyname('Moneda_ad').AsInteger;
                vlExcelApp.Cells[vlRow, 2 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('ID_CREDITO').ASSTRING;
                vlExcelApp.Cells[vlRow, 3 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_INI_PER').asDateTime);//dbgrid1.DataSource.DataSet.fieldbyname('F_INI_PER').AsString;
                vlExcelApp.Cells[vlRow, 4 ].Value :=''''+Formatdatetime('dd/mm/yyyy',dbgrid1.datasource.dataset.fieldbyname('F_VEN_PER').asDateTime);//dbgrid1.DataSource.DataSet.fieldbyname('F_VEN_PER').AsString;
                vlExcelApp.Cells[vlRow, 5 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('TASA_BASE_AD').AsString;
                vlExcelApp.Cells[vlRow, 6 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('SOBRETASA_AD').AsString;
                vlExcelApp.Cells[vlRow, 7 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('TASA_FINAL_AD').AsString;
                vlExcelApp.Cells[vlRow, 8 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('TASA_MORA_AD').AsString;
                vlExcelApp.Cells[vlRow, 9 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('CAPITAL_AD').AsString;
                vlExcelApp.Cells[vlRow, 10 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('FINADIC_AD').AsString;
                vlExcelApp.Cells[vlRow, 11 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('INTERES_AD').AsString;
                vlExcelApp.Cells[vlRow, 12 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('CONCEPTOS_AD').AsString;
                vlExcelApp.Cells[vlRow, 13 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('MORATORIOS_AD').AsString;
                vlExcelApp.Cells[vlRow, 14 ].Value:=dbgrid1.DataSource.DataSet.fieldbyname('IVAS_AD').AsString;
                vlExcelApp.Cells[vlRow, 15 ].Value:=FloatTostr(dbgrid1.DataSource.DataSet.fieldbyname('CAPITAL_AD').ASfLOAT+
                                                    dbgrid1.DataSource.DataSet.fieldbyname('FINADIC_AD').AsFloat+
                                                    dbgrid1.DataSource.DataSet.fieldbyname('INTERES_AD').asfloat+
                                                    dbgrid1.DataSource.DataSet.fieldbyname('CONCEPTOS_AD').ASfloat+
                                                    dbgrid1.DataSource.DataSet.fieldbyname('MORATORIOS_AD').asFloat+
                                                    dbgrid1.DataSource.DataSet.fieldbyname('IVAS_AD').asFloat);

                TotCapAD:=TotCapAD+dbgrid1.DataSource.DataSet.fieldbyname('CAPITAL_AD').ASFloat;
                TotFinAD:=TotFinAD+dbgrid1.DataSource.DataSet.fieldbyname('FINADIC_AD').ASFloat;
                TotIntAD:=TotIntAD+dbgrid1.DataSource.DataSet.fieldbyname('INTERES_AD').ASFloat;
                TotConAD:=TotConAD+dbgrid1.DataSource.DataSet.fieldbyname('CONCEPTOS_AD').ASFloat;
                TotMorAD:=TotMorAD+dbgrid1.DataSource.DataSet.fieldbyname('MORATORIOS_AD').ASFloat;
                TotIvaAD:=TotIvaAD+dbgrid1.DataSource.DataSet.fieldbyname('IVAS_AD').ASFloat;


                dbgrid1.DataSource.DataSet.next;
                Inc(vlRow);
          End;
          TotADEUDO:=totCapAD+totFinAD+TotIntAd+TotConAd+TotMorAD+TotIvaAd;

          vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+IntTostr(vlRow)+':P'+IntTostr(vlRow+1)];
          vlRange.Font.FontStyle := 'Bold';

          vlExcelApp.Cells[vlRow , 9 ].Value :=FloatTostr(TotCapaD);
          vlExcelApp.Cells[vlRow , 10 ].Value :=FloatTostr(TotFinAD);
          vlExcelApp.Cells[vlRow , 11].Value :=FloatTostr(TotIntAD);
          vlExcelApp.Cells[vlRow , 12 ].Value :=FloatTostr(TotConAD);
          vlExcelApp.Cells[vlRow , 13 ].Value :=FloatTostr(TotMorAD);
          vlExcelApp.Cells[vlRow , 14 ].Value :=FloatTostr(TotIvaAD);
          vlExcelApp.Cells[vlRow , 15 ].Value :=FloatTostr(TotADeudo);
          inc(vlrow);
          vlExcelApp.Cells[vlRow , 2 ].Value :=Convierteletras(TotAdeudo,vlMoneda);
          Inc(vlrow);
          // Imprime Pie
          vlExcelApp.Cells[VLRow, 1].Value:=FrmEditor.Editor2.Text;
          vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Range['A'+IntTostr(vlRow)+':P'+IntToStr(vlRow)];
          vlrange.Merge;
          vlrange.WrapText := True;
          vlrange.MergeCells := True;
          // firmas
          inc(vlrow);
          inc(vlrow);
          vlExcelApp.Cells[vlRow, 2].Value:=EdRealizo.text;
          inc(vlrow);
          vlExcelApp.Cells[vlRow, 2].Value:='Cédula profesional:'+EdCedula.text;


    end;
  End;
 end;


    VLSalida := True;

       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //


    // Coloca el tipo de fuente a 8     y los titulos de las columnas

      For vlHojas:=1 to vlNumHoja do
//       For vlCol := 0 To 30 Do
       Begin

         vlCol:=30;
         vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[vlNumHoja].Columns;
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlHojas].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
         vlRange.WrapText := True;
         vlColumnRange.Columns[vlCol+1].Font.Size := 8;
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlHojas].Range['B1:B'+IntToStr(vlRow-1)];
         vlRange.NumberFormat := '0';
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[vlHojas].Range['C1:P'+IntToStr(vlRow-1)];
         vlRange.NumberFormat := '#,##0.00';

       End;


    Finally
      // Habi8litaControles(True);
      qryConsultaXLS.CLOSE;
       vlExcelApp.ActiveWorkBook.SaveAs(peFileName);
       if CloseExcelFile(vlExcelApp) then
          ShowMessage('Archivo Generado')
       else
          ShowMessage('Archio no generado');
    End;



end;

procedure TWMEdoCtaCt.edF_CorteExit(Sender: TObject);
begin
CargaEncabDocto(edDesc_id_credito.text,true);
end;

procedure TWMEdoCtaCt.dtpF_CorteExit(Sender: TObject);
begin
CargaEncabDocto(edDesc_id_credito.text,true);
end;

procedure TWMEdoCtaCt.BitBtn5Click(Sender: TObject);
begin
  pnDatosContrato.Visible:=not pnDatosContrato.Visible;
  pnDatosContrato.Top:=60;
  pnDatosContrato.Left:=8;
  pnDatosContrato.Width:= 497;
  pnDatosContrato.Height:=162;
end;

procedure TWMEdoCtaCt.edCVE_PRODUCTOChange(Sender: TObject);
begin
  If edCVE_PRODUCTO.Text <> ''
  THEN
  Begin
        cbID_CREDITO.Checked:=false;
        chbxAcreditado.Checked:=false;
  end;
end;

end.
