// Sistema         : Clase de SECU_INDICADOR
// Fecha de Inicio : 21/08/1998
// Función forma   : Clase de SECU_INDICADOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alejandro Villalobos Bahena
// Comentarios     :
Unit IntSecuIndic;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit;

Type
 TSecuIndic= class;

  TWSecuIndicador=Class(TForm)
    InterForma1             : TInterForma;
    lkCve: TInterLinkit;
    bbReport: TBitBtn;
    edCVE_IND_ADIC: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edDESC_IND_ADIC: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure lkCveCapture(Sender: TObject; var Show: Boolean);
    procedure lkCveEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure bbReportClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecuIndic;
end;

 TSecuIndic= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_IND_ADIC             : TInterCampo;
        DESC_IND_ADIC            : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Procedure   PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean); override;
        Function    NextIndic:Integer;
      published
      end;



implementation
Uses RepSecuIndic, IntSelect; //IntMenuSegu

{$R *.DFM}


constructor TSecuIndic.Create( AOwner : TComponent );
begin Inherited;
      CVE_IND_ADIC :=CreaCampo('CVE_IND_ADIC',ftString,tsNinguno,tsNinguno,True);
        CVE_IND_ADIC .Size:=4;
                CVE_IND_ADIC.Caption:='Clave de Indicador';
      DESC_IND_ADIC :=CreaCampo('DESC_IND_ADIC',ftString,tsNinguno,tsNinguno,True);
                DESC_IND_ADIC.Caption:='Descripción Indicador';
      FKeyFields.Add('CVE_IND_ADIC');

      TableName := 'SECU_INDICADOR';
      UseQuery := True;
      HelpFile := 'IntSecuIndic.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TSecuIndic.Destroy;
begin inherited;
end;

Function    TSecuIndic.NextIndic:Integer;
var Q:TQuery;
begin NextIndic:=0;
      //Crear Query
      Q:=GetSQLQuery('SELECT NVL(MAX(CVE_IND_ADIC)+1,0) AS DATO FROM SECU_INDICADOR',DataBaseName,SessionName,True);
      //Si Q=nil no Existe Informacion o Ocurrio un Error
      if Q=nil then Exit;
      Try
           NextIndic:=Q.FieldByName('DATO').AsInteger;
      Finally  //Destruir Query.
               Q.Free;
      end;
end;


function TSecuIndic.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuIndicador;
begin
   W:=TWSecuIndicador.Create(Self);
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


Function TSecuIndic.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISecInd.it','S');
      Try if Active then begin T.Param(0,CVE_IND_ADIC.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TSecuIndic.Reporte:Boolean;
begin Seleccionar(Self,'Impresion de Indicadores Adicionales',
      nil,nil ,nil,'','','',nil,nil,nil);
      //Execute_RepSecuIndic(True,Self,True);
end;

Procedure TSecuIndic.PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean);
begin Execute_RepSecuIndic(Preview,Self,TodosLosRegistros);
end;
(***********************************************FORMA SECU_INDICADOR********************)
(*                                                                              *)
(*  FORMA DE SECU_INDICADOR                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_INDICADOR********************)

procedure TWSecuIndicador.FormShow(Sender: TObject);
begin
      Objeto.CVE_IND_ADIC.Control:=edCVE_IND_ADIC;
      Objeto.DESC_IND_ADIC.Control:=edDESC_IND_ADIC;
end;

procedure TWSecuIndicador.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_IND_ADIC.Control:=nil;
      Objeto.DESC_IND_ADIC.Control:=nil;
   //Objeto
end;

procedure TWSecuIndicador.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecuIndicador.InterForma1DespuesNuevo(Sender: TObject);
begin Objeto.CVE_IND_ADIC.AsInteger:=Objeto.NextIndic;
      edCVE_IND_ADIC.SetFocus;
end;

procedure TWSecuIndicador.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_IND_ADIC.SetFocus;
end;

//procedure TWSecuIndicador.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWSecuIndicador.lkCveCapture(Sender: TObject;
  var Show: Boolean);
begin  Show:=Not InterForma1.CanEdit;
end;

procedure TWSecuIndicador.lkCveEjecuta(Sender: TObject);
begin Objeto.FindKey([LkCve.Buffer]);
end;

procedure TWSecuIndicador.InterForma1DespuesShow(Sender: TObject);
begin if InterForma1.FormaTipo=ftGrid
      then edCVE_IND_ADIC.SetFocus;
end;



procedure TWSecuIndicador.bbReportClick(Sender: TObject);
begin Objeto.Reporte;
end;


end.
