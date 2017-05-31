// Sistema         : Clase de CRE_CONF_DRIVER
// Fecha de Inicio : 13/10/2006
// Función forma   : Clase de CRE_CONF_DRIVER
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alicia Beatriz Maya Ramirez
// Comentarios     :
Unit IntCreConDri;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCreConDri= class; 

  TWCreConfDriver=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CENT_COSTO : TLabel; 
    edID_CENT_COSTO : TEdit;
    lbTX_DISPONER : TLabel; 
    edTX_DISPONER : TEdit;
    lbTX_MONITOREAR : TLabel; 
    edTX_MONITOREAR : TEdit;
    lbTX_RECUPERAR : TLabel; 
    edTX_RECUPERAR : TEdit;
    lbCVE_USU_ALTA : TLabel; 
    edCVE_USU_ALTA : TEdit;
    lbFH_ALTA : TLabel; 
    edFH_ALTA : TEdit;
    lbCVE_USU_MOD : TLabel; 
    edCVE_USU_MOD : TEdit;
    lbFH_MODIFICA : TLabel; 
    edFH_MODIFICA : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    qDatos: TQuery;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCreConDri;
end; 
 TCreConDri= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_CENT_COSTO            : TInterCampo;
        TX_DISPONER              : TInterCampo;
        TX_MONITOREAR            : TInterCampo;
        TX_RECUPERAR             : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MOD              : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        ParamCre                 : TParamCre;
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


constructor TCreConDri.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CENT_COSTO :=CreaCampo('ID_CENT_COSTO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CENT_COSTO.Caption:='Centro Costo';
      TX_DISPONER :=CreaCampo('TX_DISPONER',ftString,tsNinguno,tsNinguno,True);
                TX_DISPONER.Caption:='Disponer';
      TX_MONITOREAR :=CreaCampo('TX_MONITOREAR',ftString,tsNinguno,tsNinguno,True);
                TX_MONITOREAR.Caption:='Monitorear';
      TX_RECUPERAR :=CreaCampo('TX_RECUPERAR',ftString,tsNinguno,tsNinguno,True);
                TX_RECUPERAR.Caption:='Recuperar';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      CVE_USU_MOD :=CreaCampo('CVE_USU_MOD',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MOD.Caption:='Clave de Usu Mod';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha y Hora Modifica';
      FKeyFields.Add('ID_CENT_COSTO');

      TableName := 'CR_CONF_DRIVER'; 
      UseQuery := True; 
      HelpFile := 'IntCreConDri.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCreConDri.Destroy;
begin inherited;
end;


function TCreConDri.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCreConfDriver;
begin
   W:=TWCreConfDriver.Create(Self);
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


Function TCreConDri.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCoDr.it','F');
      Try if Active then begin T.Param(0,ID_CENT_COSTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCreConDri.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRE_CONF_DRIVER********************)
(*                                                                              *)
(*  FORMA DE CRE_CONF_DRIVER                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_CONF_DRIVER********************)

procedure TWCreConfDriver.FormShow(Sender: TObject);
begin
      Objeto.ID_CENT_COSTO.Control:=edID_CENT_COSTO;
      Objeto.TX_DISPONER.Control:=edTX_DISPONER;
      Objeto.TX_MONITOREAR.Control:=edTX_MONITOREAR;
      Objeto.TX_RECUPERAR.Control:=edTX_RECUPERAR;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_MOD.Control:=edCVE_USU_MOD;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
   qDatos.DataBaseName:= Objeto.Apli.DataBaseName;
   qDatos.SessionName := Objeto.Apli.SessionName;
end;

procedure TWCreConfDriver.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CENT_COSTO.Control:=nil;
      Objeto.TX_DISPONER.Control:=nil;
      Objeto.TX_MONITOREAR.Control:=nil;
      Objeto.TX_RECUPERAR.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_MOD.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWCreConfDriver.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCreConfDriver.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCreConfDriver.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCreConfDriver.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCreConfDriver.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if (Trim(edTX_DISPONER.Text)='') and (Trim(edTX_MONITOREAR.Text)='') and (Trim(edTX_RECUPERAR.Text)='') then
  begin
     ShowMessage('Debe incluir al menos una leyenda. Verifique.');
      Realizado:=False;
  end
  else
  begin
    qDatos.Close;
    qDatos.SQL.Text:='Select * from centro_costo where ID_CENT_COSTO = '+edID_CENT_COSTO.Text;
    qDatos.Open;
    if qDatos.RecordCount> 0 then
    begin
      if IsNewData then
      begin
         edCVE_USU_ALTA.Text:=Objeto.Apli.Usuario;
         edFH_ALTA.Text :=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',Objeto.Apli.SysDateTime);
      end
      else
      begin
         edCVE_USU_MOD.Text:=Objeto.Apli.Usuario;
         edFH_MODIFICA.Text :=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',Objeto.Apli.SysDateTime);
      end;
      Realizado:=True;
    end else
    begin
      ShowMessage('Verifique el Centro de Costos. Gracias.');
      Realizado:=False;
    end;
  end;
end;

end.
