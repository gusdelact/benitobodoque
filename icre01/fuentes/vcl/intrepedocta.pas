// Sistema         : Clase de REPORTE DEPOSITO REFERENCIADO
// Función forma   : Clase de REPORTE DEPOSITO REFERENCIADO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : ALICIA MAYA
// Comentarios     :
Unit IntRepEdoCta;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntDiCliente, uncondi;

Type
 TRepDepRef= class;

  TWRepDepRef=Class(TForm)
    InterForma1             : TInterForma;
    Fecha: TLabel;
    edFecha: TEdit;
    cbManual: TCheckBox;
    rgFiltro: TRadioGroup;
    edFiltro: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TRepDepRef;
end; 
 TRepDepRef= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;
Uses QRRepEdoCta;

{$R *.DFM}


constructor TRepDepRef.Create( AOwner : TComponent ); 
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False;
      HelpFile := 'IntRepDepRef.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TRepDepRef.Destroy;
begin inherited;
end;


function TRepDepRef.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWRepDepRef;
begin
   W:=TWRepDepRef.Create(Self);
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


Function TRepDepRef.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IRepDepRef.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TRepDepRef.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA REP_SIAC********************)
(*                                                                              *)
(*  FORMA DE REP_SIAC                                                            *)
(*                                                                              *)
(***********************************************FORMA REP_SIAC********************)

procedure TWRepDepRef.FormShow(Sender: TObject);
begin
    edFecha.Text:=FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa - 1);
end;

procedure TWRepDepRef.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWRepDepRef.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWRepDepRef.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWRepDepRef.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


procedure TWRepDepRef.InterForma1Imprimir(Sender: TObject);
var sFiltro: String;
begin
   if (rgFiltro.ItemIndex> -1) and (edFiltro.Text='') 
   then ShowMessage('Faltan datos para el filtro. Verifique.')
   else 
   begin 
     sFiltro:='';
     if rgFiltro.ItemIndex=0 then sFiltro:=' AND CR.ID_CREDITO IN ('+edFiltro.Text+')';
     if rgFiltro.ItemIndex=1 then sFiltro:=' AND C.ID_TITULAR  IN ('+edFiltro.Text+')';
     Rpt_CartaDepRef(Objeto,DateToStr(Objeto.Apli.DameFechaEmpresa - 1),SFiltro,False,cbManual.Checked);
   end;
   //Rpt_CartaDepRef(Objeto,edFecha.Text,False);
end;

procedure TWRepDepRef.InterForma1Preview(Sender: TObject);
var sFiltro: String;
begin
   if (rgFiltro.ItemIndex> -1) and (edFiltro.Text='') 
   then ShowMessage('Faltan datos para el filtro. Verifique.')
   else 
   begin 
     sFiltro:='';
     if rgFiltro.ItemIndex=0 then sFiltro:=' AND CR.ID_CREDITO IN ('+edFiltro.Text+')';
     if rgFiltro.ItemIndex=1 then sFiltro:=' AND C.ID_TITULAR  IN ('+edFiltro.Text+')';
     Rpt_CartaDepRef(Objeto,DateToStr(Objeto.Apli.DameFechaEmpresa - 1),SFiltro,true,cbManual.Checked);
   end;
//   Rpt_CartaDepRef(Objeto,edFecha.Text,True);
end;

end.
