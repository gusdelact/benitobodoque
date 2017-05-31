// Sistema         : Clase de PARAM_TASA_OPER
// Fecha de Inicio : 06/06/2006
// Función forma   : Clase de PARAM_TASA_OPER
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Laura Gabriela Quevedo Torres
// Comentarios     :
Unit IntParTasOp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, INTMON;

Type
 TParTasOp= class;

  TWParamTasaOp=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TASA_INDICAD : TLabel; 
    edCVE_TASA_INDICAD : TEdit;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    lbFH_ULT_POSTURA : TLabel; 
    dtpFH_ULT_POSTURA : TInterDateTimePicker; 
    edFH_ULT_POSTURA : TEdit;
    lbTIPO_TASA_OP : TLabel;
    SpeedButton1: TSpeedButton;
    edDESC_MONEDA: TEdit;
    GroupBox1: TGroupBox;
    lbTIPO_CALC_AGREGA: TLabel;
    cbTIPO_CALC_AGREGA: TComboBox;
    lbTIPO_CALC_POSTU: TLabel;
    cbTIPO_CALC_POSTU: TComboBox;
    GroupBox2: TGroupBox;
    chB_TASA_PASIVA: TCheckBox;
    chB_AGREGA_POST: TCheckBox;
    chB_TRASPASA_SD: TCheckBox;
    cbTIPO_TASA_OP: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure chB_AGREGA_POSTClick(Sender: TObject);
    procedure cbTIPO_CALC_AGREGAChange(Sender: TObject);
    private
    { Private declarations }
    public
     vgtasaindic: string;
    { Public declarations }
    Objeto : TParTasOp;
end;
 TParTasOp= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TASA_INDICAD         : TInterCampo;
        B_AGREGA_POST            : TInterCampo;
        B_TASA_PASIVA            : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        FH_ULT_POSTURA           : TInterCampo;
        TIPO_CALC_AGREGA         : TInterCampo;
        TIPO_CALC_POSTU          : TInterCampo;
        B_TRASPASA_SD            : TInterCampo;
        TIPO_TASA_OP             : TInterCampo;
        B_INSERTADO              : TInterCampo;

        Moneda                   : TMoneda;

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


