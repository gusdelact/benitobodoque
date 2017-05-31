// Sistema         : Clase de MRecPremio
// Fecha de Inicio : 12/12/2003
// Función forma   : Clase de MRecPremio
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntMReFondeo;
       
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//
IntParamCre,
IntSGCtrl;
Const
   coCRLF      = #13#10;
Type
 TMReFondeo = class;

  TWMReFondeo =Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    InterDateTimePicker1: TInterDateTimePicker;
    edFECHA_DIA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    sgDatos: TSGCtrl;
    Label2: TLabel;
    lbFolio: TLabel;
    lbDiposicion: TLabel;
    lbDescripcion: TLabel;
    lbImporte: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btCANCELA: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    private
    { Private declarations }
       vlIsEmpty : Boolean;

       Function CadenaSQL: String;
       Procedure BuscaDatos;
    public
    { Public declarations }
    Objeto : TMReFondeo;
end;
 TMReFondeo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre        : TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation


{$R *.DFM}


constructor TMReFondeo.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMReFondeo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReFondeo.Destroy;
begin inherited;
end;


function TMReFondeo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMReFondeo;
begin
   W:=TWMReFondeo.Create(Self);
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


(***********************************************FORMA MRecPremio********************)
(*                                                                              *)
(*  FORMA DE MRecPremio                                                            *)
(*                                                                              *)
(***********************************************FORMA MRecPremio********************)

procedure TWMReFondeo.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      
      vlIsEmpty := True;

end;

procedure TWMReFondeo.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWMReFondeo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMReFondeo.InterForma1DespuesShow(Sender: TObject);
Var vlFecha     : TDateTime;
begin
   vlFecha := Objeto.Apli.DameFechaEmpresa;
   edFECHA_DIA.Text :=  DateTimeToStr(vlFecha);
   BuscaDatos;
end;

function TWMReFondeo.CadenaSQL: String;
var vlsql   : String;
begin
   vlsql := ' SELECT CC.F_VENCIMIENTO, ' + coCRLF +
            '        CC.ID_CREDITO, ' + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '        CP.ID_PROV_NAFINSA, ' + coCRLF +
            '        CP.ID_PROV_EXTERNO ID_PROV_NAFINSA, ' + coCRLF +
{/ROIM}
            '        P.NOMBRE, ' + coCRLF +
            '        CR.F_INICIO, ' + coCRLF +
            '        ( CD.TASA_DESCUENTO - CD.SOBRETASA ) TASA_BASE, ' + coCRLF +
            '        CC.PLAZO, ' + coCRLF +
            '        ( CC.IMP_CAPITAL - CI.IMP_INTERES ) SDO_INSOLUTO ' + coCRLF +
            ' FROM CR_CREDITO     CR, ' + coCRLF +
            '      CR_CESION      CS, ' + coCRLF +
            '      PERSONA        P, ' + coCRLF +
            '      CR_PROVEEDOR   CP, ' + coCRLF +
            '      CR_CAPITAL     CC, ' + coCRLF +
            '      CR_DOCUMENTO   CD, ' + coCRLF +
            '      CR_INTERES     CI ' + coCRLF +

            ' WHERE  CC.F_VENCIMIENTO = ' + SQLFecha(StrToDateTime(edFECHA_DIA.Text)) + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '  AND CP.ID_PROV_NAFINSA <> 0 ' + coCRLF +
            '  AND CP.ID_PROV_EXTERNO <> 0 ' + coCRLF +
{/ROIM}
            '  AND CR.ID_CREDITO      = CS.ID_CESION ' + coCRLF +
            '  AND P.ID_PERSONA       = CS.ID_PROVEEDOR ' + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            '  AND CS.CVE_FND_ENT_DES    = CP.CVE_FND_ENT_DES ' + coCRLF +
{/ROIM}
            '  AND CS.ID_PROVEEDOR    = CP.ID_ACREDITADO ' + coCRLF +
            '  AND CR.ID_CREDITO      = CC.ID_CREDITO ' + coCRLF +
            '  AND CD.ID_CESION       = CS.ID_CESION ' + coCRLF +
            '  AND CD.NUM_PERIODO_DOC = CC.NUM_PERIODO ' + coCRLF +
            '  AND CI.ID_CREDITO      = CC.ID_CREDITO ' + coCRLF +
            '  AND CI.NUM_PERIODO     = CC.NUM_PERIODO ' + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            ' ORDER BY CR.F_INICIO, 	CC.F_VENCIMIENTO, 	CC.ID_CREDITO, 	CP.ID_PROV_NAFINSA, ' + coCRLF +
            ' ORDER BY CR.F_INICIO, 	CC.F_VENCIMIENTO, 	CC.ID_CREDITO, 	CP.ID_PROV_EXTERNO, ' + coCRLF +
{/ROIM}
            '          P.NOMBRE,	CC.PLAZO, 		TASA_BASE,  	SDO_INSOLUTO ' + coCRLF;

   CadenaSQL := vlsql ;
end;

procedure TWMReFondeo.BuscaDatos;
var vlQry : TQuery;
begin
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
           vlQry.FieldByName('F_VENCIMIENTO').DisplayLabel := 'FECHA VENCIMIENTO' + #30 +'>C';
           vlQry.FieldByName('ID_CREDITO').DisplayLabel := 'DISPOSICION' + #30 +'>C';
           vlQry.FieldByName('ID_PROV_NAFINSA').DisplayLabel := 'ID PROVEEDOR' + #30 +'>C';
           vlQry.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE' + #30 +'>C';
           vlQry.FieldByName('F_INICIO').DisplayLabel := 'FECHA INICIO' + #30 +'>C';
           vlQry.FieldByName('TASA_BASE').DisplayLabel := 'TASA BASE' + #30 +'>C';
           vlQry.FieldByName('PLAZO').DisplayLabel := 'PLAZO' + #30 +'>C';
           vlQry.FieldByName('SDO_INSOLUTO').DisplayLabel := 'SDO_INSOLUTO' + #30 +'>C';

           vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth := 11;
           vlQry.FieldByName('ID_CREDITO').DisplayWidth  := 12;
           vlQry.FieldByName('ID_PROV_NAFINSA').DisplayWidth := 14;
           vlQry.FieldByName('NOMBRE').DisplayWidth := 40;
           vlQry.FieldByName('F_INICIO').DisplayWidth  := 11;
           vlQry.FieldByName('TASA_BASE').DisplayWidth   := 12;
           vlQry.FieldByName('PLAZO').DisplayWidth := 8;
           vlQry.FieldByName('SDO_INSOLUTO').DisplayWidth := 12;

           TNumericField( vlQry.FieldByName('SDO_INSOLUTO') ).DisplayFormat:= '###,###,###,###,###,##0.00';
           TNumericField( vlQry.FieldByName('TASA_BASE') ).DisplayFormat:= '###0.0000';
           sgDatos.addQry( vlQry, True, True, -1, -1, -1, False );
        end
        else sgDatos.Clear('NO EXISTEN DATOS'#30'>C');
     finally
      if Assigned( vlQry ) then
        vlQry.Free;
     end;
end;

procedure TWMReFondeo.btCANCELAClick(Sender: TObject);
begin
   BuscaDatos;
end;

end.
