// Sistema         : Clase de CR_MAP_MUNICIPIO
// Fecha de Inicio : 07/10/2005
// Función forma   : Clase de CR_MAP_MUNICIPIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrMapMuni;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre,IntPob, IntCrMunicip,
  IntLinkit;

Type
 TCrMapMuni= class; 

  TWCrMapMunicipio=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_ESTADO : TLabel; 
    edCVE_ESTADO : TEdit;
    lbCVE_MPIO_CORP : TLabel; 
    edCVE_MPIO_CORP : TEdit;
    lbCVE_MPIO_CLAVE : TLabel; 
    edCVE_MPIO_CLAVE : TEdit; 
    edDESC_ESTADO : TEdit; 
    edDESC_MUNICIPIO : TEdit;
    edDESC_MUN_MAP : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    BitBtn9: TBitBtn;
    ilMunicipio: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_MPIO_CLAVEExit(Sender: TObject);
    procedure edDESC_MUN_MAPExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    private
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrMapMuni;
end;
 TCrMapMuni= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_ESTADO               : TInterCampo;
        CVE_MPIO_CORP            : TInterCampo;
        CVE_MPIO_CLAVE           : TInterCampo;
        DESC_ESTADO              : TInterCampo;
        DESC_MUNICIPIO           : TInterCampo;
        DESC_MUN_MAP             : TInterCampo;

        ParamCre                 : TParamCre;
        Municipio : TPoblacion;
        Estado : TPoblacion;
        CrMunicip : TCrMunicip;

        sEstado, sMunicipio: String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation

{$R *.DFM}


constructor TCrMapMuni.Create( AOwner : TComponent );
begin Inherited;
      CVE_ESTADO :=CreaCampo('CVE_ESTADO',ftString,tsNinguno,tsNinguno,True);
                CVE_ESTADO.Caption:='Clave de Estado';
      CVE_MPIO_CORP :=CreaCampo('CVE_MPIO_CORP',ftString,tsNinguno,tsNinguno,True);
                CVE_MPIO_CORP.Caption:='Clave de Mpio Corp';
      CVE_MPIO_CLAVE :=CreaCampo('CVE_MPIO_CLAVE',ftString,tsNinguno,tsNinguno,True);
                CVE_MPIO_CLAVE.Caption:='Clave de Mpio Clave';
      DESC_ESTADO :=CreaCampo('DESC_ESTADO',ftString,tsNinguno,tsNinguno,False);
                DESC_ESTADO.Caption:='Descripción de Estado';
      DESC_MUNICIPIO :=CreaCampo('DESC_MUNICIPIO',ftString,tsNinguno,tsNinguno,False);
                DESC_MUNICIPIO.Caption:='Descripción Municipio';
      DESC_MUN_MAP :=CreaCampo('DESC_MUN_MAP',ftString,tsNinguno,tsNinguno,False);
                DESC_MUN_MAP.Caption:='Descripción Mun. Mapeado';
      FKeyFields.Add('CVE_ESTADO');
      FKeyFields.Add('CVE_MPIO_CORP');

      TableName := 'CR_MAP_MUNICIPIO';
      UseQuery := True;
      HelpFile := 'IntCrMapMuni.Hlp';
      ShowMenuReporte:=True;

      Municipio  := TPoblacion.Create(Self);
      Municipio.MasterSource:=Self;
      Estado  := TPoblacion.Create(Self);
      Estado.MasterSource:=Self;
      CrMunicip := TCrMunicip.Create(Self);
      CrMunicip.MasterSource:=Self;;
end;

Destructor TCrMapMuni.Destroy;
begin
   If Municipio <> Nil Then
      Municipio.Free;
   If Estado <> Nil Then
      Estado.Free;
   If CrMunicip <> Nil Then
      CrMunicip.Free;
inherited;
end;


function TCrMapMuni.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMapMunicipio;
begin
   W:=TWCrMapMunicipio.Create(Self);
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


Function TCrMapMuni.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMaMu.it','S,S');
      Try if Active then begin T.Param(0,CVE_ESTADO.AsString); 
                               T.Param(1,CVE_MPIO_CORP.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrMapMuni.Reporte:Boolean; 
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_MAP_MUNICIPIO********************)
(*                                                                              *)
(*  FORMA DE CR_MAP_MUNICIPIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MAP_MUNICIPIO********************)

procedure TWCrMapMunicipio.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_ESTADO.Control:=edCVE_ESTADO;
      Objeto.CVE_MPIO_CORP.Control:=edCVE_MPIO_CORP;
      Objeto.CVE_MPIO_CLAVE.Control:=edCVE_MPIO_CLAVE;
      Objeto.DESC_ESTADO.Control:=edDESC_ESTADO;
      Objeto.DESC_MUNICIPIO.Control:=edDESC_MUNICIPIO;
      Objeto.DESC_MUN_MAP.Control:=edDESC_MUN_MAP;
      Objeto.Municipio.Cve_Poblacion.Control:= edCVE_MPIO_CORP;
      Objeto.Municipio.Desc_Poblacion.Control:= edDESC_MUNICIPIO;
      Objeto.Estado.Cve_Poblacion.Control:= edCVE_ESTADO;
      Objeto.Estado.Desc_Poblacion.Control:= edDESC_ESTADO;
      Objeto.CrMunicip.CVE_MUNICIPIO.Control:= edCVE_MPIO_CLAVE;
      Objeto.CrMunicip.DESC_MUNICIPIO.Control:= edDESC_MUN_MAP;
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrMapMunicipio.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ESTADO.Control:=nil;
      Objeto.CVE_MPIO_CORP.Control:=nil;
      Objeto.CVE_MPIO_CLAVE.Control:=nil;
      Objeto.DESC_ESTADO.Control:=nil;
      Objeto.DESC_MUNICIPIO.Control:=nil;
      Objeto.DESC_MUN_MAP.Control:=nil;
      Objeto.Municipio.Cve_Poblacion.Control:= nil;
      Objeto.Municipio.Desc_Poblacion.Control:= nil;
      Objeto.Estado.Cve_Poblacion.Control:= nil;
      Objeto.Estado.Desc_Poblacion.Control:= nil;
      Objeto.CrMunicip.CVE_MUNICIPIO.Control:= nil;
      Objeto.CrMunicip.DESC_MUNICIPIO.Control:= nil;
