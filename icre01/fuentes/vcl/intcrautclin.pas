// Sistema         : Clase de CR_AUT_CLINEA
// Fecha de Inicio : 24/01/2007
// Función forma   : Clase de CR_AUT_CLINEA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrAutClin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, IntLinkit,
InterEdit,   IntSGCtrl,

IntParamCre,
IntCrCto,
IntGenCre,
IntCrCreMar //Disposición marco LOLS CREDITO EN LINEA
;

Type
  TCrAutClin= class;

  TWCrAutClin=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CONTRATO: TLabel;
    btCONTRATO: TBitBtn;
    ilID_CREDITO_MARCO: TInterLinkit;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    lbID_CREDITO_MARCO: TLabel;
    btnCREDITO_MARCO: TBitBtn;
    edTX_COMENTARIOS: TEdit;
    iedID_CONTRATO: TEdit;
    SGCtrlDatoComCr: TSGCtrl;
    edID_CREDITO_MARCO: TEdit;
    cbB_DISP_EN_LINEA: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCREDITO_MARCOClick(Sender: TObject);
    procedure ilID_CREDITO_MARCOCapture(Sender: TObject;
      var Show: Boolean);
  procedure ilID_CREDITO_MARCOEjecuta(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
  private
    procedure   ValidaDispMarco(pIdCto, pFolCto, pIdDisMarco: String);
  public
    Objeto : TCrAutClin;
  end;
  //
  TCrAutClin= class(TCrCto)
  private
  protected
  public
    ParamCre                   : TParamCre;
    CrCreMar                   : TCrCreMar;
    function    InternalBusca  : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAutClin.Create( AOwner : TComponent ); 
begin
      Inherited;
      //
      {$WARNINGS OFF}
      CrCreMar   := TCrCreMar.Create(Self);
      {$WARNINGS ON}
      CrCreMar.MasterSource:=Self;
      CrCreMar.FieldByName('ID_CREDITO_MARCO').MasterField := 'ID_CREDITO_MARCO';
      AutoRefresh := True;
      //
      TableName := 'CR_CONTRATO';
      UseQuery := True;
      HelpFile := 'IntCrCto.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAutClin.Destroy;
begin
  if CrCreMar <> nil then
     CrCreMar.Free;
  //
  inherited;
end;


function TCrAutClin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAutClin;
begin
   W := TWCrAutClin.Create(Self);
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


Function TCrAutClin.InternalBusca:Boolean;

Var T:TInterFindit;
begin
      InternalBusca := False;
      T := CreaBuscador('ICrCto.it','F,F');
      Try
        if Active then begin
          T.Param(0,ID_CONTRATO.AsString);
          T.Param(1,FOL_CONTRATO.AsString);
        end;
        //
        if T.Execute then
          InternalBusca := FindKey( [T.DameCampo(0),T.DameCampo(1)] );
      finally
        T.Free;
      end;
end;
(***********************************************FORMA CR_AUT_CLINEA********************)
(*                                                                              *)
(*  FORMA DE CR_AUT_CLINEA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AUT_CLINEA********************)


procedure TWCrAutClin.ValidaDispMarco(pIdCto, pFolCto, pIdDisMarco: String);
var sSql : String;
    Qry  : TQuery;
begin
  //
  sSql :=
            // Garantias
            'SELECT 1 ID_GRUPO,'   + coCRLF +
            '       ''ERROR''  TIPO_MENSAJE,'   + coCRLF +
            '       ''No se han relacionado las garantías a la autorización'' TX_MENSAJE'   + coCRLF +
            'FROM   DUAL'   + coCRLF +
            'WHERE  NVL( PKGCRINET.FUNVALIDAGTIA( ' +   pIdCto + ',' + coCRLF +
                                                        pFolCto + ' ), ''F'' ) <> ''V''' + coCRLF +
            'UNION ALL'   + coCRLF +
            // Tipo de pago (Tradicional o Nivelado )
            'SELECT 2 ID_GRUPO,'   + coCRLF +
            '       ''ERROR''  TIPO_MENSAJE,'   + coCRLF +
            '       ''No se ha especificado el tipo de generación de Pagos (Tradicional o Nivelado )'' TX_MENSAJE'   + coCRLF +
            'FROM   CR_CONTRATO L,'   + coCRLF +
            '       CR_PRODUCTO P'   + coCRLF +
            'WHERE  L.ID_CONTRATO  = ' +   pIdCto  + coCRLF +
            '  AND  L.FOL_CONTRATO = ' +   pFolCto + coCRLF +
            '  AND  P.CVE_PRODUCTO_CRE = L.CVE_PRODUCTO_CRE'   + coCRLF +
            '  AND  P.CVE_GEN_TIP_PAG IS NULL'   + coCRLF +
            'UNION ALL'   + coCRLF +
            // Comisiones de la disposicion marco no configuradas
            'SELECT 3 ID_GRUPO,'   + coCRLF +
            '       ''AVISO''  TIPO_MENSAJE,'   + coCRLF +
            '       ''El producto aplica '' || VECES || '' comisión(es) que no se encuentran en la disposición marco'' TX_MENSAJE'   + coCRLF +
            'FROM   ('   + coCRLF +
            '        SELECT SUM(DECODE(DM.CVE_COMISION, NULL, 1, 0 ) ) VECES'   + coCRLF +
            '        FROM   ('   + coCRLF +
            '                SELECT L.ID_CONTRATO,'   + coCRLF +
            '                       ' + pIdDisMarco + ' ID_CREDITO_MARCO,'   + coCRLF +
            '                       L.CVE_PRODUCTO_CRE,'   + coCRLF +
            '                       PC.CVE_COMISION'   + coCRLF +
            '                FROM   CR_CONTRATO L,'   + coCRLF +
            '                       CR_PRODUCTO P,'   + coCRLF +
            '                       CR_PRODUCTO_COM PC'   + coCRLF +
            '                WHERE  L.ID_CONTRATO  = ' +   pIdCto  + coCRLF +
            '                  AND  L.FOL_CONTRATO = ' +   pFolCto + coCRLF +
            '                  AND  P.CVE_PRODUCTO_CRE  = L.CVE_PRODUCTO_CRE'   + coCRLF +
            '                  AND  PC.CVE_PRODUCTO_CRE = P.CVE_PRODUCTO_CRE'   + coCRLF +
            '                  AND  PC.SIT_PRO_COMISION = ''AC'''   + coCRLF +
            '               ) A,'   + coCRLF +
            '               CR_COMIS_MARCO DM'   + coCRLF +
            '        WHERE  DM.ID_CREDITO_MARCO(+) = A.ID_CREDITO_MARCO'   + coCRLF +
            '          AND  DM.CVE_COMISION(+)     = A.CVE_COMISION'   + coCRLF +
            '       )B'   + coCRLF +
            'WHERE  NVL( B.VECES, 0 ) > 0'   + coCRLF +
            'UNION'   + coCRLF +
            // Comisiones del producto no configuradas
            'SELECT 4 ID_GRUPO,'   + coCRLF +
            '       ''ERROR''  TIPO_MENSAJE,'   + coCRLF +
            '       ''La disposición marco aplica '' || VECES || '' comisión(es) que no se encuentran en el producto'' TX_MENSAJE'   + coCRLF +
            'FROM   ('   + coCRLF +
            '        SELECT SUM(DECODE(PC.CVE_COMISION, NULL, 1, 0 ) ) VECES'   + coCRLF +
            '        FROM   ('   + coCRLF +
            '                SELECT L.ID_CONTRATO,'   + coCRLF +
            '                       L.CVE_PRODUCTO_CRE,'   + coCRLF +
            '                       DM.CVE_COMISION'   + coCRLF +
            '                FROM   CR_CONTRATO L,'   + coCRLF +
            '                       CR_PRODUCTO P,'   + coCRLF +
            '                       CR_COMIS_MARCO DM'   + coCRLF +
            '                WHERE  L.ID_CONTRATO  = ' +   pIdCto  + coCRLF +
            '                  AND  L.FOL_CONTRATO = ' +   pFolCto + coCRLF +
            '                  AND  DM.ID_CREDITO_MARCO = ' +   pIdDisMarco  + coCRLF + //HINTEN
            '                  AND  P.CVE_PRODUCTO_CRE  = L.CVE_PRODUCTO_CRE'   + coCRLF +
            '                  AND  DM.SIT_COMIS_PROG   = ''AC'''   + coCRLF +
            '               ) A,'   + coCRLF +
            '               CR_PRODUCTO_COM PC'   + coCRLF +
            '        WHERE  PC.CVE_PRODUCTO_CRE(+) = A.CVE_PRODUCTO_CRE'   + coCRLF +
            '          AND  PC.CVE_COMISION(+)     = A.CVE_COMISION'   + coCRLF +
            '       )B'   + coCRLF +
            'WHERE  NVL( B.VECES, 0 ) > 0';

  Qry := GetSQLQuery( sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  if Qry <> nil then
  begin
       //ASIGNACION DE ETIQUETAS
       Qry.FieldByName('ID_GRUPO').DisplayLabel       := 'Grupo'   + #30+'>C';
       Qry.FieldByName('TIPO_MENSAJE').DisplayLabel   := 'Tipo'    + #30 +'>C';
       Qry.FieldByName('TX_MENSAJE').DisplayLabel     := 'Mensaje' + #30+'>C';
       //ASIGNACION DE LONGITUD DE COLUMNAS
       Qry.FieldByName('ID_GRUPO').DisplayWidth     := 6;
       Qry.FieldByName('TIPO_MENSAJE').DisplayWidth := 10;
       Qry.FieldByName('TX_MENSAJE').DisplayWidth   := 100;
       // AGREGA LA INFORMACION
       SGCtrlDatoComCr.Titulo1 := 'Validación de la disposición marco';
       SGCtrlDatoComCr.addQry( Qry, True, True,  -1,  -1,  -1,  True );
       Qry.Free;
       MessageDlg( 'Favor de validar los mensajes de error antes de autorizar la disposición marco',
         mtWarning, [mbOk], 0);
       cbB_DISP_EN_LINEA.Checked := False;
  end else begin
       Qry := GetSQLQuery( 'SELECT ''Validación exitosa'' TX_MENSAJE FROM DUAL',
                           Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
       Qry.FieldByName('TX_MENSAJE').DisplayLabel   := 'Mensaje' + #30+'>C';
       Qry.FieldByName('TX_MENSAJE').DisplayWidth   := 100;
       SGCtrlDatoComCr.Titulo1 := 'Validación de la disposición marco';
       SGCtrlDatoComCr.addQry( Qry, True, True,  -1,  -1,  -1,  True );
       Qry.Free;
       MessageDlg( 'Validación de la disposición marco exitosa', mtInformation, [mbOk], 0);

       if Objeto.Producto.B_DISP_EN_LINEA.AsString = CVERDAD THEN Begin
          cbB_DISP_EN_LINEA.Enabled := Objeto.Producto.B_DISP_EN_LINEA.AsString = CVERDAD;
          cbB_DISP_EN_LINEA.Checked := True;
       end;
  end;
end;


procedure TWCrAutClin.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      
  //icpCONTRATO.Frame := Objeto.Contrato;
  //icpCONTRATO.RefrescaInfo;  //REFRESCA LA INFORMACIÓN DEL CREDITO

  //
  Objeto.ID_CONTRATO.Control              := iedID_CONTRATO;
  Objeto.B_DISP_EN_LINEA.Control          := cbB_DISP_EN_LINEA;
  //Objeto.FOL_CONTRATO.Control             := lbFOL_CONTRATO;
  Objeto.CVE_PRODUCTO_CRE.Control         := edCVE_PRODUCTO;
  Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
  //
  Objeto.ID_CREDITO_MARCO.Control         := edID_CREDITO_MARCO;
  //
  Objeto.CrCreMar.ID_CREDITO_MARCO.Control:= edID_CREDITO_MARCO;
  Objeto.CrCreMar.TX_COMENTARIOS.Control  := edTX_COMENTARIOS;
end;


procedure TWCrAutClin.FormDestroy(Sender: TObject);
begin
  Objeto.ID_CONTRATO.Control              := nil;
  //Objeto.FOL_CONTRATO.Control             := nil;
  Objeto.B_DISP_EN_LINEA.Control          := nil;
  Objeto.CVE_PRODUCTO_CRE.Control         := nil;
  Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
  //
  Objeto.ID_CREDITO_MARCO.Control         := nil;
  //
  Objeto.CrCreMar.ID_CREDITO_MARCO.Control:= nil;
  Objeto.CrCreMar.TX_COMENTARIOS.Control  := nil;
end;

procedure TWCrAutClin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrAutClin.btnCREDITO_MARCOClick(Sender: TObject);
begin
  if Objeto.CrCreMar.Busca then
  Begin
     Objeto.ID_CONTRATO.GetFromControl;
     Objeto.FOL_CONTRATO.GetFromControl;
     Objeto.ID_CREDITO_MARCO.GetFromControl;
     ValidaDispMarco( Objeto.ID_CONTRATO.AsString,
                      Objeto.FOL_CONTRATO.AsString,
                      Objeto.ID_CREDITO_MARCO.AsString);
  End;
end;

procedure TWCrAutClin.ilID_CREDITO_MARCOCapture(Sender: TObject; var Show: Boolean);
begin
  Show := ( Objeto.Modo = moEdit );
end;


procedure TWCrAutClin.ilID_CREDITO_MARCOEjecuta(Sender: TObject);
begin
  if Objeto.CrCreMar.FindKey([ilID_CREDITO_MARCO.Buffer])then
  Begin
     Objeto.ID_CONTRATO.GetFromControl;
     Objeto.FOL_CONTRATO.GetFromControl;
     Objeto.ID_CREDITO_MARCO.GetFromControl;
     ValidaDispMarco( Objeto.ID_CONTRATO.AsString,
                      Objeto.FOL_CONTRATO.AsString,
                      Objeto.ID_CREDITO_MARCO.AsString);
  End;
end;


procedure TWCrAutClin.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then Begin
      IF Objeto.ID_CREDITO_MARCO.AsString <> '' THEN BEGIN
         ValidaDispMarco( Objeto.ID_CONTRATO.AsString,
                      Objeto.FOL_CONTRATO.AsString,
                      Objeto.ID_CREDITO_MARCO.AsString);
         if Objeto.Producto.B_DISP_EN_LINEA.AsString = CVERDAD THEN Begin
          cbB_DISP_EN_LINEA.Enabled := Objeto.Producto.B_DISP_EN_LINEA.AsString = CVERDAD;
         end;
      END;
   end;
end;

end.
