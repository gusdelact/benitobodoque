// Sistema         : Clase de CBCOpn
// Fecha de Inicio : 05/01/2013
// Función forma   : Clase de CBCOpn
// Desarrollo por  : MACV. Class Maker. 
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     : Cambios de venta de cartera de Nov. 2013 
Unit intCBCOpn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntParamCre;

Type
 TCBCOpn= class;

  TWCBCOpn=Class(TForm)
    InterForma1             : TInterForma;
    RGRepositorios: TRadioGroup;
    bConsultaRepositorios: TButton;
    SGCCBCO: TSGCtrl;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bConsultaRepositoriosClick(Sender: TObject); 
    procedure FormShow(Sender: TObject);
    private 

    Procedure   ConsultaBcSocioOpnportal;
    Procedure   ConsultaBcLayoutOpnPortal;
    Procedure   ConsultaBcLayout;
    Procedure   ConsultaBcLayExcepc;
    Procedure   ConsultaCredCveObsUP;
    Procedure   ConsultaBCExcCgoNoMarcado;
    Procedure   ConsultaBCLayBackup;
    Procedure   ConsultaINTERCREDNoIncluido;
    Procedure   ConsultaBcLayVCTot; //FJR 02.10.2013
    Procedure   ConsultaBcLayVC;    //FJR 08.10.2013

    public 
    { Public declarations }
    Objeto : TCBCOpn;

    VGSQLGenCons       : String;    
end;
 TCBCOpn= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations } 
        ParamCre    : TParamCre;
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

constructor TCBCOpn.Create( AOwner : TComponent ); 
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'InTCBCOpn.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCBCOpn.Destroy;
begin inherited;
end;


function TCBCOpn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCBCOpn;
begin
   W:=TWCBCOpn.Create(Self);
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


Function TCBCOpn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICoarlid.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCBCOpn.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CBCOpn********************)
(*                                                                              *)
(*  FORMA DE CBCOpn                                                            *)
(*                                                                              *)
(***********************************************FORMA CBCOpn********************)


Procedure   TWCBCOpn.ConsultaBcSocioOpnPortal;
var Q : TQuery;

begin
     VGSQLGenCons := 'SELECT * FROM BC_SOCIO@OPNPORTAL ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;

procedure TWCBCOpn.ConsultaBcLayout;
var Q : TQuery;

begin
     VGSQLGenCons := 'SELECT * FROM BC_LAYOUT ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;

procedure TWCBCOpn.ConsultaBcLayoutOpnPortal;
var Q : TQuery;

begin
     VGSQLGenCons := 'SELECT * FROM BC_LAYOUT@OPNPORTAL ORDER BY TIPO_CARTERA, CAST(NUMERO_CUENTA AS INTEGER) ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;

procedure TWCBCOpn.ConsultaBcLayExcepc;
var Q : TQuery;

begin
     VGSQLGenCons := 'SELECT * FROM BC_LAYOUT_EXCEPCION ORDER BY CAST(NUMERO_CUENTA AS INTEGER)';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;

procedure TWCBCOpn.ConsultaCredCveObsUP;
var Q : TQuery;