constructor TParTasOp.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TASA_INDICAD :=CreaCampo('CVE_TASA_INDICAD',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_INDICAD.Caption:='Clave de Tasa Indicad';
      B_AGREGA_POST :=CreaCampo('B_AGREGA_POST',ftString,tsNinguno,tsNinguno,True);
                B_AGREGA_POST.Caption:='Agrega Post';
      B_TASA_PASIVA :=CreaCampo('B_TASA_PASIVA',ftString,tsNinguno,tsNinguno,True);
                B_TASA_PASIVA.Caption:='Tasa Pasiva';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      FH_ULT_POSTURA :=CreaCampo('FH_ULT_POSTURA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ULT_POSTURA.Caption:='Fecha y Hora Última Postura';
      TIPO_CALC_AGREGA :=CreaCampo('TIPO_CALC_AGREGA',ftString,tsNinguno,tsNinguno,True);
                TIPO_CALC_AGREGA.Caption:='Tipo Calc Agrega';
      With TIPO_CALC_AGREGA do
      begin
        UseCombo:=true;
        ComboDatos.Add('TA'); ComboLista.Add('TIPO ALAMBRADA');
        ComboDatos.Add('SP'); ComboLista.Add('SPREAD');
        ComboDatos.Add('CO'); ComboLista.Add('CONSTANTES');
      end;
      TIPO_CALC_POSTU :=CreaCampo('TIPO_CALC_POSTU',ftString,tsNinguno,tsNinguno,True);
                TIPO_CALC_POSTU.Caption:='Tipo Calc Postu';
      With TIPO_CALC_POSTU do
      begin
        UseCombo:=true;
        ComboDatos.Add('TA'); ComboLista.Add('TIPO ALAMBRADA');
        ComboDatos.Add('SP'); ComboLista.Add('SPREAD');
        ComboDatos.Add('CO'); ComboLista.Add('CONSTANTES');
      end;

      B_TRASPASA_SD :=CreaCampo('B_TRASPASA_SD',ftString,tsNinguno,tsNinguno,True);
                B_TRASPASA_SD.Caption:='Traspasa Sd';
      TIPO_TASA_OP :=CreaCampo('TIPO_TASA_OP',ftString,tsNinguno,tsNinguno,True);
                TIPO_TASA_OP.Caption:='Tipo Tasa Op';

      With TIPO_TASA_OP do
      begin
        UseCombo:=true;
        ComboDatos.Add('NETA'); ComboLista.Add('TASA NETA');
        ComboDatos.Add('REAL'); ComboLista.Add('TASA REAL');
        ComboDatos.Add('BRTA'); ComboLista.Add('TASA BRUTA');
      END;

      B_INSERTADO :=CreaCampo('B_INSERTADO',ftString,tsNinguno,tsNinguno,false);


      Moneda:= TMoneda.Create(self);
      Moneda.MasterSource:= Self;
      Moneda.Cve_Moneda.MasterField:='CVE_MONEDA';

      FKeyFields.Add('CVE_TASA_INDICAD');

      TableName := 'PARAM_TASA_OPER'; 
      UseQuery := True; 
      HelpFile := 'IntParTasOp.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TParTasOp.Destroy;
begin inherited;
end;


function TParTasOp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWParamTasaOp;
begin
   W:=TWParamTasaOp.Create(Self);
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


Function TParTasOp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IPaTaOp.it','S');
      Try if Active then begin T.Param(0,CVE_TASA_INDICAD.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TParTasOp.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA PARAM_TASA_OPER********************)
(*                                                                              *)
(*  FORMA DE PARAM_TASA_OPER                                                            *)
(*                                                                              *)
(***********************************************FORMA PARAM_TASA_OPER********************)

procedure TWParamTasaOp.FormShow(Sender: TObject);
begin
      vgtasaindic:='';
      if objeto.CVE_TASA_INDICAD.AsString<>'' then
         vgtasaindic:=objeto.CVE_TASA_INDICAD.asstring;
      Objeto.CVE_TASA_INDICAD.Control:=edCVE_TASA_INDICAD;
      Objeto.B_AGREGA_POST.Control:=chB_AGREGA_POST;
      Objeto.B_TASA_PASIVA.Control:=chB_TASA_PASIVA;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.FH_ULT_POSTURA.Control:=edFH_ULT_POSTURA;
      Objeto.TIPO_CALC_AGREGA.Control:=cbTIPO_CALC_AGREGA;
      Objeto.TIPO_CALC_POSTU.Control:=cbTIPO_CALC_POSTU;
      Objeto.B_TRASPASA_SD.Control:=chB_TRASPASA_SD;
      Objeto.TIPO_TASA_OP.Control:=cbTIPO_TASA_OP;
      Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
end;

procedure TWParamTasaOp.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TASA_INDICAD.Control:=nil;
      Objeto.B_AGREGA_POST.Control:=nil;
      Objeto.B_TASA_PASIVA.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.FH_ULT_POSTURA.Control:=nil;
      Objeto.TIPO_CALC_AGREGA.Control:=nil;
      Objeto.TIPO_CALC_POSTU.Control:=nil;
      Objeto.B_TRASPASA_SD.Control:=nil;
      Objeto.TIPO_TASA_OP.Control:=nil;
      Objeto.Moneda.Cve_Moneda.Control:=nil;
      Objeto.Moneda.Desc_Moneda.Control:=nil;
   //Objeto
end;

procedure TWParamTasaOp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWParamTasaOp.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
  if vgtasaindic<> '' then
     Objeto.CVE_TASA_INDICAD.AsString:=vgtasaindic;
  Objeto.B_INSERTADO.ASSTRING:='F';
  Objeto.FH_ULT_POSTURA.AsDateTime:= NOW;
end;

procedure TWParamTasaOp.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWParamTasaOp.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWParamTasaOp.SpeedButton1Click(Sender: TObject);
begin
 Objeto.Moneda.Busca;
end;

procedure TWParamTasaOp.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.B_INSERTADO.ASSTRING:='V';
end;

procedure TWParamTasaOp.chB_AGREGA_POSTClick(Sender: TObject);
begin
  IF Objeto.Modo= moAppend then
  begin
  IF chB_AGREGA_POST.Checked then
  begin
    Objeto.TIPO_CALC_AGREGA.AsString:='';
    cbTIPO_CALC_AGREGA.Tag:=0;
    cbTIPO_CALC_AGREGA.Enabled:=false;
    cbTIPO_CALC_AGREGA.TabStop:=false;
  end
  else
  begin
    cbTIPO_CALC_AGREGA.Tag:=18;
    cbTIPO_CALC_AGREGA.Enabled:=true;
    cbTIPO_CALC_AGREGA.TabStop:=true;
  end;
 end;
end;

procedure TWParamTasaOp.cbTIPO_CALC_AGREGAChange(Sender: TObject);
begin
  IF (Objeto.TIPO_CALC_AGREGA.AsString='CO') then
  begin
    chB_AGREGA_POST.Checked:=true;
    chB_AGREGA_POST.Enabled:=FALSE;
  end
  else
  begin
    chB_AGREGA_POST.Checked:=false;
    chB_AGREGA_POST.Enabled:=TRUE;
  end;
  Objeto.GetFromControl;
end;

end.
