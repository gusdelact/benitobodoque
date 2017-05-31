unit IntCRR4Carga;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntCtoPanel,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, InterEdit, IntLinkit,ToolWin,
IntParamCre, DBClient, DBCtrls, Grids, DBGrids, comObj;

type
  TCRR4CARGA = Class;

  TwCRR4CARGA = class(TForm)
    InterForma1: TInterForma;
    Panel1: TPanel;
    dbGrdCargas: TDBGrid;
    qryCargas: TQuery;
    dsCargas: TDataSource;
    btnAutorizar: TSpeedButton;
    btnNuevo: TSpeedButton;
    btnReporteXLS: TSpeedButton;
    qryColocaciones: TQuery;
    qrySaldosIniciales: TQuery;
    qryReporte424: TQuery;
    spGeneraReporte: TStoredProc;
    spAcumuladosReporte: TStoredProc;
    btnExtraccion: TButton;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgTipoReporte: TRadioGroup;
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnReporteXLSClick(Sender: TObject);
    procedure btnExtraccionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     procedure RefrescaConsulta;
     function  CreaQuery: TQuery;
     function  ValidaProceso: Boolean;
     function  ValidaReporte: Boolean;
     procedure EscribeDatosConsulta( xls: Variant; range: Variant; qry: TQuery);
     procedure ConectaConsulta(qry: TQuery);
     procedure ReporteCarteraVigente( xls: Variant; range: Variant);
     function  FechaCierre: String;
     function  GeneraReporte: Boolean;
     function  SeccionAjusteCambiario: Integer;
     function  TipoReporte: Integer;
     procedure BorraTablaPaso;
  public
    { Public declarations }
     Objeto : TCRR4CARGA;
  end;

  TCRR4CARGA= class(TInterFrame)
  private
  protected
  public
  { Public declarations }
        ParamCre: TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
   published
   end;



var
  wCRR4CARGA: TwCRR4CARGA;

implementation

{$R *.DFM}
uses
   IntCRR04AParCarga;

constructor TCRR4CARGA.Create( AOwner : TComponent );
begin
   inherited;
end;

destructor TCRR4CARGA.Destroy;
begin
   inherited;
end;

function TCRR4CARGA.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwCRR4CARGA;
begin
   W:=TwCRR4CARGA.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TwCRR4CARGA.InterForma1DespuesShow(Sender: TObject);
begin
   RefrescaConsulta;
   InterForma1.BtnNuevo.Visible     := False;
   InterForma1.BtnCancelar.Visible  := False;
   InterForma1.BtnModificar.Visible := False;
   InterForma1.BtnEliminar.Visible  := False;
   InterForma1.BtnAceptar.Visible   := False;
   InterForma1.BtnBuscar.Visible    := False;
   InterForma1.BtnSalir.SetFocus;
end;

procedure TwCRR4CARGA.RefrescaConsulta;
begin
   with qryCargas do
   begin
      Close;
      DatabaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      Open;
   end;
end;

function TwCRR4CARGA.CreaQuery: TQuery;
var
   vlQuery: TQuery;
begin
   vlQuery := TQuery.Create(nil);
   with vlQuery do
   begin
      Close;
      DatabaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
   end;
   Result := vlQuery;
end;

procedure TwCRR4CARGA.btnAutorizarClick(Sender: TObject);
var
   vlActualiza: TQuery;
begin
 if objeto.ValidaAccesoEsp('TCRR4CARGA_AUT', True, True) then
 begin
   if not ValidaProceso then
      exit;

   vlActualiza := CreaQuery;
   with vlActualiza do
   begin
      SQL.Add( ' UPDATE CR_R04A_BITACORA_CARGA ' +
               '    SET ESTATUS      = ' + CHR(39) + 'AUTORIZADO' + CHR(39) +
               '  WHERE ID_BIT_CARGA = ' + qryCargas.FieldByName('ID_BIT_CARGA').AsString);
      ExecSQL;
   end;
   FreeAndNil(vlActualiza);
   RefrescaConsulta;
 end;   
end;

function TwCRR4CARGA.ValidaProceso: Boolean;
var
   vlQry: TQuery;
begin
   Result := False;
   if qryCargas.RecordCount <= 0 then
      exit;

   if qryCargas.FieldByName('ESTATUS').AsString <> 'TERMINADO' then
   begin
      ShowMessage('El Proceso solo puede ser autorizado si su estatus es "TERMINADO". No se puede continuar');
      exit;
   end;

   vlQry := CreaQuery;
   with vlQry do
   begin
      SQL.Add(' SELECT COUNT(1) REGISTROS ' +
              '   FROM CR_R04A_BITACORA_CARGA ' +
              '  WHERE ID_PERIODO_CARGA = ' + qryCargas.FieldByName('ID_PERIODO_CARGA').AsString +
              '    AND ESTATUS          = ' + QuotedStr('AUTORIZADO') );
      Open;
      Result := FieldByName('REGISTROS').AsInteger = 0;
      if FieldByName('REGISTROS').AsInteger > 0 then
         ShowMessage('El periodo: "' + qryCargas.FieldByName('ID_PERIODO_CARGA').AsString + '" ya fue autorizado, no es posible continuar' );
   end;
   FreeAndNil(vlQry);

