�
 TREPORTEPUEST 0�  TPF0TReportePuestReportePuestLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightBeforePrintReportePuestBeforePrintDataSetQuery1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' 
OnNeedDataReportePuestNeedDataOptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstPrintIfEmpty
SnapToGrid	UnitsMMZoomd TQRBandPageHeaderBand1Left0Top0Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@�������	@ BandTyperbPageHeader TQRInterEncabezadoQRInterEncabezado1Left Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                           �	@ Titulo1PUESTOS
NomReporteCORP-RP-PUESTAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQRBandColumnHeaderBand1Left0Top� Width�Height-Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values       �@�������	@ BandTyperbColumnHeader TQRLabelQRLabel1LeftTopWidth HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUUU�@ XUUUUU�@ XUUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionClaveColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel2Left`TopWidthEHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@       �@ XUUUUU�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionDescripci�nColorclWhiteTransparentWordWrap	FontSize
   TQRBandDetailBand1Left0Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomBeforePrintDetailBand1BeforePrintColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUU�@�������	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidthAHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUUU�@ XUUUUU� @ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretch	ColorclWhiteDataSetQuery1	DataField
CVE_PUESTOTransparentWordWrap	FontSize
  TQRLabellbDescPuestoLeft\Top WidthmHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ �����j�@                b�	@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretch	CaptionlbDescPuestoColorclWhiteTransparentWordWrap	FontSize
   TQueryQuery1DatabaseNamedbCorpSQL.StringsSelect Cve_Puesto, Desc_PuestoFrom PuestoOrder by Desc_Puesto Left Top   