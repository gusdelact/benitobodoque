unit RepCttofoILine;

interface        

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterApl, StdCtrls, Buttons, quickrpt, InterFor, IntFrm, UnSQL2, db, dbtables,
  RepCttoILine, RepCttoILineMandato, RepCttoILineConvenio, RepCttoILineConvenioBco,
  RepCttoILineAnexo, Grids, ExtCtrls, IntSGCtrl, RepCttoILineMandato_bco,
  DBGrids;

type
  TILine=Class;

  TwILine = class(TForm)
    cbNomRepres: TComboBox;
    Label1: TLabel;
    InterForma1: TInterForma;
    Label2: TLabel;
    cbNomCliente: TComboBox;
    Label5: TLabel;
    edLeyendaPie: TMemo;
    chbProemio: TCheckBox;
    QContratos: TQuery;
    SGContratos: TSGCtrl;
    chbMandato: TCheckBox;
    chbConvenio: TCheckBox;
    Label3: TLabel;
    edAutoriza: TEdit;
    Panel1: TPanel;
    cbASIS: TCheckBox;
    cbMONI: TCheckBox;
    cbEDOS: TCheckBox;
    cbCOMC: TCheckBox;
    cbCOSI: TCheckBox;
    cbCMEF: TCheckBox;
    chbAnexo: TCheckBox;
    QContratosID_CTO_ASOC: TFloatField;
    QContratosNOMBRE_TITULAR: TStringField;
    QContratosSIT_CONTRATO: TStringField;
    QContratosCVE_TIP_CONTRATO: TStringField;
    QContratosImprime: TStringField;
    Label4: TLabel;
    Label6: TLabel;
    edFirma1: TEdit;
    edFirma2: TEdit;
    edFirma3: TEdit;
    Label7: TLabel;
    cbCMDR: TCheckBox;
    procedure bbPreliminarClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbNomClienteClick(Sender: TObject);
    procedure cbNomRepresClick(Sender: TObject);
    procedure chbProemioClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure QContratosCalcFields(DataSet: TDataSet);
    procedure SGContratosDblClick(Sender: TObject);
    procedure chbMandatoClick(Sender: TObject);
    procedure chbConvenioClick(Sender: TObject);
    procedure chbAnexoClick(Sender: TObject);
    procedure SGContratosMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
  private
  protected
  public
    Objeto: TILine;
    Procedure Impresion(Preview: Boolean);
  published
  end;


  TILine = class(TInterFrame)
  private
		RepILine            : TReporteCttoILine;
                RepILineMandato     : TRepIlineMandato;
                RepILineMandato_bco : TRepIlineMandato_Bco;
                RepILineConvenio    : TRepIlineConvenio;
                RepILineConvenioBco : TRepIlineConvenioBco;
                RepILineAnexo       : TReporteCttoILineAnexo;
  public
		Id_Contrato      :TInterCampo;
		Nom_Representante:TInterCampo;
		Nom_Cliente      :TInterCampo;
		Leyenda_Pie      :TInterCampo;
		Cve_Per_Juridica :TInterCampo;
		B_Proemio        :TInterCampo;
		B_Mandato        :TInterCampo;
		B_Convenio       :TInterCampo;
		B_Anexo          :TInterCampo;                

                ApliNet:      TInterApli;
		constructor Create( AOwner : TComponent ); override;
		destructor destroy; override;
		Procedure DatabaseChange; override;
		Function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  end;

var
  wILine: TwILine;

implementation

{$R *.DFM}

constructor TILine.Create( AOwner : TComponent );
begin
	inherited;
	Id_Contrato		 := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
	Nom_Representante        := CreaCampo('NOM_REPRESENTANTE',ftString,tsNinguno,tsNinguno,False);
	Nom_Cliente		 := CreaCampo('NOM_CLIENTE',ftString,tsNinguno,tsNinguno,False);
	Leyenda_Pie              := CreaCampo('LEYENDA_PIE',ftString,tsNinguno,tsNinguno,False);
	Cve_Per_Juridica         := CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,False);
	B_Proemio		 := CreaCampo('B_PROEMIO',ftBoolean,tsNinguno,tsNinguno,False);
	B_Mandato		 := CreaCampo('B_MANDATO',ftBoolean,tsNinguno,tsNinguno,False);
	B_Convenio		 := CreaCampo('B_CONVENIO',ftBoolean,tsNinguno,tsNinguno,False);
	B_Anexo  		 := CreaCampo('B_ANEXO',ftBoolean,tsNinguno,tsNinguno,False);        

	Id_Contrato.AsInteger := -1;

	RepILine := TReporteCttoILine.Create(Self);
        RepILineMandato:= TRepIlineMandato.Create(Self);
        RepILineMandato_Bco:= TRepIlineMandato_Bco.Create(Self);
        RepILineConvenio:= TRepIlineConvenio.Create(Self);
        RepILineConvenioBco:= TRepIlineConvenioBco.Create(Self);
        RepILineAnexo:= TReporteCttoILineAnexo.Create(Self);

