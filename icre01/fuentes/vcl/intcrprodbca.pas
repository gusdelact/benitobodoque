// Sistema         : Clase de crprodbca
// Fecha de Inicio : 05/07/2013
// Función forma   : Clase de crprodbca
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrprodbca;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit, CheckLst,
IntCrrelprod, //Catálogo de Productos Banca - ICRE
IntCrcatarne, //Catálogo De Área de Negocio
IntCrGpoPBca, //Catálogo De Grupo Producto Banca
IntCrctroeob, //Catálogo ROE Objetivo
IntCrbcatipc, //Relación Tipos de Credito
IntLinkit
;

Type
 TCrprodbca= class; 

  TWCrprodbca=Class(TForm)
    InterForma1             : TInterForma;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbCVE_GRUPO_ECO: TLabel;
    edCveProd: TInterEdit;
    Label1: TLabel;
    edDescCorta: TInterEdit;
    Label2: TLabel;
    edDescLarga: TInterEdit;
    Label3: TLabel;
    edCveAneg: TInterEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    GroupBox1: TGroupBox;
    lbF_ALTA: TLabel;
    edF_ALTA: TInterEdit;
    lbCVE_USU_ALTA: TLabel;
    edCVE_USU_MODIFICA: TInterEdit;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TInterEdit;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_ALTA: TInterEdit;
    edClasLegal: TInterEdit;
    edRegCont: TInterEdit;
    edImporte: TInterEdit;
    edComis: TInterEdit;
    edTasIntOrd: TInterEdit;
    edPlazo: TInterEdit;
    edDestino: TInterEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edGarantia: TInterEdit;
    Label11: TLabel;
    rgSITUACION: TRadioGroup;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    Button1: TButton;
    Label6: TLabel;
    edFuenPag: TInterEdit;
    Label12: TLabel;
    edFormaDisp: TInterEdit;
    Label13: TLabel;
    edPagCapit: TInterEdit;
    Label14: TLabel;
    edPagInt: TInterEdit;
    Label16: TLabel;
    edPagAnticip: TInterEdit;
    Label17: TLabel;
    edCondIntum: TInterEdit;
    Label18: TLabel;
    edCaract: TInterEdit;
    Label19: TLabel;
    edLineamiento: TInterEdit;
    Label20: TLabel;
    edTransit: TInterEdit;
    Label21: TLabel;
    edTasaIntMor: TInterEdit;
    Button2: TButton;
    Button3: TButton;
    ilAREANEG: TInterLinkit;
    Button4: TButton;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label22: TLabel;
    edGpoProdBca: TInterEdit;
    BitBtn1: TBitBtn;
    edDESC_GPOPRODBCA: TEdit;
    ilGpoProdBca: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure TabSheet4Show(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilAREANEGEjecuta(Sender: TObject);
    procedure ilAREANEGCapture(Sender: TObject; var Show: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ilGpoProdBcaCapture(Sender: TObject; var Show: Boolean);
    procedure ilGpoProdBcaEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TCrprodbca;
end; 
 TCrprodbca= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        ParamCre                : TParamCre;
        CatAreaNeg              : TCrcatarne;
        CrGpoPBca               : TCrGpoPBca;

        CVE_PRODUCTO_BCA        : TInterCampo;
        DESC_C_PRODUCTO         : TInterCampo;
        DESC_L_PRODUCTO         : TInterCampo;
        ESTADO                  : TInterCampo;
        CVE_USU_ALTA            : TInterCampo;
        F_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA        : TInterCampo;
        F_MODIFICA              : TInterCampo;
//        VERSION_REGISTRO        : TInterCampo;
        CVE_AREA_NEGOCIO        : TInterCampo;
        CVE_GPO_PRODUCTO_BCA    : TInterCampo;
        TX_CLASIFICA_LEGAL      : TInterCampo;
        TX_REGISTRO_CONTA       : TInterCampo;
        TX_IMPORTE              : TInterCampo;
        TX_COMISION             : TInterCampo;
        TX_TASA_INT_ORD         : TInterCampo;
        TX_TASA_INT_MORA        : TInterCampo;
        TX_PLAZO                : TInterCampo;
        TX_DESTINO              : TInterCampo;
        TX_GARANTIA             : TInterCampo;
        TX_FUENTE_PAGO          : TInterCampo;
        TX_FORMA_DISP           : TInterCampo;
        TX_PAGO_CAPITAL         : TInterCampo;
        TX_PAGO_INT             : TInterCampo;
        TX_PAGO_ANTICIPA        : TInterCampo;
        TX_CONDICIONES_INTRUM   : TInterCampo;
        TX_CARACTERISTICA       : TInterCampo;
        TX_LINEAMIENTO          : TInterCampo;
        TX_TRANSITORIO          : TInterCampo;


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


constructor TCrprodbca.Create( AOwner : TComponent ); 
begin Inherited;

      CatAreaNeg := TCrcatarne.Create(Self);
      CatAreaNeg.MasterSource := Self;
      CatAreaNeg.FieldByName('CVE_AREA_NEGOCIO').MasterField := 'CVE_AREA_NEGOCIO';

      CrGpoPBca := TCrGpoPBca.Create(Self);
      CrGpoPBca.MasterSource := Self;
      CrGpoPBca.FieldByName('CVE_GPO_PRODUCTO_BCA').MasterField := 'CVE_GPO_PRODUCTO_BCA';

      CVE_PRODUCTO_BCA :=CreaCampo('CVE_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_BCA.Caption:='Clave Producto Bca';

      DESC_C_PRODUCTO :=CreaCampo('DESC_C_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                DESC_C_PRODUCTO.Caption:='Desc. C Producto';

      DESC_L_PRODUCTO :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                DESC_L_PRODUCTO.Caption:='Desc. L Producto';

      ESTADO :=CreaCampo('ESTADO',ftString,tsNinguno,tsNinguno,True);
                ESTADO.Caption:='Estado';

      With ESTADO do
            begin Size:=2;
                  UseCombo:=True;
                  ComboLista.Add('0'); ComboDatos.Add('0');
                  ComboLista.Add('1'); ComboDatos.Add('1');
            end;

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave Usu alta';

      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='F. Alta';

      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave Usu Modif.';

      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='F. Modifica';

{      VERSION_REGISTRO :=CreaCampo('VERSION_REGISTRO',ftString,tsNinguno,tsNinguno,True);
                VERSION_REGISTRO.Caption:='Versión Reg.';  }

      CVE_AREA_NEGOCIO :=CreaCampo('CVE_AREA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                CVE_AREA_NEGOCIO.Caption:='Clave Área Neg';

      CVE_GPO_PRODUCTO_BCA :=CreaCampo('CVE_GPO_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_PRODUCTO_BCA.Caption:='Cve Gpo. Prod Banca';

      TX_CLASIFICA_LEGAL :=CreaCampo('TX_CLASIFICA_LEGAL',ftString,tsNinguno,tsNinguno,True);
                TX_CLASIFICA_LEGAL.Caption:='Clasifica Legal';

      TX_REGISTRO_CONTA :=CreaCampo('TX_REGISTRO_CONTA',ftString,tsNinguno,tsNinguno,True);
                TX_REGISTRO_CONTA.Caption:='Registro Conta';

      TX_IMPORTE :=CreaCampo('TX_IMPORTE',ftString,tsNinguno,tsNinguno,True);
                TX_IMPORTE.Caption:='Importe';

      TX_COMISION :=CreaCampo('TX_COMISION',ftString,tsNinguno,tsNinguno,True);
                TX_COMISION.Caption:='Comisión';

      TX_TASA_INT_ORD :=CreaCampo('TX_TASA_INT_ORD',ftString,tsNinguno,tsNinguno,True);
                TX_TASA_INT_ORD.Caption:='Tasa Int. Ord';

      TX_TASA_INT_MORA :=CreaCampo('TX_TASA_INT_MORA',ftString,tsNinguno,tsNinguno,True);
                TX_TASA_INT_MORA.Caption:='Tasa Int. Mora';

      TX_PLAZO :=CreaCampo('TX_PLAZO',ftString,tsNinguno,tsNinguno,True);
                TX_PLAZO.Caption:='Plazo';

      TX_DESTINO :=CreaCampo('TX_DESTINO',ftString,tsNinguno,tsNinguno,True);
                TX_DESTINO.Caption:='Destino';

      TX_GARANTIA :=CreaCampo('TX_GARANTIA',ftString,tsNinguno,tsNinguno,True);
                TX_GARANTIA.Caption:='Garantía';

      TX_FUENTE_PAGO :=CreaCampo('TX_FUENTE_PAGO',ftString,tsNinguno,tsNinguno,True);
                TX_FUENTE_PAGO.Caption:='Fuente Pago';

      TX_FORMA_DISP :=CreaCampo('TX_FORMA_DISP',ftString,tsNinguno,tsNinguno,True);
                TX_FORMA_DISP.Caption:='Forma Disp.';

      TX_PAGO_CAPITAL :=CreaCampo('TX_PAGO_CAPITAL',ftString,tsNinguno,tsNinguno,True);
                TX_PAGO_CAPITAL.Caption:='Pago Capital';

      TX_PAGO_INT :=CreaCampo('TX_PAGO_INT',ftString,tsNinguno,tsNinguno,True);
                TX_PAGO_INT.Caption:='Pago Int.';

      TX_PAGO_ANTICIPA :=CreaCampo('TX_PAGO_ANTICIPA',ftString,tsNinguno,tsNinguno,True);
                TX_PAGO_ANTICIPA.Caption:='Pago Anticipa';

      TX_CONDICIONES_INTRUM :=CreaCampo('TX_CONDICIONES_INTRUM',ftString,tsNinguno,tsNinguno,True);
                TX_CONDICIONES_INTRUM.Caption:='Condiciones Intrum';

      TX_CARACTERISTICA :=CreaCampo('TX_CARACTERISTICA',ftString,tsNinguno,tsNinguno,True);
                TX_CARACTERISTICA.Caption:='Característica';

      TX_LINEAMIENTO :=CreaCampo('TX_LINEAMIENTO',ftString,tsNinguno,tsNinguno,True);
                TX_LINEAMIENTO.Caption:='Lineamiento';

      TX_TRANSITORIO :=CreaCampo('TX_TRANSITORIO',ftString,tsNinguno,tsNinguno,True);
                TX_TRANSITORIO.Caption:='Transitorio';


      FKeyFields.Add('CVE_PRODUCTO_BCA');
      TableName := 'CR_PRODUCTO_BCA';
      StpName  := ' '; 
      UseQuery := True; 
      HelpFile := 'IntCrprodbca.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrprodbca.Destroy;
begin
    If CatAreaNeg <> Nil Then
       CatAreaNeg.Free;
inherited;
end;


function TCrprodbca.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrprodbca;
begin
   W:=TWCrprodbca.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrprodbca.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICTPRODBAN.IT','');
      Try if Active then begin
//                               T.Param(0,''+CVE_PRODUCTO_BCA.AsString+'');
      end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrprodbca.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA crprodbca********************)
(*                                                                              *)
(*  FORMA DE crprodbca                                                            *)
(*                                                                              *)
(***********************************************FORMA crprodbca********************)

procedure TWCrprodbca.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Objeto.CVE_PRODUCTO_BCA.Control  := edCveProd;
    Objeto.DESC_C_PRODUCTO.Control  := edDescCorta;
    Objeto.DESC_L_PRODUCTO.Control  := edDescLarga;
    Objeto.CVE_AREA_NEGOCIO.Control  := edCveAneg;
    Objeto.CVE_GPO_PRODUCTO_BCA.Control  := edGpoProdBca;
    Objeto.ESTADO.Control  := rgSITUACION;
    Objeto.CVE_USU_ALTA.Control  := edCVE_USU_ALTA;
    Objeto.F_ALTA.Control  := edF_ALTA;
    Objeto.CVE_USU_MODIFICA.Control  := edCVE_USU_MODIFICA;
    Objeto.F_MODIFICA.Control  := edF_MODIFICA;
//    Objeto.VERSION_REGISTRO.Control  := ;
    Objeto.TX_CLASIFICA_LEGAL.Control  := edClasLegal;
    Objeto.TX_REGISTRO_CONTA.Control  := edRegCont;
    Objeto.TX_IMPORTE.Control  := edImporte;
    Objeto.TX_COMISION.Control  := edComis;
    Objeto.TX_TASA_INT_ORD.Control  := edTasIntOrd;
    Objeto.TX_TASA_INT_MORA.Control  := edTasaIntMor;
    Objeto.TX_PLAZO.Control  := edPlazo;
    Objeto.TX_DESTINO.Control  := edDestino;
    Objeto.TX_GARANTIA.Control  := edGarantia;
    Objeto.TX_FUENTE_PAGO.Control  := edFuenPag;
    Objeto.TX_FORMA_DISP.Control  := edFormaDisp;
    Objeto.TX_PAGO_CAPITAL.Control  := edPagCapit;
    Objeto.TX_PAGO_INT.Control  := edPagInt;
    Objeto.TX_PAGO_ANTICIPA.Control  := edPagAnticip;
    Objeto.TX_CONDICIONES_INTRUM.Control  := edCondIntum;
    Objeto.TX_CARACTERISTICA.Control  := edCaract;
    Objeto.TX_LINEAMIENTO.Control  := edLineamiento;
    Objeto.TX_TRANSITORIO.Control  := edTransit;

    objeto.CatAreaNeg.DESC_AREA_NEGOCIO.Control := edDESC_PRODUCTO1;
    objeto.CrGpoPBca.DESC_L_PRODUCTO.Control := edDESC_GPOPRODBCA;
end;

procedure TWCrprodbca.FormDestroy(Sender: TObject);
begin
    Objeto.CVE_PRODUCTO_BCA.Control  := nil;
    Objeto.DESC_C_PRODUCTO.Control  := nil;
    Objeto.DESC_L_PRODUCTO.Control  := nil;
    Objeto.CVE_AREA_NEGOCIO.Control  := nil;
    Objeto.CVE_GPO_PRODUCTO_BCA.Control  := nil;
    Objeto.ESTADO.Control  := nil;
    Objeto.CVE_USU_ALTA.Control  := nil;
    Objeto.F_ALTA.Control  := nil;
    Objeto.CVE_USU_MODIFICA.Control  := nil;
    Objeto.F_MODIFICA.Control  := nil;
//    Objeto.VERSION_REGISTRO.Control  := nil;
    Objeto.TX_CLASIFICA_LEGAL.Control  := nil;
    Objeto.TX_REGISTRO_CONTA.Control  := nil;
    Objeto.TX_IMPORTE.Control  := nil;
    Objeto.TX_COMISION.Control  := nil;
    Objeto.TX_TASA_INT_ORD.Control  := nil;
    Objeto.TX_TASA_INT_MORA.Control  := nil;
    Objeto.TX_PLAZO.Control  := nil;
    Objeto.TX_DESTINO.Control  := nil;
    Objeto.TX_GARANTIA.Control  := nil;
    Objeto.TX_FUENTE_PAGO.Control  := nil;
    Objeto.TX_FORMA_DISP.Control  := nil;
    Objeto.TX_PAGO_CAPITAL.Control  := nil;
    Objeto.TX_PAGO_INT.Control  := nil;
    Objeto.TX_PAGO_ANTICIPA.Control  := nil;
    Objeto.TX_CONDICIONES_INTRUM.Control  := nil;
    Objeto.TX_CARACTERISTICA.Control  := nil;
    Objeto.TX_LINEAMIENTO.Control  := nil;
    Objeto.TX_TRANSITORIO.Control  := nil;

    Objeto.CatAreaNeg.DESC_AREA_NEGOCIO.Control := nil;
    objeto.CrGpoPBca.DESC_L_PRODUCTO.Control := nil;

end;

procedure TWCrprodbca.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrprodbca.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_ALTA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      edCveProd.SetFocus;
      rgSITUACION.ItemIndex := 0;
end;

procedure TWCrprodbca.InterForma1DespuesModificar(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

//procedure TWCrprodbca.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrprodbca.Button1Click(Sender: TObject);
begin
PageControl1.ActivePageIndex := 2;
end;

procedure TWCrprodbca.InterForma1Buscar(Sender: TObject);
begin
   Objeto.ShowAll := True;
   Objeto.Busca;
end;

procedure TWCrprodbca.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
end;


procedure TWCrprodbca.TabSheet4Show(Sender: TObject);
var   Crrelprod     : TCrrelprod;
begin
if edCveProd.Text <> '' then
  begin
      Crrelprod := TCrrelprod.Create(self);
      Crrelprod.CVE_PRODUCTO_BCA.AsString := Objeto.CVE_PRODUCTO_BCA.AsString;
//      Crrelprod.
      try
      Crrelprod.apli := Objeto.Apli;
      Crrelprod.ParamCre :=Objeto.ParamCre;
      Crrelprod.Catalogo;
      finally
      Crrelprod.Free;
      end;
  end
  else
  begin
  Showmessage('¡ Por favor seleccione un producto de Banca !');
  end;
 PageControl1.ActivePageIndex := 1;
end;

procedure TWCrprodbca.Button2Click(Sender: TObject);
var   Crrelprod     : TCrrelprod;
begin
if edCveProd.Text <> '' then
  begin
      Crrelprod := TCrrelprod.Create(self);
      Crrelprod.CVE_PRODUCTO_BCA.AsString := Objeto.CVE_PRODUCTO_BCA.AsString;
      Crrelprod.DESC_PROD_BCA.AsString :=  Objeto.DESC_C_PRODUCTO.AsString;
      try
      Crrelprod.apli := Objeto.Apli;
      Crrelprod.ParamCre :=Objeto.ParamCre;
      Crrelprod.Catalogo;
      finally
      Crrelprod.Free;
      end;
  end
  else
  begin
  Showmessage('¡ Por favor seleccione un producto de Banca !');
  end;
end;

procedure TWCrprodbca.btPRODUCTOClick(Sender: TObject);
begin
      Objeto.CatAreaNeg.ShowAll := True;
   if Objeto.CatAreaNeg.Busca then
      InterForma1.NextTab(edCveAneg);
end;

procedure TWCrprodbca.BitBtn1Click(Sender: TObject);
begin
      Objeto.CrGpoPBca.ShowAll := True;
   if Objeto.CrGpoPBca.Busca then
      InterForma1.NextTab(edGpoProdBca);
end;

procedure TWCrprodbca.ilAREANEGEjecuta(Sender: TObject);
begin
    If Objeto.CatAreaNeg.FindKey([ilAREANEG.Buffer]) Then Begin
       InterForma1.NextTab(edCveAneg);
    End;
end;

procedure TWCrprodbca.ilAREANEGCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrprodbca.Button3Click(Sender: TObject);
var   Crctroeob     : TCrctroeob;
begin
if edCveProd.Text <> '' then
  begin
      Crctroeob := TCrctroeob.Create(self);
      Crctroeob.CVE_PRODUCTO_BCA.AsString := Objeto.CVE_PRODUCTO_BCA.AsString;
      Crctroeob.DESC_PROD_BCA.AsString :=  Objeto.DESC_C_PRODUCTO.AsString;
      try
      Crctroeob.apli := Objeto.Apli;
      Crctroeob.ParamCre :=Objeto.ParamCre;
      Crctroeob.Catalogo;
      finally
      Crctroeob.Free;
      end;
  end
  else
  begin
  Showmessage('¡ Por favor seleccione un producto de Banca !');
  end;
end;

procedure TWCrprodbca.Button4Click(Sender: TObject);
var   Crbcatipc     : TCrbcatipc;
begin
if edCveProd.Text <> '' then
  begin
      Crbcatipc := TCrbcatipc.Create(self);
      Crbcatipc.CVE_PRODUCTO_BCA.AsString := Objeto.CVE_PRODUCTO_BCA.AsString;
      Crbcatipc.DESC_PROD_BCA.AsString :=  Objeto.DESC_C_PRODUCTO.AsString;
      try
      Crbcatipc.apli := Objeto.Apli;
      Crbcatipc.ParamCre :=Objeto.ParamCre;
      Crbcatipc.Catalogo;
      finally
      Crbcatipc.Free;
      end;
  end
  else
  begin
  Showmessage('¡ Por favor seleccione un producto de Banca !');
  end;
end;

procedure TWCrprodbca.ilGpoProdBcaCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrprodbca.ilGpoProdBcaEjecuta(Sender: TObject);
begin
    If Objeto.CrGpoPBca.FindKey([ilGpoProdBca.Buffer]) Then Begin
       InterForma1.NextTab(edGpoProdBca);
    End;
end;

end.
