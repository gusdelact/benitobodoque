// Sistema         : Clase de CR_SOL_EXCESO_AC
// Fecha de Inicio : 23/01/2006
// Función forma   : Clase de CR_SOL_EXCESO_AC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSoExAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,

  //uses Adicionales
  IntParamCre,
  IntGenCre,
  IntCrCto;

Type
 TCrSoExAc= class; 

  TWCrSolExcesoAc=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO: TLabel;
    lbF_ALTA: TLabel;
    lbF_INI_EXCESO: TLabel;
    lb: TLabel;
    lbID_CONTRATO: TLabel;
    lbIMP_EXCESO_VAL: TLabel;
    lbF_VTO_EXCESO: TLabel;
    lbSIT_SOL_EXCESO: TLabel;
    edID_ACREDITADO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNOMBRE: TEdit;
    sgcDATOS: TSGCtrl;
    lbTIPO_MOVIMIENTO: TLabel;
    lbCVE_MONEDA: TLabel;
    lbIMP_EXCESO_EVE: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    private
    { Private declarations }
       Function    CadenaSql : String;
       Procedure   MuestraDatos;
       Procedure   Autorizacion(pContrato, pTitular: String); 
    public
    { Public declarations }
    Objeto : TCrSoExAc;
end;
 TCrSoExAc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        NOMBRE                   : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
       published
      end;



implementation

{$R *.DFM}


constructor TCrSoExAc.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,False);
      NOMBRE :=CreaCampo('NOMBRE',ftFloat,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      ShowMenuReporte:=True;
end;

Destructor TCrSoExAc.Destroy;
begin inherited;
end;


function TCrSoExAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSolExcesoAc;
begin
   W:=TWCrSolExcesoAc.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;//FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;



(***********************************************FORMA CR_SOL_EXCESO_AC********************)
(*                                                                              *)
(*  FORMA DE CR_SOL_EXCESO_AC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SOL_EXCESO_AC********************)

procedure TWCrSolExcesoAc.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
     Objeto.NOMBRE.Control:=edNOMBRE;
end;

procedure TWCrSolExcesoAc.FormDestroy(Sender: TObject);
begin
     Objeto.ID_ACREDITADO.Control:=nil;
     Objeto.NOMBRE.Control:=nil;
end;

procedure TWCrSolExcesoAc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TWCrSolExcesoAc.CadenaSql: String;
var vlSql     : String;
begin
   vlSql  := ' SELECT CSE.ID_SOL_EXCESO,'+ coCRLF +
             '        CSE.F_ALTA,'+ coCRLF +
             '        CDA.ID_CONTRATO,'+ coCRLF +
             '        CO.IMP_AUTORIZADO,'+ coCRLF +
             '        M.DESC_MONEDA,'+ coCRLF +
             '        CSE.IMP_EXCESO_EVE / NVL( PKGCORPO.OBTTIPOCAMBIO(CDA.F_TIPO_CAMBIO, CTO.CVE_MONEDA, ''V'' ), 1 ) AS IMP_EXCESO_VAL, '+ coCRLF +
             '        CSE.IMP_EXCESO_EVE,'+ coCRLF +
             '        DECODE(CDA.CVE_TIPO_MOVTO, ''I'', ''Incremento'','+ coCRLF +
             '                                   ''D'', ''Decremento'', ''Avisar a Sistemas'') AS TIPO_MOVIMIENTO, '+ coCRLF +
             '        CSE.F_INI_EXCESO,'+ coCRLF +
             '        CSE.F_VTO_EXCESO,'+ coCRLF +
             '        CDA.SIT_DET_EXCESO,'+ coCRLF +
             '        CTO.ID_TITULAR'+ coCRLF +
             ' FROM CR_SOL_EXCESO_AC CSE,'+ coCRLF +
             '      CR_DET_EXCESO_AU CDA,'+ coCRLF +
             '      CONTRATO CTO,'+ coCRLF +
             '      CR_CONTRATO CO, '+ coCRLF +
             '      MONEDA M '+ coCRLF +             
             ' WHERE CSE.ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString+ coCRLF +
             '   AND CSE.ID_SOL_EXCESO = CDA.ID_SOL_EXCESO '+ coCRLF +
             '   AND CSE.ID_ACREDITADO = CDA.ID_ACREDITADO '+ coCRLF +
             '   AND CDA.ID_CONTRATO   = CTO.ID_CONTRATO '+ coCRLF +
             '   AND CTO.ID_CONTRATO   = CO.ID_CONTRATO '+ coCRLF +
             '   AND M.CVE_MONEDA      = CTO.CVE_MONEDA '+ coCRLF +
             ' ORDER BY CDA.SIT_DET_EXCESO, CSE.ID_SOL_EXCESO, CDA.ID_CONTRATO '+ coCRLF;
   CadenaSql := vlSql;
end;

procedure TWCrSolExcesoAc.MuestraDatos;
var vlQry : TQuery;
begin
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('ID_TITULAR').Visible := False;
            vlQry.FieldByName('ID_SOL_EXCESO').DisplayWidth := 5;
            vlQry.FieldByName('F_ALTA').DisplayWidth := 11;
            vlQry.FieldByName('DESC_MONEDA').DisplayWidth := 18;
            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 10;
            vlQry.FieldByName('IMP_AUTORIZADO').DisplayWidth := 15;
            vlQry.FieldByName('IMP_EXCESO_VAL').DisplayWidth := 13;
            vlQry.FieldByName('IMP_EXCESO_EVE').DisplayWidth := 13;
            vlQry.FieldByName('TIPO_MOVIMIENTO').DisplayWidth := 10;
            vlQry.FieldByName('F_INI_EXCESO').DisplayWidth := 10;
            vlQry.FieldByName('F_VTO_EXCESO').DisplayWidth := 10;
            vlQry.FieldByName('SIT_DET_EXCESO').DisplayWidth := 3;
            TNumericField(vlQry.FieldByName('IMP_AUTORIZADO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_EXCESO_VAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_EXCESO_EVE')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else Begin
           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrSolExcesoAc.InterForma1DespuesShow(Sender: TObject);
begin
     MuestraDatos;
end;

procedure TWCrSolExcesoAc.Autorizacion(pContrato, pTitular: String);
var   vlContratoCre        : TCrCto; //Contrato Crédito
begin
      {$WARNINGS OFF}
      vlContratoCre := TCrCto.Create(Self);
      {$WARNINGS ON}
      try
          vlContratoCre.GetParams(Objeto);
          vlContratoCre.ParamCre := Objeto.ParamCre;
          vlContratoCre.FindKey([pContrato,'1']);
          vlContratoCre.Acreditado.FindKey([pTitular]);
          vlContratoCre.Catalogo;
      finally
             vlContratoCre.Free;
      end;
      MuestraDAtos;
end;

procedure TWCrSolExcesoAc.sgcDATOSDblClick(Sender: TObject);
begin
    Autorizacion(sgcDATOS.CellStr['ID_CONTRATO',sgcDATOS.SG.Row],
                 sgcDATOS.CellStr['ID_TITULAR',sgcDATOS.SG.Row]);
end;

end.
