// Sistema         : Clase de CR_CB_ARCHIVO
// Fecha de Inicio : 18/10/2005
// Función forma   : Clase de CR_CB_ARCHIVO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrCbArchi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrCbArchi= class; 

  TWCrCbArchivo=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_ARCHIVO : TLabel; 
    edID_ARCHIVO : TEdit;
    lbCVE_ANEXO : TLabel; 
    edCVE_ANEXO : TEdit;
    lbF_ARCHIVO : TLabel; 
    dtpF_ARCHIVO : TInterDateTimePicker; 
    edF_ARCHIVO : TEdit;
    lbTX_NOM_ARCHIVO : TLabel; 
    edTX_NOM_ARCHIVO : TEdit;
    lbTX_ARC_CONTENIDO : TLabel;
    lbSIT_ARCHIVO : TLabel; 
    edSIT_ARCHIVO : TEdit;
    edTX_ARC_CONTENIDO: TMemo;
    lbIMP_TOTAL_ARC: TLabel;
    edIMP_TOTAL_ARC: TEdit;
    lbIMP_TOTAL_IVA: TLabel;
    edIMP_TOTAL_IVA: TEdit;
    lbNUM_REGISTRO: TLabel;
    edNUM_REGISTRO: TEdit;
    lbNUM_ENVIO: TLabel;
    edNUM_ENVIO: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCbArchi;
end; 
 TCrCbArchi= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_ARCHIVO               : TInterCampo;
        CVE_ANEXO                : TInterCampo;
        F_ARCHIVO                : TInterCampo;
        TX_NOM_ARCHIVO           : TInterCampo;
        TX_ARC_CONTENIDO         : TInterCampo;
        SIT_ARCHIVO              : TInterCampo;
        IMP_TOTAL_ARC            : TInterCampo;
        IMP_TOTAL_IVA            : TInterCampo;
        NUM_REGISTRO             : TInterCampo;
        NUM_ENVIO                : TInterCampo;
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


constructor TCrCbArchi.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_ARCHIVO :=CreaCampo('ID_ARCHIVO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ARCHIVO.Caption:='Número de Archivo';
      CVE_ANEXO :=CreaCampo('CVE_ANEXO',ftString,tsNinguno,tsNinguno,True);
                CVE_ANEXO.Caption:='Clave de Anexo';
      F_ARCHIVO :=CreaCampo('F_ARCHIVO',ftDate,tsNinguno,tsNinguno,True);
                F_ARCHIVO.Caption:='Fecha Archivo';
      TX_NOM_ARCHIVO :=CreaCampo('TX_NOM_ARCHIVO',ftString,tsNinguno,tsNinguno,True);
                TX_NOM_ARCHIVO.Caption:='Nombre Archivo';
      TX_ARC_CONTENIDO :=CreaCampo('TX_ARC_CONTENIDO',ftString,tsNinguno,tsNinguno,True);
                TX_ARC_CONTENIDO.Caption:='Arc Contenido';
      SIT_ARCHIVO :=CreaCampo('SIT_ARCHIVO',ftString,tsNinguno,tsNinguno,True);
                SIT_ARCHIVO.Caption:='Situación Archivo';

      //
      IMP_TOTAL_ARC := CreaCampo('IMP_TOTAL_ARC', ftFloat, tsNinguno, tsNinguno, True);
      IMP_TOTAL_IVA := CreaCampo('IMP_TOTAL_IVA', ftFloat, tsNinguno, tsNinguno, True);
      NUM_REGISTRO  := CreaCampo('NUM_REGISTRO',  ftFloat, tsNinguno, tsNinguno, True);
      NUM_ENVIO     := CreaCampo('NUM_ENVIO',     ftFloat, tsNinguno, tsNinguno, True);
      //
      IMP_TOTAL_ARC.Caption := 'Imp Total Arc';
      IMP_TOTAL_IVA.Caption := 'Imp Total Iva';
      NUM_REGISTRO.Caption  := 'Número Registro';
      NUM_ENVIO.Caption     := 'Número Envio';






      FKeyFields.Add('ID_ARCHIVO');

      TableName := 'CR_CB_ARCHIVO'; 
      UseQuery := True; 
      HelpFile := 'IntCrCbArchi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCbArchi.Destroy;
begin inherited;
end;


function TCrCbArchi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCbArchivo;
begin
   W:=TWCrCbArchivo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCbArchi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCbArc.it','F');
      Try if Active then begin T.Param(0,ID_ARCHIVO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrCbArchi.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CB_ARCHIVO********************)
(*                                                                              *)
(*  FORMA DE CR_CB_ARCHIVO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CB_ARCHIVO********************)

procedure TWCrCbArchivo.FormShow(Sender: TObject);
begin
      Objeto.ID_ARCHIVO.Control:=edID_ARCHIVO;
      Objeto.CVE_ANEXO.Control:=edCVE_ANEXO;
      Objeto.F_ARCHIVO.Control:=edF_ARCHIVO;
      Objeto.TX_NOM_ARCHIVO.Control:=edTX_NOM_ARCHIVO;
      Objeto.TX_ARC_CONTENIDO.Control:=edTX_ARC_CONTENIDO;
      Objeto.SIT_ARCHIVO.Control:=edSIT_ARCHIVO;

      Objeto.IMP_TOTAL_ARC.Control:=edIMP_TOTAL_ARC;
      Objeto.IMP_TOTAL_IVA.Control:=edIMP_TOTAL_IVA;
      Objeto.NUM_REGISTRO.Control:=edNUM_REGISTRO;
      Objeto.NUM_ENVIO.Control:=edNUM_ENVIO;

end;

procedure TWCrCbArchivo.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ARCHIVO.Control:=nil;
      Objeto.CVE_ANEXO.Control:=nil;
      Objeto.F_ARCHIVO.Control:=nil;
      Objeto.TX_NOM_ARCHIVO.Control:=nil;
      Objeto.TX_ARC_CONTENIDO.Control:=nil;
      Objeto.SIT_ARCHIVO.Control:=nil;

      Objeto.IMP_TOTAL_ARC.Control:=nil;
      Objeto.IMP_TOTAL_IVA.Control:=nil;
      Objeto.NUM_REGISTRO.Control:=nil;
      Objeto.NUM_ENVIO.Control:=nil;
end;

procedure TWCrCbArchivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCbArchivo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCbArchivo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCbArchivo.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