end;

procedure TWCrMapMunicipio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMapMunicipio.InterForma1DespuesNuevo(Sender: TObject);
begin
   If (Objeto.sEstado <> '')and(Objeto.sMunicipio <> '')  Then Begin
      Objeto.Municipio.FindKey([Objeto.sMunicipio]);
      Objeto.Estado.FindKey([Objeto.sEstado]);
   End;
   edCVE_MPIO_CLAVE.SetFocus;
end;

procedure TWCrMapMunicipio.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMapMunicipio.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrMapMunicipio.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var
   CrMunicip: TCrMunicip; bContinua: Boolean;
   sSQL, sSQL2: String; qyQuery,qyQuery2: TQuery;
begin
   Objeto.CVE_ESTADO.GetFromControl;
   bContinua:= False;
   If (Objeto.CVE_ESTADO.AsString <> '') Then Begin
      sSQL:= 'SELECT CVE_CLAVE '+
             '  FROM CR_MAPEO_CLAVE '+
             ' WHERE CVE_GRUPO_CLAVE = ''CVEEDO'''+
             '   AND CVE_CORP = '''+ Objeto.CVE_ESTADO.AsString +'''';
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> nil Then Begin
         Objeto.CVE_MPIO_CLAVE.GetFromControl;
         Objeto.DESC_MUN_MAP.GetFromControl;

         sSQL2:= ' select * from CR_MUNICIPIO '+
                 '  where CVE_ESTADO = '''+ qyQuery.FieldByName('CVE_CLAVE').AsString +''''+
                 '    and CVE_MUNICIPIO = '''+ Objeto.CVE_MPIO_CLAVE.AsString +'''';
         qyQuery2:= GetSQLQueryNoNil(sSQL2, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         If qyQuery2 <> nil Then Begin
            If Trim(qyQuery2.FieldByName('CVE_ESTADO').AsString)='' Then Begin
               Try
                  CrMunicip:= TCrMunicip.Create(Nil);
                  CrMunicip.IsCheckSecu := False;
                  CrMunicip.Apli := Objeto.Apli;
                  CrMunicip.Append;
                  CrMunicip.CVE_ESTADO.AsString:= qyQuery.FieldByName('CVE_CLAVE').AsString;
                  CrMunicip.CVE_MUNICIPIO.AsString := Objeto.CVE_MPIO_CLAVE.AsString;
                  CrMunicip.DESC_MUNICIPIO.AsString:= Objeto.DESC_MUN_MAP.AsString;
                  bContinua:= CrMunicip.InternalPost;
               Finally
                  CrMunicip.Free;
               End;
            End Else Begin
               bContinua:= True;
            End;
            qyQuery2.Free;
         End;
         qyQuery.Free;
      End;
   End;
   Realizado:=bContinua;
end;

procedure TWCrMapMunicipio.edCVE_MPIO_CLAVEExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg, sSQL : String; qyQuery : TQuery;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_MPIO_CLAVE.GetFromControl;
      If Objeto.CVE_MPIO_CLAVE.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la clave del municipio';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            Objeto.CVE_ESTADO.GetFromControl;
            Objeto.CVE_MPIO_CORP.GetFromControl;
            sSQL:='SELECT * FROM CR_MAP_MUNICIPIO WHERE CVE_ESTADO='''+
                     Objeto.CVE_ESTADO.AsString+ ''''+
                  '   AND CVE_MPIO_CORP='''+ Objeto.CVE_MPIO_CORP.AsString +'''';
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
      InterForma1.ValidaExit(edCVE_MPIO_CLAVE,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrMapMunicipio.edDESC_MUN_MAPExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.DESC_MUN_MAP.GetFromControl;
      If Objeto.DESC_MUN_MAP.AsString = '' Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar la descripción del Municipio';
      End;
      InterForma1.ValidaExit(edDESC_MUN_MAP,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrMapMunicipio.BitBtn9Click(Sender: TObject);
Var sSQL: String; qyQuery: TQuery;
begin
   Objeto.CVE_ESTADO.GetFromControl;
   sSQL:= 'SELECT CVE_CLAVE '+
          '  FROM CR_MAPEO_CLAVE '+
          ' WHERE CVE_GRUPO_CLAVE = ''CVEEDO'''+
          '   AND CVE_CORP = '''+ Objeto.CVE_ESTADO.AsString +'''';
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> nil Then Begin
      If qyQuery.FieldByName('CVE_CLAVE').AsString <> '' Then Begin
         Objeto.CrMunicip.BuscaWhereString:= ' CVE_ESTADO = '''+ qyQuery.FieldByName('CVE_CLAVE').AsString+'''';
         If Objeto.CrMunicip.Busca Then Begin
            InterForma1.NextTab(BitBtn9);
         End;
      End Else Begin
         ShowMessage('El Estado no esta dado de Alta');
      End;
      qyQuery.Free;
   End;
end;

end.
