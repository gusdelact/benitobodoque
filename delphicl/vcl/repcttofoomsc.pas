unit repcttofoOMSC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UnGene,
  InterApl, StdCtrls, Buttons, quickrpt, InterFor, IntFrm, UnSQL2, db, dbtables,
  IntCtto, IntRepresenta, ComCtrls, ExtCtrls, QRCtrls, InterMemo, InterEdit;

const
  // CZR 07-Dic-2010
  cCelebraOp  : String = 'CEO';
  cConfirmaOp : String = 'COO';

type
  TOMSC=Class;

  TwOMSC = class(TForm)
    InterForma1: TInterForma;
    GroupBox1: TGroupBox;
    chbProemio: TCheckBox;
    chbOtro: TCheckBox;
    chbMandato: TCheckBox;
    QContratos: TQuery;
    QContratosCVE_CONCEP_CTO: TStringField;
    QContratosCONTRATO: TStringField;
    QContratosFECHA_CONTRATO: TStringField;
    QContratosB_PROSPECTO: TStringField;
    ckCGBinter: TCheckBox;
    chbMdoDinero: TCheckBox;
    pcTabOpciones: TPageControl;
    TabGeneral: TTabSheet;
    TabMarMdoDinero: TTabSheet;
    Label2: TLabel;
    cbNomCliente: TComboBox;
    Label1: TLabel;
    lvRepresentantes: TListView;
    Label4: TLabel;
    edLeyenda: TMemo;
    Label5: TLabel;
    edLeyendaPie: TMemo;
    gbEntEspecificadas: TGroupBox;
    lEntEspA: TLabel;
    lEntEspB: TLabel;
    edEntEspA: TEdit;
    edEntEspB: TEdit;
    rgPacTraPro: TRadioGroup;
    lPacTraPro: TLabel;
    lRep_Principal: TLabel;
    cbRepPrincipal: TComboBox;
    dtpFecha: TDateTimePicker;
    lFecha: TLabel;
    procedure bbPreliminarClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbNomClienteClick(Sender: TObject);
    procedure chbProemioClick(Sender: TObject);
    procedure chbOtroClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chbMandatoClick(Sender: TObject);
    procedure ckCGBinterClick(Sender: TObject);
    procedure chbMdoDineroClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  protected
  public
    Objeto: TOMSC;
    Procedure Imprime(Preview: Boolean);
  published
  end;


  TOMSC = class(TInterFrame)
  private
    // CZR 07-Dic-2010
    FContrato     : TContrato;
    vTabOpciones  : TPageControl;
    vRepPrincipal : TComboBox;
    vFecha        : TDateTimePicker;    

  protected
    procedure SetContrato(pContrato: TContrato); // CZR 07-Dic-2010

  public
    B_CGBinter: TInterCampo;
    Id_Contrato:      TInterCampo;
    Id_Ctto: 	      TInterCampo;
    Nom_Contrato:     TInterCampo;
    F_Alta:    	TInterCampo;

    Cto_Aux: TInterCampo;
    Fecha_Contrato: TInterCampo;
    B_Prospecto: TInterCampo;

    Nom_Representante: TInterCampo;
    Nom_Cliente:       TInterCampo;
    Leyenda:           TInterCampo;
    Leyenda_Pie:       TInterCampo;
    Cve_Per_Juridica:  TInterCampo;
    B_Proemio:         TInterCampo;
    B_Mandato:      	  TInterCampo;
    B_Otro:    	     TInterCampo;

    // CZR 06-Dic-2010
    B_MdoDinero       : TInterCampo;
    Ent_EspecificadaA : TInterCampo;
    Ent_EspecificadaB : TInterCampo;
    Pacto_Transmision : TInterCampo;
    Rep_Principal     : TInterCampo;
    //----------------------------------
    Representantes    : TRepresent;

    RepCompuesto: TQRCompositeReport;  
    // CZR 07-Dic-2010
    property Contrato      : TContrato       read FContrato     write SetContrato;
    property pTabOpciones  : TPageControl    read vTabOpciones  write vTabOpciones;
    property pRepPrincipal : TComboBox       read vRepPrincipal write vRepPrincipal;
    property pFecha        : TDateTimePicker read vFecha        write vFecha;

    constructor Create( AOwner : TComponent ); override;
    destructor destroy; override;
    Procedure DatabaseChange; override;
    Procedure Impresion(Preview: Boolean);
    Function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

  end;

  procedure ImpresionProemioMDin(pContrato: TContrato); // CZR 07-Dic-2010

var
  wOMSC: TwOMSC;

implementation

uses
  RepCttoOMSCPFN,     { Proemio P Físicas }
  RepCttoOMSCPMN,     { Proemio P Morales }
  RepCttoproPMNFOMSC, { Hoja de Firmas Proemio }
  RepCttoOMSCMandato, { Mandato }
  RepCtto2,           { Complemento al Proemio }
  UnRpCGBinterPF,     { Reporte de Cartas Genéricas de Personas Físicas }
  UnRpCGBinterPM,     { Reporte de Cartas Genéricas de Personas Morales }
  UnRpMarMerDin;      { Reporte de Marco de Mercado de Dinero }
{$R *.DFM}

procedure ImpresionProemioMDin(pContrato: tContrato);
var
   Proemio: TOMSC;
Begin
   Proemio:= TOMSC.Create(nil);
   try
      Proemio.Apli     := pContrato.Apli;
      Proemio.Contrato := pContrato;
      Proemio.ShowWindow(ftImprimir);
   finally
      Proemio.Free;
      Proemio := nil;
   end;
end;

procedure TOMSC.SetContrato(pContrato: TContrato);
begin
   FContrato := pContrato;
   if (pContrato <> nil) and (pContrato.Active) then
   begin
      Id_Contrato.AsInteger := pContrato.ID_Contrato.asInteger;
      Id_Ctto.AsInteger     := StrToInt(Copy(pContrato.Id_Contrato.AsString, 2, 9));
      Nom_Contrato.AsString := pContrato.TITNOMBRE.AsString;
      F_Alta.AsDateTime     := pContrato.F_Alta.AsDateTime;
   end;
