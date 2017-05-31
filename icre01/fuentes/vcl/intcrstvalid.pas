// Sistema         : Clase de CR_SIT_VALIDA
// Fecha de Inicio : 07/01/2005
// Función forma   : Clase de CR_SIT_VALIDA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrStValid;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,
//Unidades Adicionales
IntGenCre,
IntParamCre,
IntCrProduct,
IntCrAmortiz,
IntCrPagInt,
IntCrSituaci, IntLinkit,
IntCrAccesor
;

Type
 TCrStValid= class;

  TWCrStValida=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_PRODUCTO_CRE : TLabel;
    lbCVE_AMORTIZACION : TLabel;
    edCVE_AMORTIZACION : TEdit;
    lbCVE_PAG_INTERES : TLabel;
    edCVE_PAG_INTERES : TEdit;
    lbCVE_ACCESORIO : TLabel;
    edCVE_ACCESORIO : TEdit;
    lbCVE_SIT_ACTUAL : TLabel;
    edCVE_SIT_ACTUAL : TEdit;
    lbCVE_SIT_ASIGNA : TLabel;
    edCVE_SIT_ASIGNA : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btAMORTIZA: TBitBtn;
    edDESC_TIPO_AMORT: TEdit;
    btPAGO_INT: TBitBtn;
    edDESC_PAGO_INT: TEdit;
    btACCESORIO: TBitBtn;
    edDESC_ACCESORIO: TEdit;
    btSIT_ACTUAL: TBitBtn;
    edDESC_L_SIT_ACTUAL: TEdit;
    edDESC_L_SIT_ASIGNA: TEdit;
    btSIT_ASIGNA: TBitBtn;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_L_PRODUCTO: TEdit;
    sgcDATOS: TSGCtrl;
    chAGRUP_TODOS: TCheckBox;
    Edit2: TEdit;
    edTIT_DISP: TEdit;
    edTIT_MEDIO_LIQ: TEdit;
    edTIT_LIQUIDA: TEdit;
    edTIT_CHEQUERA: TEdit;
    Edit3: TEdit;
    ilPRODUCTO: TInterLinkit;
    ilAMORTIZA: TInterLinkit;
    ilPAGO_INT: TInterLinkit;
    ilACCESORIO: TInterLinkit;
    ilSIT_ACTUAL: TInterLinkit;
    ilSIT_ASIGNA: TInterLinkit;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btAMORTIZAClick(Sender: TObject);
    procedure ilAMORTIZAEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilAMORTIZACapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure btPAGO_INTClick(Sender: TObject);
    procedure ilPAGO_INTEjecuta(Sender: TObject);
    procedure edCVE_PAG_INTERESExit(Sender: TObject);
    procedure ilPAGO_INTCapture(Sender: TObject; var Show: Boolean);
    procedure btACCESORIOClick(Sender: TObject);
    procedure ilACCESORIOEjecuta(Sender: TObject);
    procedure ilACCESORIOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_SIT_ACTUALExit(Sender: TObject);
    procedure ilSIT_ACTUALEjecuta(Sender: TObject);
    procedure ilSIT_ACTUALCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_SIT_ASIGNAExit(Sender: TObject);
    procedure btSIT_ASIGNAClick(Sender: TObject);
    procedure btSIT_ACTUALClick(Sender: TObject);
    procedure ilSIT_ASIGNAEjecuta(Sender: TObject);
    procedure ilSIT_ASIGNACapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edCVE_ACCESORIOExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private
       Procedure MuestraDatos(pProducto: String);
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrStValid;
end;
 TCrStValid= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_AMORTIZACION         : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        CVE_SIT_ACTUAL           : TInterCampo;
        CVE_SIT_ASIGNA           : TInterCampo;

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Amortizacion             : TCrAmortiz;
        PagoInteres              : TCrPagInt;
        Accesorio                : TCrAccesor;
        SitActual                : TCrSituaci;
        SitAsigna                : TCrSituaci;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrStValid.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Producto';
      CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AMORTIZACION.Caption:='Amortización';
      CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
                CVE_PAG_INTERES.Caption:='Pag. Interés';
      CVE_ACCESORIO :=CreaCampo('CVE_ACCESORIO',ftString,tsNinguno,tsNinguno,True);
                CVE_ACCESORIO.Caption:='Accesorio';
      CVE_SIT_ACTUAL :=CreaCampo('CVE_SIT_ACTUAL',ftString,tsNinguno,tsNinguno,True);
                CVE_SIT_ACTUAL.Caption:='Sit. Actual';
      CVE_SIT_ASIGNA :=CreaCampo('CVE_SIT_ASIGNA',ftString,tsNinguno,tsNinguno,True);
                CVE_SIT_ASIGNA.Caption:='Situación Asigna';
      FKeyFields.Add('CVE_PRODUCTO_CRE');
      FKeyFields.Add('CVE_AMORTIZACION');
      FKeyFields.Add('CVE_PAG_INTERES');
      FKeyFields.Add('CVE_ACCESORIO');      

      TableName := 'CR_SIT_VALIDA';
      UseQuery := True;
      HelpFile := 'IntCrStValid.Hlp';
      ShowMenuReporte:=True;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='CVE_PRODUCTO_CRE';

      Amortizacion := TCrAmortiz.Create(Self);
      Amortizacion.MasterSource:=Self;
      Amortizacion.FieldByName('CVE_AMORTIZACION').MasterField:='CVE_AMORTIZACION';

      PagoInteres := TCrPagInt.Create(Self);
      PagoInteres.MasterSource:=Self;
      PagoInteres.FieldByName('CVE_PAG_INTERES').MasterField:='CVE_PAG_INTERES';

      Accesorio := TCrAccesor.Create(Self);
      Accesorio.MasterSource:=Self;
      Accesorio.FieldByName('CVE_ACCESORIO').MasterField:='CVE_ACCESORIO';

      SitActual := TCrSituaci.Create(Self);
      SitActual.MasterSource:=Self;
      SitActual.FieldByName('CVE_SITUACION').MasterField:='CVE_SIT_ACTUAL';

      SitAsigna := TCrSituaci.Create(Self);
      SitAsigna.MasterSource:=Self;
      SitAsigna.FieldByName('CVE_SITUACION').MasterField:='CVE_SIT_ASIGNA';

