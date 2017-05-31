// Sistema         : Clase de CRHISTGAR
// Fecha de Inicio : 09/04/2012
// Función forma   : Clase de CRHISTGAR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
unit IntCrHistGar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,  IntSGCtrl,
  IntParamCre, Ungene, Grids, wwDataInspector;
type
  TCrHistGar = class;

  TWCrHistGar = class(TForm)
    InterForma1: TInterForma;
    lbFecha: TLabel;
    dpFecha: TDateTimePicker;
    SGCtrl1: TSGCtrl;
    qDatos: TQuery;
    qDatosId_Contrato: TFloatField;
    qDatosIns_Irrev: TStringField;
    qDatosMandato: TStringField;
    qDatosGar_Part: TStringField;
    qDatosGar_Aport: TStringField;
    qDatosMon_Ins_Irrev: TFloatField;
    qDatosMon_Mandato: TFloatField;
    qDatosMon_Gar_Part: TFloatField;
    qDatosMon_Gar_aport: TFloatField;
    qDatosIng_Propios: TStringField;
    qDatosMon_Ing_Propios: TFloatField;
    qDatosIns_Federal: TStringField;
    qDatosFideicomiso: TStringField;
    qDatosB_Aut_Leg_Local: TStringField;
    qDatosPosicion: TStringField;
    qDatosTipo_Linea: TStringField;
    qDatosFuente_Pago: TStringField;
    qDatosB_Mec_Claro_Pago: TStringField;
    qDatosB_Opin_Desp_Jur: TStringField;
    qDatosB_Opin_Inter_Jur: TStringField;
    qDatosF_Reg_Gar_Part: TDateTimeField;
    qDatosF_Reg_Gar_Aport: TDateTimeField;
    qDatosF_Reg_Ing_Propios: TDateTimeField;
    qDatosB_Cobertura_Tasa: TStringField;
    qDatosB_Apl_Inscr_Deud: TStringField;
    qDatosNum_Inscr_Deuda: TStringField;
    qDatosF_Alta_Inscr_Deu: TDateTimeField;
    qDatosF_Prog_Inscr_D: TDateTimeField;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dpFechaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     Objeto : TCrHistGar;
  end;

 TCrHistGar = class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        //function    InternalBusca : Boolean; override;
        ParamCre                 : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        //function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrHistGar.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrHistGar.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrHistGar.Destroy;
begin inherited;
end;

function TCrHistGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrHistGar;
begin
   W:=TWCrHistGar.Create(Self);
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




procedure TWCrHistGar.FormShow(Sender: TObject);
begin
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  dpFechaChange(dpFecha);
end;

procedure TWCrHistGar.dpFechaChange(Sender: TObject);
begin
  QDatos.Close;
  QDatos.DatabaseName := Objeto.Apli.DataBaseName;
  QDatos.SessionName  := Objeto.Apli.SessionName;

  QDatos.ParamByName ('Fecha').AsDateTime := dpFecha.Date;
  QDatos.Open;
  QDatos.RecordCount;
  //Label1.Caption :=   IntToStr(QDatos.RecordCount);
  SGCtrl1.AddQry (QDatos, True, True, -1, -1, -1, True);
end;

end.
