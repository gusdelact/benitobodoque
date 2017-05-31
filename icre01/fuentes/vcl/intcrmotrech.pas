// Sistema         : Clase de CR_MOT_RECHAZO
// Fecha de Inicio : 08/06/2004
// Función forma   : Clase de CR_MOT_RECHAZO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrMotRech;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,

IntGenCre,
IntParamCre;

Type
 TCrMotRech= class;

  TWCrMotRechazo=Class(TForm)
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
    sgcDATOS: TSGCtrl;
    edTIT_DOCUMENTO: TEdit;
    Edit7: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private
    { Private declarations }
       procedure   MuestraDatos;
    public
    { Public declarations }
    Objeto : TCrMotRech;
end;
 TCrMotRech= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;

        ParamCre                 : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrMotRech.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,False);

      TableName := '';
      UseQuery := False;
      HelpFile := 'IntCrMotRech.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMotRech.Destroy;
begin inherited;
end;


function TCrMotRech.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMotRechazo;
begin
   W:=TWCrMotRechazo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo :=ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CR_MOT_RECHAZO********************)
(*                                                                              *)
(*  FORMA DE CR_MOT_RECHAZO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MOT_RECHAZO********************)
procedure TWCrMotRechazo.MuestraDatos;
var vlQry : TQuery;
    vlsql : String;
begin
   vlsql := ' SELECT NUM_RECHAZO, ' + coCRLF +
            '       TX_DESC_ADICIONA, ' + coCRLF +
            '       F_ALTA, ' + coCRLF +
            '       CVE_USU_ALTA ' + coCRLF +
            ' FROM  CR_MOT_RECHAZO ' + coCRLF +
            ' WHERE   ID_CREDITO = ' + Objeto.ID_CREDITO.AsString + coCRLF +
            ' AND CVE_APLICACION = ' + SQLStr(Objeto.Apli.Apli ) + coCRLF +
            ' AND CVE_GPO_MOTIVO = ' + SQLStr( C_GPOMOTIVO ) + coCRLF +
            ' AND     CVE_MOTIVO = ' + SQLStr( C_MOTIVO ) + coCRLF;

     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('NUM_RECHAZO').DisplayWidth := 8;
            vlQry.FieldByName('TX_DESC_ADICIONA').DisplayWidth := 82;
            vlQry.FieldByName('F_ALTA').DisplayWidth := 21;
            vlQry.FieldByName('CVE_USU_ALTA').DisplayWidth := 10;

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
            sgcDATOS.Clear('NO TIENE MOTIVOS DE RECHAZO'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrMotRechazo.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

procedure TWCrMotRechazo.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrMotRechazo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMotRechazo.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
end;

end.
