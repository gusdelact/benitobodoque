// Sistema         : Clase de CrVarMge
// Fecha de Inicio : 21/08/2012
// Función forma   : Clase de CrVarMge
// Desarrollo por  : Adrián García Hernández
// Diseñado por    : Adrián García Hernández
// Comentarios     :
Unit IntCrVarMge;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, ComCtrls,
IntDtPk, DBCtrls, comObj,
IntCrRVarMge,
IntParamCre,
IntCrVMParam,
InterEdit;

Type
 TCrVarMge= class;

  TWCrVarMge=Class(TForm)
    InterForma1             : TInterForma;
    rgTipoReporte: TRadioGroup;
    Label1: TLabel;
    dtpFechaReporte: TDateTimePicker;
    edFecha: TInterEdit;
    qryEnviaExcel: TQuery;
    btnExcel: TSpeedButton;
    ProgressBarA: TProgressBar;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    qryEnviaExcelID_TITULAR: TFloatField;
    qryEnviaExcelNOMBRE: TStringField;
    qryEnviaExcelCVE_MONEDA: TFloatField;
    qryEnviaExcelID_CREDITO: TFloatField;
    qryEnviaExcelCVE_TASA_REFER: TStringField;
    qryEnviaExcelIMP_CAP_VIG1: TStringField;
    qryEnviaExcelIMP_INTERES_DIA1: TStringField;
    qryEnviaExcelTASA_PROMEDIO1: TStringField;
    qryEnviaExcelIMP_CAP_VIG2: TStringField;
    qryEnviaExcelIMP_INTERES_DIA2: TStringField;
    qryEnviaExcelTASA_PROMEDIO2: TStringField;
    qryEnviaExcelTASAVARIACION: TStringField;
    qryEnviaExcelVARIACION: TStringField;
    procedure Filtros;
    procedure CalculaFechas;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure dtpFechaReporteCloseUp(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure rgTipoReporteClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrVarMge;
    continuaproceso : Boolean;
end;
 TCrVarMge= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ParamCre                   : TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;
var
   pMesActualInicial   : String;
   pMesActualFinal     : String;
   pMesAnteriorInicial : String;
   pMesAnteriorFinal   : String;
   pTitulo             : String;
   pMesAnioActual      : String;
   pMesAnioAnterior    : String;
   pDiasActual         : String;
   pDiasAnterior       : String;
   pvlSqlReporte       : String;
   pExcelQuick         : Boolean;
   pNombreReporte      : String;

implementation

{$R *.DFM}

constructor TCrVarMge.Create( AOwner : TComponent );
begin Inherited;
end;

Destructor TCrVarMge.Destroy;
begin
  inherited;
end;


function TCrVarMge.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrVarMge;
begin
   W:=TWCrVarMge.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowBtnImprimir := True;
      W.InterForma1.ShowBtnPreview  := True;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWCrVarMge.FormShow(Sender: TObject);
begin
// Pinta datos del panel inferior
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
// Pinta datos del panel inferior

   dtpFechaReporte.Date := Objeto.Apli.DameFechaEmpresa;
   CalculaFechas;
end;

procedure TWCrVarMge.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrVarMge.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrVarMge.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrVarMge.InterForma1Imprimir(Sender: TObject);
begin
// botón del imprimir el reporte a consultar
  pExcelQuick := False;
  filtros;
  Execute_Reporte(True,
                  Objeto,
                  pTitulo,
                  pMesAnioActual,
                  pMesAnioAnterior,
                  pvlSqlReporte);
end;

procedure TWCrVarMge.InterForma1Preview(Sender: TObject);
begin
// botón de vista previa del reporte a consultar
  pExcelQuick := False;
  filtros;
  Execute_Reporte(True,
                  Objeto,
                  pTitulo,
                  pMesAnioActual,
                  pMesAnioAnterior,
                  pvlSqlReporte);
end;

procedure TWCrVarMge.CalculaFechas;
var
  dia, mes, anio  : word;
  mesActual, mesAnterior, anioActual, anioAnterior  : word;
  diaInicialActual, diaFinalActual : String;
  diaInicialAnterior, diaFinalAnterior : String;
  dias : integer;
begin
// procedimiento que calcula la fecha actual y anterior del dateTimePicker
   DecodeDate(dtpFechaReporte.Date, anio, mes, dia);
   mesActual    := mes;
   mesAnterior  := mes-1;
   anioActual   := anio;
   anioAnterior := anio;
   diaInicialActual   := '01';
   diaInicialAnterior := '01';

   Case mesActual of
      1,3,5,7,8,10,12 :
         begin
           diaFinalActual   := '31';
         end;
      2 :
         begin
           if ( (anio mod 4) = 0) and ( ((anio mod 100) <> 0) or ((anio mod 400)=0) ) then
              diaFinalActual   := '29'
           else diaFinalActual := '28';
         end;
      4,6,9,11 :
         begin
           diaFinalActual   := '30';
         end;
   end;

   Case mesAnterior of
     0 : begin
           mesAnterior  := 12;
           anioAnterior := anio - 1;
           diaFinalAnterior   := '31';
         end;
      1,3,5,7,8,10,12 :
         begin
           diaFinalAnterior   := '31';
         end;
      2 :
         begin
           if ( (anio mod 4) = 0) and ( ((anio mod 100) <> 0) or ((anio mod 400)=0) ) then
              diaFinalAnterior   := '29'
           else diaFinalAnterior := '28';
         end;
      4,6,9,11 :
         begin
           diaFinalAnterior   := '30';
         end;
   end;
   pMesActualInicial   := diaInicialActual      + '/' + IntToStr(mesActual)   + '/' + IntToStr(anioActual);
   pMesActualFinal     := diaFinalActual        + '/' + IntToStr(mesActual)   + '/' + IntToStr(anioActual);
   pMesAnteriorInicial := diaInicialAnterior    + '/' + IntToStr(mesAnterior) + '/' + IntToStr(anioAnterior);
   pMesAnteriorFinal   := diaFinalAnterior      + '/' + IntToStr(mesAnterior) + '/' + IntToStr(anioAnterior);
   edFecha.Text        := IntToStr(mesActual)   + '/' + IntToStr(anioActual);
   pNombreReporte      := '';
//   if anioAnterior < anioActual then
//   begin
//     pMesAnioActual    := ObtieneNombreMes(mesActual)   + ' / ' + IntToStr(anioActual);
//     pMesAnioAnterior  := ObtieneNombreMes(mesAnterior) + ' / ' + IntToStr(anioAnterior);
//   end
//   else
//   begin
     pMesAnioActual    := ObtieneNombreMes(mesActual)   + ' / ' + IntToStr(anioActual);
     pMesAnioAnterior  := ObtieneNombreMes(mesAnterior) + ' / ' + IntToStr(anioAnterior);
//   end;
   pNombreReporte    := ObtieneNombreMes(mesActual)   + IntToStr(anioActual);
   case rgTipoReporte.ItemIndex of
     0 : begin
            pDiasActual := diaFinalActual;
            pNombreReporte := pNombreReporte + 'NM';
         end;
     1 : begin
            pDiasActual := diaFinalAnterior;
            pNombreReporte := pNombreReporte + 'MA';
         end;
     2 : begin
            pDiasActual   := diaFinalActual;
            pDiasAnterior := diaFinalAnterior;
            pNombreReporte := pNombreReporte + 'DB';
         end;
   end;
end;

procedure TWCrVarMge.dtpFechaReporteCloseUp(Sender: TObject);
begin
// procedimiento que calcula los meses a consultar al seleccionar desde el
// DateTimePicker
  CalculaFechas;
end;

procedure TWCrVarMge.Filtros;
var
  vlSqlReporte : String;
begin
   vlSqlReporte  := '';
   pvlSqlReporte := '';
// procedimiento para filtrar el tipo de reporte a consultar
   case rgTipoReporte.ItemIndex of
    0 : begin
              if pExcelQuick then
              begin
                vlSqlReporte := Format(ObtieneQueryCuerpo(0),[pMesActualInicial,
                                                     pMesActualFinal,
                                                     pMesAnteriorInicial,
                                                     pMesAnteriorFinal,
                                                     '484',
                                                     Format(ObtieneQueryCabecera(pExcelQuick,0),[pDiasActual]),
                                                     Objeto.Apli.IdEmpresa]);
                vlSqlReporte := vlSqlReporte + ' union all ' + Format(ObtieneQueryCuerpo(0),[pMesActualInicial,
                                                                                    pMesActualFinal,
                                                                                    pMesAnteriorInicial,
                                                                                    pMesAnteriorFinal,
                                                                                    '840',
                                                                                    Format(ObtieneQueryCabecera(pExcelQuick,0),[pDiasActual]),
                                                                                    Objeto.Apli.IdEmpresa]);
              end
              else
              begin
                vlSqlReporte := Format(ObtieneQueryCuerpo(0),[pMesActualInicial,
                                                     pMesActualFinal,
                                                     pMesAnteriorInicial,
                                                     pMesAnteriorFinal,
                                                     '484',
                                                     Format(ObtieneQueryCabecera(pExcelQuick,0),[pDiasActual]),
                                                     Objeto.Apli.IdEmpresa]);
                vlSqlReporte := vlSqlReporte + ' union all ' + Format(ObtieneQueryCuerpo(0),[pMesActualInicial,
                                                                                    pMesActualFinal,
                                                                                    pMesAnteriorInicial,
                                                                                    pMesAnteriorFinal,
                                                                                    '840',
                                                                                    Format(ObtieneQueryCabecera(pExcelQuick,0),[pDiasActual]),
                                                                                    Objeto.Apli.IdEmpresa]);
              end;
              pvlSqlReporte  := vlSqlReporte + ObtieneOrder(0);
              pTitulo        := 'Consulta de acreditados nuevos en el mes.';
        end;
    1 : begin
              if pExcelQuick then
              begin
                vlSqlReporte := Format(ObtieneQueryCuerpo(1),[pMesAnteriorInicial,
                                                     pMesAnteriorFinal,
                                                     pMesActualInicial,
                                                     pMesActualFinal,
                                                     '484',
                                                     Format(ObtieneQueryCabecera(pExcelQuick,1),[pDiasActual]),
                                                     Objeto.Apli.IdEmpresa]);
                vlSqlReporte := vlSqlReporte + ' union all ' + Format(ObtieneQueryCuerpo(1),[pMesAnteriorInicial,
                                                                                    pMesAnteriorFinal,
                                                                                    pMesActualInicial,
                                                                                    pMesActualFinal,
                                                                                    '840',
                                                                                    Format(ObtieneQueryCabecera(pExcelQuick,1),[pDiasActual]),
                                                                                    Objeto.Apli.IdEmpresa]);
              end
              else
              begin
                vlSqlReporte := Format(ObtieneQueryCuerpo(1),[pMesAnteriorInicial,
                                                     pMesAnteriorFinal,
                                                     pMesActualInicial,
                                                     pMesActualFinal,
                                                     '484',
                                                     Format(ObtieneQueryCabecera(pExcelQuick,1),[pDiasActual]),
                                                     Objeto.Apli.IdEmpresa]);
                vlSqlReporte := vlSqlReporte + ' union all ' + Format(ObtieneQueryCuerpo(1),[pMesAnteriorInicial,
                                                                                    pMesAnteriorFinal,
                                                                                    pMesActualInicial,
                                                                                    pMesActualFinal,
                                                                                    '840',
                                                                                    Format(ObtieneQueryCabecera(pExcelQuick,1),[pDiasActual]),
                                                                                    Objeto.Apli.IdEmpresa]);
              end;
              pvlSqlReporte := vlSqlReporte + ObtieneOrder(1);
              pTitulo      := 'Consulta de acreditados liquidados en el mes anterior.';
        end;
    2 : begin
              if pExcelQuick then
              begin
                vlSqlReporte := Format(ObtieneQueryCuerpo(2),[pMesActualInicial,
                                                     pMesActualFinal,
                                                     pMesAnteriorInicial,
                                                     pMesAnteriorFinal,
                                                     '484',
                                                     Format(ObtieneQueryCabecera(pExcelQuick,2),[pDiasActual,pDiasAnterior]),
                                                     Objeto.Apli.IdEmpresa]);
                vlSqlReporte := vlSqlReporte + ' union all ' + Format(ObtieneQueryCuerpo(2),[pMesActualInicial,
                                                                                    pMesActualFinal,
                                                                                    pMesAnteriorInicial,
                                                                                    pMesAnteriorFinal,
                                                                                    '840',
                                                                                    Format(ObtieneQueryCabecera(pExcelQuick,2),[pDiasActual,pDiasAnterior]),
                                                                                    Objeto.Apli.IdEmpresa]);
              end
              else
              begin
                vlSqlReporte := Format(ObtieneQueryCuerpo(2),[pMesActualInicial,
                                                     pMesActualFinal,
                                                     pMesAnteriorInicial,
                                                     pMesAnteriorFinal,
                                                     '484',
                                                     Format(ObtieneQueryCabecera(pExcelQuick,2),[pDiasActual,pDiasAnterior]),
                                                     Objeto.Apli.IdEmpresa]);
                vlSqlReporte := vlSqlReporte + ' union all ' + Format(ObtieneQueryCuerpo(2),[pMesActualInicial,
                                                                                    pMesActualFinal,
                                                                                    pMesAnteriorInicial,
                                                                                    pMesAnteriorFinal,
                                                                                    '840',
                                                                                    Format(ObtieneQueryCabecera(pExcelQuick,2),[pDiasActual,pDiasAnterior]),
                                                                                    Objeto.Apli.IdEmpresa]);
              end;
              pvlSqlReporte := vlSqlReporte + ObtieneOrder(2);
              pTitulo       := 'Consulta de intereses devengado en el bimestre.';
        end;
   end;
end;

procedure TWCrVarMge.btnExcelClick(Sender: TObject);
const
  xlWBATWorksheet = -4167;
  rutaArchivo     = 'C:\Intercresitos';
var
  Excel, WorkBook, WorkSheet: OleVariant;
  vlCampos    : Integer;
  vlTitular   : Integer;
  vlRenglon   : Integer;
  vlCveMoneda : Integer;
  vlPosition  : Integer;
begin
//  procedimiento para enviar a excel el reporte con formato
    pExcelQuick := True;
    filtros;
    try
        If not SetCurrentDir(rutaArchivo) then
           CreateDir(rutaArchivo) ;
        try
          SaveDialogExcel := TSaveDialog.Create(nil);
          SaveDialogExcel.Filter := 'Libro de Microsoft Excel (*.xls)|*.xls';
          SaveDialogExcel.DefaultExt := 'xls';
          SaveDialogExcel.FileName := Trim(pNombreReporte)+'.xls';
          if SaveDialogExcel.Execute then
          begin
            qryEnviaExcel.DatabaseName := Objeto.Apli.DataBaseName;
            qryEnviaExcel.SessionName  := Objeto.Apli.SessionName;
            qryEnviaExcel.Sql.Text     := pvlSqlReporte;
            qryEnviaExcel.Open;
            if Not( qryEnviaExcel.IsEmpty ) then
            begin
               vlCampos := qryEnviaExcel.FieldCount;
      //         pExportaExcel(qryEnviaExcel,pNombreReporte, ProgressBarA, TComponent(Self));
                // crear instancia de la aplicación Excel (requieres la unidad ComObj)
                Excel := CreateOleObject('Excel.Application');
                // evitar que nos pregunte si deseamos sobreescribir el archivo
                Excel.DisplayAlerts := false;
                // agregar libro de trabajo
                Workbook := Excel.Workbooks.Add;//(xlWBATWorksheet);
                // tomar una referencia a la hoja creada
                WorkSheet := WorkBook.WorkSheets[1];
                WorkSheet.Name := pNombreReporte;
                //Llenamos las Celdas
                //(Toma en cuenta que las columnas y filas empiezan en 1, y que en el
                // WorkSheet.Cells[I,J]. I es la Fila y J es la Columna.)
                // Tomando desde un StringGrid
                /////for J := 0 to StringGrid.ColCount - 1 do
                /////WorkSheet.Cells[1, J + 1] := StringGrid.Cells[J, 0];
                   case rgTipoReporte.ItemIndex of
                    0,1 : begin
                             WorkSheet.Cells[1,4]  := 'MES ACTUAL';

                             WorkSheet.Cells[2,3]  := 'No. ACREDITADO';
                             WorkSheet.Cells[2,4]  := 'PROMEDIO DIARIO';
                             WorkSheet.Cells[2,5]  := 'TASA BASE';
                             WorkSheet.Cells[2,6]  := 'TASA ANUALIZADA';
                             WorkSheet.Cells[2,7]  := 'INTERESES';
                          end;
                      2 : begin
                             WorkSheet.Cells[1,4]  := 'MES ACTUAL';
                             WorkSheet.Cells[1,10] := 'MES ANTERIOR';

                             WorkSheet.Cells[2,3]  := 'No. ACREDITADO';
                             WorkSheet.Cells[2,4]  := 'PROMEDIO DIARIO';
                             WorkSheet.Cells[2,5]  := 'TASA BASE';
                             WorkSheet.Cells[2,6]  := 'TASA ANUALIZADA';
                             WorkSheet.Cells[2,7]  := 'INTERESES';
                             WorkSheet.Cells[2,8]  := 'No. ACREDITADO';
                             WorkSheet.Cells[2,9]  := 'PROMEDIO DIARIO';
                             WorkSheet.Cells[2,10] := 'TASA BASE';
                             WorkSheet.Cells[2,11] := 'TASA ANUALIZADA';
                             WorkSheet.Cells[2,12] := 'INTERESES';

                             WorkSheet.Cells[1,13] := 'VARIACION';

                             WorkSheet.Cells[2,13] := 'TASA ANUALIZADA';
                             WorkSheet.Cells[2,14] := 'VARIACION';
                          end;
                   end;

                vlTitular   := -1;//qryEnviaExcel.FieldByName('ID_TITULAR').AsInteger;
                vlRenglon   := 3;
                vlCveMoneda := 0;
                vlPosition  := 0;
//                qryEnviaExcel.Last;
//                ProgressBarA.Max     := qryEnviaExcel.RecordCount;
                ProgressBarA.Visible := True;
//                qryEnviaExcel.First;
                Application.ProcessMessages;
                while not qryEnviaExcel.Eof do
                begin
                   if vlCveMoneda <> qryEnviaExcel.FieldByName('CVE_MONEDA').AsInteger then
                   begin
                      if qryEnviaExcel.FieldByName('CVE_MONEDA').AsInteger  = 484 then
                         WorkSheet.Cells[vlRenglon,1]  := 'MONEDA: PESOS'
                      else WorkSheet.Cells[vlRenglon,1]  := 'MONEDA: DOLARES';
                      Inc(vlRenglon);
                      vlCveMoneda := qryEnviaExcel.FieldByName('CVE_MONEDA').AsInteger;
                   end;
                   if vlTitular <> qryEnviaExcel.FieldByName('ID_TITULAR').AsInteger then
                   begin
                      WorkSheet.Cells[vlRenglon,2] := qryEnviaExcel.FieldByName('NOMBRE').AsString;
                      Inc(vlRenglon);
                      vlTitular := qryEnviaExcel.FieldByName('ID_TITULAR').AsInteger;
                   end;
                   case rgTipoReporte.ItemIndex of
                    0,1 : begin
                             WorkSheet.Cells[vlRenglon,3] := qryEnviaExcel.FieldByName('ID_CREDITO').AsString;
                             WorkSheet.Cells[vlRenglon,4] := qryEnviaExcel.FieldByName('IMP_CAP_VIG2').AsString;
                             WorkSheet.Cells[vlRenglon,5] := qryEnviaExcel.FieldByName('CVE_TASA_REFER').AsString;
                             WorkSheet.Cells[vlRenglon,6] := qryEnviaExcel.FieldByName('TASA_PROMEDIO2').AsString;
                             WorkSheet.Cells[vlRenglon,7] := qryEnviaExcel.FieldByName('IMP_INTERES_DIA2').AsString;
                          end;
                      2 : begin
                             WorkSheet.Cells[vlRenglon,3]  := qryEnviaExcel.FieldByName('ID_CREDITO').AsString;
                             WorkSheet.Cells[vlRenglon,4]  := qryEnviaExcel.FieldByName('IMP_CAP_VIG2').AsString;
                             WorkSheet.Cells[vlRenglon,5]  := qryEnviaExcel.FieldByName('CVE_TASA_REFER').AsString;
                             WorkSheet.Cells[vlRenglon,6]  := qryEnviaExcel.FieldByName('TASA_PROMEDIO2').AsString;
                             WorkSheet.Cells[vlRenglon,7]  := qryEnviaExcel.FieldByName('IMP_INTERES_DIA2').AsString;
                             WorkSheet.Cells[vlRenglon,8]  := qryEnviaExcel.FieldByName('ID_CREDITO').AsString;
                             WorkSheet.Cells[vlRenglon,9]  := qryEnviaExcel.FieldByName('IMP_CAP_VIG1').AsString;
                             WorkSheet.Cells[vlRenglon,10] := qryEnviaExcel.FieldByName('CVE_TASA_REFER').AsString;
                             WorkSheet.Cells[vlRenglon,11] := qryEnviaExcel.FieldByName('TASA_PROMEDIO1').AsString;
                             WorkSheet.Cells[vlRenglon,12] := qryEnviaExcel.FieldByName('IMP_INTERES_DIA1').AsString;
                             WorkSheet.Cells[vlRenglon,13] := qryEnviaExcel.FieldByName('TASAVARIACION').AsString;
                             WorkSheet.Cells[vlRenglon,14] := qryEnviaExcel.FieldByName('VARIACION').AsString;
                          end;
                   end;
                   Inc(vlPosition);
                   Application.ProcessMessages;
                   ProgressBarA.Position := ProgressBarA.Position + vlPosition;
                   Inc(vlRenglon);
                   qryEnviaExcel.Next;
                   Application.ProcessMessages;
                end;
                // guardar el archivo
                WorkBook.SaveAs(SaveDialogExcel.FileName);//rutaArchivo+'\'+pNombreReporte+'.xls');
//                Excel.Quit;
                ShowMessage('Archivo Generado');// en: '+ rutaArchivo+'\'+pNombreReporte+'.xls');
                ProgressBarA.Visible := False;
                Excel.Visible := True;
            end
            else Application.MessageBox('No existe información de la Solicitud!!!','Mensaje',MB_ICONEXCLAMATION);
          end;
       finally
         SaveDialogExcel.Free;
       end;
    finally
      if qryEnviaExcel <> nil then
         qryEnviaExcel.Close;
      ProgressBarA.Position := 0;
    end;
end;

procedure TWCrVarMge.rgTipoReporteClick(Sender: TObject);
begin
// procedimiento para recalcular los meses a consultar
   CalculaFechas;
end;

end.