end;

constructor TOMSC.Create( AOwner : TComponent );
begin
  inherited;

  { Asignados desde TContrato }
  B_CGBinter        := CreaCampo('B_CGBINTER', ftString, tsNinguno, tsNinguno, False);
  Id_Contrato	     := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
  Id_Ctto		     := CreaCampo('ID_CTTO',ftInteger,tsNinguno,tsNinguno,False);
  Nom_Contrato      := CreaCampo('NOM_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
  F_Alta		        := CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,False);

  { Asignados desde QContratos }
  Cto_Aux           := CreaCampo('CTO_AUX', ftString, tsNinguno, tsNinguno, False);
  Fecha_Contrato    := CreaCampo('FECHA_CONTRATO', ftString, tsNinguno, tsNinguno, False);
  B_Prospecto       := CreaCampo('B_PROSPECTO', ftString, tsNinguno, tsNinguno, False);

  Nom_Representante := CreaCampo('NOM_REPRESENTANTE',ftInteger,tsNinguno,tsNinguno,False);
  Nom_Cliente	     := CreaCampo('NOM_CLIENTE',ftInteger,tsNinguno,tsNinguno,False);
  Leyenda           := CreaCampo('LEYENDA',ftString,tsNinguno,tsNinguno,False);
  Leyenda_Pie       := CreaCampo('LEYENDA_PIE',ftString,tsNinguno,tsNinguno,False);
  Cve_Per_Juridica  := CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,False);

  B_Proemio	        := CreaCampo('B_PROEMIO',ftBoolean,tsNinguno,tsNinguno,False);
  B_Mandato	        := CreaCampo('B_MANDATO',ftBoolean,tsNinguno,tsNinguno,False);
  B_Otro		        := CreaCampo('B_OTRO',ftBoolean,tsNinguno,tsNinguno,False);

  // CZR 06-Dic-2010
  B_MdoDinero       := CreaCampo('B_MDODINERO',       ftBoolean, tsNinguno, tsNinguno, False);
  Ent_EspecificadaA := CreaCampo('ENT_ESPECIFICADAA', ftString,  tsNinguno, tsNinguno, False);
  Ent_EspecificadaB := CreaCampo('ENT_ESPECIFICADAB', ftString,  tsNinguno, tsNinguno, False);
  Pacto_Transmision := CreaCampo('PACTO_TRANSMISION', ftString,  tsNinguno, tsNinguno, False);
  with Pacto_Transmision do
  begin
    UseCombo := True;
    ComboDatos.Add('Si');   ComboLista.Add('0');
    ComboDatos.Add('No');   ComboLista.Add('1');
  end;
  Rep_Principal     := CreaCampo('REP_PRINCIPAL',     ftString,  tsNinguno, tsNinguno, False);
  // -------------------------------------------------------------------------------------------------
  Representantes    := TRepresent.Create(Self);

  Id_Contrato.AsInteger := -1;
  IsCheckSecu           := False;
end;

destructor TOMSC.destroy;
begin
   inherited;
end;

procedure TOMSC.DatabaseChange;
begin
   inherited;
   Representantes.GetParams(Self);    // CZR 07-Dic-2010
end;

function  TOMSC.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var
  W   : TwOMSC;
  Qry : TQuery; // CZR 07-Dic-2010
begin
  W:=TwOMSC.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.CentrarForma := True;
    W.InterForma1.FormaTipo := ftImprimir;

    // CZR 07-Dic-2010
    W.cbRepPrincipal.Items.Clear;
    try
       Qry := GetSqlQuery(' SELECT PERSONA.NOMBRE, '
                        + '        DIREC_EMPLEADO.E_MAIL_OFIC '
                        + ' FROM REPRESENTANTE, '
                        + '      PERSONA, '
                        + '      DIREC_EMPLEADO '
                        + ' WHERE REPRESENTANTE.TIPO_PROEMIO   = ''' + cConfirmaOp + ''''
                        + '   AND REPRESENTANTE.SIT_REPRESENTA = ''AC'''
                        + '   AND REPRESENTANTE.ID_PERSONA     = PERSONA.ID_PERSONA '
                        + '   AND PERSONA.ID_PERSONA           = DIREC_EMPLEADO.ID_EMPLEADO '
                        + '   AND PERSONA.SIT_PERSONA          = ''AC''',
                          Apli.DataBaseName, Apli.SessionName, True);
      if Qry <> nil then
      begin
         Rep_Principal.UseCombo := True;
         while not Qry.eof do
         begin
            W.cbRepPrincipal.Items.Add(trim(Qry.FieldByName('NOMBRE').AsString));
            Rep_Principal.ComboLista.Add(trim(Qry.FieldByName('NOMBRE').AsString));
            Rep_Principal.ComboDatos.Add(trim(Qry.FieldByName('E_MAIL_OFIC').AsString));
            Qry.next;
         end;
         W.cbRepPrincipal.ItemIndex := 1;
      end;
    finally
       if Qry <> nil then
          Qry.Free;
    end;

    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

Procedure TOMSC.Impresion(Preview: Boolean);
// CZR 07-Dic-2010
const
   cEnter            : String = #13#10;
   cCtaPropiaIndeval : String = '0081 Prenda Bursátil sin transmisión de propiedad';

var
   RpPF        : TrpCGBPF;
   RpPM        : TrpCGBPM;

   // CZR 07-Dic-2010
   RpMarMerDin : TrpMarMerDin;
   Qry         : TQuery;
   n           : Integer;
   vContador   : Integer;
   vConAux1    : Integer;
   vConAux2    : Integer;

   vlSEmpresa          : String;
   vlSNombre           : String;
   vlSTipoCto          : String;
   vlSDescTipoCto      : String;
   vlsDiscrecionalidad : String;
