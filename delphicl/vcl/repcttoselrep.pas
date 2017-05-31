unit RepCttoSelRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Db, DBTables, wwdblook, Wwdbdlg, DBCtrls, Grids, DBGrids,
  quickrpt, IntFrm, UnGene, UnSubGen, DmCttoEstado,
  RepCttoReProe,    { Proemio P Fisicas Nacionales }
  RepCttopropfx,    { Proemio P Fisicas Extranjeros }
  RepCttoproPFNF,   { Hoja de Firmas Proemio P Fisicas }
  RepCttopropmn,    { Proemio P Morales Nacionales }
  RepCttopropmX,    { Proemio P Morales Extranjeros }
  RepCttoproPMNF,   { Hoja de Firmas Proemio P Morales }
//RAPA 30Nov04  RepCttoAcuPro,    { Acuse de Anexos - Acuse de Prospectos}
  RepCttoMandat,    { Mandato }
//RAPA 30Nov04  RepCttoAnBase,    { Anexo Base de Recompra }
  RepCttoAcuAnexos, { Acuse de Anexos }
  RepCttoConven,    { Convenio }
  RepCttoConUlt,    { Convenio Última Página }
  UnRpKYCPF2,       { Información KYC P Fisicas para el Cliente }
  UnRpKYCPFEmp2,    { Información KYC P Fisicas con Act. Empresarial para el Cliente }
  UnRpKYCPM2,       { Información KYC P Morales para el Cliente }
  UnRpCGBinterPF,   {Reporte de Cartas Genéricas de Personas Físicas}
  UnRpCGBinterPM,   {Reporte de Cartas Genéricas de Personas Morales}
  IntCtto,          { Clase Corporativa de Contratos }
  UnSQL2;           {Funciones Generales de Interacciones}

Const
  cEmpresarial  = '01';
  cDiscrecional = 'DIS';
  cNoDiscrec    = 'NDIS';
  cLimitada     = 'LIMI';
  cRetener      = 'RT';
  cMexico       = 'MEXICO';

Type
  TImprimir   = class;

  TfoImprimir = class(TForm)
    gbLeyendas: TGroupBox;
    Label1: TLabel;
    edLeyenda1: TEdit;
    Label2: TLabel;
    edLeyenda2: TEdit;
    GroupBox1: TGroupBox;
    chbOpc1: TCheckBox;
    chbOpc4: TCheckBox;
    chbOpc7: TCheckBox;
    edFechaHora: TEdit;
    cbNomRepres: TComboBox;
    Label3: TLabel;
    lblRepresEmpr: TLabel;
    edCveCorresp: TEdit;
    edEnvio: TEdit;
    bbImprimir: TBitBtn;
    bbSalir: TBitBtn;
    edHora: TEdit;
    edFecha: TEdit;
    edFechaCont: TEdit;
    cbRepresen: TComboBox;
    edCuantos: TEdit;
    Edit1: TEdit;
    edTope: TEdit;
    edAltura: TEdit;
    bbPreliminar: TBitBtn;
    QContratos: TQuery;
    QContratosCVE_CONCEP_CTO: TStringField;
    chbOpc8: TCheckBox;
    chbOpc9: TCheckBox;
    ckCGBinter: TCheckBox;

    procedure FormShow           (Sender: TObject);
    function  ObtenFecha(pFecha : TDatetime):String;
    function  ObtenFecha2(pFecha : TDatetime):String;
    function  ObtenHora(pFecha : TDatetime):String;
    procedure AsignaParametros   (Var pDatos : TDatosRep);
    procedure ImprimeReporte     (pReporte:TQuickRep; pImprimir:Boolean);
    Procedure ImprimeProemio     (pImprimir: Boolean);
    Procedure ImprimeCGBinter    (pImprimir: Boolean);
    Procedure ImprimeKYC         (pImprimir: Boolean);
    procedure ImprimeConvenio    (pImprimir:Boolean);
    procedure ImprimeConvUltHoja (pImprimir:Boolean);
//RAPA 30Nov04    procedure ImprimeAnxoBases   (pImprimir:Boolean);
//RAPA 30Nov04    procedure ImprimeAcusePros   (pImprimir:Boolean);
    Procedure ImprimeAcuseAnexos (pImprimir: Boolean);
    procedure Imprime            (pImprimir:Boolean);
    procedure bbSalirClick       (Sender: TObject);
    procedure FormCreate         (Sender: TObject);
    procedure bbPreliminarClick  (Sender: TObject);
    procedure bbImprimirClick    (Sender: TObject);
    procedure FormHide(Sender: TObject);
  Protected
    //Procedure SetContrato(pContrato: TContrato);
  private
  public
    Imprimir : TImprimir;
    qrProemPFN: TqrProemPFN;
    qrProemPFNFir: TqrProemPFNFir;
    qrProemPMN: TqrProemPMN;
    qrProemPMNFir: TqrProemPMNFir;
    qrProemPFX: TqrProemPFX;
    qrProemPMX: TqrProemPMX;
