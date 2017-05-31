// Sistema         : Clase de TMColoca
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMColoca
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMQLiMaxFi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntGenCre,
IntParamCre,
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntQrLiMaxFi,      //Reporte resumen
IntQrLiMaxFiDet,   //Reporte detalle Min Acred
IntQrLiMaFiDet2    //Reporte detalle Max Acred
;

Type
 TMQLiMaxFi= class;

  TwMQLiMaxFi=Class(TForm)
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
    SaveDialog1: TSaveDialog;
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
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    lbLiqF_INICIO: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edCAP_BASICO: TInterEdit;
    Label2: TLabel;
    edINDICE: TInterEdit;
    Label3: TLabel;
    ieREG_MIN: TInterEdit;
    ieREG_MAX: TInterEdit;
    Label4: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
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
    procedure ieREG_MINExit(Sender: TObject);
    procedure ieREG_MAXExit(Sender: TObject);
    procedure edCAP_BASICOExit(Sender: TObject);
    procedure edINDICEExit(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMQLiMaxFi;
end;
 TMQLiMaxFi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        ParamCre                 : TParamCre;
        
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMQLiMaxFi.Create( AOwner : TComponent );
begin Inherited;
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'TMQLiMaxFi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMQLiMaxFi.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMQLiMaxFi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMQLiMaxFi;
begin
   W:=TwMQLiMaxFi.Create(Self);
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


Function TMQLiMaxFi.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMQLiMaxFi.AsignaEmpresaSuc;
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

procedure TwMQLiMaxFi.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_Inicio.DateTime:= objeto.Apli.DameFechaEmpresaDia('D000')-1;
      edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;

end;

procedure TwMQLiMaxFi.FormDestroy(Sender: TObject);
begin
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMQLiMaxFi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMQLiMaxFi.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True, grPreview );
end;

Procedure TwMQLiMaxFi.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
Var
    sSituacion, sGpoProd, sProcam, sOperDD, sTipoDisp :String;
    iSit, iNafin, iDescDoc, iTipoDisp: Integer;
    dIntereses : Double;
begin
    RepLimMaxFinanc( edF_Inicio.Text        , edCAP_BASICO.Text, edINDICE.Text, ieREG_MIN.Text,
                     EdIdEmpresa.Text       , EdIDSucursal.Text, {exclluye sector }'V',
                     Objeto.Apli            , bPreview               );

    RepLiMaxFinDet(  edF_Inicio.Text        , edCAP_BASICO.Text, edINDICE.Text, ieREG_MIN.Text,
                     {exclluye sector} 'V'  , EdIdEmpresa.Text , EdIDSucursal.Text,
                     Objeto.Apli            , bPreview         );

    RepLiMaxFinDet2( edF_Inicio.Text        , edCAP_BASICO.Text, edINDICE.Text, ieREG_MAX.Text,
                     {exclluye sector} 'F'  , EdIdEmpresa.Text , EdIDSucursal.Text,
                     Objeto.Apli            , bPreview         );

End;
procedure TwMQLiMaxFi.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte( False, grPrint );
end;

procedure TwMQLiMaxFi.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMQLiMaxFi.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMQLiMaxFi.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMQLiMaxFi.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMQLiMaxFi.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMQLiMaxFi.ieREG_MINExit(Sender: TObject);
begin
   if ( ieREG_MIN.Text = '' ) or (ieREG_MIN.Text = '') then Begin
      ShowMessage('Favor de introducir dato mayor a cero');
      ieREG_MIN.SetFocus;
   end;
end;

procedure TwMQLiMaxFi.ieREG_MAXExit(Sender: TObject);
begin
   if ( ieREG_MAX.Text = '' ) or (ieREG_MAX.Text = '') then Begin
      ShowMessage('Favor de introducir dato mayor a cero');
      ieREG_MAX.SetFocus;
   end;
end;

procedure TwMQLiMaxFi.edCAP_BASICOExit(Sender: TObject);
begin
   if ( edCAP_BASICO.Text = '' ) or (edCAP_BASICO.Text = '') then Begin
      ShowMessage('Favor de introducir dato mayor a cero');
      edCAP_BASICO.SetFocus;
   end;
end;

procedure TwMQLiMaxFi.edINDICEExit(Sender: TObject);
begin
   if ( edINDICE.Text = '' ) or ( edINDICE.Text = '') then Begin
      ShowMessage('Favor de introducir dato mayor a cero');
      edINDICE.SetFocus;
   end;
end;

end.

