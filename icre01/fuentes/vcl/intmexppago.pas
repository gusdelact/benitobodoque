// Sistema         : Clase de Experiencia de Pago
// Fecha de Inicio : 21/06/2005
// Función forma   : Clase de Experiencia de Pago
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMExpPago;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntEmple,
IntMQrExpPago,
IntCrAcredit
;

Type
 TMExpPago= class;

  TWMExpPago=Class(TForm)
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
    lbAplica: TLabel;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    edIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    edID_TITULAR: TEdit;
    btID_TITULAR: TBitBtn;
    edNOM_TITULAR: TEdit;
    chbID_TITULAR: TCheckBox;
    ilID_TITULAR: TInterLinkit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_TITULARClick(Sender: TObject);
    procedure chbID_TITULARClick(Sender: TObject);
    procedure ilID_TITULAREjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMExpPago;
end;
 TMExpPago= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        FECHA                    : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;
        ID_EMPRESA               : TInterCampo;

        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Titular                  : TCrAcredit;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
//Uses RepMon;
{$R *.DFM}

constructor TMExpPago.Create( AOwner : TComponent );
begin Inherited;
      FECHA :=CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
                FECHA.Caption:='Fecha';
                FECHA.Parametro:='FECHA';
      ID_TITULAR :=CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
                ID_TITULAR.Caption:='Titular';
                ID_TITULAR.Parametro:='ID_TITULAR';
      NOM_TITULAR :=CreaCampo('NOM_TITULAR',ftString,tsNinguno,tsNinguno,False);
                NOM_TITULAR.Caption:='Nombre Titular';
                NOM_TITULAR.Parametro:='NOM_TITULAR';
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
                ID_EMPRESA.Caption:='Empresa';
                ID_EMPRESA.Parametro:='ID_EMPRESA';

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      Titular := TCrAcredit.Create(Self);
      {$WARNINGS ON}      
      Titular.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtaChqAcr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMExpPago.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If Titular<> Nil Then
      Titular.Free;
   inherited;
end;


function TMExpPago.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMExpPago;
begin
   W:=TWMExpPago.Create(Self);
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


Function TMExpPago.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA RepDetAcred********************)
(*                                                                              *)
(*  FORMA DE RepDetAcred                                                            *)
(*                                                                              *)
(***********************************************FORMA RepDetAcred********************)
procedure TWMExpPago.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then
      CBSucursal.Checked := True;
   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

Procedure TWMExpPago.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMExpPago.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.FECHA.Control:=edFECHA;
   Objeto.ID_TITULAR.Control:=edID_TITULAR;
   Objeto.NOM_TITULAR.Control:=edNOM_TITULAR;
   Objeto.ID_EMPRESA.Control:=edIdEmpresa; 

   Objeto.Titular.ID_ACREDITADO.Control:=edID_TITULAR;
   Objeto.Titular.Persona.Nombre.Control:=edNOM_TITULAR;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
   dtpFecha.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edFECHA.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TWMExpPago.FormDestroy(Sender: TObject);
begin
   Objeto.FECHA.Control:=nil;
   Objeto.ID_TITULAR.Control:=nil;
   Objeto.NOM_TITULAR.Control:=nil;
   Objeto.ID_EMPRESA.Control:=nil;   

   Objeto.Titular.ID_ACREDITADO.Control:=nil;
   Objeto.Titular.Persona.Nombre.Control:=nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TWMExpPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TWMExpPago.ImprimeReporte(bPreview:Boolean);
begin
    Objeto.ID_TITULAR.GetFromControl;
    Objeto.ID_EMPRESA.GetFromControl;
    Objeto.FECHA.GetFromControl;

    RepExpPago(objeto.ID_TITULAR.AsString,         Objeto.ID_EMPRESA.AsString,        EdIDSucursal.Text,
                Objeto.FECHA.AsDateTime,           Objeto.Apli,                       bPreview               ,
                edNbrArch.Text);
End;

procedure TWMExpPago.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEXPPAGO_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TWMExpPago.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEXPPAGO_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWMExpPago.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMExpPago.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMExpPago.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMExpPago.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMExpPago.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMExpPago.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked:=True;
      chbID_TITULAR.Enabled:=True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TWMExpPago.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TWMExpPago.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked:=True;
      chbID_TITULAR.Enabled:=True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TWMExpPago.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then
      Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.xls';
      cbxArchivo.Checked := True;
      cbxArchivo.Enabled := True;
      End
  Else
    edNbrArch.Text := '';
end;

procedure TWMExpPago.cbxArchivoClick(Sender: TObject);
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

end.