//RAPA 30Nov04    qrAnBases: TqrAnBases;
//RAPA 30Nov04    qrAcuPros: TqrAcuPros;
    qrMandato: TqrMandato;
    qrAcuAnexos: TqrAcuAnexos;
    qrKYCPM2:    TqrKYCPM2;
    qrKYCPF2:    TqrKYCPF2;
    qrKYCPFEmp2: TqrKYCPFEmp2;

  end;


  TImprimir = class(TObject)
    private
    //FContrato: TContrato;
  Protected
    //Procedure SetContrato(pContrato: TContrato);
    public
      ID_CONTRATO  : Integer;
      DatabaseName : String;
      SessionName  : String;
      Frame        : TInterFrame;
      //Property Contrato: TContrato Read FContrato Write SetContrato;
      Procedure Catalogo;

    published
  end;


Var
  vgMeses    : Array[1..12] of String;
  vgMeses2   : Array[1..12] of String;
  vgCuantos  : Integer;
  RutaRep    : String;


Implementation

{$R *.DFM}



{ ****************************
  RAPA. Sep2005. Pruebas de Impresión Duplex
**************************** }
Uses printers, winspool;
function PrinterSupportsDuplex: Boolean;
var
  Device, Driver, Port: array[0..255] of Char;
  hDevMode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  Result := WinSpool.DeviceCapabilities(Device, Port, DC_DUPLEX, nil, nil) <> 0;
end;
Procedure SetDuplexMode();
var
  Device, Driver, Port: array[0..255] of Char;
  hDevMode: THandle;
  pDevmode: PDeviceMode;
begin
  If PrinterSupportsDuplex Then
  Begin
      { Get printer device mode handle. }
      Printer.GetPrinter(Device, Driver, Port, hDevMode);
      if hDevmode <> 0 then
      begin
        { lock it to get pointer to DEVMODE record }
        pDevMode := GlobalLock(hDevmode);
        if pDevmode <> nil then
          try
            with pDevmode^ do
            begin
              dmDuplex := DMDUP_HORIZONTAL;
              dmFields := dmFields or DM_DUPLEX;
            end;
          finally
          { unlock devmode handle. }
          GlobalUnlock(hDevmode);
        end;
      end;
  end
  else MessageDlg('La Impresora no soporta impresión Duplex', mtWarning, [mbOK], 0);
end;
{ ****************************
  RAPA. Sep2005. Pruebas de Impresión Duplex
**************************** }



procedure TImprimir.Catalogo;
Var
  W : TfoImprimir;
begin
  W:=TfoImprimir.Create(Nil);
  W.qrProemPFN    := TqrProemPFN.Create(Nil);
//RAPA 30Nov04  W.qrAnBases     := TqrAnBases.Create(Nil);
//RAPA 30Nov04  W.qrAcuPros     := TqrAcuPros.Create(Nil);
  W.qrMandato     := TqrMandato.Create(Nil);
  W.qrAcuAnexos   := TqrAcuAnexos.Create(Nil);
  W.qrProemPFNFir := TqrProemPFNFir.Create(Nil);
  W.qrProemPFX    := TqrProemPFX.Create(Nil);
  W.qrProemPMN    := TqrProemPMN.Create(Nil);
  W.qrProemPMNFir := TqrProemPMNFir.Create(Nil);
  W.qrProemPMX    := TqrProemPMX.Create(Nil);
  W.qrKYCPM2      := TqrKYCPM2.Create(Nil);
  W.qrKYCPF2      := TqrKYCPF2.Create(Nil);
  W.qrKYCPFEmp2   := TqrKYCPFEmp2.Create(Nil);

  Try
    W.Imprimir:=Self;
    W.ShowModal;
  Finally
    qrProemPFN.Free;
//RAPA 30Nov04    qrAnBases.Free;
//RAPA 30Nov04    qrAcuPros.Free;
    qrMandato.Free;
    qrAcuAnexos.Free;
    qrProemPFNFir.Free;
    qrProemPFX.Free;
    qrProemPMN.Free;
    qrProemPMNFir.Free;
    qrProemPMX.Free;
    qrKYCPM2.Free;
    qrKYCPF2.Free;
    qrKYCPFEmp2.Free;
    W.free;
  End;
end;





procedure TfoImprimir.FormCreate(Sender: TObject);
begin
  SHORTDATEFORMAT:='DD/MM/YYYY';
end;


procedure TfoImprimir.FormShow(Sender: TObject);
Var vlCuantos : Integer;
    vlResta   : Integer;
