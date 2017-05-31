// Sistema         : Clase de CrAcrDmPS
// Fecha de Inicio : 01/04/2013
// Función forma   : Clase de CrAcrDmPS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCracrdmps;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, IntLinkit,
IntCrAcredit,    //ACREDITADO
IntPers          //PERSONA
;

Type
 TCracrdmps= class; 

  TWCracrdmps=Class(TForm)
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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edACREDITADO: TEdit;
    edNOMBRE_ACRED: TEdit;
    GroupBox2: TGroupBox;
    ChBIncumpli: TCheckBox;
    ChBGtiasOtor: TCheckBox;
    ChBPrelaAcre: TCheckBox;
    ChBliqacre: TCheckBox;
    Label2: TLabel;
    IEfechaModifica: TEdit;
    Label3: TLabel;
    IEUsuarioModifica: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCracrdmps;
end;
 TCracrdmps= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre          : TParamCre;
        Acreditado        : TCrAcredit;
        Persona           : TPersona;

        ID_ACREDITADO       : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        {IMP_MAX_AUTOR       : TInterCampo;
        IMP_MINIMO_AUTOR    : TInterCampo;
        IMP_DISPUESTO       : TInterCampo;
        PLAZO_MAX_LINEA     : TInterCampo;
        PLAZO_MIN_LINEA     : TInterCampo;
        B_ACREDITADO_REL    : TInterCampo;
        TIPO_ACRED_REL      : TInterCampo;
        CVE_GRUPO_ECO       : TInterCampo;
        CVE_SECTOR_ECO      : TInterCampo;
        CVE_TAM_ACRED       : TInterCampo;
        CVE_CALIFACION      : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;


        B_AUTORIZADO        : TInterCampo;
        F_AUTORIZACION      : TInterCampo;
        CVE_USU_AUTORIZA    : TInterCampo;
        SIT_ACREDITADO      : TInterCampo;
        B_ACT_EMP           : TInterCampo;
        B_APLI_REL_MON      : TInterCampo;
        DIAS_PAGO           : TInterCampo;
        DIAS_ADICIONALES    : TInterCampo;
        CVE_GPO_CAPITALIZ   : TInterCampo;
        CVE_SENICREB        : TInterCampo;
        CVE_LOCAL_CNBV      : TInterCampo;
        B_INF_EXP_PAGO      : TInterCampo;
        B_AVALA_GOB_EDO     : TInterCampo;
        CVE_TIPO_RELAC      : TInterCampo;
        IMP_EXCESO_EVE      : TInterCampo;
        F_VTO_EXCESO        : TInterCampo;
        F_INI_EXCESO        : TInterCampo;
        CVE_TIP_DISPOS      : TInterCampo;
        CVE_AFEC_INC_DEC    : TInterCampo;
        PLAZO_MIN_DOCTO     : TInterCampo;
        NOM_ACRED_REG       : TInterCampo;
        CVE_ACRED_RELAC     : TInterCampo;
        CVE_PER_JUR_REG     : TInterCampo;
        CVE_SECTOR_REG      : TInterCampo;
        NUM_EMPLEADOS       : TInterCampo;
        RFC_CNBV            : TInterCampo;
        CVE_RIESGO_PAIS     : TInterCampo;
        CVE_RIESGO_FINAN    : TInterCampo;
        CVE_RIESGO_INDUS    : TInterCampo;
        CVE_METODOLOGIA     : TInterCampo;
        B_ENTIDAD_FIN       : TInterCampo;
        CVE_AVE             : TInterCampo;
        CVE_BURO            : TInterCampo;
        CVE_ACREDIT_CNBV    : TInterCampo;
        CVE_CARTERA_R04     : TInterCampo; }

        B_PROB_INCUMPLI     : TInterCampo;
        B_GTIAS_OTORGADAS   : TInterCampo;
        B_PRELACION_PAGO    : TInterCampo;
        B_LIQUIDEZ          : TInterCampo;
        

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


