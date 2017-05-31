// Sistema         : Clase de AcreditSPPI
// Fecha de Inicio : 24/10/2012
// Función forma   : Clase de AcreditSPPI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntAcreditSPPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntSGCtrl,
  ComObj;

const ALTO_COL = 16;
const ALTO_DOBLE = 20;
xlWBatWorkSheet = -4167;
                      
Type
 TAcreditPI= class;

  TWAcreditPI=Class(TForm)
    InterForma1             : TInterForma;
    Query1: TQuery;
    DataSource1: TDataSource;
    qPeriodos: TQuery;
    sdExcel: TSaveDialog;
    lbPeriodo: TLabel;
    cbPeriodos: TComboBox;
    SGCtrl1: TSGCtrl;
    Database1: TDatabase;
    Query1F_PROCESO: TFloatField;
    Query1ID_CREDITO: TFloatField;
    Query1ACREDITADO: TFloatField;
    Query1ID_CONTRATO: TFloatField;
    Query1DESC_ESTADO: TStringField;
    Query1DESC_CLAVE: TStringField;
    Query1SP: TStringField;
    Query1PI: TStringField;
    Query1PCT_RECERVA: TStringField;
    Query1RENGLON: TFloatField;
    Query1TX_OBSERVACION: TStringField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure cbPeriodosChange(Sender: TObject);
    private
    { Private declarations }
      procedure ejecutaConsulta();
      //procedure ExportaExcel();
    public
    { Public declarations }
    Objeto : TAcreditPI;
end; 
 TAcreditPI= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TAcreditPI.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' '; 
      UseQuery := False;
      HelpFile := 'IntAcreditSPPI.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TAcreditPI.Destroy;
begin inherited;
end;


function TAcreditPI.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWAcreditPI;
begin
   W:=TWAcreditPI.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TAcreditPI.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IAcredit.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TAcreditPI.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA AcreditSPPI********************)
(*                                                                              *)
(*  FORMA DE AcreditSPPI                                                            *)
(*                                                                              *)
(***********************************************FORMA AcreditSPPI********************)

procedure TWAcreditPI.FormShow(Sender: TObject);
var
  i : Integer;
begin

  InterForma1.BtnAyuda.Visible := false;

  qPeriodos.Close;
  qPeriodos.DatabaseName := Objeto.Apli.DataBaseName;
  qPeriodos.SessionName :=  Objeto.Apli.SessionName;
  qPeriodos.Open;

  cbPeriodos.Text := qPeriodos.FieldByName('ANIO_MES').AsString;

  for i:=1 to qPeriodos.RecordCount  do
     begin
       cbPeriodos.Items.Add(qPeriodos.FieldByName('ANIO_MES').AsString);
       qPeriodos.Next;
     end;

  cbPeriodosChange(Sender);

end;

procedure TWAcreditPI.FormDestroy(Sender: TObject);
begin
  //Objeto
end;

procedure TWAcreditPI.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWAcreditPI.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWAcreditPI.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWAcreditSPPI.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWAcreditPI.cbPeriodosChange(Sender: TObject);
begin
  ejecutaConsulta();
end;

procedure TWAcreditPI.ejecutaConsulta;
var
  strSQL : String;
begin
  Query1.Close;
  if cbPeriodos.Text = ''  then
  begin
     qPeriodos.Close;
     qPeriodos.DatabaseName := Objeto.Apli.DataBaseName;
     qPeriodos.SessionName :=  Objeto.Apli.SessionName;
     qPeriodos.Open;
  cbPeriodos.Text := qPeriodos.FieldByName('ANIO_MES').AsString;
  end;

  strSQL := 'select ' +
     ' F_PROCESO, ID_CREDITO, ACREDITADO, ID_CONTRATO, DESC_ESTADO, DESC_CLAVE, SP, PI, ' +
	   //' IMP_AUTORIZADO, TOT_X_CREDITO, ' +
	   ' round((CASE WHEN TOT_X_CREDITO = 0 THEN 0 ELSE TOT_X_CREDITO/IMP_AUTORIZADO END) * 100, 4) || ''%'' AS PCT_RECERVA, RENGLON, ' +
     //// RUCJ4248:: SE MODIFICA la estructura del Query para validar si la PI del Aval es mayor que la del Acreditado
	   ////' (case when pi_aval is not null then ' + QuotedStr('** PI de Aval   ') + ' else ' + QuotedStr('') +' end) AS TX_OBSERVACION ' +
     'TX_OBSERVACION ' +
          ' From ( ' +
          '      Select Cre.Id_Credito, ' +
          '             Cto.Id_contrato, ' +
          '             P.Id_persona as Acreditado, ' +
          '             Be.desc_estado, P.nombre as DESC_CLAVE, ' +
          '             Nvl((CSC.S_Perdida*100),0)   || ''%'' as SP, ' +
          '             Nvl((CSC.P_Incumpl*100),0)   || ''%'' as PI, ' +
          '             csc.pi_aval, ' +
          '             TRUNC (Csc.Anio_Mes) F_Proceso, ' +
          '             crcto.imp_autorizado, ' +
          '             Sum (csc.IMP_RESERVA_EXP + csc.IMP_RESERVA_CUB) Over (partition by cre.id_credito order by cre.id_credito) as tot_x_credito, ' +
          '               row_number() over(partition by cto.id_contrato ORDER BY cto.id_contrato, cp.id_usr_cod_post desc) renglon ' +
          //RUCJ4248: LINEA Nueva
          '             ,(CASE WHEN ( csc.pi_aval IS NOT NULL and csc.pi_aval > csc.p_incumpl ) ' +
          '                THEN ' + QuotedStr('** PI de Aval') +   ' ELSE ' + QuotedStr('') + ' END) AS tx_observacion ' + //RUCJ4248: LINEA Nueva
          '        From cr_sicc_Califica CSC ' +
