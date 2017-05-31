// Sistema         : Clase de CR_CAT_TIP_AVAL_BC
// Fecha de Inicio : 06/10/2015
// Función forma   : Clase de CR_CAT_TIP_AVAL_BC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntCrCaTiAB;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntGenCre,
IntParamCre
;

Type
 TCrCaTiAB= class;

  TWCrCatTipAvalBc=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_AVAL: TLabel;
    edCVE_AVAL: TEdit;
    lbDESC_TIPO_AVAL : TLabel;
    edDESC_TIPO_AVAL: TEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edFH_ALTA: TEdit;
    edFH_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSIT_AVAL: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure rgSIT_AVALExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCaTiAB;
end; 
 TCrCaTiAB= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_AVAL           : TInterCampo;
        DESC_TIPO_AVAL     : TInterCampo;
        SIT_AVAL           : TInterCampo;
        FH_ALTA            : TInterCampo;
        CVE_USU_ALTA       : TInterCampo;
        FH_MODIFICA        : TInterCampo;
        CVE_USU_MODIFICA   : TInterCampo;

        ParamCre            : TParamCre;

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


constructor TCrCaTiAB.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_AVAL :=CreaCampo('CVE_AVAL',ftFloat,tsNinguno,tsNinguno,True);
                CVE_AVAL.Caption:='Número de Aval';
      DESC_TIPO_AVAL :=CreaCampo('DESC_TIPO_AVAL',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_AVAL.Caption:='Tipo Aval';

      SIT_AVAL :=CreaCampo('SIT_AVAL',ftString,tsNinguno,tsNinguno,True);
         With SIT_AVAL do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('IN');
          end;
                SIT_AVAL.Caption:='Situación del Aval';

      FH_ALTA :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('CVE_AVAL');

      TableName := 'CR_CAT_TIP_AVAL_BC';
      UseQuery := True;
      HelpFile := 'InTCrCaTiAB.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCaTiAB.Destroy;
begin inherited;
end;


function TCrCaTiAB.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCatTipAvalBc;
begin
   W:=TWCrCatTipAvalBc.Create(Self);
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


Function TCrCaTiAB.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICRCTAB.IT','F');
      Try if Active then begin T.Param(0,CVE_AVAL.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrCaTiAB.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA BC_GPO_CATALOGO********************)
(*                                                                              *)
(*  FORMA DE BC_GPO_CATALOGO                                                            *)
(*                                                                              *)
(***********************************************FORMA BC_GPO_CATALOGO********************)

procedure TWCrCatTipAvalBc.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Interforma1.MsgPanel := MsgPanel;

      Objeto.CVE_AVAL.Control:=edCVE_AVAL;
      Objeto.DESC_TIPO_AVAL.Control:=edDESC_TIPO_AVAL;
      Objeto.SIT_AVAL.Control:=rgSIT_AVAL;

      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
end;

procedure TWCrCatTipAvalBc.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AVAL.Control:=nil;
      Objeto.DESC_TIPO_AVAL.Control:=nil;
      Objeto.SIT_AVAL.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;

      Interforma1.MsgPanel := Nil;

   //Objeto
end;

procedure TWCrCatTipAvalBc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCatTipAvalBc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
       rgSIT_AVAL.ItemIndex := 0;
end;

procedure TWCrCatTipAvalBc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCatTipAvalBc.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWCrCatTipAvalBc.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if IsNewData then
  begin
      Objeto.CVE_USU_ALTA.AsString:=Objeto.Apli.Usuario;
      Objeto.FH_ALTA.AsDateTime:= Objeto.Apli.SysDateTime;
  end
  else
  begin
      Objeto.CVE_USU_MODIFICA.AsString:=Objeto.Apli.Usuario;
      Objeto.FH_MODIFICA.AsDateTime:= Objeto.Apli.SysDateTime;
  end;
  Realizado := True;
end;

procedure TWCrCatTipAvalBc.rgSIT_AVALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_AVAL,True,'',True);
end;

end.
