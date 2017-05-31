// Sistema         : Clase de Domicilio
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Domicilio
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Modificado por  : Luis Hernández (Agregar la poblacion al Domicilio) Dic 09
// Comentarios     :


unit IntDom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, IntPob, InterFun, ComCtrls, Menus;


const

cAbreviaturas: array [0..102, 0..1] of String =
  (
    ('Ampliación',        'AMPL'),
    ('Andador',           'AND'),
    ('Antiguo',           'ANT'),
    ('Artículo',          'ART'),
    ('Avenida',           'AV'),
    ('Barranca',          'BCA'),
    ('Bosque',            'BQUE'),
    ('Bosques',           'BQUES'),
    ('Boulevard',         'BLVRD'),
    ('Calle',             'CALLE'),
    ('Callejón',          'CJON'),
    ('Calzada',           'CALZ'),
    ('Camino',            'CAM'),
    ('Capitán',           'CAP'),
    ('Carretera',         'CARR'),
    ('Casa',              'CS'),
    ('Cerrada',           'CDA'),
    ('Circuito',          'CTO'),
    ('Ciudad',            'CD'),
    ('Colonia',           'COL'),
    ('Condominio',        'COND'),
    ('Conjunto Habitacional', 'CONJ HAB'),
    ('Constitución',      'CONST'),
    ('Coronel',           'CRNEL'),
    ('Departamento',      'DEPTO'),
    ('Desviación',        'DESV'),
    ('Diagonal',          'DIAG'),
    ('Doctor',            'DR'),
    ('Domínguez',         'DGUEZ'),
    ('Edificio',          'ED'),
    ('Ejido, Ejidal',     'EJ'),
    ('Entrada',           'ENT'),
    ('Felipe',            'FPE'),
    ('Fernández',         'FDEZ'),
    ('Fernando',          'FDO'),
    ('Fraccionamiento',   'FRACC'),
    ('Francisco',         'FCO'),
    ('Fuente',            'FTE'),
    ('Fuentes',           'FTES'),
    ('General',           'GRAL'),
    ('González',          'GLEZ'),
    ('Guadalupe',         'GPE'),
    ('Hacienda',          'HDA'),
    ('Hernández',         'HDEZ'),
    ('Industrial',        'IND'),
    ('Ingeniero',         'ING'),
    ('Jardín',            'JN'),
    ('Jardines',          'JARDS'),
    ('Kilómetro',         'KM'),
    ('Lago',              'L'),
    ('Laguna',            'LA'),
    ('Licenciado',        'LIC'),
    ('Lote',              'LT'),
    ('Manzana',           'MZ'),
    ('Martínez',          'MTNEZ'),
    ('Mezzanine',         'MEZZ'),
    ('Monte',             'MTE'),
    ('Montes',            'MTES'),
    ('Municipio',         'MPIO'),
    ('Nacional',          'NAL'),
    ('Norte',             'NTE'),
    ('Nueva',             'NVA'),
    ('Nuevo',             'NVO'),
    ('Oriente',           'OTE'),
    ('Parque',            'PQUE'),
    ('Paseo',             'PAS'),
    ('Pent House',        'PH'),
    ('Piso',              'P'),
    ('Plano',             'PL'),
    ('Planta Baja',       'PB'),
    ('Playa',             'PYA'),
    ('Plaza',             'PLZ'),
    ('Poniente',          'PTE'),
    ('Presa',             'PSA'),
    ('Privada',           'PRIV'),
    ('Profesor',          'PROFR'),
    ('Profesora',         'PROFRA'),
    ('Prolongación',      'PROL'),
    ('Puerto',            'PTO'),
    ('Rancho',            'RCHO'),
    ('Reforma',           'REF'),
    ('Republica',         'REP'),
    ('Residencial',       'RES'),
    ('Retorno',           'RET'),
    ('Revolución ',       'REV'),
    ('Rincón',            'RCN'),
    ('Rinconada',         'RNDA'),
    ('Río',               'R'),
    ('Santa',             'STA'),
    ('Santo',             'STO'),
    ('Sargento',          'SGTO'),
    ('Sector',            'SEC'),
    ('Sección',           'SEC'),
    ('Sierra',            'SA'),
    ('SinNumero',         'S/N'),
    ('Sur',               'SUR'),
    ('Teniente',          'TTE'),
    ('Unidad Habitacional', 'U HAB'),
    ('Unidad',            'UNID'),
    ('Valle',             'V'),
    ('Volcán',            'VN'),
    ('Vivienda',          'VIV'),
    ('Zona Urbana Ejidal','Z.U.E')
  );

