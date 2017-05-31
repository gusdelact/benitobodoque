// Sistema         : Clase de TMCatMin
// Fecha de Inicio : 02/08/2004
// Función forma   : Clase de TMCatMin
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCaTMin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit, InterApl,

//Unidades Adicionales
IntParamCre,
IntMQrCatMin,
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMCatMin= class;

  TwMCatMin=Class(TForm)
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
    InterDateTimePicker1: TInterDateTimePicker;
    edFInicial: TEdit;
    lblFechas: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edFechInicio: TEdit;
    tpFechIni: TInterDateTimePicker;
    GroupBox1: TGroupBox;
    edFechUdis: TEdit;
    tpFechUdis: TInterDateTimePicker;
    Label4: TLabel;
    edDolar: TEdit;
    Label3: TLabel;
    tpFechDolar: TInterDateTimePicker;
    edFechDolar: TEdit;
    Label5: TLabel;
    edUdi: TEdit;
    Label6: TLabel;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ILSucursal: TInterLinkit;
    ilEmpresa: TInterLinkit;
    Label7: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edFechDolarChange(Sender: TObject);
    procedure edFechUdisChange(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
       Objeto : TMCatMin;
       Function ObtenCambio(dFecha : TDateTime;dCveMoneda : Double; Apli : TInterApli) : Double;

 End;
 TMCatMin= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        ParamCre                 : TParamCre;
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TMCatMin.Create( AOwner : TComponent );
begin Inherited;
      //SASB
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'InTMCatMin.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMCatMin.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMCatMin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCatMin;
begin
   W:=TwMCatMin.Create(Self);
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


Function TMCatMin.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMCatMin.AsignaEmpresaSuc;
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

procedure TwMCatMin.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   tpFechIni.DateTime := Objeto.Apli.DameFechaEmpresaDia('AYER');
   self.edFechInicio.Text := DateToStr(tpFechIni.DateTime);

   tpFechDolar.DateTime := Objeto.Apli.DameFechaEmpresaDia('FMAN');
   self.edFechDolar.Text := DateToStr(tpFechDolar.DateTime);
   tpFechUdis.DateTime := Objeto.Apli.DameFechaEmpresaDia('FMAN');
   self.edFechUdis.Text := DateToStr(tpFechUdis.DateTime);

   Self.edDolar.Text := FloatToStr(ObtenCambio(tpFechDolar.DateTime,840,Objeto.Apli));
   Self.edUdi.Text := FloatToStr(ObtenCambio(tpFechUdis.DateTime,800,Objeto.Apli));

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
end;

procedure TwMCatMin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCatMin.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMCatMin.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMCatMin.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

Procedure TwMCatMin.ImprimeReporte(bPreview:Boolean);
begin
     EjecutarReporteCatMinimo( edFechInicio.Text, Self.edDolar.Text,
                               Self.edUdi.Text , EdIdEmpresa.Text, EdIDSucursal.Text,//SASB
                               Objeto.Apli,bPreview);
End;
procedure TwMCatMin.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

Function TwMCatMin.ObtenCambio(dFecha : TDateTime;dCveMoneda : Double; Apli : TInterApli) : Double;
Var
    stpTpoCam : TStoredProc;
    dFechaCambio : TDateTime;
Begin
 Result := 0;
  Try
   stpTpoCam := TStoredProc.create(nil);

   stpTpoCam.DatabaseName   := Apli.DatabaseName;
   stpTpoCam.SessionName    := Apli.SessionName;

   stpTpoCam.StoredProcName := 'PKGCORPO.OBTTIPOCAMBIO';
   stpTpoCam.Params.Clear;
   stpTpoCam.Params.CreateParam(ftFloat   ,'RESULT'      ,ptResult);
   stpTpoCam.Params.CreateParam(ftDateTime,'PFECHA'      ,ptInput);
   stpTpoCam.Params.CreateParam(ftFloat   ,'PCVE_MONEDA' ,ptInput);
   stpTpoCam.Params.CreateParam(ftString  ,'PBULTIMOCAPT',ptInput);

   stpTpoCam.ParamByName('PBULTIMOCAPT').AsString  := 'V';
   stpTpoCam.ParamByName('PCVE_MONEDA').AsFloat    := dCveMoneda;
   stpTpoCam.ParamByName('PFECHA').AsDateTime      := dFecha;

   stpTpoCam.ExecProc;
   Result := stpTpoCam.ParamByName('RESULT').AsFloat;
  Finally
   stpTpoCam.Free;
  End;
End;


procedure TwMCatMin.edFechDolarChange(Sender: TObject);
begin
      Self.edDolar.Text := FloatToStr(ObtenCambio(tpFechDolar.DateTime,840,Objeto.Apli));
      
end;

procedure TwMCatMin.edFechUdisChange(Sender: TObject);
begin
    Self.edUdi.Text := FloatToStr(ObtenCambio(tpFechUdis.DateTime,800,Objeto.Apli));
end;

procedure TwMCatMin.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCatMin.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCatMin.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCatMin.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCatMin.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
   End;
end;

procedure TwMCatMin.FormDestroy(Sender: TObject);
begin
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

end.