end;

destructor TILine.destroy;
begin
	If RepILine <> nil then RepILine.Free;
        If RepILineMandato <> nil then RepILineMandato.Free;
        If RepILineMandato_Bco <> nil then RepILineMandato_Bco.Free;
        If RepILineConvenio <> nil then RepILineConvenio.Free;
        If RepILineConvenioBco <> nil then RepILineConvenioBco.Free;        
        If RepILineAnexo <> nil then RepILineAnexo.Free;
        TRY
          inherited;
        EXCEPT
        END;
end;

procedure TILine.DatabaseChange;
begin inherited;
end;

function  TILine.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TwILine;
begin
	W:=TwILine.Create(Self);
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


(********************************************************)
(*				TwILine                            *)
(********************************************************)

procedure TwILine.FormShow(Sender: TObject);
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
{				GetSQLStr(
					'Select Nombre, cve_per_juridica from contrato, persona Where Id_Titular = Id_Persona',
					Objeto.DataBaseName, Objeto.SessionName,'NOMBRE',s,False); } // BMR 16/03/2000
                                s := '';
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


Procedure TwILine.Impresion(Preview: Boolean);
   Var
       i     : integer;
       paso  : String;
       paso1 : String;
       paso2 : String;
       paso3 : String;
       vari  : String;
       reps  : String;
begin
	Objeto.Nom_Cliente.AsString:= cbNomCliente.Text;
	Objeto.Nom_Representante.AsString:= cbNomRepres.Text;
	Objeto.Leyenda_Pie.AsString:= edLeyendaPie.Text;
        For i:= 1 to SGContratos.SG.RowCount -1 do
           begin
//   	    If Objeto.B_Proemio.AsBoolean Then
//   	       Begin
               If i = SGContratos.SG.Row THEN
                 begin
                 vari  := sgContratos.SG.Cells[6,i];
                 paso  := sgcontratos.SG.Cells[1,i];
                 paso1 := sgcontratos.SG.Cells[2,i];
                 paso2 := sgcontratos.SG.Cells[3,i];
                 paso3 := sgcontratos.SG.Cells[4,i];

                 If Objeto.B_Proemio.AsBoolean Then
   	            Execute_RepILine(Objeto, strtofloat(SGContratos.SG.Cells[3,i]), edAutoriza.Text, vari, cbNomRepres.Text, Preview);

                 If Objeto.B_Mandato.AsBoolean  Then
                    begin
                       If (Vari = 'CIBC') or (Vari = 'CSIL') Then
                          Execute_RepILineMandato(Objeto, strtofloat(SGContratos.SG.Cells[3,i]), paso3, edAutoriza.Text, Preview)
                       Else
                          Execute_RepILineMandato_bco(Objeto, strtofloat(SGContratos.SG.Cells[3,i]), paso3, edAutoriza.Text, Preview);
                 end;

                 If Objeto.B_Convenio.AsBoolean Then
                    begin
                       If (Vari = 'CIBC') or (Vari = 'CSIL') Then
                          Execute_RepILineConvenio(Objeto, strtofloat(SGContratos.SG.Cells[3,i]), paso3, edAutoriza.Text, Preview)
                       Else
                          Execute_RepILineConvenioBco(Objeto, strtofloat(SGContratos.SG.Cells[3,i]), paso3, edAutoriza.Text, Preview);
                 end;

                 If (Vari = 'CIBC') or (Vari = 'CSIL') Then
                    begin
                    cbCOMC.Visible := True;
                    cbCMDR.Visible := True;
                 end;

                 If Vari = 'IFON' Then
                    begin
                    cbCOMC.Visible := False;
                    cbCMDR.Visible := False;
                 end;

                 If Objeto.B_Anexo.AsBoolean Then
                    Execute_RepILineAnexo(Objeto, strtofloat(SGContratos.SG.Cells[3,i]), edAutoriza.Text, vari, cbNomRepres.Text, cbAsis.Checked, cbMoni.Checked, cbEdos.Checked, cbCmef.Checked, cbCosi.Checked, cbComc.Checked, cbCmdr.Checked, edFirma1.Text, edFirma2.Text, edFirma3.Text, Preview);
	       end;