end;

procedure TwCRR4CARGA.btnNuevoClick(Sender: TObject);
var
   Parametros: TCRR4PARCG;
begin
   Parametros := TCRR4PARCG.Create(self);
   try
      Parametros.Apli:= Objeto.Apli;
      Parametros.ParamCre := Objeto.ParamCre;
      Parametros.Catalogo;
   finally
      Parametros.Free;
      RefrescaConsulta;
   end;
end;

procedure TwCRR4CARGA.btnReporteXLSClick(Sender: TObject);
var
   XLApp, Hoja, Rango : Variant;
begin

 if Objeto.ValidaAccesoEsp('TCRR4CARGA_REP', True, True) then
 begin

   if not ValidaReporte then
      exit;

   if not GeneraReporte then exit;

   try
      XLApp  := CreateOleObject('Excel.Application');
   except
      ShowMessage('No fue posible abrir excel');
      exit;
   end;


// preparo los detalles de todas las hojas
   XLApp.Workbooks.Add;
   Hoja := XLApp.WorkBooks[1].Worksheets[1].Select;
   XLApp.WorkBooks[1].Worksheets[1].Name := 'R' + IntToStr(TipoReporte);
   Rango := XLApp.WorkBooks[1].Worksheets[1].UsedRange;
   Rango.Range['B2'].Select;  // aqui inicio la escritura del reporte
   ReporteCarteraVigente(XLApp, Rango);
   XLApp.Columns['B:B'].Select;
   XLApp.Selection.NumberFormat := '0';
   XLApp.Columns['J:L'].Select;
   XLApp.Selection.NumberFormat := '#,##0';
   Rango.Range['B2'].Select;
   BorraTablaPaso;
   XLApp.Visible := True;
 end;
end;

function  TwCRR4CARGA.ValidaReporte: Boolean;
begin
   Result := False;
   if qryCargas.RecordCount <= 0 then
   begin
      ShowMessage('Es necesario seleccionar un Reporte. Por favor valide');
      exit;
   end;

   if rgTipoReporte.ItemIndex < 0 then
   begin
      ShowMessage('Es necesario seleccionar un Tipo de Reporte (cartera vigente, cartera vencida o estimación preventiva');
      exit;
   end;

   Result := True;
end;

procedure TwCRR4CARGA.EscribeDatosConsulta( xls: Variant; range: Variant; qry: TQuery);
var
   CeldaInicial: String; // celda por la que se inicia
   i: integer;
begin
   qry.First;
   while not qry.Eof do
   begin
      CeldaInicial := xls.ActiveCell.Address;
      for i := 0 to qry.Fields.Count - 1 do  /// recorro los campos de ese registro del query
      begin
         xls.ActiveCell.FormulaR1C1 := qry.FieldByName(qry.Fields[i].FieldName).AsString;
         xls.ActiveCell.Offset[0,1].Select; // me desplazo a la derecha
      end;
      range.Range[CeldaInicial].Select; // regreso a la celda donde empecé a escribir el registro
      xls.ActiveCell.Offset[1,0].Select; // me desplazo hacia el siguiente renglon
      qry.Next;
   end;
end;

procedure TwCRR4CARGA.ConectaConsulta(qry: TQuery);
begin
   qry.Close;
   qry.DatabaseName := Objeto.DataBaseName;
   qry.SessionName  := Objeto.SessionName;
end;

procedure TwCRR4CARGA.ReporteCarteraVigente( xls: Variant; range: Variant);
begin
   ConectaConsulta(qryReporte424);
   qryReporte424.ParamByName('paBitacoraCarga').AsInteger := qryCargas.FieldByName('ID_BIT_CARGA').AsInteger;
   qryReporte424.ParamByName('paTipoReporte').AsInteger := TipoReporte;
   qryReporte424.ParamByName('paSeccionAjusteCambiario').AsInteger := SeccionAjusteCambiario;
   qryReporte424.Open;
   EscribeDatosConsulta(xls, range, qryReporte424);
end;

function TwCRR4CARGA.FechaCierre: String;
var
   vlMes : Integer;
   vlAnio: Integer;
begin
   vlAnio := StrToInt(Copy(qryCargas.FieldByName('ID_PERIODO_CARGA').AsString, 1,4));
   vlMes  := StrToInt(Copy(qryCargas.FieldByName('ID_PERIODO_CARGA').AsString, 5,2));
   case vlMes of
           1: Result := '01/12/'+IntToStr(vlAnio - 1);
      2 - 10: Result := '01/0'+IntToStr(vlMes - 1) + '/'+ IntToStr(vlAnio);
        else  Result := '01/'+ IntToStr(vlMes - 1) + '/'+ IntToStr(vlAnio);
   end;
