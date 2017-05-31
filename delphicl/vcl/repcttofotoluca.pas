unit RepCttofoToluca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterApl, StdCtrls, Buttons, quickrpt, InterFor, IntFrm, UnSQL2, db, dbtables,
  RepCttoTolucaPFN,     { Proemio P Fisicas Nacionales }
  RepCttoTolucaPMN,     { Proemio P Morales Nacionales }
//RAPA 30Nov04  RepCttoTolucaAnBase,  { Anexo Base }
//RAPA 30Nov04  RepCttoTolucaAcPros,  { Acuse de Prospectos }
  RepCttoTolucaMandato, { Mandato }
//RAPA 30Nov04  RepCttoTolucaAcAnex,  { Acuse de Anexos para Contratos IFON}
//RAPA 30Nov04  RepOperAcAnexos,      { Acuse de Anexos para Contratos OFON}
//  RepCttoTarFirmas,     { Tarjeta de Firmas }
  UnRpKYCPF2,           { Información KYC P Fisicas para el Cliente }
  UnRpKYCPFEmp2,        { Información KYC P Fisicas con Act. Empresarial para el Cliente }
  UnRpKYCPM2,           { Información KYC P Morales para el Cliente }
  UnGene,IntFind, InterFun, IntCtoConPro;

type
  TToluca = Class;

  TwToluca = class(TForm)
    cbNomRepres: TComboBox;
    Label1: TLabel;
    InterForma1: TInterForma;
    Label2: TLabel;
    cbNomCliente: TComboBox;
    edLeyenda: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    edLeyendaPie: TMemo;
    GroupBox1: TGroupBox;
    chbProemio: TCheckBox;
    chbMandato: TCheckBox;
    chbTarjetaFirmas: TCheckBox;
    QContratos: TQuery;
    QContratosCVE_CONCEP_CTO: TStringField;
    chbKYC: TCheckBox;
    QContratosCONTRATO: TStringField;
    QContratosFECHA_CONTRATO: TStringField;
    QContratosB_PROSPECTO: TStringField;
    ckCGBinter: TCheckBox;
    ckConvenio: TCheckBox;
    procedure bbPreliminarClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbNomClienteClick(Sender: TObject);
    procedure cbNomRepresClick(Sender: TObject);
    procedure chbProemioClick(Sender: TObject);
    procedure chbProspectosClick(Sender: TObject);
    procedure chbAnexoClick(Sender: TObject);
    procedure chbMandatoClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chbTarjetaFirmasClick(Sender: TObject);
    procedure chbAnexosClick(Sender: TObject);
    procedure chbKYCClick(Sender: TObject);
    procedure ckCGBinterClick(Sender: TObject);
    procedure ckConvenioClick(Sender: TObject);
  private
  protected
  public
    Objeto: TToluca;
    //Reportes KYC
    qrKYCPM2:    TqrKYCPM2;
    qrKYCPF2:    TqrKYCPF2;
    qrKYCPFEmp2: TqrKYCPFEmp2;
    Procedure Imprime(Preview: Boolean);
  published
  end;

  TToluca = class(TInterFrame)
  private
     procedure ImprimeConvenioModif(pPreview: Boolean);   // CZR 09-Nov-2010

  protected
  public
    B_CGBinter: TInterCampo;
    Id_Contrato: TInterCampo;
    Id_Ctto: TInterCampo;
    Nom_Contrato: TInterCampo;
    Cve_Tipo_Contrato: TInterCampo;

    Contrato: TInterCampo;
    Fecha_Contrato: TInterCampo;
    B_Prospecto: TInterCampo;

    Nom_Representante:TInterCampo;
    Nom_Cliente: TInterCampo;
    Leyenda: TInterCampo;
    Leyenda_Pie: TInterCampo;
    Cve_Per_Juridica: TInterCampo;
    F_Alta: TInterCampo;
    F_Contrato: TInterCampo;
    B_Proemio: TInterCampo;
    B_ConvModif : TInterCampo;   // CZR 09-Nov-2010

//RAPA 30Nov04    B_AcuseProspectos:TInterCampo;
//RAPA 30Nov04    B_AnexoBase: TInterCampo;
    B_Mandato: TInterCampo;
    B_TarjetaFirmas: TInterCampo;
//RAPA 30Nov04    B_AcuseAnexos:TInterCampo;
    B_KYC:TInterCampo;


    RepCompuesto: TQRCompositeReport;
    Constructor Create( AOwner : TComponent ); override;
    Destructor destroy; override;
    Procedure DatabaseChange; override;
    Procedure Impresion(Preview: Boolean);
    Function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Procedure Execute_RepKYC(Apli: TInterApli; Preview: Boolean);
  end;

var
  wToluca: TwToluca;

implementation

uses
  DmCttoEstado,
  UnRpCGBinterPF,   {Reporte de Cartas Genéricas de Personas Físicas}
  UnRpCGBinterPM,   {Reporte de Cartas Genéricas de Personas Morales}
  UnRpConvBco;      { Proemio de Convenio para Envío de Estados de Cuenta por Medios Electrónicos (BCO) }
{$R *.DFM}