begin
     VGSQLGenCons :=
          ' SELECT * ' +#13#10+
          ' FROM ' +#13#10+
          ' ( ' +#13#10+
          '   SELECT ' +#13#10+
          '   ''ICRE'' AS APLICACION, ' +#13#10+
          '   ID_CREDITO, ' +#13#10+
          '   F_LIQUIDACION, ' +#13#10+
          '   SDO_INSOLUTO, ' +#13#10+
          '   SIT_CREDITO, ' +#13#10+
          '   F_ALTA, ' +#13#10+
          '   F_MODIFICA, ' +#13#10+
          '   CVE_OBSERVACION, ' +#13#10+
          '   CVE_TIPO_BAJA ' +#13#10+
          '   FROM ' +#13#10+
          '   CR_CREDITO ' +#13#10+
          '   WHERE ' +#13#10+
          '         CVE_TIPO_BAJA = 1 ' +#13#10+
          '     AND F_LIQUIDACION >= TO_DATE(''01/08/2012'', ''DD/MM/YYYY'') ' +#13#10+
          '     AND (   CVE_OBSERVACION LIKE ''10103%'' ' +#13#10+
          '          OR CVE_OBSERVACION LIKE ''10104%'' ' +#13#10+
          '   	     OR CVE_OBSERVACION IS NULL      ) ' +#13#10+
          '   UNION ALL ' +#13#10+
          '   SELECT ' +#13#10+
          '   ''INTERCRED'' AS APLICACION, ' +#13#10+
          '   ID_CREDITO, ' +#13#10+
          '   F_LIQ_BNC AS F_LIQUIDACION, ' +#13#10+
          '   SDO_INSOLUTO, ' +#13#10+
          '   SIT_CREDITO, ' +#13#10+
          '   F_CAPTURA_CRED AS F_ALTA, ' +#13#10+
          '   NULL AS F_MODIFICA, ' +#13#10+
          '   CVE_OBSERVACION, ' +#13#10+
          '   CVE_TIPO_BAJA ' +#13#10+
          '   FROM ' +#13#10+
          '   CRE_CREDITO ' +#13#10+
          '   WHERE ' +#13#10+
          '         CVE_TIPO_BAJA = 1 ' +#13#10+
          '     AND F_LIQ_BNC >= TO_DATE(''01/08/2012'', ''DD/MM/YYYY'') ' +#13#10+
          '     AND (   CVE_OBSERVACION LIKE ''10103%'' ' +#13#10+
          '          OR CVE_OBSERVACION LIKE ''10104%'' ' +#13#10+
          '   	     OR CVE_OBSERVACION IS NULL      ) ' +#13#10+
          ' ) ' +#13#10+
          ' ORDER BY ' +#13#10+
          ' F_LIQUIDACION, ' +#13#10+
          ' ID_CREDITO ' +#13#10;

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;


procedure TWCBCOpn.FormDestroy(Sender: TObject);
begin
     //Objeto
end;

procedure TWCBCOpn.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCBCOpn.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCBCOpn.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCBCOpn.bConsultaRepositoriosClick(Sender: TObject);
begin

   If Objeto.ValidaAccesoEsp('TCBCOPN_CONSBC',True,True) then
   Begin
       Screen.Cursor:=crHourGlass;

       case RGRepositorios.ItemIndex of
          0: ConsultaBcSocioOpnPortal;
          1: ConsultaBcLayoutOpnPortal;
          2: ConsultaBcLayout;
          3: ConsultaBcLayExcepc;
          4: ConsultaCredCveObsUP;
          5: ConsultaBCExcCgoNoMarcado;
          6: ConsultaBCLayBackup;
          7: ConsultaINTERCREDNoIncluido;
          8: ConsultaBcLayVCTot; // FJR 02.10.2013
          9: ConsultaBcLayVC;    // FJR 08.10.2013
       else
          Caption := '';
       end;
       Screen.Cursor:=crDefault;
   end;

end;

procedure TWCBCOpn.FormShow(Sender: TObject);
begin

  with Objeto do
  begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;
  end;

end;

procedure TWCBCOpn.ConsultaBCExcCgoNoMarcado;
var Q : TQuery;

