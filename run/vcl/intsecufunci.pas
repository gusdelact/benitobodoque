// Sistema         : Clase de SECU_FUNCION
// Fecha de Inicio : 30/06/1998
// Función forma   : Clase de SECU_FUNCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Martinez Castro
// Comentarios     : IntCtto
Unit IntSecuFunci;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMPers;

Type
 TSecuFunci= class;

  TWSecuFuncion=Class(TForm)
    lbCVE_FUNCION : TLabel;
    edCVE_FUNCION : TEdit;
    chB_BLOQUEADO : TCheckBox;
    chB_NIVEL_CRITICO : TCheckBox;
    chB_REG_BITACORA : TCheckBox;
    lbFH_PRODUCCION : TLabel;
    edFH_PRODUCCION : TEdit;
    lbFH_ULT_ACCESO : TLabel;
    edFH_ULT_ACCESO : TEdit;
    lbID_PERS_RESPON : TLabel; 
    edID_PERS_RESPON : TEdit;
    edNOM_FUNCION : TEdit;
    lbTX_DESC_FUNCION : TLabel; 
    chB_BLOQUEA_ADMON : TCheckBox;
    btResponsable: TSpeedButton;
    edNomResponsable: TEdit;
    edTX_DESC_FUNCION: TMemo;
    edCVE_TIPO_FUNC: TRadioGroup;
    InterForma1: TInterForma;
    InterDateTimePicker1: TInterDateTimePicker;
    InterDateTimePicker2: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btResponsableClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecuFunci;
end;
 TSecuFunci= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_FUNCION              : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        B_NIVEL_CRITICO          : TInterCampo;
        B_REG_BITACORA           : TInterCampo;
        CVE_TIPO_FUNC            : TInterCampo;
        FH_PRODUCCION            : TInterCampo;
        FH_ULT_ACCESO            : TInterCampo;
        ID_PERS_RESPON           : TInterCampo;
        NOM_FUNCION              : TInterCampo;
        TX_DESC_FUNCION          : TInterCampo;
        B_BLOQUEA_ADMON          : TInterCampo;
        RESPONSABLE              : TMPersona;
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


