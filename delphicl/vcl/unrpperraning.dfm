�
 TQRPERRANING 0Y  TPF0TqrPerRanIngqrPerRanIngLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSet
qPerRanIngFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values3333333�@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmptyReportTitleRango de Ingresos
SnapToGrid	UnitsNativeZoomd TQRBandColumnHeaderBand1Left%Top� Width�Height4Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.ValuesUUUUUU��@ �����f�	@ BandTyperbColumnHeader TQRShapeQRShape1Left TopWidth�Height#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU5�@          UUUUUUU�@������f�	@ ShapeqrsTopAndBottom  TQRLabelQRLabel1Left1TopWidth HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ XUUUU��@UUUUUU��@ XUUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionRangoColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2Left� TopWidthEHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      �@UUUUUU��@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionMonto M�ximoColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left%Top0Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values      @�@ �����f�	@ BandTyperbPageHeader TQRInterEncabezadoqriePerRanIngLeft Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                    ������f�	@ Titulo1Rango de Ingresos
NomReporteRpPerRanIngAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQRBandbDetalleLeft%Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values XUUUUU�@ �����f�	@ BandTyperbDetail 	TQRDBText
QRDBText18Left$Top Width-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@      ��@                 �@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet
qPerRanIng	DataFieldID_RANGO_INGRESOFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial Narrow
Font.Style Mask#,###
ParentFontTransparentWordWrap	FontSize  	TQRDBText
QRDBText19Left� Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@ XUUUUU�@                ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet
qPerRanIng	DataFieldMONTO_MAXIMOFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial Narrow
Font.Style Mask###,###,###,###,##0.00
ParentFontTransparentWordWrap	FontSize   TQuery
qPerRanIngDatabaseNameRCORPSQL.StringsSELECT * FROM PER_RANG_INGRESOORDER BY ID_RANGO_INGRESO  Left(Top TFloatFieldqPerRanIngID_RANGO_INGRESO	FieldNameID_RANGO_INGRESOOrigin'RCORP.PER_RANG_INGRESO.ID_RANGO_INGRESO  TFloatFieldqPerRanIngMONTO_MAXIMO	FieldNameMONTO_MAXIMOOrigin#RCORP.PER_RANG_INGRESO.MONTO_MAXIMO    