begin
     VGSQLGenCons :=
           ' SELECT ' +#13#10+
           ' NUMERO_CUENTA, ' +#13#10+
           ' FECHA_LIQUIDACION AS F_LIQ_EXCEL, ' +#13#10+
           ' F_LIQUIDACION AS F_LIQ_ICRE_INTER, ' +#13#10+
           ' SIT_CREDITO, ' +#13#10+
           ' CVE_OBSERVACION, ' +#13#10+
           ' CVE_TIPO_BAJA ' +#13#10+
           ' FROM ' +#13#10+
           ' BC_LAYOUT_EXCEPCION BCL, ' +#13#10+
           '		( ' +#13#10+
           '  SELECT ' +#13#10+
           '  ID_CREDITO, ' +#13#10+
           '  F_LIQUIDACION, ' +#13#10+
           '  SIT_CREDITO, ' +#13#10+
           '  CVE_OBSERVACION, ' +#13#10+
           '  CVE_TIPO_BAJA ' +#13#10+
           '  FROM ' +#13#10+
           '  CR_CREDITO ' +#13#10+
           '  UNION ALL ' +#13#10+
           '  SELECT ' +#13#10+
           '  ID_CREDITO, ' +#13#10+
           '  F_LIQ_BNC AS F_LIQUIDACION, ' +#13#10+
           '  SIT_CREDITO, ' +#13#10+
           '  CVE_OBSERVACION, ' +#13#10+
           '  CVE_TIPO_BAJA ' +#13#10+
           '  FROM ' +#13#10+
           '  CRE_CREDITO ' +#13#10+
           '		) CREDS ' +#13#10+
           ' WHERE ' +#13#10+
           '       QUEBRANTO IS NOT NULL ' +#13#10+
           '   AND QUEBRANTO > 0 ' +#13#10+
           '   AND TO_NUMBER(TRIM(NUMERO_CUENTA)) NOT IN ( ' +#13#10+
           '           SELECT ' +#13#10+
           '           ID_CREDITO ' +#13#10+
           '           FROM ' +#13#10+
           '           ( ' +#13#10+
           '             SELECT ' +#13#10+
           '             ''ICRE'' AS CVE_APP, ' +#13#10+
           '             ID_CREDITO, ' +#13#10+
           '             F_LIQUIDACION, --No necesariamente esta es la Fecha de Liq del Castigo a Reportar a Buró ' +#13#10+
           '             SIT_CREDITO, ' +#13#10+
           '             CVE_OBSERVACION, ' +#13#10+
           '             CVE_TIPO_BAJA ' +#13#10+
           '             FROM ' +#13#10+
           '             CR_CREDITO ' +#13#10+
           '             WHERE ' +#13#10+
           '                   SIT_CREDITO   = ''LQ'' ' +#13#10+
           '               AND CVE_TIPO_BAJA = 1 ' +#13#10+
           '               AND (   CVE_OBSERVACION LIKE ''10103%'' ' +#13#10+
           '                    OR CVE_OBSERVACION LIKE ''10104%'') ' +#13#10+
           '             UNION ALL ' +#13#10+
           '             SELECT ' +#13#10+
           '             ''CRED'' AS CVE_APP, ' +#13#10+
           '             ID_CREDITO, ' +#13#10+
           '             F_LIQ_BNC AS F_LIQUIDACION,  --No necesariamente esta es la Fecha de Liq del Castigo a Reportar a Buró ' +#13#10+
           '             SIT_CREDITO, ' +#13#10+
           '             CVE_OBSERVACION, ' +#13#10+
           '             CVE_TIPO_BAJA ' +#13#10+
           '             FROM ' +#13#10+
           '             CRE_CREDITO ' +#13#10+
           '             WHERE ' +#13#10+
           '                   SIT_CREDITO   = ''LQ'' ' +#13#10+
           '               AND CVE_TIPO_BAJA = 1 ' +#13#10+
           '               AND (   CVE_OBSERVACION LIKE ''10103%'' ' +#13#10+
           '                    OR CVE_OBSERVACION LIKE ''10104%'') ' +#13#10+
           '           ) CRED ' +#13#10+
           '       ) ' +#13#10+
           '   AND CREDS.ID_CREDITO (+) = TO_NUMBER(TRIM(BCL.NUMERO_CUENTA)) ' +#13#10;

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;
     
end;


procedure TWCBCOpn.ConsultaBCLayBackup;
var Q : TQuery;

begin
     VGSQLGenCons := 'SELECT * FROM BC_LAYOUT_BAK ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;

procedure TWCBCOpn.ConsultaINTERCREDNoIncluido;
var Q : TQuery;

