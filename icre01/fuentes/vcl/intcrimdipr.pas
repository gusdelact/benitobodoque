// Sistema         : Clase de CR_IMP_DIR_PROD
// Fecha de Inicio : 09/10/2009
// Función forma   : Clase de CR_IMP_DIR_PROD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : AARJ 09 Oct 2009.
// Comentarios     : Forma para el catalogo de Relacion de Direcciones y productos para el reporte de Cartera Impagada
Unit IntCrImDiPr;

interface

uses                                                            
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntCrProduct,   //Producto Credito
// Unidades Adicionales  para la implementación de los controles de captura   #1
// Intempre,  //Empresa
IntCrImpDire, //Direcciones
// Unidades Adicionales para implementar barra de estus y seguridad al pie de la forma
IntParamCre,
IntGenCre,

IntLinkit;

Type
 TCrImDiPr= class; 

  TWCrImpDirProd=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_DIRECCION : TLabel; 
    edCVE_DIRECCION : TEdit;
    lbCVE_PRODUCTO_CRE : TLabel; 
    edCVE_PRODUCTO_CRE : TEdit;
    GroupBox4: TGroupBox;
    lbFH_ALTA: TLabel;
    lbFH_MODIF: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIF: TLabel;
    edCVE_USU_ALTA: TEdit;
    edFH_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    edFH_MODIF: TEdit;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSIT_REL_DIR_PROD: TRadioGroup;
    ilPRODUCTO: TInterLinkit;
    edDESC_PRODUCTO: TEdit;
    btPRODUCTO: TBitBtn;
    btDIRECCION: TBitBtn;
    ilDIRECCION: TInterLinkit;
    edDESC_DIRECCION: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure rgSIT_REL_DIR_PRODExit(Sender: TObject);
    procedure edCVE_DIRECCIONExit(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1ErrorAceptar(Sender: TObject);
    procedure btDIRECCIONClick(Sender: TObject);
    procedure btDIRECCIONExit(Sender: TObject);
    procedure ilDIRECCIONEjecuta(Sender: TObject);
    procedure ilDIRECCIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrImDiPr;
end; 
 TCrImDiPr= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        //Clases Adicionales    # 2
        ParamCre                 : TParamCre;
        //Empresa                  : TEmpresa; //Empresa
        Producto                 : TCrProduct; //Producto
        Direccion                : TCrImpDire; //Dirección

        // ID_EMPRESA               : TInterCampo;
        CVE_DIRECCION            : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        SIT_REL_DIR_PROD         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIF            : TInterCampo;
        FH_MODIF                 : TInterCampo;
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


constructor TCrImDiPr.Create( AOwner : TComponent ); 
begin Inherited; 
      //ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      //          ID_EMPRESA.Caption:='Número de Empresa';

      CVE_DIRECCION :=CreaCampo('CVE_DIRECCION',ftString,tsNinguno,tsNinguno,True);
                CVE_DIRECCION.Caption:='Clave de Direccion';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Clave de Producto Cre';

      SIT_REL_DIR_PROD :=CreaCampo('SIT_REL_DIR_PROD',ftString,tsNinguno,tsNinguno,True);
       With SIT_REL_DIR_PROD do Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('CA');
      End;
                SIT_REL_DIR_PROD.Caption:='Situación Rel Dir Prod';


      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      CVE_USU_MODIF :=CreaCampo('CVE_USU_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIF.Caption:='Clave de Usu Modificación';
      FH_MODIF :=CreaCampo('FH_MODIF',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIF.Caption:='Fecha y Hora Modificación';

      // Empresa
      // Empresa := TEmpresa.Create(Self);

      // #3
      Direccion :=  TCrImpDire.Create(Self);
      Direccion.MasterSource:=Self;
      Direccion.FieldByName('CVE_DIRECCION').MasterField   :='CVE_DIRECCION';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField :='CVE_PRODUCTO_CRE';

      //FKeyFields.Add('ID_EMPRESA');
      
      FKeyFields.Add('CVE_DIRECCION');
      FKeyFields.Add('CVE_PRODUCTO_CRE');

      TableName := 'CR_IMP_DIR_PROD'; 
      UseQuery := True; 
      HelpFile := 'IntCrImDiPr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrImDiPr.Destroy;
begin
    //#4
    // if Empresa <> nil then Empresa.free;
    if Direccion <> nil then
      Direccion.Free;

     if Producto <> nil then
      Producto.Free;

inherited;
end;


function TCrImDiPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrImpDirProd;
begin
   W:=TWCrImpDirProd.Create(Self);
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


Function TCrImDiPr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrImDP.it','S,S');
      Try
        if Active then
        begin
          //T.Param(0,ID_EMPRESA.AsString);
          T.Param(0,CVE_DIRECCION.AsString);
          T.Param(1,CVE_PRODUCTO_CRE.AsString);
        end;

        if T.Execute then
            InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]); //,T.DameCampo(2)
      finally
        T.Free;
      end; 
end;

function TCrImDiPr.Reporte:Boolean; 
begin //Execute_Reporte();
Result := False;
end;


(***********************************************FORMA CR_IMP_DIR_PROD********************)
(*                                                                              *)
(*  FORMA DE CR_IMP_DIR_PROD                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_IMP_DIR_PROD********************)

procedure TWCrImpDirProd.FormShow(Sender: TObject);
begin

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      //Objeto.ID_EMPRESA.Control:=edID_EMPRESA;
      Objeto.CVE_DIRECCION.Control:=edCVE_DIRECCION;
      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.SIT_REL_DIR_PROD.Control:=rgSIT_REL_DIR_PROD;

      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_MODIF.Control:=edCVE_USU_MODIF;
      Objeto.FH_MODIF.Control:=edFH_MODIF;

      // Empresa
      //Objeto.Empresa.ID_Empresa.Control := edID_EMPRESA;
      //Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      //Objeto.Empresa.GetParams(Objeto);
      //edNombreEmpresa.Hint := Objeto.Empresa.PersonaMoral.Nombre.AsString;
      //edNombreEmpresa.ShowHint := True;

      // Direccion
      Objeto.Direccion.CVE_DIRECCION.Control  := edCVE_DIRECCION;
      Objeto.Direccion.DESC_DIRECCION.Control := edDESC_DIRECCION;
      Objeto.Direccion.GetParams(Objeto);

      // Producto
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

end;

procedure TWCrImpDirProd.FormDestroy(Sender: TObject);
begin
      //Objeto.ID_EMPRESA.Control:=nil;
      Objeto.CVE_DIRECCION.Control:=nil;
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.SIT_REL_DIR_PROD.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_MODIF.Control:=nil;
      Objeto.FH_MODIF.Control:=nil;

      // Empresa
      // Objeto.Empresa.ID_Empresa.Control := Nil;
      // Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;


      // Direccion
      Objeto.Direccion.CVE_DIRECCION.Control  := Nil;
      Objeto.Direccion.DESC_DIRECCION.Control := Nil;

      // Producto
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := Nil;

   //Objeto
end;

procedure TWCrImpDirProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrImpDirProd.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;

   Objeto.CVE_DIRECCION.AsString    := Objeto.Direccion.CVE_DIRECCION.AsString;
   Objeto.CVE_PRODUCTO_CRE.AsString := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;

   Objeto.FH_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_REL_DIR_PROD.ItemIndex:= 0;
   //edID_EMPRESA.SetFocus;
   edCVE_DIRECCION.SetFocus;
   GroupBox4.Enabled := False;
end;

procedure TWCrImpDirProd.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
    Objeto.FH_MODIF.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
    Objeto.CVE_USU_MODIF.AsString := Objeto.Apli.Usuario;
    rgSIT_REL_DIR_PROD.SetFocus;
    GroupBox4.Enabled := False;

end;

procedure TWCrImpDirProd.rgSIT_REL_DIR_PRODExit(Sender: TObject);
begin
 InterForma1.ValidaExit(rgSIT_REL_DIR_PROD,True,CNULL,True);
end;



procedure TWCrImpDirProd.ilPRODUCTOEjecuta(Sender: TObject);
begin
     if Objeto.Producto.FindKey([ilPRODUCTO.Buffer])then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;


procedure TWCrImpDirProd.edCVE_DIRECCIONExit(Sender: TObject);
{var  vlSalida  :  boolean;
     vlMsg     :  String;
}
Begin
{   vlMsg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_DIRECCION.GetFromControl;
      If Objeto.CVE_DIRECCION.AsString = CNULL Then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la Dirección';
      End;
      InterForma1.ValidaExit(edCVE_DIRECCION,vlSalida,vlMsg,True);
   end;
 }
   InterForma1.ValidaExit(edCVE_DIRECCION,True,'',True);

end;

procedure TWCrImpDirProd.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TWCrImpDirProd.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;

procedure TWCrImpDirProd.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  With Objeto Do
  Begin
      If IsNewData Then
      Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
         Begin
            CVE_USU_ALTA.AsString  := DameUsuario;
            FH_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End
         else
            Realizado := False;
      End
      else
      Begin
         If MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
         Begin
            CVE_USU_MODIF.AsString  := DameUsuario;
            FH_MODIF.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End
         else
            Realizado := False;
      End
  End;

end;

procedure TWCrImpDirProd.InterForma1Buscar(Sender: TObject);
begin
       Objeto.InternalBusca;
end;

procedure TWCrImpDirProd.InterForma1ErrorAceptar(Sender: TObject);
begin
  //ShowMessage('Falla Nuevo / Modificacion');
end;

procedure TWCrImpDirProd.btDIRECCIONClick(Sender: TObject);
begin
    Objeto.Direccion.ShowAll := True;
    if Objeto.Direccion.Busca then
      InterForma1.NextTab(edCVE_DIRECCION);
end;

procedure TWCrImpDirProd.btDIRECCIONExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_DIRECCION,True,'',True);
end;

procedure TWCrImpDirProd.ilDIRECCIONEjecuta(Sender: TObject);
begin
  if Objeto.Direccion.FindKey([ilDIRECCION.Buffer])then
      InterForma1.NextTab(edCVE_DIRECCION);
end;

procedure TWCrImpDirProd.ilDIRECCIONCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:={(InterForma1.CanEdit) and} (InterForma1.IsNewData);
end;

procedure TWCrImpDirProd.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:={(InterForma1.CanEdit) and} (InterForma1.IsNewData);
end;

end.