begin

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

          RpPM.QRInterMemo2.Parametro.Strings[0]:= Nom_Cliente.AsString;        // Nom_Representante.AsString;
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
                     '  WHERE ID_CONTRATO = ' + Id_Contrato.AsString +
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
                    '  WHERE ID_CONTRATO = ' + IntToStr(Id_Contrato.AsInteger) +
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

  { Impresión del Proemio }
  If B_Proemio.AsBoolean Then
  Begin
    If Cve_Per_Juridica.AsString = 'PF' Then Execute_RepOMSCPFN(self, Preview)
    else If Cve_Per_Juridica.AsString = 'PM' Then Execute_RepOMSCPMN(self, Preview)
    else MessageDlg('La personalidad Juridica del Titular es Desconocida',mtError, [mbOK],0);

    { Impresión de la Hoja de Firmas }
    If B_Prospecto.AsString = 'V' Then
      Execute_RepCttoproPMNFOMSC(True, Self, Nom_Representante.AsString,
        Nom_Cliente.AsString, Fecha_Contrato.AsString)
    else
      Execute_RepCttoproPMNFOMSC(True, Self, Nom_Representante.AsString,
        Nom_Cliente.AsString, FmtFecha(Fecha_Contrato.asDateTime, '@DD-@MMM-@YYYY'));
  end;

  { Impresión del Mandato }
  if B_Mandato.AsBoolean Then Execute_RepOMSCMandato(self, Preview);

  { Impresión del Complemento }
  If B_Otro.AsBoolean Then Execute_RepCtto2(True, Self, Id_contrato.AsInteger);

  { Impresión de Marco de Mercado de Dinero } // CZR 06-Dic-2010
  if B_MdoDinero.AsBoolean then
     with RpMarMerDin do
     begin
        RpMarMerDin          := TrpMarMerDin.Create(Self);
        QryCtto.Active       := False;
        QryCtto.DatabaseName := DataBaseName;
        QryCtto.SessionName  := SessionName;
        QryCtto.ParamByName('ID_CONTRATO').AsInteger := Contrato.Id_Contrato.AsInteger;
        QryCtto.Active       := True;
        GetFromControl;

        // ***** Pagina 1 *****
        QRLabel1.Caption   := 'Contrato No. ' + IntToStr(Contrato.Id_Contrato.AsInteger);
        QRLabel3.Caption   := UpperCase(FmtFecha(pFecha.DateTime, 'FECHA @D DE @MMMM DE @YYYY CELEBRAN:'));
        QRLabel4.Caption   := Contrato.Empresa.Nombre.AsString;
        QRLabel7.Caption   := Contrato.Titular.Nombre.AsString;

        // ***** Pagina 22 *****
        QRLabel134.Caption := Contrato.Empresa.Nombre.AsString;
        QRLabel136.Caption := Contrato.Titular.Nombre.AsString;
        // Pagina 28
        QRLabel234.Caption := Contrato.Empresa.Nombre.AsString;
        QRLabel236.Caption := Contrato.Titular.Nombre.AsString;

        // Apoderados A
        QRMacvMemo112.Textos.Clear;
        QRMacvMemo112.Textos.Add('Apoderado(s)');
        // Pagina 28
        QRMacvMemo153.Textos.Clear;
        QRMacvMemo153.Textos.Add('Apoderado(s)');

        for n := 0 to Representantes.ListRepresenta.Items.Count-1 do
           if Representantes.ListRepresenta.Items[n].Checked then
           begin
              QRMacvMemo112.Textos.Add(cEnter);
              QRMacvMemo112.Textos.Add(cEnter);
              QRMacvMemo112.Textos.Add(cEnter);
              QRMacvMemo112.Textos.Add('__________________________________________   ' + BonitoStr(Representantes.ListRepresenta.Items[n].Caption));
              // Pagina 28
              QRMacvMemo153.Textos.Add(cEnter);
              QRMacvMemo153.Textos.Add(cEnter);
              QRMacvMemo153.Textos.Add(cEnter);
              QRMacvMemo153.Textos.Add('__________________________________________   ' + BonitoStr(Representantes.ListRepresenta.Items[n].Caption));
           end;
           
        // Apoderados B
        vContador := 0;
        vConAux1  := 0;
        vConAux2  := 0;
        Qry       := GetSQLQuery(' SELECT CTE.CVE_CONTRATANTE, PER.NOMBRE '
                               + ' FROM CONTRATANTE CTE, '
                               + '      PERSONA     PER '
                               + ' WHERE CTE.ID_CONTRATO      = ' + Contrato.Id_Contrato.AsSQL
                               + '   AND CTE.ID_PERSONA       = PER.ID_PERSONA '
                               + '   AND CTE.CVE_CONTRATANTE IN (''C004'', ''C100'', ''C101'')' // Apoderados, Celebran Op. y Confirman Op.
                               + ' ORDER BY CTE.CVE_CONTRATANTE',
                                 DataBaseName, SessionName, False);
        try
           if Qry <> nil then
           begin
              QRMacvMemo124.Textos.Clear;
              QRMacvMemo124.Textos.Add('Apoderado(s)');
              // Pagina 23
              QRMacvMemo132.Textos.Clear;
              QRMacvMemo137.Textos.Clear;
              // Pagina 28
              QRMacvMemo154.Textos.Clear;
              QRMacvMemo154.Textos.Add('Apoderado(s)');

              while not Qry.eof do
              begin
                 // Pagina 23     Contratantes para Celebrar y Confirmar Operaciones
                 if (trim(Qry.FieldByName('CVE_CONTRATANTE').AsString) = 'C100') or (trim(Qry.FieldByName('CVE_CONTRATANTE').AsString) = 'C101') then
                 begin
                    if trim(Qry.FieldByName('CVE_CONTRATANTE').AsString) = 'C100' then
                    begin
                       if vConAux1 < 3 then
                       begin
                          QRMacvMemo137.Textos.Add(cEnter);
                          QRMacvMemo137.Textos.Add(cEnter);
                          QRMacvMemo137.Textos.Add(cEnter);
                          QRMacvMemo137.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                       end
                       else
                       begin
                          QRMacvMemo136.Textos.Add(cEnter);
                          QRMacvMemo136.Textos.Add(cEnter);
                          QRMacvMemo136.Textos.Add(cEnter);
                          QRMacvMemo136.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                       end;
                       inc(vConAux1);
                    end;
                    if trim(Qry.FieldByName('CVE_CONTRATANTE').AsString) = 'C101' then
                    begin
                       QRMacvMemo132.Textos.Add(cEnter);
                       QRMacvMemo132.Textos.Add(cEnter);
                       QRMacvMemo132.Textos.Add(cEnter);
                       QRMacvMemo132.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                       inc(vConAux2);
                    end;
                 end
                 else
                 begin
                    if vContador < 6 then
                    begin
                       QRMacvMemo124.Textos.Add(cEnter);
                       QRMacvMemo124.Textos.Add(cEnter);
                       QRMacvMemo124.Textos.Add(cEnter);
                       QRMacvMemo124.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                       // Pagina 28
                       QRMacvMemo154.Textos.Add(cEnter);
                       QRMacvMemo154.Textos.Add(cEnter);
                       QRMacvMemo154.Textos.Add(cEnter);
                       QRMacvMemo154.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                       inc(vContador);                       
                    end;
                 end;
                 Qry.next;
              end;
              // Pagina 23     Contratantes para Celebrar y Confirmar Operaciones
              while vConAux1 < 3 do
              begin
                 QRMacvMemo137.Textos.Add(cEnter);
                 QRMacvMemo137.Textos.Add(cEnter);
                 QRMacvMemo137.Textos.Add(cEnter);
                 QRMacvMemo137.Textos.Add('__________________________________________   ');
                 inc(vConAux1);
              end;
              while vConAux1 < 6 do
              begin
                 QRMacvMemo136.Textos.Add(cEnter);
                 QRMacvMemo136.Textos.Add(cEnter);
                 QRMacvMemo136.Textos.Add(cEnter);
                 QRMacvMemo136.Textos.Add('__________________________________________   ');
                 inc(vConAux1);
              end;
              while vConAux2 < 6 do
              begin
                 QRMacvMemo132.Textos.Add(cEnter);
                 QRMacvMemo132.Textos.Add(cEnter);
                 QRMacvMemo132.Textos.Add(cEnter);
                 QRMacvMemo132.Textos.Add('__________________________________________   ');
                 inc(vConAux2);
              end;

              while vContador < 6 do
              begin
                 QRMacvMemo124.Textos.Add(cEnter);
                 QRMacvMemo124.Textos.Add(cEnter);
                 QRMacvMemo124.Textos.Add(cEnter);
                 QRMacvMemo124.Textos.Add('__________________________________________   ');
                 // Pagina 28
                 QRMacvMemo154.Textos.Add(cEnter);
                 QRMacvMemo154.Textos.Add(cEnter);
                 QRMacvMemo154.Textos.Add(cEnter);
                 QRMacvMemo154.Textos.Add('__________________________________________   ');
                 inc(vContador);
              end;
           end;
        finally
           if Qry <> nil then
              Qry.Free;
        end;

        // ***** Pagina 23 y 24 *****
        with QRMacvMemo125.Textos do
        begin
           Clear;
           Add('SUPLEMENTO AL CONTRATO MARCO PARA OPERACIONES DE COMPRAVENTA DE');
           Add(cEnter);
           Add(UpperCase(FmtFecha(pFecha.DateTime, 'VALORES Y REPORTO CELEBRADO CON FECHA @D DE @MMMM DE @YYYY')));
           Add(cEnter);
           Add('ENTRE');
        end;
        QRLabel137.Caption := Contrato.Empresa.Nombre.AsString;
        QRLabel139.Caption := Contrato.Titular.Nombre.AsString;

        // Representantes de Marco de Mercado de Dinero para Celebrar y Confirmar Operaciones (Se consideran todos los Representantes de c/u)
        vContador := 0;
        vConAux1  := 0;
        QRMacvMemo128.Textos.Clear;
        QRMacvMemo131.Textos.Clear;

        Qry := GetSQLQuery(' SELECT REP.TIPO_PROEMIO, PER.NOMBRE '
                         + ' FROM REPRESENTANTE REP, '
                         + '      PERSONA       PER '
                         + ' WHERE REP.TIPO_PROEMIO IN (''' + cCelebraOp + ''', ''' + cConfirmaOp + ''')'
                         + '   AND REP.ID_PERSONA    = PER.ID_PERSONA',
                           DataBaseName, SessionName, False);
        try
           if Qry <> nil then
              while not Qry.eof do
              begin
                 if trim(Qry.FieldByName('TIPO_PROEMIO').AsString) = cCelebraOp then
                 begin
                    QRMacvMemo128.Textos.Add(cEnter);
                    QRMacvMemo128.Textos.Add(cEnter);
                    QRMacvMemo128.Textos.Add(cEnter);
                    QRMacvMemo128.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                    inc(vContador);
                 end;
                 if trim(Qry.FieldByName('TIPO_PROEMIO').AsString) = cConfirmaOp then
                 begin
                    QRMacvMemo131.Textos.Add(cEnter);
                    QRMacvMemo131.Textos.Add(cEnter);
                    QRMacvMemo131.Textos.Add(cEnter);
                    QRMacvMemo131.Textos.Add('__________________________________________   ' + BonitoStr(Qry.FieldByName('NOMBRE').AsString));
                    inc(vConAux1);
                 end;
                 Qry.next;
              end;
        finally
           if Qry <> nil then
              Qry.Free;
        end;
        while vContador < 6 do
        begin
           QRMacvMemo128.Textos.Add(cEnter);
           QRMacvMemo128.Textos.Add(cEnter);
           QRMacvMemo128.Textos.Add(cEnter);
           QRMacvMemo128.Textos.Add('__________________________________________   ');
           inc(vContador);
        end;
        while vConAux1 < 6 do
        begin
           QRMacvMemo131.Textos.Add(cEnter);
           QRMacvMemo131.Textos.Add(cEnter);
           QRMacvMemo131.Textos.Add(cEnter);
           QRMacvMemo131.Textos.Add('__________________________________________   ');
           inc(vConAux1);
        end;

        // ***** Pagina 25 *****
        // Entidades Especificadas
        if trim(Ent_EspecificadaA.AsString) = '' then    QRLabel160.Caption := 'No aplica'
        else                                             QRLabel160.Caption := trim(Ent_EspecificadaA.AsString);
        if trim(Ent_EspecificadaB.AsString) = '' then    QRLabel161.Caption := 'No aplica'
        else                                             QRLabel161.Caption := trim(Ent_EspecificadaB.AsString);

        // Lugar de Pago y Cuentas (parte "A")
        QRLabel175.Caption := '';
        QRLabel167.Caption := '';
        QRLabel210.Caption := '';
        QRLabel245.Caption := '';
        QRLabel168.Caption := '';
        QRLabel172.Caption := '';
        QRLabel177.Caption := '';
        QRLabel174.Caption := '';
        QRLabel223.Caption := '';

        if Contrato.Id_Empresa.AsInteger = 2 then
        begin
           QRLabel168.Caption := BonitoStr(Contrato.Empresa.Nombre.AsString);
           QRLabel174.Caption := BonitoStr(Contrato.Empresa.Nombre.AsString);
        end;

        Qry := GetSQLQuery(' SELECT CVE_VIA_LIQCION, CTA_SIST_INTERM, TIPO_CTA_INTERM, '
                         + '        DECODE(CVE_VIA_LIQCION, ''MDOSEC'', SUBSTR(CTA_SIST_INTERM, LENGTH(CTA_SIST_INTERM)-3, LENGTH(CTA_SIST_INTERM)), '
                         + '                                            CTA_SIST_INTERM) AS CTA_SIST_INTERM_AUX, '
                         + '        (CASE WHEN TIPO_CTA_INTERM = ''PR'' THEN ''Propia'''
                         + '              WHEN TIPO_CTA_INTERM = ''TR'' THEN ''Terceros'''
                         + '              ELSE                               CVE_VIA_LIQCION'
                         + '         END) AS DESC_TIPO_CTA '
                         + ' FROM CTA_VIA_LIQCION '
                         + ' WHERE CVE_VIA_LIQCION IN (''INDEVAL'', ''MDOSEC'', ''SAIF'', ''SIAC'') '
                         + '   AND ID_INTERMEDIARIO = ' + Contrato.Id_Empresa.AsSQL
                         + ' ORDER BY CVE_VIA_LIQCION, TIPO_CTA_INTERM',
                           DataBaseName, SessionName, False);
        try
           if Qry <> nil then
           begin
              while not Qry.eof do
              begin
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'INDEVAL' then
                 begin
                    QRLabel175.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                    QRLabel167.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);

                    // Pagina 28
                    QRLabel223.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' ' + cCtaPropiaIndeval;
                 end;
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'MDOSEC' then
                 begin
                    if trim(Qry.FieldByName('TIPO_CTA_INTERM').AsString) = 'PR' then
                       QRLabel210.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' - ' + trim(Qry.FieldByName('DESC_TIPO_CTA').AsString)
                    else
                       QRLabel245.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' - ' + trim(Qry.FieldByName('DESC_TIPO_CTA').AsString);
                 end;
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'SIAC' then
                    QRLabel172.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'SAIF' then
                    QRLabel177.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                 Qry.next;
              end;
           end;
        finally
           if Qry <> nil then
              Qry.Free;
        end;

        // Lugar de Pago y Cuentas (parte "B")
        QRLabel181.Caption := '';
        QRLabel182.Caption := '';
        QRLabel191.Caption := '';
        QRLabel192.Caption := '';
        QRLabel183.Caption := '';
        QRLabel187.Caption := '';
        QRLabel189.Caption := '';
        QRLabel190.Caption := '';
        QRLabel231.Caption := '';

        if Contrato.Id_Empresa.AsInteger = 2 then
        begin
           QRLabel183.Caption := BonitoStr(Contrato.Empresa.Nombre.AsString);
           QRLabel190.Caption := BonitoStr(Contrato.Empresa.Nombre.AsString);
        end;

        Qry := GetSQLQuery(' SELECT CVE_VIA_LIQCION, CTA_SIST_INTERM, TIPO_CTA_INTERM, '
                         + '        DECODE(CVE_VIA_LIQCION, ''MDOSEC'', SUBSTR(CTA_SIST_INTERM, LENGTH(CTA_SIST_INTERM)-3, LENGTH(CTA_SIST_INTERM)), '
                         + '                                            CTA_SIST_INTERM) AS CTA_SIST_INTERM_AUX, '
                         + '        (CASE WHEN TIPO_CTA_INTERM = ''PR'' THEN ''Propia'''
                         + '              WHEN TIPO_CTA_INTERM = ''TR'' THEN ''Terceros'''
                         + '              ELSE                               CVE_VIA_LIQCION'
                         + '         END) AS DESC_TIPO_CTA '
                         + ' FROM CTA_VIA_LIQCION '
                         + ' WHERE CVE_VIA_LIQCION IN (''INDEVAL'', ''MDOSEC'', ''SAIF'', ''SIAC'') '
                         + '   AND ID_INTERMEDIARIO = ' + Contrato.Id_Titular.AsSQL
                         + ' ORDER BY CVE_VIA_LIQCION, TIPO_CTA_INTERM',
                           DataBaseName, SessionName, False);
        try
           if Qry <> nil then
           begin
              while not Qry.eof do
              begin
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'INDEVAL' then
                 begin
                    QRLabel181.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                    QRLabel182.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);

                    // Pagina 28
                    QRLabel231.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' ' + cCtaPropiaIndeval;
                 end;
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'MDOSEC' then
                 begin
                    if trim(Qry.FieldByName('TIPO_CTA_INTERM').AsString) = 'PR' then
                       QRLabel191.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' - ' + trim(Qry.FieldByName('DESC_TIPO_CTA').AsString)
                    else
                       QRLabel192.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' - ' + trim(Qry.FieldByName('DESC_TIPO_CTA').AsString);
                 end;
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'SIAC' then
                    QRLabel187.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                 if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'SAIF' then
                    QRLabel189.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                 Qry.next;
              end;
           end;
        finally
           if Qry <> nil then
              Qry.Free;
        end;

        // ***** Pagina 27 *****
        // Pacto de Transmision de Propiedad
        if trim(Pacto_Transmision.AsString) = 'Si' then
        begin
           QRLabel108.Caption := 'X';
           QRLabel211.Caption := '';
        end
        else
        begin
           QRLabel108.Caption := '';
           QRLabel211.Caption := 'X';
        end;

        // ***** Pagina 28 *****
        // Nivel de Mantenimiento Y Monto Minimo de Transferencia
        QRMacvMemo198.Textos.Clear;
        QRMacvMemo199.Textos.Clear;
        QRMacvMemo200.Textos.Clear;
        QRMacvMemo201.Textos.Clear;
        
        // Por orden de Mario Velazco, se quedo en codigo duro la manera de distinguir la Casa de Bolsa y el Banco en las Contrapartes.
        vContador := 1;
        Qry := GetSQLQuery(' SELECT * '
                         + ' FROM VG_CONTRAPARTE '
                         + ' WHERE ID_CONTRAPARTE = ' + Contrato.Id_Empresa.AsSQL
                         + '   AND FOLIO_INDEVAL  = DECODE(' + IntToStr(Contrato.Id_Empresa.AsInteger) + ', 1,   15,   23) '
                         + '   AND CUENTA_INDEVAL = DECODE(' + IntToStr(Contrato.Id_Empresa.AsInteger) + ', 1, 1917, 7500) '
                         + ' ORDER BY FOLIO_INDEVAL, CUENTA_INDEVAL',
                           DataBaseName, SessionName, False);
        try
           if Qry <> nil then
              while not Qry.eof do
              begin
                 if vContador > 1 then
                 begin
                    QRMacvMemo198.Textos.Add(cEnter);
                    QRMacvMemo200.Textos.Add(cEnter);
                 end;
                 if Qry.FieldByName('NIVEL_MANTENIM').AsInteger = 0 then
                    QRMacvMemo198.Textos.Add('$ Cero')
                 else
                    QRMacvMemo198.Textos.Add('$ ' + FormatFloat('#,', Qry.FieldByName('NIVEL_MANTENIM').AsFloat));
                 if Qry.FieldByName('MONTO_MIN_TRANS').AsInteger = 0 then
                    QRMacvMemo200.Textos.Add('$ Cero')
                 else
                    QRMacvMemo200.Textos.Add('$ ' + FormatFloat('#,', Qry.FieldByName('MONTO_MIN_TRANS').AsFloat));                    
                 inc(vContador);
                 Qry.Next;
              end;
        finally
           if Qry <> nil then
              Qry.Free;
        end;

        // Contraparte de Contrato
        vContador := 1;
        Qry := GetSQLQuery(' SELECT CON.* '
                         + ' FROM VG_CONTRAP_CTO CTO, '
                         + '      VG_CONTRAPARTE CON '
                         + ' WHERE CTO.ID_CONTRATO    = ' + Contrato.ID_Contrato.AsSQL
                         + '   AND CTO.ID_CONTRAPARTE = CON.ID_CONTRAPARTE '
                         + '   AND CTO.FOLIO_INDEVAL  = CON.FOLIO_INDEVAL '
                         + '   AND CTO.CUENTA_INDEVAL = CON.CUENTA_INDEVAL'
                         + ' ORDER BY CON.FOLIO_INDEVAL, CON.CUENTA_INDEVAL',
                           DataBaseName, SessionName, False);
        try
           if Qry <> nil then
              while not Qry.eof do
              begin
                 if vContador > 1 then
                 begin
                    QRMacvMemo199.Textos.Add(cEnter);
                    QRMacvMemo201.Textos.Add(cEnter);
                 end;
                 if Qry.FieldByName('NIVEL_MANTENIM').AsInteger = 0 then
                    QRMacvMemo199.Textos.Add('$ Cero')
                 else
                    QRMacvMemo199.Textos.Add('$ ' + FormatFloat('#,', Qry.FieldByName('NIVEL_MANTENIM').AsFloat));
                 if Qry.FieldByName('MONTO_MIN_TRANS').AsInteger = 0 then
                    QRMacvMemo201.Textos.Add('$ Cero')
                 else
                    QRMacvMemo201.Textos.Add('$ ' + FormatFloat('#,', Qry.FieldByName('MONTO_MIN_TRANS').AsFloat));
                 inc(vContador);                    
                 Qry.Next;
              end;
        finally
           if Qry <> nil then
              Qry.Free;
        end;

        // Domicilio Parte "A"
        with QRMacvMemo149.Textos do
        begin
          Clear;
          Qry := GetSQLQuery(' SELECT DOM.CALLE_NUMERO, '
                           + '        COL.DESC_POBLACION  AS COLONIA, '
                           + '        EDO.DESC_POBLACION  AS ESTADO, '
                           + '        DOM.CODIGO_POSTAL   AS CP, '
                           + '        PAIS.DESC_POBLACION AS PAIS, '
                           + '        PER.TELEF_OFICINA   AS TEL_OFICINA, '
                           + '        PER.TELEF_FAX       AS TEL_FAX '
                           + ' FROM PERSONA   PER, '
                           + '      DOMICILIO DOM, '
                           + '      POBLACION COL, '
                           + '      POBLACION EDO, '
                           + '      POBLACION PAIS '
                           + ' WHERE PER.ID_PERSONA   = 1 '
                           + '   AND PER.ID_DOMICILIO = DOM.ID_DOMICILIO '
                           + '   AND DOM.CVE_CIUDAD   = COL.CVE_POBLACION '
                           + '   AND DOM.CVE_ESTADO   = EDO.CVE_POBLACION '
                           + '   AND DOM.CVE_PAIS     = PAIS.CVE_POBLACION',
                             DataBaseName, SessionName, False);
           try
              if Qry <> nil then         
              begin
                Add(BonitoStr(Qry.FieldByName('CALLE_NUMERO').AsString) + ' Col. ' + BonitoStr(Qry.FieldByName('COLONIA').AsString));
                Add(cEnter);
                Add(BonitoStr(Qry.FieldByName('PAIS').AsString) + ', ' + BonitoStr(Qry.FieldByName('ESTADO').AsString) + ' C.P. ' + BonitoStr(Qry.FieldByName('CP').AsString));
                Add(cEnter);
                Add('Atn: ' +  BonitoStr(pRepPrincipal.Text));
                Add(cEnter);
                Add('Area: Back Office');
                Add(cEnter);
                Add('Tel: ' + BonitoStr(Qry.FieldByName('TEL_OFICINA').AsString));
                Add(cEnter);
                Add('Correo: ' + trim(Rep_Principal.AsString));
                Add(cEnter);
                Add('Fax: ' + BonitoStr(Qry.FieldByName('TEL_FAX').AsString));
              end;
           finally
              if Qry <> nil then
                 Qry.Free;
           end;
        end;

        // Domicilio Parte "B"
        with QRMacvMemo151.Textos do
        begin
          Clear;
          Qry := GetSQLQuery(' SELECT DOM.CALLE_NUMERO, '
                           + '        COL.DESC_POBLACION  AS COLONIA, '
                           + '        EDO.DESC_POBLACION  AS ESTADO, '
                           + '        DOM.CODIGO_POSTAL   AS CP, '
                           + '        PAIS.DESC_POBLACION AS PAIS, '
                           + '        PER.TELEF_OFICINA   AS TEL_OFICINA, '
                           + '        PER.TELEF_FAX       AS TEL_FAX '
                           + ' FROM PERSONA   PER, '
                           + '      DOMICILIO DOM, '
                           + '      POBLACION COL, '
                           + '      POBLACION EDO, '
                           + '      POBLACION PAIS '
                           + ' WHERE PER.ID_PERSONA   = ' + Contrato.Id_Titular.AsSQL
                           + '   AND PER.ID_DOMICILIO = DOM.ID_DOMICILIO '
                           + '   AND DOM.CVE_CIUDAD   = COL.CVE_POBLACION '
                           + '   AND DOM.CVE_ESTADO   = EDO.CVE_POBLACION '
                           + '   AND DOM.CVE_PAIS     = PAIS.CVE_POBLACION',
                             DataBaseName, SessionName, False);
           try
              if Qry <> nil then
              begin
                Add(BonitoStr(Qry.FieldByName('CALLE_NUMERO').AsString) + ' Col. ' + BonitoStr(Qry.FieldByName('COLONIA').AsString));
                Add(cEnter);
                Add(BonitoStr(Qry.FieldByName('PAIS').AsString) + ', ' + BonitoStr(Qry.FieldByName('ESTADO').AsString) + ' C.P. ' + BonitoStr(Qry.FieldByName('CP').AsString));
                Add(cEnter);
                Add('Tel: ' + BonitoStr(Qry.FieldByName('TEL_OFICINA').AsString));
                Add(cEnter);
                Add('Fax: ' + BonitoStr(Qry.FieldByName('TEL_FAX').AsString));
              end;
           finally
              if Qry <> nil then
                 Qry.Free;
           end;
        end;

        // ***** Pagina 29 *****
        // Clausula Vigesima Tercera
        QRLabel209.Caption := FmtFecha(pFecha.DateTime, 'Fecha: @D/@MMMM/@YYYY');

        Preview;
        Free;
     end;
