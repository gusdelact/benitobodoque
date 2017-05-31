// Sistema         : Clase de TIPO_POSICION
// Fecha de Inicio : 30/03/1998
// Función forma   : Clase de TIPO_POSICION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Roberto Hugo Gochicoa Melendez
// Modificado por  : Marcos Zárate Castro 4 de mayo de 1998
//                   Se agregaron los campos B_PRESTADO, B_PRESTAMO Y
//                   B_OTRA_INSTIT.
//                   Oct/1998 Marcos Zárate Castro: Se agregan los intercampos
//                   CVE_TIPO_REFER y CVE_CATALOGO.
// Comentarios     :
Unit IntTPosicion;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntTipInvSiti;

Type
 TTPosicion= class;

  TWTPosicion=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TIP_POSIC : TLabel; 
    edCVE_TIP_POSIC : TEdit;
    chB_CUPON : TCheckBox; 
    chB_CUSTODIA : TCheckBox; 
    chB_GARANTIA : TCheckBox;
    chB_REFERENCIA : TCheckBox; 
    chB_REPORTO : TCheckBox;
    lbDESC_TIPO_POSIC : TLabel; 
    edDESC_TIPO_POSIC : TEdit;
    chB_Prestamo: TCheckBox;
    chB_Prestado: TCheckBox;
    chB_Otra_Instit: TCheckBox;
    Label1: TLabel;
    EDCVE_TIPO_REFER: TEdit;
    Label2: TLabel;
    edCve_Catalogo: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    sbTipInvSiti: TSpeedButton;
    edDescTipInvSiti: TEdit;
    cbPosicion: TCheckBox;
    edCveTipoPosic: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure chB_REFERENCIAClick(Sender: TObject);
    procedure chB_CUSTODIAClick(Sender: TObject);
    procedure sbTipInvSitiClick(Sender: TObject);
    private
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TTPosicion;
end;
 TTPosicion= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        CVE_TIP_POSIC            : TInterCampo;
        B_CUPON                  : TInterCampo;
        B_CUSTODIA               : TInterCampo;
        B_GARANTIA               : TInterCampo;
        B_OTRA_INSTIT            : TInterCampo;
        b_posicion               : TInterCampo;
        B_PRESTADO               : TInterCampo;
        B_PRESTAMO               : TInterCampo;
        B_REFERENCIA             : TInterCampo;
        B_REPORTO                : TInterCampo;
        b_valua_posicion         : TInterCampo;
        CVE_CATALOGO             : TInterCampo;
        CVE_TIP_INV_SITI         : TinterCampo;

        CVE_TIPO_REFER           : TInterCampo;
        DESC_TIPO_POSIC          : TInterCampo;
        desc_tipo_id_sec          : TInterCampo;

        TipInvSiti               : TTInvSiti;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TTPosicion.Create( AOwner : TComponent );
begin Inherited;
      CVE_TIP_POSIC :=CreaCampo('CVE_TIP_POSIC',ftString,tsNinguno,tsNinguno,True);
        CVE_TIP_POSIC .Size:=6;
        CVE_TIP_POSIC.Caption:='Clave de Tip Posic';
      B_CUPON :=CreaCampo('B_CUPON',ftString,tsNinguno,tsNinguno,True);
        B_CUPON .Size:=1;
        B_CUPON.Caption:='Cupon';
      B_CUSTODIA :=CreaCampo('B_CUSTODIA',ftString,tsNinguno,tsNinguno,True);
        B_CUSTODIA .Size:=1;
        B_CUSTODIA.Caption:='Custodia';
      B_GARANTIA :=CreaCampo('B_GARANTIA',ftString,tsNinguno,tsNinguno,True);
        B_GARANTIA .Size:=1;
        B_GARANTIA.Caption:='Garantia';
      B_REFERENCIA :=CreaCampo('B_REFERENCIA',ftString,tsNinguno,tsNinguno,True);
        B_REFERENCIA .Size:=1;
        B_REFERENCIA.Caption:='Referencia';
      B_REPORTO :=CreaCampo('B_REPORTO',ftString,tsNinguno,tsNinguno,True);
        B_REPORTO .Size:=1;
        B_REPORTO.Caption:='Reporto';
      B_PRESTADO:=CreaCampo('B_PRESTADO',ftString,tsNinguno,tsNinguno,True);
        B_PRESTADO .Size:=1;
        B_PRESTADO.Caption:='Prestado';
      B_PRESTAMO:=CreaCampo('B_PRESTAMO',ftString,tsNinguno,tsNinguno,True);
        B_PRESTAMO .Size:=1;
        B_PRESTAMO.Caption:='Préstamo';
      B_OTRA_INSTIT:=CreaCampo('B_OTRA_INSTIT',ftString,tsNinguno,tsNinguno,True);
        B_OTRA_INSTIT .Size:=1;
        B_OTRA_INSTIT.Caption:='Otra Institución';

      DESC_TIPO_POSIC :=CreaCampo('DESC_TIPO_POSIC',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_POSIC.Caption:='Descripción Tipo Posic';

      CVE_TIPO_REFER  :=CreaCampo('CVE_TIPO_REFER',ftString,tsNinguno,tsNinguno,True);
        CVE_TIPO_REFER .Size:=2;
        CVE_TIPO_REFER.Caption:='Tipo de Referencia';

      CVE_CATALOGO  :=CreaCampo('CVE_CATALOGO',ftInteger,tsNinguno,tsNinguno,True);
        CVE_CATALOGO.Caption:='Clave de Catálogo';

      CVE_TIP_INV_SITI:=CreaCampo('CVE_TIP_INV_SITI',ftString,tsNinguno,tsNinguno,True);
        CVE_TIP_INV_SITI.Size:=3;

      B_POSICION:=CreaCampo('B_POSICION',ftString,tsNinguno,tsNinguno,True);
        B_POSICION.Size:=1;

      B_VALUA_POSICION:=CreaCampo('B_VALUA_POSICION',ftString,tsNinguno,tsNinguno,True);
        B_VALUA_POSICION.Size:=1;

      DESC_TIPO_ID_SEC := CreaCampo('DESC_TIPO_ID_SEC',ftString,tsNinguno,tsNinguno,True);
        DESC_TIPO_ID_SEC.Size:=30;

      TipInvSiti := TTInvSiti.Create(Self);
      TipInvSiti.MasterSource                := Self;
      TipInvSiti.CVE_TIP_INV_SITI.MasterField := 'CVE_TIP_INV_SITI';

      FKeyFields.Add('CVE_TIP_POSIC');

      TableName := 'TIPO_POSICION';
      UseQuery := True;
      HelpFile := 'IntTPosicion.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TTPosicion.Destroy;
begin inherited;
end;


function TTPosicion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTPosicion;
begin
   W:=TWTPosicion.Create(Self);
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


Function TTPosicion.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IntTipoPos.it','S,S');
      Try if Active then begin T.Param(0,CVE_TIP_POSIC.AsString);
                               T.Param(1,DESC_TIPO_POSIC.AsString)
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA TIPO_POSICION********************)
(*                                                                              *)
(*  FORMA DE TIPO_POSICION                                                            *)
(*                                                                              *)
(***********************************************FORMA TIPO_POSICION********************)

