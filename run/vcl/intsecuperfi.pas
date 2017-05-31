// Sistema         : Clase de SECU_PERFIL
// Fecha de Inicio : 21/08/1998
// Función forma   : Clase de SECU_PERFIL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alejandro Villalobos Bahena
// Comentarios     :
Unit IntSecuPerfi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit;

Type
 TSecuPerfi= class;

  TWSecuPerfil=Class(TForm)
    InterForma1             : TInterForma;
    lkGpo: TInterLinkit;
    BitBtn1: TBitBtn;
    chB_BLOQUEADO: TCheckBox;
    edTX_DESC_GPO_AC: TMemo;
    lbTX_DESC_GPO_AC: TLabel;
    edNOM_GPO_ACCESO: TEdit;
    edID_GPO_ACCESO: TEdit;
    lbID_GPO_ACCESO: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure lkGpoEjecuta(Sender: TObject);
    procedure lkGpoCapture(Sender: TObject; var Show: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecuPerfi;
end;
 TSecuPerfi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_GPO_ACCESO            : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        NOM_GPO_ACCESO           : TInterCampo;
        TX_DESC_GPO_AC           : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Procedure   PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean); override;
        function    NextGpo:Integer;
      published
      end;



implementation
Uses RepSecuPerfi,IntSelect;

{$R *.DFM}


constructor TSecuPerfi.Create( AOwner : TComponent );
begin Inherited;
      ID_GPO_ACCESO :=CreaCampo('ID_GPO_ACCESO',ftFloat,tsNinguno,tsNinguno,True);
                ID_GPO_ACCESO.Caption:='Número de Grupo Acceso';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEADO .Size:=1;
                B_BLOQUEADO.Caption:='Bloqueado';
      NOM_GPO_ACCESO :=CreaCampo('NOM_GPO_ACCESO',ftString,tsNinguno,tsNinguno,True);
                NOM_GPO_ACCESO.Caption:='Nombre Grupo Acceso';
      TX_DESC_GPO_AC :=CreaCampo('TX_DESC_GPO_AC',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_GPO_AC.Caption:='Descripción Grupo Acceso';
      FKeyFields.Add('ID_GPO_ACCESO');

      TableName := 'SECU_PERFIL';
      UseQuery := True;
      HelpFile := 'IntSecuPerfi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSecuPerfi.Destroy;
begin inherited;
end;


function TSecuPerfi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuPerfil;
begin
   W:=TWSecuPerfil.Create(Self);
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


Function TSecuPerfi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISecPer.it','F');
      Try if Active then begin T.Param(0,ID_GPO_ACCESO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TSecuPerfi.Reporte:Boolean;
begin Seleccionar(Self,'Impresión de Perfiles',nil,nil,nil,'','','',nil,nil,nil);
end;

Procedure TSecuPerfi.PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean);
begin  Execute_RepSecuPerfi(Preview,Self,TodosLosRegistros);
end;

function TSecuPerfi.NextGpo:Integer;
var qGpo:TQuery;
begin
     qGpo:=GetSqlQuery('Select NVL(MAX(ID_GPO_ACCESO)+1,0) AS DATO FROM SECU_PERFIL',DataBaseName,SessionName,True);
     if qGpo = nil then Exit;
     Try
        NextGpo:=StrToInt(qGpo.FieldByName('DATO').AsString);
     Finally
            qgpo.Free;
     end;
end;
(***********************************************FORMA SECU_PERFIL********************)
(*                                                                              *)
(*  FORMA DE SECU_PERFIL                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_PERFIL********************)

procedure TWSecuPerfil.FormShow(Sender: TObject);
begin
      Objeto.ID_GPO_ACCESO.Control:=edID_GPO_ACCESO;
      Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
      Objeto.NOM_GPO_ACCESO.Control:=edNOM_GPO_ACCESO;
      Objeto.TX_DESC_GPO_AC.Control:=edTX_DESC_GPO_AC;
end;

procedure TWSecuPerfil.FormDestroy(Sender: TObject);
begin
      Objeto.ID_GPO_ACCESO.Control:=nil;
      Objeto.B_BLOQUEADO.Control:=nil;
      Objeto.NOM_GPO_ACCESO.Control:=nil;
      Objeto.TX_DESC_GPO_AC.Control:=nil;
   //Objeto
end;

procedure TWSecuPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecuPerfil.InterForma1DespuesNuevo(Sender: TObject);
begin
      objeto.ID_GPO_ACCESO.AsString:= intToStr(Objeto.NextGpo);
      edID_GPO_ACCESO.SetFocus;
end;

procedure TWSecuPerfil.InterForma1DespuesModificar(Sender: TObject);
begin edNOM_GPO_ACCESO.SetFocus;
end;

//procedure TWSecuPerfil.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;



procedure TWSecuPerfil.lkGpoEjecuta(Sender: TObject);
begin
      Objeto.FindKey([lkGpo.Buffer]);
end;


procedure TWSecuPerfil.lkGpoCapture(Sender: TObject; var Show: Boolean);
begin Show:=Not InterForma1.CanEdit;
end;


procedure TWSecuPerfil.BitBtn1Click(Sender: TObject);
begin Objeto.Reporte;
end;


end.
