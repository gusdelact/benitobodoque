�
 TREPORTEACTI 03  TPF0TReporteActiReporteActiLeft�Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstPrintIfEmptyReportTitleListado de Actividades
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values       �@UUUUUU��	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidthiHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU�@UUUUUUU�@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldCVE_ACTIV_CTOTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� TopWidthoHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@       �@UUUUUUU�@      ؒ@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_ACTIVIDADTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3LeftTopWidthaHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      V�	@UUUUUUU�@������R�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataField
B_PRESENTAOnPrintQRDBText3PrintTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TopkWidth�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUUU�@UUUUUU��	@ BandTyperbColumnHeader TQRLabelQRLabel5LeftTop Width*HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@UUUUUUU�@                @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionClaveColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6Left� Top WidthVHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@       �@          ��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionDescripci�nColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@ XUUUUU�@       �@ �����~�	@ Shape
qrsHorLine  TQRLabelQRLabel9Left�Top WidthAHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@      P�	@          ��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPresentaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@UUUUUU��	@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                    UUUUUU��	@ Titulo1CAT�LOGO DE ACTIVIDADES
NomReporterActividadesAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQueryQuery1DatabaseNamePCORPSQL.StringsSelect * From Act_Contratoorder by Cve_Activ_Cto LeftxTop  TStringFieldQuery1CVE_ACTIV_CTO	FieldNameCVE_ACTIV_CTOOrigin PCORP.ACT_CONTRATO.CVE_ACTIV_CTOSize  TStringFieldQuery1CVE_ACTIV_ORIG	FieldNameCVE_ACTIV_ORIGOrigin!PCORP.ACT_CONTRATO.CVE_ACTIV_ORIGSize  TStringFieldQuery1DESC_ACTIVIDAD	FieldNameDESC_ACTIVIDADOrigin!PCORP.ACT_CONTRATO.DESC_ACTIVIDADSize�   TStringFieldQuery1B_PRESENTA	FieldName
B_PRESENTAOriginPCORP.ACT_CONTRATO.B_PRESENTA	FixedChar	Size    