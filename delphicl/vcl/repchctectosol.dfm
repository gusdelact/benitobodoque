�
 TWREPCHCTECTOSOL 0�  TPF0TwRepChCteCtoSolwRepChCteCtoSolLeft Top Width Height0Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetQuery1Description.StringsListado de Requisitos Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.OrientationpoLandscapePage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPagePrinterSettings.LastPagePrinterSettings.OutputBinFirstPrintIfEmptyReportTitleReporte de Chequeras
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@ ������
@ BandTyperbDetail 	TQRDBText	QRDBText2LeftTop Width	HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUUU�@           XUUUUI�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldNOMBREFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText1Left(Top Width	HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ �������@           XUUUUI�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldINTERMEDIARIOFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText3LeftETop Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ XUUUU'�	@           �����&�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataField	NOM_PLAZAFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText4Left5Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@ �����Ç
@           �������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldCUENTA_BANCOFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRBandColumnHeaderBand1Left&TopkWidth�Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values XUUUUU�@ ������
@ BandTyperbColumnHeader TQRLabelQRLabel5Left(Top WidthaHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@ �������@           �����R�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionIntermediarioColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6LeftTop WidthiHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@ XUUUUU�@                �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionNombreColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRShapeQRShape2LeftTopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUUU� @ XUUUUU�@       �@ XUUUUk�
@ Shape
qrsHorLine  TQRLabelQRLabel9LeftHTop Width'HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@UUUUUU%�	@                `�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPlazaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel1Left8Top Width4HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@������B�
@          UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCuentaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBandPageHeaderBand1Left&TopWidth�HeightTFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      @�@ ������
@ BandTyperbPageHeader TQRMacvHeaderQRMacvHeader1Left Top WidthHeight(Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      @�@                    �������
@ Titulo10Solicitud(es) Relacion Chequera Cliente Contrato
NomReporteCORP-RP-CHCTEAlignToBandColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameARIAL
Font.StylefsBold 
ParentFont   TQueryQuery1DatabaseNamedbCorpSQL.StringsSelect Chequera_Cte.*, Persona.Nombre,. Persona_moral.Nom_razon_social Intermediario, Pza_Compensacion.Nom_plazaFrom  Chequera_Cte,	 Persona, Persona_Moral, Pza_CompensacionWhere- Chequera_Cte.Id_persona = persona.Id_persona; and Chequera_Cte.id_banco_chqra = Persona_moral.id_persona6 and Chequera_cte.id_plaza = pza_compensacion.id_plaza	Order By  Persona.Nombre,  Persona_moral.Nom_razon_social, Pza_Compensacion.Nom_plaza Left�Top   