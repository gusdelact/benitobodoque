�
 TREPORTEUNNEG 04  TPF0TReporteUnNegReporteUnNegLeft Top Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmptyReportTitleUnidad de Negocio
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values       �@UUUUUU��	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidthaHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUUU�@ XUUUUU�@ �����R�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataField
ID_ENTIDADTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUUU�@ XUUUUU�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_ENTIDADTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3Left�TopWidth!HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      ��	@ XUUUUU�@ XUUUU)�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldDESC_ENTIDAD_1TransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TopkWidth�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUUU�@UUUUUU��	@ BandTyperbColumnHeader TQRLabelQRLabel5LeftTop WidthaHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@ XUUUUU�@           �����R�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption
Id EntidadColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6Left� Top WidthiHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@ XUUUUU�@                �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionDescripci�nColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU�@ XUUUUU�@       �@ �����~�	@ Shape
qrsHorLine  TQRLabelQRLabel9Left�Top WidthGHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@      ��	@           �����ڻ@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	Ubicaci�nColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@UUUUUU��	@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                     PUUUU��	@ Titulo1UNIDAD DE NEGOCIO
NomReporteCORP-RP-UNNEGAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQueryQuery1SQL.StringsDselect Unidad.Id_Entidad, Unidad.Desc_entidad, TipoEnt.Desc_entidad,       PM.Nom_Razon_Socialfrom Unidad_Negocio Unidad,        Unidad_Negocio TipoEnt,        Persona_Moral PM2where Unidad.id_entidad = TipoEnt.Id_Ent_Ubica and,           Unidad.Id_empresa = PM.Id_persona Left� Top   