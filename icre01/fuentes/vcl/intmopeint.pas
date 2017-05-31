// Sistema         : Clase de MOpeInt
// Fecha de Inicio : 18/06/2012
// Función forma   : Clase de MOpeInt
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Araceli Ramos Baz
// Comentarios     : Reporte operativo de intereses utiliza la tabla CR_HISTO_INTERES
Unit IntMOpeInt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

ShellApi,
IntParamCre,
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntCrProduct,     //Producto Credito
IntCrCredito,     //Disposición
InterApl,
IntGenCre,
IntLinkit;



Type
 TMopeint= class;

  TWMopeint=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgFechas: TRadioGroup;
    dtpFechaDia: TDateTimePicker;
    dtpFechaIniRan: TDateTimePicker;
    dtpFechaFinRan: TDateTimePicker;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    chbxMoneda: TCheckBox;
    lbAplica: TLabel;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label3: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    ilCesion: TInterLinkit;
    rgSubtotales: TRadioGroup;
    cbFechaValor: TCheckBox;
    cbGenArchExcel: TCheckBox;
    edRuta: TEdit;
    sbtnExcel: TSpeedButton;
    SaveDialog1: TSaveDialog;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure rgFechasClick(Sender: TObject);
    procedure dtpFechaDiaChange(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure sbtnExcelClick(Sender: TObject);
    procedure GeneraNomArch;
    procedure cbGenArchExcelClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TMopeint;
    procedure MuestraReporte(peBPreview : Boolean);    
end; 
 TMopeint= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
//        CAMPO1                   : TInterCampo;
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;     //Moneda
        Acreditado               : TCrAcredit;  //Acreditado
        Credito                  : TCrCredito;  //Disposición
        Producto                 : TCrProduct;  //Producto

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override;

      published
      end;

implementation
Uses IntQrOpeInt;      //Reporte

{$R *.DFM}


constructor TMopeint.Create( AOwner : TComponent ); 
begin Inherited; 
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='CVE_PRODUCTO_CRE';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntMOpeInt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMopeint.Destroy;
begin
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Credito <> nil then
      Credito.Free;
   if Producto <> nil then
      Producto.Free;
      
   inherited;
end;


function TMopeint.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMopeint;
begin
   W:=TWMopeint.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA //ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMopeint.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMopeint.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMopeint.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MOpeInt********************)
(*                                                                              *)
(*  FORMA DE MOpeInt                                                            *)
(*                                                                              *)
(***********************************************FORMA MOpeInt********************)

procedure TWMopeint.FormShow(Sender: TObject);
begin
  dtpFechaDia.Date := Objeto.Apli.DameFechaEmpresa;

  dtpFechaIniRan.Date := StrToDate('01/'+ FormatDateTime('mm',Objeto.Apli.DameFechaEmpresa) + '/' + FormatDateTime('yyyy',Objeto.Apli.DameFechaEmpresa));
  dtpFechaFinRan.Date := Objeto.Apli.DameFechaEmpresa;

  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
  Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
  Objeto.Moneda.GetParams(Objeto);
  edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
  edDESC_MONEDA.ShowHint := True;

  Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
  Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
  Objeto.GetParams(Objeto);
  edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
  edNOMBRE_ACRED.ShowHint := True;

  Objeto.Producto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
  Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
  Objeto.Producto.GetParams(Objeto);

  Objeto.Credito.ID_CREDITO.Control := edID_CESION;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
  Objeto.Credito.GetParams(Objeto);
  edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
  edCESION.ShowHint := True;

end;

procedure TWMopeint.FormDestroy(Sender: TObject);
begin
  Objeto.Moneda.Cve_Moneda.Control := nil;
  Objeto.Moneda.Desc_Moneda.Control := nil;
  Objeto.Acreditado.ID_ACREDITADO.Control := nil;
  Objeto.Acreditado.Persona.Nombre.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
  Objeto.Credito.ID_CREDITO.Control := nil;
end;

procedure TWMopeint.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMopeint.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMopeint.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMopeint.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;



procedure TWMopeint.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWMopeint.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMopeint.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMopeint.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMopeint.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMopeint.btID_CESIONClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             edID_CESION.Text := T.DameCampo(0);
             edCESION.Text := T.DameCampo(1);
             chbxCESION.Enabled:=True;
             chbxCESION.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMopeint.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:= False;
        chbxMoneda.Enabled:= False;
    End Else Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
    End;
end;

procedure TWMopeint.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWMopeint.chbxCESIONClick(Sender: TObject);
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

procedure TWMopeint.rgFechasClick(Sender: TObject);
begin
  case rgFechas.ItemIndex of
  0: begin
       dtpFechaDia.Enabled := True;
       dtpFechaIniRan.Enabled := False;
       dtpFechaFinRan.Enabled := False;
     end;
  1: begin
       dtpFechaDia.Enabled := False;
       dtpFechaIniRan.Enabled := True;
       dtpFechaFinRan.Enabled := True;
     end;
  end;
end;

procedure TWMopeint.dtpFechaDiaChange(Sender: TObject);
var wYear, wMonth, wDay: Word;
begin
  Try
    DecodeDate(dtpFechaDia.Date, wYear, wMonth, wDay);

    dtpFechaIniRan.Date := StrToDate('01/'+ FormatDateTime('mm',dtpFechaDia.Date) + '/' + FormatDateTime('yyyy',dtpFechaDia.Date));
    dtpFechaFinRan.Date := dtpFechaDia.Date;
  Finally
  End;
end;

procedure TWMopeint.MuestraReporte(peBPreview: Boolean);
var
  vlFIni, vlFFin : TDateTime;
  vlStrArchivoXLS , vlStrArchivoQry : String;
  vlCredito : Integer;
begin
   if rgFechas.ItemIndex = 0 then
   begin
     vlFIni := dtpFechaDia.Date;
     vlFFin := dtpFechaDia.Date;
   end
   else
   begin
     vlFIni := dtpFechaIniRan.Date;
     vlFFin := dtpFechaFinRan.Date;
   end;

     If cbGenArchExcel.Checked Then
        vlStrArchivoXLS := edRuta.text
     Else
        vlStrArchivoXLS := '';

   if chbxCESION.Checked then
      vlCredito := StrToInt(edID_CESION.Text)
   else
      vlCredito := 0;

   RepOperativoIntereses(vlFIni,
                         vlFFin,
                         objeto.moneda.cve_moneda.AsInteger,
                         objeto.acreditado.id_acreditado.AsInteger,
                         edCVE_PRODUCTO_CRE.Text,
                         vlCredito,
                         rgSubtotales.itemIndex,
                         cbFechaValor.Checked,
                         Objeto.Apli,
                         peBPreview,
                         vlStrArchivoXLS);
end;

procedure TWMopeint.InterForma1Preview(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMOPEINT_PREVI',True,True) then
      MuestraReporte(True);
end;

procedure TWMopeint.InterForma1Imprimir(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMOPEINT_IMPRI',True,True) then
      MuestraReporte(False);
end;

procedure TWMopeint.sbtnExcelClick(Sender: TObject);
begin
  SaveDialog1.DefaultExt := '*.xls';
  SaveDialog1.Filter     := 'Archivo Excel (*.xls)|*.xls';
  SaveDialog1.FileName:= edRuta.Text;
  if SaveDialog1.Execute then
   edRuta.Text:=SaveDialog1.FileName;
end;

procedure TWMopeint.cbGenArchExcelClick(Sender: TObject);
begin
  If cbGenArchExcel.Checked Then
    Begin
      edRuta.Enabled:=True;
      sbtnExcel.Enabled:=True;
      edRuta.Color := clWindow;
      edRuta.ReadOnly := False;
      edRuta.Text:='C:\';
      GeneraNomArch;
    End
  Else
    Begin
      edRuta.Clear;
      edRuta.Enabled:=False;
      edRuta.Color := clBtnFace;
      edRuta.ReadOnly := True;
      sbtnExcel.Enabled:=False;
    End
end;

procedure TWMopeint.GeneraNomArch;
var vlruta, vlNomArch: String;
begin
 If (edRuta.Text<>'')  Then
    Begin
    vlruta:=ExtractFilePath(edRuta.text);
    vlNomArch:= 'OPERATIVO_INTERES'+'.XLS';
    edRuta.Text:= vlruta+vlNomArch;
    End;
end;

procedure TWMopeint.btPRODUCTOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('CONSCRPROD.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_PRODUCTO_CRE.Text := T.DameCampo(0);
             edDESC_PRODUCTO.Text := T.DameCampo(1);
             chbxProducto.Enabled:=True;
             chbxProducto.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWMopeint.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer])then
   begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   end;
end;

procedure TWMopeint.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;

end;

end.
