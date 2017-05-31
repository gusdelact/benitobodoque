// Sistema         : Clase de CRE_CONT_SEGURO
// Fecha de Inicio : 11/07/2000
// Función forma   : Clase de CRE_CONT_SEGURO
// Desarrollo por  :
// Diseñado por    : Eleuterio Arellano Saldaña
// Comentarios     :
Unit IntCreConSeg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntCiaSeguro, Menus,UnCrPack,
  InterEdit;

Type
 TCreConSeg= class;

 TWCreContSeguro=Class(TForm)
    InterForma1             : TInterForma;
    PopupMenu1: TPopupMenu;
    Catlogo1: TMenuItem;
    Pcabecera: TPanel;
    lbFOLIO_GARANTIA: TLabel;
    lbFOLIO_SEGURO: TLabel;
    edFOLIO_GARANTIA: TEdit;
    edFOLIO_SEGURO: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    lbCVE_CIA_SEGURO: TLabel;
    edCVE_CIA_SEGURO: TEdit;
    sbAseguradora: TSpeedButton;
    edDesc_CIA_SEGURO: TEdit;
    PPie: TPanel;
    lbF_INICIO: TLabel;
    lbF_VENCIMIENTO: TLabel;
    lbIMP_SEGURO: TLabel;
    dtpF_INICIO: TInterDateTimePicker;
    edF_INICIO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    rgSIT_Seguro: TRadioGroup;
    rgTip_Cobertura: TRadioGroup;
    lbF_ALTA: TLabel;
    lbCVE_USUAR_ALTA: TLabel;
    lbF_CANCELA: TLabel;
    lbCVE_USUAR_CANC: TLabel;
    dtpF_ALTA: TInterDateTimePicker;
    edF_ALTA: TEdit;
    edCVE_USUAR_ALTA: TEdit;
    dtpF_CANCELA: TInterDateTimePicker;
    edF_CANCELA: TEdit;
    edCVE_USUAR_CANC: TEdit;
    btnCancela: TBitBtn;
    edImpSeguro: TInterEdit;
    Label1: TLabel;
    edNopoliza: TEdit;
    qActivosXGarant: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Nuevo(Sender: TObject; var Realizado: Boolean);
    procedure sbAseguradoraClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure InterForma1Modificar(Sender: TObject;
      var Realizado: Boolean);
    procedure btnCancelaClick(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    FAutorizacion : TInterFrame;
    Objeto : TCreConSeg;
end;
 TCreConSeg= class(TInterFrame)
    private
      FAutorizacion : TInterFrame;
    protected
      procedure SetAutorizacion(Aut : TInterFrame);
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        FOLIO_GARANTIA           : TInterCampo;
        FOLIO_SEGURO             : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        CVE_CIA_SEGURO           : TInterCampo;
        TIP_COBERTURA            : TInterCampo;
        IMP_SEGURO               : TInterCampo;
        SIT_SEGURO               : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USUAR_ALTA           : TInterCampo;
        F_CANCELA                : TInterCampo;
        CVE_USUAR_CANC           : TInterCampo;
        NO_POLIZA                : TInterCampo;
        CiaSeguros               : TCiaSeguro;
        Paquete                  : TCrPack;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
        property Autorizacion : TInterFrame read FAutorizacion write SetAutorizacion;
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCreConSeg.Create( AOwner : TComponent );
begin Inherited;
      FOLIO_GARANTIA :=CreaCampo('FOLIO_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_GARANTIA.Caption:='Folio de Garantia';
      FOLIO_SEGURO :=CreaCampo('FOLIO_SEGURO',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_SEGURO.Caption:='Folio del Seguro';
      F_INICIO :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,True);
                F_INICIO.Caption:='Fecha Inicio del Seguro';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha de Vencimiento';
      CVE_CIA_SEGURO :=CreaCampo('CVE_CIA_SEGURO',ftString,tsNinguno,tsNinguno,True);
                CVE_CIA_SEGURO.Caption:='Clave de Cia Seguro';

      TIP_COBERTURA :=CreaCampo('TIP_COBERTURA',ftString,tsNinguno,tsNinguno,True);
      with TIP_COBERTURA do
       begin
         Size:=2;
         UseCombo:=True;
         ComboLista.Add('0');    ComboDatos.Add('A');
         ComboLista.Add('1');    ComboDatos.Add('L');
         Caption:='Tipo de Cobertura';
       end;

      IMP_SEGURO :=CreaCampo('IMP_SEGURO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SEGURO.Caption:='Monto Asegurado';
      SIT_SEGURO :=CreaCampo('SIT_SEGURO',ftString,tsNinguno,tsNinguno,True);
      with SIT_SEGURO do
       begin
         Size:=2;
         UseCombo:=True;
         ComboLista.Add('0');     ComboDatos.Add('AC');
         ComboLista.Add('1');     ComboDatos.Add('VD');
         ComboLista.Add('2');     ComboDatos.Add('CA');
         Caption:='Situación del Seguro';
       end;

      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha de Alta';
      CVE_USUAR_ALTA :=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,True);
        CVE_USUAR_ALTA .Size:=8;
                CVE_USUAR_ALTA.Caption:='Clave de Usuario Alta';
      F_CANCELA :=CreaCampo('F_CANCELA',ftDate,tsNinguno,tsNinguno,True);
                F_CANCELA.Caption:='Fecha Cancelación';
      CVE_USUAR_CANC :=CreaCampo('CVE_USUAR_CANC',ftString,tsNinguno,tsNinguno,True);
      CVE_USUAR_CANC .Size:=8;
                CVE_USUAR_CANC.Caption:='Clave de Usuario Canc';

      NO_POLIZA :=CreaCampo('NO_POLIZA',ftFloat,tsNinguno,tsNinguno,True);
                NO_POLIZA.Caption:='Número de Póliza';

      FKeyFields.Add('FOLIO_GARANTIA');
      FKeyFields.Add('FOLIO_SEGURO');

      TableName := 'CRE_CONT_SEGURO';
      UseQuery := True;
      HelpFile := 'IntCreConSeg.Hlp';
      ShowMenuReporte:=True;

      Paquete := TCrPack.Create(Self);

      CiaSeguros:= TCiaSeguro.Create(Self);
      CiaSeguros.MasterSource:=Self;
      CiaSeguros.FieldByName('CVE_CIA_SEGURO').MasterField := 'CVE_CIA_SEGURO';


end;

Destructor TCreConSeg.Destroy;
begin
 if CiaSeguros <> nil then CiaSeguros.Free;
 if Paquete <> nil then Paquete.Free;
 inherited;
end;

procedure TCreConSeg.SetAutorizacion(Aut:TInterFrame);
begin
  FAutorizacion := Aut;
  if Aut = nil then
    Active := False
  else
    begin DrawControl;
    end;
end;


function TCreConSeg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCreContSeguro;
begin
   W:=TWCreContSeguro.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCreConSeg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCoSe.it','F,F');
      Try if Active then begin T.Param(0,FOLIO_GARANTIA.AsString);
                               T.Param(1,FOLIO_SEGURO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCreConSeg.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CRE_CONT_SEGURO********************)
(*                                                                              *)
(*  FORMA DE CRE_CONT_SEGURO                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_CONT_SEGURO********************)

procedure TWCreContSeguro.FormShow(Sender: TObject);
begin
      Objeto.FOLIO_GARANTIA.Control:=edFOLIO_GARANTIA;
      Objeto.FOLIO_SEGURO.Control:=edFOLIO_SEGURO;
      Objeto.F_INICIO.Control:=edF_INICIO;
      Objeto.F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
      Objeto.CVE_CIA_SEGURO.Control:=edCVE_CIA_SEGURO;
      Objeto.TIP_COBERTURA.Control:=rgTip_Cobertura;
      Objeto.IMP_SEGURO.Control:=edIMPSEGURO;
      Objeto.SIT_SEGURO.Control:=rgSIT_Seguro;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.NO_POLIZA.Control:=edNoPoliza;
      Objeto.CVE_USUAR_ALTA.Control:=edCVE_USUAR_ALTA;
      Objeto.F_CANCELA.Control:=edF_CANCELA;
      Objeto.CVE_USUAR_CANC.Control:=edCVE_USUAR_CANC;
      Objeto.CiaSeguros.DESC_CIA_SEGURO.Control := edDesc_CIA_SEGURO;
      Objeto.CiaSeguros.MasterSourceEditControl := sbAseguradora;
end;

procedure TWCreContSeguro.FormDestroy(Sender: TObject);
begin
      Objeto.FOLIO_GARANTIA.Control:=nil;
      Objeto.FOLIO_SEGURO.Control:=nil;
      Objeto.F_INICIO.Control:=nil;
      Objeto.F_VENCIMIENTO.Control:=nil;
      Objeto.CVE_CIA_SEGURO.Control:=nil;
      Objeto.TIP_COBERTURA.Control:=nil;
      Objeto.IMP_SEGURO.Control:=nil;
      Objeto.SIT_SEGURO.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USUAR_ALTA.Control:=nil;
      Objeto.F_CANCELA.Control:=nil;
      Objeto.CVE_USUAR_CANC.Control:=nil;
      Objeto.CiaSeguros.DESC_CIA_SEGURO.Control := nil;
      Objeto.CiaSeguros.MasterSourceEditControl := nil;
      Objeto.NO_POLIZA.Control:=nil;
   //Objeto
end;

procedure TWCreContSeguro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWCreContSeguro.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;

if Objeto.Autorizacion <> nil then
    begin
       edFOLIO_GARANTIA.Text := Objeto.Autorizacion.FieldByName('FOLIO_GARANTIA').AsSQL;
       edFOLIO_GARANTIA.Color:=clSilver;
       edFOLIO_SEGURO.Color:=clSilver;
       edF_ALTA.Color:=clSilver;
       edF_CANCELA.Color:=clSilver;
       edCVE_USUAR_ALTA.Color:=clSilver;
       edCVE_USUAR_CANC.Color:=clSilver;
       edDesc_CIA_SEGURO.ReadOnly:=True;
       edCVE_CIA_SEGURO.ReadOnly:=True;
       PCabecera.Enabled:=False;
       PPie.Enabled:=False;
       rgSIT_Seguro.Enabled:=False;


       qActivosXGarant.Active:=False;
       qActivosXGarant.DatabaseName:=Objeto.Autorizacion.DataBaseName;
       qActivosXGarant.SessionName:=Objeto.Autorizacion.SessionName;

       qActivosXGarant.SQL.Text:='Select count(Folio_garantia)AS Activos from cre_cont_seguro'+
                              ' where folio_garantia='+Objeto.Autorizacion.FieldByName('FOLIO_GARANTIA').AsSQL+
                              ' and sit_seguro=''AC''';
       qActivosXGarant.Active:=True;
       if qActivosXGarant.FieldByName('activos').AsInteger>0 then
       Begin
          showmessage('No puede tener más de un seguro activo para una garantía.'+#13+
                      'Si desea asignar un seguro nuevo, prímero cancele el anterior.' );
          InterForma1.Cancelar;
          exit;
       end;
    end;




  Objeto.Paquete.Apli := Objeto.Apli;
  Objeto.FOLIO_SEGURO.AsInteger := Objeto.Paquete.DameFolio(foSeguro);
  Objeto.IMP_SEGURO.AsFloat:=0.00;
  edCVE_CIA_SEGURO.SetFocus;


end;

procedure TWCreContSeguro.InterForma1DespuesModificar(Sender: TObject);
begin
    rgSIT_Seguro.Enabled:=False;
//<<Control>>.SetFocus;
end;

//procedure TWCreContSeguro.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCreContSeguro.InterForma1Nuevo(Sender: TObject;
  var Realizado: Boolean);
begin

   Realizado := False;
   Objeto.Append;
   Realizado := True;

    Objeto.SIT_SEGURO.AsString := 'AC';
    Objeto.TIP_COBERTURA.AsString := 'A';

    Objeto.CVE_USUAR_ALTA.AsString := Objeto.Apli.Usuario;
    Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;



end;

procedure TWCreContSeguro.sbAseguradoraClick(Sender: TObject);
begin
  OBJETO.CiaSeguros.Busca;
end;

procedure TWCreContSeguro.Catlogo1Click(Sender: TObject);
begin
  OBJETO.CiaSeguros.Catalogo;
end;

procedure TWCreContSeguro.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
    edImpSeguro.Tag:=-1;
    sbAseguradora.Tag:=-1;
    edNopoliza.Tag:=-1;
    edF_INICIO.Tag:=-1;
    edF_VENCIMIENTO.Tag:=-1;
    dtpF_INICIO.Tag:=-1;
    edF_VENCIMIENTO.Tag:=-1;
    dtpF_VENCIMIENTO.Tag:=-1;
    rgTip_Cobertura.Tag:=-1;
    Realizado := False;
    Objeto.Edit;
    Realizado := True;
    BtnCancela.Enabled:=True;

end;

procedure TWCreContSeguro.btnCancelaClick(Sender: TObject);
begin
   if Objeto.SIT_SEGURO.AsString <> 'AC' then
        ShowMessage('El seguro no puede ser cancelado, ya que está vencido o cancelado previamente')
   else
   begin
      if Application.MessageBox(
        '¿Desea cancelar la operación de éste seguro?',
        'Cancelar Seguro',
        MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
        Begin
           Objeto.SIT_SEGURO.AsString := 'CA';
           Objeto.CVE_USUAR_CANC.AsString := Objeto.Apli.Usuario;
           Objeto.F_CANCELA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
           rgSIT_Seguro.Enabled:=False;
        end;
   end;
end;

procedure TWCreContSeguro.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin
   //if strtodate(edF_INICIO.Text)>strtodate(edF_INICIO.Text) then
   edImpSeguro.Tag:=18;
   sbAseguradora.Tag:=18;
    edNopoliza.Tag:=18;
    edF_INICIO.Tag:=18;
    edF_VENCIMIENTO.Tag:=18;
    dtpF_INICIO.Tag:=18;
    edF_VENCIMIENTO.Tag:=18;
    dtpF_VENCIMIENTO.Tag:=18;
    rgTip_Cobertura.Tag:=18;

   Realizado := False;
   Objeto.Post;
   Realizado := True;
   btnCancela.Enabled := False;
end;

procedure TWCreContSeguro.InterForma1Cancelar(Sender: TObject;
  var Realizado: Boolean);
begin
   edImpSeguro.Tag:=18;
   sbAseguradora.Tag:=18;
   edNopoliza.Tag:=18;
    edF_INICIO.Tag:=18;
    edF_VENCIMIENTO.Tag:=18;
    dtpF_INICIO.Tag:=18;
    edF_VENCIMIENTO.Tag:=18;
    dtpF_VENCIMIENTO.Tag:=18;
    rgTip_Cobertura.Tag:=18;
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
   btnCancela.Enabled := False;
end;

end.