constructor TSecuFunci.Create( AOwner : TComponent );
begin Inherited; 
      CVE_FUNCION :=CreaCampo('CVE_FUNCION',ftString,tsNinguno,tsNinguno,True);
        CVE_FUNCION .Size:=16;
                CVE_FUNCION.Caption:='Clave de Funcion';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEADO .Size:=1;
                B_BLOQUEADO.Caption:='Bloqueado';
      B_NIVEL_CRITICO :=CreaCampo('B_NIVEL_CRITICO',ftString,tsNinguno,tsNinguno,True);
        B_NIVEL_CRITICO .Size:=1;
                B_NIVEL_CRITICO.Caption:='Nivel Critico';
      B_REG_BITACORA :=CreaCampo('B_REG_BITACORA',ftString,tsNinguno,tsNinguno,True);
        B_REG_BITACORA .Size:=1;
                B_REG_BITACORA.Caption:='Reg Bitacora';
      CVE_TIPO_FUNC :=CreaCampo('CVE_TIPO_FUNC',ftString,tsNinguno,tsNinguno,True);
        CVE_TIPO_FUNC .Size:=2;
        CVE_TIPO_FUNC.Caption:='Clave de Tipo Función';
      WITH CVE_TIPO_FUNC DO
      begin UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add('N');
            ComboLista.Add('1'); ComboDatos.Add('F');
            ComboLista.Add('2'); ComboDatos.Add('S');
      end;

      FH_PRODUCCION :=CreaCampo('FH_PRODUCCION',ftDate,tsNinguno,tsNinguno,True);
                FH_PRODUCCION.Caption:='Fecha y Hora Produccion';
      FH_ULT_ACCESO :=CreaCampo('FH_ULT_ACCESO',ftDate,tsNinguno,tsNinguno,True);
                FH_ULT_ACCESO.Caption:='Fecha y Hora Última Acceso';
      ID_PERS_RESPON :=CreaCampo('ID_PERS_RESPON',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERS_RESPON.Caption:='Número de Persona Responsable';
      NOM_FUNCION :=CreaCampo('NOM_FUNCION',ftString,tsNinguno,tsNinguno,True);
                NOM_FUNCION.Caption:='Nombre Funcion';
      TX_DESC_FUNCION :=CreaCampo('TX_DESC_FUNCION',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_FUNCION.Caption:='Descripción Funcion';
      B_BLOQUEA_ADMON :=CreaCampo('B_BLOQUEA_ADMON',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEA_ADMON .Size:=1;
                B_BLOQUEA_ADMON.Caption:='Bloquea Admon';
      FKeyFields.Add('CVE_FUNCION');

      TableName := 'SECU_FUNCION';
      UseQuery := True; 
      HelpFile := 'IntSecuFunci.Hlp';
      ShowMenuReporte:=True;
      RESPONSABLE:=TMPersona.Create(Self);
      RESPONSABLE.MasterSource:=Self;
      RESPONSABLE.ID_PERSONA.MasterField:='ID_PERS_RESPON';
      RESPONSABLE.FilterBy:=fbTMPersonaEmpleado;
end;

Destructor TSecuFunci.Destroy;
begin if RESPONSABLE<>nil then RESPONSABLE.Free; RESPONSABLE:=nil;
      inherited;
end;


function TSecuFunci.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuFuncion;
begin
   W:=TWSecuFuncion.Create(Self);
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


Function TSecuFunci.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISecFun.it','S');
      Try if Active then begin T.Param(0,CVE_FUNCION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TSecuFunci.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA SECU_FUNCION********************)
(*                                                                              *)
(*  FORMA DE SECU_FUNCION                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_FUNCION********************)

procedure TWSecuFuncion.FormShow(Sender: TObject);
begin
      Objeto.CVE_FUNCION.Control:=edCVE_FUNCION;
      Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
      Objeto.B_NIVEL_CRITICO.Control:=chB_NIVEL_CRITICO;
      Objeto.B_REG_BITACORA.Control:=chB_REG_BITACORA;
      Objeto.CVE_TIPO_FUNC.Control:=edCVE_TIPO_FUNC;
      Objeto.FH_PRODUCCION.Control:=edFH_PRODUCCION;
      Objeto.FH_ULT_ACCESO.Control:=edFH_ULT_ACCESO;
      Objeto.ID_PERS_RESPON.Control:=edID_PERS_RESPON;
      Objeto.NOM_FUNCION.Control:=edNOM_FUNCION;
      Objeto.TX_DESC_FUNCION.Control:=edTX_DESC_FUNCION;
      Objeto.B_BLOQUEA_ADMON.Control:=chB_BLOQUEA_ADMON;

      Objeto.RESPONSABLE.NOMBRE.Control:=edNomResponsable;
      Objeto.RESPONSABLE.MasterSourceEditControl:=btResponsable;
end;

procedure TWSecuFuncion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FUNCION.Control:=nil;
      Objeto.B_BLOQUEADO.Control:=nil;
      Objeto.B_NIVEL_CRITICO.Control:=nil;
      Objeto.B_REG_BITACORA.Control:=nil;
      Objeto.CVE_TIPO_FUNC.Control:=nil;
      Objeto.FH_PRODUCCION.Control:=nil;
      Objeto.FH_ULT_ACCESO.Control:=nil;
      Objeto.ID_PERS_RESPON.Control:=nil;
      Objeto.NOM_FUNCION.Control:=nil;
      Objeto.TX_DESC_FUNCION.Control:=nil;
      Objeto.B_BLOQUEA_ADMON.Control:=nil;

      Objeto.RESPONSABLE.NOMBRE.Control:=nil;
      Objeto.RESPONSABLE.MasterSourceEditControl:=nil;
   //Objeto
end;

procedure TWSecuFuncion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecuFuncion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWSecuFuncion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSecuFuncion.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;



procedure TWSecuFuncion.btResponsableClick(Sender: TObject);
begin Objeto.Responsable.Busca;
end;


end.
