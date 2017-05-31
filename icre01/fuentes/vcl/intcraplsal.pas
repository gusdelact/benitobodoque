// Sistema         : Clase de CR_APLIC_SALDO
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_APLIC_SALDO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrAplSal;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre;

Type
 TCrAplSal= class; 

  TWCrAplicSaldo=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_APLIC_SALDO : TLabel; 
    edCVE_APLIC_SALDO : TEdit;
    lbDESC_L_APLIC_SDO : TLabel; 
    edDESC_L_APLIC_SDO : TEdit;
    lbCVE_TIPO_METODO : TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    cbCVE_TIPO_METODO: TComboBox;
    gbSITUACION_PERIODO: TGroupBox;
    chB_ACTIVO: TCheckBox;
    chB_POR_ACTIVAR: TCheckBox;
    chB_LIQUIDADO: TCheckBox;
    chB_CANCELADO: TCheckBox;
    gbORDEN: TGroupBox;
    chB_ASCENDENTE: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_APLIC_SALDOExit(Sender: TObject);
    procedure edDESC_L_APLIC_SDOExit(Sender: TObject);
    procedure chB_ASCENDENTEExit(Sender: TObject);
    procedure cbCVE_TIPO_METODOExit(Sender: TObject);
    procedure chB_ACTIVOExit(Sender: TObject);
    procedure chB_POR_ACTIVARExit(Sender: TObject);
    procedure chB_LIQUIDADOExit(Sender: TObject);
    procedure chB_CANCELADOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TCrAplSal;
end; 
 TCrAplSal= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_APLIC_SALDO          : TInterCampo;
        DESC_L_APLIC_SDO         : TInterCampo;
        CVE_TIPO_METODO          : TInterCampo;
        B_ASCENDENTE             : TInterCampo;
        B_ACTIVO                 : TInterCampo;
        B_POR_ACTIVAR            : TInterCampo;
        B_LIQUIDADO              : TInterCampo;
        B_CANCELADO              : TInterCampo;

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


constructor TCrAplSal.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_APLIC_SALDO :=CreaCampo('CVE_APLIC_SALDO',ftString,tsNinguno,tsNinguno,True);
                CVE_APLIC_SALDO.Caption:='Clave Aplica Saldo';
      DESC_L_APLIC_SDO :=CreaCampo('DESC_L_APLIC_SDO',ftString,tsNinguno,tsNinguno,True);
                DESC_L_APLIC_SDO.Caption:='Descripción';
      CVE_TIPO_METODO :=CreaCampo('CVE_TIPO_METODO',ftString,tsNinguno,tsNinguno,True);
          With CVE_TIPO_METODO do
          Begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('PERIODO UNICO');   ComboDatos.Add('PN');
                ComboLista.Add('PRORRATEO');       ComboDatos.Add('PR');
                ComboLista.Add('PAGO AL PERIODO'); ComboDatos.Add('PP');
          end;
                CVE_TIPO_METODO.Caption:='Clave Tipo Método';
      B_ASCENDENTE :=CreaCampo('B_ASCENDENTE',ftString,tsNinguno,tsNinguno,True);
                B_ASCENDENTE.Caption:='Ascendente';
      B_ACTIVO :=CreaCampo('B_ACTIVO',ftString,tsNinguno,tsNinguno,True);
                B_ACTIVO.Caption:='Activo';
      B_POR_ACTIVAR :=CreaCampo('B_POR_ACTIVAR',ftString,tsNinguno,tsNinguno,True);
                B_POR_ACTIVAR.Caption:='Por Activar';
      B_LIQUIDADO :=CreaCampo('B_LIQUIDADO',ftString,tsNinguno,tsNinguno,True);
                B_LIQUIDADO.Caption:='Liquidado';
      B_CANCELADO :=CreaCampo('B_CANCELADO',ftString,tsNinguno,tsNinguno,True);
                B_CANCELADO.Caption:='Cancelado';
      FKeyFields.Add('CVE_APLIC_SALDO');

      TableName := 'CR_APLIC_SALDO'; 
      UseQuery := True; 
      HelpFile := 'IntCrAplSal.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAplSal.Destroy;
