unit UnProemioICB_PF;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm, Dialogs, InterMemo,
    IntProemioICB;    { Pantalla de Seleccion de Parametros para Proemio ICB }
    
type
  TProemioICB_PF = class(TQuickRep)
    detalleContrato: TQRBand;
    headerContratantes: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;    
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText35: TQRDBText;
    detailILine: TQRSubDetail;
    headerILine: TQRGroup;
    groupTitularILine: TQRGroup;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel63: TQRLabel;
    pageHeader: TQRBand;
    memoPageHeader: TQRInterMemo;
    QRLabel65: TQRLabel;
    qContrato: TQuery;
    dsContrato: TDataSource;
    qContratantes: TQuery;
    qDomicilioFiscal: TQuery;
    qChequeras: TQuery;
    qBeneficiarios: TQuery;
    qAccesoILine: TQuery;
    qDomicilioPostal: TQuery;
    lblServicios: TQRLabel;
    EspacioMembrete: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRInterMemo1: TQRInterMemo;
    QRLabel18: TQRLabel;    
    lblContrato: TQRLabel;

    lblFAlta: TQRLabel;
    pageFooter: TQRBand;
    detailRepresentanteICB: TQRStringsBand;    
    
    
    QRExpr1: TQRExpr;
    lblNombres: TQRLabel;
    detailDatosIdentificacion: TQRSubDetail;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    detailTipoCuenta: TQRSubDetail;
    QRLabel70: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel74: TQRLabel;
    detailManejoCuenta: TQRSubDetail;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRInterMemo7: TQRInterMemo;
    detailInstrucciones: TQRSubDetail;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRInterMemo8: TQRInterMemo;
    headerChequeras: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    detailEnvioDocumentacion: TQRSubDetail;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    GroupHeaderBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel49: TQRLabel;
    QRInterMemo5: TQRInterMemo;
    footerRepresentanteICB: TQRBand;
    detailFirmaClientes: TQRSubDetail;
    headerFirmaClientes: TQRBand;
    QRShape2: TQRShape;
    footer: TQRBand;
    lblRepresentantes: TQRLabel;
    QRLabel64: TQRLabel;
    footerFirmaClientes: TQRChildBand;
    shapeLineaFirma: TQRShape;
    QRDBText21: TQRDBText;
    lblFAlta_Footer: TQRLabel;
    QRLabel3: TQRLabel;
    lblLeyendaPiePagina: TQRLabel;
    groupHeaderTipoContratante: TQRGroup;
    QRLabel2: TQRLabel;
    qContratantesCVE_CONTRATANTE: TStringField;
    qContratantesTIPO_CONTRATANTE: TStringField;
    qContratantesID_PERSONA: TFloatField;
    qContratantesNUM_COTITULAR: TFloatField;
    qContratantesCVE_TIPO_FIRMA: TStringField;
    qContratantesNOMBRE: TMemoField;
    qContratantesNACIONALIDAD: TStringField;
    qContratantesSIGLAS_RFC: TStringField;
    qContratantesF_RFC: TStringField;
    qContratantesHOMOCLAVE_RFC: TStringField;
    qContratantesCURP: TStringField;
    qContratantesDESC_PROFESION: TStringField;
    qContratantesCVE_ACTIVIDAD: TMemoField;
    qContratantesACTIVIDAD: TStringField;
    qContratantesB_APLICA_RFC: TStringField;
    qContratantesRFC: TStringField;
    qDomicilioFiscalID_PERSONA: TFloatField;
    qDomicilioFiscalTELEFONO: TStringField;
    qDomicilioFiscalFAX: TStringField;
    qDomicilioFiscalE_MAIL: TStringField;
    qDomicilioFiscalCALLE_NUMERO: TStringField;
    qDomicilioFiscalCODIGO_POSTAL: TStringField;
    qDomicilioFiscalCOLONIA: TStringField;
    qDomicilioFiscalOFICINA_POSTAL: TStringField;
    qDomicilioFiscalCIUDAD: TStringField;
    qDomicilioFiscalESTADO: TStringField;
    qDomicilioFiscalPAIS: TStringField;
    qChequerasID_CONTRATO: TFloatField;
    qChequerasID_PERSONA: TFloatField;
    qChequerasNOMBRE: TStringField;
    qChequerasCUENTA_BANCO: TStringField;
    qChequerasNOM_BANCO: TStringField;
    qChequerasCVE_SUC_BANCO: TStringField;
    qChequerasNOM_PLAZA: TStringField;
    qBeneficiariosID_CONTRATO: TFloatField;
    qBeneficiariosID_PERSONA: TFloatField;
    qBeneficiariosNOMBRE: TStringField;
    qBeneficiariosF_NACIMIENTO: TDateTimeField;
    qBeneficiariosPCT_BENEFICIO: TFloatField;
    qBeneficiariosID_DOMICILIO: TFloatField;
    qBeneficiariosCALLE_NUMERO: TStringField;
    qBeneficiariosCODIGO_POSTAL: TStringField;
    qBeneficiariosCOLONIA: TStringField;
    qBeneficiariosOFICINA_POSTAL: TStringField;
    qBeneficiariosCIUDAD: TStringField;
    qBeneficiariosESTADO: TStringField;
    qBeneficiariosPAIS: TStringField;
    qAccesoILineID_CONTRATO: TFloatField;
    qAccesoILineTITULAR: TMemoField;
    qAccesoILineE_MAIL: TStringField;
    qAccesoILineSERVICIO: TStringField;
    qDomicilioPostalCALLE_NUMERO: TStringField;
    qDomicilioPostalCODIGO_POSTAL: TStringField;
    qDomicilioPostalCOLONIA: TStringField;
    qDomicilioPostalOFICINA_POSTAL: TStringField;
    qDomicilioPostalPAIS: TStringField;
    qDomicilioPostalESTADO: TStringField;
    qDomicilioPostalCIUDAD: TStringField;
    qDomicilioPostalCVE_USUAR_MODIF: TStringField;
    qDomicilioPostalFH_MODIFICACION: TDateTimeField;
    QRExpr2: TQRExpr;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_TITULAR: TFloatField;
    qContratoF_ALTA: TDateTimeField;
    qContratoID_DOM_POSTAL: TFloatField;
    qContratoID_DOM_FISCAL: TFloatField;
    qContratoTIPO_CUENTA: TStringField;
    qContratoTIPO_ENVIO: TStringField;
    qContratoMAS: TStringField;
    qContratoCVE_CORRESP: TStringField;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QREmailwww: TQRExpr;
    qContratoCORREO: TStringField;
    QRChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRInterMemo2: TQRInterMemo;
    
    
    
    
    QRLabel12: TQRLabel;
    QRLabel59: TQRLabel;
    
    
    
    
    
    
    
    
    
    
    
    
    QRLabel58: TQRLabel;
    lFecFirma: TQRLabel;
    qSucCtto: TQuery;
    qDatosEmpresa: TQuery;
    QrySaltoLineas: TQuery;
    QRInterMemoNomEmp: TQRInterMemo;
    QRInterMemoDomic: TQRInterMemo;
    QRInterMemoCondusef: TQRInterMemo;
    QRInterMemoEscritura: TQRInterMemo;
    qDomicilioFiscalTELEFONO1: TStringField;
    qDomicilioFiscalTELEFONO2: TStringField;
    QRDBText17: TQRDBText;
    procedure groupTitularILineBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure detailILineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure detailDatosIdentificacionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure detailRepresentanteICBAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure groupHeaderTipoContratanteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure footerRepresentanteICBAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure detailDomicilioPostalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBTitElClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure pageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure headerFirmaClientesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  ProemioICB_PF: TProemioICB_PF;
  salta:boolean;
  vlSaltos : Integer;