begin
  //Asigna la ruta donde se encuentran los templates de los reportes
  vgMeses2[1]:=' Ene ';
  vgMeses2[2]:=' Feb ';
  vgMeses2[3]:=' Mar ';
  vgMeses2[4]:=' Abr ';
  vgMeses2[5]:=' May ';
  vgMeses2[6]:=' Jun ';
  vgMeses2[7]:=' Jul ';
  vgMeses2[8]:=' Ago ';
  vgMeses2[9]:=' Sep ';
  vgMeses2[10]:=' Oct ';
  vgMeses2[11]:=' Nov ';
  vgMeses2[12]:=' Dic ';

  vgMeses[1]:=' Enero ';
  vgMeses[2]:=' Febrero ';
  vgMeses[3]:=' Marzo ';
  vgMeses[4]:=' Abril ';
  vgMeses[5]:=' Mayo ';
  vgMeses[6]:=' Junio ';
  vgMeses[7]:=' Julio ';
  vgMeses[8]:=' Agosto ';
  vgMeses[9]:=' Septiembre ';
  vgMeses[10]:=' Octubre ';
  vgMeses[11]:=' Noviembre ';
  vgMeses[12]:=' Diciembre ';

  //Abre los queries de los reportes
  dmPorta.buscar(IntToStr(Imprimir.Id_Contrato));
  QContratos.ParamByName('PID_CTO').AsString:= dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsString;
  QContratos.DatabaseName:= dmPorta.qContrato.DataBaseName;
  QContratos.SessionName:= dmPorta.qContrato.SessionName;
  QContratos.Open;
  If QContratos.FieldByName('CVE_CONCEP_CTO').AsString = 'T015' Then
     edLeyenda1.Text := 'REPRESENTADO POR SUS PADRES'
  Else edLeyenda1.Text := 'DOS FIRMAS MINIMO';

  //Contrato.Id_Contrato.Control:= 'lblContrato';  
  QContratos.Close;

  if dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 1 then begin
    { Personas Morales }
    chbOpc7.Visible:=True;
    LblRepresEmpr.Visible:=True;
    cbRepresen.Visible:=True;
    dmPorta.qRepresent.First;

    //Llena el combo de representantes
    while not dmPorta.qRepresent.EOF do begin
      cbRepresen.Items.Add(dmPorta.qRepresent.FieldByName('NOMBRE_REPRES').AsString);
      dmPorta.qRepresent.Next;
    end;
    cbRepresen.ItemIndex := 0;
  end
  else
  Begin
    { Personas Fisicas }
    chbOpc7.Visible:=False;
    LblRepresEmpr.Visible:=False;
    cbRepresen.Visible:=False;
  end;

  //Asigna el texto de manejo de cuenta e instrucciones de envío
  if dmporta.qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cLimitada then
    edCveCorresp.Text:='LIMITADA'
  else
  Begin
    if dmporta.qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cDiscrecional then
      edCveCorresp.Text:='DISCRECIONAL'
    else edCveCorresp.Text:='NO DISCRECIONAL';
  end;

  if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = cRetener then edEnvio.Text :='RETENER'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'CR' then edEnvio.Text:='CORREO'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'DH' then edEnvio.Text:='DHL'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'FX' then edEnvio.Text:='FEDERAL EXPRESS'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'LQ' then edEnvio.Text:='LIQUIDACION'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'RB' then edEnvio.Text:='RET. DE BANCO'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'RP' then edEnvio.Text:='RET. DE CTAS. PROPIAS'
  else if dmPorta.qContrato.fieldbyname('CVE_CORRESP').AsString = 'RC' then edEnvio.Text:='RET. De CTES. MENSAJEROS';
  if dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 1 then
  Begin
      { Personas Morales }
      vlCuantos:=dmPorta.qRepresent.RecordCount;
      vlResta:=20;
  end
  else
  Begin
      { Personas Fisicas }
      vlCuantos:=dmPorta.qDatosCotitul.RecordCount;
      vlResta:=32;
  end;

  if vlCuantos <= 1 then
  Begin
      edAltura.Text :='100';
      edTope.Text   :='40';
  end;

  if vlCuantos >= 9 then
  Begin
      edAltura.Text:='40';
      edTope.Text:='0';
  end;

  if (vlCuantos > 1) and (vlCuantos < 9) then
  Begin
      edAltura.Text:=IntToStr(40 + Trunc((360 - (vlCuantos * 40))/vlCuantos));
      edTope.Text:=IntToStr(Trunc(Trunc(StrToInt(edAltura.Text)-vlResta)/2));
  end;
end;


procedure TfoImprimir.FormHide(Sender: TObject);
begin
  dmPorta.CierraTodo;
end;


Function TfoImprimir.ObtenFecha(pFecha : TDatetime):String;
var
  vlDia,vlMes,vlAno: word;
begin
  DecodeDate(pFecha, vlAno, vlMes, vlDia);
  ObtenFecha := IntToStr(vlDia) + ' del mes de ' + vgMeses[vlMes] + ' de ' + IntToStr(vlAno);
end;


Function TfoImprimir.ObtenFecha2(pFecha : TDatetime):String;
var
  vlDia,vlMes,vlAno: word;
begin
  DecodeDate(pFecha, vlAno, vlMes, vlDia);
  ObtenFecha2 := IntToStr(vlDia) + '-' + vgMeses2[vlMes] + '-' + IntToStr(vlAno);
end;


Function TfoImprimir.ObtenHora(pFecha : TDatetime):String;
begin ObtenHora:= FormatDateTime('HH:MM:SS',pFecha);
end;


