// Sistema         : Clase de SFE_RECEPTOR
// Fecha de Inicio : 27/11/2009
// Función forma   : Clase de SFE_RECEPTOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntSfeRecept;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,      IntGenCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSfeCompro, IntSfeConcep,IntParamCre,
IntPers,        //Personas;
IntMensaje
;

Type
 TSfeRecept= class;

  TWSfeReceptor=Class(TForm)
    InterForma1             : TInterForma; 
    lbSERIE_RECIBO : TLabel;
    edSERIE_RECIBO : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    bbConceptos: TButton;
    bbComprobante: TButton;
    bbPersonas: TButton;
    bbCancelar: TButton;
    bbActualizar: TButton;
    GroupBox1: TGroupBox;
    lbID_CESION: TLabel;
    edID_CESION: TEdit;
    lbID_DOCUMENTO: TLabel;
    edID_DOCUMENTO: TEdit;
    lbID_PROVEEDOR: TLabel;
    edID_PROMOTOR: TEdit;
    lbNOMBRE_PROVEEDOR: TLabel;
    edNOMBRE_PROMOTOR: TEdit;
    GroupBox2: TGroupBox;
    lbID_PERSONA: TLabel;
    edID_PERSONA: TEdit;
    edNOMBRE_CLIENTE: TEdit;
    lbRFC_CONTRATANTE: TLabel;
    edRFC_CONTRATANTE: TEdit;
    lbID_CLIENTE: TLabel;
    edID_CLIENTE: TEdit;
    lbE_MAIL: TLabel;
    edE_MAIL: TEdit;
    GroupBox3: TGroupBox;
    lbCALLE_NUMERO: TLabel;
    edCALLE_NUMERO: TEdit;
    lbNUM_EXTERIOR: TLabel;
    edNUM_EXTERIOR: TEdit;
    lbNUM_INTERIOR: TLabel;
    edNUM_INTERIOR: TEdit;
    lbCOLONIA: TLabel;
    edCOLONIA: TEdit;
    lbNOM_LOCALIDAD: TLabel;
    edNOM_LOCALIDAD: TEdit;
    lbNOM_MUNICIPIO: TLabel;
    edNOM_MUNICIPIO: TEdit;
    lbNOM_ESTADO: TLabel;
    edNOM_ESTADO: TEdit;
    edNOM_PAIS: TEdit;
    lbNOM_PAIS: TLabel;
    lbCODIGO_POSTAL: TLabel;
    edCODIGO_POSTAL: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edSIT_DOCUMENTO: TEdit;
    edSIT_PROCESO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bbConceptosClick(Sender: TObject);
    procedure bbComprobanteClick(Sender: TObject);
    procedure bbPersonasClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure bbActualizarClick(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TSfeRecept;
    function ObtenIDProveedor : String;
    procedure   MuestraError( vlError : String );
    procedure   LeeStatus;
    Function    Revisa_transaccion(peId_transaccion:integer):string;
    {Function   Revisa_Dupla(peId_Cesion, pesit_documento:Integer; peId_Documento, peSerie:string):string;
    02Ene2014 HCF Esta función ya no se va a usar porque la actualización de los documentos asociados se va a hacer
                  con PKGCR_FACTURA_ELECTRONICA.stp_Solicita_Cancel_ReEnvio y la columna SFE_SERIES_CVETR.SERIE_ASOCIADA}

end;
 TSfeRecept= class(TInterFrame)
      private

      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        ParamCre                 : TParamCre;


        { Public declarations } 
        SERIE_RECIBO             : TInterCampo;
        ID_CESION                : TInterCampo;
        ID_DOCUMENTO             : TInterCampo;
        ID_PROMOTOR              : TInterCampo;
        NOMBRE_PROMOTOR          : TInterCampo;
        ID_CLIENTE               : TInterCampo;
        ID_PERSONA               : TInterCampo;
        RFC_CONTRATANTE          : TInterCampo;
        NOMBRE_CLIENTE           : TInterCampo;
        CALLE_NUMERO             : TInterCampo;
        NUM_EXTERIOR             : TInterCampo;
        NUM_INTERIOR             : TInterCampo;
        COLONIA                  : TInterCampo;
        NOM_LOCALIDAD            : TInterCampo;
        NOM_MUNICIPIO            : TInterCampo;
        NOM_ESTADO               : TInterCampo;
        NOM_PAIS                 : TInterCampo;
        CODIGO_POSTAL            : TInterCampo;
        E_MAIL                   : TInterCampo;
        SIT_DOCUMENTO            : TInterCampo;
        SIT_PROCESO              : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

const coSit_Comprobante_CA = 'CA';
      coVerdad = 'V';
      coSit_ComprobanteCancel = 0;
      coSit_ComprobanteReenvio = 1;
      coENPROCESO = 'EN PROCESO';
      coPROCESADO = 'PROCESADO';
      coCNERROR   = 'CON ERROR';
      coCANCELADO = 'CANCELADO';
      coENVIADO   = 'ENVIADO';

var vlsql : String;
    vlId_transaccion:integer;
    vrevtrans : string;
    vdupla1:string;    

implementation
//Uses RepMon;

{$R *.DFM}

constructor TSfeRecept.Create( AOwner : TComponent );
begin Inherited;
      SERIE_RECIBO :=CreaCampo('SERIE_RECIBO',ftString,tsNinguno,tsNinguno,True);
                SERIE_RECIBO.Caption:='Serie Recibo';
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Número de Cesion';
      ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                ID_DOCUMENTO.Caption:='Número de Documento';
      ID_PROMOTOR :=CreaCampo('ID_PROMOTOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROMOTOR.Caption:='Número de Promotor';
      NOMBRE_PROMOTOR :=CreaCampo('NOMBRE_PROMOTOR',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_PROMOTOR.Caption:='Nombre Promotor';
      ID_CLIENTE :=CreaCampo('ID_CLIENTE',ftFloat,tsNinguno,tsNinguno,True);
                ID_CLIENTE.Caption:='Número de Cliente';
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Número de Persona';
      RFC_CONTRATANTE :=CreaCampo('RFC_CONTRATANTE',ftString,tsNinguno,tsNinguno,True);
                RFC_CONTRATANTE.Caption:='Rfc Contratante';
      NOMBRE_CLIENTE :=CreaCampo('NOMBRE_CLIENTE',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_CLIENTE.Caption:='Nombre Cliente';
      CALLE_NUMERO :=CreaCampo('CALLE_NUMERO',ftString,tsNinguno,tsNinguno,True);
                CALLE_NUMERO.Caption:='Calle Numero';
      NUM_EXTERIOR :=CreaCampo('NUM_EXTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUM_EXTERIOR.Caption:='Número Exterior';
      NUM_INTERIOR :=CreaCampo('NUM_INTERIOR',ftString,tsNinguno,tsNinguno,True);
                NUM_INTERIOR.Caption:='Número Interior';
      COLONIA :=CreaCampo('COLONIA',ftString,tsNinguno,tsNinguno,True);
                COLONIA.Caption:='Colonia';
      NOM_LOCALIDAD :=CreaCampo('NOM_LOCALIDAD',ftString,tsNinguno,tsNinguno,True);
                NOM_LOCALIDAD.Caption:='Nombre Localidad';
      NOM_MUNICIPIO :=CreaCampo('NOM_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                NOM_MUNICIPIO.Caption:='Nombre Municipio';
      NOM_ESTADO :=CreaCampo('NOM_ESTADO',ftString,tsNinguno,tsNinguno,True);
                NOM_ESTADO.Caption:='Nombre Estado';
      NOM_PAIS :=CreaCampo('NOM_PAIS',ftString,tsNinguno,tsNinguno,True);
                NOM_PAIS.Caption:='Nombre Pais';
      CODIGO_POSTAL :=CreaCampo('CODIGO_POSTAL',ftString,tsNinguno,tsNinguno,True);
                CODIGO_POSTAL.Caption:='Codigo Postal';
      E_MAIL :=CreaCampo('E_MAIL',ftString,tsNinguno,tsNinguno,True);
                E_MAIL.Caption:='E Mail';


      SIT_DOCUMENTO :=CreaCampo('SIT_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);
                SIT_DOCUMENTO.Caption:='SIT_DOCUMENTO';
      SIT_PROCESO :=CreaCampo('SIT_PROCESO',ftString,tsNinguno,tsNinguno,False);
                SIT_PROCESO.Caption:='SIT_PROCESO';


      FKeyFields.Add('SERIE_RECIBO');
      FKeyFields.Add('ID_CESION');
      FKeyFields.Add('ID_DOCUMENTO');

      TableName := 'ADMIPROD.SFE_RECEPTOR';
      UseQuery := True;
      HelpFile := 'IntSfeRecept.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSfeRecept.Destroy;
begin inherited;
end;


function TSfeRecept.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSfeReceptor;
begin
   W:=TWSfeReceptor.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnAceptar := False;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnCancelar := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TSfeRecept.InternalBusca:Boolean;
Var T:TInterFindit;
    vlQry : TQuery;
begin InternalBusca := False;
      T := CreaBuscador('ISFERECE.IT','S,F,S');
      Try
          if Active then
          begin
             T.Param(0,SERIE_RECIBO.AsString);
             T.Param(1,ID_CESION.AsString);
             T.Param(2,ID_DOCUMENTO.AsString);
          end;

          if T.Execute then
          begin
             InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);

             vlId_transaccion:=0;

             vlsql:= ' SELECT  ID_TRANSACCION, SIT_PROCESO, SIT_COMPROBANTE '+
                     ' FROM ADMIPROD.SFE_COMPROBANTE'+
                     ' WHERE  SERIE_RECIBO = ''' + SERIE_RECIBO.AsString+ '''' +
                     ' AND    ID_CESION = ' + ID_CESION.AsString + coCRLF +
                     ' AND    ID_DOCUMENTO = ''' + ID_DOCUMENTO.AsString + '''';

             vlQry := GetSQLQuery(vlsql,Apli.DataBaseName, Apli.SessionName, True );
             try
               if vlQry <> nil then
               Begin
                  vlId_transaccion := vlQry.FieldByName('ID_TRANSACCION').AsInteger;

                 if vlQry.FieldByName('SIT_PROCESO').AsInteger = 0 then
                    SIT_PROCESO.asString:=coENPROCESO;
                 if vlQry.FieldByName('SIT_PROCESO').AsInteger = 1 then
                    SIT_PROCESO.asString:=coPROCESADO;
                 if vlQry.FieldByName('SIT_PROCESO').AsInteger = 2 then
                    SIT_PROCESO.asString:=coCNERROR;

                 if vlQry.FieldByName('SIT_COMPROBANTE').AsInteger = 0 then
                    SIT_DOCUMENTO.asString:=coCANCELADO;
                 if vlQry.FieldByName('SIT_COMPROBANTE').AsInteger = 1 then
                    SIT_DOCUMENTO.asString:=coENVIADO;
               end;
             finally
                 if vlQry <> nil then vlQry.free;
             end;
          end;
      finally  T.Free;
      end;
end;


function TSfeRecept.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA SFE_RECEPTOR********************)
(*                                                                              *)
(*  FORMA DE SFE_RECEPTOR                                                            *)
(*                                                                              *)
(***********************************************FORMA SFE_RECEPTOR********************)

// +---------------------------------------------------------------------------+
// +  Este procedimiento muestra un mensaje de error ocurrido en la aplicacion +
// +---------------------------------------------------------------------------+
{
Function TWSfeReceptor.Revisa_Dupla(peId_Cesion, pesit_documento:Integer; peId_Documento, peSerie:string):string;
var vlQry, vlQry2 : TQuery;
    vdupla:string;
begin
   Revisa_Dupla:='SD';
   if peSerie='IXD' then
        vdupla:=' WHERE  SERIE_RECIBO  = ''REM'' ';

   if peSerie='IMORA' then
        vdupla:=' WHERE  SERIE_RECIBO  = ''REM'' ';

   if peSerie='REM' then
        vdupla:=' WHERE  SERIE_RECIBO  IN (''IXD'', ''IMORA'') ';

   if peSerie='ICXA' then
        vdupla:=' WHERE  SERIE_RECIBO  = ''CXD'' ';

   if peSerie='CXD' then
        vdupla:=' WHERE  SERIE_RECIBO  = ''ICXA'' ';

   vlsql:= ' SELECT  SIT_PROCESO, SIT_COMPROBANTE '+
           ' FROM ADMIPROD.SFE_COMPROBANTE'+
           vdupla +
           ' AND    ID_CESION = ' + IntToStr(peId_Cesion) + coCRLF +
           ' AND    ID_DOCUMENTO = ''' + peId_Documento + '''';
         //  ' AND    SIT_COMPROBANTE = '+ pesit_documento;

   vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
   try
      if vlQry <> nil then
      Begin
         MessageDlg('Existe un documento asociado se actualizará de igual forma',mtInformation,[mbOK],0);//18Dic2013 HCF Corrección de ortografía.

         vlQry2 := TQuery.Create(Self);
         vlQry2.DatabaseName  := Objeto.Apli.DataBaseName;
         vlQry2.SessionName   := Objeto.Apli.SessionName;
         vlQry2.close;

         vlQry2.SQL.Text:= ' UPDATE SFE_COMPROBANTE '+
                           ' SET SIT_PROCESO=0, SIT_COMPROBANTE= '+ IntToStr(pesit_documento) +
                           vdupla +
                           ' AND    ID_CESION = ' + IntToStr(peId_Cesion) + coCRLF +
                           ' AND    ID_DOCUMENTO = ''' + peId_Documento + '''' ;
                      //     ' AND    SIT_COMPROBANTE = '+ pesit_documento;
         vlQry2.prepared:=true;//19Dic2013 HCF Para eficientar el rendimiento
         vlQry2.ExecSQL;

         Revisa_Dupla:=vdupla;
      end;
   finally
     if vlQry <> nil then vlQry.free;
   end;
end;
}

Function TWSfeReceptor.Revisa_transaccion(peId_transaccion:integer):string;
var vlQry : TQuery;
begin
   Revisa_transaccion:='--';
   vlsql:= ' SELECT SIT_TRANSACCION ' +
             ' FROM   CR_TRANSACCION ' +
             ' WHERE  ID_TRANSACCION= ' + IntToStr(peId_transaccion);

   vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
   try
      if vlQry <> nil then
      Begin
         Revisa_transaccion:= vlQry.FieldByName('SIT_TRANSACCION').AsString;
      end;
   finally
     if vlQry <> nil then vlQry.free;
   end;
end;

Procedure TWSfeReceptor.LeeStatus;
Var vlQry : TQuery;
begin
   vlsql:= ' SELECT  ID_TRANSACCION, SIT_PROCESO, SIT_COMPROBANTE '+
           ' FROM ADMIPROD.SFE_COMPROBANTE'+
           ' WHERE  SERIE_RECIBO = ''' + OBJETO.SERIE_RECIBO.AsString+ '''' +
           ' AND    ID_CESION = ' + OBJETO.ID_CESION.AsString + coCRLF +
           ' AND    ID_DOCUMENTO = ''' + OBJETO.ID_DOCUMENTO.AsString + '''';

   vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
   try
      if vlQry <> nil then
      Begin
         if vlQry.FieldByName('SIT_PROCESO').AsInteger = 0 then
            OBJETO.SIT_PROCESO.asString:=coENPROCESO;
         if vlQry.FieldByName('SIT_PROCESO').AsInteger = 1 then
            OBJETO.SIT_PROCESO.asString:=coPROCESADO;
         if vlQry.FieldByName('SIT_PROCESO').AsInteger = 2 then
            OBJETO.SIT_PROCESO.asString:=coCNERROR;

         if vlQry.FieldByName('SIT_COMPROBANTE').AsInteger = 0 then
            OBJETO.SIT_DOCUMENTO.asString:=coCANCELADO;
         if vlQry.FieldByName('SIT_COMPROBANTE').AsInteger = 1 then
            OBJETO.SIT_DOCUMENTO.asString:=coENVIADO;
      end;
   finally
      if vlQry <> nil then vlQry.free;
   end;
end;


procedure TWSfeReceptor.MuestraError(vlError: String);
begin
   EXECUTE_MUESTRAMENSAJE( vlError );
end;

procedure TWSfeReceptor.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.SERIE_RECIBO.Control:=edSERIE_RECIBO;
      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.ID_DOCUMENTO.Control:=edID_DOCUMENTO;
      Objeto.ID_PROMOTOR.Control:=edID_PROMOTOR;
      Objeto.NOMBRE_PROMOTOR.Control:=edNOMBRE_PROMOTOR;
      Objeto.ID_CLIENTE.Control:=edID_CLIENTE;
      Objeto.ID_PERSONA.Control:=edID_PERSONA;
      Objeto.RFC_CONTRATANTE.Control:=edRFC_CONTRATANTE;
      Objeto.NOMBRE_CLIENTE.Control:=edNOMBRE_CLIENTE;
      Objeto.CALLE_NUMERO.Control:=edCALLE_NUMERO;
      Objeto.NUM_EXTERIOR.Control:=edNUM_EXTERIOR;
      Objeto.NUM_INTERIOR.Control:=edNUM_INTERIOR;
      Objeto.COLONIA.Control:=edCOLONIA;
      Objeto.NOM_LOCALIDAD.Control:=edNOM_LOCALIDAD;
      Objeto.NOM_MUNICIPIO.Control:=edNOM_MUNICIPIO;
      Objeto.NOM_ESTADO.Control:=edNOM_ESTADO;
      Objeto.NOM_PAIS.Control:=edNOM_PAIS;
      Objeto.CODIGO_POSTAL.Control:=edCODIGO_POSTAL;
      Objeto.E_MAIL.Control:=edE_MAIL;

      Objeto.SIT_DOCUMENTO.Control:=edSIT_DOCUMENTO;
      Objeto.SIT_PROCESO.Control:=edSIT_PROCESO;
end;

procedure TWSfeReceptor.FormDestroy(Sender: TObject);
begin
      Objeto.SERIE_RECIBO.Control:=nil;
      Objeto.ID_CESION.Control:=nil;
      Objeto.ID_DOCUMENTO.Control:=nil;
      Objeto.ID_PROMOTOR.Control:=nil;
      Objeto.NOMBRE_PROMOTOR.Control:=nil;
      Objeto.ID_CLIENTE.Control:=nil;
      Objeto.ID_PERSONA.Control:=nil;
      Objeto.RFC_CONTRATANTE.Control:=nil;
      Objeto.NOMBRE_CLIENTE.Control:=nil;
      Objeto.CALLE_NUMERO.Control:=nil;
      Objeto.NUM_EXTERIOR.Control:=nil;
      Objeto.NUM_INTERIOR.Control:=nil;
      Objeto.COLONIA.Control:=nil;
      Objeto.NOM_LOCALIDAD.Control:=nil;
      Objeto.NOM_MUNICIPIO.Control:=nil;
      Objeto.NOM_ESTADO.Control:=nil;
      Objeto.NOM_PAIS.Control:=nil;
      Objeto.CODIGO_POSTAL.Control:=nil;
      Objeto.E_MAIL.Control:=nil;

      Objeto.SIT_DOCUMENTO.Control:=nil;
      Objeto.SIT_PROCESO.Control:=nil;
   //Objeto
end;

procedure TWSfeReceptor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSfeReceptor.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWSfeReceptor.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSfeReceptor.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWSfeReceptor.bbConceptosClick(Sender: TObject);
var
    SfeConcep  : TSfeConcep;
begin
   if Objeto.ValidaAccesoEsp('TSFERECEPT_CONCP',True,True) then
   begin
        SfeConcep := TSfeConcep.Create(self);
        try
           SfeConcep.Apli := objeto.Apli;
           SfeConcep.ParamCre :=  Objeto.ParamCre;
           SfeConcep.GetParams(Objeto);
           SfeConcep.FindKey([objeto.SERIE_RECIBO.Asstring,
                              objeto.ID_CESION.Asstring,
                              objeto.ID_DOCUMENTO.Asstring]);
           SfeConcep.Catalogo;
        finally
           SfeConcep.Free;
        end;
   end;
end;

procedure TWSfeReceptor.bbComprobanteClick(Sender: TObject);
var
    SfeCompro  : TSfeCompro;
begin
   if Objeto.ValidaAccesoEsp('TSFERECEPT_COMPR',True,True) then
   begin
        SfeCompro := TSfeCompro.Create(self);
        try
           SfeCompro.Apli := objeto.Apli;
           SfeCompro.ParamCre := Objeto.ParamCre;
           SfeCompro.GetParams(Objeto);
           SfeCompro.FindKey([objeto.SERIE_RECIBO.Asstring,
                              objeto.ID_CESION.Asstring,
                              objeto.ID_DOCUMENTO.Asstring]);
           SfeCompro.Catalogo;
        finally
           SfeCompro.Free;
        end;
   end;
end;

procedure TWSfeReceptor.bbPersonasClick(Sender: TObject);
var  Persona : TPersona;
begin
   if Objeto.ValidaAccesoEsp('TSFERECEPT_PERS',True,True) then
   begin
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}
      try
           Persona.GetParams(Objeto);
           Persona.FindKey([ObtenIDProveedor]);
           Persona.Catalogo;
      finally
             Persona.Free;
      end;
   end;
end;

function TWSfeReceptor.ObtenIDProveedor : String;
var vlQry : TQuery;
    vlsql : String;
    vlIdProveedor : String;
begin
     vlIdProveedor := '0';
     vlsql:= ' SELECT CC.ID_PROVEEDOR ' + coCRLF +
             ' FROM   ADMIPROD.SFE_COMPROBANTE SFE_C, ' +
             ' 	      CR_CESION CC ' +
             ' WHERE  SFE_C.SERIE_RECIBO = ''' + Objeto.SERIE_RECIBO.AsString + '''' +
             ' AND    SFE_C.ID_CESION = ' + Objeto.ID_CESION.AsSQL + coCRLF +
             ' AND    SFE_C.ID_DOCUMENTO = ''' + Objeto.ID_DOCUMENTO.AsString + '''' +
             ' AND    CC.ID_CESION =  SFE_C.ID_CESION';

     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
           vlIdProveedor := vlQry.FieldByName('ID_PROVEEDOR').AsString;
        end;
     finally
       if vlQry <> nil then vlQry.free;

     end;

     ObtenIDProveedor := vlIdProveedor;
end;


procedure TWSfeReceptor.bbCancelarClick(Sender: TObject);
var  STPCancFE     : TStoredProc;
     vlQry         : TQuery;
     vlId_Documento:string;
label fCancFE;
begin
   if Objeto.ValidaAccesoEsp('TSFERECEPT_ENVCN',True,True)
   then
   begin
      if (vlId_transaccion<>0)
      then//26Dic2013 HCF Si hay documento en pantalla.
      begin
         vrevtrans:=Revisa_transaccion(vlId_transaccion);//26Dic2013 HCF Obtiene la situación de la transacción.
         if (vrevtrans='--')
         then//26Dic2013 HCF La transacción asociada al documento, no existe en la tabla cr_transaccion.
            MuestraError('No se puede realizar el movimiento ya que no se encontró la transacción en ICRE')//18Dic2013 HCF Corrección de ortografía.
         else if (vrevtrans='CA')
              then//26Dic2013 HCF La transacción está cancelada.
                 MuestraError('No se puede realizar el movimiento ya que la transacción en ICRE se encuentra CANCELADA')//18Dic2013 HCF Corrección de ortografía.
              else if (vrevtrans='NP')
                   then//26Dic2013 HCF La transacción está no procesada.
                      MuestraError('No se puede realizar el movimiento ya que la transacción en ICRE se encuentra NO PROCESADA')//18Dic2013 HCF Corrección de ortografía.
                   //02Ene2014 HCF En los casos (0,0),(1,0) no se puede CANCELAR.
                   else if (OBJETO.SIT_PROCESO.asString = coENPROCESO)
                        then//26Dic2013 HCF El documento está esperando el kron.
                           MuestraError('El documento aún no ha sido procesado, no se puede enviar la información')//18Dic2013 HCF Corrección de ortografía.
                        //02Ene2014 HCF En el caso (0,1) primero,solicitar cancelación.
                        else if (OBJETO.SIT_DOCUMENTO.asString = coCANCELADO) and (OBJETO.SIT_PROCESO.asString = coPROCESADO)
                             then//26Dic2013 HCF La situacion del documento es calcelado.
                                MuestraError('El estado del documento está en CANCELADO, no se puede enviar la información')//18Dic2013 HCF Corrección de ortografía.
                             //02Ene2014 HCF En el caso (1,2) primero,solicitar cancelación.
                             else if (OBJETO.SIT_DOCUMENTO.asString = coENVIADO) and (OBJETO.SIT_PROCESO.asString = coCNERROR)
                                  then//26Dic2013 HCF Ya está cancelado
                                      MuestraError('El estado del documento está en SELLADO con ERROR, no se puede enviar la información')//18Dic2013 HCF Corrección de ortografía.
                                  //02Ene2014 HCF Solo se puede cancelar en los casos (0,2), (1,1).
                                  else
                                  begin
                                     vlsql:= ' SELECT  CVE_OPERACION, ID_DOCUMENTO FROM CR_TRANSACCION WHERE ID_TRANSACCION='+IntToStr(vlId_transaccion);
                                     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                                     try
                                        if vlQry <> nil
                                        then
                                        Begin
                                           STPCancFE := TStoredProc.Create(Nil);
                                           try
                                              with STPCancFE do
                                              begin
                                                 DatabaseName := Objeto.Apli.DatabaseName;
                                                 SessionName  := Objeto.Apli.SessionName;
                                                 StoredProcName:='PKGCR_FACTURA_ELECTRONICA.STP_SOLICITA_CANCEL_REENVIO';
                                                 Params.Clear;
                                                 Params.CreateParam( ftString, 'PESerie_Recibo',   ptInput );
                                                 Params.CreateParam( ftInteger,'PEId_Cesion',      ptInput );
                                                 Params.CreateParam( ftString, 'PEId_Documento',   ptInput );
                                                 Params.CreateParam( ftInteger,'PESit_Comprobante',ptInput );
                                                 Params.CreateParam( ftString, 'PECve_Operacion'  ,ptInput );
                                                 Params.CreateParam( ftString, 'PEBCommit',        ptInput );
                                                 Params.CreateParam( ftInteger,'PSId_Cod_Res',     ptOutput);
                                                 Params.CreateParam( ftString, 'PSDesc_error',     ptOutput);

                                                 if Trim(vlQry.FieldByName('ID_DOCUMENTO').AsString)<>'' then
                                                    vlId_Documento := vlQry.FieldByName('ID_DOCUMENTO').AsString
                                                 else
                                                 if (Objeto.SERIE_RECIBO.AsString = 'AAP') or (Objeto.SERIE_RECIBO.AsString = 'ACP') then   // RABA MAR 2013 PPP
                                                    vlId_Documento := Objeto.ID_DOCUMENTO.AsString                                      // RABA MAR 2013 PPP
                                                 else                                                                                     // RABA MAR 2013 PPP
                                                    vlId_Documento := '0';

                                                 ParamByName('PESerie_Recibo').AsString    := Objeto.SERIE_RECIBO.AsString;                   // RABA MAR 2013 PPP
                                                 ParamByName('PEId_Cesion').AsInteger      := Objeto.ID_CESION.AsInteger;                   // RABA MAR 2013 PPP
                                                 ParamByName('PEId_Documento').AsString    := vlId_Documento;
                                                 ParamByName('PESit_Comprobante').AsInteger:= coSit_ComprobanteCancel;
                                                 ParamByName('PECve_Operacion').AsString   := vlQry.fieldByname('CVE_OPERACION').asString;
                                                 ParamByName('PEBCommit').AsString         := coVerdad;
                                                 ExecProc;

                                                 if (ParamByName('PSId_Cod_Res').AsInteger <> 0) then
                                                     MuestraError( ParamByName('PSDesc_error').AsString )
                                                 else
                                                 begin
                                                    LeeStatus;
                                                    MessageDlg('Se envió la solicitud de cancelación de factura electrónica',mtInformation,[mbOK],0);//18Dic2013 HCF Corrección de ortografía.
                                                 end;
                                              end;
                                           finally
                                              STPCancFE.Free;
                                           end;
                                        end;
                                     finally
                                        if vlQry <> nil then vlQry.free;
                                     end;
                                  end;
      end else MuestraError('Debe seleccionar un documento');//18Dic2013 HCF
   end else MuestraError('No tiene permiso para realizar la operación');//18Dic2013 HCF;
end;

procedure TWSfeReceptor.bbActualizarClick(Sender: TObject);
var vlQry, vlQry2 : TQuery;
    STPReenv      : TStoredProc;
    B_infodif     : boolean;
    vlId_Documento:string;
label LactRecp;
label fCancFE2;
begin
   if Objeto.ValidaAccesoEsp('TSFERECEPT_ACTEN',True,True)
   then
      if (Trim(edSERIE_RECIBO.Text)<>'')and(Trim(edID_CESION.Text)<>'')and(Trim(edID_DOCUMENTO.Text)<>'')
      then
         if (OBJETO.SIT_PROCESO.asString = coENPROCESO)
         then//31Dic2013 HCF En los casos (0,0),(1,0) no se puede reenviar
             MuestraError('El documento aún no ha sido procesado, no se puede actualizar la información')//31Dic2013 HCF Corrección de ortografía.
         else if ((OBJETO.SIT_DOCUMENTO.asString = coCANCELADO) and (OBJETO.SIT_PROCESO.asString = coCNERROR)) or
                 ((OBJETO.SIT_DOCUMENTO.asString = coENVIADO) and (OBJETO.SIT_PROCESO.asString = coPROCESADO))
              then//31Dic2013 HCF En los casos (0,2),(1,1) primero,solicitar cancelación.
                  MuestraError('El estado del documento está en (CANCELADO, CON ERROR) o (ENVIADO, PROCESADO), necesita CANCELAR primero')//31Dic2013 HCF Corrección de ortografía.
              else if (vlId_transaccion<>0)
                   then
                   begin
                      vrevtrans:=Revisa_transaccion(vlId_transaccion);
                      if (vrevtrans='--')
                      then
                         MuestraError('No se puede realizar el movimiento ya que no se encontró la transacción en ICRE')//31Dic2013 HCF Corrección de ortografía.
                      else if (vrevtrans='CA')
                           then
                              MuestraError('No se puede realizar el movimiento ya que la transacción en ICRE se encuentra CANCELADA')//31Dic2013 HCF Corrección de ortografía.
                           else if (vrevtrans='NP')
                                then
                                   MuestraError('No se puede realizar el movimiento ya que la transacción en ICRE se encuentra NO PROCESADA')//31Dic2013 HCF Corrección de ortografía.
                                else
                                begin
                                   //31Dic2013 HCF Verificar que existe la transacción y obtener clave de operación.
                                   vlsql:= ' SELECT  CVE_OPERACION, ID_DOCUMENTO FROM CR_TRANSACCION WHERE ID_TRANSACCION='+IntToStr(vlId_transaccion);
                                   vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                                   try
                                      if vlQry <> nil
                                      then
                                      Begin
                                         //31Dic2013 HCF Solo se puede reenviar en los casos (0,1), (1,2).
                                         //31Dic2013 HCF En los casos (0,0),(1,0) no se puede reenviar.
                                         //31Dic2013 HCF En los casos (0,2),(1,1) primero,solicitar cancelación.
                                         STPReenv := TStoredProc.Create(Nil);
                                         try
                                            with STPReenv do
                                            begin
                                               DatabaseName := Objeto.Apli.DatabaseName;
                                               SessionName  := Objeto.Apli.SessionName;
                                               StoredProcName:='PKGCR_FACTURA_ELECTRONICA.STP_SOLICITA_CANCEL_REENVIO';
                                               Params.Clear;
                                               Params.CreateParam( ftString, 'PESerie_Recibo',   ptInput );
                                               Params.CreateParam( ftInteger,'PEId_Cesion',      ptInput );
                                               Params.CreateParam( ftString, 'PEId_Documento',   ptInput );
                                               Params.CreateParam( ftInteger,'PESit_Comprobante',ptInput );
                                               Params.CreateParam( ftString, 'PECve_Operacion'  ,ptInput );
                                               Params.CreateParam( ftString, 'PEBCommit',        ptInput );
                                               Params.CreateParam( ftInteger,'PSId_Cod_Res',     ptOutput);
                                               Params.CreateParam( ftString, 'PSDesc_error',     ptOutput);

                                               if Trim(vlQry.FieldByName('ID_DOCUMENTO').AsString)<>'' then
                                                  vlId_Documento := vlQry.FieldByName('ID_DOCUMENTO').AsString
                                               else
                                               if (Objeto.SERIE_RECIBO.AsString = 'AAP') or (Objeto.SERIE_RECIBO.AsString = 'ACP') then   // RABA MAR 2013 PPP
                                                  vlId_Documento := Objeto.ID_DOCUMENTO.AsString                                      // RABA MAR 2013 PPP
                                               else                                                                                     // RABA MAR 2013 PPP
                                                  vlId_Documento := '0';

                                               ParamByName('PESerie_Recibo').AsString    := Objeto.SERIE_RECIBO.AsString;                   // RABA MAR 2013 PPP
                                               ParamByName('PEId_Cesion').AsInteger      := Objeto.ID_CESION.AsInteger;                   // RABA MAR 2013 PPP
                                               ParamByName('PEId_Documento').AsString    := vlId_Documento;
                                               ParamByName('PESit_Comprobante').AsInteger:= coSit_ComprobanteReenvio;
                                               ParamByName('PECve_Operacion').AsString   := vlQry.fieldByname('CVE_OPERACION').asString;
                                               ParamByName('PEBCommit').AsString         := coVerdad;
                                               ExecProc;

                                               if (ParamByName('PSId_Cod_Res').AsInteger <> 0)
                                               then
                                                   MuestraError( ParamByName('PSDesc_error').AsString )
                                               else
                                               begin
                                                  LeeStatus;
                                                  MessageDlg('La información fué actualizada y se envió la nueva factura electrónica',mtInformation,[mbOK],0);//31Dic2013 HCF Corrección de ortografía.
                                               end;
                                            end;
                                         finally
                                            STPReenv.Free;
                                         end;
                                      end
                                      else
                                         MuestraError('No existe la transacción:'+IntToStr(vlId_transaccion)+' Se cancela el proceso de Actualizar y enviar nueva Factura');
                                   finally
                                      if vlQry <> nil then vlQry.free;
                                   end;
                                end;
                   end
      else MuestraError('Debe seleccionar un documento')
   else MuestraError('No tiene permiso para realizar la operación');//31Dic2013 HCF;
end;

end.
