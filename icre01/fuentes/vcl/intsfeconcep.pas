// Sistema         : Clase de SFE_CONCEPTO
// Fecha de Inicio : 27/11/2009
// Función forma   : Clase de SFE_CONCEPTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntSfeConcep;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

Type
 TSfeConcep= class; 

  TWSfeConcepto=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbSERIE_RECIBO: TLabel;
    edSERIE_RECIBO: TEdit;
    GroupBox1: TGroupBox;
    lbID_CESION: TLabel;
    lbID_DOCUMENTO: TLabel;
    edID_CESION: TEdit;
    edID_DOCUMENTO: TEdit;
    lbCANTIDAD: TLabel;
    edCANTIDAD: TEdit;
    edTXT_LEYENDA_1: TEdit;
    edTXT_LEYENDA_2: TEdit;
    edTXT_LEYENDA_3: TEdit;
    edTXT_LEYENDA_4: TEdit;
    edTXT_DATO_1: TEdit;
    edTXT_DATO_2: TEdit;
    edTXT_DATO_3: TEdit;
    edTXT_DATO_4: TEdit;
    Label1: TLabel;
    IEUnidad: TInterEdit;
    LUnidad: TLabel;
    LIMP_UNITARIO: TLabel;
    IEIMP_UNITARIO: TInterEdit;
    LIMP_TOTAL: TLabel;
    IEIMP_TOTAL: TInterEdit;
    Lclave: TLabel;
    IEClave: TInterEdit;
    IEDESCRIPCION: TInterEdit;
    LDESCRIPCION: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TSfeConcep;
end; 
 TSfeConcep= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        ParamCre                 : TParamCre;

        { Public declarations } 
        SERIE_RECIBO             : TInterCampo;
        ID_CESION                : TInterCampo;
        ID_DOCUMENTO             : TInterCampo;
        CANTIDAD                 : TInterCampo;
        TXT_LEYENDA_1            : TInterCampo;
        TXT_LEYENDA_2            : TInterCampo;
        TXT_LEYENDA_3            : TInterCampo;
        TXT_LEYENDA_4            : TInterCampo;
        TXT_DATO_1               : TInterCampo;
        TXT_DATO_2               : TInterCampo;
        TXT_DATO_3               : TInterCampo;
        TXT_DATO_4               : TInterCampo;
        //24Ene2014 HCF
        UNIDAD                   : TInterCampo;//, VARCHAR2(20),
        CLAVE                    : TInterCampo;//, VARCHAR2(10),
        DESCRIPCION              : TInterCampo;//, VARCHAR2(1024),
        IMP_UNITARIO             : TInterCampo;//, NUMBER(16,2),
        IMP_TOTAL                : TInterCampo;//, NUMBER(16,2)
       //24Ene2014 HCF

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