begin inherited;
end;


function TCrAplSal.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAplicSaldo;
begin
   W:=TWCrAplicSaldo.Create(Self);
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


Function TCrAplSal.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrApSa.it','S');
      Try if Active then begin T.Param(0,CVE_APLIC_SALDO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_APLIC_SALDO********************)
(*                                                                              *)
(*  FORMA DE CR_APLIC_SALDO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_APLIC_SALDO********************)

procedure TWCrAplicSaldo.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_APLIC_SALDO.Control:=edCVE_APLIC_SALDO;
      Objeto.DESC_L_APLIC_SDO.Control:=edDESC_L_APLIC_SDO;
      Objeto.CVE_TIPO_METODO.Control:=cbCVE_TIPO_METODO;
      Objeto.B_ASCENDENTE.Control:=chB_ASCENDENTE;
      Objeto.B_ACTIVO.Control:=chB_ACTIVO;
      Objeto.B_POR_ACTIVAR.Control:=chB_POR_ACTIVAR;
      Objeto.B_LIQUIDADO.Control:=chB_LIQUIDADO;
      Objeto.B_CANCELADO.Control:=chB_CANCELADO;
end;

procedure TWCrAplicSaldo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_APLIC_SALDO.Control:=nil;
      Objeto.DESC_L_APLIC_SDO.Control:=nil;
      Objeto.CVE_TIPO_METODO.Control:=nil;
      Objeto.B_ASCENDENTE.Control:=nil;
      Objeto.B_ACTIVO.Control:=nil;
      Objeto.B_POR_ACTIVAR.Control:=nil;
      Objeto.B_LIQUIDADO.Control:=nil;
      Objeto.B_CANCELADO.Control:=nil;
   //Objeto
end;

procedure TWCrAplicSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAplicSaldo.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_APLIC_SALDO.SetFocus;
end;

procedure TWCrAplicSaldo.InterForma1DespuesModificar(Sender: TObject);
begin
   MuestraHints;
   edDESC_L_APLIC_SDO.SetFocus;
end;

procedure TWCrAplicSaldo.edCVE_APLIC_SALDOExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_APLIC_SALDO.GetFromControl;
      if Objeto.CVE_APLIC_SALDO.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_APLIC_SALDO,VLSalida,'',True);
   end;
end;

procedure TWCrAplicSaldo.edDESC_L_APLIC_SDOExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.DESC_L_APLIC_SDO.GetFromControl;
      if Objeto.DESC_L_APLIC_SDO.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edDESC_L_APLIC_SDO,VLSalida,'',True);
   end;
end;

procedure TWCrAplicSaldo.chB_ASCENDENTEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ASCENDENTE,True,'',True);
end;

procedure TWCrAplicSaldo.cbCVE_TIPO_METODOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbCVE_TIPO_METODO,True,'',True);
end;

procedure TWCrAplicSaldo.chB_ACTIVOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ACTIVO,True,'',True);
end;

procedure TWCrAplicSaldo.chB_POR_ACTIVARExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_POR_ACTIVAR,True,'',True);
end;

procedure TWCrAplicSaldo.chB_LIQUIDADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_LIQUIDADO,True,'',True);
end;

procedure TWCrAplicSaldo.chB_CANCELADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CANCELADO,True,'',True);
end;

Procedure TWCrAplicSaldo.MuestraHints;
Begin
      edDESC_L_APLIC_SDO.Hint := Objeto.DESC_L_APLIC_SDO.AsString;
      edDESC_L_APLIC_SDO.ShowHint := True;
End;

procedure TWCrAplicSaldo.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrAplicSaldo.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrAplicSaldo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

end.