procedure TfoImprimir.AsignaParametros(Var pDatos : TDatosRep);
begin
  pDatos.Tope      := StrToInt(edTope.text);
  pDatos.Altura    := StrToInt(edAltura.text);
  pDatos.FechaCont := edFechaCont.text;
  pDatos.FechaHora := edFechaHora.text;
  pDatos.NomRepres := cbNomRepres.text;
  pDatos.RepresPrin:= cbRepresen.text;

  if dmPorta.qDatosCotitul.IsEmpty then
     pDatos.TipoCuenta:='INDIVIDUAL'
  else pDatos.TipoCuenta:='SOLIDARIA';

  pDatos.CveCorresp:= edCveCorresp.text;
  pDatos.Envio     := edEnvio.text;
  pDatos.Leyenda1  := edLeyenda1.text;
  pDatos.Leyenda2  := edLeyenda2.text;

  if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
     pDatos.NombreCtto:= dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
  else pDatos.NombreCtto:= dmPorta.qDatosTitular.FieldByName('NOMBRE').asString;
end;


Procedure TfoImprimir.ImprimeReporte(pReporte:TQuickRep; pImprimir:Boolean);
Begin
  if pImprimir then pReporte.Print
  else pReporte.Preview;
end;


{Procedure TImprimir.SetContrato(pContrato: TContrato);
Begin
  FContrato:= pContrato;
end;}



{ IMPRESION PROEMIO ********************************************************** }