end;

procedure TwOMSC.FormShow(Sender: TObject);
var
   q : TQuery;
	s : String;
begin
  Try
    QContratos.ParamByName('PID_CTO').AsString := Objeto.Id_Contrato.AsString;
    QContratos.DatabaseName:= Objeto.DataBaseName;
    QContratos.SessionName:= Objeto.SessionName;
    QContratos.Open;

    If QContratos.FieldByName('CVE_CONCEP_CTO').AsString = 'T015' Then
      edLeyenda.Text := 'REPRESENTADO POR SUS PADRES'
    Else edLeyenda.Text := 'DOS FIRMAS MINIMO';

    Objeto.Cto_Aux.AsString:= QContratos.FieldByName('CONTRATO').AsString;
    Objeto.Fecha_Contrato.AsString:= QContratos.FieldByName('FECHA_CONTRATO').AsString;
    Objeto.B_Prospecto.AsString:= QContratos.FieldByName('B_PROSPECTO').AsString;

    // CZR 07-Dic-2010
    with Objeto do
    begin
       Ent_EspecificadaA.Control     := edEntEspA;
       Ent_EspecificadaB.Control     := edEntEspB;
       Pacto_Transmision.Control     := rgPacTraPro;
       Rep_Principal.Control         := cbRepPrincipal;
       Representantes.ListRepresenta := lvRepresentantes;
       pTabOpciones                  := pcTabOpciones;
       pRepPrincipal                 := cbRepPrincipal;
       pFecha                        := dtpFecha;
       Pacto_Transmision.AsString    := 'No';
       Ent_EspecificadaA.AsString    := 'No Aplica';
       Ent_EspecificadaB.AsString    := 'No Aplica';
       pRepPrincipal.ItemIndex       := 0;
       pFecha.Date                   := Apli.DameFechaEmpresa;
       Ent_EspecificadaA.GetFromControl;
       Ent_EspecificadaB.GetFromControl;
       Pacto_Transmision.GetFromControl;
       Representantes.InicializaRepresentantes(Contrato.ConfigCaptura.Tipo_Proemio.AsString, Contrato.Id_Empresa.AsInteger);
    end;

  finally
    QContratos.Close;
  end;

	cbNomCliente.Items.Clear;
	if Objeto.Id_Contrato.AsInteger <> -1 Then
	begin
      Objeto.Id_Ctto.AsInteger:= StrToInt(Copy(Objeto.Id_Contrato.asString,2,9));

      q := GetSQLQuery(
         ' Select Nombre, Cve_Per_juridica, Cve_Contratante'+
         ' from Contratante, Persona'+
         ' Where'+
         '   Contratante.id_contrato = '+ Objeto.Id_contrato.AsString +
         '   and Contratante.Id_Persona = Persona.Id_Persona'+
         '   and Contratante.Sit_Contratante = ''AC'''+
         '   and Contratante.Cve_Contratante in (''C001'',''C003'',''C020'',''C012'',''C008'',''C042'',''C015'',''C016'',''C004'',''C006'',''C007'')'+
         ' Order by Cve_Contratante',
         Objeto.DataBaseName,Objeto.SessionName,False);

      Try
           if q <> nil then
           begin
               q.First;
               if (q.FieldByName('CVE_CONTRATANTE').asString = 'C001') and (q.FieldByName('CVE_PER_JURIDICA').asString = 'PF') Then
                 cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);

               if q.FieldByName('CVE_PER_JURIDICA').asString = 'PF' Then
                 Objeto.Cve_Per_Juridica.AsString := 'PF'
               else Objeto.Cve_Per_Juridica.AsString := 'PM';

               While (Not q.EOF) do
               begin
                 if q.FieldByName('CVE_CONTRATANTE').asString <> 'C001' Then
                   cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);
                 q.Next;
               end;
           end
           else
           begin
               q:= GetSQLQuery(
                   'Select Nombre, Cve_Per_Juridica from contrato, persona Where Id_Titular = Id_Persona '+
                   ' and Contrato.Id_Contrato = '+ Objeto.Id_Contrato.AsString,
                   Objeto.DataBaseName, Objeto.SessionName, False);

               If q <> nil then
               Begin
                 cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);
                 Objeto.Cve_Per_Juridica.AsString := q.FieldByName('CVE_PER_JURIDICA').asString;
               end;
           end;
      Finally
         q.free;
      end;
      cbNomCliente.Text := cbNomCliente.Items[0];
      Objeto.Nom_Cliente.AsString := cbNomCliente.Text;
   end
   else Raise EInterFrame.Create('No ha sido asignado un contrato para imprimir');
