// Sistema         : Clase de CrBitCHip
// Fecha de Inicio : 10/01/2014
// Función forma   : Clase de CrBitCHip
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :      
// Comentarios     :
Unit IntCrbitchip;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl;

Type
 TCrbitchip= class;

  TWCrbitchip=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SGDatos: TSGCtrl;
    vgQry: TQuery;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrbitchip;
end;
 TCrbitchip= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre    : TParamCre;
        vConsulta   : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

var vConsulta:String;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrbitchip.Create( AOwner : TComponent );
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrbitchip.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrbitchip.Destroy;
begin inherited;
end;


function TCrbitchip.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrbitchip;
begin
   W:=TWCrbitchip.Create(Self);
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


Function TCrbitchip.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrbitch.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrbitchip.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrBitCHip********************)
(*                                                                              *)
(*  FORMA DE CrBitCHip                                                            *)
(*                                                                              *)
(***********************************************FORMA CrBitCHip********************)

procedure TWCrbitchip.FormDestroy(Sender: TObject);
begin

   //Objeto
end;

procedure TWCrbitchip.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrbitchip.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrbitchip.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrbitchip.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrbitchip.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   if vgQry.Active=false then
   begin
      vgQry.DatabaseName := Objeto.Apli.DataBaseName;
      vgQry.SessionName  := Objeto.Apli.SessionName;
   end;   

   vgQry.Close;
   vgQry.SQL.Clear;
   vgQry.SQL.Add(Objeto.vConsulta);
   vgQry.Open;
   vgQry.FieldByName('ID_CREDITO').DisplayLabel := 'Credito';
   vgQry.FieldByName('ID_CREDITO').DisplayWidth := 7;

   vgQry.FieldByName('TX_DESCRIPCION').DisplayLabel := 'Cambio';
   vgQry.FieldByName('TX_DESCRIPCION').DisplayWidth := 50;

   vgQry.FieldByName('TX_ORIGINAL').DisplayLabel := 'Original';
   vgQry.FieldByName('TX_ORIGINAL').DisplayWidth := 30;

   vgQry.FieldByName('TX_MODIFICADO').DisplayLabel := 'Modificado';
   vgQry.FieldByName('TX_MODIFICADO').DisplayWidth := 30;

   vgQry.FieldByName('CVE_USU_ALTA').DisplayLabel := 'Usuario';
   vgQry.FieldByName('CVE_USU_ALTA').DisplayWidth := 13;

   vgQry.FieldByName('F_ALTA').DisplayLabel := 'F. Cambio';
   vgQry.FieldByName('F_ALTA').DisplayWidth := 25;

   SGDatos.AddQry(vgQry,True,True,20,20,20,True);

   vgQry.First;
end;

end.