//          '        join cr_credito cre on (cre.id_credito = csc.id_credito and (cre.sit_credito = ''AC'' Or '+cbPeriodos.Text+' <= To_Char (Cre.F_Liquidacion, ''yyyymm''))) ' +
			    '   JOIN ( /* Agregamos las Cartas de Credito */ ' +
					'		select id_credito, id_contrato from cr_credito cre where 2 = 2 ' +
					'		AND cre.sit_credito = ' + QuotedStr('AC') + ' OR ' + cbPeriodos.Text + ' <= TO_CHAR (cre.f_liquidacion, ' + QuotedStr('yyyymm') + ')' +
					'		union all ' +
					'		select id_credito, id_contrato from admiprod.cr_con_reg_cci cci where cci.id_reg_vigente = 1 ' +
					'   ) cre ON ( cre.id_credito = csc.id_credito ) ' +
          '        Join contrato      cto On (cto.id_contrato = cre.id_contrato) ' +
          '        JOIN cr_contrato crcto ON (crcto.id_contrato = cre.id_contrato ' +
				  ' 						  and cto.id_contrato = cto.id_contrato) ' +
          '        join cr_tipos_garan crg on (crg.id_contrato = cto.id_contrato) ' +
          '        Join persona       P  on P.Id_Persona = cto.Id_titular ' +
          '        Join domicilio     D  on D.Id_Domicilio = Nvl(P.id_dom_fiscal,P.id_domicilio) ' +
          '        Join codigo_postal CP on CP.Codigo_Postal = D.codigo_postal ' +
          '        Join bc_estado BE on BE.cve_estado = CP.id_estado_pml ' +
          '       Where 2 = 2 ' +
          '         And Csc.Vigente = 1'+
          '         And TRUNC (Csc.Anio_Mes)= (SELECT ANIO_MES ' +
          '                                   FROM cr_sicc_vobo_per' +
          '                                  WHERE cve_situacion = ''AC'' AND cve_vobo = 1 AND ANIO_MES = ' +
              cbPeriodos.Text +')'+
          '      Order By P.Id_persona,cre.Id_Credito  ' +
          ')where renglon = 1 ' +
          'Order By Desc_Estado, Desc_Clave  ';


  Query1.DatabaseName := Objeto.Apli.DataBaseName;
  Query1.SessionName  := Objeto.Apli.SessionName;

  Query1.SQL.Clear;
  Query1.SQL.Add(strSQL);
  Query1.Open;

  SGCtrl1.AddQry(Query1, // Query
              True, // Iniciar Grid, Limpiar Lineas Anteriores.
              True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
              -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
              ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
              ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
              True); // ShowTitle
  SGCtrl1.ShowTab := false;
  SGCtrl1.ShowBtnFirst := false;
  SGCtrl1.ShowBtnLast := false;
  SGCtrl1.ShowBtnPriorNext := false;
  SGCtrl1.EndGrid;


end;

{procedure TWAcreditPI.ExportaExcel;
var
  XLApp, XLSheet: Variant;
  Range, Cell: Variant;
  i: integer;
  FileName: string;
  Prefix: string;
begin
  sdExcel.Execute;
  FileName := sdExcel.FileName;
  If FileName <> ''  then
  begin

    XLApp  := CreateOleObject('Excel.Application');

    try
      Application.ProcessMessages;
      XLApp.Visible := False;
      XLApp.Workbooks.Add(xlWBatWorkSheet);
      XLSheet      := XLApp.Workbooks[1].WorkSheets[1];

      XLSheet.Cells [1, 1] := 'Periodo';
      XLSheet.Cells [1, 2] := 'Acreditado';
      XLSheet.Cells [1, 3] := 'Contrato';
      XLSheet.Cells [1, 4] := 'Estado';
      XLSheet.Cells [1, 5] := 'Municipio';
      XLSheet.Cells [1, 6] := 'PI';
      XLSheet.Cells [1, 7] := 'SP';
      //XLSheet.Cells [1, 8] := '% Reserva';
      XLSheet.Cells [1, 8] := 'Observaciones';

      ejecutaConsulta();

      i := 2;
     while not Query1.Eof do
      begin
        XLSheet.Cells [i, 1] := Query1.FieldByName('F_Proceso').AsString;
        XLSheet.Cells [i, 2] := Query1.FieldByName('Acreditado').AsString;
        XLSheet.Cells [i, 3] := Query1.FieldByName('Id_Contrato').AsString;
        XLSheet.Cells [i, 4] := Query1.FieldByName('Desc_Estado').AsString;
        XLSheet.Cells [i, 5] := Query1.FieldByName('Desc_Clave').AsString;
        XLSheet.Cells [i, 6] := Query1.FieldByName('PI').AsString;
        XLSheet.Cells [i, 7] := Query1.FieldByName('SP').AsString;
        //XLSheet.Cells [i, 8] := Query1.FieldByName('PCT_RECERVA').AsString;
        XLSheet.Cells [i, 8] := Query1.FieldByName('TX_OBSERVACION').AsString;

        Query1.Next;
        Inc (i);
      end;

    finally
      XLApp.Workbooks[1].SaveAs (FileName);
      if MessageDlg ('Generación de reporte exitosa. ¿Deseas ver el archivo?', mtConfirmation, mbYesNoCancel, 0) = mrYes then
        XLApp.Visible := True
      else
      XLApp.Quit;
      XLSheet  := Unassigned;
      Range    := Unassigned;
      Cell     := Unassigned;
      XLApp    := Unassigned;
    end;

 end;

end; }

end.
