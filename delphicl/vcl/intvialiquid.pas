// Sistema         : Clase de VIA_LIQUIDACION
// Fecha de Inicio : 26/03/1998
// Función forma   : Clase de VIA_LIQUIDACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Del Carmen Arriaga Cardenas
// Comentarios     :
Unit IntViaLiquid;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntInter, //, UnRepViaLiq,  MZC 4/NOV/99 SE COMENTARIZO PORQUE NO ESTABA MIGRADO A LA FECHA EL SISTEMA DE TESORERIA AUTORIZO R. ARRIAGA
UnSegBtn;

Type
 TViaLiquid= class;

  TWViaLiquidacion=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_VIA_LIQCION : TLabel;
    edCVE_VIA_LIQCION : TEdit;
    lbDESC_SISTEMA_LIQ : TLabel;
    edDESC_SISTEMA_LIQ : TEdit;
    lbID_INTERMEDIARIO : TLabel;
    edID_INTERMEDIARIO : TEdit;
    sbIdIntermediario: TSpeedButton;
    edNombreIntermediario: TEdit;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbIdIntermediarioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TViaLiquid;
end;
 TViaLiquid= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_VIA_LIQCION          : TInterCampo;
        DESC_SISTEMA_LIQ         : TInterCampo;
        ID_INTERMEDIARIO         : TInterCampo;
        InterMediario:TIntermed;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
    //    Procedure   Post; override;
      published
      end;



implementation
// Uses IntCtaViaLiq;

{$R *.DFM}


constructor TViaLiquid.Create( AOwner : TComponent );
begin Inherited;
      CVE_VIA_LIQCION :=CreaCampo('CVE_VIA_LIQCION',ftString,tsNinguno,tsNinguno,True);
        CVE_VIA_LIQCION .Size:=8;
                CVE_VIA_LIQCION.Caption:='Clave de Liquidación ';
      DESC_SISTEMA_LIQ :=CreaCampo('DESC_SISTEMA_LIQ',ftString,tsNinguno,tsNinguno,True);
                DESC_SISTEMA_LIQ.Caption:='Descripción Sistema Liquidación';
      ID_INTERMEDIARIO :=CreaCampo('ID_INTERMEDIARIO',ftFloat,tsNinguno,tsNinguno,True);
                ID_INTERMEDIARIO.Caption:='Número de Intermediario ';

      FKeyFields.Add('CVE_VIA_LIQCION');

      TableName := 'VIA_LIQUIDACION';
      UseQuery := True;
      HelpFile := 'IntViaLiquid.Hlp';
      ShowMenuReporte:=True;

      InterMediario:=TIntermed.Create(self);
      InterMediario.MasterSource:=Self;
      InterMediario.Id_Intermediario.MasterField:='ID_INTERMEDIARIO';
end;

Destructor TViaLiquid.Destroy;
begin inherited;
end;


function TViaLiquid.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWViaLiquidacion;
begin
   W:=TWViaLiquidacion.Create(Self);
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


Function TViaLiquid.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IViaLiqu.it','S');
      Try if Active then begin T.Param(0,CVE_VIA_LIQCION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TViaLiquid.Reporte:Boolean;
begin //Execute_Reporte();
//    Execute_RepViaLiq(True,Self);   MZC 4/NOV/99 SE COMENTARIZO PORQUE NO ESTABA MIGRADO A LA FECHA EL SISTEMA DE TESORERIA AUTORIZO R. ARRIAGA
end;

{
Procedure TViaLiquid.Post;
var OK:Boolean;
begin OK:=False;
      Apli.DataBase.StartTransaction;
      Try XXX
          if Error then Exit;
          RunSQL('INSERT INTO .. ');
          XXX

          Inherited Post;
          OK:=True;
      Finally if OK then Apli.DataBase.Commit
                    else Apli.DataBase.RollBack;
      end;
end;
}

(***********************************************FORMA VIA_LIQUIDACION********************)
(*                                                                              *)
(*  FORMA DE VIA_LIQUIDACION                                                            *)
(*                                                                              *)
(***********************************************FORMA VIA_LIQUIDACION********************)

procedure TWViaLiquidacion.FormShow(Sender: TObject);
begin Objeto.CVE_VIA_LIQCION.Control:=edCVE_VIA_LIQCION;
      Objeto.DESC_SISTEMA_LIQ.Control:=edDESC_SISTEMA_LIQ;
      Objeto.ID_INTERMEDIARIO.Control:=edID_INTERMEDIARIO;
      Objeto.Intermediario.Persona.Nombre.Control:=edNombreIntermediario;
      Objeto.Intermediario.MasterSourceEditControl:=sbIdIntermediario;
      edNombreIntermediario.PopupMenu:=Objeto.Intermediario.PopMenu;
      edID_INTERMEDIARIO.PopupMenu:=Objeto.Intermediario.PopMenu;
end;

procedure TWViaLiquidacion.FormDestroy(Sender: TObject);
begin
      Objeto.Intermediario.Persona.Nombre.Control:=nil;
      Objeto.CVE_VIA_LIQCION.Control:=nil;
      Objeto.DESC_SISTEMA_LIQ.Control:=nil;
      Objeto.ID_INTERMEDIARIO.Control:=nil;
   //Objeto
end;

procedure TWViaLiquidacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWViaLiquidacion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   edCVE_VIA_LIQCION.SetFocus;
end;

procedure TWViaLiquidacion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
  edDESC_SISTEMA_LIQ.SetFocus;
end;

//procedure TWViaLiquidacion.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;



procedure TWViaLiquidacion.sbIdIntermediarioClick(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TVIALIQUID_BTN0',true, true) THEN EXIT;

  // Objeto.Intermediario.BuscaWhereString:='(CVE_TIPO_INTERM=''CB'')';
  Objeto.Intermediario.BuscaWhereString:='(SIT_INTERMED=''AC'')';
  Objeto.InterMediario.Busca;
end;



procedure TWViaLiquidacion.BitBtn1Click(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TVIALIQUID_BTN1',true, true) THEN EXIT;

   Objeto.Reporte;
end;

end.
