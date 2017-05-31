// Sistema         : Clase de CR_CON_FALTANTES
// Fecha de Inicio : 26/11/2008
// Función forma   : Clase de CR_CON_FALTANTES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrConFalt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, InterApl, DBGrids,

IntGenCre,
IntParamCre, IntSGCtrl       // Parametros Crédito
;

Type
 TCrConFalt= class; 

  TWCrConFaltantes=Class(TForm)
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
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1CVE_MONEDA: TFloatField;
    Query1CVE_CTA_CONTABLE: TStringField;
    Query1CVE_PRODUCTO: TStringField;
    Query1DESC_L_PRODUCTO: TStringField;
    Query1ID_CREDITO: TFloatField;
    Query1ID_ACREDITADO: TFloatField;
    Query1NOM_ACREDITADO: TStringField;
    Query1CVE_TIPO_SECTOR: TStringField;
    sgcDATA: TSGCtrl;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrConFalt;
end; 
 TCrConFalt= class(TInterFrame) 
      private 
      protected 
      public 
        { Public declarations }
        ParamCre : TParamCre;
        vgCVE_CTA_CONTABLE  : String;
        vgF_OPERACION       : TDateTime;

        function ArmaSQL(peCVE_CTA_CONTABLE : String; peF_OPERACION : TDateTime) : String;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

procedure MuestraVentana(peApli : TInterApli; peParamCre : TParamCre; peCVE_CTA_CONTABLE : String; peF_OPERACION : TDateTime);

implementation

{$R *.DFM}

procedure MuestraVentana(peApli : TInterApli; peParamCre : TParamCre; peCVE_CTA_CONTABLE : String; peF_OPERACION : TDateTime);
var CrConFalt : TCrConFalt;
begin
  {$WARNINGS OFF}
  CrConFalt := TCrConFalt.Create(Nil);
  {$WARNINGS ON}  
  If Assigned(CrConFalt) Then
    With CrConFalt Do
      Try
         Apli     := peApli;
         ParamCre := peParamCre;
         vgCVE_CTA_CONTABLE := peCVE_CTA_CONTABLE;
         vgF_OPERACION := peF_OPERACION;
         Catalogo;
      Finally
         CrConFalt.Free;
      End;
end;

constructor TCrConFalt.Create( AOwner : TComponent );
begin Inherited; 
      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrConFalt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrConFalt.Destroy;
begin inherited;
end;


function TCrConFalt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConFaltantes;
begin
   W:=TWCrConFaltantes.Create(Self);
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


Function TCrConFalt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCoFa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CON_FALTANTES********************)
(*                                                                              *)
(*  FORMA DE CR_CON_FALTANTES                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CON_FALTANTES********************)

procedure TWCrConFaltantes.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      Query1.Close;
      Query1.DatabaseName := Apli.DatabaseName;
      Query1.SessionName  := Apli.SessionName;
      Try
        Query1.SQL.Clear;
        Query1.FieldByName('CVE_CTA_CONTABLE').DisplayLabel := 'CVE_CTA_CONTABLE' + #30 +'>C';
        Query1.FieldByName('CVE_MONEDA').DisplayLabel       := 'CVE_MONEDA' + #30 +'>C';
        Query1.FieldByName('CVE_PRODUCTO').DisplayLabel     := 'CVE_PRODUCTO' + #30 +'>C';
        Query1.FieldByName('DESC_L_PRODUCTO').DisplayLabel  := 'DESC_L_PRODUCTO' + #30 +'>C';
        Query1.FieldByName('ID_CREDITO').DisplayLabel       := 'ID_CREDITO' + #30 +'>C';
        Query1.FieldByName('ID_ACREDITADO').DisplayLabel    := 'ID_ACREDITADO' + #30 +'>C';
        Query1.FieldByName('NOM_ACREDITADO').DisplayLabel   := 'NOM_ACREDITADO' + #30 +'>C';
        Query1.FieldByName('CVE_TIPO_SECTOR').DisplayLabel  := 'CVE_TIPO_SECTOR' + #30 +'>C';


        Query1.FieldByName('CVE_CTA_CONTABLE').DisplayWidth := 20;
        Query1.FieldByName('CVE_MONEDA').DisplayWidth       := 12;
        Query1.FieldByName('CVE_PRODUCTO').DisplayWidth     := 18;
        Query1.FieldByName('DESC_L_PRODUCTO').DisplayWidth  := 55;
        Query1.FieldByName('ID_CREDITO').DisplayWidth       := 15;
        Query1.FieldByName('ID_ACREDITADO').DisplayWidth    := 15;
        Query1.FieldByName('NOM_ACREDITADO').DisplayWidth   := 55;
        Query1.FieldByName('CVE_TIPO_SECTOR').DisplayWidth  := 10;

        Query1.SQL.Add( ArmaSQL(vgCVE_CTA_CONTABLE, vgF_OPERACION) );
        Query1.Open;

        sgcDATA.SG.Canvas.Font.Size := 8;
        sgcDATA.AddQry( Query1, True,True,-1,-1,-1,False);
      Finally
      End;
    End;
end;

procedure TWCrConFaltantes.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    End;
end;

procedure TWCrConFaltantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;
  Action := caFree;
end;

function TCrConFalt.ArmaSQL(peCVE_CTA_CONTABLE : String; peF_OPERACION : TDateTime): String;
var vlStrSQL, vlStrFOL_GENERACION : String;
begin
  GetSQLStr(' SELECT FOL_GENERACION FROM CR_CONT_GEN_TRAN'+coCRLF+
            ' WHERE F_OPERACION ='+SQLFecha(peF_OPERACION),
             Apli.DatabaseName, Apli.SessionName, 'FOL_GENERACION', vlStrFOL_GENERACION,
             True);

  vlStrSQL := ' SELECT CCGTD.CVE_MONEDA, CCGTD.CVE_CTA_CONTABLE, CCGTD.CVE_PRODUCTO,'+coCRLF+
              '        CP.DESC_L_PRODUCTO, CCGTD.ID_CREDITO, CCGTD.ID_ACREDITADO, P.NOMBRE AS NOM_ACREDITADO, P.CVE_TIPO_SECTOR'+coCRLF+
              ' FROM CR_CONT_GEN_TR_D CCGTD,'+coCRLF+
              '      PERSONA P,'+coCRLF+
              '      CR_PRODUCTO CP'+coCRLF+
              ' WHERE CCGTD.FOL_GENERACION = '+vlStrFOL_GENERACION+coCRLF+
              '   AND CCGTD.CVE_CTA_CONTABLE IN ('+peCVE_CTA_CONTABLE+')'+coCRLF+
              '   AND CP.CVE_PRODUCTO_CRE = CCGTD.CVE_PRODUCTO'+coCRLF+
              '   AND P.ID_PERSONA = CCGTD.ID_ACREDITADO'+coCRLF;
              
  Result := vlStrSQL;
end;

end.
