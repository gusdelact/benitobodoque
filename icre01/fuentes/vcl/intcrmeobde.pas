// Sistema         : Clase de CR_MERCADO_OBJ_DET
// Fecha de Inicio : 08/03/2012
// Función forma   : Clase de CR_MERCADO_OBJ_DET
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrMeObDe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre,
///
IntCrMercObj, IntLinkit
;

Type
 TCrMeObDe= class;

  TWCrMercadoObjDet=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_MERCADO : TLabel; 
    edCVE_MERCADO : TEdit;
    edID_SUB_MERC: TEdit;
    lbDESC_SUB_MERC : TLabel; 
    edDESC_SUB_MERC : TEdit;
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
    rgSIT_MERC_DET: TRadioGroup;
    btCVE_MERCADO: TBitBtn;
    edDESC_MERCADO: TEdit;
    Label1: TLabel;
    ilkCVE_MERCADO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_MERCADOClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilkCVE_MERCADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilkCVE_MERCADOEjecuta(Sender: TObject);
    private 
    { Private declarations }

      function  obtFolio : Integer; 
    public 
    { Public declarations } 
    Objeto : TCrMeObDe;
end; 
 TCrMeObDe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_MERCADO              : TInterCampo;
        ID_SUB_MERC             : TInterCampo;
        DESC_SUB_MERC            : TInterCampo;
        SIT_MERC_DET             : TInterCampo;
        FH_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        ParamCre                 : TParamCre;

        CrMercObj                : TCrMercObj;

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


constructor TCrMeObDe.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_MERCADO :=CreaCampo('CVE_MERCADO',ftString,tsNinguno,tsNinguno,True);
                CVE_MERCADO.Caption:='Clave de Mercado';
      ID_SUB_MERC :=CreaCampo('ID_SUB_MERC',ftFloat,tsNinguno,tsNinguno,True);
                ID_SUB_MERC.Caption:='Sub Mercado';
      DESC_SUB_MERC :=CreaCampo('DESC_SUB_MERC',ftString,tsNinguno,tsNinguno,True);
                DESC_SUB_MERC.Caption:='Descripción Sub Merc';
      SIT_MERC_DET :=CreaCampo('SIT_MERC_DET',ftString,tsNinguno,tsNinguno,True);
      With SIT_MERC_DET do
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
      FKeyFields.Add('ID_SUB_MERC');

      TableName := 'ADMIPROD.CR_MERCADO_OBJ_DET';
      UseQuery := True;
      HelpFile := 'IntCrMeObDe.Hlp';
      ShowMenuReporte:=True;

      CrMercObj := TCrMercObj.Create(Self);
      CrMercObj.MasterSource:=Self;
      CrMercObj.FieldByName('CVE_MERCADO').MasterField:='CVE_MERCADO';

end;

Destructor TCrMeObDe.Destroy;
begin
     if CrMercObj <> nil then
        CrMercObj.free;
        
inherited;
end;


function TCrMeObDe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMercadoObjDet;
begin
   W:=TWCrMercadoObjDet.Create(Self);
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


Function TCrMeObDe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMeObDet.it','S,F');
      Try if Active then begin T.Param(0,CVE_MERCADO.AsString); 
                               T.Param(1,ID_SUB_MERC.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrMeObDe.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MERCADO_OBJ_DET********************)
(*                                                                              *)
(*  FORMA DE CR_MERCADO_OBJ_DET                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MERCADO_OBJ_DET********************)

procedure TWCrMercadoObjDet.FormShow(Sender: TObject);
begin
      Objeto.CVE_MERCADO.Control:=edCVE_MERCADO;
      Objeto.ID_SUB_MERC.Control:=edID_SUB_MERC;
      Objeto.DESC_SUB_MERC.Control:=edDESC_SUB_MERC;
      Objeto.SIT_MERC_DET.Control:=rgSIT_MERC_DET;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Objeto.CrMercObj.CVE_MERCADO.Control := edCVE_MERCADO;
      Objeto.CrMercObj.DESC_MERCADO.Control := edDESC_MERCADO;
      Objeto.CrMercObj.GetParams(Objeto);

end;

procedure TWCrMercadoObjDet.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_MERCADO.Control:=nil;
      Objeto.ID_SUB_MERC.Control:=nil;
      Objeto.DESC_SUB_MERC.Control:=nil;
      Objeto.SIT_MERC_DET.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWCrMercadoObjDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMercadoObjDet.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
  edID_SUB_MERC.text := IntToStr(obtFolio);
  rgSIT_MERC_DET.ItemIndex := 0;
end;

procedure TWCrMercadoObjDet.InterForma1DespuesModificar(Sender: TObject);
begin
//<<Control>>.SetFocus;
end;

//procedure TWCrMercadoObjDet.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrMercadoObjDet.btCVE_MERCADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMEOBDE_MERCA',True,True) then
   begin
      if objeto.CrMercObj.Busca then
        InterForma1.NextTab(edCVE_MERCADO);
   end;
end;

function TWCrMercadoObjDet.obtFolio: Integer;
var
  resultado : integer;
  strQuery : String;
begin
  strQuery := 'select nvl(max(ID_SUB_MERC),0) + 1 FOLIO from ADMIPROD.CR_MERCADO_OBJ_DET';

  GetSQLInt(strQuery, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FOLIO', resultado, True );
  Result := resultado;
end;

procedure TWCrMercadoObjDet.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrMercadoObjDet.ilkCVE_MERCADOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=(InterForma1.CanEdit);
end;

procedure TWCrMercadoObjDet.ilkCVE_MERCADOEjecuta(Sender: TObject);
begin
   if Objeto.FindKey([ilkCVE_MERCADO.Buffer]) then
      InterForma1.NextTab(edCVE_MERCADO);
end;

end.
