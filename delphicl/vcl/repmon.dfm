�
 TREPORTEMON 0<  TPF0TReporteMon
ReporteMonLeft7�Top Width Height0Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.OrientationpoLandscapePage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstReportTitleListado de Tipos de Monedas
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values `UUUU��@ ������
@ BandTyperbDetail 	TQRDBText	QRDBText1Left0Top Width\HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@       �@           �����j�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataField
CVE_MONEDATransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� Top WidtheHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ �������@           XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_MONEDATransparentWordWrap	FontSize
  	TQRDBText	QRDBText3Left�Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUU��	@                ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldCVE_FREC_REV_MONTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4LeftpTop WidthnHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@     `�	@           XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldF_ULT_REV_MONTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5LeftTop WidthzHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ XUUUU��
@           XUUUUe�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldF_PROX_REV_MONTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TopkWidth�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUUU�@ ������
@ BandTyperbColumnHeader TQRLabelQRLabel5Left0TopWidth*HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@       �@ XUUUUU�@      @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionClaveColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6Left� TopWidthVHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ �������@ XUUUUU�@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionDescripci�nColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�Height	Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ XUUUUU�@       �@      ��
@ Shape
qrsHorLine  TQRLabelQRLabel9Left�TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUU��	@ XUUUUU�@      x�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionFrecuencia RevisionColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel10LeftpTopWidthiHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@     `�	@ XUUUUU�@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionFecha Ult. RevColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel11LeftTopWidthvHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUU��
@ XUUUUU�@ ������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionFecha Prox. RevColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@ ������
@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                     ������
@ Titulo1MONEDAS
NomReporteCORP-RP-MONAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.Style 
ParentFont   TQueryQuery1DatabaseNamedbCorpSQL.StringsSelect * From MonedaOrder by Desc_Moneda LeftpTop   