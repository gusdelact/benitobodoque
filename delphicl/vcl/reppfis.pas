// Sistema         : Reporte de Clase de Poblaciones
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Poblaciones
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Modificado por  : Carlos Adrian Mejía Ledón (Noviembre 2003)
// Comentarios     :

unit RepPFis;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReportePFis = class(TQuickRep)
    Query1: TQuery;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel31: TQRLabel;
    LblActividad: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText18: TQRDBText;
    LblSexo: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    LblEdoCivil: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    LblRama: TQRLabel;
    QRLabel23: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    QRDBText16: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    Query1ID_PERSONA: TFloatField;
    Query1ID_DOMICILIO: TFloatField;
    Query1CVE_RESIDENCIA: TStringField;
    Query1CVE_NACIONALIDAD: TStringField;
    Query1CVE_PER_JURIDICA: TStringField;
    Query1F_ALTA: TDateTimeField;
    Query1F_BAJA: TDateTimeField;
    Query1SIT_PERSONA: TStringField;
    Query1TELEF_CASA: TStringField;
    Query1TELEF_FAX: TStringField;
    Query1TELEF_OFICINA: TStringField;
    Query1CVE_TIPO_SECTOR: TStringField;
    Query1NOMBRE: TStringField;
    Query1FH_MODIFICACION: TDateTimeField;
    Query1CVE_USUAR_MODIF: TStringField;
    Query1E_MAIL: TStringField;
    Query1ID_FUENTE_INGR: TFloatField;
    Query1DESC_FUENTE_INGR: TStringField;
    Query1APELLIDO_MATERNO: TStringField;
    Query1APELLIDO_PATERNO: TStringField;
    Query1NOMBRE_PERSONA: TStringField;
    Query1CVE_ACTIVIDAD_PF: TStringField;
    Query1CVE_ESTADO_CIVIL: TStringField;
    Query1CVE_RAMA_PF: TStringField;
    Query1CVE_SEXO: TStringField;
    Query1F_NACIMIENTO: TDateTimeField;
    Query1LUGAR_NACIM: TStringField;
    Query1CURP: TStringField;
    Query1B_ACTIV_EMPRESA: TStringField;
    Query1DESC_ACTIV_EMPRESA: TStringField;
    Query1ID_PROFESION: TFloatField;
    Query1DESC_PROFESION: TStringField;
    Query1ID_EMP_LABORA: TFloatField;
    Query1NOMBRE_EMP_LABORA: TStringField;
    Query1PUESTO_EMPRESA: TStringField;
    Query1ANO_ANTIG_EMPR: TFloatField;
    Query1MES_ANTIG_EMPR: TFloatField;
    Query1ID_RANGO_INGRESO: TFloatField;
    Query1MONTO_MAXIMO: TFloatField;
    Query1SIGLAS_RFC: TStringField;
    Query1F_RFC: TStringField;
    Query1HOMOCLAVE_RFC: TStringField;
    Query1CALLE_NUMERO: TStringField;
    Query1COLONIA: TStringField;
    Query1CODIGO_POSTAL: TStringField;
    Query1RESIDENCIA: TStringField;
    Query1NACIONALIDAD: TStringField;
    Query1PAIS: TStringField;
    Query1ESTADO: TStringField;
    Query1CIUDAD: TStringField;
    QRLabel30: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel37: TQRLabel;
    procedure ReportePFisBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FRamaDesc: String;
    FActividadDesc: String;
    FSexoDesc: String;
    FEdoCivilDesc: String;
  public
     procedure LlenaDatosPF;
  end;

Procedure Execute_RepPFis(ShowPreview:Boolean; Padre:TInterFrame; Id_Pers: Integer);

implementation

{$R *.DFM}
Procedure Execute_RepPFis(ShowPreview:Boolean; Padre:TInterFrame; Id_Pers: Integer);
var Reporte: TReportePFis;
begin Reporte:=TReportePFis.Create(Padre);
      Try
      Reporte.Query1.DataBaseName:=Padre.DataBaseName;
      Reporte.Query1.SessionName:=Padre.SessionName;
      Reporte.Query1.ParamByName('Id_Persona').AsInteger := Id_Pers;
      Reporte.Query1.Open;
      Reporte.QRMacvHeader1.Apli := Padre.Apli;
      if ShowPreview then
         begin Reporte.Preview;
         end
      else Reporte.Print;
      Finally
             Reporte.Free;
      end;
end;


procedure TReportePFis.LlenaDatosPF;
Const SexoDesc:Array[0..2] of string = ('FEMENINO','MASCULINO','OTRO');
      Sexo:Array[0..2] of string = ('F','M','N');
      EdoCivilDesc:Array[0..4] of string = ('CASADO','DIVORCIADO0','SOLTERO','VIUDO','OTRO');
      EdoCivil:Array[0..4] of string = ('C','D','S','V','U');
      RamaPFDesc:Array[0..4] of string = ('01 ACTIVIDAD EMPRESARIAL','02 INDEPENDIENTE','03 EMPLEADO CB INTER','04 EMPLEADO GF INTER','05 OTROS');
      RamaPF:Array[0..4] of string = ('01','02','03','04','05');
      ActPFDesc:Array[0..4,0..10] of String =(('01 COMERCIAL','02 INDUSTRIAL','03 AGRICOLA','04 GANADERO','05 PESQUERO','06 SILVICOLA','','','','',''),
                                          ('01 PROFESIONISTA','02 FUNCIONARIO PUBLICO','03 AGENTE CORREDOR','04 AMA DE CASA','05 VIUDO(A)','06 JUBILADO(A)','07 RELIGIOSO(A)','08 ESTUDIANTE','','',''),
                                          ('01 OTRO','','','','','','','','','',''),
                                          ('01 OTRO','','','','','','','','','',''),
                                          ('01 OTRO','','','','','','','','','',''));
      ActPF:Array[0..4,0..10] of String =(('01','02','03','04','05','06','','','','',''),
                                          ('01','02','03','04','05','06','07','08','','',''),
                                          ('01','','','','','','','','','',''),
                                          ('01','','','','','','','','','',''),
                                          ('01','','','','','','','','','',''));

Var
   Cont, RamaIndex: Integer;

begin
     FSexoDesc := '';
     For Cont := 0 to 2 do
     Begin
        If Sexo[Cont]= Query1CVE_SEXO.value then
           FSexoDesc := SexoDesc[Cont];
     End;

     FEdoCivilDesc := '';
     For Cont := 0 to 2 do
     Begin
        If EdoCivil[Cont]= Query1CVE_ESTADO_CIVIL.value then
           FEdoCivilDesc := EdoCivilDesc[Cont];
     End;

     FRamaDesc := '';
     For Cont := 0 to 4 do
     Begin
        If RamaPF[Cont]= Query1CVE_RAMA_PF.value then
        Begin
           FRamaDesc := RamaPFDesc[Cont];
           RamaIndex := Cont;
        end;
     End;

     FActividadDesc := '';
     If FRamaDesc <> '' then
     Begin
        For Cont := 0 to 10 do
        Begin
             If ActPF[RamaIndex,Cont]= Query1CVE_ACTIVIDAD_PF.value then
                FActividadDesc := ActPFDesc[RamaIndex,Cont];
        End;
     End;
end;



procedure TReportePFis.ReportePFisBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   LlenaDatosPF;
   LblActividad.Caption := FActividadDesc;
   LblRama.Caption := FRamaDesc;
   LblSexo.Caption := FSexoDesc;
   LblEdoCivil.Caption := FEdoCivilDesc;
end;




end.
