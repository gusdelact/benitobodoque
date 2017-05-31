// Sistema         : Clase de RsmColo
// Fecha de Inicio : 16/01/2012
// Función forma   : Clase de RsmColo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntRsmColo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterApl,

//CLASES DE BUSQUEDA
IntMon, IntEmpre, IntUnNeg,

// REPORTES DE ORIGEN
IntMQrColoca, IntMQrInCoCob, IntMQrFndProgVen,

//USES EXTRA
IntParamCre, IntGenCre, Grids, IntSGCtrl, IntLinkit, InterEdit, Psock,
  NMsmtp, CheckLst;

Type
 TRsmColo= class;

  TWRsmColo=Class(TForm)
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
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    LtotalReg: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    edIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    QryMoneda: TQuery;
    ButtonEjecuta1: TButton;
    Memo2: TMemo;
    ButtonEjecuta2: TButton;
    QryEntDesc: TQuery;
    ButtonEjecuta3: TButton;
    Memo3: TMemo;
    QApoyo: TQuery;
    SGrid1: TStringGrid;
    SGrid2: TStringGrid;
    SGrid3: TStringGrid;
    TabSheet5: TTabSheet;
    ButtonEnvia: TButton;
    Memo4: TMemo;
    NMSMTP1: TNMSMTP;
    Memo5: TMemo;
    Label2: TLabel;
    edEncabezado: TEdit;
    Label3: TLabel;
    edNombreEnvia: TEdit;
    Label4: TLabel;
    edEmail: TEdit;
    Memo6: TMemo;
    Label5: TLabel;
    edAviso: TEdit;
    ChBInfManual: TCheckBox;
    Memo7: TMemo;
    TabSheet4: TTabSheet;
    SGrid4: TStringGrid;
    Memo8: TMemo;
    BtnTo: TButton;
    PageControl2: TPageControl;
    TbShPara: TTabSheet;
    TbShCC: TTabSheet;
    TbShCCO: TTabSheet;
    Memo9: TMemo;
    Memo10: TMemo;
    Memo11: TMemo;
    ChLBDirs: TCheckListBox;
    QryDirs: TQuery;
    BtnNo: TButton;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure ButtonEjecuta1Click(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure ButtonEjecuta2Click(Sender: TObject);
    procedure ButtonEjecuta3Click(Sender: TObject);
    procedure ButtonEnviaClick(Sender: TObject);
    procedure edFECHAChange(Sender: TObject);
    procedure TabSheet5Enter(Sender: TObject);
    procedure SGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnToClick(Sender: TObject);
    procedure BtnNoClick(Sender: TObject);
    procedure Memo6DblClick(Sender: TObject);
    private
    { Private declarations }
     Procedure CalculaTotalesGrid(Grid: TStringGrid; Comienzo, Final: Integer) ;
     Procedure PreparaTexto(Grid: TStringGrid; Area: Integer);
     Procedure AsignaEmpresaSuc;
     procedure DefaultGridManual ;
     procedure DefaultDirecciones ;
     function ObtSmtpHost(Grupo, Item: String; Apli: TInterApli): String;
     function CaractEsp(Texto: String): String ;
    public
    { Public declarations }
    Objeto : TRsmColo;

//    Procedure RepExpPago( sAcreditado, sEmpresa, sSucursal : String; dFecha   : TDateTime );
end;
 TRsmColo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        FECHA                    : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        ID_SUCURSAL              : TInterCampo;

        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;


implementation

{$R *.DFM}


constructor TRsmColo.Create( AOwner : TComponent );
begin Inherited;
     FECHA :=CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
                FECHA.Caption:='Fecha';
                FECHA.Parametro:='FECHA';
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
                ID_EMPRESA.Caption:='Empresa';
                ID_EMPRESA.Parametro:='ID_EMPRESA';

      ID_SUCURSAL :=CreaCampo('ID_SUCURSAL',ftInteger,tsNinguno,tsNinguno,False);
                ID_EMPRESA.Caption:='Sucursal';
                ID_EMPRESA.Parametro:='ID_SUCURSAL';

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      {$WARNINGS ON}

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntRsmColo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TRsmColo.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TRsmColo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWRsmColo;
begin
   W:=TWRsmColo.Create(Self);
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


Function TRsmColo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRsmColo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TRsmColo.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA RsmColoC********************)
(*                                                                              *)
(*  FORMA DE RsmColoC                                                            *)
(*                                                                              *)
(***********************************************FORMA RsmColoC********************)
function TWRsmColo.CaractEsp(Texto: String) : String ;
var Cad: String ;
begin
   Cad:= Texto ;
   Cad:= StringReplace(Cad, 'á', '&eacute;', [rfReplaceAll, rfIgnoreCase]) ;
   Cad:= StringReplace(Cad, 'é', '&eacute;', [rfReplaceAll, rfIgnoreCase]) ;
   Cad:= StringReplace(Cad, 'í', '&iacute;', [rfReplaceAll, rfIgnoreCase]) ;
   Cad:= StringReplace(Cad, 'ó', '&oacute;', [rfReplaceAll, rfIgnoreCase]) ;
   Cad:= StringReplace(Cad, 'ú', '&uacute;', [rfReplaceAll, rfIgnoreCase]) ;
   Cad:= StringReplace(Cad, 'ñ', '&ntilde;', [rfReplaceAll, rfIgnoreCase]) ;

   Result:= Cad ;
end ;