//          end;
           end;
end;


procedure TwILine.bbPreliminarClick(Sender: TObject);
begin
  Impresion(True);
end;

procedure TwILine.bbImprimirClick(Sender: TObject);
begin
  Impresion(False);
end;

procedure TwILine.cbNomClienteClick(Sender: TObject);
begin
  Objeto.Nom_Cliente.AsString := cbNomCliente.Text;
end;

procedure TwILine.cbNomRepresClick(Sender: TObject);
begin
  Objeto.Nom_Representante.AsString := cbNomRepres.Text;
end;

procedure TwILine.chbProemioClick(Sender: TObject);
begin
  Objeto.B_Proemio.AsBoolean:= chbProemio.Checked;
end;

procedure TwILine.InterForma1DespuesShow(Sender: TObject);
var
   vari : String;
   i    : integer;
begin
        QContratos.ParamByName('PID_CTO').AsFloat := Objeto.Id_Contrato.AsFloat;
        QContratos.DatabaseName:= Objeto.ApliNet.DataBaseName;
        QContratos.SessionName:= Objeto.ApliNet.SessionName;
        QContratos.Open;
        SGContratos.AddQry(qContratos,True,True,-1,20,-1,True);
        If SGContratos.SG.Row = 1 Then
           begin
               If (sgContratos.SG.Cells[6,1] = 'CIBC') or (sgContratos.SG.Cells[6,1] = 'CSIL') Then
                  begin
                     cbCOMC.Visible := True;
                     cbCMDR.Visible := True;
//                     cbASIS.Visible := True;
//                     cbMONI.Visible := True;
               end;
               If sgContratos.SG.Cells[6,1] = 'IFON' Then
                  begin
                     cbCOMC.Visible := False;
                     cbCMDR.Visible := False;
//                     cbASIS.Visible := False;
//                     cbMONI.Visible := False;
               end;
           end;
        QContratos.Close;
	Objeto.Nom_Representante.AsString := cbNomRepres.Text;
	Objeto.B_Proemio.asBoolean := True;
      	Objeto.B_Mandato.AsBoolean:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
	chbMandato.Checked:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
    	Objeto.B_Convenio.AsBoolean:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
	chbConvenio.Checked:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
       	Objeto.B_Anexo.AsBoolean:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
	chbAnexo.Checked:= (Objeto.Cve_Per_Juridica.AsString = 'PM');
end;

procedure TwILine.QContratosCalcFields(DataSet: TDataSet);
begin
  QContratos.FieldByName('Imprime').AsString:= 'Si';
end;

procedure TwILine.SGContratosDblClick(Sender: TObject);
var
   VlRegistro: Integer;
begin
  VlRegistro:= SGContratos.SG.Selection.Top;
  If SGContratos.CellStr['Imprime',vlregistro] = 'Si' then
     SGContratos.CellStr['Imprime',vlregistro]:= 'No'
  else
     SGContratos.CellStr['Imprime',vlregistro]:= 'Si';
end;

procedure TwILine.chbMandatoClick(Sender: TObject);
begin
  Objeto.B_Mandato.AsBoolean:= chbMandato.Checked;
end;

procedure TwILine.chbConvenioClick(Sender: TObject);
begin
  Objeto.B_Convenio.AsBoolean:= chbConvenio.Checked;
end;

procedure TwILine.chbAnexoClick(Sender: TObject);
begin
  Objeto.B_Anexo.AsBoolean:= chbAnexo.Checked;
  If chbAnexo.Checked = True Then begin
     edFirma1.Enabled := True;
     edFirma2.Enabled := True;
     edFirma3.Enabled := True;
  end;
  If chbAnexo.Checked = False Then begin
     edFirma1.Enabled := False;
     edFirma2.Enabled := False;
     edFirma3.Enabled := False;
  end;
end;

procedure TwILine.SGContratosMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
   i    : integer;
   vari : string;
begin
           i := ToIndex;
           If i < 1 Then exit;
               vari := sgContratos.SG.Cells[6,i];
               If (sgContratos.SG.Cells[6,i] = 'CIBC') or (sgContratos.SG.Cells[6,i] = 'CSIL') Then
                  begin
                     cbCOMC.Visible := True;
                     cbCMDR.Visible := True;                     
//                     cbASIS.Visible := True;
//                     cbMONI.Visible := True;
               end;
               If sgContratos.SG.Cells[6,i] = 'IFON' Then
                  begin
                     cbCOMC.Visible := False;
                     cbCMDR.Visible := False;
//                     cbASIS.Visible := False;
//                     cbMONI.Visible := False;
               end;
end;

end.
