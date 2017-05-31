unit RepCttofoInterFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterApl, StdCtrls, Buttons, quickrpt, InterFor, IntFrm, UnSQL2, db, dbtables,
  RepCttoInterFin, RepCttoInterFin2, RepCttoIntFinMandato,
  UnRpCGBinterPF,   {Reporte de Cartas Genéricas de Personas Físicas}
  UnRpCGBinterPM,   {Reporte de Cartas Genéricas de Personas Morales}
  UnGene;           {Funciones de Interacciones}

type
  TIntFin=Class;

  TwInterFinancial = class(TForm)
	 cbNomRepres: TComboBox;
	 Label1: TLabel;
	 InterForma1: TInterForma;
	 Label2: TLabel;
	 cbNomCliente: TComboBox;
	 edLeyenda: TMemo;
	 Label4: TLabel;
	 Label5: TLabel;
	 edLeyendaPie: TMemo;
	 chbProemio: TCheckBox;
	 chbMandato: TCheckBox;
    ckCGBinter: TCheckBox;
	 procedure bbPreliminarClick(Sender: TObject);
	 procedure bbImprimirClick(Sender: TObject);
	 procedure FormShow(Sender: TObject);
	 procedure cbNomClienteClick(Sender: TObject);
	 procedure cbNomRepresClick(Sender: TObject);
	 procedure chbProemioClick(Sender: TObject);
	 procedure chbMandatoClick(Sender: TObject);
	 procedure InterForma1DespuesShow(Sender: TObject);
    procedure ckCGBinterClick(Sender: TObject);
  private
	 { Private declarations }
  protected
  public
	 { Public declarations }
		Objeto: TIntFin;
		Procedure Impresion(Preview: Boolean);
  published
  end;


  TIntFin = class(TInterFrame)
  private
	 { Private declarations }
		RepInterFin: TReporteCttoInterFin;
		RepInterFin2: TReporteInterFin2;
		procedure RepCompuestoAddReports(Sender: TObject);
  public
	 { Public declarations }
                B_CGBinter: TInterCampo;
		Id_Contrato: 		TInterCampo;
		Nom_Representante:TInterCampo;
		Nom_Cliente:		TInterCampo;
		Leyenda:          TInterCampo;
		Leyenda_Pie:      TInterCampo;
		Cve_Per_Juridica: TInterCampo;
		B_Proemio:			TInterCampo;
		B_Mandato:			TInterCampo;

		RepCompuesto: TQRCompositeReport;
		constructor Create( AOwner : TComponent ); override;
		destructor destroy; override;
		Procedure DatabaseChange; override;		
		Function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  end;

var
  wInterFinancial: TwInterFinancial;

implementation

{$R *.DFM}

constructor TIntFin.Create( AOwner : TComponent );
begin
	inherited;
        B_CGBinter:= CreaCampo('B_CGBINTER', ftString, tsNinguno, tsNinguno, False);
	Id_Contrato		 := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
	Nom_Representante:= CreaCampo('NOM_REPRESENTANTE',ftInteger,tsNinguno,tsNinguno,False);
	Nom_Cliente		 := CreaCampo('NOM_CLIENTE',ftInteger,tsNinguno,tsNinguno,False);
	Leyenda         := CreaCampo('LEYENDA',ftString,tsNinguno,tsNinguno,False);
	Leyenda_Pie     := CreaCampo('LEYENDA_PIE',ftString,tsNinguno,tsNinguno,False);
	Cve_Per_Juridica:= CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,False);
	B_Proemio		 := CreaCampo('B_PROEMIO',ftBoolean,tsNinguno,tsNinguno,False);
	B_Mandato		 := CreaCampo('B_MANDATO',ftBoolean,tsNinguno,tsNinguno,False);

	Id_Contrato.AsInteger := -1;

	RepInterFin := TReporteCttoInterFin.Create(Self);
	RepInterFin2:= TReporteInterFin2.Create(Self);
	RepCompuesto:= TQRCompositeReport.Create(self);
	RepCompuesto.PrinterSettings.Copies := 2;
	RepCompuesto.OnAddReports := RepCompuestoAddReports;