function TWRsmColo.ObtSmtpHost(Grupo, Item: String; Apli: TInterApli): String;
var sSQL: String ;
  begin
    result := '';
    sSQL:= 'SELECT VALOR FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = '''+Grupo+''' AND CVE_REFERENCIA = '''+Item+''' ';
    GetSQLStr( sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'VALOR', Result, False );
    if result = '' then
      result := '0';
end;


procedure TWRsmColo.FormDestroy(Sender: TObject);
begin
   Objeto.FECHA.Control:=nil;
   Objeto.ID_EMPRESA.Control:=nil;
   Objeto.ID_SUCURSAL.Control:=nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

   //Objeto
end;

procedure TWRsmColo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWRsmColo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWRsmColo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWRsmColo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWRsmColo.FormShow(Sender: TObject);
begin
 With Objeto Do
   Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      InterForma1.BtnAyuda.Visible:=False;
      InterForma1.BtnSalir.Visible:=False;
   end;
   Objeto.FECHA.Control:=edFECHA;
   Objeto.ID_EMPRESA.Control:=edIdEmpresa;
   Objeto.ID_SUCURSAL.Control:=edIDSucursal;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
   dtpFecha.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edFECHA.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));

end;

procedure TWRsmColo.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then
      CBSucursal.Checked := True;
   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end ;

procedure TWRsmColo.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;


procedure TWRsmColo.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWRsmColo.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWRsmColo.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWRsmColo.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWRsmColo.ButtonEjecuta1Click(Sender: TObject);
var vlTotDisp, SQLOri, SQLText : String;
    ArrOrigen: Array[0..1, 0..1] of String ;
    i, j, k: integer ;
begin
   if Objeto.ValidaAccesoEsp('TRSMCOLO_EJEC1',True,True) then
   begin
        Objeto.FECHA.GetFromControl;
    //    Memo5.Lines.Clear ;
        SGrid1.RowCount := 3 ;

        ArrOrigen[0, 0]:= 'V'; ArrOrigen[0, 1]:= 'OPERADO POR NAFIN' ;
        ArrOrigen[1, 0]:= 'F'; ArrOrigen[1, 1]:= 'RECURSOS PROPIOS' ;

        SQLOri:= ''; SQLtext := '' ;

        {sFInicio,sFFin,sProducto,sMoneda, sAcreditado,
        sPromAsoc,sPromAdmon,sCesion,sSituacion,sGpoProd,
        sProcam, sOperDD,sTipoDisp,sEmpresa, sSucursal,
        sMedio:String;
        sPromotorAso,sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean }
        QApoyo.Close ;
        QApoyo.DataBaseName:= Objeto.Apli.DataBaseName ;
        QApoyo.SessionName:= Objeto.Apli.SessionName ;

        QryMoneda.Close ;
        QryMoneda.DataBaseName:= Objeto.Apli.DataBaseName ;
        QryMoneda.SessionName:= Objeto.Apli.SessionName ;
        QryMoneda.Close ;
        QryMoneda.SQL.Clear ;
        QryMoneda.SQL.Add('SELECT CVE_MONEDA, ' +
                          ' CASE WHEN CVE_MONEDA= 484 THEN ''M.N. ''  '+
                          '      WHEN CVE_MONEDA = 840  THEN ''DOLARES US ''  '+
                          '      ELSE DESC_MONEDA END AS DESC_MONEDA '+
                          ' FROM MONEDA '+
                          ' WHERE CVE_MONEDA IN (484, 840)') ; // provisionalmente solo considera pesos y euros
        QryMoneda.Open ;

        SGrid1.Cells[0, 0]:= 'OPERACION '+edFecha.Text ;
        SGrid1.Cells[0, 1]:= 'Origen \ Moneda';
        SGrid1.Cells[0, 2]:= 'OPERADO POR NAFIN' ;
        SGrid1.Cells[0, 3]:= 'RECURSOS PROPIOS' ;
        SGrid1.Cells[0, 4]:= 'TOTALES';

        k:= 1 ; // columna
        j:= 1 ; //renglon
        while not QryMoneda.EOF do
          begin
             SGrid1.Cells[k, 1]:= Trim(QryMoneda.FieldByName('DESC_MONEDA').AsString) ;
             SQLOri:= QrColoca.FormaQuery(edFECHA.Text, edFECHA.Text, '', QryMoneda.FieldByName('CVE_MONEDA').AsString, '',
                                             '', '', '', '', '', '', '', '', edIdEmpresa.Text, EdIDSucursal.Text, '',
                                             False, False, False, False) ;
             SQLText := 'SELECT CONSULTA.DESC_MONEDA, '+
                        ' NVL(SUM(IMP_DISPUESTO), 0) AS SUMA_IMP_DISP '+
                        ' FROM ( '+SQLOri+' ) CONSULTA '+
                        //' WHERE 1=1 '+ CONDICION DE BANDERA
                        ' GROUP BY CONSULTA.DESC_MONEDA '+
                        'ORDER BY CONSULTA.DESC_MONEDA ' ;  /// hace el total, que se ira hasta el final

             QApoyo.Close ;
             QApoyo.SQL.Clear ;
             QApoyo.SQL.Add(SQLText) ;
             QApoyo.SQL.SaveToFile('C:\IntRsmColo_Qry1_'+QryMoneda.FieldByName('CVE_MONEDA').AsString+'.sql') ;
             QApoyo.Open ;
             If QApoyo.RecordCount > 0 then
                begin
                   vlTotDisp:= FormatFloat('###,###,###,###,###,##0', QApoyo.FieldByName('SUMA_IMP_DISP').AsFloat/1000 ) ;
                   SGrid1.Cells[k, 4]:= vlTotDisp ;
                end ;

                 for i:= 0 to 1 do  begin
                   SQLText := 'SELECT CONSULTA.DESC_MONEDA, '+
                              ' CASE WHEN NVL(CONSULTA.B_OPERADO_NAFIN,''F'') = ''V'' THEN ''OPERADO NAFIN'' '+
                              '      WHEN NVL(CONSULTA.B_OPERADO_NAFIN,''F'') = ''F'' THEN ''RECURSOS PROPIOS'' '+
                              '      END AS ORIGEN, '+
                              ' NVL(SUM(IMP_DISPUESTO), 0) AS SUMA_IMP_DISP '+
                              ' FROM ( '+SQLOri+' ) CONSULTA '+
                              ' WHERE CONSULTA.B_OPERADO_NAFIN = '''+ArrOrigen[i, 0]+'''  '+
                              //' AND 1=1 '+ CONDICION DE BANDERA
                              ' GROUP BY CONSULTA.DESC_MONEDA, CONSULTA.B_OPERADO_NAFIN '+
                              'ORDER BY CONSULTA.DESC_MONEDA ' ;

                   QApoyo.Close ;
                   QApoyo.SQL.Clear ;
                   QApoyo.SQL.Add(SQLText) ;
                   QApoyo.SQL.SaveToFile('C:\IntRsmColo_Qry2_'+QryMoneda.FieldByName('CVE_MONEDA').AsString+'_'+ArrOrigen[i, 0]+'.sql') ;
                   QApoyo.Open ;
                   If QApoyo.RecordCount > 0 then
                      begin
                          vlTotDisp:= FormatFloat('###,###,###,###,###,##0', QApoyo.FieldByName('SUMA_IMP_DISP').AsFloat/1000 ) ;
                          {SGrid1.Cells[1, k]:= Trim(ArrOrigen[i, 1]) ;
                          SGrid1.Cells[4, k]:= vlTotDisp ; }
                          //SGrid1.Cells[0, j]:= Trim(ArrOrigen[i, 1]) ;
                          //SGrid1.ColCount:= SGrid1.ColCount + 1;
                          Inc(j) ;
                          SGrid1.RowCount:= SGrid1.RowCount + 1 ;
                          If j > 3 then j:= 2 ;
                          SGrid1.Cells[k, j]:= vlTotDisp ;
                      end ;

                   {If ArrOrigen[i, 0]= 'F' then
                      begin
                          SQLText := 'SELECT CONSULTA.TITULAR, '+
                                     ' CASE WHEN NVL(CONSULTA.B_OPERADO_NAFIN,''F'') = ''V'' THEN ''OPERADO NAFIN'' '+
                                     '      WHEN NVL(CONSULTA.B_OPERADO_NAFIN,''F'') = ''F'' THEN ''RECURSOS PROPIOS'' '+
                                     '      END AS ORIGEN, '+
                                     ' NVL(SUM(IMP_DISPUESTO), 0) AS SUMA_IMP_DISP '+
                                     ' FROM ( '+SQLOri+' ) CONSULTA '+
                                     ' WHERE CONSULTA.B_OPERADO_NAFIN = '''+ArrOrigen[i, 0]+'''  '+
                                     //' AND 1=1 '+ CONDICION DE BANDERA
                                     ' GROUP BY CONSULTA.TITULAR, CONSULTA.B_OPERADO_NAFIN '+
                                     'ORDER BY CONSULTA.TITULAR ' ;

                          QApoyo.Close ;
                          QApoyo.SQL.Clear ;
                          QApoyo.SQL.Add(SQLText) ;
                          QApoyo.SQL.SaveToFile('C:\IntRsmColo_Qry3_'+QryMoneda.FieldByName('CVE_MONEDA').AsString+'_'+ArrOrigen[i, 0]+'.sql') ;
                          QApoyo.Open ;
                          if QApoyo.RecordCount > 0 then
                             begin
                                j := 0 ;
                                While not QApoyo.Eof do begin
                                   SGrid1.Cells[2, (k+i)+j] := ' * '+Trim(QApoyo.FieldByName('TITULAR').AsString);
                                   SGrid1.Cells[3, (k+i)+j] := FormatFloat('###,###,###,###,###,##0', QApoyo.FieldByName('SUMA_IMP_DISP').AsFloat) ;
                                   inc(j);
                                   SGrid1.RowCount:= SGrid1.RowCount + 1;
                                   QApoyo.Next ;
                                end ;
                             end ;
                      end ;
                     }
                 end ; // for
             QryMoneda.Next ;
             Inc(k) ;
             SGrid1.RowCount := 5 ;
             SGrid1.ColCount := QryMoneda.RecordCount+1 ;
             CalculaTotalesGrid(SGrid1, 2, 4) ;
          end ;
       ButtonEjecuta1.Visible := False ;
   end;
end;

procedure TWRsmColo.ButtonEjecuta2Click(Sender: TObject);
var SQLOri, SQlText, vlTotal : String;
    x, y: Integer ;
begin
   if Objeto.ValidaAccesoEsp('TRSMCOLO_EJEC2',True,True) then
   begin
      SQLOri := ''; SQLText := '' ;
      SGrid2.RowCount := 3 ;

      QApoyo.Close ;
      QApoyo.DataBaseName:= Objeto.Apli.DataBaseName ;
      QApoyo.SessionName:= Objeto.Apli.SessionName ;

      QryEntDesc.Close ;
      QryEntDesc.DataBaseName:= Objeto.Apli.DataBaseName ;
      QryEntDesc.SessionName:= Objeto.Apli.SessionName ;
      QryEntDesc.SQL.Clear ;
      QryEntDesc.SQL.Add('SELECT CVE_FND_ENT_DES, DESC_ENT_DES '+
                         ' FROM CR_FND_ENT_DES '+
                         'WHERE B_CONTABILIZA = ''V''  ') ;
      QryEntDesc.Open ;

      QryMoneda.Close ;
      QryMoneda.DataBaseName:= Objeto.Apli.DataBaseName ;
      QryMoneda.SessionName:= Objeto.Apli.SessionName ;
      QryMoneda.SQL.Clear ;
      QryMoneda.SQL.Add('SELECT CVE_MONEDA, ' +
                        ' CASE WHEN CVE_MONEDA= 484 THEN ''M.N. ''  '+
                        '      WHEN CVE_MONEDA = 840  THEN ''DOLARES US ''  '+
                        '      ELSE DESC_MONEDA END AS DESC_MONEDA '+
                        ' FROM MONEDA '+
                        ' WHERE CVE_MONEDA IN (484, 840)') ; // provisionalmente solo considera pesos y euros
      QryMoneda.Open ;

      {sF_Vencimiento,sF_Programada,sProducto,sMoneda,sAcreditado,
      sProveedor, sPromAsoc,sPromAdmon,sCesion,sSituacion,
      sOrden,sTipoReporte,sFecRep,sTipoProd, sEmpresa,
      sSucursal,sGpoProd, sOperDD,sOrigen, sEntidad,
      sPrograma:String; sSituacionAC, sSituacionPS:string; //HERJA 16.12.2010
      bIncTipoSec:Boolean):String;}

      SGrid2.RowCount := QryEntDesc.RecordCount + 3;
      SGrid2.ColCount := QryMoneda.RecordCount+ 1 ;
      SGrid2.Cols[0].Text := 'PAGO DE FONDEO ENTIDADES';
      SGrid2.Cells[0, 1]:= 'Entidad \ Moneda' ;
      SGrid2.Cells[0, SGrid2.RowCount-1]:= 'TOTALES' ;

      y:= 2; // renglon
      While not QryEntDesc.Eof do begin
         SGrid2.Cells[0, y]:= Trim(QryEntDesc.FieldByName('DESC_ENT_DES').AsString) ;
         QryMoneda.Close ;
         QryMoneda.DataBaseName:= Objeto.Apli.DataBaseName ;
         QryMoneda.SessionName:= Objeto.Apli.SessionName ;
         QryMoneda.SQL.Clear ;
         QryMoneda.SQL.Add('SELECT CVE_MONEDA, ' +
                           ' CASE WHEN CVE_MONEDA= 484 THEN ''M.N. ''  '+
                           '      WHEN CVE_MONEDA = 840  THEN ''DOLARES US ''  '+
                           '      ELSE DESC_MONEDA END AS DESC_MONEDA '+
                           ' FROM MONEDA '+
                           ' WHERE CVE_MONEDA IN (484, 840)') ; // provisionalmente solo considera pesos y euros
         QryMoneda.Open ;
         x:= 1 ;// columna
         While not QryMoneda.Eof do begin
            SGrid2.Cells[x, 1]:= Trim(QryMoneda.FieldbyName('DESC_MONEDA').AsString) ;
            SQLOri := QrFndProgVen.FormaQuery(edFECHA.Text, edFECHA.Text, '', QryMoneda.FieldByName('CVE_MONEDA').AsString, '',
                                               '', '', '', '', '',
                                               '', 'O', '', '', EdIdEmpresa.Text,
                                               EdIDSucursal.Text, '', '', '', QryEntDesc.FieldByName('CVE_FND_ENT_DES').AsString,
                                               '', '', '',
                                               False ) ;

            SQLText:= 'SELECT CONSULTA.DESC_MONEDA, NVL(SUM(CONSULTA.IMP_TOTAL), 0) AS TOTAL_ENT '+
                      'FROM ('+SQLOri+') CONSULTA '+
                      'GROUP BY CONSULTA.DESC_MONEDA '+
                      'ORDER BY CONSULTA.DESC_MONEDA ' ;
            QApoyo.Close ;
            QApoyo.SQL.Clear ;
            QApoyo.SQL.Add(SQLText) ;
            QApoyo.SQL.SaveToFile('C:\IntRsmColo_Qry4_'+QryMoneda.FieldByName('CVE_MONEDA').AsString+'_'+QryEntDesc.FieldByName('CVE_FND_ENT_DES').AsString+'.sql') ;
            QApoyo.Open ;

            //GetSQLStr(SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TOTAL_ENT', vlTotal, False) ;
            vlTotal:= FormatFloat('###,###,###,###,###,##0', QApoyo.FieldByName('TOTAL_ENT').AsFloat/1000) ;
            If vltotal <> '0' then
               begin
                  SGrid2.Cells[x, y]:= vlTotal ;
               end ;
            //SHOWMESSAGE('ENTIDAD: '+QryEntDesc.FieldByName('CVE_FND_ENT_DES').AsString+#13+'MONEDA:  '+QryMoneda.FieldByName('CVE_MONEDA').AsString+#13+'COLUMNA: '+IntToStr(x)+' RENGLON: '+IntToStr(y)+' VALOR: '+SGrid2.Cells[x, y]+' ') ;
            QryMoneda.Next ;
            Inc(x);
         end ;
         QryEntDesc.Next ;
         Inc(y) ;
         SGrid2.ColCount := SGrid2.ColCount + 1 ;
      end ;
      SGrid2.ColCount := QryMoneda.RecordCount + 1;
      SGrid2.RowCount := QryEntDesc.RecordCount + 3 ;
      CalculaTotalesGrid(SGrid2, 1, SGrid2.RowCount-1) ;
      ButtonEjecuta2.Visible := False ;
   end;
end;

procedure TWRsmColo.ButtonEjecuta3Click(Sender: TObject);
var SQLOri, SQLText, vlTot : String ;
    l: Integer ;
begin
   if Objeto.ValidaAccesoEsp('TRSMCOLO_EJEC3',True,True) then
   begin
      SQLOri := ''; SQLText := '' ;

      QryMoneda.Close ;
      QryMoneda.DataBaseName:= Objeto.Apli.DataBaseName ;
      QryMoneda.SessionName:= Objeto.Apli.SessionName ;
      QryMoneda.SQL.Clear ;
      QryMoneda.SQL.Add('SELECT CVE_MONEDA, '+
                        ' CASE WHEN CVE_MONEDA= 484 THEN ''M.N. ''  '+
                        '      WHEN CVE_MONEDA = 840  THEN ''DOLARES US ''  '+
                        '      ELSE DESC_MONEDA END AS DESC_MONEDA '+
                        ' FROM MONEDA '+
                        ' WHERE CVE_MONEDA IN (484, 840)') ; // provisionalmente solo considera pesos y euros
      QryMoneda.Open ;

      {sF_Inicio,sF_Final,sProducto,sMoneda, sAcreditado,
      sCatMinimo, sCredito, sSitMov, sOrden, sEmpresa,
      sSucursal, sGpoProd:String;
      bIncTipoSec:Boolean;bPagoFIRA : Integer):String;}

     SGrid3.ColCount:= QryMoneda.RecordCount + 1 ;
     SGrid3.RowCount := 4 ;

     SGrid3.Cols[0].Text := 'COBRANZA' ;
     SGrid3.Cells[0, 1]:= 'Entidad \ Moneda' ;
     SGrid3.Cells[0, 2]:= 'BINTER';
     SGrid3.Cells[0, 3]:= 'TOTALES' ;

     l:= 1 ; //columna

      While not QryMoneda.Eof do begin
         SGrid3.Cells[l, 1]:= Trim(QryMoneda.FieldbyName('DESC_MONEDA').AsString) ;
         SQLOri:= QrInCoCob.FormaQuery(edFECHA.Text, edFecha.Text, '', QryMoneda.FieldByName('CVE_MONEDA').AsString, '',
                                   '', '', 'AC', '', EdIdEmpresa.Text,
                                   EdIDSucursal.Text, '',
                                   False, 0) ;

         SQLText:= 'SELECT CONSULTA.DESC_MONEDA, '+
                   ' SUM(IMPBRU) + SUM(IMPIVA) + SUM(IMPMOR) + SUM(IVAMOR) AS TOT_COBR_MONEDA, '+
                   ' SUM(BENBCO), '+
                   ' SUM(BENGOB) '+
                   'FROM ('+SQLOri+') CONSULTA '+
                   'GROUP BY CONSULTA.DESC_MONEDA '+
                   'ORDER BY CONSULTA.DESC_MONEDA ' ;
         QApoyo.Close ;
         QApoyo.DataBaseName:= Objeto.Apli.DataBaseName ;
         QApoyo.SessionName:= Objeto.Apli.SessionName ;
         QApoyo.SQL.Clear ;
         QApoyo.SQL.Add(SQLText) ;
         QApoyo.SQL.SaveToFile('C:\IntRsmColo_Qry5_'+QryMoneda.FieldByName('CVE_MONEDA').AsString+'.sql') ;
         QApoyo.Open ;

         //GetSQLStr(SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TOT_COBR_MONEDA', vlTot, False) ;
         vlTot:= FormatFloat('###,###,###,###,###,##0', QApoyo.FieldbyName('TOT_COBR_MONEDA').AsFloat/1000 ) ;

         If vlTot <> '0' then
            begin
               SGrid3.Cells[l, 2]:= vlTot ;
               SGrid3.Cells[l, 3]:= vlTot ;
            end ;

         QryMoneda.Next ;
         Inc(l) ;
      end ;
       SGrid3.ColCount:= QryMoneda.RecordCount + 1 ;
       SGrid3.RowCount := 4 ;
       SGrid3.FixedRows:= 2 ;
       CalculaTotalesGrid(SGrid3, 1, SGrid3.RowCount-1) ;
       ButtonEjecuta3.Visible := False ;
   end;
end;

procedure TWRsmColo.CalculaTotalesGrid(Grid: TStringGrid; Comienzo, Final: Integer) ;
var n, m: Integer;
   Suma, Num: Integer ;
begin
   With Grid do begin
       Suma:= 0 ;
       For n:= Comienzo to ColCount-1 do begin
           For m:= 2 to RowCount - 2 do begin //todos los grids llevan los dos renglones primeros fijos
              If Cells[n, m]= '' then
                 Num:= 0
              else
                 Num:= StrToInt(TrimChar(Cells[n, m], '$,-()><"#&%') ) ;
              Suma:= Suma + Num ;
              If Num = 0 then
                 Cells[n, m]:= ''
              else
                 Cells[n, m]:= FormatFloat('###,###,###,###,###,##0', Num);
           end;
           If Suma = 0 then
              Cells[n, Final]:= ''
           else
              Cells[n, Final]:= FormatFloat('###,###,###,###,###,##0', Suma) ;
           Suma:= 0 ;
       end ;
   end ;
end ;

procedure TWRsmColo.ButtonEnviaClick(Sender: TObject);
var p: Integer;
    Texto: String ;
begin
   if Objeto.ValidaAccesoEsp('TRSMCOLO_ENVIA',True,True) then
   begin
      TabSheet5Enter(Self);
      Texto:= '' ;
      For p:=0 to Memo7.Lines.Count - 1 do begin
          Texto := Texto + CaractEsp(Memo7.Lines[p]) + '<br>' ;
      end ;

      Memo5.Lines.Add('<p><span style="font-size:13.5pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">'+Texto+'</span></p>');
      Memo5.Lines.Add('<p class="MsoNormal"><br>'+#13+
                      '<b><span style="font-size:13.5pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">'+edNombreEnvia.Text+
                      '</span></b><span style="font-size:13.5pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;"> </span></p> ');
      Memo5.Lines.Add('</div> '+#13+'</body>'+#13+'</html> ') ;


  {    Memo5.Lines.Add('<br>'+#13+'<font face="calibri" size="4">'+#13+'<p>'+Texto+'</p>'+#13+'</font>') ;
      Memo5.Lines.Add('<br><font face="calibri" size="4">'+#13+'<b>'+edNombreEnvia.Text+'</b>'+#13+'</font>'+#13+'</body>'+#13+'</html>'+#13) ; }
      Memo5.Lines.SaveToFile('C:\TextoHtml.html') ;
      try
          if NMSMTP1.Connected then NMSMTP1.Disconnect;

          NMSMTP1.Port := StrToInt(ObtSmtpHost('EDOCTA', 'PORT', Objeto.Apli) ) ;  //25
          NMSMTP1.Host:= ObtSmtpHost('EDOCTA', 'HOST', Objeto.Apli); //'132.1.4.130' ;
          NMSMTP1.Connect;
          NMSMTP1.PostMessage.ToAddress.Assign(Memo9.Lines); //Memo4.Lines
          NMSMTP1.PostMessage.ToCarbonCopy.Assign(Memo10.Lines);
          NMSMTP1.PostMessage.ToBlindCarbonCopy.Assign(Memo11.Lines) ;
          NMSMTP1.PostMessage.FromAddress  := edEMail.Text ;
          NMSMTP1.PostMessage.FromName:= edNombreEnvia.Text ;
          NMSMTP1.PostMessage.ReplyTo:= ObtSmtpHost('RSMCOL', 'REPLYTO', Objeto.Apli); //'spadilla@interacciones.com' ;
          NMSMTP1.PostMessage.Subject:= edEncabezado.Text;
          NMSMTP1.PostMessage.Date := FormatDateTime('dd/mm/yyyy hh:nn am/pm',Now);
  //        NMSMTP1.PostMessage.Attachments.Clear;
  //        NMSMTP1.PostMessage.Attachments.Add('C:\LogoInter.jpg');
          NMSMTP1.PostMessage.Body.Assign(Memo5.Lines);
          NMSMTP1.SubType:= mtHTML;
          NMSMTP1.SendMail;
          NMSMTP1.Disconnect;
          ShowMessage('('+NMSMTP1.Host+' - '+IntToStr(NMSMTP1.Port)+')'+#13+#13+'Mensaje de correo electronico enviado satisfactoriamente...') ;
      except
          ShowMessage('('+NMSMTP1.Host+' - '+IntToStr(NMSMTP1.Port)+')'+#13+#13+'Problema de envio...') ;
      end;
   end;
end;

procedure TWRsmColo.PreparaTexto(Grid: TStringGrid; Area: Integer);
var Primeros, Entre, Ultimos, Alinea, Linea : String ;
    i, j: Integer;
begin
   Linea:= '<tr>' ;
   Memo5.Lines.Add('<br><br>');
   Case Area of
      1: begin
           //('<div align=left><H3><b>COLOCACION</div></b></H3>') ;
           Entre := 'COLOCACION' ;
         end ;
      2: begin
           //('<br><div align=left><H3><b>PAGO DE FONDEO DE ENTIDADES</div></b></H3>') ;
           Entre := 'PAGO DE FONDEO DE ENTIDADES' ;
         end ;
      3: begin
           //('<br><div align=left><H3><b>COBRANZA</div></b></H3>') ;
           Entre := 'COBRANZA' ;
         end ;
      4: begin
           //('<br><div align=left><H3><b>OPERACION FIDUCIARIA</div></b></H3>') ;
           Entre := 'OPERACION FIDUCIARIA' ;
         end ;
   end;
   With Grid do
     begin
//        Memo5.Lines.Add('<table width="40%" border=1 cellspacing=0 cellpadding=2 bordercolor="E6E6E6">') ;
//        Memo5.Lines.Add('<tr><div align=center><font face="calibri" size="3" color="black"><B><td BGCOLOR = "F3E2A9" width=50 colspan='+IntToStr(ColCount)+'>'+Entre+'</td></B></font></div></tr>') ;

        //Memo5.Lines.Add('<p class="MsoNormal" style="margin-bottom:12.0pt"> </p> '+#13) ;

        Memo5.Lines.Add('<table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" width="40%" style="width:40.0%;border:outset #e6e6e6 1.0pt"> '+#13) ;
        Memo5.Lines.Add(' <tr>  '+#13) ;

{        Memo5.Lines.Add('<table width="40%" border="1" cellspacing="0" cellpadding="2" bordercolor="E6E6E6">'+#13) ;
        Memo5.Lines.Add('<tr>'+#13); }

        Memo5.Lines.Add('  <td width="50" colspan="3" style="width:37.5pt;border:inset #e6e6e6 1.0pt;background:#f3e2a9;padding:1.5pt 1.5pt 1.5pt 1.5pt"> '+#13) ;
        Memo5.Lines.Add('  <p class="MsoNormal" align="center" style="text-align:center"><b><span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:black">'+Entre+'</span></b></p> '+#13) ;
        Memo5.Lines.Add('  </td> '+#13) ;
        Memo5.Lines.Add(' </tr>  '+#13) ;

{        Memo5.Lines.Add('<div align=center><font face="calibri" size="3" color="black"><b><td BGCOLOR = "F3E2A9" width=50 colspan='+IntToStr(ColCount)+'>'+Entre+'</td></b></font></div></tr>') ;}


        For i:= 1 to RowCount-1 do begin
           For j:= 0 to ColCount -1 do begin
            If i= RowCount-1 then begin
                If j=0 then
                   Alinea:= 'left'
                else  begin
                   If (Area = 4) and (j=1) then
                      Alinea:= 'center' 
                   Else
                      Alinea:= 'right';
                end ;

{ <tr>
  <td width="50" style="width:37.5pt;border:inset #e6e6e6 1.0pt;background:#f3e2a9;padding:1.5pt 1.5pt 1.5pt 1.5pt">
  <p class="MsoNormal" align="center" style="text-align:center"><b><span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:black">


</span></b></p>
  </td>  }
                Primeros:='    <td width="50" style="width:37.5pt;border:inset #e6e6e6 1.0pt;background:#f3e2a9;padding:1.5pt 1.5pt 1.5pt 1.5pt"> '+#13+
                          '    <p class="MsoNormal" align="center" style="text-align:'+Alinea+'"><b><span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:black"> ';
                Ultimos:= '    </span></b></p> '+#13 ;


{                Primeros:= '<div align='+Alinea+'><font face="calibri" size="3" color="black"><b><td BGCOLOR="F3E2A9" width=50>';  //colspan= "6"
                Ultimos:=  '</td></b>'+#13+'</font>'+#13+'</div>'+#13; }
            end
            else begin
                 If i=1 then begin

                    Primeros:='     <td width="50" style="width:37.5pt;border:inset #e6e6e6 1.0pt;background:#f3e2a9;padding:1.5pt 1.5pt 1.5pt 1.5pt"> '+#13+
                              '     <p class="MsoNormal" align="center" style="text-align:center"><b><span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:black"> ';
                    Ultimos:= '     </span></b></p>' ;
{                    Primeros:= '<div align=center><font face="calibri" size="3" color="black"><b><td BGCOLOR="F3E2A9" width=50>';  //colspan= "6"
                    Ultimos:=  '</td></b>'+#13+'</font>'+#13+'</div>'+#13; }
                 end
                 else begin
                      If j= 0 then
                         Alinea:= 'left'
                      else begin
                         If (Area = 4) and (j=1) then
                            Alinea := 'center'
                         else
                            Alinea := 'right';
                      end ;

                    Primeros:='   <td width="50" style="width:37.5pt;border:inset #e6e6e6 1.0pt;background:white;padding:1.5pt 1.5pt 1.5pt 1.5pt"> '+#13+
                              '   <p class="MsoNormal" align="'+Alinea+'" style="text-align:'+Alinea+'"><span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:black"> ';
                    Ultimos:= '   </span></p>'+#13 ;
{                    Primeros:= '<div align='+Alinea+'><font face="calibri" size="3" color="black"><td BGCOLOR="FFFFFF" width=50>';  //colspan= "6"
                    Ultimos:=  '</td>'+#13+'</font>'+#13+'</div>'+#13 ; }
                 end ;
            end ;
                Linea:= Linea + Primeros + Grid.Cells[j, i] + Ultimos  ;
            end ; //for
            Memo5.Lines.Add(Linea+'</tr>'+#13) ;
            Linea := '<tr>'+#13 ;
        end ; //for
        Memo5.Lines.Add('</table>') ;
     end ; // with
   Memo5.Lines.Add('') ;
end;

procedure TWRsmColo.edFECHAChange(Sender: TObject);
var i, r: Integer ;
begin
//   t:= '' ;
   for i := 0 to ComponentCount - 1 do begin
    if Components[i] is TStringGrid  then
       begin
          For r:= 0 to (Components[i] as TStringGrid).RowCount-1 do begin
             (Components[i] as TStringGrid).Rows[r].Clear ;
          end ;
       end ;
    if Components[i] is TButton then
       (Components[i] as TButton).Visible := True ;
   end ;

   edEncabezado.Text  := 'Cierre de operaciones de credito y fiduciario del '+edFecha.Text ;
   edNombreEnvia.Text := ObtSmtpHost('RSMCOL', 'NFROM', Objeto.Apli);  //'Control de Operaciones Interacciones' ;
   edEMail.Text := ObtSmtpHost('RSMCOL', 'FROM', Objeto.Apli) ;//t ;// 'control_operaciones@interacciones.com' ;//'info@interacciones.com' ;

   DefaultGridManual ;
   DefaultDirecciones ;
   PageControl2.ActivePage:= TbShPara ;
{   SGrid4.RowCount:= 10;
   SGrid4.Cols[0].Text := 'OPERACION FIDUCIARIA' ;
   SGrid4.Cells[0, 1]:= 'CONCEPTO';
   SGrid4.Cells[1, 1]:= 'No. OPERACIONES' ;
   SGrid4.Cells[2, 1] := 'IMPORTE' ;

   SGrid4.Cells[0, 2] := 'OPERACIONES (DISPERSIONES)' ;
   SGrid4.Cells[0, 3] := 'COBRANZA HONORARIOS FIDUCIARIOS' ;
   SGrid4.Cells[0, 4] := 'OPERACIONES OTROS BANCOS' ;
   SGrid4.Cells[0, 5] := 'INVERSIONES' ;
   SGrid4.Cells[0, 6] := '   - COMPRAS SOC. INV.' ;
   SGrid4.Cells[0, 7] := '   - VENTAS SOC. INV.' ;
   SGrid4.Cells[0, 8] := '   - APERTURAS PRLV' ;


   SGrid4.Cells[0, SGrid4.RowCount-1]:= 'TOTALES';}

   edAviso.Color:= clBtnFace ;
   edAviso.Font.Color:= clBlack ;
   edAviso.Text := '' ;
end;

procedure TWRsmColo.DefaultGridManual ;
begin
   SGrid4.RowCount:= 10;
   SGrid4.Cols[0].Text := 'OPERACION FIDUCIARIA' ;
   SGrid4.Cells[0, 1]:= 'CONCEPTO';
   SGrid4.Cells[1, 1]:= 'No. OPERACIONES' ;
   SGrid4.Cells[2, 1] := 'IMPORTE' ;

   SGrid4.Cells[0, 2] := 'OPERACIONES (DISPERSIONES)' ;
   SGrid4.Cells[0, 3] := 'COBRANZA HONORARIOS FIDUCIARIOS' ;
   SGrid4.Cells[0, 4] := 'OPERACIONES OTROS BANCOS' ;
   SGrid4.Cells[0, 5] := 'INVERSIONES' ;
   SGrid4.Cells[0, 6] := '   - COMPRAS SOC. INV.' ;
   SGrid4.Cells[0, 7] := '   - VENTAS SOC. INV.' ;
   SGrid4.Cells[0, 8] := '   - APERTURAS PRLV' ;


   SGrid4.Cells[0, SGrid4.RowCount-1]:= 'TOTALES';
end ;

procedure TWRsmColo.DefaultDirecciones ;
begin
    ChLBDirs.Items.Clear ;
    QryDirs.Close ;
    QryDirs.DataBaseName:= Objeto.Apli.DataBaseName ;
    QryDirs.SessionName:= Objeto.Apli.SessionName ;
    QryDirs.SQL.Clear ;
    QryDirs.SQL.Add('SELECT VALOR FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ''RSMCOL'' AND CVE_REFERENCIA LIKE ''EMAIL%'' ') ; // provisionalmente solo considera pesos y euros
    QryDirs.Open ;
    While not QryDirs.Eof do begin
       ChLBDirs.Items.Add(Trim(LowerCase(QryDirs.Fields[0].AsString) ) ) ;
       QryDirs.Next ;
    end ;
end ;

procedure TWRsmColo.TabSheet5Enter(Sender: TObject);
var Completo: Boolean ;
    Texto : String ;
    p: Integer ;
begin
   Memo5.Lines.Clear ;
   Texto:= '' ;
   For p:=0 to Memo6.Lines.Count - 1 do begin
       Texto := Texto + CaractEsp(Memo6.Lines[p]) + '<br>' ;
   end ;

//   Memo5.Lines.Add('<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">'+#13) ;
   Memo5.Lines.Add('<html> '+#13#13+'<head>'+#13#13+'<meta name="Generator" content="Microsoft Word 12 (filtered medium)">'+#13) ;
   Memo5.Lines.Add('<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'+#13) ;
   Memo5.Lines.Add('<style>'+#13) ;

Memo5.Lines.Add('<!--'+#13) ;
Memo5.Lines.Add(' /* Font Definitions */                           ') ;
Memo5.Lines.Add(' @font-face                                       ') ;
Memo5.Lines.Add('	{font-family:Calibri;                      ') ;
Memo5.Lines.Add('	panose-1:2 15 5 2 2 2 4 3 2 4;}            ') ;
Memo5.Lines.Add('@font-face                                        ') ;
Memo5.Lines.Add('	{font-family:Tahoma;                       ') ;
Memo5.Lines.Add('	panose-1:2 11 6 4 3 5 4 4 2 4;}            ') ;
Memo5.Lines.Add(' /* Style Definitions */                          ') ;
Memo5.Lines.Add(' p.MsoNormal, li.MsoNormal, div.MsoNormal         ') ;
Memo5.Lines.Add('	{margin:0cm;                               ') ;
Memo5.Lines.Add('	margin-bottom:.0001pt;                     ') ;
Memo5.Lines.Add('	font-size:12.0pt;                          ') ;
Memo5.Lines.Add('	font-family:"Times New Roman","serif";}    ') ;
Memo5.Lines.Add('a:link, span.MsoHyperlink                         ') ;
Memo5.Lines.Add('	{mso-style-priority:99;                    ') ;
Memo5.Lines.Add('	color:blue;                                ') ;
Memo5.Lines.Add('	text-decoration:underline;}                ') ;
Memo5.Lines.Add('a:visited, span.MsoHyperlinkFollowed              ') ;
Memo5.Lines.Add('	{mso-style-priority:99;                    ') ;
Memo5.Lines.Add('	color:purple;                              ') ;
Memo5.Lines.Add('	text-decoration:underline;}                ') ;
Memo5.Lines.Add('p                                                 ') ;
Memo5.Lines.Add('	{mso-style-priority:99;                    ') ;
Memo5.Lines.Add('	mso-margin-top-alt:auto;                   ') ;
Memo5.Lines.Add('	margin-right:0cm;                          ') ;
Memo5.Lines.Add('	mso-margin-bottom-alt:auto;                ') ;
Memo5.Lines.Add('	margin-left:0cm;                           ') ;
Memo5.Lines.Add('	font-size:12.0pt;                          ') ;
Memo5.Lines.Add('	font-family:"Times New Roman","serif";}    ') ;
Memo5.Lines.Add('span.EstiloCorreo18                               ') ;
Memo5.Lines.Add('	{mso-style-type:personal;                  ') ;
Memo5.Lines.Add('	font-family:"Calibri","sans-serif";        ') ;
Memo5.Lines.Add('	color:#1F497D;}                            ') ;
Memo5.Lines.Add('span.EstiloCorreo19                               ') ;
Memo5.Lines.Add('	{mso-style-type:personal-reply;            ') ;
Memo5.Lines.Add('	font-family:"Calibri","sans-serif";        ') ;
Memo5.Lines.Add('	color:#1F497D;}                            ') ;
Memo5.Lines.Add('.MsoChpDefault                                    ') ;
Memo5.Lines.Add('	{mso-style-type:export-only;               ') ;
Memo5.Lines.Add('	font-size:10.0pt;}                         ') ;
Memo5.Lines.Add('@page Section1                                    ') ;
Memo5.Lines.Add('	{size:612.0pt 792.0pt;                     ') ;
Memo5.Lines.Add('	margin:70.85pt 3.0cm 70.85pt 3.0cm;}       ') ;
Memo5.Lines.Add('div.Section1                                      ') ;
Memo5.Lines.Add('	{page:Section1;}                           ') ;
Memo5.Lines.Add('-->                                               ') ;
Memo5.Lines.Add('</style>                                          ') ;
Memo5.Lines.Add('                                                  ') ;
Memo5.Lines.Add('</head>                                           ') ;

Memo5.Lines.Add('<body lang="ES-MX" link="blue" vlink="purple">    ') ;

Memo5.Lines.Add('<div class="Section1">                            ') ;

{Memo5.Lines.Add('<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d"> </span></p> '+#13) ;  }

Memo5.Lines.Add('<div>                                             ') ;

Memo5.Lines.Add('<p style="margin-bottom:13.5pt"><span style="font-size:13.5pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:black">'+#13+Texto+#13+'</span></p>') ;

{   Memo5.Lines.Add('<html>'+#13+'<STYLE type="text/html">'+#13+#13+'<body>'+#13) ;
   Memo5.Lines.Add('<div align=left><font face="calibri" color="black" size="4">'+#13+'<p>'+Texto+'</p>'+#13+'</font></div>'+#13) ; }
   If ButtonEjecuta1.Visible = false then PreparaTexto(SGrid1, 1) ;
   If ButtonEjecuta2.Visible = false then PreparaTexto(SGrid2, 2) ;
   If ButtonEjecuta3.Visible = false then PreparaTexto(SGrid3, 3) ;
   If ChBInfManual.Checked then PreparaTexto(SGrid4, 4) ;

   Completo:= (ButtonEjecuta1.Visible = false) and (ButtonEjecuta2.Visible = false) and (ButtonEjecuta3.Visible = false);

   If Completo= true  then begin
      edAviso.Color:= clBtnFace ;
      edAviso.Font.Color:= clBlack ;
      edAviso.Text :='Todos los componentes necesarios del mensaje estan incluidos.' ;
   end
   else begin
      edAviso.Color:= clYellow ;
      edAviso.Font.Color:= clRed ;
      edAviso.Text := 'Precaucion : el envio no contempla alguno de sus componentes necesarios.';
   end ;
end;

procedure TWRsmColo.SGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var      Valores : TStrings ;
begin
   If (key = VK_INSERT) then
      begin
         Valores := SGrid4.Rows[SGrid4.RowCount-1] ;
         SGrid4.RowCount:= SGrid4.RowCount + 1;
         SGrid4.Rows[SGrid4.RowCount-1]:= Valores ;
         SGrid4.Rows[SGrid4.RowCount-2].Clear ;
      end ;

   If (Key = VK_RETURN) then
      begin
         CalculaTotalesGrid(SGrid4, 1, SGrid4.RowCount-1) ;
      end ;

   If (key = VK_DELETE) then
      begin
         Valores := SGrid4.Rows[SGrid4.RowCount-1] ;
         SGrid4.RowCount:= SGrid4.RowCount - 1;
         SGrid4.Rows[SGrid4.RowCount-1]:= Valores ;
         //SGrid4.Rows[SGrid4.RowCount-2].Clear ;  // Activar si es que se desea limpiar la linea antes de los totales.
      end ;

   If ((ssCtrl in Shift) and (UpperCase(Char(Key))= 'A')) then   //Ctrl + A
       DefaultGridManual ;
end;

procedure TWRsmColo.SGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) then CalculaTotalesGrid((Sender as TStringGrid), 1, (Sender as TStringGrid).RowCount -1) ;
end;

procedure TWRsmColo.BtnToClick(Sender: TObject);
var i: integer ;
begin
   if Objeto.ValidaAccesoEsp('TRSMCOLO_AGREG',True,True) then
   begin
       Case PageControl2.ActivePageIndex of
            0: Memo9.Lines.Clear ;
            1: Memo10.Lines.Clear ;
            2: Memo11.Lines.Clear ;
       end ;

       For i:= 0 to ChLBDirs.Items.Count - 1 do  begin
           if ChLBDirs.Checked[i]= true then
              begin
                 Case PageControl2.ActivePageIndex of
                      0: begin
                           Memo9.Lines.Add(ChLBDirs.Items.Strings[i]) ;
                         end ;
                      1: begin
                           Memo10.Lines.Add(ChLBDirs.Items.Strings[i]) ;
                         end ;
                      2: begin
                           Memo11.Lines.Add(ChLBDirs.Items.Strings[i]) ;
                         end ;
                 end ;
                 ChLBDirs.Checked[i]:= false ;
              end ;
       end ;
   end;
end;

procedure TWRsmColo.BtnNoClick(Sender: TObject);
var i: integer ;
begin
   if Objeto.ValidaAccesoEsp('TRSMCOLO_ELIM',True,True) then
   begin
       Case PageControl2.ActivePageIndex of
            0: Memo9.Lines.Clear ;
            1: Memo10.Lines.Clear ;
            2: Memo11.Lines.Clear ;
       end ;

       For i:= 0 to ChLBDirs.Items.Count - 1 do  begin
           if ChLBDirs.Checked[i]= true then
              ChLBDirs.Checked[i]:= false ;
       end ;
   end;
end;

procedure TWRsmColo.Memo6DblClick(Sender: TObject);
begin
   If Memo6.Height= 102 then
      begin
         Memo6.BringToFront ;
         Memo6.Height:= 310 ;
         Memo6.Top:= 2 ;
      end
   Else
      begin
         Memo6.Height:= 102;
         Memo6.Top:= 210 ;
         Memo6.BringToFront ;
      end ;
end;

end.



