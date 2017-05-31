unit IntDocumCtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, IntSGCtrl, db, dbtables, IntFrm, InterFor, UnSql2, StdCtrls,
  Buttons, Menus, IntCtto, IntUnNeg, IntGCto, IntLinkit, unGene, Printers,
  IntTCto, IntMultiArray, Gauges;

Const
	cSI = 'SI';
	cNO = 'NO';
	cINCOM = 0;
	cCOM = 1;
	cVACIO = '-----';
	cSEPARADOR = ',';
	cALTO_HEADER = 32;
	cALTO_NORMAL = 16;

type
	TTipoEmpresa = (teICBC, teIFS, teIFON, teCAME);

	TValoresRegistro = Array[0..20] of string;
	TValoresDoctos = Array[0..50] of TValoresRegistro;


	TCol = class
		Indice:  Integer;
		CapCtto: String;
		CapCtte: String;
		DocCtto: String;
		ReqCtte: String;
		Valor:   String;
		Ancho:   Integer;
	end;


	TDocumCtto = class;

	TwDocumCtto = class(TForm)
	 SGCtrl1: TSGCtrl;
	 InterForma1: TInterForma;
	 rgTipoPromotor: TRadioGroup;
	 Button1: TButton;
	 rgSitDocumentos: TRadioGroup;
	 GroupBox1: TGroupBox;
	 Label1: TLabel;
	 Label2: TLabel;
	 Label3: TLabel;
	 edIdContrato: TEdit;
	 edIdPromotor: TEdit;
	 edIdEntidad: TEdit;
	 PopupMenu1: TPopupMenu;
	 Sinseleccionar1: TMenuItem;
	 sbContrato: TBitBtn;
	 sbEntidad: TBitBtn;
	 sbPromotor: TBitBtn;
	 edTitular: TEdit;
	 edNomPromotor: TEdit;
	 edDescEntidad: TEdit;
	 PopupMenu2: TPopupMenu;
	 MenuItem1: TMenuItem;
	 PopupMenu3: TPopupMenu;
	 MenuItem2: TMenuItem;
	 InterLinkit1: TInterLinkit;
	 InterLinkit3: TInterLinkit;
	 Label4: TLabel;
	 edCveTipContrato: TEdit;
	 sbTipoCtto: TBitBtn;
	 edDescTipoContra: TEdit;
	 PopupMenu4: TPopupMenu;
	 MenuItem3: TMenuItem;
	 InterLinkit2: TInterLinkit;
	 bLimpia: TButton;
	 chbAllGpos: TCheckBox;
	 lbDesc_Gpo_Contrato: TLabel;
	 gAvance: TGauge;
	 Bevel1: TBevel;
	 procedure Button1Click(Sender: TObject);
	 procedure FormShow(Sender: TObject);
	 procedure FormHide(Sender: TObject);
	 procedure InterForma1Imprimir(Sender: TObject);
	 procedure InterForma1Preview(Sender: TObject);
	 procedure sbContratoClick(Sender: TObject);
	 procedure sbPromotorClick(Sender: TObject);
	 procedure sbEntidadClick(Sender: TObject);
	 procedure Sinseleccionar1Click(Sender: TObject);
	 procedure MenuItem1Click(Sender: TObject);
	 procedure MenuItem2Click(Sender: TObject);
	 procedure InterLinkit1Ejecuta(Sender: TObject);
	 procedure InterLinkit3Ejecuta(Sender: TObject);
	 procedure sbTipoCttoClick(Sender: TObject);
	 procedure InterLinkit2Ejecuta(Sender: TObject);
	 procedure MenuItem3Click(Sender: TObject);
	 procedure bLimpiaClick(Sender: TObject);
	 procedure SGCtrl1CalcRow(Sendet: TObject; DataSet: TDataSet;
		CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
	 procedure rgTipoPromotorClick(Sender: TObject);
	 procedure chbAllGposClick(Sender: TObject);
	private
	 { Private declarations }
	public
	 { Public declarations }
		Objeto: TDocumCtto;

		Procedure RefrescaControles;
	end;

	TDocumCtto = class(TInterFrame)
	Private
		FTipoEmpresa: TTipoEmpresa;
		FShowHeader: Boolean;
		FEntidad: Integer;
		FPromAut: Integer;
		FPromAso: Integer;
		FGrupo:   Integer;
		FSqlQuery: String;

	Protected
		Procedure SetTipoEmpresa(Tipo: TTipoEmpresa);
	Public
		Id_Contrato: TInterCampo;
		Cve_Tip_Contrato: TInterCampo;
		Id_Entidad:  TInterCampo;
		Id_Promotor: TInterCampo;
		Id_Empresa:  TInterCampo;
		TipoPromotor:TInterCampo;
		Sit_Doctos:  TInterCampo;
		B_All_Gpos:	 TInterCampo;
		Id_Grupo:	 TInterCampo;

                //Marcos Zárate C. Ago-1999
                Cve_Documento :  TInterCampo;
                DocCumplido   :  TInterCampo;

		Contrato: TContrato;
		Promotor: TGpoCto;
		Entidad:  TUnNegocio;
		TipoCtto: TTipoCto;

		qContrato: TQuery;
		StrGrid:  TSGCtrl;
		lColumnas: TList;
		lValores: TStringList;

		Gauge: TGauge;
		lDefCtto: TStringList;
		lDefCtte: TStringList;

		StpCtte: TStoredProc;
		StpCtto: TStoredProc;
		Constructor Create(AOwner: TComponent); override;
		Destructor  Destroy; override;
		Function 	ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
		Procedure   DataBaseChange; override;
		Procedure 	Impresion(Preview: Boolean);
		Procedure   PreparaQuery;
		Procedure   Requery;
		Procedure   AgregaColumna(Indice: Integer; CapCtto, CapCtte, DocCtto, ReqCtte: String; Ancho: Integer);
		Procedure 	LimpiaColumnas;
		Procedure   CargaColumnas;
		Function 	CargaValoresCtto(Var Doctos: TMultiArray; Var Completo: Boolean): Boolean;
		Function 	CargaValoresCtte(Var Doctos: TMultiArray; Var Completo: Boolean): Boolean;
		Procedure 	CargaValoresGrid(Var Doctos: TMultiArray);
		Function 	ItemStr(Str: String; NumItem: Integer): String;
		Function 	StrItemInStr(StrItem, Str: String): Boolean;
		Function    Execute(ShowError: Boolean): Boolean;
		Procedure   AfterLocalizaContrato(AOwner: TObject);

		Property TipoEmpresa: TTipoEmpresa Read FTipoEmpresa Write SetTipoEmpresa;
		Property ShowHeader: Boolean Read FShowHeader Write FShowHeader;
		Property SqlQuery: String Read FSqlQuery Write FSqlQuery;
	end;


var
  wDocumCtto: TwDocumCtto;

implementation

{$R *.DFM}

{****************************************************************************}
{*                                             OBJETO 							 *}
{****************************************************************************}
Constructor TDocumCtto.Create(AOwner: TComponent);
Begin
	inherited;
	Id_Contrato:= 	CreaCampo('ID_CONTRATO', ftInteger, tsNinguno, tsNinguno, False);
	Cve_Tip_Contrato:= CreaCampo('CVE_TIP_CONTRATO', ftString, tsNinguno, tsNinguno, False);
	Id_Empresa:= 	CreaCampo('ID_EMPRESA', ftInteger, tsNinguno, tsNinguno, False);
	Id_Entidad:= 	CreaCampo('ID_ENTIDAD', ftInteger, tsNinguno, tsNinguno, False);
	Id_Promotor:=	CreaCampo('ID_PROMOTOR', ftInteger, tsNinguno, tsNinguno, False);
	TipoPromotor:= CreaCampo('TIPO_PROMOTOR', ftInteger, tsNinguno, tsNinguno, False);
	Sit_Doctos:= 	CreaCampo('SIT_DOCTOS', ftInteger, tsNinguno, tsNinguno, False);
	B_All_Gpos:=	CreaCampo('B_ALL_GPOS', ftBoolean, tsNinguno, tsNinguno, False);
	Id_Grupo:=     CreaCampo('ID_GRUPO', ftInteger, tsNinguno, tsNinguno, False);

        //Nuevo Marcos Zárate Castro
        Cve_Documento:= CreaCampo('CVE_DOCUMENTO', ftString, tsNinguno, tsNinguno, False);
        DocCumplido  := CreaCampo('DOCCUMPLIDO', ftString, tsNinguno, tsNinguno, False);
        //Nuevo Marcos Zárate Castro


	Contrato:= TContrato.Create(self);
	Contrato.OnAfterLocaliza:= AfterLocalizaContrato;
	Promotor:= TGpoCto.Create(self);
	Entidad:=  TUnNegocio.Create(self);
	TipoCtto:= TTipoCto.Create(Self);

	StrGrid:=  nil;
	qContrato:= TQuery.Create(self);
	lColumnas:= TList.Create;

	lValores:= TStringList.Create;

	lDefCtto:= TStringList.Create;
	lDefCtte:= TStringList.Create;

	FShowHeader:= True;
	FEntidad:= -1;
	FPromAut:= -1;
	FPromAso:= -1;
	FGrupo:= -1;

	StpCtte:= TStoredProc.Create(self);
	StpCtte.StoredProcName:= 'PKGCONTRATOS.CURDOCCTTE';
	StpCtte.Params.CreateParam(ftString, 'pCve_Concep_Cto', ptInput);
	StpCtte.Params.CreateParam(ftString, 'pCve_Producto', ptInput);
	StpCtte.Params.CreateParam(ftFloat,  'pId_Contrato', ptInput);
	StpCtte.Params.CreateParam(ftFloat,  'pId_Empresa', ptInput);
	StpCtte.Params.CreateParam(ftCursor, 'pqDocCtte', ptInputOutput);

	StpCtto:= TStoredProc.Create(self);
	StpCtto.StoredProcName:= 'PKGCONTRATOS.CURDOCCTTO';
	StpCtto.Params.CreateParam(ftString, 'pCve_Producto', ptInput);
	StpCtto.Params.CreateParam(ftFloat,  'pId_Contrato', ptInput);
	StpCtto.Params.CreateParam(ftFloat,  'pId_Empresa', ptInput);
	StpCtto.Params.CreateParam(ftCursor, 'pqDocCtto', ptInputOutput);

	Gauge:= nil;
	IsCheckSecu:= False;
	UseQuery:= False;

        Cve_Documento.AsString:='';
end;

Destructor TDocumCtto.Destroy;
Begin
	If Contrato <> nil then Contrato.Free;
	If Promotor <> nil then Promotor.Free;
	If Entidad <> nil then Entidad.Free;
	If TipoCtto <> nil Then TipoCtto.Free;

	If qContrato <> nil Then qContrato.Free;
	If lColumnas <> nil then lColumnas.Free;
	If lValores <> nil then lValores.Free;

	If lDefCtto <> nil then lDefCtto.Free;
	If lDefCtte <> nil then lDefCtte.Free;

	If StpCtte <> nil Then StpCtte.Free;
	If StpCtto <> nil Then StpCtto.Free;
	inherited;
end;

Procedure TDocumCtto.DataBaseChange;
Begin
	inherited;
	Contrato.GetParams(self);
	Promotor.GetParams(self);
	Entidad.GetParams(self);
	TipoCtto.GetParams(self);
	qContrato.DatabaseName:= DataBaseName;
	qContrato.SessionName := SessionName;

	StpCtte.DatabaseName:= DataBaseName;
	StpCtte.SessionName := SessionName;
	StpCtto.DatabaseName:= DataBaseName;
	StpCtto.SessionName := SessionName;
end;


Procedure TDocumCtto.AfterLocalizaContrato(AOwner: TObject);
Begin
	Entidad.FindKey([Contrato.Id_Entidad.AsString]);
	Promotor.FindKey([Contrato.Id_Pers_Asociad.AsString, Contrato.Id_Grupo.AsString]);
	TipoCtto.FindKey([Contrato.Cve_Tip_Contrato.AsString]);
end;

Function TDocumCtto.ShowWindow(FormaTipo : TFormaTipo) : Integer;
Var	w: TwDocumCtto;
begin
	W:= TwDocumCtto.Create(self);
	try
		StrGrid  := W.SGCtrl1;
		Gauge:= w.gAvance;
		W.Objeto := Self;
		w.InterForma1.CentrarForma := True;
		W.InterForma1.FormaTipo := ftImprimir;
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	finally
		W.Free;
	end;
end;

Procedure TDocumCtto.Impresion(Preview: Boolean);
Begin StrGrid.Print(Preview, True, Apli);
end;


Procedure TDocumCtto.LimpiaColumnas;
Var	Indice: Integer;
Begin
	For Indice := 0 To lColumnas.Count - 1 do
	Begin
		//lColumnas.Remove(lColumnas.Items[Indice]);
		TCol(lColumnas.Items[Indice]).Free;
	end;
	lColumnas.Clear;
end;


Procedure TDocumCtto.AgregaColumna(Indice: Integer; CapCtto, CapCtte, DocCtto, ReqCtte: String; Ancho: Integer);
Var Datos: TCol;
Begin
	Datos:= TCol.Create;
	Datos.Indice:= Indice;
	Datos.CapCtto := CapCtto;
	Datos.CapCtte := CapCtte;
	Datos.DocCtto := DocCtto;
	Datos.ReqCtte := ReqCtte;
	If Ancho = -1 Then Datos.Ancho := 50		{Calculo del ancho por default}
	else Datos.Ancho   := Ancho;
	lColumnas.Add(Datos);
end;

Procedure TDocumCtto.SetTipoEmpresa(Tipo: TTipoEmpresa);
Var EmpresaDesconocida: Boolean;
Begin
	FTipoEmpresa := Tipo;
	EmpresaDesconocida:= False;

//	GetFromControl;
	LimpiaColumnas;
	lDefCtto.Clear;
	lDefCtte.Clear;

	Case Tipo of
	teICBC:
		Begin
			Id_Empresa.AsInteger := 1;
			StrGrid.PageOrientation:=poLandScape;
			AgregaColumna(2, 'Contrato', 'Poderes', 'D064', 'R004,R028,R030,R035,R037,R040,R046,R049,R051,R053,R066', 79);
			AgregaColumna(3, 'Sol Apertura', 'Identidad', 'D062', 'R001,R010,R022,R018,R025,R029,R063', 79);
			AgregaColumna(4, 'Cta. Asignación', 'Nacionalidad', 'D065', 'R002,R062', 79);
			AgregaColumna(5, 'Acuse Pros.', 'R.F.C.', 'D066', 'R003,R017,R070', 79);
			AgregaColumna(6, 'Convenio', 'Profesión', 'D067', 'R057', 79);
			AgregaColumna(7, 'Cta Recompra', 'Act/Giro Neg', 'D068', 'R058', 79);
			AgregaColumna(8, 'Man Pres Val', 'Domicilio', 'D078', 'R022,R092,R099', 79);
			AgregaColumna(9, '', 'F Nacimiento', '', 'R060,R064,R091', 79);
			AgregaColumna(10,'Tarjeta', 'de Firmas', 'D153', 'R120', 79);
			AgregaColumna(11,'Carta de', 'Cotejo', 'D083', '', 79);
		end;

	teIFS:
		Begin
			Id_Empresa.AsInteger := 5;
			StrGrid.PageOrientation:= poPortrait;
			AgregaColumna(2, 'Contrato Marco', 'Poderes', 'D151', 'R004,R028,R030,R035,R037,R040,R046,R049,R051,R053,R066', 100);
			AgregaColumna(3, 'Sol Apertura', 'Identidad', 'D150', 'R001,R010,R063,R018,R025,R029', 100);
			AgregaColumna(4, 'Cto Fut Opc', 'Nacionalidad', 'D155', 'R002,R062', 100);
			AgregaColumna(5, 'Application', 'Domicilio', 'D154', 'R022,R092,R099', 100);
			AgregaColumna(6, 'Carta de', 'Cotejo', 'D083', '', 100);
		end;

	teIFON:
		Begin
			Id_Empresa.AsInteger := 2;
			StrGrid.PageOrientation:=poLandScape;
      AgregaColumna(2, 'Cto Cta Interacc','Poderes','D056','R004,R028,R030,R035,R037,R040,R046,R049,R051,R053,R066',79);
			AgregaColumna(3, 'Sol Apertura', 'Identidad', 'D070', 'R001,R010,R022,R063,R018,R025,R029', 79);
      AgregaColumna(4, 'Cta Recompra', 'Nacionalidad', 'D068', 'R002,R062', 79);
      AgregaColumna(5, 'Acuse Pros.', 'R.F.C.', 'D066', 'R003,R017,R070', 79);
      AgregaColumna(6, '', 'Profesión', '', 'R057', 79);
      AgregaColumna(7, '', 'Act/Giro Neg', '', 'R058', 79);
      AgregaColumna(8, '', 'Domicilio', '', 'R022,R092,R099', 79);
      AgregaColumna(9, '', 'F Nacimiento', '', 'R060,R064,R091', 79);
			AgregaColumna(10,'Tarjeta', 'de Firmas', 'D153', 'R120', 79);
			AgregaColumna(11, 'Carta de', 'Cotejo', 'D083', '', 79);
		end;

  teCAME:
		Begin
			Id_Empresa.AsInteger := 2;
			StrGrid.PageOrientation:=poLandScape;
      AgregaColumna(2, '',             'Poderes',     '','R004', 71);
			AgregaColumna(3, 'Sol Apertura', 'Identidad',   'D189', 'R001,R123,R010', 71);
      AgregaColumna(4, '',             'Nacionalidad','', 'R002,R124', 71);
      AgregaColumna(5, '',             'R.F.C.',      '', 'R003,R125', 71);
      AgregaColumna(6, '',             'Domicilio',   '', 'R022,R126', 71);
      AgregaColumna(7, '',             'F Nacimiento','', 'R060,R127', 71);
		end;

	else EmpresaDesconocida:= True;
	end;

	If EmpresaDesconocida Then MessageDlg('El Tipo de Empresa no está definido', mtError, [mbOK], 0)
	else If StrGrid <> nil then Requery;
end;


Procedure TDocumCtto.CargaColumnas;
Var 	Indice: Integer;
		Datos: TCol;
		//Captions: Array [0..20] of string;
		Captions: TValoresRegistro;
Begin
//	StrGrid.LeftCol:= 0;
	//StrGrid.SG.FixedCols:=StrGrid.Start; StrGrid.FLeftCol:=StrGrid.Start+1
	StrGrid.ColCount := lColumnas.Count + 3;
	StrGrid.SG.FixedCols:=StrGrid.Start;

//	StrGrid.PageOrientation:=poLandScape;

	StrGrid.Columnas[0].SetInfoEx('CTTO', 'Ctto', 45, tcCenter, '', True, True);
	StrGrid.Columnas[1].SetInfoEx('NOMBRE', 'Documentos del Contrato'+#13+#10+'Requisitos del Contratante', 200, tcLeft, '', True, True);

	For Indice := 0 to lColumnas.Count -1 do
	Begin
		Datos:= TCol(lColumnas.Items[Indice]);
		StrGrid.Columnas[Datos.Indice].SetInfoEx('COL'+IntToStr(Datos.Indice), Datos.CapCtto+#13+#10+Datos.CapCtte, Datos.Ancho, tcCenter, '', True, True);
//		Captions[Datos.Indice] := Datos.CapCtto+#13+#10+Datos.CapCtte;
	end;

	Indice:= Datos.Indice;

	StrGrid.Columnas[Indice + 1].SetInfoEx('COMPLETO', 'Completo'+#30+'>C', 50, tcCenter, '', True, True);

	//if ColN=0 then begin SG.FixedCols:=FStart; FLeftCol:=FStart+1; end;

	StrGrid.SetActualHeight(32);
	StrGrid.SetActualAsHeader;
	StrGrid.NextRow;
	StrGrid.EndCaption;


{
	StrGrid.LeftCol:= 0;
	StrGrid.ColCount := lColumnas.Count + 3;
	StrGrid.Columnas[0].SetInfo('CONTRATO', 'Ctto'+#30+'>C', 40, TcCenter, '', True);
	StrGrid.Columnas[1].SetInfo('NOMBRE', 'Nombre'+#30+'>C', 250, tcLeft, '', True);
	For Indice := 0 to lColumnas.Count -1 do
	Begin
		Datos:= TCol(lColumnas.Items[Indice]);
		StrGrid.Columnas[Datos.Indice].SetInfo('COL'+IntToStr(Datos.Indice), Datos.CapCtto +#13+#10+ Datos.CapCtte +#30+'>C', Datos.Ancho, tcLeft, '', True);
	end;
	StrGrid.Columnas[Indice + 2].SetInfo('COMPLETO', 'Completo'+#30+'>C', 50, tcCenter, '', True);
	StrGrid.SetActualHeight(40);
	StrGrid.NextRow;
	StrGrid.EndCaption;
}
end;


Function TDocumCtto.ItemStr(Str: String; NumItem: Integer): String;
Var Posicion, PosFinal, Indice: Integer;
Begin
	Result:= '';
	Indice:= 1;
	Posicion:= 1;
	While (Indice < NumItem) and (Posicion <> 0) do
	Begin
		Posicion:= Pos(cSEPARADOR, Str);
		If Posicion <> 0 Then
		Begin
			Str[Posicion] := #30;
			Inc(Posicion);
		end;
		Inc(Indice);
	end;

	If Posicion <> 0 then
	Begin
		PosFinal:= Pos(cSEPARADOR, Str) - 1;
    Result:= Copy(Str, Posicion, 4);
{
		If PosFinal <= 0 then PosFinal := Length(str);
		Result:= Copy(Str, Posicion, PosFinal);
}
	end;
end;


Function TDocumCtto.StrItemInStr(StrItem, Str: String): Boolean;
Var
	Indice: Integer;
	Item: String;
	Encontrado: Boolean;
Begin
	Indice:= 1;
	Encontrado:= False;
	Item := ItemStr(StrItem, Indice);
	While (Item <> '') and (Not Encontrado) do
	Begin
		If Pos (Item, Str) <> 0 Then Encontrado := True
		else
		Begin
			Inc(Indice);
			Item := ItemStr(StrItem, Indice);
		end;
	end;

	Result:= Encontrado;
end;


Function TDocumCtto.CargaValoresCtto(Var Doctos: TMultiArray; Var Completo: Boolean): Boolean;
var
	//Valores: Array[0..20] of string;
	//Valores: TValoresRegistro;
//	q: TQuery;
	Indice: Integer;
	Requerido, Presentado, Temp: String;
        vlCond:Boolean;
//	Completo: Integer;
	Datos: TCol;
        Q : Tquery;
        SQL: string;
        vFecha : String;
	SitDocumentos: Boolean;

		Procedure CargaDefault;
		Var Cont: Integer;
		Begin
			lValores.Clear;

			Temp:= Copy(qContrato.FieldByName('ID_CONTRATO').asString, 3, 9);
			If Trim(Temp) = '' Then Temp := '0';
			lValores.Add(IntToStr(StrToInt(Temp)));
//			lValores.Add('Doctos. del contrato');
// la sig línea por solicitud de gaby ranero
                        SQL := 'SELECT F_ALTA FROM CONTRATO WHERE ID_CONTRATO = ' + qContrato.FieldByName('ID_CONTRATO').asString;
                        Q := GetSQLQuery(SQL,DataBaseName,SessionName,True);
                        if Q<>nil then
                            begin
                              try
                                 vFecha := Q.FieldByName('F_ALTA').AsString;
                              finally
                                 Q.Free;
                              end;
                        end;
                        if Q=nil then
                           begin
                              try
                                 vFecha := ' ';
                              finally
                                 Q.Free;
                              end;
                        end;
 			lValores.Add('Doctos. del Contrato  F.Alta ' + vFecha);
// bmr 28/06/2001

			For Cont:= 0 to lColumnas.Count - 1 do
			Begin
				Datos:= TCol(lColumnas.Items[Cont]);
				If StrItemInStr(Datos.DocCtto, StpCtto.FieldByName('REQUERIDO').asString) Then lValores.Add(cNO)
				else lValores.Add(cVACIO);
			end;

                        If StpCtto.FieldByName('COMPLETO').asInteger = cCOM then lValores.Add(cSI)
                        else lValores.Add(cNO);
		end;

Begin
	Result:= True;

	Try
		If StpCtte <> nil Then
		Begin
			StpCtto.Close;
			StpCtto.UnPrepare;
			StpCtto.ParamByName('pId_Contrato').AsInteger:= qContrato.FieldByName('ID_CONTRATO').asInteger;
			StpCtto.ParamByName('pId_Empresa').AsInteger:= qContrato.FieldByName('ID_EMPRESA').asInteger;
			StpCtto.ParamByName('pCve_Producto').AsString:= qContrato.FieldByName('CVE_PRODUCTO').asString;
			StpCtto.Prepare;
			StpCtto.Open;
//			q:= StpCtte;
			//q:= TQuery(StpCtte.ParamByName('pqDocCtte'));
		end
		else Raise EInterFrame.Create('Error al obtener la información del contrato');
	Except Raise;
	end;

{	q:= GetSqlQuery(
			' SELECT '+
			'	PkgContratos.FunDocReqCtto('+
						qContrato.FieldByName('ID_EMPRESA').asString + ', ' +
				''''+ qContrato.FieldByName('CVE_PRODUCTO').asString + ''') Requerido, ' +
			'	PkgContratos.FunDocPresCtto('+
						qContrato.FieldByName('ID_CONTRATO').asString + ') Presentado,' +
			'	PkgContratos.FunDocCttoCompleto('+
						qContrato.FieldByName('ID_CONTRATO').asString + ', ' +
						qContrato.FieldByName('ID_EMPRESA').asString + ', ' +
				''''+ qContrato.FieldByName('CVE_PRODUCTO').asString + ''') Completo ' +
			' FROM dual',
			DataBaseName, SessionName, False);
}

	If StpCtto.Active then
	Begin

		Case Sit_Doctos.AsInteger of
		cCOM:
			If StpCtto.FieldByName('COMPLETO').asInteger = cINCOM then
			Begin
				Result:= False;
				Exit;
			end;
		end;

		If StpCtto.FieldByName('COMPLETO').asInteger = cINCOM then Completo:= False;

		Try

                        CargaDefault;

			For Indice:= 0 To lColumnas.Count - 1 do
			Begin
				Datos:= TCol(lColumnas.Items[Indice]);
				If StrItemInStr(Datos.DocCtto, StpCtto.FieldByName('PRESENTADO').asString) Then
					lValores.Strings[Datos.Indice] := cSI;
			end;

			Doctos.AddList(lValores);
			//For Indice:= 0 To lValores.Count - 1 do
			//	Valores[Indice] := lValores.Strings[Indice];
		Finally
//			q.Close;
//			q.Free;
		end;

		//StrGrid.ToHeader(StrGrid.AddHeader(Valores,-1,clBlack));
		//Doctos[0]:= Valores;
		//Doctos.Add(TValoresRegistro(Valores));
	end;

end;


Function TDocumCtto.CargaValoresCtte(Var Doctos: TMultiArray; Var Completo: Boolean): Boolean;
var
	//Valores: Array[0..20] of string;
	//Valores: TValoresRegistro;
	//q: TQuery;
	Indice: Integer;
	Datos: TCol;
        VALCOM : STRING;

    Procedure CargaDefault;
		Var Cont:  Integer;
                    Q : Tquery;
                    SQL: string;
                    ciclo:integer;
                    Nombre_Paso : String;
                    Nombre_Salida : String;
		Begin
			lValores.Clear;
			lValores.Add(StpCtte.FieldByName('NUM_COTITULAR').asString);
			lValores.Add(StpCtte.FieldByName('NOMBRE').asString);

      For Cont:= 0 to lColumnas.Count - 1 do
      Begin
          Datos:= TCol(lColumnas.Items[Cont]);

          If TipoEmpresa <> teCAME Then
          Begin
            If Cont = 1 Then
            begin
                Nombre_salida := '';
                Nombre_paso := StpCtte.FieldByName('NOMBRE').asString;

                for ciclo := 1 to length(Nombre_paso) do
                begin
                  if Nombre_paso[ciclo]='''' then
                    Nombre_salida:=Nombre_salida + ' '
                  else Nombre_Salida:= Nombre_Salida + Nombre_Paso[ciclo];
                end;
      //          SQL := 'SELECT CO.CVE_CONTRATANTE, C.CVE_CONCEP_CTO, P.CVE_PER_JURIDICA FROM CONTRATO C, CONTRATANTE CO, PERSONA P WHERE C.ID_CONTRATO = CO.ID_CONTRATO AND CO.ID_PERSONA = P.ID_PERSONA AND C.ID_CONTRATO = ' + qContrato.FieldByName('ID_CONTRATO').asString + ' AND P.NOMBRE = ' + cHR(39) + StpCtte.FieldByName('NOMBRE').asString + cHR(39);
                SQL := 'SELECT CO.CVE_CONTRATANTE, C.CVE_CONCEP_CTO, P.CVE_PER_JURIDICA FROM CONTRATO C, CONTRATANTE CO, PERSONA P WHERE C.ID_CONTRATO = CO.ID_CONTRATO AND CO.ID_PERSONA = P.ID_PERSONA AND C.ID_CONTRATO = ' + qContrato.FieldByName('ID_CONTRATO').asString + ' AND P.NOMBRE = ' + cHR(39) + Nombre_Salida + cHR(39);
                Q := GetSQLQuery(SQL,DataBaseName,SessionName,True);
                if Q<>nil then
                begin
                  try
                    If (Q.FieldByName('CVE_CONCEP_CTO').AsString = 'T016') and
                       (Q.FieldByName('CVE_CONTRATANTE').AsString = 'C001') and
                       (Q.FieldByName('CVE_PER_JURIDICA').AsString = 'PM') then
                      Datos.ReqCtte := 'R010,R022,R063,R018,R025,R029'
                    Else Datos.ReqCtte := 'R001,R010,R022,R063,R018,R025,R029';
                  finally
                    Q.Free;
                  end;
                end;
            end;
          end;

          If StrItemInStr(Datos.ReqCtte, StpCtte.FieldByName('REQUERIDO').asString) Then
            lValores.Add(cNO)
          else lValores.Add(cVACIO);
      end;

      If (StpCtte.FieldByName('COMPLETO').asInteger = 1) and (VALCOM <> 'X') then
        lValores.Add(cSI)
      else lValores.Add(cNO);
    end;

Begin
	Result:= True;

//	q:= nil;
	Try
		If StpCtte <> nil Then
		Begin
			StpCtte.Close;
			StpCtte.UnPrepare;
			StpCtte.ParamByName('pId_Contrato').AsInteger:= qContrato.FieldByName('ID_CONTRATO').asInteger;
			StpCtte.ParamByName('pId_Empresa').AsInteger:= qContrato.FieldByName('ID_EMPRESA').asInteger;
			StpCtte.ParamByName('pCve_Producto').AsString:= qContrato.FieldByName('CVE_PRODUCTO').asString;
			StpCtte.ParamByName('pCve_Concep_Cto').AsString:= qContrato.FieldByName('CVE_CONCEP_CTO').asString;
			StpCtte.Prepare;
			StpCtte.Open;
//			q:= StpCtte;
			//q:= TQuery(StpCtte.ParamByName('pqDocCtte'));
		end
		else Raise EInterFrame.Create('Error al obtener la información de los contratantes');
	Except Raise;
	end;


{	q:= GetSqlQuery(
			' SELECT '+
			'    Contratante.Id_Contrato,'+
			'    Contratante.Id_Persona,'+
			'    Contratante.Cve_Contratante,'+
			'    Contratante.Num_Cotitular,'+
			'    Persona.Nombre,'+
			'	PkgContratos.FunReqReqCtte('+
						qContrato.FieldByName('ID_EMPRESA').asString + ', ' +
				''''+ qContrato.FieldByName('CVE_PRODUCTO').asString + ''', ' +
					  'Contratante.Cve_Contratante, ' +
				''''+ qContrato.FieldByName('CVE_CONCEP_CTO').asString + ''') Requerido, ' +
			'	PkgContratos.FunReqPresCtte('+
						qContrato.FieldByName('ID_CONTRATO').asString + ', ' +
					  'Contratante.Id_Persona) Presentado, ' +
			'	PkgContratos.FunDocCtteCompleto('+
						qContrato.FieldByName('ID_CONTRATO').asString + ', ' +
					  'Contratante.Id_Persona, ' +
					  'Contratante.Cve_Contratante, ' +
						qContrato.FieldByName('ID_EMPRESA').asString + ', ' +
				''''+ qContrato.FieldByName('CVE_PRODUCTO').asString + ''', ' +
				''''+ qContrato.FieldByName('CVE_CONCEP_CTO').asString + ''') Completo ' +
			' FROM Contratante, Persona'+
			' WHERE Contratante.Id_contrato = ' + qContrato.FieldByName('ID_CONTRATO').asString +
			'    and Contratante.Cve_Contratante not in (''C011'',''C021'')' +
			'    and Contratante.Id_Persona = Persona.Id_Persona'+
			' ORDER BY Contratante.Id_Contrato, Contratante.Num_Cotitular, Contratante.Cve_Contratante, Persona.Nombre',
			DataBaseName, SessionName, False);
}

	If StpCtte.Active then
	Begin
		Try
			While (Not StpCtte.EOF) do
			Begin
				Case Sit_Doctos.AsInteger of
				cCOM:
					If StpCtte.FieldByName('COMPLETO').asInteger = cINCOM then
					Begin
						Result:= False;
						Exit;
					end;
				end;

				If StpCtte.FieldByName('COMPLETO').asInteger = cINCOM then Completo:= False;

        CargaDefault;

				For Indice:= 0 To lColumnas.Count - 1 do
				Begin
					Datos:= TCol(lColumnas.Items[Indice]);
					If StrItemInStr(Datos.ReqCtte, StpCtte.FieldByName('PRESENTADO').asString) Then
                                           begin
						lValores.Strings[Datos.Indice] := cSI;
                                           end;
				end;

				Doctos.AddList(lValores);
				//For Indice:= 0 To lValores.Count - 1 do
				//	Valores[Indice] := lValores.Strings[Indice];

				//StrGrid.AddHeader(Valores,-1,clBlack);
				//Doctos.Add(Valores);
				StpCtte.Next;
			end;
		Finally
//			q.Close;
//			q.Free;
		end;
	end;
end;


Procedure TDocumCtto.CargaValoresGrid(Var Doctos: TMultiArray);
Var
	Indice, NumColumna: Integer;
	Arreglo: TValoresRegistro;
	Header: String;
        Q : Tquery;
        SQL: string;
        vNomAutorizado : string;
begin
{INSERSION DEL HEADER DE GRUPO Y TABS}
	If ShowHeader Then
	Begin
		Header:= '';
		Case TipoPromotor.asInteger of
		0: Begin                                     //Asociado
				If FPromAso <> qContrato.FieldByName('ID_PERS_ASOCIAD').asInteger Then
				Begin
					FPromAso:= qContrato.FieldByName('ID_PERS_ASOCIAD').asInteger;
// por solicitud de gaby ranero
                                        SQL := 'SELECT P.NOMBRE FROM PERSONA P, GPO_CONTRATO G WHERE  P.ID_PERSONA = G.ID_PERS_PROM_AUT AND G.ID_PERS_ASOCIAD = ' + qContrato.FieldByName('ID_PERS_ASOCIAD').asString;
                                        Q := GetSQLQuery(SQL,DataBaseName,SessionName,True);
                                        if Q<>nil then
                                           begin
                                             try
                                               vNomAutorizado := Q.FieldByName('NOMBRE').AsString;
                                             finally
                                               Q.Free;
                                             end;
                                        end;
                                       if Q=nil then
                                          Q.Free;

//					GetSqlStr('Select Nombre from Persona Where Id_Persona = '+ IntToStr(FPromAso),
//						DataBaseName, SessionName,'NOMBRE', Header, True);
//					StrGrid.AddTitle('   ASOCIADO ['+ qContrato.FieldByName('NUM_PROMOTOR').asString +'] ' + Header, tcLeft);
//					StrGrid.AddTitle('   ASOCIADO ['+ qContrato.FieldByName('NUM_PROMOTOR').asString +'] ' + qContrato.FieldByName('NOM_PROMOTOR').asString+#30+'B', tcLeft);
					StrGrid.AddTitle('   ASOCIADO ['+ qContrato.FieldByName('NUM_PROMOTOR').asString +'] ' + qContrato.FieldByName('NOM_PROMOTOR').asString+'     [AUTORIZADO : ' + vNomAutorizado + ' ] '+#30+'B', tcLeft);
//					StrGrid.AddTab(qContrato.FieldByName('NUM_PROMOTOR').asString, IntToStr(StrGrid.ActualY));
				end;

				If (B_All_Gpos.asString = 'V') or (Id_Promotor.IsNull) Then //AsBoolean Then
				Begin
					If FGrupo <> qContrato.FieldByName('ID_GRUPO').asInteger Then
					Begin
						FGrupo:= qContrato.FieldByName('ID_GRUPO').asInteger;
						StrGrid.AddTitle('       '+ qContrato.FieldByName('DESC_GPO_CONTRAT').asString+#30+'B', tcLeft);
						StrGrid.AddTab(qContrato.FieldByName('NUM_PROMOTOR').asString, IntToStr(StrGrid.ActualY));
						//StrGrid.AddTab('[' + qContrato.FieldByName('NUM_PROMOTOR').asString + '][' + qContrato.FieldByName('ID_GRUPO').asString + ']', IntToStr(StrGrid.ActualY));
					end;
				end;
			end;

		1: Begin                                     //Autorizado
				If FPromAut <> qContrato.FieldByName('ID_PERS_PROM_AUT').asInteger Then
				Begin
					FPromAut:= qContrato.FieldByName('ID_PERS_PROM_AUT').asInteger;
					GetSqlStr('Select Nombre from Persona Where Id_Persona = '+ IntToStr(FPromAut),
						DataBaseName, SessionName,'NOMBRE', Header,True);
					StrGrid.AddTitle('AUTORIZADO ['+ IntToStr(FPromAut) +'] ' + Header,tcLeft);
					//StrGrid.AddTab(IntToStr(FPromAut), IntToStr(StrGrid.ActualY));
				end;
			end;
		end;
	end;




{INSERSION DEL REGISTRO DE DOCUMENTOS}
	For Indice:= 0 To Doctos.Count - 1 do
	Begin
		For NumColumna:= 0 To Doctos.Items[Indice].Count - 1 do
		Begin
			If Indice = 0 Then
				Arreglo[NumColumna]:= Doctos.Items[Indice].Strings[NumColumna] + #30+'B'
			else Arreglo[NumColumna]:= Doctos.Items[Indice].Strings[NumColumna];
		end;

		If Indice = 0 Then StrGrid.ToHeader(StrGrid.AddHeader(Arreglo,-1,clBlack))
		else StrGrid.AddHeader(Arreglo,-1,clBlack);
	end;
end;


Procedure TDocumCtto.Requery;
Var ValoresCtto: TValoresRegistro;
	 Completo:Boolean;
	 Doctos: TMultiArray;
         vlCond: Boolean;
         i,j,Posic:Integer;
         DocCompleto : Boolean;
         DocContrato : Array of Array of integer;
         DocCtte     : Array of Array of integer;
         BInformaCto: Boolean;
         Dimension   : Integer;
         ResumenSTR  : String;
Begin
	PreparaQuery;

	StrGrid.BeginGrid;
	StrGrid.NomReporte:='REPORTE';
	StrGrid.SetActualHeight(32);
	Completo:= True;
	CargaColumnas;
	qContrato.Open;
	qContrato.First;
	Doctos:= TMultiArray.Create;
	FPromAso:= -1;
	FPromAut:= -1;
	FGrupo:= -1;

	If Gauge <> nil then
	Begin
		Gauge.MaxValue:= qContrato.RecordCount;
		Gauge.Progress:= 0;
		Gauge.Visible:= False;
	end;

	While Not qContrato.EOF do
	Begin
		Doctos.Clear;
		If CargaValoresCtto(Doctos, Completo) and
       CargaValoresCtte(Doctos, Completo) then
		Begin {LLENADO DEL GRID}

                      vlCond:=True;
                      //Marcos Zarate C. Ago-1999
                      if Cve_Documento.AsString <> ''
                      then begin
                             //Busca la posición de la columna
                             Posic:=-1;
                             for i:=0 to lColumnas.Count-1 do
                             begin
                                 if Cve_Documento.AsString = TCol(LColumnas.Items[i]).DocCtto
                                 then Posic:=i+2;
                             end;
                             if Posic <> -1 then
                             begin
                                 if DocCumplido.AsString = 'V'
                                 then vlCond:=(Doctos.Items[0].Strings[Posic] = cSi)
                                 else vlCond:=(Doctos.Items[0].Strings[Posic] = cNo);
                             end;
                           end;
                      //Marcos Zarate C. Ago-1999

                      Case Sit_Doctos.AsInteger of
//                           cINCOM: If Not completo Then CargaValoresGrid(Doctos);
//                           cCOM: If Completo Then CargaValoresGrid(Doctos);
                           cINCOM: If Not completo and VlCond Then CargaValoresGrid(Doctos);
                           cCOM  : If Completo And VlCond Then CargaValoresGrid(Doctos);
                           else    if vlCond then CargaValoresGrid(Doctos);
                      end;
		end;

		qContrato.Next;
		If Gauge <> nil then Gauge.Progress:= Gauge.Progress + 1;
	end;

        {-----------------------------------------------}
        {---- Totalización de documentos al reporte ----}
        {---- O.Escobar 08/11/1999                  ----}
        Setlength(DocContrato, 2);
        Setlength(DocCtte, 2);
        Dimension:= StrGrid.SG.ColCount;
        For i:=Low(DocContrato) to High(DocContrato) do
           begin
           SetLength(DocContrato[i], Dimension);
           SetLength(DocCtte[i], Dimension);
           For j:= Low(DocContrato[i]) to High(DocContrato[i]) do
              begin
              DocContrato[i,j]:= 0;
              DocCtte[i,j]:= 0;
              end;
           end;
        For i:=0 to StrGrid.SG.RowCount - 1 do
            begin
            BInformaCto:= False;
            If Copy(Strgrid.SG.Cells[4,i],1,10) = 'Documentos' then
               BInformaCto:= True;
            For j:=StrGrid.Start to StrGrid.SG.ColCount -1 do
                begin
                If Copy(Strgrid.SG.Cells[j,i],1,2) = 'SI' then
                   begin
                   If BInformaCto then
                      DocContrato[0,j] := DocContrato[0,j] + 1
                   else
                      DocCtte[0,j] := DocCtte[0,j] + 1;
                   end;
                If Copy(Strgrid.SG.Cells[j,i],1,2) = 'NO' then
                   begin
                   If BInformaCto then
                      begin
                      DocContrato[0,j] := DocContrato[0,j] + 1;
                      DocContrato[1,j] := DocContrato[1,j] + 1;
                      end
                   else
                      begin
                      DocCtte[0,j] := DocCtte[0,j] + 1;
                      DocCtte[1,j] := DocCtte[1,j] + 1;
                      end;
                   end;
                end;
            end;
        StrGrid.AddTitle('================================================================================',tcLeft);
        StrGrid.AddTitle('',tcLeft);
        StrGrid.AddTitle('                                     S U M A R I Z A C I O N ',tcLeft);
        StrGrid.AddTitle('',tcLeft);
        ResumenSTR:= #09 + 'Documentos del Contrato   TOTAL'+ #09 + #09;
        For j:= 5 to StrGrid.SG.ColCount -1 do
           ResumenSTR:= ResumenSTR  + InttoStr(DocContrato[0,j])+ #09;
        StrGrid.AddTitle(ResumenSTR ,tcLeft);
        ResumenSTR:= #09 + '                      FALTANTES'+ #09 + #09;
        For j:= 5 to StrGrid.SG.ColCount -1 do
           ResumenSTR:= ResumenSTR  + InttoStr(DocContrato[1,j])+ #09;
        StrGrid.AddTitle(ResumenSTR ,tcLeft);
        StrGrid.AddTitle('',tcLeft);
        ResumenSTR:= #09 + 'Documentos de Contratante TOTAL'+ #09 + #09;
        For j:= 5 to StrGrid.SG.ColCount -1 do
           ResumenSTR:= ResumenSTR  + InttoStr(DocCtte[0,j])+ #09;
        StrGrid.AddTitle(ResumenSTR ,tcLeft);
        ResumenSTR:= #09 + '                      FALTANTES'+ #09 + #09;
        For j:= 5 to StrGrid.SG.ColCount -1 do
           ResumenSTR:= ResumenSTR  + InttoStr(DocCtte[1,j])+ #09;
        StrGrid.AddTitle(ResumenSTR ,tcLeft);

        StrGrid.AddTitle('',tcLeft);
        StrGrid.AddTitle('',tcLeft);

	If Gauge <> nil then Gauge.Visible:= False;
	If Doctos <> nil then Doctos.Free;
	StrGrid.EndGrid;
	qContrato.Close;
end;



Procedure TDocumCtto.PreparaQuery;
var
	q: TQuery;
	HavingString, Sql, SqlWhere: String;
Begin
	If Trim(SqlQuery) <> '' Then
	Begin
		qContrato.SQL.Clear;
		qContrato.SQL.Text:= SqlQuery;
		Exit;
	end;

	q:=GetSQLQuery('SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+ Apli.Usuario +''') and (Empleado.Id_Persona=Usuario.Id_Persona)',
		DataBaseName, SessionName,True);
	if q=nil then Exit;
	Try
		HavingString:=' Having (PKG_ACCECONTRATO.TIENEACCESO('+
							 ''''+ Apli.Usuario +''''+
							 ',Contrato.ID_CONTRATO'+
							 ','+ IntToStr(Apli.idEmpresa) +
							 ',Contrato.ID_ENTIDAD'+
							 ',Contrato.ID_EMPRESA'+
							 ',Contrato.B_RESTRINGIDO'+
							 ',Contrato.ID_PERS_ASOCIAD'+
							 ',Contrato.CVE_SEGMENTO'+
							 ',Contrato.ID_GRUPO'+
							 ','''+ q.FieldByName('CVE_TIPO_USUARIO').AsString +''''+
							 ','''+ q.FieldByName('B_EMPRESA').AsString +''''+
							 ','''+ q.FieldByName('B_CONTRATO').AsString +''''+
							 ','''+ q.FieldByName('B_UNID_NEG').AsString +''''+
							 ','''+ q.FieldByName('B_USR_USR').AsString +''''+
							 ','+ q.FieldByName('ID_PERSONA').AsString +
							 ','+ q.FieldByName('ID_EMPRESA').AsString +
							 ','+ q.FieldByName('EMPRESA_EMPLEADO').AsString +
							 ','+ q.FieldByName('ID_ENTIDAD').AsString +')=1)';
	Finally
		q.Close;
		q.Free;
	end;

	HavingString:='';

	Case TipoPromotor.asInteger of
	0: Begin                                     //Asociado
			SqlWhere := ' Gpo_contrato.Id_Pers_Asociad = Persona.Id_Persona ';
			If Trim(Id_Promotor.AsString) <> '' Then SqlWhere := SqlWhere + ' and Gpo_Contrato.Id_Pers_Asociad  = '+ Id_Promotor.AsString + ' ';
		End;

	1: Begin                                     //Autorizado
			SqlWhere := ' Gpo_contrato.Id_Pers_Prom_Aut = Persona.Id_Persona ';
			If Trim(Id_Promotor.AsString) <> '' Then SqlWhere := SqlWhere + ' and Gpo_Contrato.Id_Pers_Prom_Aut = '+ Id_Promotor.AsString + ' ';
		End;
	end;

	If Not Id_Grupo.IsNull Then
		SqlWhere:= SqlWhere + ' and Gpo_Contrato.Id_Grupo = '+ Id_Grupo.AsString;


	If Trim(Id_Contrato.AsString) <> '' Then				{Arma el query Principal}
	begin
		Sql :=
			' SELECT'+
			'		Contrato.Id_contrato,'+
			'		Contrato.Id_empresa,'+
			'		Contrato.Id_entidad,'+
			'		Contrato.B_restringido,'+
			'		Contrato.Id_pers_asociad,'+
			'		Contrato.Cve_Segmento,'+
			'		Contrato.Id_Grupo,'+
			'		Contrato.F_Alta,'+
			'		Contrato.Id_Titular,'+
			'		Contrato.Cve_Producto,'+
			'		Contrato.Cve_Concep_cto,'+
			'  	Persona.Id_Persona,'+
			'  	Persona.Nombre,'+
			'     Gpo_Contrato.Id_Pers_Prom_Aut,'+
			'     Gpo_Contrato.Desc_Gpo_Contrat,'+
			'     Gpo_Contrato.Num_Promotor,'+
			'		Unidad_Negocio.Desc_Entidad'+
			' FROM Contrato, Gpo_Contrato, Unidad_Negocio, Persona'+
			' WHERE'+
			'  	Contrato.Id_contrato = '+ Id_Contrato.AsString +
//bmr 12/04/2000	'     and Contrato.Id_empresa = '+ Id_Empresa.AsString +
			'     and Contrato.Cve_Tip_Contrato = '''+ Cve_Tip_Contrato.AsString + '''' +
			'  	and ' + SqlWhere +
			'  	and Contrato.Id_Pers_Asociad = Gpo_Contrato.Id_Pers_Asociad '+
			'  	and Contrato.Id_Grupo = Gpo_contrato.Id_Grupo '+
			'  	and Contrato.Id_Entidad = Unidad_Negocio.Id_Entidad '+
			' GROUP BY'+
			'     Gpo_Contrato.Id_Pers_Prom_Aut,'+
			'		Contrato.Id_pers_asociad,'+
			'		Contrato.Id_Grupo,'+
			'		Contrato.Id_contrato,'+
			'		Contrato.Id_empresa,'+
			'		Contrato.Id_entidad,'+
			'		Contrato.B_restringido,'+
			'		Contrato.Cve_Segmento,'+
			'		Contrato.F_Alta,'+
			'		Contrato.Id_Titular,'+
			'		Contrato.Cve_Producto,'+
			'		Contrato.Cve_Concep_cto,'+
			'  	Persona.Id_Persona,'+
			'  	Persona.Nombre,'+
			'     Gpo_Contrato.Num_Promotor,'+
			'     Gpo_Contrato.Desc_Gpo_Contrat,'+
			'		Unidad_Negocio.Desc_Entidad'+
			HavingString;
	end
	else
		Begin
			Sql:=
			' SELECT'+
			'		Contrato.Id_contrato,'+
			'		Contrato.Id_empresa,'+
			'		Contrato.Id_entidad,'+
			'		Contrato.B_restringido,'+
			'		Contrato.Id_pers_asociad,'+
			'		Contrato.Cve_Segmento,'+
			'		Contrato.Id_Grupo,'+
			'		Contrato.F_Alta,'+
			'		Contrato.Id_Titular,'+
			'		Contrato.Cve_Producto,'+
			'		Contrato.Cve_Concep_cto,'+
			'     Promotores.Id_Pers_Prom_Aut,'+
			'  	Promotores.Id_Pers_Asociad,'+
			'     Promotores.Desc_Gpo_Contrat,'+
			'  	Promotores.Nombre,'+
			'  	Promotores.Num_Promotor, '+
			'		Unidad_Negocio.Desc_Entidad'+
			' FROM'+
			'     Contrato, Unidad_Negocio, '+
			'			(select Id_pers_prom_aut, id_pers_asociad, id_grupo, Persona.Id_Persona, Persona.Nombre,'+
			'                Gpo_Contrato.Desc_Gpo_Contrat, Gpo_Contrato.Num_Promotor '+
			'	       from gpo_contrato, Persona'+
			'			 where '+ SqlWhere +
			'			) Promotores' +
			' WHERE '+
			'     Contrato.Cve_Tip_Contrato = '''+ Cve_Tip_Contrato.AsString + '''' +
			'		and Contrato.Id_Pers_Asociad = Promotores.Id_Pers_Asociad'+
			'     and Contrato.Id_Grupo = Promotores.Id_Grupo '+
			'     and Contrato.Id_Entidad = Unidad_Negocio.Id_Entidad';

			If Trim(Id_Entidad.AsString) <> '' Then Sql := Sql + ' and Contrato.Id_Entidad = '+ Id_Entidad.AsString;

			Sql:= Sql +
			' GROUP BY'+
			'     Promotores.Id_Pers_Prom_Aut,'+
			'  	Promotores.Id_Pers_Asociad,'+
			'		Contrato.Id_Grupo,'+
			'  	Promotores.Num_Promotor, '+
			'		Contrato.Id_contrato,'+
			'		Contrato.Id_empresa,'+
			'		Contrato.Id_entidad,'+
			'		Contrato.B_restringido,'+
			'		Contrato.Id_pers_asociad,'+
			'		Contrato.Cve_Segmento,'+
			'		Contrato.F_Alta,'+
			'		Contrato.Id_Titular,'+
			'		Contrato.Cve_Producto,'+
			'		Contrato.Cve_Concep_cto,'+
			'  	Promotores.Nombre,'+
			'     Promotores.Desc_Gpo_Contrat,'+
			'		Unidad_Negocio.Desc_Entidad'+
			HavingString;
		end;

	qContrato.SQL.Clear;
	qContrato.SQL.Text:= Sql;
end;


Function TDocumCtto.Execute(ShowError: Boolean): Boolean;
Begin
	If Trim(Cve_Tip_Contrato.AsString) = '' Then
		Raise EInterFrame.Create('Error. No ha sido definido el tipo de contrato');

	Result:= True;
	Try
    If Cve_Tip_Contrato.AsString = 'IFSM' Then TipoEmpresa:= teIFS
    else IF Cve_Tip_Contrato.AsString = 'IFON' THEN TipoEmpresa:= teIFON
    else IF Cve_Tip_Contrato.AsString = 'CAME' THEN TipoEmpresa:= teCAME
    else TipoEmpresa:= teICBC;
	Except
		Result:= False;
		If ShowError Then Raise EInterFrame.Create('Error al realizar la consulta');
	end;
end;

{****************************************************************************}
{*                                             FORMA                        *}
{****************************************************************************}
procedure TwDocumCtto.FormShow(Sender: TObject);
begin
	Objeto.Id_Contrato.Control := edIdContrato;
	Objeto.Cve_Tip_Contrato.Control:= edCveTipContrato;
	Objeto.Id_Entidad.Control := edIdEntidad;
	Objeto.Id_Promotor.Control := edIdPromotor;
	Objeto.Sit_Doctos.Control:= rgSitDocumentos;
	Objeto.TipoPromotor.Control:= rgTipoPromotor;
	Objeto.B_All_Gpos.Control:= chbAllGpos;
end;

procedure TwDocumCtto.FormHide(Sender: TObject);
begin
	Objeto.Id_Contrato.Control:= nil;
	Objeto.Cve_Tip_Contrato.Control:= nil;
	Objeto.Id_Entidad.Control:= nil;
	Objeto.Id_Promotor.Control:= nil;
	Objeto.Sit_Doctos.Control:= nil;
	Objeto.TipoPromotor.Control:= nil;
	Objeto.B_All_Gpos.Control:= nil;
end;

procedure TwDocumCtto.Button1Click(Sender: TObject);
Begin
	Objeto.GetFromControl;
	If Objeto.Promotor.Active Then
	Begin
		Objeto.Id_Grupo.asInteger:= Objeto.Promotor.Id_Grupo.asInteger;
		Objeto.Id_Grupo.IsNull:= (Objeto.B_All_Gpos.asString = 'V'); //AsBoolean);
	end
	else Objeto.Id_Grupo.IsNull:= True;
	Objeto.Execute(True);

{	Case rgTipoEmpresa.ItemIndex of
	0: Objeto.TipoEmpresa:= teICBC;
	1: Objeto.TipoEmpresa:= teIFS;
	end;}
end;


procedure TwDocumCtto.InterForma1Imprimir(Sender: TObject);
begin Objeto.Impresion(False);
end;

procedure TwDocumCtto.InterForma1Preview(Sender: TObject);
begin Objeto.Impresion(True);
end;

Procedure TwDocumCtto.RefrescaControles;
Begin
	edIdContrato.Text:= Objeto.Contrato.Id_Contrato.AsString;
	edTitular.Text := Objeto.Contrato.TITNOMBRE.AsString;
	edIdEntidad.Text := Objeto.Entidad.Id_Entidad.AsString;
	edDescEntidad.Text := Objeto.Entidad.Desc_Entidad.AsString;
	edCveTipContrato.Text:= Objeto.TipoCtto.Cve_Tip_Contrato.AsString;
	edDescTipoContra.Text:= Objeto.TipoCtto.Desc_Tipo_Contra.AsString;

	Case rgTipoPromotor.ItemIndex of
	0:	Begin
			edIdPromotor.Text := Objeto.Promotor.Id_Pers_Asociad.AsString;
			edNomPromotor.Text := Objeto.Promotor.PromAsociado.Nombre.asString;
		end;

	1:	Begin
			edIdPromotor.Text := Objeto.Promotor.Id_Pers_Prom_Aut.AsString;
			edNomPromotor.Text := Objeto.Promotor.PromAutorizado.Nombre.asString;
		end;
	end;

	lbDesc_Gpo_Contrato.Caption:= Objeto.Promotor.Desc_Gpo_Contrat.asString;
end;

procedure TwDocumCtto.sbContratoClick(Sender: TObject);
begin
	Objeto.Contrato.Busca;
	RefrescaControles;
end;

procedure TwDocumCtto.sbPromotorClick(Sender: TObject);
begin
	Objeto.Promotor.Busca;
	RefrescaControles;
end;

procedure TwDocumCtto.sbEntidadClick(Sender: TObject);
begin
	Objeto.Entidad.Busca;
	RefrescaControles;
end;

procedure TwDocumCtto.sbTipoCttoClick(Sender: TObject);
begin
	Objeto.TipoCtto.Busca;
	RefrescaControles;
end;


procedure TwDocumCtto.InterLinkit1Ejecuta(Sender: TObject);
begin
	Objeto.Contrato.FindKey([InterLinkit1.buffer]);
	RefrescaControles;
end;

procedure TwDocumCtto.InterLinkit2Ejecuta(Sender: TObject);
begin
	Objeto.TipoCtto.FindKey([InterLinkit2.Buffer]);
	RefrescaControles;
end;

procedure TwDocumCtto.InterLinkit3Ejecuta(Sender: TObject);
begin
	Objeto.Entidad.FindKey([InterLinkit3.Buffer]);
	RefrescaControles;
end;

procedure TwDocumCtto.Sinseleccionar1Click(Sender: TObject);
begin
	Objeto.Contrato.Active:= False;
	RefrescaControles;
end;


procedure TwDocumCtto.MenuItem1Click(Sender: TObject);
begin
	Objeto.Promotor.Active := False;
	RefrescaControles;
end;


procedure TwDocumCtto.MenuItem2Click(Sender: TObject);
begin
	Objeto.Entidad.Active := False;
	RefrescaControles;
end;

procedure TwDocumCtto.MenuItem3Click(Sender: TObject);
begin
	Objeto.TipoCtto.Active := False;
	RefrescaControles;
end;


procedure TwDocumCtto.bLimpiaClick(Sender: TObject);
begin
	Objeto.Active:= False;
	Objeto.Contrato.Active:= False;
	Objeto.Promotor.Active:= False;
	Objeto.Entidad.Active:= False;
	Objeto.TipoCtto.Active:= False;
	RefrescaControles;
end;

procedure TwDocumCtto.SGCtrl1CalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
Var Header: String;
begin
{	Header:= '';
	Case Objeto.TipoPromotor.asInteger of
	0: Begin                                     //Asociado
			If Objeto.FPromAso <> Objeto.qContrato.FieldByName('ID_PERS_ASOCIAD').asInteger Then
			Begin
				Objeto.FPromAso:= Objeto.qContrato.FieldByName('ID_PERS_ASOCIAD').asInteger;
				GetSqlStr('Select Nombre from Persona Where Id_Persona = '+ IntToStr(Objeto.FPromAso),
					Objeto.DataBaseName, Objeto.SessionName,'NOMBRE', Header,True);
				Objeto.StrGrid.AddTitle('   ASOCIADO ['+ Objeto.qContrato.FieldByName('NUM_PROMOTOR').asString +'] ' + Header, tcLeft);
				Objeto.StrGrid.AddTab(Objeto.qContrato.FieldByName('NUM_PROMOTOR').asString, IntToStr(Objeto.StrGrid.ActualY));
			end;

			If Not (Objeto.B_All_Gpos.asString = 'V') Then //AsBoolean Then
			Begin
				If Objeto.FPromAso <> Objeto.qContrato.FieldByName('ID_PERS_ASOCIAD').asInteger Then
				Begin
					Objeto.FPromAso:= Objeto.qContrato.FieldByName('ID_PERS_ASOCIAD').asInteger;
					GetSqlStr('Select Nombre from Persona Where Id_Persona = '+ IntToStr(Objeto.FPromAso),
						Objeto.DataBaseName, Objeto.SessionName,'NOMBRE', Header,True);
					Objeto.StrGrid.AddTitle('   ASOCIADO ['+ Objeto.qContrato.FieldByName('NUM_PROMOTOR').asString +'] ' + Header, tcLeft);
					Objeto.StrGrid.AddTab(Objeto.qContrato.FieldByName('NUM_PROMOTOR').asString, IntToStr(Objeto.StrGrid.ActualY));
				end;
			end;
		End;

	1: Begin                                     //Autorizado
			If Objeto.FPromAut <> Objeto.qContrato.FieldByName('ID_PERS_PROM_AUT').asInteger Then
			Begin
				Objeto.FPromAut:= Objeto.qContrato.FieldByName('ID_PERS_PROM_AUT').asInteger;
				GetSqlStr('Select Nombre from Persona Where Id_Persona = '+ IntToStr(Objeto.FPromAut),
					Objeto.DataBaseName, Objeto.SessionName,'NOMBRE', Header,True);
				Objeto.StrGrid.AddTitle('AUTORIZADO ['+ IntToStr(Objeto.FPromAut) +'] ' + Header,tcLeft);
				Objeto.StrGrid.AddTab(IntToStr(Objeto.FPromAut), IntToStr(Objeto.StrGrid.ActualY));
			end;
		End;
	end;
}
end;

procedure TwDocumCtto.rgTipoPromotorClick(Sender: TObject);
begin
	chbAllGpos.Enabled:= (rgTipoPromotor.ItemIndex = 0);
	chbAllGpos.Checked:= False;
	lbDesc_Gpo_Contrato.Visible:= False;
end;

procedure TwDocumCtto.chbAllGposClick(Sender: TObject);
begin lbDesc_Gpo_Contrato.Visible:= Not (chbAllGpos.Checked);
end;


end.
