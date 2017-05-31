// Sistema         : Clase de M_QR_COM_CTA
// Fecha de Inicio : 07/05/2007
// Función forma   : Clase de M_QR_COM_CTA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Arturo Salcedo Caballero
// Comentarios     :
Unit IntMQrComCta;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,  IntLinkit,IntParamCre;

Type
 TMQrComCta= class;

  TWMQrComCta=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    edF_Inicio: TEdit;
    Label4: TLabel;
    edF_Final: TEdit;
    Label5: TLabel;
    dtF_Inicio: TInterDateTimePicker;
    dtF_Final: TInterDateTimePicker;
    sbBorra: TSpeedButton;
    sbAgrega: TSpeedButton;
    lbCVE_CTA_CONTABLE: TLabel;
    sbCtaContable: TSpeedButton;
    edCVE_CTA_CONTABLE: TEdit;
    edCtaContable: TEdit;
    ilCtaContable: TInterLinkit;
    lbCuentas: TListBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbCtaContableClick(Sender: TObject);
    procedure ilCtaContableEjecuta(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbAgregaClick(Sender: TObject);
    procedure sbBorraClick(Sender: TObject);
    procedure lbCuentasClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    private
    { Private declarations }
    Procedure ImprimirReporte(bPreview:Boolean);
    public
    { Public declarations } 
    Objeto : TMQrComCta;
    Counter:integer;
end; 
 TMQrComCta= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published 
      end;



implementation
uses IntQrComCta;
//Uses RepMon;

{$R *.DFM}


constructor TMQrComCta.Create( AOwner : TComponent );
begin Inherited; 

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMQrComCta.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMQrComCta.Destroy;
begin inherited;
end;


function TMQrComCta.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMQrComCta;
begin
   W:=TWMQrComCta.Create(Self);
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


Function TMQrComCta.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMQrCoCt.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMQrComCta.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA M_QR_COM_CTA********************)
(*                                                                              *)
(*  FORMA DE M_QR_COM_CTA                                                            *)
(*                                                                              *)
(***********************************************FORMA M_QR_COM_CTA********************)

procedure TWMQrComCta.FormDestroy(Sender: TObject);
begin

   //Objeto
end;

procedure TWMQrComCta.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMQrComCta.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMQrComCta.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMQrComCta.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMQrComCta.sbCtaContableClick(Sender: TObject);
Var T:TInterFindit;
begin
      T := Objeto.CreaBuscador('IntCGCta2.it','F,F,F,S');
      Try if Active then begin// T.Param(0,IntToStr(Objeto.Apli.IdEmpresa));
                               T.Param(1,FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa));
                             //  T.Param(2,edCVE_MONEDA.Text);
                               T.Param(3,edCVE_CTA_CONTABLE.text);
                               end;
          if T.Execute then
          begin
            edCVE_CTA_CONTABLE.text  := T.DameCampo(3);
            edCtaContable.Text       := T.DameCampo(4);
          end
      finally  T.Free;
      end;
end;

procedure TWMQrComCta.ilCtaContableEjecuta(Sender: TObject);
VAR vlcuenta: string;
begin
IF Length( edCVE_CTA_CONTABLE.Text) <> 0 THEN
 BEGIN
  GetSQLStr('SELECT DESC_CUENTAC FROM CG_CUENTA@CONT WHERE ID_EMPRESA ='+IntToStr( Objeto.Apli.IdEmpresa)+
            ' AND CVE_EJER_CONT = '+FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa)+
//            ' AND CVE_MONEDA = '+edCVE_MONEDA.Text+
            ' AND CVE_CTA_CONTABLE = '''+edCVE_CTA_CONTABLE.Text +'''',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,
            'DESC_CUENTAC', vlcuenta,FALSE);
  IF  Length(vlcuenta) <>0 THEN
      edCtaContable.Text:= vlcuenta;

 END;
end;

procedure TWMQrComCta.FormShow(Sender: TObject);
var vlfechafin:string;
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;


    dtF_Inicio.DateTime:=IncMonth(Objeto.Apli.DameFechaEmpresa,-1);
    dtF_Final.DateTime:=IncMonth(Objeto.Apli.DameFechaEmpresa,-1);

    edF_Inicio.Text:='01/'+FormatDateTime('MM/YYYY',dtF_Inicio.DateTime);

    IF  GetSQLStr('SELECT LAST_DAY(TO_DATE('''+DateToStr(dtF_Inicio.DateTime)+''',''DD/MM/YYYY'')) AS F_FINAL FROM DUAL ',
               Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'F_FINAL', vlfechafin,FALSE) THEN
        edF_Final.Text:=vlfechafin;

    lbCuentas.Items.Clear;
end;

procedure TWMQrComCta.sbAgregaClick(Sender: TObject);
begin
  lbCuentas.Items.Add(edCVE_CTA_CONTABLE.Text);
  edCVE_CTA_CONTABLE.clear;
  edCtaContable.clear;

end;

procedure TWMQrComCta.sbBorraClick(Sender: TObject);
begin
  lbCuentas.Items.Delete(Counter);
  lbCuentas.Sorted:= not lbCuentas.Sorted;
  edCVE_CTA_CONTABLE.clear;
  edCtaContable.clear;
end;

procedure TWMQrComCta.lbCuentasClick(Sender: TObject);
VAR vlcuenta: string;
begin
  Counter:=lbCuentas.ItemIndex;
  IF Length(lbCuentas.Items.Strings[Counter]) <> 0 THEN
   BEGIN
    GetSQLStr('SELECT DESC_CUENTAC FROM CG_CUENTA@CONT WHERE ID_EMPRESA ='+IntToStr( Objeto.Apli.IdEmpresa)+
              ' AND CVE_EJER_CONT = '+FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa)+
  //            ' AND CVE_MONEDA = '+edCVE_MONEDA.Text+
              ' AND CVE_CTA_CONTABLE = '''+lbCuentas.Items.Strings[Counter] +'''',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,
              'DESC_CUENTAC', vlcuenta,FALSE);
    IF  Length(vlcuenta) <>0 THEN
        edCVE_CTA_CONTABLE.Text := lbCuentas.Items.Strings[Counter];
        edCtaContable.TEXT      :=vlcuenta;
   END;

end;

procedure TWMQrComCta.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMQRCOMCTA_PREVI',True,True) then
      ImprimirReporte(True);
end;

procedure TWMQrComCta.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMQRCOMCTA_IMPRI',True,True) then
      ImprimirReporte(False);
end;


Procedure TWMQrComCta.ImprimirReporte(bPreview:Boolean);
Var vlCtas : string;
    i      : integer;
begin
    For i:=0 to (lbCuentas.Items.Count-1) do
    begin
       vlCtas:=vlctas+''''+lbCuentas.Items.Strings[i]+''',';
    end;
    vlCtas:=vlctas+''''+lbCuentas.Items.Strings[i-1]+'''';

    RepComisContables(edF_Inicio.text,edF_Final.text,vlCtas,Objeto.Apli,bPreview);

end;

end.