end;

destructor TIntFin.destroy;
begin
	If RepCompuesto <> nil then RepCompuesto.Free;
	If RepInterFin2 <> nil then RepInterFin2.Free;
	If RepInterFin <> nil then RepInterFin.Free;
	inherited;
end;

procedure TIntFin.DatabaseChange;
begin inherited;
end;

function  TIntFin.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TwInterFinancial;
begin
	W:=TwInterFinancial.Create(Self);
	try
		W.Objeto:= Self;
		W.InterForma1.CentrarForma := True;
		W.InterForma1.FormaTipo := ftImprimir;
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	finally
		W.Free;
	end;
end;


procedure TIntFin.RepCompuestoAddReports(Sender: TObject);
begin
	RepCompuesto.Reports.Add(RepInterFin);
	RepCompuesto.Reports.Add(RepInterFin2);
end;



(********************************************************)
(*				TwInterFinancial                            *)
(********************************************************)

procedure TwInterFinancial.FormShow(Sender: TObject);
var	q: TQuery;
		s: String;
begin
	cbNomCliente.Items.Clear;

	if Objeto.Id_Contrato.AsInteger <> -1 Then
	begin
		q := GetSQLQuery(
			' Select Nombre, Cve_Per_juridica, Cve_Contratante'+
			' from Contratante, Persona'+
			' Where'+
			'   Contratante.id_contrato = '+ Objeto.Id_contrato.AsString +
			'   and Contratante.Id_Persona = Persona.Id_Persona'+
			'   and Contratante.Sit_Contratante = ''AC'''+
			'   and Contratante.Cve_Contratante in (''C001'',''C003'',''C020'',''C012'',''C008'',''C042'',''C015'',''C016'',''C004'',''C006'',''C007'')'+
			' Order by Cve_Contratante',                  
			Objeto.DataBaseName,Objeto.SessionName,False);

		try
			if q <> nil then
			begin
				q.First;
				if (q.FieldByName('CVE_CONTRATANTE').asString = 'C001') and (q.FieldByName('CVE_PER_JURIDICA').asString = 'PF') Then
				Begin
					Objeto.Cve_Per_Juridica.AsString := 'PF';
					cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);
				end
				else
				Begin
					Objeto.Cve_Per_Juridica.AsString := 'PM';
					While (Not q.EOF) do
					begin
						if q.FieldByName('CVE_CONTRATANTE').asString <> 'C001' Then
							cbNomCliente.Items.Add(q.FieldByName('NOMBRE').asString);
						q.Next;
					end;
				end;
			end
			else
			begin
				GetSQLStr(
					'Select Nombre, cve_per_juridica from contrato, persona Where Id_Titular = Id_Persona',
					Objeto.DataBaseName, Objeto.SessionName,'NOMBRE',s,False);
				cbNomCliente.Items.Add(s);
				Objeto.Cve_Per_Juridica.AsString := q.FieldByName('CVE_PER_JURIDICA').asString;
			end;
		finally
			q.free;
		end;

		cbNomCliente.Text := cbNomCliente.Items[0];
		Objeto.Nom_Cliente.AsString := cbNomCliente.Text;
	end;

	Objeto.Nom_Representante.AsString := cbNomRepres.Text;
end;


Procedure TwInterFinancial.Impresion(Preview: Boolean);
var
   RpPF    : TrpCGBPF;
   RpPM    : TrpCGBPM;
   vlSEmpresa          : String;
   vlSNombre           : String;
   vlSTipoCto          : String;
   vlSDescTipoCto      : String;
   vlsDiscrecionalidad : String;
