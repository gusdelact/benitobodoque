{Clase para la Captura y Modificación de Nacionalidades
}

unit IntPersNac;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, IntPob, Buttons, StdCtrls, ComCtrls, IntFrm, DB, IntLinkit,
  IntFind, InterEdit, DBTables, ExtCtrls, RegExpr, Mask;

type
  TPersNac = class;

  TWPersNac = class(TForm)
    ifPersNac         : TInterForma;
    lbNacionalidad    : TLabel;
    edCveNacionalidad : TEdit;
    sbNac             : TSpeedButton;
    edDescNac         : TEdit;
    edIDPersona       : TEdit;
    lbPersona         : TLabel;
    edNomPersona      : TEdit;
    chbDefault        : TCheckBox;
    lbSituacion       : TLabel;
    cbSituacion       : TComboBox;
    lbMotivo          : TLabel;
    edMotivo          : TEdit;
    sbMotivo          : TSpeedButton;
    edDescMotivo      : TEdit;
    lbtxMotivo        : TLabel;
    reTxMotivo        : TRichEdit;
    ilPaisExp         : TInterLinkit;
    ilMotivo          : TInterLinkit;
    edPersJur         : TEdit;
    Bevel1            : TBevel;
    pidfiscal         : TPanel;
    lbidfiscal        : TLabel;
    edFiscal          : TEdit;
    pPaisExp          : TPanel;
    lbPaisExp         : TLabel;
    edPaisExp         : TEdit;
    sbPaisExp         : TSpeedButton;
    edDescPaisExp     : TEdit;
    lbhint            : TLabel;
    prfc              : TPanel;
    lbSiglas          : TLabel;
    lbFecha           : TLabel;
    lbHomoClave       : TLabel;
    edSiglasRFC       : TEdit;
    edFRFC            : TEdit;
    edHomoclaveRFC    : TEdit;
    procedure ifPersNacDespuesNuevo(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbNacClick(Sender: TObject);
    procedure ilPaisExpCapture(Sender: TObject; var Show: Boolean);
    procedure ilPaisExpEjecuta(Sender: TObject);
    procedure sbPaisExpClick(Sender: TObject);
    procedure sbMotivoClick(Sender: TObject);
    procedure ilMotivoCapture(Sender: TObject; var Show: Boolean);
    procedure ilMotivoEjecuta(Sender: TObject);
    procedure ifPersNacDespuesModificar(Sender: TObject);
    procedure ifPersNacAntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure edCveNacionalidadExit(Sender: TObject);
    procedure ifPersNacAntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbSituacionKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto     : TPersNac;
    vgn_nuevo  : Integer;
    vgs_caract : String;

    procedure Busca_Desc_Motivo(pMotivo : String);
    Function ValidaRFC(Nombre,
                       ApPaterno,
                       ApMaterno,
                       RazonSocial : String;
                       FechaRFC    : TDateTime;
                       Siglas,
                       Numeros,
                       Homoclave   : String;
                       ShowError   : Boolean = True): Boolean;
  end;
  TPersNac = class(TInterFrame)
    private
    protected

    public
      { Public declarations }
      ID_PERSONA,
      NOMBRE_PERS,
      CVE_NACIONALIDAD,
      CVE_RESIDENCIA,
      DESC_NACIONALIDAD,
      B_DEFAULT,
      SIT_NACIONALIDAD,
      ID_FISCAL,
      CVE_PAIS_EXPEDICION,
      DESC_PAIS_EXPEDICION,
      CVE_MOTIVO,
      DESC_MOTIVO,
      TX_MOTIVO,
      CVE_PERS_JURIDICA     : TInterCampo;

      pidpersona   : Double;
      pNac,
      pnombrepers,
      ppersjur,
      pbdefault,
      psit,
      pPaisExp,
      pNom_Pers,
      pApell_Pat,
      pApell_Mat,
      pNom_Raz_Soc : String;
      pTipo        : Integer;
      pFechaRFC,
      pFechaNac,
      pFechaConst  : TDateTime;


      Poblacion,
      Pob_Exp      : TPoblacion;

      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
    end;

var
  WPersNac : TWPersNac;

implementation

{$R *.DFM}
constructor TPersNac.Create( AOwner : TComponent );
begin
  Inherited;
    ID_PERSONA               := CreaCampo('ID_PERSONA',              ftFloat,  tsNinguno, tsNinguno, False);
    ID_PERSONA.Caption       := 'Identificador de Persona';
    NOMBRE_PERS              := CreaCampo('NOMBRE_PERS',             ftString, tsNinguno, tsNinguno, False);
    NOMBRE_PERS.Caption      := 'Nombre de Persona';
    CVE_NACIONALIDAD         := CreaCampo('CVE_NACIONALIDAD',        ftString, tsNinguno, tsNinguno, False);
    CVE_NACIONALIDAD.Size    := 6;
    CVE_NACIONALIDAD.Caption := 'Clave de Nacionalidad';
    DESC_NACIONALIDAD        := CreaCampo('DESC_NACIONALIDAD',       ftString, tsNinguno, tsNinguno, False);
    CVE_RESIDENCIA           := CreaCampo('CVE_RESIDENCIA',          ftString, tsNinguno, tsNinguno, False);
    CVE_RESIDENCIA.Size      := 6;
    CVE_RESIDENCIA.Caption   := 'Clave de Nacionalidad';
    B_DEFAULT                := CreaCampo('B_DEFAULT',               ftString, tsNinguno, tsNinguno, False);
    B_DEFAULT.Size           := 1;
    SIT_NACIONALIDAD         := CreaCampo('SIT_NACIONALIDAD',        ftString, tsNinguno, tsNinguno, False);
    with SIT_NACIONALIDAD do begin
      UseCombo := True;
      ComboDatos.add('AC');
      ComboLista.Add('Activa');
      ComboDatos.add('IN');
      ComboLista.Add('Inactiva');
    end;
    ID_FISCAL                   := CreaCampo('ID_FISCAL',            ftString, tsNinguno, tsNinguno, False);
    CVE_PAIS_EXPEDICION         := CreaCampo('CVE_PAIS_EXPEDICION',  ftString, tsNinguno, tsNinguno, False);
    CVE_PAIS_EXPEDICION.Size    := 6;
    CVE_PAIS_EXPEDICION.Caption := 'Clave de Nacionalidad';
    DESC_PAIS_EXPEDICION        := CreaCampo('DESC_PAIS_EXPEDICION', ftString, tsNinguno, tsNinguno, False);
    CVE_MOTIVO                  := CreaCampo('CVE_MOTIVO',           ftString, tsNinguno, tsNinguno, False);
    CVE_PAIS_EXPEDICION.Size    := 15;
    DESC_MOTIVO                 := CreaCampo('DESC_MOTIVO',          ftString, tsNinguno, tsNinguno, False);
    TX_MOTIVO                   := CreaCampo('TX_MOTIVO',            ftString, tsNinguno, tsNinguno, False);
    TX_MOTIVO.Size              := 500;
    CVE_PERS_JURIDICA           := CreaCampo('CVE_PERS_JURIDICA',    ftString, tsNinguno, tsNinguno, False);
    CVE_PERS_JURIDICA.Size      := 2;

    UseQuery  := True;
    HelpFile  := Emptystr;

    Poblacion                           := TPoblacion.Create(self);
    Poblacion.MasterSource              := Self;
    Poblacion.Cve_Poblacion.MasterField := 'CVE_NACIONALIDAD';
    Poblacion.FilterBy                  := fbTPoblacionPais;
    Pob_Exp                             := TPoblacion.Create(self);
    Pob_Exp.MasterSource                := Self;
    Pob_Exp.Cve_Poblacion.MasterField   := 'CVE_PAIS_EXPEDICION';
    Pob_Exp.FilterBy                    := fbTPoblacionPais;
end;

Destructor TPersNac.Destroy;
begin
  if Poblacion  <> Nil then
    Poblacion.free;
  if Pob_Exp <> Nil then
    Pob_Exp.free;
  inherited;
end;

function TPersNac.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TWPersNac;

begin
   W := TWPersNac.Create(Self);
   try
      W.Objeto                     := Self;
      W.ifPersNac.InterFrame       := Self;
      W.ifPersNac.FormaTipo        := FormaTipo;
      W.ifPersNac.ShowGrid         := False;
      W.ifPersNac.ShowNavigator    := False;
      W.ifPersNac.Funcion          := FInterFun;
      W.ifPersNac.ShowBtnModificar := False;
      W.ifPersNac.ShowModal;
      ShowWindow := W.ifPersNac.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWPersNac.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control               := edIDPersona;
  Objeto.NOMBRE_PERS.Control              := edNomPersona;
  Objeto.CVE_NACIONALIDAD.Control         := edCveNacionalidad;
  Objeto.DESC_NACIONALIDAD.Control        := edDescNac;
  Objeto.Poblacion.Cve_Poblacion.Control  := edCveNacionalidad;
  Objeto.Poblacion.Desc_Poblacion.Control := edDescNac;
  Objeto.CVE_RESIDENCIA.Control           := edCveNacionalidad;
  Objeto.B_DEFAULT.Control                := chbDefault;
  Objeto.SIT_NACIONALIDAD.Control         := cbSituacion;
  Objeto.ID_FISCAL.Control                := edFiscal;
  Objeto.CVE_PAIS_EXPEDICION.Control      := edPaisExp;
  Objeto.DESC_PAIS_EXPEDICION.Control     := edDescPaisExp;
  Objeto.Pob_Exp.Cve_Poblacion.Control    := edPaisExp;
  Objeto.Pob_Exp.Desc_Poblacion.Control   := edDescPaisExp;
  Objeto.CVE_MOTIVO.Control               := edMotivo;
  Objeto.DESC_MOTIVO.Control              := edDescMotivo;
  Objeto.TX_MOTIVO.Control                := reTxMotivo;
  Objeto.CVE_PERS_JURIDICA.Control        := edPersJur;
end;

procedure TWPersNac.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control               := nil;
  Objeto.NOMBRE_PERS.Control              := nil;
  Objeto.CVE_NACIONALIDAD.Control         := nil;
  Objeto.DESC_NACIONALIDAD.Control        := nil;
  Objeto.Poblacion.Cve_Poblacion.Control  := nil;
  Objeto.Poblacion.Desc_Poblacion.Control := nil;
  Objeto.CVE_RESIDENCIA.Control           := nil;
  Objeto.B_DEFAULT.Control                := nil;
  Objeto.SIT_NACIONALIDAD.Control         := nil;
  Objeto.ID_FISCAL.Control                := nil;
  Objeto.CVE_PAIS_EXPEDICION.Control      := nil;
  Objeto.DESC_PAIS_EXPEDICION.Control     := nil;
  Objeto.Pob_Exp.Cve_Poblacion.Control    := nil;
  Objeto.Pob_Exp.Desc_Poblacion.Control   := nil;
  Objeto.CVE_MOTIVO.Control               := nil;
  Objeto.DESC_MOTIVO.Control              := nil;
  Objeto.TX_MOTIVO.Control                := nil;
  Objeto.CVE_PERS_JURIDICA.Control        := nil;
end;

procedure TWPersNac.ifPersNacDespuesNuevo(Sender: TObject);
begin
  Objeto.ID_PERSONA.AsFloat         := Objeto.pidpersona;
  Objeto.NOMBRE_PERS.AsString       := Objeto.pnombrepers;
  Objeto.CVE_PERS_JURIDICA.AsString := Objeto.ppersjur;
  lbNacionalidad.Caption            := 'Nacionalidad';
  if Objeto.pTipo = 2 then
    lbNacionalidad.Caption := 'Residencia';
  chbDefault.Checked                := False;
  cbSituacion.ItemIndex             := 0;
  vgn_nuevo                         := 1;
  if Objeto.pTipo = 1 then
    Caption := 'Nacionalidad';
  edSiglasRFC.Text    := Emptystr;
  edFRFC.Text         := Emptystr;
  edHomoclaveRFC.Text := EmptyStr;
  edCveNacionalidad.SetFocus;
end;

procedure TWPersNac.ifPersNacAntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.GetFromControl;
  Objeto.ID_PERSONA.AsFloat           := Objeto.pidpersona;
  Objeto.NOMBRE_PERS.AsString         := Objeto.pnombrepers;
  Objeto.CVE_PERS_JURIDICA.AsString   := Objeto.ppersjur;
  Objeto.CVE_NACIONALIDAD.AsString    := Objeto.pNac;
  Objeto.CVE_RESIDENCIA.AsString      := Objeto.pNac;
  Objeto.B_DEFAULT.AsString           := Objeto.pbdefault;
  Objeto.SIT_NACIONALIDAD.AsString    := Objeto.psit;
  Objeto.CVE_PAIS_EXPEDICION.AsString := Objeto.pPaisExp;
  lbNacionalidad.Caption            := 'Nacionalidad';
  if Objeto.pTipo = 2 then
    lbNacionalidad.Caption := 'Residencia';
  vgn_nuevo                         := 2;
  Realizado := True;
end;

procedure TWPersNac.ifPersNacDespuesModificar(Sender: TObject);
begin
  if Objeto.pTipo = 1 then
    Objeto.Poblacion.FindKey([Objeto.CVE_NACIONALIDAD.AsString])
  else
    Objeto.Poblacion.FindKey([Objeto.CVE_RESIDENCIA.AsString]);
  edCveNacionalidadExit(self);
end;

procedure TWPersNac.sbNacClick(Sender: TObject);
begin
  Objeto.Poblacion.Busca;
  edCveNacionalidadExit(self);
end;

procedure TWPersNac.ilPaisExpCapture(Sender: TObject; var Show: Boolean);
begin
  Show := True;
end;

procedure TWPersNac.ilPaisExpEjecuta(Sender: TObject);
begin
  Objeto.Pob_Exp.FindKey([ilPaisExp.Buffer]);
end;

procedure TWPersNac.sbPaisExpClick(Sender: TObject);
begin
  Objeto.Pob_Exp.Busca;
end;

procedure TWPersNac.sbMotivoClick(Sender: TObject);
Var T : TInterFindit;

begin
  T := Objeto.CreaBuscador('IMOTFISCAL.IT','S,S');
  Try
    if vgn_nuevo = 1 then
      T.WhereString := ' SIT_MOTIVO = ' + Quotedstr('AC');
    if Active then begin
      T.Param(0, Objeto.CVE_MOTIVO.AsString);
    end;
    if T.Execute then Begin
      Objeto.CVE_MOTIVO.AsString  := T.DameCampo(0);
      Objeto.DESC_MOTIVO.AsString := T.DameCampo(1);
    end;
  finally
    T.Free;
  end;
end;

procedure TWPersNac.ilMotivoCapture(Sender: TObject; var Show: Boolean);
begin
  Show := true;
end;

procedure TWPersNac.ilMotivoEjecuta(Sender: TObject);
begin
  Busca_Desc_Motivo(ilMotivo.Buffer);
end;

procedure TWPersNac.Busca_Desc_Motivo(pMotivo : String);
Var sql    : String;
    qDatos : Tquery;

Begin
  qDatos := TQuery.create(nil);
  Try
    qDatos.DatabaseName := Objeto.Apli.DataBaseName;
    qDatos.SessionName  := Objeto.Apli.SessionName;
    sql := 'SELECT * ' +
            ' FROM motivo_no_id_fiscal ' +
           ' WHERE cve_motivo = ' + Quotedstr(pMotivo);
    if vgn_nuevo = 1 then
      sql := sql + ' AND sit_motivo = ' + Quotedstr('AC');
    qDatos.Close;
    qDatos.SQL.Clear;
    qDatos.SQL.Add(sql);
    qDatos.Open;
    if Not qDatos.Fields[0].IsNull then Begin
      Objeto.CVE_MOTIVO.AsString  := qDatos.FieldByName('cve_motivo').AsString;
      Objeto.DESC_MOTIVO.AsString := qDatos.FieldByName('Desc_motivo').AsString;
    end
    else Begin
      Objeto.CVE_MOTIVO.AsString  := qDatos.FieldByName('cve_motivo').AsString;
      Objeto.DESC_MOTIVO.AsString := qDatos.FieldByName('Desc_motivo').AsString;
    end;
  finally
    qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TWPersNac.edCveNacionalidadExit(Sender: TObject);
var sql,
    vls_tipo,
    vls_paisexp,
    vls_mascara,
    vls_hint,
    vls_idfiscal : String;
    qDatos       : TQuery;
    vlb_existe   : Boolean;

begin
  pPaisExp.Visible := False;
  lbhint.Visible   := False;
  Objeto.ID_FISCAL.AsString           := Emptystr;
  Objeto.CVE_PAIS_EXPEDICION.AsString := Emptystr;
  edDescPaisExp.Text                  := Emptystr;
  Objeto.CVE_MOTIVO.AsString          := Emptystr;
  edDescMotivo.Text                   := Emptystr;
  Objeto.TX_MOTIVO.AsString           := Emptystr;
  reTxMotivo.Lines.Clear;
  if Objeto.CVE_NACIONALIDAD.AsString <> Emptystr then Begin
    qDatos := TQuery.Create(nil);
    vlb_existe := False;
    Try
      qDatos.DatabaseName := Objeto.Apli.DataBaseName;
      qDatos.SessionName  := Objeto.Apli.SessionName;
      sql := 'SELECT * ' +
              ' FROM per_id_fiscal_config ' +
             ' WHERE cve_pais = ' + Quotedstr(Objeto.CVE_NACIONALIDAD.AsString) +
               ' AND cve_per_juridica = ' + Quotedstr(Objeto.CVE_PERS_JURIDICA.AsString);
      qDatos.Close;
      qDatos.SQL.Clear;
      qDatos.SQL.Add(sql);
      qDatos.Open;
      if Not qDatos.Fields[0].IsNull then Begin
        qDatos.First;
        vls_tipo    := qDatos.FieldByName('etiqueta_id_fiscal').AsString;
        vls_paisexp := qDatos.FieldByName('b_requiere_pais_exp').AsString;
        vls_mascara := qDatos.FieldByName('mascara').AsString;
        vls_hint    := qDatos.FieldByName('etiqueta_hint').AsString;
        vlb_existe  := True;
      end
      else Begin
        sql := 'SELECT * ' +
                ' FROM per_id_fiscal_config ' +
               ' WHERE cve_pais = ' + Quotedstr(Objeto.CVE_NACIONALIDAD.AsString) +
                 ' AND cve_per_juridica = ' + Quotedstr('AM');
        qDatos.Close;
        qDatos.SQL.Clear;
        qDatos.SQL.Add(sql);
        qDatos.Open;
        if Not qDatos.Fields[0].IsNull then Begin
          qDatos.First;
          vls_tipo    := qDatos.FieldByName('etiqueta_id_fiscal').AsString;
          vls_paisexp := qDatos.FieldByName('b_requiere_pais_exp').AsString;
          vls_mascara := qDatos.FieldByName('mascara').AsString;
          vls_hint    := qDatos.FieldByName('etiqueta_hint').AsString;
          vlb_existe  := True;
        end
        else Begin
          sql := 'SELECT * ' +
                  ' FROM per_id_fiscal_config ' +
                 ' WHERE cve_pais = ' + Quotedstr('PAOTRO') +
                   ' AND cve_per_juridica = ' + Quotedstr('AM');
          qDatos.Close;
          qDatos.SQL.Clear;
          qDatos.SQL.Add(sql);
          qDatos.Open;
          if Not qDatos.Fields[0].IsNull then Begin
            qDatos.First;
            vls_tipo    := qDatos.FieldByName('etiqueta_id_fiscal').AsString;
            vls_paisexp := qDatos.FieldByName('b_requiere_pais_exp').AsString;
            vls_mascara := qDatos.FieldByName('mascara').AsString;
            vls_hint    := qDatos.FieldByName('etiqueta_hint').AsString;
            vlb_existe  := True;
          end
        end;
      end;
    Finally
      qDatos.Close;
      qDatos.Free;
    end;

    if vlb_existe then Begin
      vgs_caract         := vls_mascara;
      lbidfiscal.Caption := vls_tipo;
      lbhint.Visible     := True;
      lbhint.Caption     := vls_hint;
      edFiscal.Left      := lbidfiscal.Left + lbidfiscal.Width + 20;
      if Objeto.CVE_NACIONALIDAD.AsString = 'PAMEXI' then Begin
        edFiscal.Visible := False;
        prfc.Visible     := True;
      end
      else begin
        edFiscal.Visible := True;
        prfc.Visible     := False;
      end;

      if vls_paisexp = 'V' then
        pPaisExp.Visible := True;
    end;

    qDatos := TQuery.Create(nil);
    Try
      qDatos.DatabaseName := Objeto.Apli.DataBaseName;
      qDatos.SessionName  := Objeto.Apli.SessionName;
      sql := 'SELECT * ' +
              ' FROM per_id_fiscal ' +
             ' WHERE id_persona = ' + floattostr(Objeto.pidpersona) +
               ' AND cve_pais = ' + Quotedstr(Objeto.CVE_NACIONALIDAD.AsString);
      qDatos.SQL.Clear;
      qDatos.SQL.Add(sql);
      qDatos.Open;
      if Not qDatos.Fields[0].IsNull then Begin
        Objeto.ID_FISCAL.AsString := qDatos.FieldByName('id_fiscal').AsString;
        if qdatos.FieldByName('cve_pais_expedicion').AsString <> Emptystr then
          Objeto.Pob_Exp.FindKey([qdatos.FieldByName('cve_pais_expedicion').AsString]);
        if qdatos.FieldByName('cve_motivo').AsString <> Emptystr then
          Busca_Desc_Motivo(qdatos.FieldByName('cve_motivo').AsString);
        if qDatos.FieldByName('tx_motivo').AsString <> EmptyStr then Begin
          Objeto.TX_MOTIVO.AsString := qDatos.FieldByName('tx_motivo').AsString;
          reTxMotivo.Lines.Add(Objeto.TX_MOTIVO.AsString);
        end;
      end;
    Finally
      qDatos.Close;
      qDatos.Free;
    end;
    edSiglasRFC.Text    := Emptystr;
    edFRFC.Text         := Emptystr;
    edHomoclaveRFC.Text := EmptyStr;
    if Objeto.CVE_NACIONALIDAD.AsString = 'PAMEXI' then Begin
      if Objeto.ID_FISCAL.AsString <> Emptystr then Begin
        vls_idfiscal := Objeto.ID_FISCAL.AsString;
        if Pos('-', vls_idfiscal) > 0 then begin
          edSiglasRFC.Text := Copy(vls_idfiscal, 1, Pos('-', vls_idfiscal) - 1);
          vls_idfiscal     := Copy(vls_idfiscal, Pos('-', vls_idfiscal) + 1, Length(vls_idfiscal));
        end;
        if Pos('-', vls_idfiscal) > 0 then begin
          edFRFC.Text  := copy(vls_idfiscal, 1, Pos('-', vls_idfiscal) - 1);
          vls_idfiscal := Copy(vls_idfiscal, Pos('-', vls_idfiscal) + 1, Length(vls_idfiscal));
        end;
        edHomoclaveRFC.Text := vls_idfiscal
      end;
      edSiglasRFC.SetFocus;
    end
    else
      edfiscal.SetFocus;

  end;
end;

Function TWPersNac.ValidaRFC(Nombre,
                             ApPaterno,
                             ApMaterno,
                             RazonSocial : String;
                             FechaRFC    : TDateTime;
                             Siglas,
                             Numeros,
                             Homoclave   : String;
                             ShowError   : Boolean = True): Boolean;
var objStp : TStoredProc;

begin
  Result := False;

  If (Siglas <> '') and (Numeros <> '') Then
    { Se calcula y valida el RFC }
    Try
      objStp := TStoredProc.Create(Self);
      with objStp do begin
        Params.Clear;
        StoredProcName := 'PKGCORPRFC.CALCULARFC';
        DatabaseName   := Objeto.Apli.DataBaseName;
        SessionName    := Objeto.Apli.SessionName;
        Params.CreateParam(ftString, 'pNomRazonSocial', ptInput);
        Params.CreateParam(ftString, 'pApellidoPaterno',ptInput);
        Params.CreateParam(ftString, 'pApellidoMaterno',ptInput);
        Params.CreateParam(ftString, 'pNombrePersona',  ptInput);
        Params.CreateParam(ftDate,   'pFRfc',           ptInput);
        Params.CreateParam(ftString, 'pSiglas',         ptOutput);
        Params.CreateParam(ftString, 'pNumeros',        ptOutput);
        Params.CreateParam(ftString, 'pHomoclave',      ptOutput);
        Params.CreateParam(ftInteger,'pResultado',      ptOutput);
        Params.CreateParam(ftString, 'pDescResultado',  ptOutput);

        Params.ParamByName('pNomRazonSocial').AsString  := RazonSocial;
        Params.ParamByName('pApellidoPaterno').AsString := ApPaterno;
        Params.ParamByName('pApellidoMaterno').AsString := ApMaterno;
        Params.ParamByName('pNombrePersona').AsString   := Nombre;
        Params.ParamByName('pFRfc').AsDate              := FechaRFC;

        ExecProc;

        If (Params.ParamByName('pResultado').AsInteger <> 0) Then
          { Error en el cálculo del RFC }
          Raise EInterFrame.Create('Error en la validación del RFC. ' + chr(VK_RETURN) +
                                   Params.ParamByName('pDescResultado').asString)
        Else Begin
          { El Rfc es igual al calculado  o
            El usuario acepta la grabación del RFC diferente }
          IF ((Trim(Params.ParamByName('pSiglas').asString) = Siglas) and
              (Trim(Params.ParamByName('pNumeros').asString) = Numeros) and
              (Trim(Params.ParamByName('pHomoclave').asString) = Homoclave)) OR
             (ShowError and (MessageDlg('Error en la validación del RFC.' + chr(VK_RETURN) +
                                        Params.ParamByName('pDescResultado').asString + chr(VK_RETURN) +
                                        '  El RFC capturado  ' + Siglas + ' ' + Numeros + ' ' + Homoclave +
                                        '  no coincide ' + chr(VK_RETURN) + '  con el calculado   ' +
                                        Trim(Params.ParamByName('pSiglas').asString) + ' ' +
                                        Trim(Params.ParamByName('pNumeros').asString) + ' ' +
                                        Trim(Params.ParamByName('pHomoclave').asString) + chr(VK_RETURN) + chr(VK_RETURN) +
                                        '¿ Esta seguro de continuar con la modificación ?', mtConfirmation,
                                        [mbYes, mbNO], 0) = mrYes)) THEN
            Result:= True;
        end;
      end;
    Finally
      If objStp <> nil Then
        objStp.Free;
      objStp := nil;
    end
  Else If (Siglas = '') and (Numeros = '') and (Homoclave = '') Then
    { No es necesario validar el RFC porque la persona no lo requiere }
    Result := True
  Else
    { Error... alguno de los campos del RFC no esta capturado }
    Raise EInterFrame.Create('El Registro de RFC es Incorrecto. Revise que todos los campos esten capturados.');
end;

procedure TWPersNac.ifPersNacAntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var sql,
    vls_cve,
    vls_idfiscal,
    vls_siglas,
    vls_fecha,
    vls_homoc,
    vls_nomproc,
    vls_fnac     : String;
    RegExp       : TRegExpr;
    vlb_sigue    : Boolean;
    qDatos       : TQuery;
    stp          : TStoredProc;

begin
  Realizado := False;
  Objeto.GetFromControl;
  if Objeto.pTipo = 1 then
    vls_cve := Objeto.CVE_NACIONALIDAD.AsString
  else
    vls_cve := Objeto.CVE_RESIDENCIA.AsString;
  if IsNewData then Begin  //nuevo
    vls_nomproc := 'PKGCORPORATIVO.ALTAPERNACRES';
    if vls_cve = EmptyStr then Begin
      MessageDlg('Favor de seleccionar una ' + lbNacionalidad.Caption + ' para poder continuar. ', mtWarning, [mbOk], 0);
      edCveNacionalidad.SetFocus;
      exit;
    end;
  end
  else Begin               //modificación
    vls_nomproc := 'PKGCORPORATIVO.MODPERNACRES';
  end;

  if (chbDefault.Checked) and (Objeto.SIT_NACIONALIDAD.AsString = 'IN') then Begin
    MessageDlg('Favor de activar la situación de la ' + lbNacionalidad.Caption + ' para poder continuar. ', mtWarning, [mbOk], 0);
    cbSituacion.SetFocus;
    exit;
  end;

  if prfc.Visible then Begin
    if (edSiglasRFC.Text <> Emptystr) and (edFRFC.Text <> Emptystr) {and (edHomoclaveRFC.Text <> Emptystr)} then
      Objeto.ID_FISCAL.AsString := edSiglasRFC.Text + '-' + edFRFC.Text + '-' + edHomoclaveRFC.Text
    else
      Objeto.ID_FISCAL.AsString := Emptystr;  
  end;

  //Verifico si se escribio id_fiscal y se selecciono un motivo de no insercción para enviar mensaje
  if (Objeto.ID_FISCAL.AsString <> Emptystr) and (Objeto.CVE_MOTIVO.AsString <> EmptyStr) then
    if MessageDlg('Existe ' + lbidfiscal.Caption + ' y también esta seleccionada una Clave de Motivo.' +
                  chr(VK_RETURN) +
                  'Se eliminará la Clave de Motivo. ' +
                  chr(VK_RETURN) +
                  '¿Está seguro de continuar?',
                        mtConfirmation, [mbYes, mbNO], 0) = mrYes then Begin
      Objeto.CVE_MOTIVO.AsString  := Emptystr;
      Objeto.desc_motivo.Asstring := Emptystr;
      Objeto.TX_MOTIVO.AsString   := Emptystr;
      reTxMotivo.Lines.Clear;
    end
    else Begin
      edFiscal.SetFocus;
      exit;
    end;

  //verifico si se escribio Id_fiscal, de lo contrario verifico si se selecciono un motivo de no inserción
  if (Objeto.ID_FISCAL.AsString = Emptystr) and (Objeto.CVE_MOTIVO.AsString = EmptyStr) then Begin
    MessageDlg('No se escribió ' + lbidfiscal.Caption + ' y tampoco se selecciono un motivo de no inserción.',
               mtWarning, [mbOk], 0);
    edFiscal.SetFocus;
    exit;
  end
  else Begin
    vlb_sigue := True;
    if Objeto.ID_FISCAL.AsString <> Emptystr then Begin //valido con la máscara de tabla per_id_fiscal_config
      RegExp := TRegExpr.Create;
      Try
        RegExp.Expression := vgs_caract;
        if Not regexp.Exec(edFiscal.text) then Begin
          MessageDlg('La clave de ' + lbidfiscal.Caption + ' le faltan caracteres o contiene caracteres no permitidos.',
                     mtWarning, [mbOk], 0);
          edFiscal.SetFocus;
          vlb_sigue := False;
        end;
      Finally
        RegExp.Free;
      end;
    end;
    if Not vlb_sigue then
      exit;
    //Verifico si se selecciono País de Expedición
    if (Objeto.ID_FISCAL.AsString <> EmptyStr) and (pPaisExp.Visible) then Begin //valido que exista Pais de Expedición
      if Objeto.CVE_PAIS_EXPEDICION.AsString = Emptystr then Begin
        MessageDlg('Favor de seleccionar una Clave de País de Expedición.', mtWarning, [mbOk], 0);
        edPaisExp.SetFocus;
        exit;
      end;
    end;

    //Busco para personas morales solamente exista una nacionalidad o residencia activa y se pregunte si se desea cambiar
    if (Objeto.CVE_PERS_JURIDICA.AsString = 'PM') then Begin
      vlb_sigue := True;
      if (Objeto.SIT_NACIONALIDAD.AsString = 'AC') and (chbDefault.Checked) then Begin
//        if Objeto.SIT_NACIONALIDAD.AsString = 'IN' then
//           Objeto.SIT_NACIONALIDAD.AsString := 'AC';
        if Objeto.B_DEFAULT.AsString <> 'V' then
          Objeto.B_DEFAULT.AsString := 'V';
        qDatos := TQuery.Create(nil);
        Try
          if Objeto.pTipo = 1 then
            sql := 'SELECT count(*) as reg ' +
                    ' FROM per_nacionalidad ' +
                   ' WHERE sit_nacionalidad = ' + Quotedstr('AC') +
                     ' AND cve_nacionalidad <> ' + Quotedstr(Objeto.CVE_NACIONALIDAD.AsString) +
                     ' AND id_persona = ' + Objeto.ID_PERSONA.AsString
          else
            sql := 'SELECT count(*) as reg ' +
                    ' FROM per_residencia ' +
                   ' WHERE sit_residencia = ' + Quotedstr('AC') +
                     ' AND cve_residencia <> ' + Quotedstr(Objeto.CVE_RESIDENCIA.AsString) +
                     ' AND id_persona = ' + Objeto.ID_PERSONA.AsString;
          qDatos.DatabaseName := Objeto.Apli.DataBaseName;
          qDatos.SessionName  := Objeto.Apli.SessionName;
          qDatos.Close;
          qDatos.SQL.Clear;
          qDatos.SQL.Add(sql);
          qDatos.Open;
          if qDatos.FieldByName('reg').AsInteger >= 1 then
            vlb_sigue := False;
{          else Begin
            if Objeto.SIT_NACIONALIDAD.AsString = 'IN' then
              Objeto.SIT_NACIONALIDAD.AsString := 'AC';
            if Objeto.B_DEFAULT.AsString <> 'V' then
              Objeto.B_DEFAULT.AsString := 'V';
          end;}
        Finally
          qDatos.Close;
          qDatos.Free;
        end;
      end;
      if Not vlb_sigue then Begin
        if Objeto.pTipo = 1 then Begin
          if MessageDlg('Ya existe una Nacionalidad ACTIVA para la persona ' + Objeto.ID_PERSONA.AsString + '. ' +
                        chr(VK_RETURN) +
                        'Se INACTIVARA la Nacionalidad existente y la actual se colocara por Default. ' +
                        chr(VK_RETURN) +
                        '¿ Esta seguro de continuar con la modificación ? ',
                        mtConfirmation, [mbYes, mbNO], 0) = mrYes then
            vlb_sigue := True
          else
            exit;
        end
        else Begin
          if MessageDlg('Ya existe una Residencia ACTIVA para la persona ' + Objeto.ID_PERSONA.AsString + '. ' +
                        chr(VK_RETURN) +
                        'Se INACTIVARA la Residencia existente y la actual se colocara por Default. ' +
                        chr(VK_RETURN) +
                        '¿ Esta seguro de continuar con la modificación ? ',
                        mtConfirmation, [mbYes, mbNO], 0) = mrYes then
            vlb_sigue := True
          else
            exit;
        end;//Fin de if Objeto.pTipo = 1
      end;//Fin de if Not vlb_sigue
    end;//Fin de if (Objeto.CVE_PERS_JURIDICA.AsString = 'PM')

    //Para la clave de nacionalidad o residencia en caso de que sea PAMEXI valido el RFC
    vls_siglas   := Emptystr;
    vls_fecha    := Emptystr;
    vls_homoc    := '';
    if vls_cve = 'PAMEXI' then begin //valida el rfc
      if (Objeto.ID_FISCAL.AsString <> Emptystr) and (Objeto.CVE_MOTIVO.AsString = EmptyStr) then Begin
        if edHomoclaveRFC.Text = EmptyStr then
          edHomoclaveRFC.Text := ' ';

        { Validación de la Fecha del RFC }
        if Trim(edFRFC.Text) <> Emptystr Then Begin
          If Objeto.CVE_PERS_JURIDICA.AsString = 'PF' Then Begin
            Try
              vls_fnac := FormatDateTime('dd/mm/yyyy', Objeto.pFechaNac);
            Except
              Raise EInterFrame.Create('Verifique que la Fecha de Nacimiento de la persona sea válida.');
            end;

            vls_fnac := FormatDateTime('YYMMDD', Objeto.pFechaNac);
            If vls_fnac <> edFRFC.Text Then
              Raise EInterFrame.Create('Imposible modificar a la persona.' + chr(VK_RETURN) +
                 'Revise que la fecha del RFC sea igual a la Fecha de Nacimiento de la Persona');
          end
          Else If Objeto.CVE_PERS_JURIDICA.AsString = 'PM' Then Begin
            Try
              vls_fnac := FormatDateTime('dd/mm/yyyy', Objeto.pFechaConst);
            Except
              Raise EInterFrame.Create('Verifique que la Fecha de Constitución de la empresa sea válida.');
            end;
            vls_fnac := FormatDateTime('YYMMDD', Objeto.pFechaConst);
            If vls_fnac <> edFRFC.Text Then
              Raise EInterFrame.Create('Imposible modificar a la persona.' + chr(VK_RETURN) +
                'Revise que la fecha del RFC sea igual a la Fecha de Constitución de la Empresa');
          end;
        end;

        If ValidaRFC(Objeto.pNom_Pers,
                     Objeto.pApell_Pat,
                     Objeto.pApell_Mat,
                     Objeto.pNom_Raz_Soc,
                     Objeto.pFechaRFC,
                     edSiglasRFC.Text,          //vls_siglas,
                     edFRFC.Text,               //vls_fecha,
                     edHomoclaveRFC.Text) Then  //vls_homoc) Then
          vlb_sigue := True
        Else Begin
          MessageDlg('Alta de Nacionalidad Cancelada por el Usuario.', mtWarning, [mbOk], 0);
          exit;
        end;
      end;
    end;

    if vlb_sigue then Begin
      Objeto.TX_MOTIVO.AsString := reTxMotivo.Lines.Text;
      stp := TStoredProc.Create(Self);
      Try
        stp.DatabaseName   := Objeto.Apli.DataBaseName;
        stp.SessionName    := Objeto.Apli.SessionName;
        stp.StoredProcName := vls_nomproc;
        stp.Params.Clear;
        stp.Params.CreateParam(ftfloat,   'p_id_persona',          ptInput);
        stp.Params.CreateParam(ftString,  'p_cve_nacres',          ptInput);
        stp.Params.CreateParam(ftString,  'p_b_default',           ptInput);
        stp.Params.CreateParam(ftString,  'p_sit_nacres',          ptInput);
        stp.Params.CreateParam(ftString,  'p_id_fiscal',           ptInput);
        stp.Params.CreateParam(ftString,  'p_cve_pais_expedicion', ptInput);
        stp.Params.CreateParam(ftString,  'p_cve_motivo',          ptInput);
        stp.Params.CreateParam(ftString,  'p_tx_motivo',           ptInput);
        stp.Params.CreateParam(ftString,  'p_siglas',              ptInput);
        stp.Params.CreateParam(ftString,  'p_fecharfc',            ptInput);
        stp.Params.CreateParam(ftString,  'p_homoclave',           ptInput);
        stp.Params.CreateParam(ftString,  'p_persjuridica',        ptInput);
        stp.Params.CreateParam(ftInteger, 'p_tipo',                ptInput);
        stp.Params.CreateParam(ftInteger, 'p_CodResp',             ptOutput);
        stp.ParamByName('p_id_persona').AsFloat           := Objeto.ID_PERSONA.AsFloat;
        stp.ParamByName('p_cve_nacres').AsString          := vls_cve;
        stp.ParamByName('p_b_default').AsString           := Objeto.B_DEFAULT.AsString;
        stp.ParamByName('p_sit_nacres').AsString          := Objeto.SIT_NACIONALIDAD.AsString;
        stp.ParamByName('p_id_fiscal').AsString           := Objeto.ID_FISCAL.AsString;
        stp.ParamByName('p_cve_pais_expedicion').AsString := Objeto.CVE_PAIS_EXPEDICION.AsString;
        stp.ParamByName('p_cve_motivo').AsString          := Objeto.CVE_MOTIVO.AsString;
        stp.ParamByName('p_tx_motivo').AsString           := Objeto.TX_MOTIVO.AsString;
        stp.ParamByName('p_siglas').AsString              := edSiglasRFC.Text;     //vls_siglas;
        stp.ParamByName('p_fecharfc').AsString            := edFRFC.Text;          //vls_fecha;
        stp.ParamByName('p_homoclave').AsString           := edHomoclaveRFC.Text;  //vls_homoc;
        stp.ParamByName('p_persjuridica').AsString        := Objeto.ppersjur;
        stp.ParamByName('p_tipo').AsInteger               := Objeto.pTipo;
        stp.ExecProc;
        if stp.Params.ParamByName('p_CodResp').AsInteger = 1 Then
          MessageDlg('La Nacionalidad ' + vls_cve + ' que se quiere dar de alta, ya existe.', mtWarning, [mbOk], 0)
        else if stp.Params.ParamByName('p_CodResp').AsInteger = 2 Then
          MessageDlg('La Residencia ' + vls_cve + ' que se quiere dar de alta, ya existe.', mtWarning, [mbOk], 0)
        else if stp.Params.ParamByName('p_CodResp').AsInteger = 10 then Begin
          MessageDlg('La Nacionalidad ' + vls_cve + ' que se quiere Inactivar es la que se encuentra por default.' + #13#10 +
                     'Active otra Nacionalidad y coloquela por default, posteriormente proceda a inactivar esta.', mtWarning, [mbOk], 0);
          Realizado := True;
        end
        else if stp.Params.ParamByName('p_CodResp').AsInteger = 11 then Begin
          MessageDlg('La Residencia ' + vls_cve + ' que se quiere Inactivar es la que se encuentra por default.' + #13#10 +
                     'Active otra Residencia y coloquela por default, posteriormente proceda a inactivar esta.', mtWarning, [mbOk], 0);
          Realizado := True;
        end
        else if stp.Params.ParamByName('p_CodResp').AsInteger = 12 then Begin
          MessageDlg('Para desactivar el default de la Nacionalidad ' + vls_cve + '.' + #13#10 +
                     'Seleccione otra Nacionalidad que quedará por default.', mtWarning, [mbOk], 0);
          Realizado := True;
        end
        else if stp.Params.ParamByName('p_CodResp').AsInteger = 13 then Begin
          MessageDlg('Para desactivar el default de la Residencia ' + vls_cve + '.' + #13#10 +
                     'Seleccione otra Residencia que quedará por default.', mtWarning, [mbOk], 0);
          Realizado := True;
        end
        else
          Realizado := True;
      Finally
        stp.Free;
      end;
    end;
  end;
end;

procedure TWPersNac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWPersNac.cbSituacionKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.