Procedure TfoImprimir.ImprimeProemio(pImprimir: Boolean);
Var vlDatos : TDatosRep;
Begin
  AsignaParametros(vlDatos);    //Asigna datos comunes en los reportes

  if dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 0 then
  Begin
      { Personas Fisicas }
      dmPorta.qBeneficiarios.Active:=True;
      dmPorta.qDatosCotitul.Active:=True;
      if dmporta.qDatosTitular.FieldByName('PAIS').AsSTRING = 'MEXICO' then
      Begin
          { Nacionales }
          qrProemPFN.DatosRep:=vlDatos;
          ImprimeReporte(qrProemPFN,pImprimir);
          qrProemPFNFir.DatosRep:=vlDatos;
          ImprimeReporte(qrProemPFNFir,pImprimir);
      end
      else
      Begin
          { Extranjeros }
          qrProemPFX.DatosRep:=vlDatos;
          ImprimeReporte(qrProemPFX,pImprimir);
          qrProemPFNFir.DatosRep:=vlDatos;
          ImprimeReporte(qrProemPFNFir,pImprimir);
      end;
  end
  else
  Begin
      { Personas Morales }
      dmPorta.qRepresent.Active:=True;
      if dmporta.qDatosTitular.FieldByName('PAIS').AsSTRING = 'MEXICO' then
      begin
          { Nacionales }
          qrProemPMN.DatosRep := vlDatos;

          { ****************************
            RAPA. Sep2005. Pruebas de Impresión Duplex
          SetDuplexMode;
          {*************************** }


          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            qrMandato.NombrePersona:=dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else qrMandato.NombrePersona:=dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;
          qrMandato.Contrato:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
          If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'V' Then
            qrMandato.Fecha:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString + '.'
          else qrMandato.Fecha:= UpperCase(FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';
          qrMandato.Hora     :=edHora.text;
          qrMandato.Represen :=cbRepresen.text;
          qrMandato.Leyenda2 :=edLeyenda2.text;
          ImprimeReporte(qrProemPMN,pImprimir);

          { IMPRESION DEL MANDATO }
          if chbOpc7.checked  then ImprimeReporte(qrMandato,pImprimir);


          { ****************************
            RAPA. Sep2005. Pruebas de Impresión Duplex
           *************************** }

          qrProemPMNFir.DatosRep:=vlDatos;
          qrProemPMNFir.QRLabel32.Caption := 'E L   C L I E N T E   R E P R E S E N T A D O   P O R';
          ImprimeReporte(qrProemPMNFir,pImprimir);

      end
      else
      Begin
          { Extranjeros }
          qrProemPMX.DatosRep := vlDatos;
          ImprimeReporte(qrProemPMX,pImprimir);
          qrProemPMNFir.DatosRep:=vlDatos;
          qrProemPMNFir.QRLabel32.Caption := 'E L   C L I E N T E   R E P R E S E N T A D O   P O R';
          ImprimeReporte(qrProemPMNFir,pImprimir);
      end;
  end;
end;

{ IMPRESION DE CGBinter / ICB }
// qrMandato.Contrato:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
Procedure TfoImprimir.ImprimeCGBinter(pImprimir: Boolean);
Var vlDatos : TDatosRep;
    RpPF    : TrpCGBPF;
    RpPM    : TrpCGBPM;
    vlSEmpresa          : String;
    vlSNombre           : String;
    vlSTipoCto          : String;
    vlSDescTipoCto      : String;
    vlsDiscrecionalidad : String;
Begin
  AsignaParametros(vlDatos);    //Asigna datos comunes en los reportes

  {
          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            qrMandato.NombrePersona:=dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else qrMandato.NombrePersona:=dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;
          qrMandato.Contrato:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
          If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'V' Then
            qrMandato.Fecha:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString + '.'
          else qrMandato.Fecha:= UpperCase(FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';
          qrMandato.Hora     :=edHora.text;
          qrMandato.Represen :=cbRepresen.text;
          qrMandato.Leyenda2 :=edLeyenda2.text;
          ImprimeReporte(qrProemPMN,pImprimir);
  }


  if dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 0 then
  Begin
      { Personas Fisicas }
       RpPF := TrpCGBPF.Create(Self);
       RpPF.QryCtto.Active := False;
       RpPF.QryCtto.DatabaseName := dmPorta.qContrato.DataBaseName;
       RpPF.QryCtto.SessionName  := dmPorta.qContrato.SessionName;
       RpPF.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrTOInt(dmPorta.qContrato.FieldbyName('CONTRATO').AsString);
       RpPF.QryCtto.Active := True;
       //RpPF.QRLabel42.Caption := Contrato.TitNombre.AsString;
          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            RpPF.QRLabel42.Caption:= dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else RpPF.QRLabel42.Caption:= dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;

       //RpPF.QRInterMemo2.Parametro.Strings[0]:= Contrato.TitNombre.AsString;
          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            RpPF.QRInterMemo2.Parametro.Strings[0]:= dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else RpPF.QRInterMemo2.Parametro.Strings[0]:= dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;


       RpPF.QRInterMemo2.Parametro.Strings[1]:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
       RpPF.QRFecha.Caption := UpperCase(FmtFecha(RpPF.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
       //-------------------------
           GetSQLStr(' SELECT ID_EMPRESA ' +
                     '   FROM CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
                     'ID_EMPRESA',
                     vlSEmpresa,
                     FALSE);


           GetSQLStr(' SELECT NOMBRE ' +
                     '   FROM PERSONA ' +
                     '  WHERE PERSONA.ID_PERSONA = ' + vlSEmpresa +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
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
                     '  WHERE A.ID_CONTRATO = ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
                     'DESC_TIPO_CONTRA',
                     vlSDescTipoCto,
                     FALSE);

           vlSDescTipoCto:= 'CONTRATO DE ' + vlSDescTipoCto;

           RpPM.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto + ' No. ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
           RpPM.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

           GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                     '   FROM SB_CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
                     'DISCRECIONAL',
                     vlsDiscrecionalidad,
                     FALSE);
           RpPM.QRInterMemo2.Parametro.Strings[4]:= vlsDiscrecionalidad;
       //-------------------------
       RpPF.Preview;
       RpPF.Free;
  end
  else
  Begin
      { Personas Morales }
       RpPM := TrpCGBPM.Create(Self);
       RpPM.QryCtto.Active := False;
       RpPM.QryCtto.DatabaseName := dmPorta.qContrato.DataBaseName;
       RpPM.QryCtto.SessionName  := dmPorta.qContrato.SessionName;
       RpPM.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrTOInt(dmPorta.qContrato.FieldbyName('CONTRATO').AsString);
       RpPM.QryCtto.Active := True;
       //RpPM.QRLabel42.Caption := Contrato.TitNombre.AsString;
          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            RpPM.QRLabel42.Caption:= dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else RpPM.QRLabel42.Caption:= dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;

       RpPM.QRInterMemo2.Parametro.Strings[0]:= cbRepresen.text;
       //RpPM.QRInterMemo2.Parametro.Strings[1]:= Contrato.TitNombre.AsString;
          if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
            RpPM.QRInterMemo2.Parametro.Strings[0]:= dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString
          else RpPM.QRInterMemo2.Parametro.Strings[0]:= dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString;

       RpPM.QRInterMemo2.Parametro.Strings[2]:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
       //RpPM.QRFecha.Caption := FmtFecha(RpPM.QryCtto.FieldByName('FECHA').AsDateTime, '@DD-@MMM-@YYYY');
       RpPM.QRFecha.Caption := UpperCase(FmtFecha(RpPM.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
       //-------------------------
           GetSQLStr(' SELECT ID_EMPRESA ' +
                     '   FROM CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
                     'ID_EMPRESA',
                     vlSEmpresa,
                     FALSE);

           GetSQLStr(' SELECT NOMBRE ' +
                     '   FROM PERSONA ' +
                     '  WHERE PERSONA.ID_PERSONA = ' + vlSEmpresa +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
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
                     '  WHERE A.ID_CONTRATO = ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
                     'DESC_TIPO_CONTRA',
                     vlSDescTipoCto,
                     FALSE);

           vlSDescTipoCto:= 'CONTRATO DE ' + vlSDescTipoCto;

           RpPF.QRInterMemo2.Parametro.Strings[1]:= vlSDescTipoCto + ' No. ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
           RpPF.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto;

           GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                     '   FROM SB_CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + dmPorta.qContrato.FieldbyName('CONTRATO').AsString +
                     '  ',
                     dmPorta.qContrato.DataBaseName,
                     dmPorta.qContrato.SessionName,
                     'DISCRECIONAL',
                     vlsDiscrecionalidad,
                     FALSE);
           RpPF.QRInterMemo2.Parametro.Strings[3]:= vlsDiscrecionalidad;

       //-------------------------

       RpPM.Preview;
       RpPM.Free;
  end;
end;


{ IMPRESION KYC ************************************************************** }

Procedure TfoImprimir.ImprimeKYC(pImprimir:Boolean);
Var vlQuery : TQuery;
Begin
  vlQuery := TQuery.Create(Nil);
  vlQuery.SQL.Text :=
    ' SELECT Persona.Cve_Per_Juridica, Persona_Fisica.B_Activ_Empresa ' +
    ' FROM Persona, Persona_Fisica ' +
    ' WHERE Persona.Id_Persona = ' +
    '         ( SELECT Id_Titular FROM Contrato ' +
    '           WHERE Id_Contrato = ' + dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsString + ') ' +
    '   AND Persona.Id_Persona = Persona_Fisica.Id_Persona (+)';
  vlQuery.DataBaseName := Imprimir.Frame.Apli.DataBaseName;
  vlQuery.SessionName  := Imprimir.Frame.Apli.SessionName;
  vlQuery.Open;

  If not vlQuery.IsEmpty then
  Begin
    if vlQuery.FieldByName('CVE_PER_JURIDICA').AsString = 'PM' then
    Begin
      { Reporte KYC Personas Morales }
      With qrKYCPM2 do
      Begin
        qrieKYCPM.Apli         := Imprimir.Frame.Apli;
        qContrato.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qContrato.SessionName  := Imprimir.Frame.Apli.SessionName;
        qContrato.ParamByName('pIdContrato').AsInteger := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
        qPersona.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qPersona.SessionName  := Imprimir.Frame.Apli.SessionName;
        qPerEmpresa.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qPerEmpresa.SessionName  := Imprimir.Frame.Apli.SessionName;
        qPerPaisCober.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qPerPaisCober.SessionName  := Imprimir.Frame.Apli.SessionName;
        qOperatividad.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qOperatividad.SessionName  := Imprimir.Frame.Apli.SessionName;
        qPerRefBancaria.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qPerRefBancaria.SessionName  := Imprimir.Frame.Apli.SessionName;
        qPerRefComercial.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
        qPerRefComercial.SessionName  := Imprimir.Frame.Apli.SessionName;
        qContrato.Open;
        if not qContrato.IsEmpty then
        begin
            qrieKYCPM.Titulo2   := 'Contrato ' + IntToStr(dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger);
            qrieKYCPM.IdEmpresa := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
            qPersona.Open;
            qPerEmpresa.Open;
            qPerPaisCober.Open;
            qOperatividad.Open;
            qPerRefBancaria.Open;
            qPerRefComercial.Open;
        end;
        ImprimeReporte(qrKYCPM2,pImprimir);

        qContrato.Close;
        qPersona.Close;
        qPerEmpresa.Close;
        qPerPaisCober.Close;
        qOperatividad.Close;
        qPerRefBancaria.Close;
        qPerRefComercial.Close;
      end;
    end
    else if vlQuery.FieldByName('CVE_PER_JURIDICA').AsString = 'PF' then
    begin
      { Reporte KYC Personas Fisicas }
      if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'V' then
      begin
          { Actividad Empresarial }
          With qrKYCPFEmp2 do
          Begin
            qrieKYCPFEmp.Apli      := Imprimir.Frame.Apli;
            qContrato.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qContrato.SessionName  := Imprimir.Frame.Apli.SessionName;
            qContrato.ParamByName('pIdContrato').AsInteger := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
            qPersona.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPersona.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerEmpresa.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerEmpresa.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerPaisCober.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerPaisCober.SessionName  := Imprimir.Frame.Apli.SessionName;
            qOperatividad.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qOperatividad.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerRefComercial.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerRefComercial.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerRefBancaria.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerRefBancaria.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerRefPersona.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerRefPersona.SessionName  := Imprimir.Frame.Apli.SessionName;
            qContrato.Open;
            if not qContrato.IsEmpty then
            begin
              qrieKYCPFEmp.Titulo2   := 'Contrato ' + IntToStr(dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger);
              qrieKYCPFEmp.IdEmpresa := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
              qPersona.Open;
              qPerEmpresa.Open;
              qPerPaisCober.Open;
              qOperatividad.Open;
              qPerRefComercial.Open;
              qPerRefBancaria.Open;
              qPerRefPersona.Open;
            end;
            ImprimeReporte(qrKYCPFEmp2,pImprimir);

            qContrato.Close;
            qPersona.Close;
            qPerEmpresa.Close;
            qPerPaisCober.Close;
            qOperatividad.Close;
            qPerRefComercial.Close;
            qPerRefBancaria.Close;
            qPerRefPersona.Close;
          end
      end
      else if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'F' then
      begin
          { Actividad Empresarial }
          With qrKYCPF2 do
          Begin
            qrieKYCPF.Apli         := Imprimir.Frame.Apli;
            qContrato.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qContrato.SessionName  := Imprimir.Frame.Apli.SessionName;
            qContrato.ParamByName('pIdContrato').AsInteger := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
            qPersona.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPersona.SessionName  := Imprimir.Frame.Apli.SessionName;
            qOperatividad.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qOperatividad.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerRefBancaria.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerRefBancaria.SessionName  := Imprimir.Frame.Apli.SessionName;
            qPerRefPersona.DatabaseName := Imprimir.Frame.Apli.DataBaseName;
            qPerRefPersona.SessionName  := Imprimir.Frame.Apli.SessionName;
            qContrato.Open;
            if not qContrato.IsEmpty then
            begin
              qrieKYCPF.Titulo2   := 'Contrato ' + IntToStr(dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger);
              qrieKYCPF.IdEmpresa := dmPorta.qContrato.FieldbyName('ID_CONTRATO').AsInteger;
              qPersona.Open;
              qOperatividad.Open;
              qPerRefBancaria.Open;
              qPerRefPersona.Open;
            end;
            ImprimeReporte(qrKYCPF2,pImprimir);

            qContrato.Close;
            qPersona.Close;
            qOperatividad.Close;
            qPerRefBancaria.Close;
            qPerRefPersona.Close;
          end;
      end;
    end;
  end;

  vlQuery.Close;
  vlQuery.Free;
end;



{ IMPRESION CONVENIO ********************************************************* }

Procedure TfoImprimir.ImprimeConvenio(pImprimir:Boolean);
Var qrConvenio : TqrConvenio;
Begin
  qrConvenio := TqrConvenio.Create(Nil);
  Try
    qrConvenio.QRMacvMemo1.Parametro.Clear;
    //qrConvenio.QRMacvMemo1.Parametro.Add(dmPorta.qContrato.FieldbyName('ID_CTTO').AsString);
    qrConvenio.QRMacvMemo1.Parametro.Add(Copy(dmPorta.qContrato.FieldbyName('CONTRATO').AsString, 1, 35));
    if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
       qrConvenio.QRMacvMemo1.Parametro.Add(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString)
    else qrConvenio.QRMacvMemo1.Parametro.Add(dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString);
    //qrConvenio.QRMacvMemo2.Parametro.Clear;
    //qrConvenio.QRMacvMemo2.Parametro.Add(ObtenFecha(dmPorta.qContrato.FieldByName('F_ALTA').AsDateTime));

    { Personalidad Juridica }
    qrConvenio.qrlPersonaMoral.Enabled:= (dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 1);
    If (dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger <> 1) Then
    Begin
      dmPorta.qActivPF.Active:= True;
      qrConvenio.qrlPersonaFisica.Enabled:= Trim(dmPorta.qActivPF.FieldByName('B_ACTIV_EMPRESA').AsString) = 'F';
      qrConvenio.qrlPersonaFisEmp.Enabled:= Trim(dmPorta.qActivPF.FieldByName('B_ACTIV_EMPRESA').AsString) = 'V';
      dmPorta.qActivPF.Active:= False;
    end;

    { Escritura del Titular }
    if (dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 1) and
       (Not dmporta.qEscrTitul.IsEmpty) Then
    Begin
        dmPorta.qRepresent.First;
        dmPorta.qRepresent.MoveBy(cbRepresen.ItemIndex);
        qrConvenio.QRMacvMemo6.Parametro.Clear;
        qrConvenio.QRMacvMemo6.Parametro.Add(dmporta.qDatosRepresent.FieldByName('NUM_ESC_PUBLICA').AsString);
        qrConvenio.QRMacvMemo6.Parametro.Add(dmporta.qDatosRepresent.FieldByName('NOMBRE_NOTARIO').AsString);
        //qrConvenio.QRMacvMemo6.Parametro.Add(ObtenFecha(dmporta.qDatosRepresent.FieldByName('F_ESCRITURA').AsDateTime));
        qrConvenio.QRMacvMemo6.Parametro.Add(FmtFecha(dmporta.qDatosRepresent.FieldByName('F_ESCRITURA').AsDateTime, '@d de @mmmm de @yyyy'));
        qrConvenio.QRMacvMemo6.Parametro.Add(dmporta.qDatosRepresent.FieldByName('NUM_NOTARIA').AsString);
        qrConvenio.QRMacvMemo6.Parametro.Add(dmporta.qDatosRepresent.FieldByName('PLAZA').AsString);
    end
    else
    Begin
        qrConvenio.QRMacvMemo6.Parametro.Clear;
        qrConvenio.QRMacvMemo6.Parametro.Add('--');
        qrConvenio.QRMacvMemo6.Parametro.Add('--');
        qrConvenio.QRMacvMemo6.Parametro.Add('--');
        qrConvenio.QRMacvMemo6.Parametro.Add('--');
        qrConvenio.QRMacvMemo6.Parametro.Add('--');
    end;


    { Discrecionalidad }
    qrConvenio.qrlDiscre.Enabled:= (dmporta.qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cDiscrecional);
    qrConvenio.qrlNodiscre.Enabled:= (dmporta.qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cNoDiscrec);
    qrConvenio.qrlDiscreLimi.Enabled:= (dmporta.qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cLimitada);


    if pImprimir then qrConvenio.Print
    else qrConvenio.PreView;

  Finally
    qrConvenio.Free;
  end;

end;


{ IMPRESION ULTIMA HOJA DE CONVENIO ****************************************** }

procedure TfoImprimir.ImprimeConvUltHoja(pImprimir:Boolean);
Var
  qrConUlt: TqrConUlt;
begin
  qrConUlt:= TqrConUlt.Create(Nil);
  Try
    qrConUlt.qrmNomCliente.Lines.Clear;

    if dmporta.qTipoPersona.FieldByName('ESPERSMORAL').AsInteger = 1 then
      { Personas Morales }
      qrConUlt.qrmNomCliente.Lines.Add(cbRepresen.Text)
    else
    Begin
      { Personas Fisicas }
      if Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' then
        qrConUlt.qrmNomCliente.Lines.Add(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString)
      else qrConUlt.qrmNomCliente.Lines.Add(dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString);
    end;

    qrConUlt.qrmNomCasaBolsa.Lines.Clear;
    qrConUlt.qrmNomCasaBolsa.Lines.Add(cbNomRepres.Text);
    qrConUlt.qrInterMemoFecha.Parametro.Clear;
    If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
      qrConUlt.qrInterMemoFecha.Parametro.Add(FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D del mes de @MMMM de @YYYY'))
    else qrConUlt.qrInterMemoFecha.Parametro.Add(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString);

    if pImprimir then qrConUlt.Print
    else qrConUlt.PreView;

  Finally
    qrConUlt.Free;
  end;
end;


//RAPA 30Nov04
{ IMPRESION ANEXO BASE DE RECOMPRA *******************************************
procedure TfoImprimir.ImprimeAnxoBases(pImprimir:Boolean);
begin
  qrAnBases.qrlContrato.Caption:=dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrAnBases.qrlFechaCont.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrAnBases.qrlFechaCont.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;

  if Not pImprimir then qrAnBases.Preview
  else qrAnBases.Print;
end;
}


//RAPA 30Nov04
{ IMPRESION ACUSE DE PROSPECTOS **********************************************
procedure TfoImprimir.ImprimeAcusePros(pImprimir:Boolean);
begin
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrAcuPros.qrlFecha1.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D del mes de @MMMM de @YYYY.')
  else qrAcuPros.qrlFecha1.Caption:= 'Fecha :      ' + DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  qrAcuPros.qrlContrato.Caption    := dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
  qrAcuPros.qrmNomCliente.Lines.Clear;
  qrAcuPros.qrmNomCliente.Lines.Add(dmPorta.qDatosTitular.FieldByName('NOMBRE').AsString + '.');

  if pImprimir then qrAcuPros.Print
  else qrAcuPros.PreView;
end;
}


{ IMPRESION ACUSE DE ANEXOS GENERALES **************************************** }
procedure TfoImprimir.ImprimeAcuseAnexos(pImprimir:Boolean);
begin
  qrAcuAnexos.qrlContrato.Caption:= dmPorta.qContrato.FieldbyName('CONTRATO').AsString;
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrAcuAnexos.qrlFechaCont.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrAcuAnexos.qrlFechaCont.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  ImprimeReporte(qrAcuAnexos,pImprimir)
end;




{ Procedimiento general de Impresión ***************************************** }

procedure TfoImprimir.Imprime(pImprimir:Boolean);
Var
  vlFecha : TDateTime;

begin
  if(chbOpc7.Checked and chbOpc7.Visible) and Not chbOpc1.Checked then begin
     InterMsg(tmError,'',0,'No puede imprimir el mandato sin el proemio.');
     Exit;
  end;

  Try
      CursorEspera;   //Activa el cursor de espera

      //Obtiene la fecha y hora de la máquina
      vlFecha :=  Imprimir.Frame.Apli.SysDateTime;
      edFecha.Text     :=ObtenFecha2(vlFecha);
      edFechaCont.Text :=ObtenFecha2(dmporta.qContrato.FieldByName('F_ALTA').AsDateTime);
      edHora.Text      :=ObtenHora(vlFecha);
      edFechaHora.Text :=edFecha.Text + ' ' + edHora.Text;

      { IMPRESION DE CGBinter / ICB }
      if chbOpc1.Checked then ImprimeCGBinter(pImprimir);


      { IMPRESION DE PROEMIO }
      if chbOpc1.Checked then ImprimeProemio(pImprimir);

//RAPA 30Nov04
      { IMPRESION BASE DE RECOMPRA
      if chbOpc2.Checked then ImprimeAnxoBases(pImprimir);
}

//RAPA 30Nov04
      { IMPRESION ACUSE DE PROSPECTOS
      if chbOpc6.Checked then ImprimeAcusePros(pImprimir);
}
      { IMPRESION CONVENIO 1a y Ultima hoja }
      if chbOpc4.Checked then
      Begin
        ImprimeConvenio(pImprimir);
        ImprimeConvUltHoja(pImprimir);
      end;

      { IMPRESION AVISO INFORMATIVO DE SOCIEDADES DE INVERSION }
      if chbOpc8.Checked then ImprimeAcuseAnexos(pImprimir);

      { IMPRESION KYC }
      if chbOpc9.Checked then ImprimeKYC(pImprimir);

  Finally
    CursorNormal;     //Activa el cursor normal
  End;


  If (chbOpc1.Checked or chbOpc4.Checked) and pImprimir Then
    InterMsg(tmInformacion,'',0,'Los documentos han sido impresos');
end;


procedure TfoImprimir.bbSalirClick(Sender: TObject);
begin Close;
end;


procedure TfoImprimir.bbPreliminarClick(Sender: TObject);
begin Imprime(False);
end;


procedure TfoImprimir.bbImprimirClick(Sender: TObject);
begin Imprime(True);
end;

end.