constructor TCracrdmps.Create( AOwner : TComponent ); 
begin Inherited;


      ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftString,tsNinguno,tsNinguno,True);
                            ID_ACREDITADO.Caption := 'Acreditado';
      F_MODIFICA := CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      B_PROB_INCUMPLI := CreaCampo('B_PROB_INCUMPLI',ftString,tsNinguno,tsNinguno,True);
                      B_PROB_INCUMPLI.Caption := 'Prob Incumplimiento';

      B_GTIAS_OTORGADAS := CreaCampo('B_GTIAS_OTORGADAS',ftString,tsNinguno,tsNinguno,True);
                      B_GTIAS_OTORGADAS.Caption := 'Garantías Otorgadas';

      B_PRELACION_PAGO := CreaCampo('B_PRELACION_PAGO',ftString,tsNinguno,tsNinguno,True);
                      B_PRELACION_PAGO.Caption := 'Prelación Pago';

      B_LIQUIDEZ := CreaCampo('B_LIQUIDEZ',ftString,tsNinguno,tsNinguno,True);
                      B_LIQUIDEZ.Caption := 'Liquidez';


      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;


      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_ACREDITADO';
      //RIRA4281 17Jun2010 Se filtran los acreditados activos y las personas activas
      Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO WHERE SIT_ACREDITADO = ''AC'') AND PERSONA.SIT_PERSONA = ''AC''';
      Persona.FilterString := Persona.BuscaWhereString;




      FKeyFields.Add('ID_ACREDITADO');

      TableName := 'CR_ACREDITADO';
      UseQuery := True;
      HelpFile := 'IntCracrdmps.Hlp';
      ShowMenuReporte:=True;
      
end;

Destructor TCracrdmps.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   if Persona <> nil then
      Persona.free;
inherited;
end;


function TCracrdmps.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCracrdmps;
begin
   W:=TWCracrdmps.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnEliminar := False;      
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCracrdmps.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
{      T := CreaBuscador('ICracrdm.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([Persona.ID_PERSONA.AsInteger]);
      finally  T.Free;
      end;}
      Result := False;
   if Persona.Busca then
      InternalBusca := FindKey([Persona.ID_PERSONA.AsInteger]);
end;

function TCracrdmps.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrAcrDmPS********************)
(*                                                                              *)
(*  FORMA DE CrAcrDmPS                                                            *)
(*                                                                              *)
(***********************************************FORMA CrAcrDmPS********************)

procedure TWCracrdmps.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;

      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;


      Objeto.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.B_PROB_INCUMPLI.Control := ChBIncumpli;
      Objeto.B_GTIAS_OTORGADAS.Control := ChBliqacre;
      Objeto.B_PRELACION_PAGO.Control := ChBPrelaAcre;
      Objeto.B_LIQUIDEZ.Control := ChBGtiasOtor;

      Objeto.F_MODIFICA.Control := IEFechaModifica;
      Objeto.CVE_USU_MODIFICA.Control := IEUsuarioModifica;


end;

procedure TWCracrdmps.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ACREDITADO.Control:= nil;
      Objeto.B_PROB_INCUMPLI.Control := nil;
      Objeto.B_GTIAS_OTORGADAS.Control := nil;
      Objeto.B_PRELACION_PAGO.Control := nil;
      Objeto.B_LIQUIDEZ.Control := nil;

      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
end;

procedure TWCracrdmps.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCracrdmps.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCracrdmps.InterForma1DespuesModificar(Sender: TObject);
var  vlsql  : String;
     Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

//procedure TWCracrdmps.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWCracrdmps.InterForma1Buscar(Sender: TObject);
begin
      Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
      Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
      Objeto.Acreditado.ShowAll := True;
   If Objeto.Busca Then Begin
//      InterForma1.NextTab(edACREDITADO);
   End;
end;

end.
