�
 TWDVIBCTRLP 0{  TPF0TWDvIbCtrlP
WDvIbCtrlPLeftcTop�Width�HeightCaptionConfiguraci�n de Procesos IPABColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormClose	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TLabellbFOL_PROCESOLeftTopWidth^HeightCaptionN�mero de Proceso  TLabellbCVE_USU_ALTALeftTop|WidthOHeightCaptionClave Usuario Alta:Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSmall Fonts
Font.Style 
ParentFont  TLabelLabel1LeftTop� Width_HeightCaptionFecha y Hora Registro:Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSmall Fonts
Font.Style 
ParentFont  TBevelBevel2LeftTopuWidth9Height&  TEditedFOL_PROCESOTag2LeftTopWidthoHeightCharCaseecUpperCaseColor	clBtnFaceReadOnly	TabOrder   	TGroupBox	gbxFechasLeftTop0Width8Height@CaptionFechas TabOrder TLabellbFH_HISTORICALeft	TopWidth)HeightCaption	Hist�rica  TLabellbFH_PROYECTADALeft� TopWidth6HeightCaption
Proyectada  TInterDateTimePickerdtpFH_HISTORICATagLeft� Top WidthHeightCalAlignmentdtaLeftDate @�����@Time @�����@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInputTabOrder EditedFH_HISTORICAFormatodfDate  TEditedFH_HISTORICATagLeftTop Width� HeightCharCaseecUpperCaseTabOrder
OnKeyPressedFH_HISTORICAKeyPress  TInterDateTimePickerdtpFH_PROYECTADATagLeft Top WidthHeightCalAlignmentdtaLeftDate @�����@Time @�����@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInputTabOrderEditedFH_PROYECTADAFormatodfDate  TEditedFH_PROYECTADATagLeft� Top Width|HeightCharCaseecUpperCaseTabOrder
OnKeyPressedFH_HISTORICAKeyPress   TEditedCVE_USUARIOTag�LeftTop|WidthUHeightBorderStylebsNoneCharCaseecUpperCaseColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSmall Fonts
Font.Style 
ParentFontReadOnly	TabOrderTextAACE4754  TEditedFH_REGISTROTag�LeftTop� WidthsHeightBorderStylebsNoneCharCaseecUpperCaseColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSmall Fonts
Font.Style 
ParentFontReadOnly	TabOrderText12/02/2009 12:12:56: A.M  TInterFormaInterForma1IsMain	OnDespuesNuevoInterForma1DespuesNuevoOnDespuesModificarInterForma1DespuesModificarOnDespuesEliminarInterForma1DespuesEliminarOnDespuesAceptarInterForma1DespuesAceptarOnAntesAceptarInterForma1AntesAceptarOnAntesModificarInterForma1AntesModificarmsgSinRegistros1No existe un Registro para realizar la operaci�n.msgModificarRegistro'Imposible Modificar el Registro Actual.msgEliminarRegistro&Imposible Eliminar el Registro Actual.msgCrearRegistro#Imposible Crear el Registro Actual.msgAceptarRegistro2Imposible Aceptar los cambios del Registro Actual.msgCancelarRegistro3Imposible Cancelar los cambios del Registro Actual.msgPreguntaEliminar_�Desea Eliminar el Registro Actual? Se eliminara toda la informaci�n con  relacionada al folio.CanEdit	IsNewDataOnBtnEliminarInterForma1BtnEliminarVersionHideButtonsShowBtnPreviewShowBtnImprimirShowNavigator	ShowErrorIsCancelLeft-Top  TwwQueryqryConsultaDatabaseNameCCORPSQL.StringsSELECT FOL_PROCESO,       FH_HISTORICA,			 FH_PROYECTADA,			 CVE_USUARIO,			 FH_REGISTROFROM DV_IB_CTRLPROCORDER BY FOL_PROCESO ASC   ValidateWithMask	Left� Top TFloatFieldqryConsultaFOL_PROCESODisplayLabelFolioDisplayWidth	FieldNameFOL_PROCESOOrigin CCORP.DV_IB_CTRLPROC.FOL_PROCESO  TDateTimeFieldqryConsultaFH_HISTORICADisplayLabelFh. Hist�ricaDisplayWidth	FieldNameFH_HISTORICAOrigin!CCORP.DV_IB_CTRLPROC.FH_HISTORICA  TDateTimeFieldqryConsultaFH_PROYECTADADisplayLabelFh. ProyectadaDisplayWidth	FieldNameFH_PROYECTADAOrigin"CCORP.DV_IB_CTRLPROC.FH_PROYECTADA  TStringFieldqryConsultaCVE_USUARIODisplayLabelUsuario	FieldNameCVE_USUARIOOrigin CCORP.DV_IB_CTRLPROC.CVE_USUARIOSize  TDateTimeFieldqryConsultaFH_REGISTRODisplayLabelFh. Registro	FieldNameFH_REGISTROOrigin CCORP.DV_IB_CTRLPROC.FH_REGISTRO   TwwDataSource
dsConsultaDataSetqryConsultaOnDataChangedsConsultaDataChangeLeft� Top   