begin
     VGSQLGenCons :=
            ' SELECT ' +#13#10+
            ' CRED.* ' +#13#10+
            ' FROM ' +#13#10+
            ' ( ' +#13#10+
            '   SELECT ' +#13#10+
            '   ''ICRE'' AS CVE_APP, ' +#13#10+
            '   ID_CREDITO, ' +#13#10+
            '   F_LIQUIDACION, --No necesariamente esta es la Fecha de Liq del Castigo a Reportar a Buró ' +#13#10+
            '   SIT_CREDITO, ' +#13#10+
            '   CVE_OBSERVACION, ' +#13#10+
            '   CVE_TIPO_BAJA ' +#13#10+
            '   FROM ' +#13#10+
            '   CR_CREDITO ' +#13#10+
            '   WHERE ' +#13#10+
            '         SIT_CREDITO   = ''LQ'' ' +#13#10+
            '     AND CVE_TIPO_BAJA = 1 ' +#13#10+
            '     AND (   CVE_OBSERVACION LIKE ''10103%'' ' +#13#10+
            '          OR CVE_OBSERVACION LIKE ''10104%'') ' +#13#10+
            '   UNION ALL ' +#13#10+
            '   SELECT ' +#13#10+
            '   ''CRED'' AS CVE_APP, ' +#13#10+
            '   ID_CREDITO, ' +#13#10+
            '   F_LIQ_BNC AS F_LIQUIDACION,  --No necesariamente esta es la Fecha de Liq del Castigo a Reportar a Buró ' +#13#10+
            '   SIT_CREDITO, ' +#13#10+
            '   CVE_OBSERVACION, ' +#13#10+
            '   CVE_TIPO_BAJA ' +#13#10+
            '   FROM ' +#13#10+
            '   CRE_CREDITO ' +#13#10+
            '   WHERE ' +#13#10+
            '         SIT_CREDITO   = ''LQ'' ' +#13#10+
            '     AND CVE_TIPO_BAJA = 1 ' +#13#10+
            '     AND (   CVE_OBSERVACION LIKE ''10103%'' ' +#13#10+
            '          OR CVE_OBSERVACION LIKE ''10104%'') ' +#13#10+
            ' ) CRED ' +#13#10+
            ' WHERE ' +#13#10+
            '       CRED.ID_CREDITO NOT IN ( ' +#13#10+
            '                SELECT ' +#13#10+
            ' 			   TO_NUMBER(TRIM(NUMERO_CUENTA)) ' +#13#10+
            ' 			   FROM ' +#13#10+
            ' 			   BC_LAYOUT_EXCEPCION) ' +#13#10;

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;
     
end;

