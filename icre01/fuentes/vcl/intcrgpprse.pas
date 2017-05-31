// Sistema         : Clase de CR_GPO_PROD_SECT
// Fecha de Inicio : 22/04/2005
// Función forma   : Clase de CR_GPO_PROD_SECT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrGpPrSe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//UNIDADES ADICONALES
IntParamCre, //PARAMETRO
IntMProdGpo; //GRUPO PRODUCTO

Type
 TCrGpPrSe= class; 

  TWCrGpProdSect=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_PRODUCTO_GPO : TLabel; 
    edCVE_PRODUCTO_GPO : TEdit;
    lbCVE_SECTOR_CONTAB : TLabel; 
    edCVE_SECTOR_CONTAB : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edDESC_L_PROD_GPO: TEdit;
    btSECTOR: TBitBtn;
    edDESC_SECTOR: TEdit;
    ilGPO_PRODUCTO: TInterLinkit;
    ilSECTOR: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilGPO_PRODUCTOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrGpPrSe;
end; 
 TCrGpPrSe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        CVE_PRODUCTO_GPO         : TInterCampo;
        CVE_SECTOR_CONTAB        : TInterCampo;

        ParamCre                 : TParamCre;
        ProdGpo                  : TMProdGpo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrGpPrSe.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_GPO.Caption:='Grupo Producto';
      CVE_SECTOR_CONTAB :=CreaCampo('CVE_SECTOR_CONTAB',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_CONTAB.Caption:='Sector Contable';
      FKeyFields.Add('CVE_PRODUCTO_GPO');
      FKeyFields.Add('CVE_SECTOR_CONTAB');

      TableName := 'CR_GPO_PROD_SECT';
      UseQuery := True;
      HelpFile := 'IntCrGpPrSe.Hlp';
      ShowMenuReporte:=True;

      ProdGpo := TMProdGpo.Create(Self);
      ProdGpo.MasterSource:=Self;
      ProdGpo.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

end;

Destructor TCrGpPrSe.Destroy;
begin
      if ProdGpo <> nil then
         ProdGpo.Free;
      //end if
   inherited;
end;


function TCrGpPrSe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGpProdSect;
begin
   W:=TWCrGpProdSect.Create(Self);
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


Function TCrGpPrSe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrGpPS.it','S,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO_GPO.AsString); 
                               T.Param(1,CVE_SECTOR_CONTAB.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_GPO_PROD_SECT********************)
(*                                                                              *)
(*  FORMA DE CR_GPO_PROD_SECT                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GPO_PROD_SECT********************)

procedure TWCrGpProdSect.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_GPO.Control:=edCVE_PRODUCTO_GPO;
      Objeto.CVE_SECTOR_CONTAB.Control:=edCVE_SECTOR_CONTAB;

      Objeto.ProdGpo.DESC_L_PROD_GPO.Control := edDESC_L_PROD_GPO;
      Objeto.ProdGpo.GetParams(Objeto);

end;

procedure TWCrGpProdSect.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_GPO.Control:=nil;
      Objeto.CVE_SECTOR_CONTAB.Control:=nil;
      Objeto.ProdGpo.DESC_L_PROD_GPO.Control := nil;
end;

procedure TWCrGpProdSect.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGpProdSect.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_PRODUCTO_GPO.SetFocus;
end;

procedure TWCrGpProdSect.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.ProdGpo.ShowAll := True;
   If Objeto.ProdGpo.Busca then
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   //end if
end;

procedure TWCrGpProdSect.ilGPO_PRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.ProdGpo.FindKey([ilGPO_PRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   //end if
end;

procedure TWCrGpProdSect.edCVE_PRODUCTO_GPOExit(Sender: TObject);
Var     VLValida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     VLMsg := '';
     VLValida := True;
     Objeto.CVE_PRODUCTO_GPO.GetFromControl;

     If Objeto.CVE_PRODUCTO_GPO.AsString <> '' then
     Begin
           VLMsg := 'Favor de introducir el grupo del producto a configurar ';
           VLValida := False;
      end;
     InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,VLValida,VLMsg,True);
   end;
end;

end.