Constructor TToluca.Create(AOwner : TComponent);
begin
  inherited;
  { Asignados desde TContrato }
  B_CGBinter:= CreaCampo('B_CGBINTER', ftString, tsNinguno, tsNinguno, False);
  Id_Contrato       := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
  Id_Ctto           := CreaCampo('ID_CTTO',ftInteger,tsNinguno,tsNinguno,False);
  Nom_Contrato      := CreaCampo('NOM_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
  Cve_Tipo_Contrato := CreaCampo('TIPO_CONTRATO',ftString,tsNinguno,tsNinguno,False);
  F_Alta	          := CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,False);

  { Asignados desde QContratos }
  Contrato          := CreaCampo('CONTRATO', ftString, tsNinguno, tsNinguno, False);
  Fecha_Contrato    := CreaCampo('FECHA_CONTRATO', ftString, tsNinguno, tsNinguno, False);
  B_Prospecto       := CreaCampo('B_PROSPECTO', ftString, tsNinguno, tsNinguno, False);

  Nom_Representante := CreaCampo('NOM_REPRESENTANTE',ftInteger,tsNinguno,tsNinguno,False);
  Nom_Cliente	    := CreaCampo('NOM_CLIENTE',ftInteger,tsNinguno,tsNinguno,False);
  Leyenda           := CreaCampo('LEYENDA',ftString,tsNinguno,tsNinguno,False);
  Leyenda_Pie       := CreaCampo('LEYENDA_PIE',ftString,tsNinguno,tsNinguno,False);
  Cve_Per_Juridica  := CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,False);

  B_Proemio	        := CreaCampo('B_PROEMIO',ftBoolean,tsNinguno,tsNinguno,False);
  B_ConvModif       := CreaCampo('B_CONVMODIF', ftBoolean, tsNinguno, tsNinguno, False);   // CZR 09-Nov-2010

//RAPA 30Nov04  B_AcuseProspectos := CreaCampo('B_ACUSEPROSPECTOS',ftBoolean,tsNinguno,tsNinguno,False);
//RAPA 30Nov04  B_AcuseAnexos     := CreaCampo('B_ACUSEANEXOS',ftBoolean,tsNinguno,tsNinguno,False);
//RAPA 30Nov04  B_AnexoBase	    := CreaCampo('B_ANEXOBASE',ftBoolean,tsNinguno,tsNinguno,False);
  B_Mandato         := CreaCampo('B_MANDATO',ftBoolean,tsNinguno,tsNinguno,False);
  B_TarjetaFirmas   := CreaCampo('B_TARJETAFIRMAS',ftBoolean,tsNinguno,tsNinguno,False);
  B_KYC             := CreaCampo('B_KYC',ftBoolean,tsNinguno,tsNinguno,False);
  Id_Contrato.AsInteger := -1;
  IsCheckSecu := False;
end;


Destructor TToluca.destroy;
begin inherited;
end;


Procedure TToluca.DatabaseChange;
begin inherited;
end;

Function  TToluca.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TwToluca;
begin
  W := TwToluca.Create(Self);
  try
    if (Cve_Tipo_Contrato.AsString = 'IFON') OR
       (Cve_Tipo_Contrato.AsString = 'PRBC') Then
       W.Caption := 'PROEMIO - Prestación de Servicios Bancarios'
    else
    if (Cve_Tipo_Contrato.AsString = 'OFON') OR
       (Cve_Tipo_Contrato.AsString = 'PROF') Then
       W.Caption := 'PROEMIO - Sociedad Operadora';
    W.Objeto := Self;
    W.InterForma1.CentrarForma := True;
    W.InterForma1.FormaTipo := ftImprimir;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

// CZR 09-Nov-2010
procedure TToluca.ImprimeConvenioModif(pPreview: Boolean);
var
   Rp : TrpConvBco;