Procedure Execute_ProemioICB_PF(padre: TProemioICB; pPreview: Boolean);

implementation

{$R *.DFM}

Uses
  unGene;     { Funciones Generales de Interacciones }


Procedure Execute_ProemioICB_PF(padre: TProemioICB; pPreview: Boolean);
Var proemio: TProemioICB_PF;
    vlLugarFecha,vlDescrip : String;
    vlPosicDatosEmp : Integer;
    vlPosNombre,vlPosDirec,vlPosCondusef, vlPosEscritura : Integer;
Begin
  proemio:= TProemioICB_PF.Create(nil);
  Try
    With proemio do
    Begin
      qContrato.DatabaseName:= Padre.DataBaseName;
      qContratantes.DatabaseName:= Padre.DataBaseName;
      qDomicilioFiscal.DatabaseName:= Padre.DataBaseName;
      qDomicilioPostal.DatabaseName:= Padre.DataBaseName;
      qChequeras.DatabaseName:= Padre.DataBaseName;
      qBeneficiarios.DatabaseName:= Padre.DataBaseName;
      qAccesoILine.DatabaseName:= Padre.DataBaseName;
      qContrato.SessionName:= Padre.SessionName;
      qContratantes.SessionName:= Padre.SessionName;
      qDomicilioFiscal.SessionName:= Padre.SessionName;
      qDomicilioPostal.SessionName:= Padre.SessionName;
      qChequeras.SessionName:= Padre.SessionName;
      qBeneficiarios.SessionName:= Padre.SessionName;
      qAccesoILine.SessionName:= Padre.SessionName;

      qSucCtto.DatabaseName:= Padre.DataBaseName;
      qSucCtto.SessionName:= Padre.SessionName;
      qSucCtto.ParamByName('pIdContrato').AsInteger := Padre.Contrato.ID_Contrato.AsInteger;

      qDatosEmpresa.DatabaseName:= Padre.DataBaseName;
      qDatosEmpresa.SessionName:= Padre.SessionName;
      qDatosEmpresa.ParamByName('pIdEmpresa').AsInteger := Padre.Contrato.Id_Empresa.AsInteger;

      QrySaltoLineas.DatabaseName:= Padre.DataBaseName;
      QrySaltoLineas.SessionName:= Padre.SessionName;
      QrySaltoLineas.ParamByName('pIdEmpresa').AsInteger := Padre.Contrato.Id_Empresa.AsInteger;
      QrySaltoLineas.ParamByName('pIdTitular').AsInteger := Padre.Contrato.ID_Titular.AsInteger;

      qContrato.ParamByName('Id_Contrato').AsInteger := Padre.Contrato.ID_Contrato.AsInteger;
      qContrato.Open;
      if not qContrato.IsEmpty then
      begin
        qContratantes.Open;
        qDomicilioFiscal.Open;
        qDomicilioPostal.Open;
        qChequeras.Open;
        qBeneficiarios.Open;
        qAccesoILine.Open;
        qSucCtto.Open;
        qDatosEmpresa.Open;
        QrySaltoLineas.Open;

        {***********************************************************************
         Inicializacion de Controles especiales del Reporte
         **********************************************************************}

         //------------------------------------------------------[
         if qSucCtto <> nil then
         begin
            qSucCtto.First;
            while not qSucCtto.Eof do
            begin
               vlLugarFecha := qSucCtto.FieldByName('DIR_PROEMIO').AsString;
               qSucCtto.Next;
            end;
         end;
         //------------------------------------------------------]

         //------------------------------------------------------[
         QRInterMemoNomEmp.Textos.Clear;
         QRInterMemoDomic.Textos.Clear;
         QRInterMemoCondusef.Textos.Clear;
         QRInterMemoEscritura.Textos.Clear;
         if qDatosEmpresa <> nil then
         begin
            vlPosNombre    := 0;
            vlPosDirec     := 0;
            vlPosCondusef  := 0;
            vlPosEscritura := 0;
            qDatosEmpresa.First;
            while not qDatosEmpresa.Eof do
            begin
               vlPosicDatosEmp := qDatosEmpresa.FieldByName('POSICION').AsInteger;
               if(qDatosEmpresa.FieldByName('DESC_MENSAJE').AsString = '') then
                  vlDescrip := ' '
               else
                  vlDescrip := qDatosEmpresa.FieldByName('DESC_MENSAJE').AsString;
                CASE vlPosicDatosEmp OF
                   1: begin
                         QRInterMemoNomEmp.Textos.Add(vlDescrip);
                         QRInterMemoNomEmp.Textos.Add(chr(13) + chr(10));
                         vlPosNombre := vlPosNombre + 1;
                         QRInterMemoDomic.Height := QRInterMemoDomic.Height + (15 * vlPosNombre);
                      end;
                   2: begin
                         QRInterMemoDomic.Textos.Add(vlDescrip);
                         QRInterMemoDomic.Textos.Add(chr(13) + chr(10));
                         vlPosDirec := vlPosDirec + 1;
                         QRInterMemoDomic.Height := QRInterMemoDomic.Height + (15 * vlPosDirec);
                      end;
                   3: begin
                         QRInterMemoCondusef.Textos.Add(vlDescrip);
                         QRInterMemoCondusef.Textos.Add(chr(13) + chr(10));
                         vlPosCondusef := vlPosCondusef + 1;
                         QRInterMemoDomic.Height := QRInterMemoDomic.Height + (15 * vlPosCondusef);
                      end;
                   else
                   begin
                      QRInterMemoEscritura.Textos.Add(vlDescrip);
                      QRInterMemoEscritura.Textos.Add(chr(13) + chr(10));
                      vlPosEscritura := vlPosEscritura + 1;
                      QRInterMemoDomic.Height := QRInterMemoDomic.Height + (15 * vlPosEscritura);
                   end
                END;
               qDatosEmpresa.Next;
            end;
            QRInterMemoNomEmp.Textos.Strings[0] := 'Nombre: ' + QRInterMemoNomEmp.Textos.Strings[0];
            QRInterMemoDomic.Textos.Strings[0] :=  'Domicilio: ' + QRInterMemoDomic.Textos.Strings[0];
         end;
         //------------------------------------------------------]

         //------------------------------------------------------[
         if QrySaltoLineas <> nil then
         begin
            QrySaltoLineas.First;
            while not QrySaltoLineas.Eof do
            begin
               vlSaltos := QrySaltoLineas.FieldByName('NUM_SALTO').AsInteger;
               QrySaltoLineas.Next;
            end;
         end;
         //------------------------------------------------------]

        memoPageHeader.Parametro.Strings[1]:= padre.Contrato.TitNombre.AsString;
        //lblLeyendaFirmas.Caption:= padre.TextoTipoFirma.AsString;
        lblLeyendaPiePagina.Caption:= padre.TextoPiePagina.AsString;
        detailRepresentanteICB.Items.Text:= UpperCase(padre.Representantes.GetRepresentantes('', chr(VK_RETURN)));
        If padre.Contrato.ConfigCaptura.B_Prospecto.AsString = 'V' Then
        Begin
          memoPageHeader.Parametro.Strings[0]:= '____________________________________';
          lblContrato.Caption:= '____________________________________';
          lblFAlta.Caption:= '____________________________';
          lblFAlta_Footer.Caption:= FmtFecha(Padre.F_Firma.AsDateTime, '@DD-@MMM-@YYYY');      // CZR 31-Ago-09
        end
        else
        Begin
          memoPageHeader.Parametro.Strings[0]:= padre.Contrato.ID_Contrato.AsString;
          lblContrato.Caption:= padre.Contrato.ID_Contrato.AsString;
          lblFAlta.Caption:= FmtFecha(padre.Contrato.F_Alta.AsDateTime, '@DD-@MMM-@YYYY');
          lblFAlta_Footer.Caption:= FmtFecha(Padre.F_Firma.AsDateTime, '@DD-@MMM-@YYYY');      // CZR 31-Ago-09
        end;
        //Fecha de Firma del Contrato en la primera hoja, parte superior.
        //lFecFirma.Caption := FmtFecha(Padre.F_Firma.AsDateTime, '@DD-@MMM-@YYYY');            // CZR 31-Ago-09
        lFecFirma.Caption := 'Lugar y fecha de firma de este Contrato: ' + vlLugarFecha + FmtFecha(Padre.F_Firma.AsDateTime, '@DD-@MMM-@YYYY');            // Wlopez Febrero 2013


        {Hoja de Firmas}
        lblRepresentantes.Caption:= UpperCase(padre.Representantes.GetRepresentantes('', '  o  '));

        If pPreview then
          Preview
        else Print;

        qContrato.Close;
        qContratantes.Close;
        qDomicilioFiscal.Close;
        qDomicilioPostal.Close;
        qChequeras.Close;
        qBeneficiarios.Close;
        qAccesoILine.Close;
        qSucCtto.Close;
        qDatosEmpresa.Close;
        QrySaltoLineas.Close;        
      end
      else
        MessageDlg('Error al Identificar el Contrato ' + Padre.Contrato.Id_Contrato.AsString, mtError, [mbOK], 0);
    end;

  Finally
    proemio.Free; proemio:= nil;
  end;
