�
 TQRTIPCUENTA 0`  TPF0TqrTipCuentaqrTipCuentaLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSet
qTipCuentaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values3333333�@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmptyReportTitleTipos de Cuenta
SnapToGrid	UnitsNativeZoomd TQRBandColumnHeaderBand1Left%Top� Width�Height4Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.ValuesUUUUUU��@������f�	@ BandTyperbColumnHeader TQRShapeQRShape1Left TopWidth�Height#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU5�@          UUUUUUU�@������f�	@ ShapeqrsTopAndBottom  TQRLabelQRLabel1LeftTopWidth:HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��@UUUUUU��@UUUUUUu�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTipo CuentaColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2LeftbTopWidth:HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU��@UUUUUU��@UUUUUUu�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionDescripci�nColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left%Top0Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values      @�@������f�	@ BandTyperbPageHeader TQRInterEncabezadoqrieTipCuentaLeft Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                    ������f�	@ Titulo1Tipos de Cuenta
NomReporteRpTipCuentaAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQRBandbDetalleLeft%Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.ValuesUUUUUUU�@������f�	@ BandTyperbDetail 	TQRDBText
QRDBText18LeftTop WidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUUU�@      ��@                 �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet
qTipCuenta	DataFieldCVE_TIPO_CUENTAFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial Narrow
Font.Style Mask#,###
ParentFontTransparentWordWrap	FontSize  	TQRDBText
QRDBText19LeftbTop Width,HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@ XUUUU��@           ������	@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet
qTipCuenta	DataFieldDESC_TIPO_CUENTAFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial Narrow
Font.Style Mask###,###,###,###,##0.00
ParentFontTransparentWordWrap	FontSize   TQuery
qTipCuentaDatabaseNameRCORPSQL.StringsSELECT * FROM TIPO_CUENTAORDER BY CVE_TIPO_CUENTA Left(Top TStringFieldqTipCuentaCVE_TIPO_CUENTA	FieldNameCVE_TIPO_CUENTAOrigin!RCORP.TIPO_CUENTA.CVE_TIPO_CUENTASize  TStringFieldqTipCuentaDESC_TIPO_CUENTA	FieldNameDESC_TIPO_CUENTAOrigin"RCORP.TIPO_CUENTA.DESC_TIPO_CUENTASize(    