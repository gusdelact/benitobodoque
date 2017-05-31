// Sistema         : Clase de CR_MUNICIPIO
// Fecha de Inicio : 07/10/2005
// Función forma   : Clase de CR_MUNICIPIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrMunicip;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCrGruCla, IntLinkit;

Type
 TCrMunicip= class; 

  TWCrMunicipio=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_ESTADO : TLabel; 
    edCVE_ESTADO : TEdit;
    lbCVE_MUNICIPIO : TLabel; 
    edCVE_MUNICIPIO : TEdit;
    lbDESC_MUNICIPIO : TLabel; 
    edDESC_MUNICIPIO : TEdit; 
    edDESC_ESTADO : TEdit;
    btnEstado: TBitBtn;
    ilCVE_ESTADO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnEstadoClick(Sender: TObject);
    procedure ilCVE_ESTADOEjecuta(Sender: TObject);
    procedure edCVE_ESTADOExit(Sender: TObject);
    procedure edCVE_MUNICIPIOExit(Sender: TObject);
    procedure edDESC_MUNICIPIOExit(Sender: TObject);
    private
    { Private declarations }
    public
       
    { Public declarations } 
    Objeto : TCrMunicip;
end; 
 TCrMunicip= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_ESTADO               : TInterCampo;
        CVE_MUNICIPIO            : TInterCampo;
        DESC_MUNICIPIO           : TInterCampo;
        DESC_ESTADO              : TInterCampo;

        Estado : TCrGruCla;

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


constructor TCrMunicip.Create( AOwner : TComponent );
begin Inherited;
      CVE_ESTADO :=CreaCampo('CVE_ESTADO',ftString,tsNinguno,tsNinguno,True);
                CVE_ESTADO.Caption:='Clave de Estado';
      CVE_MUNICIPIO :=CreaCampo('CVE_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MUNICIPIO.Caption:='Clave de Municipio';
      DESC_MUNICIPIO :=CreaCampo('DESC_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                DESC_MUNICIPIO.Caption:='Descripción Municipio';
      DESC_ESTADO :=CreaCampo('DESC_ESTADO',ftString,tsNinguno,tsNinguno,False);
                DESC_ESTADO.Caption:='Descripción Estado';
      FKeyFields.Add('CVE_ESTADO');
      FKeyFields.Add('CVE_MUNICIPIO');

      TableName := 'CR_MUNICIPIO';
      UseQuery := True;
      HelpFile := 'IntCrMunicip.Hlp';
      ShowMenuReporte:=True;

      Estado   := TCrGruCla.Create(Self);
      Estado.MasterSource:=Self;

end;

Destructor TCrMunicip.Destroy;
begin
   If Estado <> nil Then
      Estado.Free;
   inherited;
end;


function TCrMunicip.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMunicipio;
begin
   W:=TWCrMunicipio.Create(Self);
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


Function TCrMunicip.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMunic.it','S,S');
      Try if Active then begin T.Param(0,CVE_ESTADO.AsString); 
                               T.Param(1,CVE_MUNICIPIO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrMunicip.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MUNICIPIO********************)
(*                                                                              *)
(*  FORMA DE CR_MUNICIPIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MUNICIPIO********************)

procedure TWCrMunicipio.FormShow(Sender: TObject);
begin
      Objeto.CVE_ESTADO.Control:=edCVE_ESTADO;
      Objeto.CVE_MUNICIPIO.Control:=edCVE_MUNICIPIO;
      Objeto.DESC_MUNICIPIO.Control:=edDESC_MUNICIPIO;
      Objeto.DESC_ESTADO.Control:=edDESC_ESTADO;

      Objeto.Estado.CVE_REFERENCIA.Control:= edCVE_ESTADO;
      Objeto.Estado.VALOR.Control:= edDESC_ESTADO;
end;

procedure TWCrMunicipio.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ESTADO.Control:=nil;
      Objeto.CVE_MUNICIPIO.Control:=nil;
      Objeto.DESC_MUNICIPIO.Control:=nil;
      Objeto.DESC_ESTADO.Control:=nil;
      Objeto.Estado.CVE_REFERENCIA.Control:= nil;
      Objeto.Estado.VALOR.Control:= nil;
end;

procedure TWCrMunicipio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMunicipio.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrMunicipio.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMunicipio.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWCrMunicipio.btnEstadoClick(Sender: TObject);
begin
   Objeto.Estado.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''CVEEDO''';
   If Objeto.Estado.Busca Then Begin
      InterForma1.NextTab(btnEstado);
   End;
end;

procedure TWCrMunicipio.ilCVE_ESTADOEjecuta(Sender: TObject);
begin
   If Objeto.Estado.FindKey(['CVEEDO',ilCVE_ESTADO.Buffer]) Then
      InterForma1.NextTab(edCVE_ESTADO);
end;

procedure TWCrMunicipio.edCVE_ESTADOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_ESTADO.GetFromControl;
      If Objeto.CVE_ESTADO.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la Clave del Estado';
      End;
      InterForma1.ValidaExit(edCVE_ESTADO,vlSalida,vlMsg,True);
   end;

end;

procedure TWCrMunicipio.edCVE_MUNICIPIOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg, sSQL : String; qyQuery : TQuery;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_MUNICIPIO.GetFromControl;
      If Objeto.CVE_MUNICIPIO.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la clave del municipio';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            Objeto.CVE_ESTADO.GetFromControl;
            sSQL:='SELECT * FROM CR_MUNICIPIO WHERE CVE_ESTADO='''+
                     Objeto.CVE_ESTADO.AsString+ ''''+
                  '   AND CVE_MUNICIPIO='''+ Objeto.CVE_MUNICIPIO.AsString +'''';
            qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> nil Then Begin
               If Trim(qyQuery.FieldByName('CVE_ESTADO').AsString)<>'' Then Begin
                  vlSalida:= False;
                  vlmsg := 'El registro ya existe';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_MUNICIPIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrMunicipio.edDESC_MUNICIPIOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.DESC_MUNICIPIO.GetFromControl;
      If Objeto.DESC_MUNICIPIO.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la Decripción de Municipio';
      End;
      InterForma1.ValidaExit(edDESC_MUNICIPIO,vlSalida,vlMsg,True);
   end;
end;

end.
