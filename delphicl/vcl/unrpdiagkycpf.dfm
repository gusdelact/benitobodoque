�
 TQRDIAGKYCPF 0  TPF0TqrDiagKYCPFqrDiagKYCPFLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSet	qContratoFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values3333333�@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmptyReportTitleDestino de Recursos
SnapToGrid	UnitsNativeZoomd TQRGroupQRGroup1Left%Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@������f�	@ 
ExpressionqContrato.SECCIONMasterOwnerReprintOnNewPage TQRShapeQRShape1Left TopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUUU�@UUUUUUU� @UUUUUU��	@ ShapeqrsRectangle  	TQRDBText	QRDBText1Left8TopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUUU�@������*�@UUUUUUU�@��������	@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchColorclWhiteDataSet	qContrato	DataFieldSECCIONFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandQRBand1Left%Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageLinkBandQRGroup1Size.Values      ��@������f�	@ BandTyperbDetail 	TQRDBText	QRDBText2Left(Top Width/HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@          TUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet	qContrato	DataFieldCOLUMNAFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText3LeftXTop Width HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      p�	@          UUUUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet	qContrato	DataFieldVALORFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRBandQRBand2Left%Top0Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values     @�@������f�	@ BandTyperbPageHeader TQRInterEncabezadoQRInterEncabezado1Left Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values     @�@                    ������f�	@ AlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQRChildBand
ChildBand1Left%Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������*�@������f�	@ 
ParentBandQRBand2 TQRLabelQRLabel1Left(TopWidth(HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@UUUUUUU�@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCampoColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2LeftXTopWidth*HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      p�	@UUUUUUU�@     @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionEstatusColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape6Left�TopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������*�@UUUUUUU��������j�@      ��
@ Shape
qrsHorLine   TQuery	qContratoDatabaseNameTCCORPSQL.StringsISELECT SECCION, COLUMNA, DECODE(VALOR,1,'CAPTURADO','NO CAPTURADO') VALORD  from ( table(pkgKYCFunProc.ValInfoKYC(:pIdContrato, 'R2', 'F') ) )    Left(Top	ParamDataDataType	ftUnknownNamepIdContrato	ParamType	ptUnknown   TStringFieldqContratoSECCION	FieldNameSECCIONSizeP  TStringFieldqContratoCOLUMNA	FieldNameCOLUMNASize  TStringFieldqContratoVALOR	FieldNameVALORSize   TDataSource
dsContratoDataSet	qContratoLeftXTop   