begin
	Objeto.Nom_Cliente.AsString:= cbNomCliente.Text;
	Objeto.Nom_Representante.AsString:= cbNomRepres.Text;
	Objeto.Leyenda.AsString:= edLeyenda.Text;
	Objeto.Leyenda_Pie.AsString:= edLeyendaPie.Text;
        Objeto.B_CGBinter.AsBoolean:=ckCGBinter.Checked;
	If Objeto.B_Proemio.AsBoolean Then
	Begin
		Execute_RepIntFin(Objeto, Preview);
		Execute_RepIntFin2(Objeto, Preview);
	end;

	If Objeto.B_Mandato.AsBoolean Then Execute_RepIntFinMandato(Objeto, Preview);

  //Carta de Instrucción Genérica
  if Objeto.B_CGBinter.AsBoolean then
  begin
     Try
       //MakeIntQRPreview;
       if Objeto.Cve_Per_Juridica.AsString = 'PM' then
       begin
          RpPM := TrpCGBPM.Create(Self);
          RpPM.QryCtto.Active := False;
          RpPM.QryCtto.DatabaseName := Objeto.DataBaseName;
          RpPM.QryCtto.SessionName  := Objeto.SessionName;
          RpPM.QryCtto.ParamByName('ID_CONTRATO').AsInteger := Objeto.Id_Contrato.AsInteger;
          RpPM.QryCtto.Active := True;
          RpPM.QRLabel42.Caption := RpPM.QryCtto.fieldbyname('NOMBRE').asString;

          GetSQLStr(' SELECT ID_EMPRESA ' +
                    '   FROM CONTRATO ' +
                    '  WHERE ID_CONTRATO = ' + Objeto.Id_Contrato.AsString +
                    '  ',
                    Objeto.DataBaseName,
                    Objeto.SessionName,
                    'ID_EMPRESA',
                    vlSEmpresa,
                    FALSE);

          // CZR 18-02-2010
          with RpPM.QRInterMemo2.Textos do
          begin
             Clear;
             Add ('@@0@ en mi carácter de representante legal de @@1@ quien es Titular del @@2@, celebrado con esa Institución, '
                + 'el cual se maneja de forma @@3@, les manifiesto lo siguiente: ');
             Add (' ');
             Add (' ');
             case StrToInt(vlSEmpresa) of
                1: Add ('Que con fundamento en lo dispuesto por los articulos 102 y 103 de las Disposiciones de Carácter General aplicables a las Casas de Bolsa '
                      + '(Circular Única) emitidas por la Comisión Nacional Bancaria y de Valores, así como a lo pactado en el contrato de intermediación bursátil antes mencionado, '
                      + 'por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para que al amparo del mencionado contrato puedan operar '
                      + 'con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas integrantes del mismo grupo financiero al que '
                      + 'pertenece esa Casa de Bolsa, asi como para realizar la asignación de valores de dichas operaciones cuando provengan de su posición propia.');
                2: Add ('Que de acuerdo a lo pactado en el contrato antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que al amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa Institución Bancaria, así como para realizar la asignación de valores de dichas '
                      + 'operaciones cuando provengan de su posición propia.');
                else
                   Add ('Que de acuerdo a lo pactado en el @@4@ antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que el amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa institución.');
             end;
          end;

          RpPM.QRInterMemo2.Parametro.Strings[0]:= Objeto.Nom_Cliente.AsString; // Objeto.Nom_Representante.AsString;
          RpPM.QRInterMemo2.Parametro.Strings[1]:= RpPM.QryCtto.fieldbyname('NOMBRE').asString;
          //RpPM.QRInterMemo2.Parametro.Strings[2]:= RpPM.QryCtto.fieldbyname('ID_CONTRATO').asString;
          RpPM.QRFecha.Caption := UpperCase(FmtFecha(RpPM.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
       //-------------------------

           GetSQLStr(' SELECT NOMBRE ' +
                     '   FROM PERSONA ' +
                     '  WHERE PERSONA.ID_PERSONA = ' + vlSEmpresa +
                     '  ',
                     Objeto.DataBaseName,
                     Objeto.SessionName,
                     'NOMBRE',
                     vlSNombre,
                     FALSE);
           IF vlSNombre <> '' THEN
             RpPM.QRLEmpresa.Caption := UpperCase(vlSNombre)
           ELSE
             RpPM.QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');
           GetSQLStr(' SELECT DESC_TIPO_CONTRA ' +
                     '   FROM CONTRATO A ' +
                     '   JOIN TIPO_CONTRATO b ON A.CVE_TIP_CONTRATO = b.CVE_TIP_CONTRATO ' +
                     '  WHERE A.ID_CONTRATO = ' + Objeto.Id_Contrato.AsString +
                     '  ',
                     Objeto.DataBaseName,
                     Objeto.SessionName,
                     'DESC_TIPO_CONTRA',
                     vlSDescTipoCto,
                     FALSE);

           vlSDescTipoCto:= 'contrato de ' + vlSDescTipoCto;

           RpPM.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto + ' No. ' + Objeto.Id_Contrato.AsString;
           //RpPM.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

           {GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                     '   FROM SB_CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + Objeto.Id_Contrato.AsString +
                     '  ',
                     Objeto.DataBaseName,
                     Objeto.SessionName,
                     'DISCRECIONAL',
                     vlsDiscrecionalidad,
                     FALSE);}
           RpPM.QRInterMemo2.Parametro.Strings[3]:= '____________________';
           RpPM.QRInterMemo2.Parametro.Strings[4]:= vlSDescTipoCto;
       //-------------------------
          RpPM.Preview;
          RpPM.Free;
       end
       else
       begin
          RpPF := TrpCGBPF.Create(Self);
          RpPF.QryCtto.Active := False;
          RpPF.QryCtto.DatabaseName := Objeto.DataBaseName;
          RpPF.QryCtto.SessionName  := Objeto.SessionName;
          RpPF.QryCtto.ParamByName('ID_CONTRATO').AsInteger := Objeto.Id_Contrato.AsInteger;
          RpPF.QryCtto.Active := True;
          RpPF.QRLabel42.Caption := RpPF.QryCtto.fieldbyname('NOMBRE').AsString;

          GetSQLStr(' SELECT ID_EMPRESA ' +
                    '   FROM CONTRATO ' +
                    '  WHERE ID_CONTRATO = ' + IntToStr(Objeto.Id_Contrato.AsInteger) +
                    '  ',
                    Objeto.DataBaseName,
                    Objeto.SessionName,
                    'ID_EMPRESA',
                    vlSEmpresa,
                    FALSE);

          // CZR 18-02-2010
          with RpPF.QRInterMemo2.Textos do
          begin
             Clear;
             Add ('@@0@ en mi carácter de Titular del @@1@, celebrado con esa Institución, el cual se maneja de forma @@2@, les manifiesto lo siguiente: ');
             Add (' ');
             Add (' ');
             case StrToInt(vlSEmpresa) of
                1: Add ('Que con fundamento en lo dispuesto por los articulos 102 y 103 de las Disposiciones de Carácter General aplicables a las Casas de Bolsa '
                      + '(Circular Única) emitidas por la Comisión Nacional Bancaria y de Valores, así como a lo pactado en el contrato de intermediación bursátil antes mencionado, '
                      + 'por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para que al amparo del mencionado contrato puedan operar '
                      + 'con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas integrantes del mismo grupo financiero al que '
                      + 'pertenece esa Casa de Bolsa, asi como para realizar la asignación de valores de dichas operaciones cuando provengan de su posición propia.');
                2: Add ('Que de acuerdo a lo pactado en el contrato antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que al amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa Institución Bancaria, así como para realizar la asignación de valores de dichas '
                      + 'operaciones cuando provengan de su posición propia.');
                else
                   Add ('Que de acuerdo a lo pactado en el @@3@ antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                      + 'que el amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                      + 'integrantes del mismo grupo financiero al que pertenece esa institución.');
             end;
          end;

          RpPF.QRInterMemo2.Parametro.Strings[0]:= RpPF.QryCtto.fieldbyname('NOMBRE').asString;
          //RpPF.QRInterMemo2.Parametro.Strings[1]:= Contrato.Id_Contrato.asString;
          RpPF.QRFecha.Caption := UpperCase(FmtFecha(RpPF.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
          //-------------------------
              GetSQLStr(' SELECT NOMBRE ' +
                        '   FROM PERSONA ' +
                        '  WHERE PERSONA.ID_PERSONA = ' + trim(vlSEmpresa) +
                        '  ',
                        Objeto.DataBaseName,
                        Objeto.SessionName,
                        'NOMBRE',
                        vlSNombre,
                        FALSE);
              IF vlSNombre <> '' THEN
                RpPF.QRLEmpresa.Caption := UpperCase(vlSNombre)
              ELSE
                RpPF.QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');
              GetSQLStr(' SELECT DESC_TIPO_CONTRA ' +
                        '   FROM CONTRATO A ' +
                        '   JOIN TIPO_CONTRATO b ON A.CVE_TIP_CONTRATO = b.CVE_TIP_CONTRATO ' +
                        '  WHERE A.ID_CONTRATO = ' + IntToStr(Objeto.Id_Contrato.AsInteger) +
                        '  ',
                        Objeto.DataBaseName,
                        Objeto.SessionName,
                        'DESC_TIPO_CONTRA',
                        vlSDescTipoCto,
                        FALSE);
              vlSDescTipoCto:= 'contrato de ' + vlSDescTipoCto;

              RpPF.QRInterMemo2.Parametro.Strings[1]:= vlSDescTipoCto + ' No. ' + IntToStr(Objeto.Id_Contrato.AsInteger);
              //RpPF.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto;

              {GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                        '   FROM SB_CONTRATO ' +
                        '  WHERE ID_CONTRATO = ' + IntToStr(Objeto.Id_Contrato.AsInteger) +
                        '  ',
                        Objeto.DataBaseName,
                        Objeto.SessionName,
                        'DISCRECIONAL',
                        vlsDiscrecionalidad,
                        FALSE);}
              RpPF.QRInterMemo2.Parametro.Strings[2]:= '____________________';
              RpPF.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

          //-------------------------
          RpPF.Preview;
          RpPF.Free;
       end;
     Except
       On e: Exception do
         MessageDlg('Error al Imprimir la Carta Genérica Binter / ICB del Contrato ' + RpPM.QryCtto.fieldbyname('ID_CONTRATO').asString + '.' +
           Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
     end;

  end;

{	RepInterFin.PreparaReporte(Self);
	RepInterFin2.PreparaReporte(Self);

	If Preview Then
		begin
			RepInterFin.Preview;
			RepInterFin2.Preview;
		end
	else
		begin
			RepInterFin.Print;
			RepInterFin2.Print;
		end;}
end;


procedure TwInterFinancial.bbPreliminarClick(Sender: TObject);
begin Impresion(True);
{   Objeto.RepCompuesto.Preview;}
end;

procedure TwInterFinancial.bbImprimirClick(Sender: TObject);
begin Impresion(False);
{   Objeto.RepCompuesto.Print;}
end;

procedure TwInterFinancial.cbNomClienteClick(Sender: TObject);
begin Objeto.Nom_Cliente.AsString := cbNomCliente.Text;  
end;

procedure TwInterFinancial.cbNomRepresClick(Sender: TObject);
begin Objeto.Nom_Representante.AsString := cbNomRepres.Text;
end;


procedure TwInterFinancial.chbProemioClick(Sender: TObject);
begin Objeto.B_Proemio.AsBoolean:= chbProemio.Checked;
end;

procedure TwInterFinancial.chbMandatoClick(Sender: TObject);
begin Objeto.B_Mandato.AsBoolean:= chbMandato.Checked;
end;

procedure TwInterFinancial.InterForma1DespuesShow(Sender: TObject);
begin
	Objeto.Nom_Representante.AsString := cbNomRepres.Text;
	Objeto.B_Proemio.asBoolean := True;
        Objeto.B_CGBinter.asBoolean := True;
	Objeto.B_Mandato.AsBoolean:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
	chbMandato.Visible:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
end;

procedure TwInterFinancial.ckCGBinterClick(Sender: TObject);
begin
   Objeto.B_CGBinter.asBoolean := ckCGBinter.Checked;
end;

end.
