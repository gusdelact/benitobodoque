�
 TFOSPERFIL 0�
  TPF0
TfoSPerfil	foSPerfilLeftQTop� WidthyHeight� CaptionSeleccionar Perfil de AccesoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnShowFormShowPixelsPerInch`
TextHeight TButtonButton1Left�Top� WidthQHeightCaptionIniciarDefault	TabOrder OnClickButton1Click  TButtonButton2LeftTop� WidthQHeightCancel	CaptionCancelarTabOrderOnClickButton2Click  	TGroupBox	GroupBox1LeftTop WidthaHeight� CaptionPerfiles Definidos:TabOrder TDBGridDBGrid1LeftTopWidthQHeight� 
DataSourceDataSource1OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit ReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickButton1ClickColumnsExpanded	FieldName
NOM_PERFILWidth� Visible	 Expanded	FieldNameNOMBREWidth� Visible	 Expanded	FieldNameDESC_IND_ADICVisible	     TQueryqPerfilSQL.Stringsselect A.CVE_USUARIO,           A.ID_EMPRESA, "          A.CVE_IND_ADIC,                   A.ID_GPO_ACCESO,/          PERFIL.NOM_GPO_ACCESO AS NOM_PERFIL,           C.NOMBRE,!          INDICADOR.DESC_IND_ADICFROM SECU_USR_APL_GPO A,        SECU_GPO_ACCESO B,       SECU_PERFIL  PERFIL,        PERSONA C, EMPRESA E,        SECU_IND_ADICION D,!         SECU_INDICADOR INDICADOR %where (RTRIM(A.CVE_USUARIO)=:USUARIO)-and     (RTRIM(A.CVE_APLICACION)=:APLICACION))and     (B.ID_GPO_ACCESO=A.ID_GPO_ACCESO).and     (PERFIL.ID_GPO_ACCESO=A.ID_GPO_ACCESO)/and     (INDICADOR.CVE_IND_ADIC=A.CVE_IND_ADIC)+and     (B.CVE_APLICACION=A.CVE_APLICACION)#and     (C.ID_PERSONA=A.ID_EMPRESA)#and     (C.ID_PERSONA=E.ID_EMPRESA)'and     (D.CVE_IND_ADIC=A.CVE_IND_ADIC)+and     (D.CVE_APLICACION=A.CVE_APLICACION) Left� TopP	ParamDataDataTypeftStringNameUSUARIO	ParamType	ptUnknownValueMACV991 DataTypeftStringName
APLICACION	ParamType	ptUnknownValueARBI   TStringFieldqPerfilNOM_PERFILDisplayLabelPerfilDisplayWidth$	FieldName
NOM_PERFILSize(  TStringFieldqPerfilNOMBREDisplayLabelEmpresaDisplayWidth3	FieldNameNOMBRESizeP  TStringFieldqPerfilDESC_IND_ADICDisplayLabel	IndicadorDisplayWidth+	FieldNameDESC_IND_ADICSize  TStringFieldqPerfilCVE_USUARIO	FieldNameCVE_USUARIOSize  TFloatFieldqPerfilID_EMPRESA	FieldName
ID_EMPRESA  TStringFieldqPerfilCVE_IND_ADIC	FieldNameCVE_IND_ADICSize  TFloatFieldqPerfilID_GPO_ACCESO	FieldNameID_GPO_ACCESO   TDataSourceDataSource1DataSetqPerfilLeft� TopP   