begin
   try
      Rp                      := TrpConvBco.Create(Self);
      Rp.QryCtto.Active       := False;
      Rp.QryCtto.DatabaseName := DataBaseName;
      Rp.QryCtto.SessionName  := SessionName;
      Rp.QryCtto.ParamByName('ID_CONTRATO').AsInteger := Contrato.AsInteger;
      Rp.QryCtto.Active       := True;

      Nom_Representante.GetFromControl;
      Rp.QRLabel41.Caption := UpperCase(Nom_Representante.AsString);

      Nom_Cliente.GetFromControl;
      Rp.QRLabel42.Caption := Nom_Cliente.AsString;

      Rp.QRLabel24.Caption := DateToStr(Apli.DameFechaEmpresaDia('D000'));

      Rp.Preview;
      Rp.Free;
   except
      on e: Exception do
         MessageDlg('Error al Imprimir el Convenio Modificatorio del Contrato ' + IntToStr(Contrato.AsInteger) + '.' + Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
   end;
end;

Procedure TToluca.Impresion(Preview: Boolean);
var
   RpPF : TrpCGBPF;
   RpPM : TrpCGBPM;

   vlSEmpresa          : String;
   vlSNombre           : String;
   vlSTipoCto          : String;
   vlSDescTipoCto      : String;
   vlsDiscrecionalidad : String;
begin
  //Internamente el proemio imprime el mandato (PM) y la hoja de firmas

  //Carta de Instrucción Genérica
  if B_CGBinter.AsBoolean then
  begin
     Try
       //MakeIntQRPreview;
       if Cve_Per_Juridica.AsString = 'PM' then
       begin
          RpPM := TrpCGBPM.Create(Self);
          RpPM.QryCtto.Active := False;
          RpPM.QryCtto.DatabaseName := DataBaseName;
          RpPM.QryCtto.SessionName  := SessionName;
          RpPM.QryCtto.ParamByName('ID_CONTRATO').AsInteger := Id_Contrato.AsInteger;
          RpPM.QryCtto.Active := True;
          RpPM.QRLabel42.Caption := RpPM.QryCtto.fieldbyname('NOMBRE').asString;

          GetSQLStr(' SELECT ID_EMPRESA ' +
                    '   FROM CONTRATO ' +
                    '  WHERE ID_CONTRATO = ' + Id_Contrato.AsString +
                    '  ',
                    DataBaseName,
                    SessionName,
                    'ID_EMPRESA',
                    vlSEmpresa,
                    FALSE);

          // CZR 18-02-2010
          with RpPM.QRInterMemo2.Textos do
          begin
             Clear;
             Add ('@@0@ en mi carácter de representante legal de @@1@ quien es Titular del @@2@, celebrado con esa Institución, '
                + 'el cual se maneja de forma @@3@, les manifiesto lo siguiente: ');
             Add (' ');
             Add (' ');
             case StrToInt(vlSEmpresa) of
                1: Add ('Que con fundamento en lo dispuesto por los articulos 102 y 103 de las Disposiciones de Carácter General aplicables a las Casas de Bolsa '
                      + '(Circular Única) emitidas por la Comisión Nacional Bancaria y de Valores, así como a lo pactado en el contrato de intermediación bursátil antes mencionado, '
                      + 'por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para que al amparo del mencionado contrato puedan operar '
                      + 'con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas integrantes del mismo grupo financiero al que '
                      + 'pertenece esa Casa de Bolsa, asi como para realizar la asignación de valores de dichas operaciones cuando provengan de su posición propia.');
                2: Add ('Que de acuerdo a lo pactado en el contrato antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que al amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa Institución Bancaria, así como para realizar la asignación de valores de dichas '
                      + 'operaciones cuando provengan de su posición propia.');
                else
                   Add ('Que de acuerdo a lo pactado en el @@4@ antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que el amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa institución.');
             end;
          end;
          
          RpPM.QRInterMemo2.Parametro.Strings[0]:= Nom_Cliente.AsString;        //  Nom_Representante.AsString;
          RpPM.QRInterMemo2.Parametro.Strings[1]:= RpPM.QryCtto.fieldbyname('NOMBRE').asString;
          //RpPM.QRInterMemo2.Parametro.Strings[2]:= RpPM.QryCtto.fieldbyname('ID_CONTRATO').asString;
          RpPM.QRFecha.Caption := UpperCase(FmtFecha(RpPM.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
       //-------------------------

           GetSQLStr(' SELECT NOMBRE ' +
                     '   FROM PERSONA ' +
                     '  WHERE PERSONA.ID_PERSONA = ' + vlSEmpresa +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'NOMBRE',
                     vlSNombre,
                     FALSE);
           IF vlSNombre <> '' THEN
             RpPM.QRLEmpresa.Caption := UpperCase(vlSNombre)
           ELSE
             RpPM.QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');
           GetSQLStr(' SELECT DESC_TIPO_CONTRA ' +
                     '   FROM CONTRATO A ' +
                     '   JOIN TIPO_CONTRATO b ON A.CVE_TIP_CONTRATO = b.CVE_TIP_CONTRATO ' +
                     '  WHERE A.ID_CONTRATO = ' + Id_Contrato.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'DESC_TIPO_CONTRA',
                     vlSDescTipoCto,
                     FALSE);

           vlSDescTipoCto:= 'contrato de ' + vlSDescTipoCto;

           RpPM.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto + ' No. ' + Id_Contrato.AsString;
           //RpPM.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

           {GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                     '   FROM SB_CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + IntToStr(Id_Contrato.AsInteger) +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'DISCRECIONAL',
                     vlsDiscrecionalidad,
                     FALSE);}
           RpPM.QRInterMemo2.Parametro.Strings[3]:= '____________________';
           RpPM.QRInterMemo2.Parametro.Strings[4]:= vlSDescTipoCto;
       //-------------------------
          RpPM.Preview;
          RpPM.Free;
       end
       else
       begin     
          RpPF := TrpCGBPF.Create(Self);
          RpPF.QryCtto.Active := False;
          RpPF.QryCtto.DatabaseName := DataBaseName;
          RpPF.QryCtto.SessionName  := SessionName;
          RpPF.QryCtto.ParamByName('ID_CONTRATO').AsInteger := Id_Contrato.AsInteger;
          RpPF.QryCtto.Active := True;
          RpPF.QRLabel42.Caption := RpPF.QryCtto.fieldbyname('NOMBRE').AsString;

          GetSQLStr(' SELECT ID_EMPRESA ' +
                    '   FROM CONTRATO ' +
                    '  WHERE ID_CONTRATO = ' + Id_Contrato.AsString +
                    '  ',
                    DataBaseName,
                    SessionName,
                    'ID_EMPRESA',
                    vlSEmpresa,
                    FALSE);

          // CZR 18-02-2010
          with RpPF.QRInterMemo2.Textos do
          begin
             Clear;
             Add ('@@0@ en mi carácter de Titular del @@1@, celebrado con esa Institución, el cual se maneja de forma @@2@, les manifiesto lo siguiente: ');
             Add (' ');
             Add (' ');
             case StrToInt(vlSEmpresa) of
                1: Add ('Que con fundamento en lo dispuesto por los articulos 102 y 103 de las Disposiciones de Carácter General aplicables a las Casas de Bolsa '
                      + '(Circular Única) emitidas por la Comisión Nacional Bancaria y de Valores, así como a lo pactado en el contrato de intermediación bursátil antes mencionado, '
                      + 'por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para que al amparo del mencionado contrato puedan operar '
                      + 'con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas integrantes del mismo grupo financiero al que '
                      + 'pertenece esa Casa de Bolsa, asi como para realizar la asignación de valores de dichas operaciones cuando provengan de su posición propia.');
                2: Add ('Que de acuerdo a lo pactado en el contrato antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que al amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa Institución Bancaria, así como para realizar la asignación de valores de dichas '
                      + 'operaciones cuando provengan de su posición propia.');
                else
                   Add ('Que de acuerdo a lo pactado en el @@3@ antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que el amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa institución.');
             end;
          end;

          RpPF.QRInterMemo2.Parametro.Strings[0]:= RpPF.QryCtto.fieldbyname('NOMBRE').asString;
          //RpPF.QRInterMemo2.Parametro.Strings[1]:= Contrato.Id_Contrato.asString;
          RpPF.QRFecha.Caption := UpperCase(FmtFecha(RpPF.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
          //-------------------------
              GetSQLStr(' SELECT NOMBRE ' +
                        '   FROM PERSONA ' +
                        '  WHERE PERSONA.ID_PERSONA = ' + trim(vlSEmpresa) +
                        '  ',
                        DataBaseName,
                        SessionName,
                        'NOMBRE',
                        vlSNombre,
                        FALSE);
              IF vlSNombre <> '' THEN
                RpPF.QRLEmpresa.Caption := UpperCase(vlSNombre)
              ELSE
                RpPF.QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');
              GetSQLStr(' SELECT DESC_TIPO_CONTRA ' +
                        '   FROM CONTRATO A ' +
                        '   JOIN TIPO_CONTRATO b ON A.CVE_TIP_CONTRATO = b.CVE_TIP_CONTRATO ' +
                        '  WHERE A.ID_CONTRATO = ' + IntToStr(Id_Contrato.AsInteger) +
                        '  ',
                        DataBaseName,
                        SessionName,
                        'DESC_TIPO_CONTRA',
                        vlSDescTipoCto,
                        FALSE);
              vlSDescTipoCto:= 'contrato de ' + vlSDescTipoCto;

              RpPF.QRInterMemo2.Parametro.Strings[1]:= vlSDescTipoCto + ' No. ' + IntToStr(Id_Contrato.AsInteger);
              //RpPF.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto;

              {GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                        '   FROM SB_CONTRATO ' +
                        '  WHERE ID_CONTRATO = ' + IntToStr(Id_Contrato.AsInteger) +
                        '  ',
                        DataBaseName,
                        SessionName,
                        'DISCRECIONAL',
                        vlsDiscrecionalidad,
                        FALSE);}
              RpPF.QRInterMemo2.Parametro.Strings[2]:= '____________________';
              RpPF.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

          //-------------------------
          RpPF.Preview;
          RpPF.Free;
       end;
     Except
       On e: Exception do
         MessageDlg('Error al Imprimir la Carta Genérica Binter / ICB del Contrato ' + RpPM.QryCtto.fieldbyname('ID_CONTRATO').asString + '.' +
           Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
     end;

  end;

  { Impresion Proemio }
  if B_Proemio.AsBoolean then
  Begin
     if Cve_Per_Juridica.AsString = 'PF' then
          { Personas Fisicas }
          Execute_RepTolucaPFN(self, Preview)
     else
     Begin
          { Personas Morales }
          if Cve_Per_Juridica.AsString = 'PM' then Execute_RepTolucaPMN(self, Preview)
          else MessageDlg('La personalidad Juridica del Titular es Desconocida',mtError, [mbOK],0);
     end;
  end
  else
  Begin
     if B_Mandato.AsBoolean then Execute_RepTolucaMandato(self, Preview);
  end;

  { Impresion de Proemio de Convenio para Envío de Estados de Cuenta por Medios Electrónicos }
  If B_ConvModif.AsBoolean then   ImprimeConvenioModif(False);   // CZR 09-Nov-2010

//RAPA 30Nov04
  { Impresion Acuse de Prospectos
  if B_AcuseProspectos.AsBoolean then Execute_RepTolucaAcusePros(self, Preview);
}

//RAPA 30Nov04
  { Impresion Acuse de Anexos
  if B_AcuseAnexos.AsBoolean then
  Begin
     if (Cve_Tipo_Contrato.AsString = 'IFON') OR
        (Cve_Tipo_Contrato.AsString = 'PRBC') Then
        Execute_RepTolucaAcuseAnex(self, Preview)
     else
     if (Cve_Tipo_Contrato.AsString = 'OFON') OR
        (Cve_Tipo_Contrato.AsString = 'PROF') Then
        Execute_RepOperAcAnexos(self, Preview);
  end;
}

//RAPA 30Nov04
  { Impresion del Anexo Base
  if B_AnexoBase.AsBoolean then Execute_RepTolucaAnexoBase(self, Preview);
}

  { Impresion de la Tarjeta de Firmas }
//  if B_TarjetaFirmas.asBoolean then Execute_TarjetaFirmas(self, True);

  { Impresion KYC}
  if B_KYC.asBoolean then Execute_RepKYC(Apli, Preview);
end;



Procedure TToluca.Execute_RepKYC(Apli: TInterApli; Preview: Boolean);
var
  vlQuery : TQuery;
begin
  if CVE_PER_JURIDICA.AsString = 'PM' then
  begin
    qrKYCPM2                               := TqrKYCPM2.Create(Nil);
    qrKYCPM2.qrieKYCPM.Apli                := Apli;
    qrKYCPM2.qContrato.DatabaseName        := Apli.DataBaseName;
    qrKYCPM2.qContrato.SessionName         := Apli.SessionName;
    qrKYCPM2.qPersona.DatabaseName         := Apli.DataBaseName;
    qrKYCPM2.qPersona.SessionName          := Apli.SessionName;
    qrKYCPM2.qPerEmpresa.DatabaseName      := Apli.DataBaseName;
    qrKYCPM2.qPerEmpresa.SessionName       := Apli.SessionName;
    qrKYCPM2.qPerPaisCober.DatabaseName    := Apli.DataBaseName;
    qrKYCPM2.qPerPaisCober.SessionName     := Apli.SessionName;
    qrKYCPM2.qOperatividad.DatabaseName    := Apli.DataBaseName;
    qrKYCPM2.qOperatividad.SessionName     := Apli.SessionName;
    qrKYCPM2.qPerRefBancaria.DatabaseName  := Apli.DataBaseName;
    qrKYCPM2.qPerRefBancaria.SessionName   := Apli.SessionName;
    qrKYCPM2.qPerRefComercial.DatabaseName := Apli.DataBaseName;
    qrKYCPM2.qPerRefComercial.SessionName  := Apli.SessionName;
    qrKYCPM2.qIngresos.DatabaseName        := Apli.DataBaseName;
    qrKYCPM2.qIngresos.SessionName         := Apli.SessionName;
    qrKYCPM2.qDestinoRec.DatabaseName      := Apli.DataBaseName;
    qrKYCPM2.qDestinoRec.SessionName       := Apli.SessionName;

    qrKYCPM2.qContrato.ParamByName('pIdContrato').AsInteger   := Id_Contrato.AsInteger;
    qrKYCPM2.qDestinoRec.ParamByName('pIdContrato').AsInteger := Id_Contrato.AsInteger;

    qrKYCPM2.qContrato.Open;
    if not qrKYCPM2.qContrato.IsEmpty then
    begin
      qrKYCPM2.qrieKYCPM.Titulo2   := 'Contrato ' + IntToStr(Id_Contrato.AsInteger);
      qrKYCPM2.qrieKYCPM.IdEmpresa := Id_Contrato.AsInteger;
      qrKYCPM2.qPersona.Open;
      qrKYCPM2.qPerEmpresa.Open;
      qrKYCPM2.qPerPaisCober.Open;
      qrKYCPM2.qOperatividad.Open;
      qrKYCPM2.qPerRefBancaria.Open;
      qrKYCPM2.qPerRefComercial.Open;

      if not qrKYCPM2.qContrato.IsEmpty then
             qrKYCPM2.lblActividad.Caption:= qrKYCPM2.qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qrKYCPM2.qContrato.FieldByName('DESC_ACTIVIDAD').asString
      else
             qrKYCPM2.lblActividad.Caption:= '';

      qrKYCPM2.qIngresos.Open;
      qrKYCPM2.qDestinoRec.Open;

    end;

    if Preview then qrKYCPM2.Preview
    else qrKYCPM2.Print;
    qrKYCPM2.qContrato.Close;
    qrKYCPM2.qPersona.Close;
    qrKYCPM2.qPerEmpresa.Close;
    qrKYCPM2.qPerPaisCober.Close;
    qrKYCPM2.qOperatividad.Close;
    qrKYCPM2.qPerRefBancaria.Close;
    qrKYCPM2.qPerRefComercial.Close;
    qrKYCPM2.qIngresos.Close;
    qrKYCPM2.qDestinoRec.Close;
    qrKYCPM2.Free;
  end
  else if CVE_PER_JURIDICA.AsString = 'PF' then
  begin
    vlQuery := TQuery.Create(Nil);
    vlQuery.SQL.Text := 'SELECT PERSONA.CVE_PER_JURIDICA, '
                      + '       PERSONA_FISICA.B_ACTIV_EMPRESA '
                      + 'FROM PERSONA, '
                      + '     PERSONA_FISICA '
                      + 'WHERE PERSONA.ID_PERSONA = (SELECT ID_TITULAR ' +
                                                    '  FROM CONTRATO ' +
                                                    ' WHERE ID_CONTRATO = ' +
                                                    IntToStr(Id_Contrato.AsInteger) +
                                                    ') '
                      + '  AND PERSONA.ID_PERSONA = PERSONA_FISICA.ID_PERSONA(+)';
    vlQuery.DataBaseName := Apli.DataBaseName;
    vlQuery.SessionName  := Apli.SessionName;
    vlQuery.Close;
    vlQuery.Open;
    if not vlQuery.IsEmpty then
    begin
      if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'V' then
      begin
        qrKYCPFEmp2                               := TqrKYCPFEMP2.Create(Nil);
        qrKYCPFEmp2.qrieKYCPFEmp.Apli             := Apli;
        qrKYCPFEmp2.qContrato.DatabaseName        := Apli.DataBaseName;
        qrKYCPFEmp2.qContrato.SessionName         := Apli.SessionName;
        qrKYCPFEmp2.qPersona.DatabaseName         := Apli.DataBaseName;
        qrKYCPFEmp2.qPersona.SessionName          := Apli.SessionName;
        qrKYCPFEmp2.qPerEmpresa.DatabaseName      := Apli.DataBaseName;
        qrKYCPFEmp2.qPerEmpresa.SessionName       := Apli.SessionName;
        qrKYCPFEmp2.qPerPaisCober.DatabaseName    := Apli.DataBaseName;
        qrKYCPFEmp2.qPerPaisCober.SessionName     := Apli.SessionName;
        qrKYCPFEmp2.qOperatividad.DatabaseName    := Apli.DataBaseName;
        qrKYCPFEmp2.qOperatividad.SessionName     := Apli.SessionName;
        qrKYCPFEmp2.qPerRefComercial.DatabaseName := Apli.DataBaseName;
        qrKYCPFEmp2.qPerRefComercial.SessionName  := Apli.SessionName;
        qrKYCPFEmp2.qPerRefBancaria.DatabaseName  := Apli.DataBaseName;
        qrKYCPFEmp2.qPerRefBancaria.SessionName   := Apli.SessionName;
        qrKYCPFEmp2.qPerRefPersona.DatabaseName   := Apli.DataBaseName;
        qrKYCPFEmp2.qPerRefPersona.SessionName    := Apli.SessionName;
        qrKYCPFEmp2.qIngresos.DatabaseName        := Apli.DataBaseName;
        qrKYCPFEmp2.qIngresos.SessionName         := Apli.SessionName;
        qrKYCPFEmp2.qDestinoRec.DatabaseName      := Apli.DataBaseName;
        qrKYCPFEmp2.qDestinoRec.SessionName       := Apli.SessionName;

        qrKYCPFEmp2.qContrato.ParamByName('pIdContrato').AsInteger   := Id_Contrato.AsInteger;
        qrKYCPFEmp2.qDestinoRec.ParamByName('pIdContrato').AsInteger := Id_Contrato.AsInteger;

        qrKYCPFEmp2.qContrato.Open;
        if not qrKYCPFEmp2.qContrato.IsEmpty then
        begin
          qrKYCPFEmp2.qrieKYCPFEmp.Titulo2   := 'Contrato ' + IntToStr(Id_Contrato.AsInteger);
          qrKYCPFEmp2.qrieKYCPFEmp.IdEmpresa := Id_Contrato.AsInteger;
          qrKYCPFEmp2.qPersona.Open;
          qrKYCPFEmp2.qPerEmpresa.Open;
          qrKYCPFEmp2.qPerPaisCober.Open;
          qrKYCPFEmp2.qOperatividad.Open;
          qrKYCPFEmp2.qPerRefComercial.Open;
          qrKYCPFEmp2.qPerRefBancaria.Open;
          qrKYCPFEmp2.qPerRefPersona.Open;
          qrKYCPFEmp2.qIngresos.Open;
          qrKYCPFEmp2.qDestinoRec.Open;

          if not qrKYCPFEmp2.qContrato.IsEmpty then
             qrKYCPFEmp2.lblActividad.Caption:= qrKYCPFEmp2.qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qrKYCPFEmp2.qContrato.FieldByName('DESC_ACTIVIDAD').asString
           else
             qrKYCPFEmp2.lblActividad.Caption:= '';

        end;
        if Preview then
          qrKYCPFEmp2.Preview
        else
          qrKYCPFEmp2.Print;
        qrKYCPFEmp2.qContrato.Close;
        qrKYCPFEmp2.qPersona.Close;
        qrKYCPFEmp2.qPerEmpresa.Close;
        qrKYCPFEmp2.qPerPaisCober.Close;
        qrKYCPFEmp2.qOperatividad.Close;
        qrKYCPFEmp2.qPerRefComercial.Close;
        qrKYCPFEmp2.qPerRefBancaria.Close;
        qrKYCPFEmp2.qPerRefPersona.Close;
        qrKYCPFEmp2.qIngresos.Close;
        qrKYCPFEmp2.qDestinoRec.Close;
        qrKYCPFEmp2.Free;
      end
      else if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'F' then
      begin
        qrKYCPF2                              := TqrKYCPF2.Create(Nil);
        qrKYCPF2.qrieKYCPF.Apli               := Apli;
        qrKYCPF2.qContrato.DatabaseName       := Apli.DataBaseName;
        qrKYCPF2.qContrato.SessionName        := Apli.SessionName;

        qrKYCPF2.qPersona.DatabaseName        := Apli.DataBaseName;
        qrKYCPF2.qPersona.SessionName         := Apli.SessionName;
        qrKYCPF2.qOperatividad.DatabaseName   := Apli.DataBaseName;
        qrKYCPF2.qOperatividad.SessionName    := Apli.SessionName;
        qrKYCPF2.qPerRefBancaria.DatabaseName := Apli.DataBaseName;
        qrKYCPF2.qPerRefBancaria.SessionName  := Apli.SessionName;
        qrKYCPF2.qPerRefPersona.DatabaseName  := Apli.DataBaseName;
        qrKYCPF2.qPerRefPersona.SessionName   := Apli.SessionName;
        

        qrKYCPF2.qIngresos.DatabaseName       := Apli.DataBaseName;
        qrKYCPF2.qIngresos.SessionName        := Apli.SessionName;
        qrKYCPF2.qDestinoRec.DatabaseName     := Apli.DataBaseName;
        qrKYCPF2.qDestinoRec.SessionName      := Apli.SessionName;
        qrKYCPF2.qDomEmpLabora.DatabaseName   := Apli.DataBaseName;
        qrKYCPF2.qDomEmpLabora.SessionName    := Apli.SessionName;

        qrKYCPF2.qContrato.ParamByName('pIdContrato').AsInteger   := Id_Contrato.AsInteger;
        qrKYCPF2.qDestinoRec.ParamByName('pIdContrato').AsInteger := Id_Contrato.AsInteger;

        qrKYCPF2.qContrato.Open;
        if not qrKYCPF2.qContrato.IsEmpty then
        begin
          qrKYCPF2.qrieKYCPF.Titulo2   := 'Contrato ' + IntToStr(Id_Contrato.AsInteger);
          qrKYCPF2.qrieKYCPF.IdEmpresa := Id_Contrato.AsInteger;
          qrKYCPF2.qPersona.Open;
          qrKYCPF2.qOperatividad.Open;
          qrKYCPF2.qPerRefBancaria.Open;
          qrKYCPF2.qPerRefPersona.Open;
         if not qrKYCPFEmp2.qContrato.IsEmpty then
             qrKYCPF2.lblActividad.Caption:= qrKYCPF2.qContrato.FieldByName('CVE_ACTIVIDAD').asString + '    ' +
                           qrKYCPF2.qContrato.FieldByName('DESC_ACTIVIDAD').asString
         else
             qrKYCPF2.lblActividad.Caption:= '';

         if Not (qrKYCPF2.qPersona.FieldByName('DOMICILIO_EMP').IsNull)  then
         begin
          qrKYCPF2.qDomEmpLabora.ParamByName('DOMICILIO_EMP').AsFloat :=  qrKYCPF2.qPersona.FieldByName('DOMICILIO_EMP').AsFloat;
          qrKYCPF2.qDomEmpLabora.Open;
        end;
          qrKYCPF2.qIngresos.Open;
          qrKYCPF2.qDestinoRec.Open;

        qrKYCPF2.qIngresos.Open;
        end;
        if Preview then
          qrKYCPF2.Preview
        else
          qrKYCPF2.Print;

        qrKYCPF2.qContrato.Close;
        qrKYCPF2.qPersona.Close;
        qrKYCPF2.qOperatividad.Close;
        qrKYCPF2.qPerRefBancaria.Close;
        qrKYCPF2.qPerRefPersona.Close;
        qrKYCPF2.qIngresos.Close;
        qrKYCPF2.qDomEmpLabora.Close;

        qrKYCPF2.qDestinoRec.Close;

        qrKYCPF2.Free;
      end;
    end;
    vlQuery.Close;
    vlQuery.Free;
  end;
end;

procedure TwToluca.FormShow(Sender: TObject);
var
   q: TQuery;
   s: String;
begin
  //Abre los queries de los reportes
  dmPorta.buscar(Objeto.Id_Contrato.AsString);

  Try
    QContratos.ParamByName('PID_CTO').AsString := Objeto.Id_Contrato.AsString;
    QContratos.DatabaseName:= Objeto.DataBaseName;
    QContratos.SessionName:= Objeto.SessionName;
    QContratos.Open;

    if QContratos.FieldByName('CVE_CONCEP_CTO').AsString = 'T015' then
       edLeyenda.Text := 'REPRESENTADO POR SUS PADRES'
    else
       edLeyenda.Text := 'DOS FIRMAS MINIMO';

    Objeto.Contrato.AsString:= QContratos.FieldByName('CONTRATO').AsString;
    Objeto.Fecha_Contrato.AsString:= QContratos.FieldByName('FECHA_CONTRATO').AsString;
    Objeto.B_Prospecto.AsString:= QContratos.FieldByName('B_PROSPECTO').AsString;

  Finally
    QContratos.Close;
  end;

  cbNomCliente.Items.Clear;
  if Objeto.Id_Contrato.AsInteger <> -1 then
  Begin
    { Inicialización del combo de los posibles firmantes del contrato }
    q := GetSQLQuery(' SELECT Nombre, Cve_Per_juridica, Cve_Contratante'+
                     ' FROM Contratante, Persona'+
                     ' WHERE'+
                     '   Contratante.id_contrato = '+ Objeto.Id_contrato.AsString +
                     '   and Contratante.Id_Persona = Persona.Id_Persona'+
                     '   and Contratante.Sit_Contratante = ''AC'''+
                     '   and Contratante.Cve_Contratante in (''C001'',''C003'',''C020'',''C012'',''C008'',''C042'',''C015'',''C016'',''C004'',''C006'',''C007'')'+
                     ' ORDER BY Cve_Contratante',Objeto.DataBaseName,Objeto.SessionName,False);
    Try
        if q <> nil then
        Begin
            q.First;
            If (q.FieldByName('CVE_CONTRATANTE').asString = 'C001') and (q.FieldByName('CVE_PER_JURIDICA').asString = 'PF') Then
              cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);

            If q.FieldByName('CVE_PER_JURIDICA').asString = 'PF' then
              Objeto.Cve_Per_Juridica.AsString := 'PF'
            else Objeto.Cve_Per_Juridica.AsString := 'PM';

            while (Not q.EOF) do
            Begin
              if q.FieldByName('CVE_CONTRATANTE').asString <> 'C001' then
                      cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);
              q.Next;
            End;
        end
        else
        Begin
            q:= GetSQLQuery(' SELECT Nombre, Cve_Per_Juridica ' +
                            ' FROM Contrato, Persona ' +
                            ' WHERE Id_Titular = Id_Persona '+
                            '   and Contrato.Id_Contrato = '+ Objeto.Id_Contrato.AsString,
                      Objeto.DataBaseName, Objeto.SessionName, False);
            if q <> nil then
            Begin
              cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);
              Objeto.Cve_Per_Juridica.AsString := q.FieldByName('CVE_PER_JURIDICA').asString;
            end;
        end;
    Finally q.free;
    End;

    cbNomCliente.Text := cbNomCliente.Items[0];
    Objeto.Nom_Cliente.AsString := cbNomCliente.Text;
  end
  else Raise EInterFrame.Create('No ha sido asignado un contrato para imprimir');
end;


procedure TwToluca.InterForma1DespuesShow(Sender: TObject);
begin
  Objeto.Nom_Representante.AsString := cbNomRepres.Text;
  Objeto.B_Proemio.AsBoolean   := True;
  Objeto.B_ConvModif.AsBoolean := True;   // CZR 09-Nov-2010

//RAPA 30Nov04  Objeto.B_AcuseAnexos.AsBoolean := True;
  Objeto.B_TarjetaFirmas.AsBoolean := False;
  Objeto.B_Mandato.AsBoolean := (Objeto.Cve_Per_Juridica.AsString = 'PM');
  chbMandato.Visible := (Objeto.Cve_Per_Juridica.AsString = 'PM');
//RAPA 30Nov04  Objeto.B_AcuseProspectos.AsBoolean := (Objeto.Cve_Tipo_Contrato.AsString = 'IFON') OR (Objeto.Cve_Tipo_Contrato.AsString = 'PRBC');
//RAPA 30Nov04  chbProspectos.Visible := (Objeto.Cve_Tipo_Contrato.AsString = 'IFON') OR (Objeto.Cve_Tipo_Contrato.AsString = 'PRBC');
//RAPA 30Nov04  Objeto.B_AnexoBase.AsBoolean := (Objeto.Cve_Tipo_Contrato.AsString = 'IFON') OR (Objeto.Cve_Tipo_Contrato.AsString = 'PRBC');
//RAPA 30Nov04  chbAnexo.Visible := (Objeto.Cve_Tipo_Contrato.AsString = 'IFON') OR (Objeto.Cve_Tipo_Contrato.AsString = 'PRBC');
  Objeto.B_KYC.AsBoolean := True;
  Objeto.B_CGBinter.AsBoolean := True;
end;


Procedure TwToluca.Imprime(Preview: Boolean);
begin
  Objeto.Leyenda.AsString := edLeyenda.Text;
  Objeto.Leyenda_Pie.AsString := edLeyendaPie.Text;
  Objeto.Impresion(Preview);
end;

procedure TwToluca.bbPreliminarClick(Sender: TObject);
begin Imprime(True);
end;

procedure TwToluca.bbImprimirClick(Sender: TObject);
begin Imprime(False);
end;

procedure TwToluca.cbNomClienteClick(Sender: TObject);
begin Objeto.Nom_Cliente.AsString := cbNomCliente.Text;
end;

procedure TwToluca.cbNomRepresClick(Sender: TObject);
begin Objeto.Nom_Representante.AsString := cbNomRepres.Text;
end;

procedure TwToluca.chbProemioClick(Sender: TObject);
begin Objeto.B_Proemio.asBoolean := chbProemio.Checked;
end;

procedure TwToluca.chbProspectosClick(Sender: TObject);
begin //RAPA 30Nov04  Objeto.B_AcuseProspectos.asBoolean := chbProspectos.Checked;
end;

procedure TwToluca.chbAnexoClick(Sender: TObject);
begin //RAPA 30Nov04  Objeto.B_AnexoBase.asBoolean := chbAnexo.Checked;
end;

procedure TwToluca.chbMandatoClick(Sender: TObject);
begin Objeto.B_Mandato.asBoolean := chbMandato.Checked;
end;

procedure TwToluca.chbTarjetaFirmasClick(Sender: TObject);
begin Objeto.B_TarjetaFirmas.asBoolean := chbTarjetaFirmas.Checked;
end;

procedure TwToluca.chbAnexosClick(Sender: TObject);
begin //RAPA 30Nov04  Objeto.B_AcuseAnexos.asBoolean := chbAnexos.Checked;
end;

procedure TwToluca.chbKYCClick(Sender: TObject);
begin Objeto.B_KYC.asBoolean := chbKYC.Checked;
end;

procedure TwToluca.ckCGBinterClick(Sender: TObject);
begin
  Objeto.B_CGBinter.asBoolean := ckCGBinter.Checked;
end;

procedure TwToluca.ckConvenioClick(Sender: TObject);
begin
   Objeto.B_ConvModif.asBoolean := ckConvenio.Checked;   // CZR 09-Nov-2010
end;
end.