end;


procedure TProemioICB_PF.groupTitularILineBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin lblServicios.Enabled:= True;
end;

procedure TProemioICB_PF.detailILineAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin lblServicios.Enabled:= False;
end;

procedure TProemioICB_PF.detailDatosIdentificacionBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin lblNombres.Enabled:= True;
end;

procedure TProemioICB_PF.detailRepresentanteICBAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  lblNombres.Enabled:= False;
end;

procedure TProemioICB_PF.groupHeaderTipoContratanteBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin PrintBand:= qContratantes.FieldByName('CVE_CONTRATANTE').asString = cCtteRepMenor;
end;

procedure TProemioICB_PF.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin pageHeader.Enabled:= True;
end;

procedure TProemioICB_PF.detailDomicilioPostalBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if qContratoCVE_CORRESP.Text = 'WW' then
    begin
      QRLabel33.Caption:='';
      QRLabel34.Caption:='';
      QRLabel35.Caption:='';
    end
    else
    begin
    QREmailwww.Caption:='';
    QREmailwww.Transparent:=true;
    end;
end;

procedure TProemioICB_PF.QRBTitElClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var numReg:Integer;
begin
  //numReg:= qContrato.SQL.Count;
end;

procedure TProemioICB_PF.footerRepresentanteICBAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   pageHeader.Enabled := False;
   if salta = true then // Esta vaina es para que salta a la 4a. hoja que es hoja en blanco en el contrato,
    forcenewpage();     // para imprimir el adicional de las firmas, cuando son mas de 3 firmas.
