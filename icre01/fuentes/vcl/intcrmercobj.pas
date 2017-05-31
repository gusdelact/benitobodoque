// Sistema         : Clase de CR_MERCADO_OBJ
// Fecha de Inicio : 08/03/2012
// Función forma   : Clase de CR_MERCADO_OBJ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrMercObj;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrMercObj= class; 

  TWCrMercadoObj=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_MERCADO : TLabel; 
    edCVE_MERCADO : TEdit;
    lbDESC_MERCADO : TLabel; 
    edDESC_MERCADO : TEdit;
    lbFH_ALTA : TLabel;
    dtpFH_ALTA : TInterDateTimePicker; 
    edFH_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel; 
    edCVE_USU_ALTA : TEdit;
    lbFH_MODIFICA : TLabel;
    dtpFH_MODIFICA : TInterDateTimePicker; 
    edFH_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel; 
    edCVE_USU_MODIFICA : TEdit;
    rgSIT_MERC_OBJ: TRadioGroup;
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
    Objeto : TCrMercObj;
end; 
 TCrMercObj= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_MERCADO              : TInterCampo;
        DESC_MERCADO             : TInterCampo;
        SIT_MERC_OBJ             : TInterCampo;
        FH_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
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


constructor TCrMercObj.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_MERCADO :=CreaCampo('CVE_MERCADO',ftString,tsNinguno,tsNinguno,True);
                CVE_MERCADO.Caption:='Clave de Mercado';
      DESC_MERCADO :=CreaCampo('DESC_MERCADO',ftString,tsNinguno,tsNinguno,True);
                DESC_MERCADO.Caption:='Descripción Mercado';
      SIT_MERC_OBJ :=CreaCampo('SIT_MERC_OBJ',ftString,tsNinguno,tsNinguno,True);
      With SIT_MERC_OBJ do
      begin Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');    ComboDatos.Add('AC');
        ComboLista.Add('1');    ComboDatos.Add('IN');
      end;
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('CVE_MERCADO');

      TableName := 'ADMIPROD.CR_MERCADO_OBJ'; 
      UseQuery := True; 
      HelpFile := 'IntCrMercObj.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMercObj.Destroy;
begin inherited;
end;


function TCrMercObj.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMercadoObj;
begin
   W:=TWCrMercadoObj.Create(Self);
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


Function TCrMercObj.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrMeOb.it','S');
      Try if Active then begin T.Param(0,CVE_MERCADO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrMercObj.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_MERCADO_OBJ********************)
(*                                                                              *)
(*  FORMA DE CR_MERCADO_OBJ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MERCADO_OBJ********************)

procedure TWCrMercadoObj.FormShow(Sender: TObject);
begin
      Objeto.CVE_MERCADO.Control:=edCVE_MERCADO;
      Objeto.DESC_MERCADO.Control:=edDESC_MERCADO;
      Objeto.SIT_MERC_OBJ.Control:=rgSIT_MERC_OBJ;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
end;

procedure TWCrMercadoObj.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_MERCADO.Control:=nil;
      Objeto.DESC_MERCADO.Control:=nil;
      Objeto.SIT_MERC_OBJ.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWCrMercadoObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMercadoObj.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
  rgSIT_MERC_OBJ.ItemIndex := 0;
end;

procedure TWCrMercadoObj.InterForma1DespuesModificar(Sender: TObject);
begin
//<<Control>>.SetFocus;
end;

//procedure TWCrMercadoObj.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrMercadoObj.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
   begin
      if IsNewData then
      begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            CVE_USU_ALTA.AsString := DameUsuario;
            FH_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end else
      begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            FH_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   end;
end;

end.