end;

procedure TwOMSC.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.B_CGBinter.AsBoolean  := True;
   Objeto.B_Proemio.AsBoolean   := True;
   Objeto.B_Mandato.AsBoolean   := True;
   Objeto.B_Otro.AsBoolean      := True;
   Objeto.B_MdoDinero.AsBoolean := True; // CZR 06-Dic-2010
end;

Procedure TwOMSC.Imprime(Preview: Boolean);
Begin
   with Objeto do
      try
         // CZR 07-Dic-2010
         if Representantes.GetRepresentantes('', '') = '' then
         begin
            pTabOpciones.ActivePage := TabGeneral;
            raise EInterFrame.Create('Revise que se haya seleccionado al menos un representante.');
         end;
         Nom_Representante.AsString := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));
         if B_MdoDinero.AsBoolean then
         begin
            if trim(pRepPrincipal.Text) = '' then
            begin
               pTabOpciones.ActivePage := TabMarMdoDinero;
               raise EInterFrame.Create('Revise que se haya seleccionado un representante principal para confirmar operaciones.');
            end;
         end;

         Leyenda.AsString     := edLeyenda.Text;
         Leyenda_Pie.AsString := edLeyendaPie.Text;
         Impresion(Preview);
      except
         on e: Exception do
            messagedlg(e.Message, mtInformation, [mbOK], 0);
     end;