end;

function TwCRR4CARGA.GeneraReporte: Boolean;
var
   vlRespuesta: Integer;
   vlDescripcionError : String;
begin
   Result := False;
   with spGeneraReporte do
   begin
      Close;
      DatabaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      UnPrepare;
      ParamByName('PEIDBITACORACARGA').AsInteger := qryCargas.FieldByName('ID_BIT_CARGA').AsInteger;
      ParamByName('PETIPOREPORTE').AsInteger :=  TipoReporte;
      ParamByName('PEEMPRESA').AsInteger :=  StrToInt(Objeto.DameEmpresa);
      ParamByName('PECOMMIT').AsInteger := 1;
      Prepare;
      ExecProc;
      vlRespuesta := ParamByName('PSRESPUESTA').AsInteger;
      vlDescripcionError := ParamByName('PSDESCRIPCIONERROR').AsString;
      if vlRespuesta <> 0 THEN
      begin
         ShowMessage('Error al obtener los datos del Reporte ' + #39 + vlDescripcionError);
         exit;
      end;
   end;

   with spAcumuladosReporte do
   begin
      Close;
      DatabaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      UnPrepare;
      ParamByName('PETIPOREPORTE').AsInteger := TipoReporte;
      ParamByName('PEIDBITACORACARGA').AsInteger := qryCargas.FieldByName('ID_BIT_CARGA').AsInteger;
      ParamByName('PECOMMIT').AsInteger := 1;
      Prepare;
      ExecProc;
      vlRespuesta := ParamByName('PSRESPUESTA').AsInteger;
      vlDescripcionError := ParamByName('PSDESCERROR').AsString;
      if vlRespuesta <> 0 then
      begin
         ShowMessage('Error al calcular los acumulados' + #39 + vlDescripcionError);
         exit;
      end;
   end;

   Result := True;
end;

function TwCRR4CARGA.SeccionAjusteCambiario: Integer;
var
   vlQry: TQuery;
begin
   vlQry := CreaQuery;
   vlQry.SQL.Add('SELECT SECCION ' +
                 '  FROM CR_R04A_MAPEO_REP ' +
                 ' WHERE TIPO_REPORTE = ' + IntToStr(TipoReporte) +
                 '   AND CONCEPTO     = ' + QuotedStr('AJUSTE_CAMBIARIO') +
                 ' GROUP BY SECCION ');
   vlQry.Open;
   Result := vlQry.FieldByName('SECCION').AsInteger;
   FreeAndNil(vlQry);
end;

procedure TwCRR4CARGA.btnExtraccionClick(Sender: TObject);
var
   XLApp, Hoja, Rango : Variant;
   vlqry: TQuery;
   i: Integer;
begin
 if Objeto.ValidaAccesoEsp('TCRR4CARGA_EXT',TRUE, TRUE) then
 begin
   vlqry := CreaQuery;
   vlqry.SQL.Add('SELECT * FROM CR_R04A_CARGA WHERE ID_BIT_CARGA = ' + qryCargas.FieldByName('ID_BIT_CARGA').AsString);
   vlqry.Open;

   try
      XLApp  := CreateOleObject('Excel.Application');
   except
      ShowMessage('No fue posible abrir excel');
      exit;
   end;
// preparo los detalles de todas las hojas
   XLApp.Workbooks.Add;
   Hoja := XLApp.WorkBooks[1].Worksheets[1].Select;
   XLApp.WorkBooks[1].Worksheets[1].Name := 'R' + IntToStr(TipoReporte);
   Rango := XLApp.WorkBooks[1].Worksheets[1].UsedRange;
   Rango.Range['B2'].Select;  // aqui inicio la escritura del reporte
   for i := 0 to vlqry.Fields.Count - 1 do  /// recorro los campos de ese registro del query
      begin
         XLApp.ActiveCell.FormulaR1C1 := vlqry.Fields[i].FieldName;
         XLApp.ActiveCell.Offset[0,1].Select; // me desplazo a la derecha
   end;
   Rango.Range['B3'].Select;
   EscribeDatosConsulta(XLApp, Rango, vlqry);
   FreeAndNil(vlqry);
   XLApp.Visible := True;

 end;
end;

procedure TwCRR4CARGA.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

function TwCRR4CARGA.TipoReporte: Integer;
begin
   case rgTipoReporte.ItemIndex of
      0: Result := 424;
      1: Result := 420;
      2: Result := 419;
    else Result := 0;
    end;

end;

procedure TwCRR4CARGA.BorraTablaPaso;
var
   vlQry: TQuery;
begin
   vlQry := CreaQuery;
   with vlQry do
   begin
      SQL.Add(' DELETE CR_R04A_REP_PASO' +
              '  WHERE ID_BIT_CARGA = '  + qryCargas.FieldByName('ID_BIT_CARGA').AsString );
      ExecSQL;
   end;
   FreeAndNil(vlQry);

end;

end.