// FJR 02.10.2013
procedure TWCBCOpn.ConsultaBcLayVCTot;
var Q : TQuery;
begin
   VGSQLGenCons :=
     'SELECT ' +#13#10+
     '    -- ' +#13#10+
     '    HIST.F_PROCESO, HIST.ID_CSC, HIST.TIPO_CARGA, ' +#13#10+
     '	  VC.NUMERO_CUENTA, VC.UID_CUS, VC.RFC, VC.PRIMER_NOMBRE, VC.SEGUNDO_NOMBRE, VC.APELLIDO_PATERNO, ' +#13#10+
     '    VC.APELLIDO_MATERNO, VC.APELLIDO_ADICIONAL, VC.FECHA_NACIMIENTO, VC.SEXO, VC.ESTADO_CIVIL, ' +#13#10+
     '    VC.NAT, VC.ECON_ACT, VC.TIPO_CLIENTE, VC.INDICADOR_DEFUNCION, VC.FECHA_DEFUNCION, VC.PAIS, ' +#13#10+
     '    VC.ESTADO, VC.NOM_CIT, VC.DELEGACION_MUNICIPIO, VC.COLONIA_POBLACION, VC.NUMERO_EXTERIOR, VC.CODIGO_POSTAL, ' +#13#10+
     '    VC.NUMERO_TELEFONO, VC.EXTENSION_TELEFONICA, VC.TIPO_DOMICILIO, VC.TIPO_RESPONSABILIDAD, ' +#13#10+
     '    -- ' +#13#10+
     '    HIST.TIPO_CONTRATO, HIST.TIPO_CREDITO, HIST.CLAVE_MONEDA, HIST.FECHA_APERTURA, HIST.FECHA_REESTRUCTURA, ' +#13#10+
     '    HIST.NUMERO_PAGOS, HIST.EXPERIENCIAS_CREDITICIAS, HIST.CLAVE_FRECUENCIA_PAGOS, HIST.CLAVE_FRECUENCIA_PAGOS_NUM, ' +#13#10+
     '    HIST.LIMITE_CREDITO, HIST.CREDITO_MAXIMO, HIST.SALDO_INICIAL, HIST.SALDO_ACTUAL, HIST.SALDO_VENCIDO, ' +#13#10+
     '    HIST.PAGOS_VENCIDOS, HIST.DIAS_VENCIDO, HIST.MONTO_A_PAGAR, HIST.PLAZO, HIST.IMPORTE_AVALUO, ' +#13#10+
     '    HIST.GARANTIA, HIST.IMPORTE_PAGO, HIST.PAGO_EFECTIVO, HIST.SALDO_QUITA, HIST.SALDO_DACION, ' +#13#10+
     '    HIST.QUEBRANTO, HIST.FECHA_ULTIMO_PAGO, HIST.FECHA_ULTIMA_COMPRA, HIST.FECHA_QUEBRANTO, ' +#13#10+
     '    HIST.FECHA_LIQUIDACION, HIST.FECHA_CIERRE, HIST.CLAVE_OBSERVACION, HIST.CALIFICACION_CARTERA, ' +#13#10+
     '    HIST.CUENTA_CONTABLE, HIST.NUMERO_CONTRATO_ANTERIOR, HIST.NOMBRE_OTORGANTE_ANTERIOR, ' +#13#10+
     '    HIST.CLAVE_OTORGANTE_ANTERIOR, HIST.NUMERO_CUENTA_ANTERIOR, HIST.BLOQUEO, HIST.FECHA_PRIMER_INCUM, ' +#13#10+
     '    HIST.CLAVE_CONSOLIDA_EM, HIST.SALDO_INSOLUTO, HIST.MONTO_ULTIMO_PAGO, HIST.TIPO_CARTERA, HIST.SIT_VC_HISTO ' +#13#10+
     '    -- ' +#13#10+
     'FROM BC_LAYOUT_VC VC, BC_LAYOUT_VC_HISTO HIST ' +#13#10+
     'WHERE 1=1 ' +#13#10+
     '  AND (VC.TIPO_CARTERA = HIST.TIPO_CARTERA  ' +#13#10+
     '      AND VC.NUMERO_CUENTA = HIST.NUMERO_CUENTA ' +#13#10+
     '      AND VC.UID_CUS = HIST.UID_CUS) ' +#13#10+
     '	   AND SIT_VC = ''AC'' ' +#13#10+
     'ORDER BY F_PROCESO DESC, ID_CSC DESC, CAST(VC.NUMERO_CUENTA AS INTEGER) ' +#13#10;

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True)
          else
          begin
               SGCCBCO.Clear('NO EXISTEN REGISTROS DE VENTA DE CARTERA '#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;
end;

//FJR 08.10.2013
procedure TWCBCOpn.ConsultaBcLayVC;
var Q : TQuery;
    i : Integer;
    d, conector, criterio : String;
begin
   VGSQLGenCons:= 'SELECT TO_CHAR(NVL(MAX(F_PROCESO), TRUNC(SYSDATE)), ''DD/MM/YYYY'') AS F_PROCESO '+
                  'FROM BC_LAYOUT_VC_HISTO '+
                  'WHERE 1 = 1 ';
   Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
   d :=  Q.FieldByName('F_PROCESO').AsString;

   VGSQLGenCons:= 'SELECT MAX(NVL(ID_CSC, 1)) AS ID_CSC '+
                  'FROM BC_LAYOUT_VC_HISTO '+
                  'WHERE F_PROCESO = TO_DATE('''+d+''', ''DD/MM/YYYY'') ';
   Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
   i:=   Q.FieldByName('ID_CSC').AsInteger;

   VGSQLGenCons:= 'SELECT ROWNUM, ID_CSC '+
                  '  FROM (SELECT DISTINCT ID_CSC '+
                  '          FROM BC_LAYOUT_VC_HISTO '+
                  '         WHERE F_PROCESO = TO_DATE('''+d+''', ''DD/MM/YYYY'') '+
                  '           AND SIT_VC_HISTO IN (''AC'') '+
		  '         ORDER BY ID_CSC DESC) '+
                  'ORDER BY 1 ';
   Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);

   VGSQLGenCons:= '';

   // FJR Nov. 2013 El escalonamiento garantizará que se muestren todos los registros que constituyan lo "actual".

   While not Q.Eof do begin
     i:= Q.FieldByName('ID_CSC').AsInteger;

     if Q.FieldByName('ROWNUM').AsInteger = 1 then begin
        criterio := ' ''AC'', ''IN'' ';
        conector := '';
     end
     else begin
        criterio :=  ' ''AC'' ';
        conector := ' UNION ';
     end;

     VGSQLGenCons:= Trim(VGSQLGenCons +#13#10 + conector) +#13#10 +
       'SELECT ' +#13#10+
       '    -- ' +#13#10+
       '    HIST.F_PROCESO, HIST.ID_CSC, HIST.TIPO_CARGA, ' +#13#10+
       '    VC.NUMERO_CUENTA, VC.UID_CUS, VC.RFC, VC.PRIMER_NOMBRE, VC.SEGUNDO_NOMBRE, VC.APELLIDO_PATERNO, ' +#13#10+
       '    VC.APELLIDO_MATERNO, VC.APELLIDO_ADICIONAL, VC.FECHA_NACIMIENTO, VC.SEXO, VC.ESTADO_CIVIL, ' +#13#10+
       '    VC.NAT, VC.ECON_ACT, VC.TIPO_CLIENTE, VC.INDICADOR_DEFUNCION, VC.FECHA_DEFUNCION, VC.PAIS, ' +#13#10+
       '    VC.ESTADO, VC.NOM_CIT, VC.DELEGACION_MUNICIPIO, VC.COLONIA_POBLACION, VC.NUMERO_EXTERIOR, VC.CODIGO_POSTAL, ' +#13#10+
       '    VC.NUMERO_TELEFONO, VC.EXTENSION_TELEFONICA, VC.TIPO_DOMICILIO, VC.TIPO_RESPONSABILIDAD, ' +#13#10+
       '    -- ' +#13#10+
       '    HIST.TIPO_CONTRATO, HIST.TIPO_CREDITO, HIST.CLAVE_MONEDA, HIST.FECHA_APERTURA, HIST.FECHA_REESTRUCTURA, ' +#13#10+
       '    HIST.NUMERO_PAGOS, HIST.EXPERIENCIAS_CREDITICIAS, HIST.CLAVE_FRECUENCIA_PAGOS, HIST.CLAVE_FRECUENCIA_PAGOS_NUM, ' +#13#10+
       '    HIST.LIMITE_CREDITO, HIST.CREDITO_MAXIMO, HIST.SALDO_INICIAL, HIST.SALDO_ACTUAL, HIST.SALDO_VENCIDO, ' +#13#10+
       '    HIST.PAGOS_VENCIDOS, HIST.DIAS_VENCIDO, HIST.MONTO_A_PAGAR, HIST.PLAZO, HIST.IMPORTE_AVALUO, ' +#13#10+
       '    HIST.GARANTIA, HIST.IMPORTE_PAGO, HIST.PAGO_EFECTIVO, HIST.SALDO_QUITA, HIST.SALDO_DACION, ' +#13#10+
       '    HIST.QUEBRANTO, HIST.FECHA_ULTIMO_PAGO, HIST.FECHA_ULTIMA_COMPRA, HIST.FECHA_QUEBRANTO, ' +#13#10+
       '    HIST.FECHA_LIQUIDACION, HIST.FECHA_CIERRE, HIST.CLAVE_OBSERVACION, HIST.CALIFICACION_CARTERA, ' +#13#10+
       '    HIST.CUENTA_CONTABLE, HIST.NUMERO_CONTRATO_ANTERIOR, HIST.NOMBRE_OTORGANTE_ANTERIOR, ' +#13#10+
       '    HIST.CLAVE_OTORGANTE_ANTERIOR, HIST.NUMERO_CUENTA_ANTERIOR, HIST.BLOQUEO, HIST.FECHA_PRIMER_INCUM, ' +#13#10+
       '    HIST.CLAVE_CONSOLIDA_EM, HIST.SALDO_INSOLUTO, HIST.MONTO_ULTIMO_PAGO, HIST.TIPO_CARTERA, HIST.SIT_VC_HISTO ' +#13#10+
       '    -- ' +#13#10+
       'FROM BC_LAYOUT_VC VC, BC_LAYOUT_VC_HISTO HIST ' +#13#10+
       'WHERE 1=1 ' +#13#10+
       '  AND ( VC.TIPO_CARTERA = HIST.TIPO_CARTERA  ' +#13#10+
       '      AND VC.NUMERO_CUENTA = HIST.NUMERO_CUENTA ' +#13#10+
       '      AND VC.UID_CUS = HIST.UID_CUS) ' +#13#10+
       ' AND SIT_VC = ''AC'' AND SIT_VC_HISTO IN ('+criterio+') ' +#13#10+
       ' AND ID_CSC = '+IntToStr(i)+'  ' +#13#10+
       ' AND F_PROCESO = TO_DATE('''+d+''', ''DD/MM/YYYY'') ' +#13#10;
     Q.Next;
   End;
     VGSQLGenCons:= Trim(VGSQLGenCons) + #13#10 + 'ORDER BY 1 DESC, 2 DESC, 4 ASC ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then BEGIN
               SGCCBCO.addQry(Q,True,True,-1,-1,-1,True) ;
               Q.SQL.SaveToFile('C:QryVC.sql') ;
          END
          else
          begin
               SGCCBCO.Clear('NO EXISTEN REGISTROS DE VENTA DE CARTERA '#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;
end;


end.
