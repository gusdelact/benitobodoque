�
 TREPORTETCTTE 0P  TPF0TReporteTCtteReporteTCtteLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstPrintIfEmptyReportTitle Listado de Tipos de Contratantes
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values       �@UUUUUU��	@ BandTyperbDetail 	TQRDBText	QRDBText1Left0TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@       �@UUUUUUU�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldCVE_CONTRATANTETransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@UUUUUUU�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_CONTRATANTETransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TopkWidth�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUUU�@UUUUUU��	@ BandTyperbColumnHeader TQRLabelQRLabel5Left0Top Width*HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@       �@                @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionClaveColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6Left� Top WidthVHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@UUUUUU��@          ��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionDescripci�nColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@ XUUUUU�@       �@ �����~�	@ Shape
qrsHorLine   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@UUUUUU��	@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                    UUUUUU��	@ Titulo1TIPOS DE CONTRATANTES
NomReporteCORP-RP-SEGMAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQueryQuery1SQL.StringsSelect * From Tipo_Contratanteorder by Desc_Contratante LeftxTop   