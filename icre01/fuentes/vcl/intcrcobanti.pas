// Sistema         : Clase de CR_COB_ANTICIPADA
// Fecha de Inicio : 08/03/2006
// Función forma   : Clase de CR_COB_ANTICIPADA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrCobAnti;

interface

uses
Windows, Messages, SysUtils, Classes,  Graphics, Controls, Forms,    Dialogs,
IntFrm,  DB,       DbTables, Mask,     StdCtrls, Buttons,  ExtCtrls, InterFor,
IntFind, UnSQL2,   InterFun, ComCtrls, IntDtPk,  InterEdit,

IntGenCre
;

Type
  TCrCobAnti  = class;

  TWCrCobAnti = class(TForm)
    InterForma1             : TInterForma;
    rgTipoComision: TRadioGroup;
    ieIMP_COMISION: TInterEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
  private
    //
  public
    Objeto : TCrCobAnti;
  end;
  //
  TCrCobAnti= class(TInterFrame)
  private
  protected
  public
    ID_CREDITO    : TInterCampo;
    B_COMISION    : TInterCampo;
    B_PORCENTAJE  : TInterCampo;
    PCT_COMISION  : TInterCampo;
    IMP_COMISION  : TInterCampo;
    //
    function    InternalBusca  : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    //
  public
    procedure   InicializaDatos;
    procedure   ExisteComPagoAN(peIdCredito: Integer; var BComision : String );
    function    StpObtenComPagoAn( IdCredito  : Integer; var BComision : String;
                                   var BPorcentaje : String; var PctComision : Double;
                                   var ImpComision : Double): Boolean;
  published
  end;



const
 coMsgPA = 'La disposición %d aplica comisión x pago anticipado ' + #13#10#9 +
           '¿Desea generar esta comisión?';

implementation
{$R *.DFM}


constructor TCrCobAnti.Create( AOwner : TComponent ); 
begin
  Inherited;
  //
  ID_CREDITO    := CreaCampo( 'ID_CREDITO',    ftInteger, tsNinguno, tsNinguno, False );
  B_COMISION    := CreaCampo( 'B_COMISION',    ftString,  tsNinguno, tsNinguno, False );
  B_PORCENTAJE  := CreaCampo( 'B_PORCENTAJE',  ftString,  tsNinguno, tsNinguno, False );
  PCT_COMISION  := CreaCampo( 'PCT_COMISION',  ftFloat,   tsNinguno, tsNinguno, False );
  IMP_COMISION  := CreaCampo( 'IMP_COMISION',  ftFloat,   tsNinguno, tsNinguno, False );
  //
  ID_CREDITO.Caption    := 'ID_CREDITO';
  B_COMISION.Caption    := 'B_COMISION';
  B_PORCENTAJE.Caption  := 'B_PORCENTAJE';
  PCT_COMISION.Caption  := 'PCT_COMISION';
  IMP_COMISION.Caption  := 'IMP_COMISION';
  //
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrCobAnti.Hlp';
  ShowMenuReporte := True;
end;

Destructor TCrCobAnti.Destroy;
begin
  inherited;
end;


function TCrCobAnti.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCrCobAnti;
begin
   W := TWCrCobAnti.Create(Self);
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

Function TCrCobAnti.InternalBusca:Boolean;
Var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrCoAn.it','');
  Try
    if Active then begin end;
    if T.Execute then InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TCrCobAnti.Reporte:Boolean;
begin
//
end;

procedure TCrCobAnti.InicializaDatos;
begin
  ID_CREDITO.AsInteger   := 0;
  B_COMISION.AsString    := 'F';
  B_PORCENTAJE.AsString  := 'F';
  PCT_COMISION.AsFloat   := 0;
  IMP_COMISION.AsFloat   := 0;
end;


procedure TCrCobAnti.ExisteComPagoAN(peIdCredito: Integer; var BComision: String);
var CntRec : Integer;
    sSql   : String;
begin
  sSql := 'SELECT COUNT(*) NUM_COMISIONES '                 +
          'FROM   CR_COMISION '                             +
          'WHERE  ID_CREDITO    = ' + IntToStr(peIdCredito) +
          '  AND  F_VENCIMIENTO = ' + SQLFecha( Apli.DameFechaEmpresa ) +
          '  AND  SIT_COMISION IN (''AC'',''PA'') '         +
          '  AND  CVE_COMISION  = PKGCRCOMUN.STPOBTCOMPAGAN( ID_CREDITO ) ';
  //
  CntRec := 0;
  GetSQLInt( sSql, Apli.DataBaseName, Apli.SessionName,
             'NUM_COMISIONES', CntRec,  False );
  if CntRec > 0 then
  Begin
    if MessageDlg('Ya existe una comisión por pago anticipado' + coCRLF +
                  '¿Desea conservar esta comisión?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    Begin
      BComision := 'F';
    End Else Begin
      sSql := ' UPDATE CR_COMISION '                                         +
              ' SET    SIT_COMISION  = ''CA'', '                             +
              '    SIT_COMISION_DET  = ''CA'', '                             +
              '        F_MODIFICA    = ' + SQLFecha( Apli.DameFechaEmpresa ) + ',' +
              '     CVE_USU_MODIFICA = ' + SQLStr(Apli.Usuario)              +
              ' WHERE  ID_CREDITO    = ' + IntToStr(peIdCredito)             +
              '   AND  F_VENCIMIENTO = ' + SQLFecha( Apli.DameFechaEmpresa ) +
              '   AND  SIT_COMISION IN (''AC'',''PA'') '                     +
              '   AND  CVE_COMISION  = PKGCRCOMUN.STPOBTCOMPAGAN( ID_CREDITO ) ';
      RunSQL( sSql, Apli.DataBaseName, Apli.SessionName, False );
      MessageDlg( '¡¡¡ Importante !!!' + coCRLF + 'Es necesario actualizar la pantalla',
                  mtWarning, [mbOk], 0 );
    End;
    //
  End;
  //
end;


function TCrCobAnti.StpObtenComPagoAn( IdCredito       : Integer; var BComision   : String;
            var BPorcentaje  : String; var PctComision : Double;  var ImpComision : Double): Boolean;
var sBComision : String;
begin
  if IdCredito = ID_CREDITO.AsInteger then
  Begin
    //
  End else
  Begin
    InicializaDatos;
    ID_CREDITO.AsInteger := IdCredito;
    if MessageDlg( Format(coMsgPA, [ID_CREDITO.AsInteger ] ), mtConfirmation,
                   [mbYes, mbNo], 0 ) = mrYes then
    Begin
      sBComision := 'V';
      ExisteComPagoAN( IdCredito, sBComision );
      B_COMISION.AsString    := sBComision;
      B_PORCENTAJE.AsString  := BPorcentaje;
      PCT_COMISION.AsFloat   := PctComision;
      IMP_COMISION.AsFloat   := ImpComision;
    End;
    //
  End;
  //
  BComision   := B_COMISION.AsString;
  BPorcentaje := B_PORCENTAJE.AsString;
  PctComision := PCT_COMISION.AsFloat;
  ImpComision := IMP_COMISION.AsFloat;
  //
end;
(***************************** FORMA CR_COB_ANTICIPADA   **********************)
(*                                                                            *)
(*                            FORMA DE CR_COB_ANTICIPADA                      *)
(*                                                                            *)
(***************************** FORMA CR_COB_ANTICIPADA   **********************)
procedure TWCrCobAnti.FormShow(Sender: TObject);
begin
//
end;

procedure TWCrCobAnti.FormDestroy(Sender: TObject);
begin
//
end;

procedure TWCrCobAnti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;




end.
