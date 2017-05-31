// Sistema         : Clase de CRFEReP
// Fecha de Inicio : 05/09/2010
// Función forma   : Clase de CRFEReP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCRFEReP;

interface
              
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntLinkit,  IntGenCre,
  IntMon,           //Moneda
  IntCrEmisor,  // Catálogo de Emsiores
  IntCrProveed, // Catálogo de Proveedores
  IntCrCartrIm, //Detalle de Impagado
  Intempre,          //Empresa
  IntUnNeg,           //Unidad Negocio/Suc
  IntCRQRFEReP
;

Type
 TCRFEReP= class;

  TWCRFEReP=Class(TForm)
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
    lbID_EMISOR: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    chbxEmisor: TCheckBox;
    lbID_PROVEEDOR: TLabel;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_EXTERNO: TEdit;
    chbxProveedor: TCheckBox;
    lbAplica: TLabel;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    dtpComF_INICIO: TInterDateTimePicker;
    edComF_INICIO: TEdit;
    edComF_FINAL: TEdit;
    dtpComF_FINAL: TInterDateTimePicker;
    chbxF_Liq: TCheckBox;
    ilEMISOR: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    edNOM_PROVEEDOR: TEdit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    ilMONEDA: TInterLinkit;
    gbControl: TGroupBox;
    Label3: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    private 
    { Private declarations }
    Procedure AsignaEmpresaSuc;    
    public 
    { Public declarations } 
    Objeto : TCRFEReP;
end; 
 TCRFEReP= class(TInterFrame) 
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre:   TParamCre;
        Moneda                   : TMoneda;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        DetImpagado              : TCrCartrIm;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses


{$R *.DFM}


constructor TCRFEReP.Create( AOwner : TComponent ); 
begin Inherited;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_EXT';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);


      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCRFEReP.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCRFEReP.Destroy;
begin
   if Moneda <> nil then
      Moneda.Free;
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
      
   inherited;
end;


function TCRFEReP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCRFEReP;
begin
   W:=TWCRFEReP.Create(Self);
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


Function TCRFEReP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrferep.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCRFEReP.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRFEReP********************)
(*                                                                              *)
(*  FORMA DE CRFEReP                                                            *)
(*                                                                              *)
(***********************************************FORMA CRFEReP********************)

procedure TWCRFEReP.AsignaEmpresaSuc;
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

procedure TWCRFEReP.FormShow(Sender: TObject);
begin
      with Objeto do
      begin
           lbDempresa.Caption := ParamCre.EMPRESA.AsString;
           lbDfecha.Caption  := ParamCre.FECHA.AsString;
           lbDUsuario.Caption := ParamCre.USUARIO.AsString;
           lbDPerfil.Caption := ParamCre.PERFIL.AsString;
      end;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);
      edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_EMISOR.ShowHint := True;

      Objeto.Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_EXTERNO;
      Objeto.Proveedor.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;

      Interforma1.MsgPanel := MsgPanel;      


end;

procedure TWCRFEReP.FormDestroy(Sender: TObject);
begin
     Objeto.Moneda.Cve_Moneda.Control := nil;
     Objeto.Moneda.Desc_Moneda.Control := nil;
     Objeto.Emisor.ID_ACREDITADO.Control := nil;
     Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
     Objeto.Proveedor.ID_ACREDITADO.Control := nil;
     Objeto.Proveedor.Persona.Nombre.Control := nil;
     Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;
      Objeto.Empresa.ID_Empresa.Control := Nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
      Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
      Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TWCRFEReP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCRFEReP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCRFEReP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCRFEReP.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCRFEReP.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWCRFEReP.btEMISORClick(Sender: TObject);
begin
   Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39;
   Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;


   Objeto.Emisor.ShowAll := True;
   If Objeto.Emisor.Busca Then Begin
      chbxEmisor.Checked:=True;
      chbxEmisor.Enabled:=True;
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCRFEReP.btPROVEEDORClick(Sender: TObject);
Var vlMensaje :String;
begin
   Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39;
   Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;


   Objeto.Proveedor.ShowAll := True;
   If Objeto.Proveedor.Busca Then Begin
      chbxProveedor.Checked:=True;
      chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TWCRFEReP.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:=False;
        chbxMoneda.Enabled:=False;
    End Else Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
    End;
end;

procedure TWCRFEReP.chbxEmisorClick(Sender: TObject);
begin
    If not chbxEmisor.Checked Then Begin
        Objeto.Emisor.Active:=False;
        chbxEmisor.Checked:=False;
        chbxEmisor.Enabled:=False;
    End Else Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
    End;
end;

procedure TWCRFEReP.chbxProveedorClick(Sender: TObject);
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

procedure TWCRFEReP.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWCRFEReP.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCRFEReP.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCRFEReP.ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCRFEReP.ilEMISOREjecuta(Sender: TObject);
begin
  Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39 ;
  Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;

   If Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) Then Begin
      chbxEmisor.Checked:=True;
      chbxEmisor.Enabled:=True;
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCRFEReP.ilPROVEEDOREjecuta(Sender: TObject);
Var vlMensaje :String;
begin
  Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39;
  Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;

  If Objeto.Proveedor.FindKeyNear([ilPROVEEDOR.Buffer],['ID_ACREDITADO']) Then Begin
      chbxProveedor.Checked:=True;
      chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TWCRFEReP.InterForma1BtnImprimirClick(Sender: TObject);
begin
RepPagosFEEmisor( edCVE_MONEDA.Text ,
                  edID_EMISOR.Text   ,
                  edID_PROVEEDOR.Text,
                  edComF_INICIO.Text ,
                  edComF_FINAL.Text  ,
                  EdIdEmpresa.Text  ,
                  EdIDSucursal.Text  ,
                  Objeto.Apli,
                  FALSE);
end;

procedure TWCRFEReP.InterForma1BtnPreviewClick(Sender: TObject);
begin
RepPagosFEEmisor( edCVE_MONEDA.Text ,
                  edID_EMISOR.Text   ,
                  edID_PROVEEDOR.Text,
                  edComF_INICIO.Text ,
                  edComF_FINAL.Text  ,
                  EdIdEmpresa.Text  ,
                  EdIDSucursal.Text  ,
                  Objeto.Apli,
                  true);
end;

end.