procedure TWTPosicion.FormShow(Sender: TObject);
begin
      Objeto.CVE_TIP_POSIC.Control:=edCVE_TIP_POSIC;
      Objeto.B_CUPON.Control:=chB_CUPON;
      Objeto.B_CUSTODIA.Control:=chB_CUSTODIA;
      Objeto.B_GARANTIA.Control:=chB_GARANTIA;
      Objeto.B_REFERENCIA.Control:=chB_REFERENCIA;
      Objeto.B_REPORTO.Control:=chB_REPORTO;
      Objeto.B_PRESTADO.Control:=chB_Prestado;
      Objeto.B_PRESTAMO.Control:=chB_Prestamo;
      Objeto.B_OTRA_INSTIT.Control:=chB_Otra_Instit;
      Objeto.DESC_TIPO_POSIC.Control:=edDESC_TIPO_POSIC;
      Objeto.CVE_TIPO_REFER.Control:=EDCVE_TIPO_REFER;
      Objeto.CVE_CATALOGO.Control:=edCve_Catalogo;
      Objeto.b_posicion.Control := cbPosicion;
      Objeto.TipInvSiti.CVE_TIP_INV_SITI.Control := edCveTipoPosic;

      Objeto.TipInvSiti.DESC_TIP_INV_SITI.Control := edDescTipInvSiti;
end;

procedure TWTPosicion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIP_POSIC.Control:=nil;
      Objeto.B_CUPON.Control:=nil;
      Objeto.B_CUSTODIA.Control:=nil;
      Objeto.B_GARANTIA.Control:=nil;
      Objeto.B_REFERENCIA.Control:=nil;
      Objeto.B_REPORTO.Control:=nil;
      Objeto.B_PRESTADO.Control:=nil;
      Objeto.B_PRESTAMO.Control:=nil;
      Objeto.B_OTRA_INSTIT.Control:=nil;
      Objeto.DESC_TIPO_POSIC.Control:=nil;
      Objeto.CVE_TIPO_REFER.Control:=nil;
      Objeto.CVE_CATALOGO.Control:=nil;
      Objeto.TipInvSiti.DESC_TIP_INV_SITI.Control := nil;
      Objeto.b_posicion.Control := nil;
      Objeto.TipInvSiti.CVE_TIP_INV_SITI.Control := nil;
end;

procedure TWTPosicion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTPosicion.chB_REFERENCIAClick(Sender: TObject);
begin
{    if chB_CUSTODIA.Checked then
       chB_REFERENCIA.Checked:=False
    else
       chB_REFERENCIA.Checked:=True;
    {end-if}
end;

procedure TWTPosicion.chB_CUSTODIAClick(Sender: TObject);
begin
{    if chB_REFERENCIA.Checked then
       chB_CUSTODIA.Checked:=False
    else
       chB_CUSTODIA.Checked:=True;
    {end-if}

end;

procedure TWTPosicion.sbTipInvSitiClick(Sender: TObject);
begin
  Objeto.TipInvSiti.Busca;
end;

end.
