unit UnProemioICB_PM;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm, Dialogs, InterMemo,
    IntProemioICB;    { Pantalla de Seleccion de Parametros para Proemio ICB }

type
  TProemioICB_PM = class(TQuickRep)
    detalleContrato: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
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
    pageHeader: TQRBand;
    memoPageHeader: TQRInterMemo;
    qContrato: TQuery;
    dsContrato: TDataSource;
    qCliente: TQuery;
    qChequeras: TQuery;
    qActaConstitutiva: TQuery;
    qAccesoILine: TQuery;
    EspacioMembrete: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRInterMemo1: TQRInterMemo;
    QRLabel18: TQRLabel;
    lblContrato: TQRLabel;
    pageFooter: TQRBand;
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
    detailCliente: TQRSubDetail;
    QRLabel19: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel1: TQRLabel;
    detailActaConsitutiva: TQRSubDetail;
    detailRepresentantes: TQRSubDetail;
    headerILine: TQRGroup;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel65: TQRLabel;
    groupTitularILine: TQRGroup;
    QRLabel62: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel63: TQRLabel;
    detailILine: TQRSubDetail;
    QRDBText37: TQRDBText;
    lblServicios: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel70: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText2: TQRDBText;
    qRepresentantes: TQuery;
    QRDBText8: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel74: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel56: TQRLabel;
    QRExpr1: TQRExpr;
    headerChequeras: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    headerRepresentantes: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel59: TQRLabel;
    
    QRExpr2: TQRExpr;
    detailTipoCuenta: TQRSubDetail;
    detailManejoCuenta: TQRSubDetail;
    detailInstrucciones: TQRSubDetail;
    QRLabel52: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRInterMemo4: TQRInterMemo;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRInterMemo5: TQRInterMemo;
    detailEnvioDocumentacion: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    detailDatosIdentificacion: TQRSubDetail;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    detailRepresentanteICB: TQRStringsBand;
    QRExpr3: TQRExpr;
    lblNombres: TQRLabel;
    detailFirmas: TQRSubDetail;
    QRChildBand1: TQRChildBand;
    QRLabel48: TQRLabel;
    QRLabel67: TQRLabel;
    lblRepresentantes: TQRLabel;
    lblCliente: TQRLabel;
    QRShape4: TQRShape;
    QRChildBand2: TQRChildBand;
    shapeLineaFirma: TQRShape;
    footerRepresentanteICB: TQRBand;   
    qContratoID_CONTRATO: TFloatField;
    qContratoID_TITULAR: TFloatField;
    qContratoF_ALTA: TDateTimeField;
    qContratoID_DOM_POSTAL: TFloatField;
    qContratoCVE_CORRESP: TStringField;
    qContratoID_DOM_FISCAL: TFloatField;
    qContratoTIPO_CUENTA: TStringField;
    qContratoTIPO_ENVIO: TStringField;
    qContratoMAS: TStringField;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QREmailwww: TQRExpr;
    qContratoCORREO: TStringField;
    lFecFirma: TQRLabel;
    QRLabel58: TQRLabel;
    lblFAlta: TQRLabel;        
    QRLabel64: TQRLabel;
    QRLabel66: TQRLabel;
    qSucCtto: TQuery;
    QRLabel57: TQRLabel;
    lblFAlta_Footer: TQRLabel;
    lblLeyendaPiePagina: TQRLabel;
    qDatosEmpresa: TQuery;
    QrySaltoLineas: TQuery;
    QRInterMemoNomEmp: TQRInterMemo;
    QRInterMemoDomic: TQRInterMemo;
    QRInterMemoCondusef: TQRInterMemo;
    QRInterMemoEscritura: TQRInterMemo;
    QRDBText15: TQRDBText;
    procedure groupTitularILineBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure detailILineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure detailDatosIdentificacionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure detailRepresentanteICBAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure footerRepresentanteICBAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure detailClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure detailFirmasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  ProemioICB_PM: TProemioICB_PM;
  vlSaltos : Integer;

Procedure Execute_ProemioICB_PM(padre: TProemioICB; pPreview: Boolean);

implementation

{$R *.DFM}

Uses
  unGene;     { Funciones Generales de Interacciones }


