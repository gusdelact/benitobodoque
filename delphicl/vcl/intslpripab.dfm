�
 TWSLPRIPAB 0~  TPF0
TWSlPrIPAB	WSlPrIPABLeftJTop WidthZHeight	CaptionSeleccionar Proceso IPABColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrder	OnClose	FormCloseOnCreate
FormCreate	OnKeyDownFormKeyDown
OnKeyPressFormKeyPressOnShowFormShowPixelsPerInch`
TextHeight TDBGriddbgSelProcIPBLeft Top WidthJHeight� AlignalTop
DataSourcedsSelProcIPBFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickdbgSelProcIPBDblClickColumns	AlignmenttaCenterExpanded	FieldNameFOL_PROCESOTitle.AlignmenttaCenterWidthCVisible	 	AlignmenttaCenterExpanded	FieldNameFH_HISTORICATitle.AlignmenttaCenterWidthZVisible	 	AlignmenttaCenterExpanded	FieldNameFH_PROYECTADATitle.AlignmenttaCenterWidthmVisible	 	AlignmenttaCenterExpanded	FieldNameCVE_USUARIOTitle.AlignmenttaCenterWidthMVisible	 	AlignmenttaCenterExpanded	FieldNameFH_REGISTROTitle.AlignmenttaCenterVisible	 	AlignmenttaCenterExpanded	FieldNameVALIDADAFont.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameWingdings 2
Font.StylefsBold Title.CaptionValidadaWidth,Visible	    TInterFormaInterForma1IsMain	msgSinRegistros1No existe un Registro para realizar la operaci�n.msgModificarRegistro'Imposible Modificar el Registro Actual.msgEliminarRegistro&Imposible Eliminar el Registro Actual.msgCrearRegistro#Imposible Crear el Registro Actual.msgAceptarRegistro2Imposible Aceptar los cambios del Registro Actual.msgCancelarRegistro3Imposible Cancelar los cambios del Registro Actual.msgPreguntaEliminar#�Desea Eliminar el Registro Actual?CanEdit	IsNewDataShowBtnNuevoShowBtnModificarOnBtnAceptarInterForma1BtnAceptarShowBtnAceptarShowBtnCancelarShowBtnEliminarVersionHideButtonsShowBtnPreviewShowBtnImprimirOnBtnAyudaClickInterForma1BtnAyudaClickOnBtnSalirClickInterForma1BtnSalirClickShowGridShowNavigator	ShowErrorIsCancelLeft� Top�   TDataSourcedsSelProcIPBDataSetqrySelProcIPBOnDataChangedsSelProcIPBDataChangeLeftXTop�   TQueryqrySelProcIPB	AfterOpenqrySelProcIPBAfterOpenDatabaseNameBCORPSQL.Strings3SELECT A.*,decode(inf_validada,'V','P') as validada FROM DV_IB_CTRLPROC A ORDER BY a.FOL_PROCESO DESC LeftTop�  TFloatFieldqrySelProcIPBFOL_PROCESODisplayLabelFolio ProcesoDisplayWidth	FieldNameFOL_PROCESOOrigin CCORP.DV_IB_CTRLPROC.FOL_PROCESO  TDateTimeFieldqrySelProcIPBFH_HISTORICADisplayLabelFecha Hist�ricaDisplayWidth	FieldNameFH_HISTORICAOrigin!CCORP.DV_IB_CTRLPROC.FH_HISTORICA  TDateTimeFieldqrySelProcIPBFH_PROYECTADADisplayLabelFecha ProyectadaDisplayWidth	FieldNameFH_PROYECTADAOrigin"CCORP.DV_IB_CTRLPROC.FH_PROYECTADA  TFloatFieldqrySelProcIPBANO_MESDisplayWidth	FieldNameANO_MESOriginCCORP.DV_IB_CTRLPROC.ANO_MESVisible  TStringFieldqrySelProcIPBCVE_USUARIODisplayLabelUsuario AltaDisplayWidth	FieldNameCVE_USUARIOOrigin CCORP.DV_IB_CTRLPROC.CVE_USUARIOSize  TDateTimeFieldqrySelProcIPBFH_REGISTRODisplayLabelFecha RegistroDisplayWidth	FieldNameFH_REGISTROOrigin CCORP.DV_IB_CTRLPROC.FH_REGISTRO  TStringFieldqrySelProcIPBINF_VALIDADA	FieldNameVALIDADAOrigin!BCORP.DV_IB_CTRLPROC.INF_VALIDADASize    