end;

Destructor TCrStValid.Destroy;
begin
   if Producto <> nil then
      Producto.free;
   //end if

   if Amortizacion <> nil then
      Amortizacion.free;
   //end if

   if PagoInteres <> nil then
      PagoInteres.free;
   //end if

   if Accesorio <> nil then
      Accesorio.free;
   //end if

   if SitActual <> nil then
      SitActual.free;
   //end if

   if SitAsigna <> nil then
      SitAsigna.free;
   //end if
   inherited;
end;


function TCrStValid.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrStValida;
begin
   W:=TWCrStValida.Create(Self);
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


Function TCrStValid.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrStVal.it','S,S,S,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO_CRE.AsString);
                               T.Param(1,CVE_AMORTIZACION.AsString);
                               T.Param(2,CVE_PAG_INTERES.AsString);
                               T.Param(3,CVE_ACCESORIO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_SIT_VALIDA********************)
(*                                                                              *)
(*  FORMA DE CR_SIT_VALIDA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SIT_VALIDA********************)
procedure TWCrStValida.MuestraDatos(pProducto: String);
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT  CSV.CVE_PRODUCTO_CRE PRODUCTO, ' + coCRLF +
              '         CSV.CVE_AMORTIZACION, ' + coCRLF +
              '         CA.DESC_AMORTIZA     AMORTIZACION, ' + coCRLF +
              '         CSV.CVE_PAG_INTERES, ' + coCRLF +
              '         CPI.DESC_PAG_INTERES PAG_INTERES, ' + coCRLF +
              '         CSV.CVE_ACCESORIO ACCESORIO, ' + coCRLF +
              '         CSV.CVE_SIT_ACTUAL SIT_ACTUAL, ' + coCRLF +
              '         CSV.CVE_SIT_ASIGNA SIT_ASIGNAR ' + coCRLF +
              ' FROM CR_SIT_VALIDA   CSV, ' + coCRLF +
              '         CR_AMORTIZACION CA, ' + coCRLF +
              '         CR_PAGO_INTERES CPI, ' + coCRLF +
              '         CR_ACCESORIO    CC, ' + coCRLF +
              '         CR_SITUACION    CSA, ' + coCRLF +
              '         CR_SITUACION    CSM ' + coCRLF +
              ' WHERE  CSV.CVE_PRODUCTO_CRE = '+ SQLStr(pProducto) + coCRLF +
              '   AND CA.CVE_AMORTIZACION   = CSV.CVE_AMORTIZACION ' + coCRLF +
              '   AND CPI.CVE_PAG_INTERES   = CSV.CVE_PAG_INTERES ' + coCRLF +
              '   AND CC.CVE_ACCESORIO      = CSV.CVE_ACCESORIO ' + coCRLF +
              '   AND CSA.CVE_SITUACION     = CSV.CVE_SIT_ACTUAL ' + coCRLF +
              '   AND CSM.CVE_SITUACION     = CSV.CVE_SIT_ASIGNA' + coCRLF ;
     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('CVE_AMORTIZACION').Visible := False;
            vlQry.FieldByName('CVE_PAG_INTERES').Visible  := False;

            vlQry.FieldByName('PRODUCTO').DisplayWidth     := 8;
            vlQry.FieldByName('AMORTIZACION').DisplayWidth := 31;
            vlQry.FieldByName('PAG_INTERES').DisplayWidth  := 35;
            vlQry.FieldByName('ACCESORIO').DisplayWidth    := 4;
            vlQry.FieldByName('SIT_ACTUAL').DisplayWidth   := 4;
            vlQry.FieldByName('SIT_ASIGNAR').DisplayWidth  := 4;

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrStValida.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
      Objeto.CVE_ACCESORIO.Control:=edCVE_ACCESORIO;
      Objeto.CVE_SIT_ACTUAL.Control:=edCVE_SIT_ACTUAL;
      Objeto.CVE_SIT_ASIGNA.Control:=edCVE_SIT_ASIGNA;

      Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_L_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      Objeto.Amortizacion.DESC_AMORTIZA.Control := edDESC_TIPO_AMORT;
      Objeto.Amortizacion.GetParams(Objeto);

      Objeto.PagoInteres.DESC_PAG_INTERES.Control := edDESC_PAGO_INT;
      Objeto.PagoInteres.GetParams(Objeto);

      Objeto.Accesorio.DESC_ACCESORIO.Control := edDESC_ACCESORIO;
      Objeto.Accesorio.GetParams(Objeto);

      Objeto.SitActual.DESC_L_SITUACION.Control := edDESC_L_SIT_ACTUAL;
      Objeto.SitActual.GetParams(Objeto);

      Objeto.SitAsigna.DESC_L_SITUACION.Control := edDESC_L_SIT_ASIGNA;
      Objeto.SitAsigna.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrStValida.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.CVE_AMORTIZACION.Control:=nil;
      Objeto.CVE_PAG_INTERES.Control:=nil;
      Objeto.CVE_ACCESORIO.Control:=nil;
      Objeto.CVE_SIT_ACTUAL.Control:=nil;
      Objeto.CVE_SIT_ASIGNA.Control:=nil;

      Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
      Objeto.Amortizacion.DESC_AMORTIZA.Control := nil;
      Objeto.PagoInteres.DESC_PAG_INTERES.Control := nil;
      Objeto.Accesorio.DESC_ACCESORIO.Control := nil;
      Objeto.SitAsigna.DESC_L_SITUACION.Control := nil;
      Objeto.SitActual.DESC_L_SITUACION.Control := nil;
   //Objeto
