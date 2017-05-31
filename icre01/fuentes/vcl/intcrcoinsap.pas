// Sistema         : Clase de CR_COINCRE_SAP
// Fecha de Inicio : 30/08/2010
// Función forma   : Clase de CR_COINCRE_SAP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrCoinSap;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,   

IntParamCre,
IntCrProduct,     //Producto de crédito
IntGenCre         //General de crédito
;

Type
 TCrCoinSap= class; 

  TWCrCoincreSap=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_OLTP_PRODUCTO : TLabel; 
    edID_OLTP_PRODUCTO : TEdit;
    lbID_REPORTE : TLabel;
    edID_REPORTE : TEdit;
    lbID_METRICA : TLabel; 
    edID_METRICA : TEdit;
    lbCVE_CUENTA : TLabel; 
    edCVE_CUENTA : TEdit;
    lbCVE_SUBCUENTA : TLabel; 
    edCVE_SUBCUENTA : TEdit;
    lbCVE_AUXILIAR : TLabel; 
    edCVE_AUXILIAR : TEdit;
    lbCVE_SECTOR_SAP : TLabel; 
    edCVE_SECTOR_SAP : TEdit;
    lbCVE_MONEDA : TLabel; 
    edCVE_MONEDA : TEdit;
    lbCVE_SECTOR : TLabel; 
    edCVE_SECTOR : TEdit;
    lbCVE_RELACION : TLabel; 
    edCVE_RELACION : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    ilPRODUCTO: TInterLinkit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCoinSap;

end;
 TCrCoinSap= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_OLTP_PRODUCTO         : TInterCampo;
        ID_REPORTE               : TInterCampo;
        ID_METRICA               : TInterCampo;
        CVE_CUENTA               : TInterCampo;
        CVE_SUBCUENTA            : TInterCampo;
        CVE_AUXILIAR             : TInterCampo;
        CVE_SECTOR_SAP           : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_SECTOR               : TInterCampo;
        CVE_RELACION             : TInterCampo;

        VLID_REPORTE               : String;
        VLID_METRICA               : String;
        VLCVE_CUENTA               : String;
        VLCVE_SUBCUENTA            : String;
        VLCVE_AUXILIAR             : String;
        VLCVE_SECTOR_SAP           : String;
        VLCVE_MONEDA               : String;
        VLCVE_SECTOR               : String;
        VLCVE_RELACION             : String;
        VLBReplica                 : Boolean;

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;

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


constructor TCrCoinSap.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_OLTP_PRODUCTO :=CreaCampo('ID_OLTP_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                ID_OLTP_PRODUCTO.Caption:='Número de Oltp Producto';
      ID_REPORTE :=CreaCampo('ID_REPORTE',ftFloat,tsNinguno,tsNinguno,True);
                ID_REPORTE.Caption:='Número de Reporte';
      ID_METRICA :=CreaCampo('ID_METRICA',ftFloat,tsNinguno,tsNinguno,True);
                ID_METRICA.Caption:='Número de Metrica';
      CVE_CUENTA :=CreaCampo('CVE_CUENTA',ftString,tsNinguno,tsNinguno,True);
                CVE_CUENTA.Caption:='Clave de Cuenta';
      CVE_SUBCUENTA :=CreaCampo('CVE_SUBCUENTA',ftString,tsNinguno,tsNinguno,True);
                CVE_SUBCUENTA.Caption:='Clave de Subcuenta';
      CVE_AUXILIAR :=CreaCampo('CVE_AUXILIAR',ftString,tsNinguno,tsNinguno,True);
                CVE_AUXILIAR.Caption:='Clave de Auxiliar';
      CVE_SECTOR_SAP :=CreaCampo('CVE_SECTOR_SAP',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_SAP.Caption:='Clave de Sector Sap';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      CVE_SECTOR :=CreaCampo('CVE_SECTOR',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR.Caption:='Clave de Sector';
      CVE_RELACION :=CreaCampo('CVE_RELACION',ftString,tsNinguno,tsNinguno,True);
                CVE_RELACION.Caption:='Clave de Relacion';
      FKeyFields.Add('ID_OLTP_PRODUCTO');
      FKeyFields.Add('ID_REPORTE');
      FKeyFields.Add('ID_METRICA');
      FKeyFields.Add('CVE_CUENTA');
      FKeyFields.Add('CVE_SUBCUENTA');
      FKeyFields.Add('CVE_AUXILIAR');
      FKeyFields.Add('CVE_SECTOR_SAP');
      FKeyFields.Add('CVE_MONEDA');
      FKeyFields.Add('CVE_SECTOR');

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='ID_OLTP_PRODUCTO';

      TableName := 'CR_COINCRE_SAP';
      UseQuery := True; 
      HelpFile := 'IntCrCoinSap.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoinSap.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   inherited;
end;


function TCrCoinSap.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoincreSap;
begin
   W:=TWCrCoincreSap.Create(Self);
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


Function TCrCoinSap.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCoSa.it','S,F,F,S,S,S,S,F,S');
      Try if Active then begin T.Param(0,ID_OLTP_PRODUCTO.AsString); 
                               T.Param(1,ID_REPORTE.AsString); 
                               T.Param(2,ID_METRICA.AsString); 
                               T.Param(3,CVE_CUENTA.AsString); 
                               T.Param(4,CVE_SUBCUENTA.AsString); 
                               T.Param(5,CVE_AUXILIAR.AsString); 
                               T.Param(6,CVE_SECTOR_SAP.AsString); 
                               T.Param(7,CVE_MONEDA.AsString); 
                               T.Param(8,CVE_SECTOR.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3),T.DameCampo(4),T.DameCampo(5),T.DameCampo(6),T.DameCampo(7),T.DameCampo(8)]);
      finally  T.Free;
      end; 
end;

function TCrCoinSap.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_COINCRE_SAP********************)
(*                                                                              *)
(*  FORMA DE CR_COINCRE_SAP                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COINCRE_SAP********************)

