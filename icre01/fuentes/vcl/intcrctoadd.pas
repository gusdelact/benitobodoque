// Sistema         : Clase de CR_CONTRATO_ADD
// Fecha de Inicio : 21/08/2014
// Función forma   : Clase de CR_CONTRATO_ADD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrCtoAdd;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
// TGobierno = (, );

 TCrCtoAdd= class;

  TWCrCtoAdd=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TIPO_CART : TLabel;
    edCVE_TIPO_CART : TEdit;
    lbCVE_TIPO_OPERA : TLabel; 
    edCVE_TIPO_OPERA : TEdit;
    lbCVE_LOCALIDAD : TLabel;
    edCVE_LOCALIDAD : TEdit;
    lbCVE_MUNICIPIO : TLabel; 
    edCVE_MUNICIPIO : TEdit;
    lbCVE_ESTADO : TLabel; 
    edCVE_ESTADO : TEdit;
    lbCVE_ACT_ECONOM : TLabel; 
    edCVE_ACT_ECONOM : TEdit;
    lbRAM_MEZCLA : TLabel; 
    edRAM_MEZCLA : TEdit;
    lbRAM_FTP : TLabel; 
    edRAM_FTP : TEdit;
    lbF_ALTA : TLabel; 
    dtpF_ALTA : TInterDateTimePicker; 
    edF_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel;
    edCVE_USU_ALTA : TEdit;
    lbF_MODIFICA : TLabel; 
    dtpF_MODIFICA : TInterDateTimePicker; 
    edF_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel; 
    edCVE_USU_MODIFICA : TEdit;
    lbID_CONTRATO: TLabel;
    edID_CONTRATO: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnCVE_ESTADO: TBitBtn;
    btnCVE_MUNICIPIO: TBitBtn;
    btnCVE_LOCALIDAD: TBitBtn;
    btnCVE_TIPO_OPERA: TBitBtn;
    btnCVE_TIPO_CART: TBitBtn;
    Bevel3: TBevel;
    edDESC_TIPO_CART: TEdit;
    edDESC_TIPO_OPERA: TEdit;
    edDESC_ESTADO: TEdit;
    EdDESC_MUNICIPIO: TEdit;
    edDESC_LOCALIDAD: TEdit;
    Query1: TQuery;
    Bevel4: TBevel;
    Label1: TLabel;
    QCartasCredito: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btnCVE_TIPO_CARTClick(Sender: TObject);
    procedure btnCVE_TIPO_OPERAClick(Sender: TObject);
    procedure btnCVE_ESTADOClick(Sender: TObject);
    procedure btnCVE_MUNICIPIOClick(Sender: TObject);
    procedure btnCVE_LOCALIDADClick(Sender: TObject);
    private
    { Private declarations }

      function  tipoCartera : string;
      procedure localidadCNBV;
      procedure LocalidadDesc;
    public
    { Public declarations }

      Objeto : TCrCtoAdd;

    end;


 TCrCtoAdd= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;

        ID_CONTRATO              : TInterCampo;
        CVE_TIPO_CART            : TInterCampo;
        DESC_TIPO_CART           : TInterCampo;
        CVE_TIPO_OPERA           : TInterCampo;
        DESC_TIPO_OPERA          : TInterCampo;
        CVE_LOCALIDAD            : TInterCampo;
        DESC_LOCALIDAD           : TInterCampo;
        CVE_MUNICIPIO            : TInterCampo;
        DESC_MUNICIPIO           : TInterCampo;
        CVE_ESTADO               : TInterCampo;
        DESC_ESTADO              : TInterCampo;
        CVE_ACT_ECONOM           : TInterCampo;
        RAM_MEZCLA               : TInterCampo;
        RAM_FTP                  : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        strContrato              : string;
        strClasCont              : String;
        strTipoCartera           : string;
        strLocalidad             : string;

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