end;

procedure TWCrStValida.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrStValida.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_PRODUCTO_CRE.SetFocus;
end;

procedure TWCrStValida.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_SIT_ACTUAL.SetFocus;
end;


procedure TWCrStValida.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   if Objeto.Producto.Busca then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;

procedure TWCrStValida.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   //end if
end;

procedure TWCrStValida.edCVE_PRODUCTO_CREExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_PRODUCTO_CRE.GetFromControl;
       If Objeto.CVE_PRODUCTO_CRE.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el Producto';
       end;
       InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStValida.btAMORTIZAClick(Sender: TObject);
begin
   Objeto.Amortizacion.ShowAll := True;
   if Objeto.Amortizacion.Busca then
      InterForma1.NextTab(edCVE_AMORTIZACION);
end;

procedure TWCrStValida.ilAMORTIZAEjecuta(Sender: TObject);
begin
   if Objeto.Amortizacion.FindKey([ilAMORTIZA.Buffer]) then
      InterForma1.NextTab(edCVE_AMORTIZACION);
end;

procedure TWCrStValida.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStValida.ilAMORTIZACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStValida.edCVE_AMORTIZACIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_AMORTIZACION.GetFromControl;
       If Objeto.CVE_AMORTIZACION.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el Tipo de Amortización';
       end;
       InterForma1.ValidaExit(edCVE_AMORTIZACION,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStValida.btPAGO_INTClick(Sender: TObject);
begin
   Objeto.PagoInteres.ShowAll := True;
   if Objeto.PagoInteres.Busca then
      InterForma1.NextTab(edCVE_PAG_INTERES);
end;

procedure TWCrStValida.ilPAGO_INTEjecuta(Sender: TObject);
begin
   if Objeto.PagoInteres.FindKey([ilPAGO_INT.Buffer]) then
      InterForma1.NextTab(edCVE_PAG_INTERES);
end;

procedure TWCrStValida.edCVE_PAG_INTERESExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_PAG_INTERES.GetFromControl;
       If Objeto.CVE_PAG_INTERES.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el pago de Interés';
       end;
       InterForma1.ValidaExit(edCVE_PAG_INTERES,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStValida.ilPAGO_INTCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStValida.btACCESORIOClick(Sender: TObject);
begin
   Objeto.Accesorio.ShowAll := True;
   if Objeto.Accesorio.Busca then
      InterForma1.NextTab(edCVE_ACCESORIO);
end;

procedure TWCrStValida.ilACCESORIOEjecuta(Sender: TObject);
begin
   if Objeto.Accesorio.FindKey([ilACCESORIO.Buffer]) then
      InterForma1.NextTab(edCVE_ACCESORIO);
end;

procedure TWCrStValida.ilACCESORIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStValida.edCVE_SIT_ACTUALExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_SIT_ACTUAL.GetFromControl;
       If Objeto.CVE_SIT_ACTUAL.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar la situación actual';
       end;
       Objeto.SitAsigna.BuscaWhereString := ' CR_SITUACION.B_DISPOSICION =  ' + SQLStr(CVERDAD) +
                                       ' AND CR_SITUACION.CVE_SITUACION <> ' + SQLStr(Objeto.CVE_SIT_ACTUAL.AsString);
       Objeto.SitAsigna.FilterString := Objeto.SitAsigna.BuscaWhereString;
       InterForma1.ValidaExit(edCVE_SIT_ACTUAL,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStValida.ilSIT_ACTUALEjecuta(Sender: TObject);
begin
   if Objeto.SitActual.FindKey([ilSIT_ACTUAL.Buffer]) then
      InterForma1.NextTab(edCVE_SIT_ACTUAL);
end;

procedure TWCrStValida.ilSIT_ACTUALCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStValida.edCVE_SIT_ASIGNAExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_SIT_ASIGNA.GetFromControl;
       If Objeto.CVE_SIT_ASIGNA.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar la situación a asignar';
       end;
       InterForma1.ValidaExit(edCVE_SIT_ASIGNA,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStValida.btSIT_ASIGNAClick(Sender: TObject);
begin
   Objeto.SitAsigna.ShowAll := True;
   if Objeto.SitAsigna.Busca then
      InterForma1.NextTab(edCVE_SIT_ASIGNA);
end;

procedure TWCrStValida.btSIT_ACTUALClick(Sender: TObject);
begin
   Objeto.SitActual.ShowAll := True;
   if Objeto.SitActual.Busca then
      InterForma1.NextTab(edCVE_SIT_ACTUAL);
end;

procedure TWCrStValida.ilSIT_ASIGNAEjecuta(Sender: TObject);
begin
   if Objeto.SitAsigna.FindKey([ilSIT_ASIGNA.Buffer]) then
      InterForma1.NextTab(edCVE_SIT_ASIGNA);
end;

procedure TWCrStValida.ilSIT_ASIGNACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrStValida.InterForma1AntesAceptar(Sender: TObject;
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
   // end if
end;


procedure TWCrStValida.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraDatos(Objeto.CVE_PRODUCTO_CRE.AsString);
end;

procedure TWCrStValida.edCVE_ACCESORIOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       Objeto.CVE_ACCESORIO.GetFromControl;
       If Objeto.CVE_ACCESORIO.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar el accesorio';
       end;
       InterForma1.ValidaExit(edCVE_ACCESORIO,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrStValida.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
      MuestraDatos(Objeto.CVE_PRODUCTO_CRE.AsString);
end;

end.
