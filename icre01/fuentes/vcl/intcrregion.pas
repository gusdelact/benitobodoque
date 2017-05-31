// Sistema         : Clase de CR_REGION
// Fecha de Inicio : 08/03/2012
// Función forma   : Clase de CR_REGION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrRegion;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrRegion= class; 

  TWCrRegion=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_REGION : TLabel; 
    edID_REGION : TEdit;
    lbDESC_REGION : TLabel;
    edDESC_REGION : TEdit;
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
    rgSIT_REGION: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
      function  obtFolio : integer; 
    public 
    { Public declarations } 
    Objeto : TCrRegion;
end; 
 TCrRegion= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_REGION                : TInterCampo;
        DESC_REGION              : TInterCampo;
        FH_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_REGION               : TInterCampo;
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


constructor TCrRegion.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_REGION :=CreaCampo('ID_REGION',ftFloat,tsNinguno,tsNinguno,True);
                ID_REGION.Caption:='Número de Region';
      DESC_REGION :=CreaCampo('DESC_REGION',ftString,tsNinguno,tsNinguno,True);
                DESC_REGION.Caption:='DESC_REGION';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      SIT_REGION :=CreaCampo('SIT_REGION',ftString,tsNinguno,tsNinguno,True);
      With SIT_REGION do
      begin Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');    ComboDatos.Add('AC');
        ComboLista.Add('1');    ComboDatos.Add('IN');
      end;

      FKeyFields.Add('ID_REGION');

      TableName := 'CR_REGION'; 
      UseQuery := True; 
      HelpFile := 'IntCrRegion.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrRegion.Destroy;
begin inherited;
end;


function TCrRegion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRegion;
begin
   W:=TWCrRegion.Create(Self);
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


Function TCrRegion.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrRegio.it','F');
      Try if Active then begin T.Param(0,ID_REGION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrRegion.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_REGION********************)
(*                                                                              *)
(*  FORMA DE CR_REGION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REGION********************)

procedure TWCrRegion.FormShow(Sender: TObject);
begin
      Objeto.ID_REGION.Control:=edID_REGION;
      Objeto.DESC_REGION.Control:=edDESC_REGION;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.SIT_REGION.Control:=rgSIT_REGION;
end;

procedure TWCrRegion.FormDestroy(Sender: TObject);
begin
      Objeto.ID_REGION.Control:=nil;
      Objeto.DESC_REGION.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SIT_REGION.Control:=nil;
   //Objeto
end;

procedure TWCrRegion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRegion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
  edID_REGION.text := IntToStr(obtFolio);
  rgSIT_REGION.ItemIndex := 0;
end;

procedure TWCrRegion.InterForma1DespuesModificar(Sender: TObject);
begin
//<<Control>>.SetFocus;
end;

//procedure TWCrRegion.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


function TWCrRegion.obtFolio: integer;
var
  resultado : integer;
  strQuery : String;
begin
  strQuery := 'select nvl(max(id_region),0) + 1 FOLIO from CR_REGION';

  GetSQLInt(strQuery, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FOLIO', resultado, True );
  Result := resultado;
end;

procedure TWCrRegion.InterForma1AntesAceptar(Sender: TObject;
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