constructor TCrCtoAdd.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      CVE_TIPO_CART :=CreaCampo('CVE_TIPO_CART',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_CART.Caption:='Clave de Tipo Cart';
      DESC_TIPO_CART := CreaCampo('DESC_TIPO_CARTERA', ftString, tsNinguno, tsNinguno, false );
      CVE_TIPO_OPERA :=CreaCampo('CVE_TIPO_OPERA',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_OPERA.Caption:='Clave de Tipo Opera';
      DESC_TIPO_OPERA := CreaCampo('DESC_TIPO_OPERA', ftString, tsNinguno, tsNinguno, false );
      CVE_LOCALIDAD :=CreaCampo('CVE_LOCALIDAD',ftString,tsNinguno,tsNinguno,True);
                CVE_LOCALIDAD.Caption:='Clave de Localidad';
      DESC_LOCALIDAD := CreaCampo('DESC_LOCALIDAD', ftString, tsNinguno, tsNinguno, false );
      CVE_MUNICIPIO :=CreaCampo('CVE_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MUNICIPIO.Caption:='Clave de Municipio';
      DESC_MUNICIPIO := CreaCampo('DESC_MUNICIPIO', ftString, tsNinguno, tsNinguno, false );
      CVE_ESTADO :=CreaCampo('CVE_ESTADO',ftString,tsNinguno,tsNinguno,True);
                CVE_ESTADO.Caption:='Clave de Estado';
      DESC_ESTADO := CreaCampo('DESC_ESTADO', ftString, tsNinguno, tsNinguno, false );
      CVE_ACT_ECONOM :=CreaCampo('CVE_ACT_ECONOM',ftString,tsNinguno,tsNinguno,True);
                CVE_ACT_ECONOM.Caption:='Clave de Act Econom';
      RAM_MEZCLA :=CreaCampo('RAM_MEZCLA',ftFloat,tsNinguno,tsNinguno,True);
                RAM_MEZCLA.Caption:='Ram Mezcla';
      RAM_FTP :=CreaCampo('RAM_FTP',ftFloat,tsNinguno,tsNinguno,True);
                RAM_FTP.Caption:='Ram Ftp';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('ID_CONTRATO');

      TableName := 'CR_CONTRATO_ADD';
      UseQuery := True;
      HelpFile := 'IntCrCtoAdd.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCtoAdd.Destroy;
begin inherited;
end;


function TCrCtoAdd.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCtoAdd;
begin
   W:=TWCrCtoAdd.Create(Self);
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


Function TCrCtoAdd.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCtoAd.it','F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrCtoAdd.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_CONTRATO_ADD********************)
(*                                                                              *)
(*  FORMA DE CR_CONTRATO_ADD                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONTRATO_ADD********************)

procedure TWCrCtoAdd.FormShow(Sender: TObject);
var
  strCampo : string;
  strCatalogo : string;
begin

  Objeto.ID_CONTRATO.Control := edID_CONTRATO;
  Objeto.CVE_TIPO_CART.Control := edCVE_TIPO_CART;
  Objeto.DESC_TIPO_CART.Control := edDESC_TIPO_CART;
  Objeto.CVE_TIPO_OPERA.Control := edCVE_TIPO_OPERA;
  Objeto.DESC_TIPO_OPERA.Control := edDESC_TIPO_OPERA;
  Objeto.CVE_LOCALIDAD.Control := edCVE_LOCALIDAD;
  Objeto.DESC_LOCALIDAD.Control := edDESC_LOCALIDAD;
  Objeto.CVE_MUNICIPIO.Control := edCVE_MUNICIPIO;
  Objeto.DESC_MUNICIPIO.Control := EdDESC_MUNICIPIO;
  Objeto.CVE_ESTADO.Control := edCVE_ESTADO;
  Objeto.DESC_ESTADO.Control := edDESC_ESTADO;
  Objeto.CVE_ACT_ECONOM.Control := edCVE_ACT_ECONOM;
  Objeto.RAM_MEZCLA.Control := edRAM_MEZCLA;
  Objeto.RAM_FTP.Control := edRAM_FTP;
  Objeto.F_ALTA.Control := edF_ALTA;
  Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
  Objeto.F_MODIFICA.Control := edF_MODIFICA;
  Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;


  GetSQLStr(' SELECT SUBSTR(DESC_CLAVE, 1, 255) DESC_CLAVE' + #13 + #10 +
                   ' FROM CR_CON_CAT_DATA CR' + #13 + #10 +
                   ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_TIPO_CARTERA'' AND CR.CVE_CLAVE = '+ Objeto.CVE_TIPO_CART.AsString,
           Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_CLAVE', strCampo, False);
  //edDESC_TIPO_CART.text := strCampo;
  Objeto.DESC_TIPO_CART.AsString := strCampo;
  edID_CONTRATO.Text := Objeto.strContrato;

  Objeto.strTipoCartera := tipoCartera;
  if Objeto.strTipoCartera = 'GOB' then
    strCatalogo := 'CAT_TIPO_OP_GOB'
  else if Objeto.strTipoCartera = 'EFN' then
    strCatalogo := 'CAT_TIPO_OP_EFN'
  else if Objeto.strTipoCartera = 'ODS' then
    strCatalogo := 'CAT_TIPO_OP_ODS'
  else if Objeto.strTipoCartera = 'PYM' then
    strCatalogo := 'CAT_TIPO_OP_PYM'
  else strCatalogo := 'CAT_TIPO_OP_ALL';

  strCampo := '';
  GetSQLStr(' SELECT SUBSTR(DESC_CLAVE, 1, 255) DESC_CLAVE' + #13 + #10 +
                   ' FROM CR_CON_CAT_DATA CR' + #13 + #10 +
                   ' WHERE CR.CVE_CON_GPO_CAT = ' + QuotedStr(strCatalogo) +
                   'AND CR.CVE_CLAVE = '+ Objeto.CVE_TIPO_OPERA.AsString,
           Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_CLAVE', strCampo, False);
  edDESC_TIPO_OPERA.text := strCampo;
  Objeto.DESC_TIPO_OPERA.AsString := strCampo;

  LocalidadDesc;

{
  strCampo := '';
  GetSQLStr(' SELECT  DESC_ESTADO' + #13 + #10 +
                   ' FROM CR_LOCAL_CNBV CR' + #13 + #10 +
                   ' WHERE CR.CVE_ESTADO = ' + Objeto.CVE_ESTADO.AsString,
            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_ESTADO', strCampo, False);
  edDESC_ESTADO.Text := strCampo;
  Objeto.DESC_ESTADO.AsString := strCampo;

  strCampo := '';
  GetSQLStr(' SELECT  DESC_MPIO_COL' + #13 + #10 +
                   ' FROM CR_LOCAL_CNBV CR' + #13 + #10 +
                   ' WHERE CR.CVE_ESTADO = ' + QuotedStr(Objeto.CVE_ESTADO.AsString) +
                   ' AND CVE_MUNICIPIO = ' + QuotedStr(Objeto.CVE_MUNICIPIO.AsString),
            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_MPIO_COL', strCampo, False);
  EdDESC_MUNICIPIO.Text := strCampo;
  Objeto.DESC_MUNICIPIO.AsString := strCampo;

  strCampo := '';
  GetSQLStr(' SELECT  DESC_MPIO_COL' + #13 + #10 +
                   ' FROM CR_LOCAL_CNBV CR' + #13 + #10 +
                   ' WHERE CR.CVE_ESTADO = ' + QuotedStr(Objeto.CVE_ESTADO.AsString) +
                   ' AND CVE_MUNICIPIO = ' + QuotedStr(Objeto.CVE_MUNICIPIO.AsString) +
                   ' AND CVE_COLONIA = ' + QuotedStr(Objeto.CVE_LOCALIDAD.AsString),
            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_MPIO_COL', strCampo, False);
  edDESC_LOCALIDAD.Text := strCampo;
  Objeto.DESC_LOCALIDAD.AsString := strCampo;
}
end;

procedure TWCrCtoAdd.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control := nil;
      Objeto.CVE_TIPO_CART.Control := nil;
      Objeto.DESC_TIPO_CART.Control := nil;
      Objeto.CVE_TIPO_OPERA.Control := nil;
      Objeto.DESC_TIPO_OPERA.Control := nil;
      Objeto.CVE_LOCALIDAD.Control := nil;
      Objeto.DESC_LOCALIDAD.Control := nil;
      Objeto.CVE_MUNICIPIO.Control := nil;
      Objeto.DESC_MUNICIPIO.Control := nil;
      Objeto.CVE_ESTADO.Control := nil;
      Objeto.DESC_ESTADO.Control := nil;
      Objeto.CVE_ACT_ECONOM.Control := nil;
      Objeto.RAM_MEZCLA.Control := nil;
      Objeto.RAM_FTP.Control := nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
   //Objeto
end;

procedure TWCrCtoAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCtoAdd.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
  Objeto.ID_CONTRATO.AsString := Objeto.strContrato;
  edID_CONTRATO.Text := Objeto.ID_CONTRATO.AsString;

  /// Se valida si existen datos de la localidad en el acreditado
  localidadCNBV;
  
end;

procedure TWCrCtoAdd.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCtoAdd.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrCtoAdd.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

   with Objeto do
   begin
      if IsNewData then
      begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
           CVE_USU_ALTA.AsString := DameUsuario;
           F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
         end else
            Realizado := False;
      end else
      begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   end;

end;

procedure TWCrCtoAdd.FormActivate(Sender: TObject);
begin
  // Esto lo hacemos por que por alguna razon no me permite la pantalla
  //  asignar el nuero de contrato heredado de la pantalla de Contrato.
  //  Solo es efecto visual
  // Los registros nuevos se manejan desde "intCrCto"
  InterForma1.BtnNuevo.Enabled := false;
  InterForma1.BtnNuevo.Visible := false;

end;

procedure TWCrCtoAdd.btnCVE_TIPO_CARTClick(Sender: TObject);
var
  T:TInterFindit;
begin
  with Objeto do
  begin
    if Active then
    begin
      //BuscaWhereString := ' 1=1 ';
      //FilterString := Objeto.BuscaWhereString ;
      T := CreaBuscador('ITIPOCART.IT', 'S');
      QCartasCredito.Close;
      QCartasCredito.DatabaseName := Objeto.Apli.DataBaseName;
      QCartasCredito.SessionName  := Objeto.Apli.SessionName;
      QCartasCredito.ParamByName ('Cve_Cat_Minimo').AsString := Objeto.strClasCont;
      QCartasCredito.Open;

//      if trim(Objeto.strClasCont) = '730000000000' then
      if not QCartasCredito.Eof and (QCartasCredito.FieldByName ('Total').AsInteger > 0) then 
        T.WhereString := 'CVE_CON_GPO_CAT = ' + QuotedStr('CAT_TIPO_CARTERA')
      else
        T.WhereString := 'CVE_CON_GPO_CAT = ' + QuotedStr('CAT_TIPO_CARTERA') + ' and CVE_VALOR_ADIC = ' + QuotedStr(Objeto.strTipoCartera);

      T.ShowAll := True;
      try
        if T.Execute then
           begin
              objeto.CVE_TIPO_CART.AsString  := T.DameCampo(0);
              //edDESC_TIPO_CART.Text  := T.DameCampo(1);
              Objeto.DESC_TIPO_CART.AsString := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;

    end else
       MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);
  end;

end;

function TWCrCtoAdd.tipoCartera: string;
var
  strResultado : string;
  strSQL : string;
begin
  strSQL := 'Select Case When Cve_Cartera = ''CC'' Then ''ALL'' Else Cve_Cartera End Tipo From CR_Cat_Minimo Where Cve_Cat_Minimo = ''' + Objeto.strClasCont + '''';

  GetSQLStr(strSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'tipo', strResultado, False);

  Result := strResultado;
end;

procedure TWCrCtoAdd.btnCVE_TIPO_OPERAClick(Sender: TObject);
var
  T:TInterFindit;
begin

  with Objeto do
  begin
    if Active then
    begin

      if strTipoCartera = 'GOB' then
        T := CreaBuscador('ITIPOGOB.IT', 'S')
      else if strTipoCartera = 'EFN' then
        T := CreaBuscador('ITIPOEFN.IT', 'S')
      else if strTipoCartera = 'ODS' then
        T := CreaBuscador('ITIPOODS.IT', 'S')
      else if strTipoCartera = 'PYM' then
        T := CreaBuscador('ITIPOPYM.IT', 'S')
      else T := CreaBuscador('ITIPOALL.IT', 'S');

      T.ShowAll := True;
      T.WhereString := '';
      try
        if T.Execute then
           begin
              objeto.CVE_TIPO_OPERA.AsString  := T.DameCampo(0);
              Objeto.DESC_TIPO_OPERA.AsString := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;

    end // if Active then
    else MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);
  end; // with Objeto do

end;

procedure TWCrCtoAdd.btnCVE_ESTADOClick(Sender: TObject);
var
  T:TInterFindit;
begin

  with Objeto do
  begin
    if Active then
    begin

      //BuscaWhereString := ' 1=1 ';
      //FilterString := Objeto.BuscaWhereString ;
      T := CreaBuscador('ITESTADOS.IT', 'S');
      T.WhereString := '';
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              objeto.CVE_ESTADO.AsString  := T.DameCampo(0);
              Objeto.DESC_ESTADO.AsString := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;

    end else
       MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);
  end;


end;

procedure TWCrCtoAdd.btnCVE_MUNICIPIOClick(Sender: TObject);
var
  T:TInterFindit;
begin

  with Objeto do
  begin
    if Active then
    begin

      //BuscaWhereString := ' 1=1 ';
      //FilterString := Objeto.BuscaWhereString ;
      T := CreaBuscador('ITMPIOS.IT', 'S');
      T.WhereString := ' CVE_ESTADO = ' + QuotedStr(OBJETO.CVE_ESTADO.AsString);
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              objeto.CVE_MUNICIPIO.AsString  := T.DameCampo(0);
              Objeto.DESC_MUNICIPIO.AsString := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;

    end else
       MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);
  end;

end;

procedure TWCrCtoAdd.btnCVE_LOCALIDADClick(Sender: TObject);
var
  T:TInterFindit;
begin

  with Objeto do
  begin
    if Active then
    begin

      //BuscaWhereString := ' 1=1 ';
      //FilterString := Objeto.BuscaWhereString ;
      T := CreaBuscador('ITLOCAL.IT', 'S');
      T.WhereString := ' 2 = 2';
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              objeto.CVE_LOCALIDAD.AsString  := T.DameCampo(0);
              Objeto.DESC_LOCALIDAD.AsString := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;

    end else
       MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);
  end;

end;

procedure TWCrCtoAdd.localidadCNBV;
var
  strCampo : string;
begin

    GetSQLStr(' SELECT CVE_ESTADO ' + #13 + #10 +
                     ' FROM CR_LOCAL_CNBV' + #13 + #10 +
                     ' WHERE CVE_LOCAL_CNBV = ' + Objeto.strLocalidad,
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'CVE_ESTADO', strCampo, False);
    //edDESC_TIPO_CART.text := strCampo;
    Objeto.CVE_ESTADO.AsString := strCampo;
    edCVE_ESTADO.Text := Objeto.CVE_ESTADO.AsString;

    GetSQLStr(' SELECT CVE_MUNICIPIO ' + #13 + #10 +
                     ' FROM CR_LOCAL_CNBV' + #13 + #10 +
                     ' WHERE CVE_LOCAL_CNBV = ' + Objeto.strLocalidad,
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'CVE_MUNICIPIO', strCampo, False);
    //edDESC_TIPO_CART.text := strCampo;
    Objeto.CVE_MUNICIPIO.AsString := strCampo;
    edCVE_MUNICIPIO.Text := Objeto.CVE_MUNICIPIO.AsString;

    GetSQLStr(' SELECT CVE_LOCAL_CNBV ' + #13 + #10 +
                     ' FROM CR_LOCAL_CNBV' + #13 + #10 +
                     ' WHERE CVE_LOCAL_CNBV = ' + Objeto.strLocalidad,
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'CVE_LOCAL_CNBV', strCampo, False);
    //edDESC_TIPO_CART.text := strCampo;
    Objeto.CVE_LOCALIDAD.AsString := strCampo;
    edCVE_LOCALIDAD.Text := Objeto.CVE_LOCALIDAD.AsString;

    LocalidadDesc;

end;

procedure TWCrCtoAdd.LocalidadDesc;
var
  strCampo : String;
begin

    strCampo := '';
    GetSQLStr(' SELECT  DESC_ESTADO' + #13 + #10 +
                     ' FROM CR_LOCAL_CNBV CR' + #13 + #10 +
                     ' WHERE CR.CVE_ESTADO = ' + Objeto.CVE_ESTADO.AsString,
              Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_ESTADO', strCampo, False);
    edDESC_ESTADO.Text := strCampo;
    Objeto.DESC_ESTADO.AsString := strCampo;

    strCampo := '';
    GetSQLStr(' SELECT  DESC_MPIO_COL' + #13 + #10 +
                     ' FROM CR_LOCAL_CNBV CR' + #13 + #10 +
                     ' WHERE CR.CVE_ESTADO = ' + QuotedStr(Objeto.CVE_ESTADO.AsString) +
                     ' AND CVE_MUNICIPIO = ' + QuotedStr(Objeto.CVE_MUNICIPIO.AsString),
              Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_MPIO_COL', strCampo, False);
    EdDESC_MUNICIPIO.Text := strCampo;
    Objeto.DESC_MUNICIPIO.AsString := strCampo;

    strCampo := '';
    GetSQLStr(' SELECT  DESC_LOCAL_CNBV' + #13 + #10 +
                     ' FROM CR_LOCAL_CNBV CR' + #13 + #10 +
                     ' WHERE CR.CVE_ESTADO = ' + QuotedStr(Objeto.CVE_ESTADO.AsString) +
                     ' AND CVE_MUNICIPIO = ' + QuotedStr(Objeto.CVE_MUNICIPIO.AsString) +
                     ' AND CVE_LOCAL_CNBV = ' + QuotedStr(Objeto.CVE_LOCALIDAD.AsString),
              Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_LOCAL_CNBV', strCampo, False);
    edDESC_LOCALIDAD.Text := strCampo;
    Objeto.DESC_LOCALIDAD.AsString := strCampo;

end;

end.