end;

procedure TwOMSC.bbPreliminarClick(Sender: TObject);
begin	Imprime(True);
end;

procedure TwOMSC.bbImprimirClick(Sender: TObject);
begin	Imprime(False);
end;

procedure TwOMSC.cbNomClienteClick(Sender: TObject);
begin Objeto.Nom_Cliente.AsString := cbNomCliente.Text;
end;

procedure TwOMSC.chbProemioClick(Sender: TObject);
begin Objeto.B_Proemio.asBoolean := chbProemio.Checked;
end;

procedure TwOMSC.chbOtroClick(Sender: TObject);
begin	Objeto.B_Otro.asBoolean := chbOtro.Checked;
end;

procedure TwOMSC.chbMandatoClick(Sender: TObject);
begin
  Objeto.B_Mandato.asBoolean := chbMandato.Checked;
end;

procedure TwOMSC.ckCGBinterClick(Sender: TObject);
begin
  Objeto.B_CGBinter.asBoolean := ckCGBinter.Checked;
end;

procedure TwOMSC.chbMdoDineroClick(Sender: TObject);
begin
   Objeto.B_MdoDinero.AsBoolean := chbMdoDinero.Checked; // CZR 06-Dic-2010
end;

procedure TwOMSC.FormDestroy(Sender: TObject);
begin
   // CZR 07-Dic-2010
   with Objeto do
   begin
      Ent_EspecificadaA.Control     := nil;
      Ent_EspecificadaB.Control     := nil;
      Pacto_Transmision.Control     := nil;
      Rep_Principal.Control         := nil;
      Representantes.ListRepresenta := nil;
   end;
end;
end.