type
  TDomicilio=Class;

  TWDomicilio = class(TForm)
    InterForma1     : TInterForma;
    lbIdDomicilio: TLabel;
    lblCalleNumero: TLabel;
    lbColonia: TLabel;
    lbCodigoPostal: TLabel;
    lbOficinaPostal: TLabel;
    lbId_Usr_Cod_Post: TLabel;
    sbBuscaCP: TSpeedButton;
    edColonia: TEdit;
    edCodigoPostal: TEdit;
    edOficinaPostal: TEdit;
    edIdDomicilio: TMaskEdit;
    GroupBox1: TGroupBox;
    lbCiudadDelMun: TLabel;
    lbPais: TLabel;
    lbEstado: TLabel;
    sbBuscaAprox: TSpeedButton;
    edCiudad: TEdit;
    edEstado: TEdit;
    edPais: TEdit;
    edId_Usr_Cod_Post: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label9: TLabel;
    edFHModificacion: TEdit;
    edCVEUsuarModif: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edCalle: TEdit;
    edNumExterior: TEdit;
    edNumInterior: TEdit;
    listAbreviatura: TListView;
    lblPoblacion: TLabel;
    edPoblacion: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sbBuscaAproxClick(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure sbBuscaCPClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCapturaKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure edCapturaExit(Sender: TObject);
    procedure edCapturaEnter(Sender: TObject);
    procedure listAbreviaturaEnter(Sender: TObject);
    procedure listAbreviaturaKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
  private
    Procedure InicializaAbreviaturas;
    Function  GetLastWord(edit: TEdit): string;
    Procedure ReemplazaAbreviatura(edit: TEdit; newText: String);
    Procedure InsertaTexto(edit: TEdit; newText: String);
  public
    Dom: TDomicilio;
    edCaptura: TEdit;
    SeleccionAbreviatura: Boolean;
  end;


  TDomicilio = class(TInterFrame)
  protected
    procedure PoblacionMenuEjecuta(Sender : Tobject; Tag : Integer);  // Luis Hernandez
    procedure CiudadMenuEjecuta(Sender : Tobject; Tag : Integer);
    procedure EstadoMenuEjecuta(Sender : Tobject; Tag : Integer);
    procedure PaisMenuEjecuta(Sender : Tobject; Tag : Integer);
    Procedure HabilitaCapturaNumero;
  public
    IdDomicilio     : TInterCampo;
    Calle           : TInterCampo;
    Num_Exterior    : TInterCampo;
    Num_Interior    : TInterCampo;
    CalleNumero     : TInterCampo;
    Colonia         : TInterCampo;
    Ciudad          : TInterCampo;
    Estado          : TInterCampo;
    Pais            : TInterCampo;
    CveCiudad       : TInterCampo;
    CveEstado       : TInterCampo;
    CvePais         : TInterCampo;
    CodigoPostal    : TInterCampo;
    IdUsrCodPost    : TInterCampo;
    OficinaPostal   : TInterCampo;
    CodigoRespuesta : TInterCampo;
    CveUsuarModif   : TInterCampo;
    FHModificacion  : TInterCampo;
    B_Captura_Aseg  : TInterCampo;
    CvePoblac       : TInterCampo;  // Luis Hernandez
    Poblacion       : TInterCampo;  // Luis Hernandez

    PobCd   : TPoblacion;
    PobEdo  : TPoblacion;
    PobPais : TPoblacion;
    PobPobla: TPoblacion;  // Luis Hernandez

    Function RefrescaPoblacion : Boolean;
    function InternalBusca : Boolean; override;
    function InternalPost : Boolean; override;
    function InternalDelete : Boolean;

    Constructor Create( AOwner : TComponent ); override;
    Destructor Destroy; override;
    Procedure  DataBaseChange; override;
    function   ShowWindow(FormaTipo:TFormaTipo):Integer; override;
    Function   ValidaLocaliza:Boolean; override;
    Function  InternalEdit:Boolean; override;
  published
  end;

implementation

USes UnSql2;

{$R *.DFM}

constructor TDomicilio.Create( AOwner : TComponent );
begin
  Inherited;
  IdDomicilio := CreaCampo('ID_DOMICILIO',ftInteger,tsConsulta+tsModifica+tsElimina,tsConsulta+tsModifica+tsNuevo,False);
  CvePais  := CreaCampo('CVE_PAIS',ftString,tsModifica+tsNuevo,tsConsulta+tsProc1,False);
  Pais := CreaCampo('PAIS',ftString,tsNinguno,tsConsulta + tsProc1,False);
  CveEstado := CreaCampo('CVE_ESTADO',ftString,tsModifica+tsNuevo,tsConsulta + tsProc1,False);
  Estado := CreaCampo('ESTADO',ftString,tsNinguno,tsConsulta + tsProc1,False);
  CveCiudad := CreaCampo('CVE_CIUDAD',ftString,tsModifica+tsNuevo + tsProc1,tsConsulta,False);
  Ciudad := CreaCampo('CIUDAD',ftString,tsNinguno,tsConsulta + tsProc1,False);
  CodigoPostal := CreaCampo('CODIGO_POSTAL',ftString,tsModifica+tsNuevo,tsConsulta,False);
    CodigoPostal.Size := 6;
  Colonia := CreaCampo('COLONIA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  OficinaPostal := CreaCampo('OFICINA_POSTAL',ftString,tsModifica+tsNuevo,tsConsulta,False);
    OficinaPostal.Size := 6;
  CveUsuarModif := CreaCampo('CVE_USUAR_MODIF',ftString,tsModifica+tsNuevo,tsConsulta,False);
    CveUsuarModif.Size := 8;
  FHModificacion := CreaCampo('FH_MODIFICACION',ftDateTime,tsModifica+tsNuevo,tsConsulta,False);
  IdUsrCodPost := CreaCampo('ID_USR_COD_POST',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
    IdUsrCodPost.Size := 3;
  B_Captura_Aseg := CreaCampo('B_Captura_Aseg',ftString,tsModifica+tsNuevo,tsConsulta,False);
    B_Captura_Aseg.Size := 1;
  Calle:= CreaCampo('CALLE', ftString, tsModifica + tsNuevo, tsConsulta, False);
  Num_Exterior:= CreaCampo('NUM_EXTERIOR', ftString, tsModifica + tsNuevo, tsConsulta, False);
  Num_Interior:= CreaCampo('NUM_INTERIOR', ftString, tsModifica + tsNuevo, tsConsulta, False);
  CalleNumero := CreaCampo('CALLE_NUMERO',ftString, tsNinguno, tsConsulta, False);
  CodigoRespuesta := CreaCampo('CODRESP',ftInteger,tsNinguno, tsConsulta+ tsNuevo + tsModifica + tsElimina + tsProc1, False);
  CvePoblac := CreaCampo('CVE_POBLA',ftString,tsModifica+tsNuevo + tsProc1,tsConsulta,False);  // Luis Hernandez
  Poblacion := CreaCampo('POBLACION',ftString,tsNinguno,tsConsulta + tsProc1,False);   // Luis Hernandez

  PobCd := TPoblacion.Create(Self);
  PobCd.OnMenuEjecuta := CiudadMenuEjecuta;

  PobEdo := TPoblacion.Create(Self);
  PobEdo.OnMenuEjecuta := EstadoMenuEjecuta;

  PobPais := TPoblacion.Create(Self);
  PobPais.OnMenuEjecuta := PaisMenuEjecuta;

  PobPobla := TPoblacion.Create(Self); // Luis Hernandez
  PobPobla.OnMenuEjecuta := PoblacionMenuEjecuta;  // Luis Hernandez

  FActive := False;
  TableName:='DOMICILIO';
  //StpName:='STPCODOMICILIO_TMP';
  StpName:='PKGCORPORATIVO.CONDOMICILIO';
  FKeyFields.Add('ID_DOMICILIO');
  HelpFile := 'IntDom.hlp';
  IsCorp:=True;
  UseLink:= True;
end;



Destructor TDomicilio.Destroy;
begin
  if PobCd <> nil then PobCd.Free; PobCd:= nil;
  if PobEdo <> nil then PobEdo.Free; PobEdo:= nil;
  if PobPais <> nil then PobPais.Free; PobPais:= nil;
  if PobPobla <> nil then PobPobla.Free; PobPobla:= nil;   // Luis Hernandez
  inherited;
end;


procedure TDomicilio.DataBaseChange;
begin
  PobCD.GetParams(self);
  PobEdo.GetParams(self);
  PobPais.GetParams(self);
  PobPobla.GetParams(Self);  // Luis Hernandez
end;



function TDomicilio.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDomicilio;
begin
  W:= TWDomicilio.Create(Self);
  try
    W.Dom:= Self;
    W.InterForma1.InterFrame:=Self;
    W.InterForma1.FormaEstilo:= feVertical;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.ShowBtnEliminar:= False;
    W.InterForma1.ShowBtnAyuda:= False;
    W.InterForma1.ShowBtnEliminar:= False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;



function TDomicilio.InternalBusca : Boolean;
Var T : TInterFindit;
begin
  InternalBusca := False;
  T:= CreaBuscador('IntDom.it','I');
  Try
    if Active then
      T.Param(0,IdDomicilio.AsString);

    if T.Execute then
      InternalBusca:= FindKey([T.DameCampo(0)]);
  finally T.Free;
  end;
end;


Function  TDomicilio.InternalEdit:Boolean;
var
  S:String;
begin
  if GetSQL(' SELECT CVE_OPER_ACC FROM SECU_OPER_ACC ' +
            ' WHERE (CVE_FUNCION=''CLASE_'+UpperCase(ClassName)+''') ' +
            '   AND (CVE_USUARIO='''+DameUsuario+''') ' +
            '   AND (CVE_OPER_ACC=''MM'')',
            SeguDataBaseName, SeguSessionName, True) then
  Begin
    if Trunc(FHModificacion.AsDateTime) <> Trunc(Apli.SysDateTime) then
      Raise EInterFrame.Create('Este Contrato fue Creado otro Dia. No tiene Derecho para Modificarlo, Solo el Mismo día de Creación. Verifique con su Administrador');
  end;
  Result:= Inherited InternalEdit;
end;



function TDomicilio.InternalPost : Boolean;
var P : TStoredProc;
    W : TWDomicilio;
begin
  InternalPost := False;
  CveUsuarModif.AsString    := DameUsuario;
  FHModificacion.AsDateTime := Apli.SysDateTime;


  if modo = moAppend then
    try
      //P := StpPrepara('STPALDOMICILIO_TMP',tsNuevo);
      P:= StpPrepara('PKGCORPORATIVO.ALTADOMICILIO', tsNuevo);
      StpEjecuta(P,tsNuevo);
      if CodigoRespuesta.AsInteger = 0 then
      begin
        InternalPost := True;
        Active := True;
      end
      else
      begin
        InternalPost := False;
        raise EInvalidOperation.Create('Ocurrio un Error'+CodigoRespuesta.AsString); Exit;
      end;
      {end-if}
    Finally
    end;


  if modo = moEdit then
    try
      //P := StpPrepara('STPMODOMICILIO_TMP',tsModifica);
      P:= StpPrepara('PKGCORPORATIVO.MODDOMICILIO', tsModifica);
      StpEjecuta(P,tsModifica);
      if CodigoRespuesta.AsInteger = 0 then
        InternalPost :=True
      else
      begin
        ShowMessage('Ocurrio un Error'+CodigoRespuesta.AsString);
        Exit;
      end;
    finally
    end;

end;


function TDomicilio.InternalDelete : Boolean;
//var P : TStoredProc;
begin
  InternalDelete:= False;
{
   InternalDelete := False;
   Try
      P := StpPrepara('STPBADOMICILIO',tsElimina);
      StpEjecuta(P,tsNuevo);
         if CodigoRespuesta.AsInteger = 0 then
            begin
               InternalDelete := True;
               Active := False;
           end
         else
            begin
               InternalDelete := False;
               raise EInvalidOperation.Create('Imposible Eliminar el Registro');
           end;
   finally
   end;
}
end;


(*
Function TDomicilio.RefrescaPoblacion : Boolean;
var p : TStoredProc;
begin
   RefrescaPoblacion:=False;
   try
      P := StpPrepara('STPCOPOBLACION', tsProc1);
      StpEjecuta(P, tsProc1);
      if CodigoRespuesta.AsInteger = 0 then begin
         RefrescaPoblacion := True;
      end
      else begin
         Ciudad.AsString := '';
         Estado.AsString := '';
         Pais.AsString := '';
         CveCiudad.AsString := '';
         CveEstado.AsString := '';
         CvePais.AsString := '';
         CvePoblac.AsString:= '';   // Luis Hernandez
         Poblacion.AsString := '';  // Luis Hernandez
      end;
      {end-if}
  finally
    HabilitaCapturaNumero;
  end;
end;
*)


Function TDomicilio.RefrescaPoblacion : Boolean;
Var qUbicacion: TQuery;
begin
  RefrescaPoblacion:=False;
  if (modo = moAppend) or (modo = moEdit) then
  Begin
    Try
      qUbicacion:=
        GetSQLQuery('Select * From v_Corp_Ubicacion Where Cve_Poblacion = ' + CvePoblac.AsSQL,
                    apli.DataBaseName, apli.SessionName, True);
      if qUbicacion <> nil Then
      Begin
        Try
          Ciudad.AsString := qUbicacion.FieldByName('CIUDAD').asString;
          Estado.AsString := qUbicacion.FieldByName('ESTADO').asString;
          Pais.AsString := qUbicacion.FieldByName('PAIS').asString;
          CveCiudad.AsString := qUbicacion.FieldByName('CVE_CIUDAD').asString;
          CveEstado.AsString := qUbicacion.FieldByName('CVE_ESTADO').asString;
          CvePais.AsString := qUbicacion.FieldByName('CVE_PAIS').asString;
          CvePoblac.AsString:= qUbicacion.FieldByName('CVE_POBLACION').asString;
          Poblacion.AsString := qUbicacion.FieldByName('POBLACION').asString;
          RefrescaPoblacion := True;
        Finally
          qUbicacion.Free; qUbicacion:= nil;
        end;
      end
      else
      begin
         Ciudad.AsString := '';
         Estado.AsString := '';
         Pais.AsString := '';
         CveCiudad.AsString := '';
         CveEstado.AsString := '';
         CvePais.AsString := '';
         CvePoblac.AsString:= '';
         Poblacion.AsString := '';
      end;
    Except
      on e: Exception do
        Begin
        if qUbicacion <> nil Then qUbicacion.Free; qUbicacion:= nil;
        messagedlg('Error al identificar la ubicación. ' + e.message, mtError, [mbOK], 0);
        end;
    end;

    //HabilitaCapturaNumero; //CZR 02-ene-2014 (req.2013-12/005)
  end;
end;



Function TDomicilio.ValidaLocaliza:Boolean;
begin ValidaLocaliza:=(CodigoRespuesta.AsInteger = 0);
end;


procedure TDomicilio.CiudadMenuEjecuta(Sender: Tobject; Tag: Integer);
begin
  Case Tag of
  0:  begin
        If CveCiudad.AsString <> '' then
          PobCd.FindKey([CveCiudad.AsString]);
        PobCd.Catalogo; // Consultar;
        RefrescaPoblacion;
      end;
  else PobCd.MenuEjecuta(Tag);
  end;
end;


procedure TDomicilio.EstadoMenuEjecuta(Sender : Tobject; Tag : Integer);
begin
  Case Tag of
  0:  begin
        If CveEstado.AsString <> '' then
          PobEdo.FindKey([CveEstado.AsString]);

        PobEdo.Catalogo; // Consultar;
        RefrescaPoblacion;
      end;
  else PobEdo.MenuEjecuta(Tag);
  end;
end;


procedure TDomicilio.PaisMenuEjecuta(Sender : Tobject; Tag : Integer);
begin
  Case Tag of
  0 : begin
        If CvePais.AsString <> '' then
          PobPais.FindKey([CvePais.AsString]);
        PobPais.Catalogo; // Consultar;
        RefrescaPoblacion;
      end;
   else PobPais.MenuEjecuta(Tag);
   end;
end;

procedure TDomicilio.PoblacionMenuEjecuta(Sender : Tobject; Tag : Integer);   // Luis Hernandez
begin
  Case Tag of
  0 : begin
        If CvePoblac.AsString <> '' then
          PobPobla.FindKey([CvePoblac.AsString]);
          PobPobla.Catalogo; // Consultar;
          RefrescaPoblacion;
      end;
   else PobPobla.MenuEjecuta(Tag);
   end;
end;                                                                          // Luis Hernandez


Procedure TDomicilio.HabilitaCapturaNumero;
Var blnHabilita: Boolean;
Begin
  if (modo = moAppend) or (modo = moEdit) then
  Begin
    CvePais.GetFromControl;
    blnHabilita:= (CvePais.AsString = 'PAMEXI');

    If Num_Exterior.Control <> nil Then
    Begin
      Num_Exterior.Control.Enabled:= blnHabilita;
      if not blnHabilita then
        Num_Exterior.FieldsClear;

      if Num_Exterior.Control is TEdit then
      Begin
        TEdit(Num_Exterior.Control).ReadOnly:= not blnHabilita;
        If blnHabilita then
          TEdit(Num_Exterior.Control).Color:= clWindow
        else
          TEdit(Num_Exterior.Control).Color:= clBtnFace;
      end;
    end;

    If Num_Interior.Control <> nil Then
    Begin
      Num_Interior.Control.Enabled:= blnHabilita;
      if not blnHabilita then
        Num_Interior.FieldsClear;

      if Num_Interior.Control is TEdit then
      Begin
        TEdit(Num_Interior.Control).ReadOnly:= not blnHabilita;
        If blnHabilita then
          TEdit(Num_Interior.Control).Color:= clWindow
        else
          TEdit(Num_Interior.Control).Color:= clBtnFace;
      end;
    end;
  end;
end;







(***********************************************FORMA DE DOMICILIO***************)
(*                                                                              *)
(*  FORMA DE DOMICILIO                                                          *)
(***********************************************FORMA DE DOMICILIO***************)
procedure TWDomicilio.FormShow(Sender : TObject);
begin
  With Dom do
  Begin
    IdDomicilio.Control := edIdDomicilio;
    Calle.Control:= edCalle;
    Num_Exterior.Control:= edNumExterior;
    Num_Interior.Control:= edNumInterior;
    CalleNumero.Control := lblCalleNumero;
    Colonia.Control := edColonia;
    CodigoPostal.Control := edCodigoPostal;
    //IdUsrCodPost.Control := edId_Usr_Cod_Post;
    OficinaPostal.Control := edOficinaPostal;
    Ciudad.Control := edCiudad;
    Estado.Control := edEstado;
    Pais.Control := edPais;
    FHModificacion.Control := edFhModificacion;
    CveUsuarModif.Control := edCveUsuarModif;
    //B_Captura_Aseg.Control := edb_Captura_Aseg;

    Poblacion.Control := edPoblacion;  // Luis Hernandez

    edCiudad.PopupMenu:= PobCd.PopMenu;
    edEstado.PopupMenu:= PobEdo.PopMenu;
    edPais.PopupMenu:= PobPais.PopMenu;
    edPoblacion.PopupMenu:= PobPobla.PopMenu;   // Luis Hernandez
  end;

  InicializaAbreviaturas;
end;


procedure TWDomicilio.FormClose(Sender : TObject; var Action : TCloseAction);
begin Action := caFree;
end;


procedure TWDomicilio.FormDestroy(Sender : TObject);
begin
  with Dom do
  Begin
    IdDomicilio.Control := nil;
    Calle.Control:= nil;
    Num_Exterior.Control:= nil;
    Num_Interior.Control:= nil;
    CalleNumero.Control := nil;
    Colonia.Control := nil;
    CodigoPostal.Control := nil;
    //IdUsrCodPost.Control := nil;
    OficinaPostal.Control := nil;
    Ciudad.Control := nil;
    Estado.Control := nil;
    Pais.Control := nil;
    //B_Captura_Aseg.Control := nil;
    FHModificacion.Control := nil;
    CveUsuarModif.Control := nil;
    Poblacion.Control := nil;   // Luis Hernandez
  end;
end;


procedure TWDomicilio.sbBuscaAproxClick(Sender: TObject);
Var Find: TInterFindIt;
begin
  If Dom.ValidaAccesoEsp('DOM_UBICACIÓN',True,True) Then
  Begin
    edCiudad.SetFocus;
    Find:= Dom.CreaBuscador('Ciudad.it','S,S,S,S,S,S,S,S');
    Try
      Find.Param(0,Dom.CveCiudad.AsString);
      Find.Param(2,Dom.CveEstado.AsString);
      Find.Param(4,Dom.CvePais.AsString);
      Find.Param(6,Dom.CvePoblac.AsString);
      if Find.Execute then
      begin
        Dom.CveCiudad.AsString := Find.DameCampo(0);
        Dom.CveEstado.AsString := Find.DameCampo(2);
        Dom.CvePais.AsString   := Find.DameCampo(4);
        Dom.Ciudad.AsString    := Find.DameCampo(1);
        Dom.Estado.AsString    := Find.DameCampo(3);
        Dom.Pais.AsString      := Find.DameCampo(5);
        Dom.CvePoblac.AsString := Find.DameCampo(6);
        Dom.Poblacion.AsString := Find.DameCampo(7);
        //Dom.HabilitaCapturaNumero; //CZR 02-ene-2014 (req.2013-12/005)
      end;
    Finally Find.Free;
    end;
  End;
end;


procedure TWDomicilio.InterForma1DespuesNuevo(Sender : TObject);
begin edCalle.SetFocus;
end;

procedure TWDomicilio.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
{
  Dom.CveUsuarModif.AsString    :=Dom.DameUsuario;
  Dom.FHModificacion.AsDateTime :=Dom.Apli.SysDateTime;
}
end;

procedure TWDomicilio.sbBuscaCPClick(Sender: TObject);
Var Find: TInterFindIt;
begin
  If Dom.ValidaAccesoEsp('DOM_CODPOST',True,True) Then
  Begin
    edCodigoPostal.SetFocus;
    Find:= Dom.CreaBuscador('CODPOSUBIC.IT','S,S,S,S,S,S,S,S');
    Try
      if Find.Execute then
      begin
        Dom.CodigoPostal.AsString  := Find.DameCampo(0);
        Dom.Colonia.AsString       := Find.DameCampo(1);
        Dom.CvePoblac.AsString     := Find.DameCampo(2);
        Dom.Poblacion.AsString     := Find.DameCampo(3);
        Dom.CveCiudad.AsString     := Find.DameCampo(4);
        Dom.Ciudad.AsString        := Find.DameCampo(5);
        Dom.CveEstado.AsString     := Find.DameCampo(6);
        Dom.Estado.AsString        := Find.DameCampo(7);
        Dom.CvePais.AsString       := Find.DameCampo(8);
        Dom.Pais.AsString          := Find.DameCampo(9);
        Dom.OficinaPostal.AsString := Find.DameCampo(0);
        //Dom.HabilitaCapturaNumero; //CZR 02-ene-2014 (req.2013-12/005)
      end;
    Finally Find.Free;
    end;
  End;
end;


procedure TWDomicilio.InterForma1DespuesModificar(Sender: TObject);
begin edCalle.SetFocus;
end;


{ El código se integró al trigger trgAUDomicilio (AfterUpdate)
procedure TWDomicilio.InterForma1DespuesAceptar(Sender: TObject);
var
  Q          : Tquery;
  SQL        : string;
  vFolio     : Integer;
begin
   If edModifica.Text = 'V' Then
      begin
       SQL:=' SELECT NUM_FOLIO as FOLIO '
           +' FROM FOLIO_CORP '
           +' WHERE ID_EMPRESA   = 2 '
           +'  AND  CVE_FOLIO    = ''BITDOM'' ';
       Q := GetSqlQuery(SQL,Dom.DataBaseName,Dom.SessionName,True);
        if Q<>nil then
           begin
            try
              vFolio := Q.FieldByName('FOLIO').AsInteger + 1;
            Finally
              Q.Free;
            end;
        end;
        if Q=nil then
          Q.Free;

         RunSQL('INSERT INTO DOMICILIO_BIT ( '+
                'ID_DOMICILIO, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF )' +
                'VALUES ( ' + edIdDomicilio.text                            + ','
                            + InttoStr(vFolio + 1)                          + ','
                            + chr(39) + edCVEUsuarModif.Text + chr(39)      + ','
                            +' to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'') ' + ','
                            + chr(39) + ' Calle : '   + lblCalleNumero.Caption  +
                                        ' Colonia : ' + edColonia.Text      +
                                        ' C.P. : '    + edCodigoPostal.Text +
                                        ' Ciudad : '  + edCiudad.Text       +
                              chr(39) + ')', Dom.DataBaseName, Dom.SessionName, True);

       RunSQL('UPDATE FOLIO_CORP '+
              'SET NUM_FOLIO    = '+ InttoStr(vFolio) +
              'WHERE ID_EMPRESA = 2 '  +
              'AND   CVE_FOLIO = ''BITDOM'' ', Dom.DataBaseName, Dom.SessionName, True);
   end;
end;
}


Procedure TWDomicilio.InicializaAbreviaturas;
Var intIndex: Integer;
    listItem: TListItem;
Begin
  listAbreviatura.Items.Clear;
  For intIndex:= 0 to High(cAbreviaturas) do
    With listAbreviatura.Items.Add do
    Begin
      //listItem:= listAbreviatura.Items.Add;
      Caption:= cAbreviaturas[intIndex, 0];
      SubItems.Add(cAbreviaturas[intIndex, 1]);
    end;
end;


Procedure TWDomicilio.ReemplazaAbreviatura(edit: TEdit; newText: String);
Var texto: string;
    posicion, index, start: Integer;
Begin
  texto:= edit.Text;
  if texto <> ''  then
  Begin
      start:= 0;
      posicion:= 0;
      index:= edit.SelStart;
      Repeat
        If texto[index] = ' ' then
          posicion:= index;

        dec(index);
      Until (posicion > 0) or (index <= 0);

      { Determina cual es la posición inicial }
      start:= posicion + 1;

      { Obtiene el resto del texto }
      texto:= copy(texto, start, length(texto));

      { Determina la posicion final... Siguiente espacion o el fin del texto }
      posicion:= pos(' ', texto);
      if posicion = 0 then
        posicion:= length(texto);

      texto:= edit.text;
      delete(texto, start, posicion);
      insert(newText + ' ', texto, start);
      //lblCalleNumero.Caption:= texto;
      edit.text:= copy(texto, 0, edit.MaxLength);
      edit.SelStart:= start + length(newText);
  end
  else
  Begin
    //lblCalleNumero.Caption:= newText;
    edit.text:= newText + ' ';
    edit.SelStart:= length(newText);
  end;
end;



Procedure TWDomicilio.InsertaTexto(edit: TEdit; newText: String);
Var texto: string;
    start: Integer;
Begin
  texto:= edit.Text;
  if texto <> ''  then
  Begin
    start:= edit.SelStart;
    insert(newText, texto, start);
    edit.SelStart:= start + length(newText);
  end
  else
  Begin
    edit.text:= newText;
    edit.SelStart:= length(newText);
  end;
end;



Function TWDomicilio.GetLastWord(edit: TEdit): string;
Var texto: string;
    posicion, index: Integer;
Begin
  texto:= edit.Text;
  if texto <> ''  then
  Begin
      posicion:= 0;
      index:= edit.SelStart;
      Repeat
        If texto[index] = ' ' then
          posicion:= index;

        dec(index);
      Until (posicion > 0) or (index <= 0);

      { Determina el resto del texto }
      texto:= copy(texto, posicion + 1, length(texto));

      { Obtiene la palabra hasta el siguiente espacion o el fin del texto }
      posicion:= pos(' ', texto);
      if posicion = 0 Then
        GetLastWord:= texto
      else GetLastWord:= copy(texto, 1, posicion - 1);
  end
  else GetLastWord:= '';
end;


procedure TWDomicilio.edCapturaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var texto: String;
    Item: TListItem;


    Function GetListPosition: Integer;
    var posicion: Integer;
    Begin
      posicion:= edcaptura.Left + Canvas.TextWidth(Copy(edCaptura.Text, 0, edCaptura.SelStart));
      if (posicion + listAbreviatura.Width) > (edCaptura.Left + edCaptura.Width) Then
        posicion:= (edCaptura.Left + edCaptura.Width) - listAbreviatura.Width;

      result:= posicion;
    end;


begin
  Case Key of
  VK_RETURN:
    Begin
      If listAbreviatura.Visible Then
      Begin
        listAbreviatura.Visible:= False;
        If listAbreviatura.Selected <> nil Then
          ReemplazaAbreviatura(edCaptura, listAbreviatura.Selected.SubItems[0]);
        edCaptura.SetFocus;
      end
      else InterForma1.Aceptar;

    end;

{
  VK_DOWN:
    Begin
      //Item:= listAbreviatura.FindCaption(0, GetLastWord(edNumExterior), True, True, False);
      SeleccionAbreviatura:= True;
      listAbreviatura.SetFocus;
      listAbreviatura.Selected:= listAbreviatura.GetNextItem(listAbreviatura.Selected, sdBelow, [isNone]);
      listAbreviatura.ItemFocused:= listAbreviatura.Selected;
    end;

  VK_UP:
    Begin
      //Item:= listAbreviatura.FindCaption(0, GetLastWord(edNumExterior), True, True, False);
      SeleccionAbreviatura:= True;
      listAbreviatura.SetFocus;
      listAbreviatura.Selected:= listAbreviatura.GetNextItem(listAbreviatura.Selected, sdAbove, [isNone]);
      listAbreviatura.ItemFocused:= listAbreviatura.Selected;
    end;
}

  Ord('A')..Ord('Z'):
    Begin
      listAbreviatura.top:= edCaptura.top + edCaptura.Height + 1;
      listAbreviatura.left:= GetListPosition;

      listAbreviatura.Visible:= True;
      Item:= listAbreviatura.FindCaption(0, GetLastWord(edCaptura), True, True, False);
      If Item <> nil Then
      begin
        listAbreviatura.Selected:= Item;
        Item.MakeVisible(False);
      end
      else
      Begin
        listAbreviatura.Selected:= nil;
      end;
    end;

  else listAbreviatura.Visible:= False;
  end;
end;



procedure TWDomicilio.edCapturaEnter(Sender: TObject);
begin
  SeleccionAbreviatura:= False;
  listAbreviatura.Visible:= False;

  if (dom.modo = moAppend) or (dom.modo = moEdit) then
  Begin
    edCaptura:= TEdit(Sender);
    InterForma1.F.btAceptar.Default:= False;

    listAbreviatura.Left:= edCaptura.Left;
  end;
end;


procedure TWDomicilio.edCapturaExit(Sender: TObject);
begin
  if (dom.modo = moAppend) or (dom.modo = moEdit) then
  Begin
    InterForma1.F.btAceptar.Default:= True;
    listAbreviatura.Visible:= SeleccionAbreviatura;
  end;
end;


procedure TWDomicilio.listAbreviaturaEnter(Sender: TObject);
begin
  if (dom.modo = moAppend) or (dom.modo = moEdit) then
    InterForma1.F.btAceptar.Default:= False;
end;


procedure TWDomicilio.listAbreviaturaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
  VK_RETURN:
    Begin
      listAbreviatura.Visible:= False;
      If listAbreviatura.Selected <> nil Then
        ReemplazaAbreviatura(edCaptura, listAbreviatura.Selected.SubItems[0]);
      edCaptura.SetFocus;
    end;

  VK_SPACE, Ord('a')..Ord('z'), Ord('A')..Ord('Z'):
    Begin
      listAbreviatura.Visible:= False;
      InsertaTexto(edCaptura, Chr(Key));
      edCaptura.SetFocus;
    end;
  end;
end;
END.
