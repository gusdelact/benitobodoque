�
 TREPORTEPZACOMP 0$  TPF0TReportePzaCompReportePzaCompLeft Top Width Height0Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.OrientationpoLandscapePage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstReportTitle!Listado de Plazas de Compensaci�n
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values `UUUU��@ ������
@ BandTyperbDetail 	TQRDBText	QRDBText1Left0Top Width=HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@       �@           XUUUUe�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldID_PLAZATransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� Top WidthOHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ �������@           XUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataField	NOM_PLAZATransparentWordWrap	FontSize
  	TQRDBText	QRDBText4LeftpTop Width0HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@     `�	@                 �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldF_ALTATransparentWordWrap	FontSize
  	TQRDBText	QRDBText5LeftTop Width1HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ XUUUU��
@           XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetQuery1	DataFieldF_BAJATransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TopkWidth�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUUU�@ ������
@ BandTyperbColumnHeader TQRLabelQRLabel5Left0TopWidth'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@       �@ XUUUUU�@     `�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPlazaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6Left� TopWidth9HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ �������@ XUUUUU�@      Ж@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionNombreColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�Height	Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@ XUUUUU�@       �@      ��
@ Shape
qrsHorLine  TQRLabel	QRLabel10LeftpTopWidthJHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@     `�	@ XUUUUU�@ �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
Fecha AltaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabel	QRLabel11LeftTopWidthOHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values PUUUU�@ XUUUU��
@ XUUUUU�@ XUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
Fecha BajaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@ ������
@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top Width�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                     ������
@ Titulo1PLAZA DE COMPENSACION
NomReporteCORP-RP-PZACOMAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQueryQuery1SQL.StringsSelect Pza_compensacion.*From  Pza_Compensacion	Order by 
 Nom_plaza LeftpTop   