constructor TSfeConcep.Create( AOwner : TComponent ); 
begin Inherited; 
      SERIE_RECIBO :=CreaCampo('SERIE_RECIBO',ftString,tsNinguno,tsNinguno,True);
                SERIE_RECIBO.Caption:='Serie Recibo';
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Número de Cesion';
      ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                ID_DOCUMENTO.Caption:='Número de Documento';
      CANTIDAD :=CreaCampo('CANTIDAD',ftFloat,tsNinguno,tsNinguno,True);
                CANTIDAD.Caption:='Cantidad';
      TXT_LEYENDA_1 :=CreaCampo('TXT_LEYENDA_1',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_1.Caption:='Txt Leyenda 1';
      TXT_LEYENDA_2 :=CreaCampo('TXT_LEYENDA_2',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_2.Caption:='Txt Leyenda 2';
      TXT_LEYENDA_3 :=CreaCampo('TXT_LEYENDA_3',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_3.Caption:='Txt Leyenda 3';
      TXT_LEYENDA_4 :=CreaCampo('TXT_LEYENDA_4',ftString,tsNinguno,tsNinguno,True);
                TXT_LEYENDA_4.Caption:='Txt Leyenda 4';
      TXT_DATO_1 :=CreaCampo('TXT_DATO_1',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_1.Caption:='Txt Dato 1';
      TXT_DATO_2 :=CreaCampo('TXT_DATO_2',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_2.Caption:='Txt Dato 2';
      TXT_DATO_3 :=CreaCampo('TXT_DATO_3',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_3.Caption:='Txt Dato 3';
      TXT_DATO_4 :=CreaCampo('TXT_DATO_4',ftString,tsNinguno,tsNinguno,True);
                TXT_DATO_4.Caption:='Txt Dato 4';
      //24Ene2014 HCF
      UNIDAD       :=CreaCampo('UNIDAD',ftString,tsNinguno,tsNinguno,True);
                   UNIDAD.Caption:='Unidad';                 //: TInterCampo;//, VARCHAR2(20),
      CLAVE        :=CreaCampo('CLAVE',ftString,tsNinguno,tsNinguno,True);
                   CLAVE.Caption:='Clave';                   //: TInterCampo;//, VARCHAR2(10),
      DESCRIPCION  :=CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
                   DESCRIPCION.Caption:='Descripción';       //: TInterCampo;//, VARCHAR2(1024),
      IMP_UNITARIO :=CreaCampo('IMP_UNITARIO',ftFloat,tsNinguno,tsNinguno,True);
                   IMP_UNITARIO.Caption:='Importe unitario'; //: TInterCampo;//, NUMBER(16,2),
      IMP_TOTAL    :=CreaCampo('IMP_TOTAL',ftFloat,tsNinguno,tsNinguno,True);
                   IMP_TOTAL.Caption:='Importe total';       //: TInterCampo;//, NUMBER(16,2)
      //24Ene2014 HCF
      FKeyFields.Add('SERIE_RECIBO');
      FKeyFields.Add('ID_CESION');
      FKeyFields.Add('ID_DOCUMENTO');

      TableName := 'ADMIPROD.SFE_CONCEPTO';
      UseQuery := True;
      HelpFile := 'IntSfeConcep.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSfeConcep.Destroy;
begin inherited;
end;


function TSfeConcep.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSfeConcepto;
begin
   W:=TWSfeConcepto.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnAceptar := False;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnCancelar := False;
      W.InterForma1.ShowBtnBuscar := False;             
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TSfeConcep.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ISfeConc.it','S,F,S');
      Try if Active then begin T.Param(0,SERIE_RECIBO.AsString); 
                               T.Param(1,ID_CESION.AsString); 
                               T.Param(2,ID_DOCUMENTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TSfeConcep.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA SFE_CONCEPTO********************)
(*                                                                              *)
(*  FORMA DE SFE_CONCEPTO                                                            *)
(*                                                                              *)
(***********************************************FORMA SFE_CONCEPTO********************)

procedure TWSfeConcepto.FormShow(Sender: TObject);
begin


      Objeto.SERIE_RECIBO.Control:=edSERIE_RECIBO;
      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.ID_DOCUMENTO.Control:=edID_DOCUMENTO;
      Objeto.CANTIDAD.Control:=edCANTIDAD;
      Objeto.TXT_LEYENDA_1.Control:=edTXT_LEYENDA_1;
      Objeto.TXT_LEYENDA_2.Control:=edTXT_LEYENDA_2;
      Objeto.TXT_LEYENDA_3.Control:=edTXT_LEYENDA_3;
      Objeto.TXT_LEYENDA_4.Control:=edTXT_LEYENDA_4;
      Objeto.TXT_DATO_1.Control:=edTXT_DATO_1;
      Objeto.TXT_DATO_2.Control:=edTXT_DATO_2;
      Objeto.TXT_DATO_3.Control:=edTXT_DATO_3;
      Objeto.TXT_DATO_4.Control:=edTXT_DATO_4;
      //24Ene2014 HCF
      Objeto.UNIDAD.Control      :=IEUnidad;      //: TInterCampo;//, VARCHAR2(20),
      Objeto.CLAVE.Control       :=IEClave;       //: TInterCampo;//, VARCHAR2(10),
      Objeto.DESCRIPCION.Control :=IEDESCRIPCION; //: TInterCampo;//, VARCHAR2(1024),
      Objeto.IMP_UNITARIO.Control:=IEIMP_UNITARIO;//: TInterCampo;//, NUMBER(16,2),
      Objeto.IMP_TOTAL.Control   :=IEIMP_TOTAL;   //: TInterCampo;//, NUMBER(16,2)
     //24Ene2014 HCF
end;

procedure TWSfeConcepto.FormDestroy(Sender: TObject);
begin
      Objeto.SERIE_RECIBO.Control:=nil;
      Objeto.ID_CESION.Control:=nil;
      Objeto.ID_DOCUMENTO.Control:=nil;
      Objeto.CANTIDAD.Control:=nil;
      Objeto.TXT_LEYENDA_1.Control:=nil;
      Objeto.TXT_LEYENDA_2.Control:=nil;
      Objeto.TXT_LEYENDA_3.Control:=nil;
      Objeto.TXT_LEYENDA_4.Control:=nil;
      Objeto.TXT_DATO_1.Control:=nil;
      Objeto.TXT_DATO_2.Control:=nil;
      Objeto.TXT_DATO_3.Control:=nil;
      Objeto.TXT_DATO_4.Control:=nil;
      //24Ene2014 HCF
      Objeto.UNIDAD.Control:=nil;      //: TInterCampo;//, VARCHAR2(20),
      Objeto.CLAVE.Control:=nil;       //: TInterCampo;//, VARCHAR2(10),
      Objeto.DESCRIPCION.Control:=nil; //: TInterCampo;//, VARCHAR2(1024),
      Objeto.IMP_UNITARIO.Control:=nil;//: TInterCampo;//, NUMBER(16,2),
      Objeto.IMP_TOTAL.Control:=nil;   //: TInterCampo;//, NUMBER(16,2)
     //24Ene2014 HCF
   //Objeto
end;

procedure TWSfeConcepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSfeConcepto.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWSfeConcepto.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSfeConcepto.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