Procedure Execute_ProemioICB_PM(padre: TProemioICB; pPreview: Boolean);
Var proemio: TProemioICB_PM;
    vlLugarFecha, vlDescrip  : String;
    vlPosicDatosEmp : Integer;
    vlPosNombre,vlPosDirec,vlPosCondusef, vlPosEscritura : Integer;
Begin
  proemio:= TProemioICB_PM.Create(nil);
  Try
    With proemio do
    Begin
      qContrato.DatabaseName:= Padre.DataBaseName;
      qCliente.DatabaseName:= Padre.DataBaseName;
      qChequeras.DatabaseName:= Padre.DataBaseName;
      qActaConstitutiva.DatabaseName:= Padre.DataBaseName;
      qRepresentantes.DatabaseName:= Padre.DataBaseName;
      qAccesoILine.DatabaseName:= Padre.DataBaseName;

      qContrato.SessionName:= Padre.SessionName;
      qCliente.SessionName:= Padre.SessionName;
      qChequeras.SessionName:= Padre.SessionName;
      qActaConstitutiva.SessionName:= Padre.SessionName;
      qRepresentantes.SessionName:= Padre.SessionName;
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
        qCliente.Open;
        qChequeras.Open;
        qActaConstitutiva.Open;
        qRepresentantes.Open;
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
        //lFecFirma.Caption := FmtFecha(Padre.F_Firma.AsDateTime, '@DD-@MMM-@YYYY');             // CZR 31-Ago-09
        lFecFirma.Caption := 'Lugar y fecha de firma de este Contrato: ' + vlLugarFecha + FmtFecha(Padre.F_Firma.AsDateTime, '@DD-@MMM-@YYYY');             // Wlopez Febrero 2013

        {Hoja de Firmas}
        lblCliente.Caption:= UpperCase(padre.Cliente.AsString);
        lblRepresentantes.Caption:= UpperCase(padre.Representantes.GetRepresentantes('', '  o  '));

        If pPreview then
          Preview
        else Print;

        qContrato.Close;
        qCliente.Close;
        qChequeras.Close;
        qActaConstitutiva.Close;
        qRepresentantes.Close;
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


procedure TProemioICB_PM.groupTitularILineBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin lblServicios.Enabled:= True;
end;

procedure TProemioICB_PM.detailILineAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin lblServicios.Enabled:= False;
end;

procedure TProemioICB_PM.detailDatosIdentificacionBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin lblNombres.Enabled:= True;
end;

procedure TProemioICB_PM.detailRepresentanteICBAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin lblNombres.Enabled:= False;
end;

procedure TProemioICB_PM.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin pageHeader.Enabled:= True;
end;



procedure TProemioICB_PM.footerRepresentanteICBAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin pageHeader.Enabled:= False;
end;

procedure TProemioICB_PM.detailClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qContratoCVE_CORRESP.Text = 'WW' then
    begin
      QRLabel33.Caption:='';
      QRLabel34.Caption:='';
      QRLabel35.Caption:='';
    end
    else
//    QREmailwww.Caption:='';
    begin
    QREmailwww.Caption:='';
    QREmailwww.Transparent:=true;
    end;

end;

procedure TProemioICB_PM.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   //QRChildBand1.Height 306
   //QRLabel48.TOP              39 (QRChildBand1.Height - 267)    E L   C L I E N T E
   //lblCliente.TOP             89 (QRChildBand1.Height - 217)    Aqui se imprime el nombre del cliente
   //QRShape4.TOP               97 (QRChildBand1.Height - 209)    Aqui la rayita para firma del cliente
   //QRLabel67.TOP             237 (QRChildBand1.Height -  69)    L A   C A S A   D E   B O L S A
   //lblRepresentantes.TOP     292 (QRChildBand1.Height -  14)    Aqui Representantes

{   QRChildBand1.Height := 10 * vlSaltos;
   QRLabel48.TOP         := QRChildBand1.Height - 267;
   lblCliente.TOP        := QRChildBand1.Height - 217;
   QRShape4.TOP          := QRChildBand1.Height - 209;
   QRLabel67.TOP         := QRChildBand1.Height -  69;
   lblRepresentantes.TOP := QRChildBand1.Height -  14;
 }
end;

procedure TProemioICB_PM.detailFirmasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if((10 * vlSaltos) >=37 ) then
      detailFirmas.Height := (10 * vlSaltos) - 37
   else
      detailFirmas.Height := (10 * vlSaltos);
end;

end.
