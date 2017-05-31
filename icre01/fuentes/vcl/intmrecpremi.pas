// Sistema         : Clase de MRecPremio
// Fecha de Inicio : 12/12/2003
// Función forma   : Clase de MRecPremio
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntMRecPremi;
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//
IntParamCre, IntLinkit,
IntGenCre,
Intempre,          //Empresa
IntUnNeg           //Unidad Negocio/Suc
;

Type
 TMRecPremi= class;

  TWMRecPremio=Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    InterDateTimePicker1: TInterDateTimePicker;
    edFECHA_DIA: TEdit;
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
    lbAplica: TLabel;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    private
    { Private declarations }
       //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
       //Procedure ImprimeReporte(bPreview:Boolean);
       //</LOLS>
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMRecPremi;
end;
 TMRecPremi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre        : TParamCre;
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
Uses IntQrRecPrem;

{$R *.DFM}


constructor TMRecPremi.Create( AOwner : TComponent ); 
begin Inherited; 

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMRecPremi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRecPremi.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMRecPremi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRecPremio;
begin
   W:=TWMRecPremio.Create(Self);
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


Function TMRecPremi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMrecpre.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMRecPremi.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MRecPremio********************)
(*                                                                              *)
(*  FORMA DE MRecPremio                                                            *)
(*                                                                              *)
(***********************************************FORMA MRecPremio********************)
procedure TWMRecPremio.AsignaEmpresaSuc;
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

procedure TWMRecPremio.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;
     
end;

procedure TWMRecPremio.FormDestroy(Sender: TObject);
begin
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   //Objeto
end;

procedure TWMRecPremio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMRecPremio.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMRecPremio.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMRecPremio.InterForma1BtnImprimirClick(Sender: TObject);
begin
    //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
    ImprimeReporte(False, grPrint );
    //ImprimeReporte(False);
    //</LOLS>
end;

procedure TWMRecPremio.InterForma1BtnPreviewClick(Sender: TObject);
begin
    //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
    ImprimeReporte(True, grPreview );
    //ImprimeReporte(True);
    //</LOLS>
end;

//<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
Procedure TWMRecPremio.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
//procedure TWMRecPremio.ImprimeReporte(bPreview: Boolean);
//</LOLS>
begin
    RepRecPremio( edFECHA_DIA.Text ,
                  EdIdEmpresa.Text ,
                  EdIDSucursal.Text,
                  Objeto.Apli      , bPreview
                  //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                  , grOpcion
                  //</LOLS>
                  );
end;

procedure TWMRecPremio.InterForma1DespuesShow(Sender: TObject);
Var vlFecha     : TDateTime;
begin
   vlFecha := Objeto.Apli.DameFechaEmpresa;
   edFECHA_DIA.Text :=  DateTimeToStr(vlFecha);
end;

procedure TWMRecPremio.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMRecPremio.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMRecPremio.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMRecPremio.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMRecPremio.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.