end;

procedure TProemioICB_PF.pageHeaderAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
{var
   cotitulares : Integer;}
begin
  {ProemioICB_PF := TProemioICB_PF.Create(nil);
   qContratantes.ParamByName('ID_CONTRATO').AsInteger := SELF.qContrato.FieldByName('ID_CONTRATO').AsInteger;
   if qContratantes <> nil then
   begin
      cotitulares := 0;
      qContratantes.Open;
      qContratantes.First;
      while not qContratantes.Eof do
      begin
         cotitulares := cotitulares + 1;
         qContratantes.Next;
      end;
      qContratantes.First;
   end;
   ShowMessage(' Numero de Contratantes (qContratantes.sql.count)      ' + IntTOStr(qContratantes.sql.count) + chr(10) + chr(13) +
               ' Numero de Contratantes (qContratantes.RecordCount - ) ' + IntTOStr(qContratantes.RecordCount) + chr(10) + chr(13) +
               ' EL RECORRIDO CON EL DO WHILE (cotitulares)            ' + IntTOStr(cotitulares) + chr(10) + chr(13) +
               ' CONTRATO:                                             ' + IntTOStr(SELF.qContrato.FieldByName('ID_CONTRATO').AsInteger));}

   if qContratantes.RecordCount > 3 then // Si tiene mas de tres titulares el contrato, imprimir en la siguiente hoja
   begin
      headerFirmaClientes.Enabled       := False; // Esta es la banda grande con el pie que dice " E L  C L I E N T E "
      QRChildBand1.Enabled              := True;  // Esta es la banda para la siguiente hoja que dice " E L  C L I E N T E "
      QRInterMemo2.Parametro.Strings[0] := SELF.qContrato.FieldByName('ID_CONTRATO').AsString;
      QRInterMemo2.Parametro.Strings[1] := SELF.qContrato.FieldByName('F_ALTA').AsString;
      QRInterMemo2.Parametro.Strings[2] := qContratantes.FieldByName('NOMBRE').AsString;
      salta                             := True;
   end
   else
   begin
      headerFirmaClientes.Enabled := True;  // Esta es la banda grande con el pie que dice " E L  C L I E N T E "
      QRChildBand1.Enabled        := False; // Esta es la banda para la siguiente hoja que dice " E L  C L I E N T E "
      salta                       := False;
   end;
end;
procedure TProemioICB_PF.headerFirmaClientesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   //headerFirmaClientes.Height := 671
   //QRLabel11.Top := 636
   headerFirmaClientes.Height := 10 * vlSaltos;
   QRLabel11.Top := headerFirmaClientes.Height - 35;
end;

end.