procedure TWCrCoincreSap.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_OLTP_PRODUCTO.Control:=edID_OLTP_PRODUCTO;
      Objeto.ID_REPORTE.Control:=edID_REPORTE;
      Objeto.ID_METRICA.Control:=edID_METRICA;
      Objeto.CVE_CUENTA.Control:=edCVE_CUENTA;
      Objeto.CVE_SUBCUENTA.Control:=edCVE_SUBCUENTA;
      Objeto.CVE_AUXILIAR.Control:=edCVE_AUXILIAR;
      Objeto.CVE_SECTOR_SAP.Control:=edCVE_SECTOR_SAP;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_SECTOR.Control:=edCVE_SECTOR;
      Objeto.CVE_RELACION.Control:=edCVE_RELACION;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edID_OLTP_PRODUCTO;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

end;

procedure TWCrCoincreSap.FormDestroy(Sender: TObject);
begin
      Objeto.ID_OLTP_PRODUCTO.Control:=nil;
      Objeto.ID_REPORTE.Control:=nil;
      Objeto.ID_METRICA.Control:=nil;
      Objeto.CVE_CUENTA.Control:=nil;
      Objeto.CVE_SUBCUENTA.Control:=nil;
      Objeto.CVE_AUXILIAR.Control:=nil;
      Objeto.CVE_SECTOR_SAP.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_SECTOR.Control:=nil;
      Objeto.CVE_RELACION.Control:=nil;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
   //Objeto
end;

procedure TWCrCoincreSap.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCoincreSap.InterForma1DespuesNuevo(Sender: TObject);
begin
     Objeto.CVE_SUBCUENTA.AsString := ' ';
     Objeto.CVE_AUXILIAR.AsString := ' ';

     if Objeto.VLBReplica then
     begin
         Objeto.ID_REPORTE.AsString               := Objeto.VLID_REPORTE;
         Objeto.ID_REPORTE.DrawControl;
         Objeto.ID_METRICA.AsString               := Objeto.VLID_METRICA;
         Objeto.ID_METRICA.DrawControl;
         Objeto.CVE_CUENTA.AsString               := Objeto.VLCVE_CUENTA;
         Objeto.CVE_CUENTA.DrawControl;
         Objeto.CVE_SUBCUENTA.AsString            := Objeto.VLCVE_SUBCUENTA;
         Objeto.CVE_SUBCUENTA.DrawControl;
         Objeto.CVE_AUXILIAR.AsString             := Objeto.VLCVE_AUXILIAR;
         Objeto.CVE_AUXILIAR.DrawControl;
         Objeto.CVE_SECTOR_SAP.AsString           := Objeto.VLCVE_SECTOR_SAP;
         Objeto.CVE_SECTOR_SAP.DrawControl;
         Objeto.CVE_MONEDA.AsString               := Objeto.VLCVE_MONEDA;
         Objeto.CVE_MONEDA.DrawControl;
         Objeto.CVE_SECTOR.AsString               := Objeto.VLCVE_SECTOR;
         Objeto.CVE_SECTOR.DrawControl;
         Objeto.CVE_RELACION.AsString             := Objeto.VLCVE_RELACION;
         Objeto.CVE_RELACION.DrawControl;
         Objeto.VLBReplica := False;
     end;

     edID_OLTP_PRODUCTO.SetFocus;
end;

procedure TWCrCoincreSap.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCoincreSap.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCoincreSap.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        InterForma1.NextTab(btPRODUCTO);
    end;
end;

procedure TWCrCoincreSap.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        InterForma1.NextTab(btPRODUCTO);
    End;
end;

procedure TWCrCoincreSap.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrCoincreSap.Button1Click(Sender: TObject);
begin
     if not(InterForma1.CanEdit) and Objeto.Active then
     begin
         Objeto.VLID_REPORTE               := edID_REPORTE.text;
         Objeto.VLID_METRICA               := edID_METRICA.text;
         Objeto.VLCVE_CUENTA               := edCVE_CUENTA.text;
         Objeto.VLCVE_SUBCUENTA            := edCVE_SUBCUENTA.text;
         Objeto.VLCVE_AUXILIAR             := edCVE_AUXILIAR.text;
         Objeto.VLCVE_SECTOR_SAP           := edCVE_SECTOR_SAP.text;
         Objeto.VLCVE_MONEDA               := edCVE_MONEDA.text;
         Objeto.VLCVE_SECTOR               := edCVE_SECTOR.text;
         Objeto.VLCVE_RELACION             := edCVE_RELACION.text;
         Objeto.VLBReplica := True;
         InterForma1.BtnNuevo.Click;
     end

end;

procedure TWCrCoincreSap.Button2Click(Sender: TObject);
var vlSQL : String;
    vlTotal : Integer;
begin
     if InterForma1.CanEdit and Objeto.Active then
     begin
          Objeto.ID_REPORTE.GetFromControl;
          vlSQL := ' SELECT MAX(ID_METRICA) AS METRICA FROM CR_COINCRE_SAP WHERE ID_REPORTE = ''' + Objeto.ID_REPORTE.AsString  +''' AND ID_METRICA <> ''9999''';
          If GetSQLInt(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'METRICA', vlTOTAL, True) Then
          begin
              Objeto.ID_METRICA.AsInteger := vlTOTAL + 1;
              Objeto.ID_METRICA.DrawControl;
          end;
     end;
end;

end.
