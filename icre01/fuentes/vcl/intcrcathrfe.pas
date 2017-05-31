// Sistema         : Clase de CrCatHrFe
// Fecha de Inicio : 09/05/2013
// Función forma   : Clase de CrCatHrFe
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan F Ortega Flores
// Comentarios     :
Unit IntCrcathrfe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//unidades adicionales
IntParamCre, InterEdit
;

Type
 TCrcathrfe= class; 

  TWCrcathrfe=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    IEfechaModifica: TEdit;
    Label3: TLabel;
    IEUsuarioModifica: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_PROCESO: TEdit;
    edDESC_PROCESO: TEdit;
    lbDPerfil: TLabel;
    edH_INI: TInterEdit;
    edH_FIN: TInterEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edH_INIExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrcathrfe;
end; 
 TCrcathrfe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre      : TParamCre;

        CVE_PROCESO      : TInterCampo;
        DESC_PROCESO     : TInterCampo;
        H_INICIO         : TInterCampo;
        H_FIN            : TInterCampo;
        F_MODIFICA       : TInterCampo;
        CVE_USU_MODIFICA : TInterCampo;


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


constructor TCrcathrfe.Create( AOwner : TComponent ); 
begin Inherited; 

      CVE_PROCESO := CreaCampo('CVE_PROCESO',ftString,tsNinguno,tsNinguno,True);
                CVE_PROCESO.Caption:='Cve Proceso';

      DESC_PROCESO := CreaCampo('DESC_PROCESO',ftString,tsNinguno,tsNinguno,True);
                DESC_PROCESO.Caption:='Cve Proceso';

      H_INICIO := CreaCampo('H_INICIO',ftString,tsNinguno,tsNinguno,True);
                H_INICIO.Caption:='Hora Inicio';

      H_FIN := CreaCampo('H_FIN',ftString,tsNinguno,tsNinguno,True);
                H_FIN.Caption:='Hora Fin';

      F_MODIFICA := CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha MOdifica';

      CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Usuario Modifica';

      FKeyFields.Add('CVE_PROCESO');

      TableName := 'CR_FE_HORARIO';
//      StpName  := ' ';
      UseQuery := True;
      HelpFile := 'IntCrcathrfe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrcathrfe.Destroy;
begin inherited;
end;


function TCrcathrfe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcathrfe;
begin
   W:=TWCrcathrfe.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnNuevo := False;            
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrcathrfe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRCATHR.IT','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrcathrfe.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrCatHrFe********************)
(*                                                                                *)
(*  FORMA DE CrCatHrFe                                                            *)
(*                                                                                *)
(***********************************************FORMA CrCatHrFe********************)

procedure TWCrcathrfe.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.GetParams(Objeto);

      Objeto.CVE_PROCESO.Control := edCVE_PROCESO;
      Objeto.DESC_PROCESO.Control := edDESC_PROCESO;
      Objeto.H_INICIO.Control := edH_INI;
      Objeto.H_FIN.Control := edH_FIN;
      Objeto.F_MODIFICA.Control := IEFechaModifica;;
      Objeto.CVE_USU_MODIFICA.Control := IEUsuarioModifica;

end;

procedure TWCrcathrfe.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PROCESO.Control := nil;
      Objeto.DESC_PROCESO.Control := nil;      
      Objeto.H_INICIO.Control := nil;
      Objeto.H_FIN.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
end;

procedure TWCrcathrfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcathrfe.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrcathrfe.InterForma1DespuesModificar(Sender: TObject);
var  vlsql  : String;
     Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
      edH_INI.SetFocus;
end;

//procedure TWCrcathrfe.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrcathrfe.InterForma1Buscar(Sender: TObject);
begin
    Objeto.Busca;
end;

procedure TWCrcathrfe.edH_INIExit(Sender: TObject);
begin
//     edH_INI.DisplayMask :=  '##:##:##';
end;

end.
