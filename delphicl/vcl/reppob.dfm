�
 TREPORTEPOB 0p  TPF0TReportePob
ReportePobLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstPrintIfEmptyReportTitlePoblaciones
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUUU�@UUUUUU��	@ BandTyperbDetail 	TQRDBText	QRDBText1Left Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUUU�@           PUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_POBLACIONTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUUU�@           �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_POBLACION_1TransparentWordWrap	FontSize
  	TQRDBText	QRDBText3Left�Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUUe�	@                �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_POBLACION_2TransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TopkWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@UUUUUU��	@ BandTyperbColumnHeader TQRLabelQRLabel5Left TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUUU�@ XUUUUU�@ �����
�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPaisColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6Left TopWidth2HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUUU�@ XUUUUU�@ �����J�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionEstadoColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@ XUUUUU�@       �@ �����~�	@ Shape
qrsHorLine  TQRLabelQRLabel9Left�TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUUe�	@ XUUUUU�@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCiudad/Delegaci�n/MunicipioColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@UUUUUU��	@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                     PUUUU��	@ Titulo1POBLACIONES
NomReporteCORP-RP-POBAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.Style 
ParentFont   TQueryQuery1DatabaseNamedbCorpSQL.StringsHSelect pais.desc_poblacion, estado.desc_poblacion, ciudad.desc_poblacionFrom poblacion pais,     poblacion estado,     poblacion ciudad5Where (estado.cve_poblac_ubic =   pais.cve_poblacion)5  and (ciudad.cve_poblac_ubic = estado.cve_poblacion)Jorder by pais.desc_poblacion, estado.desc_poblacion, ciudad.desc_poblacion Left� Top   