�
 TRPCGBPM 0�  TPF0TrpCGBPMrpCGBPMLeft Top WidthHeightcFrame.ColorclSilverFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightFrame.WidthdDataSetQryCttoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLEDETAILREPRESENTANTEICB Functions.DATA00'''' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeA4Page.Values       �@      ��
@       �@      @�
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinAutoPrintIfEmpty	
SnapToGrid	UnitsPixelsZoomd TQRBandQRBand2Left&Top&Width�Height�Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      �	@ �����v�	@ BandTyperbDetail TQRInterMemoQRInterMemo2LeftTopeWidth�Height� Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@       �@      $�@     :�	@ Textos.StringsTexto Parametro.StringsNombreRepresentanteNombreCliente
IdContratotipoContratodiscrecionalidad AlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TQRInterMemoQRInterMemo1LeftTopWidth�HeightAFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values �������@ XUUUUU�@ XUUUUM�@ �����4�	@ Textos.StringsGRUPO FINANCIERO INTERACCIONES P R E S E N T E. AlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TQRLabelQRFechaLeftTop� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��@       �@ XUUUU��	@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchCaptionQRFechaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabel
QRLEmpresaLeftTop� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUUU�@      ��@ XUUUU_�	@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption
QRLEmpresaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRChildBandQRChildBand1Left&Top�Width�Height� Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������.�@ �����v�	@ 
ParentBandQRBand2 TQRLabel	QRLabel18Left0Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@       �@��������@ XUUUU��	@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption3___________________________________________________ColorclWhiteTransparentWordWrap	FontSize
  TQRLabel	QRLabel19Left/TopJWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUU��@��������@ XUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionA T E N T A M E N T E ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel42Left0Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@       �@       �@ XUUUU��	@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption	QRLabel42ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
   TQueryQryCttoDatabaseNameDCORPSQL.Strings3SELECT cto.id_contrato, cto.id_titular, per.nombre,=       TO_CHAR (SYSDATE, 'dd/mm/yyyy') AS fecha, email.correo5  FROM contrato cto,persona per, cto_email_edc email * WHERE cto.id_contrato      = :id_contrato,   and per.id_persona       = cto.id_titular-   and email.id_contrato(+) = cto.id_contrato LeftTop� 	ParamDataDataType	ftUnknownNameid_contrato	ParamType	ptUnknown   TFloatFieldQryCttoID_CONTRATO	FieldNameID_CONTRATO  TFloatFieldQryCttoID_TITULAR	FieldName
ID_TITULAR  TStringFieldQryCttoNOMBRE	FieldNameNOMBRESizeP  TStringFieldQryCttoFECHA	FieldNameFECHASize
  TStringFieldQryCttoCORREO	FieldNameCORREOSized    