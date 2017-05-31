// Sistema         : Reporte de Clase de Poblaciones
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Poblaciones
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Modificado por  : Carlos Adrian Mejía Ledón (Noviembre 2003)
// Comentarios     :

unit Reppmor;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReportePMor = class(TQuickRep)
    Query1: TQuery;
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
    Query1CVE_RAMA_ACTIV: TStringField;
    Query1CVE_SUB_RAMA_AC: TStringField;
    Query1CVE_TIPO_SECTOR_PM: TStringField;
    Query1F_CONSTITUCION: TDateTimeField;
    Query1NOM_RAZON_SOCIAL: TStringField;
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
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel12: TQRLabel;
    LblSectorPM: TQRLabel;
    LblRamaPM: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText21: TQRDBText;
    LblSubRamaPM: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    Query1E_MAIL: TStringField;
    Query1ID_FUENTE_INGR: TFloatField;
    Query1DESC_FUENTE_INGR: TStringField;
    QRLabel1: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText22: TQRDBText;
    procedure ReportePMorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FSectorDesc: String;
    FRamaDesc: String;
    FSubRamaDesc: String;
  public
    procedure LlenaDatosPM;
  end;

Procedure Execute_RepPMor(ShowPreview:Boolean; Padre:TInterFrame; Id_Pers: Integer);

implementation

{$R *.DFM}
Procedure Execute_RepPMor(ShowPreview:Boolean; Padre:TInterFrame; Id_Pers: Integer);
var Reporte: TReportePMor;
begin Reporte:=TReportePMor.Create(Padre);
      Try
      Reporte.Query1.DataBaseName:=Padre.DataBaseName;
      Reporte.Query1.SessionName:=Padre.SessionName;
      Reporte.Query1.ParamByName('Id_Persona').AsInteger := Id_Pers;   //Id_Pers;
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


procedure TReportePMor.LlenaDatosPM;
Const SectorPMDesc:Array[0..3] of string = ('01 PRIVADO','02 PUBLICO','03 FINANCIERO','04 INSTITUCIONAL');
      SectorPM:Array[0..3] of string = ('01','02','03','04');
      RamaPMDesc:Array[0..3,0..10] of String =
      (('01 SOCIEDAD ANONIMA','02 ASOCIACION','03 SOCIEDAD CIVIL','','','','','','','',''),
       ('01 GOBIERNO FEDERAL','02 DEPARTAMENTO DEL D.F.','03 GOBIERNOS ESTATALES Y MUNICIPALES','04 ORGANISMOS DESCENTRALIZADOS','05 EMPRESAS DE PARTICIPACION ESTATAL','06 OTRAS ENTIDADES FINANCIERAS PUBLICAS','07 BANCA DE DESARROLLO','08 BANCO DE MEXICO','','',''),
       ('01 EMPRESAS FINANCIERAS NO BANCARIAS','02 BANCA COMERCIAL','03 BANCA DE DESARROLLO','04 SOCIEDADES DE INVIERSION','','','','','','',''),
       ('01 EMPRESAS PRIVADAS','02 EMPRESAS PUBLICAS','','','','','','','','',''));
      RamaPM:Array[0..3,0..10] of String =
      (('01','02','03','','','','','','','',''),
       ('01','02','03','04','05','06','07','08','','',''),
       ('01','02','03','04','','','','','','',''),
       ('01','02','','','','','','','','',''));
      SubRamaPMDesc:Array[0..31,0..2] of String =
      (('01','01','01 EMP. GRANDE'),
       ('01','01','02 EMP. MEDIANA'),
       ('01','01','03 EMP. PEQUEÑA'),
       ('01','01','04 EMP. HOLDING'),

       ('03','01','01 ASEGURADORA'),
       ('03','01','02 AFIANZADORA'),
       ('03','01','03 ARRENDADORA'),
       ('03','01','04 ALMACENADORA'),
       ('03','01','05 CASA DE CAMBIO'),
       ('03','01','06 FACTORING'),
       ('03','01','07 CASA DE BOLSA'),
       ('03','01','08 UNION DE CREDITO'),
       ('03','01','09 SOCIEDAD OPERADORA DE SOC. DE INVERSION'),
       ('03','01','10 OTROS'),

       ('03','02','01 PROPIOS'),
       ('03','02','02 POR TERCEROS(PERSONAS FISICAS)'),
       ('03','02','03 POR TERCEROS(PERSONAS MORALES)'),

       ('03','03','01 OTROS'),

       ('03','04','01 SOCIEDAD DE INVERSION DE CAPITAL'),
       ('03','04','02 SOCIEDAD DE INVERSION DE DEUDA(PERSONAS FISICAS)'),
       ('03','04','03 SOCIEDAD DE INVERSION DE DEUDA(PERSONAS MORALES)'),
       ('03','04','04 SOCIEDAD DE INVERSION DE COMUN'),

       ('04','01','01 FONDOS A CAJAS DE AHORRO'),
       ('04','01','02 FONDOS DE PENSIONES JUBILACIONES'),
       ('04','01','03 FONDOS DE PREVISION SOCIAL'),
       ('04','01','04 FIDUCIARIOS(PERSONAS FISICAS)'),
       ('04','01','05 FIDUCIARIOS(PERSONAS MORALES)'),

       ('04','02','01 FONDOS A CAJAS DE AHORRO'),
       ('04','02','02 FONDOS DE PENSIONES JUBILACIONES'),
       ('04','02','03 FONDOS DE PREVISION SOCIAL'),
       ('04','02','04 FIDUCIARIOS(PERSONAS FISICAS)'),
       ('04','02','05 FIDUCIARIOS(PERSONAS MORALES)'));

      SubRamaPM:Array[0..31,0..2] of String =
      (('01','01','01'),
       ('01','01','02'),
       ('01','01','03'),
       ('01','01','04'),

       ('03','01','01'),
       ('03','01','02'),
       ('03','01','03'),
       ('03','01','04'),
       ('03','01','05'),
       ('03','01','06'),
       ('03','01','07'),
       ('03','01','08'),
       ('03','01','09'),
       ('03','01','10'),

       ('03','02','01'),
       ('03','02','02'),
       ('03','02','03'),

       ('03','03','01'),

       ('03','04','01'),
       ('03','04','02'),
       ('03','04','03'),
       ('03','04','04'),

       ('04','01','01'),
       ('04','01','02'),
       ('04','01','03'),
       ('04','01','04'),
       ('04','01','05'),

       ('04','02','01'),
       ('04','02','02'),
       ('04','02','03'),
       ('04','02','04'),
       ('04','02','05'));

Var
   Cont, SectorIndex, RamaIndex: Integer;

Begin
     FSectorDesc := '';
     For Cont := 0 to 3 do
     Begin
        If SectorPM[Cont]= Query1CVE_TIPO_SECTOR_PM.value then
        Begin
           FSectorDesc := SectorPMDesc[Cont];
           SectorIndex := Cont;
        end;
     End;

     FRamaDesc := '';
     If FSectorDesc <> '' then
     Begin
        For Cont := 0 to 10 do
        Begin
             If RamaPM[SectorIndex,Cont]= Query1CVE_RAMA_ACTIV.value then
             Begin
                FRamaDesc := RamaPMDesc[SectorIndex,Cont];
                SectorIndex := Cont;
             End;
        End;
     End;

     FSubRamaDesc := '';
     If (FSectorDesc <> '') and (FRamaDesc<>'') then
     for Cont:=0 to 31 do
      begin if (SubRamaPM[Cont,0]=Query1CVE_TIPO_SECTOR_PM.value)and(SubRamaPM[Cont,1]=Query1CVE_RAMA_ACTIV.value)
               and(SubRamaPM[Cont,2]=Query1CVE_SUB_RAMA_AC.value)
            then FSubRamaDesc := SubRamaPMDesc[Cont,2];
     end;

End;


procedure TReportePMor.ReportePMorBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   LlenaDatosPM;
   LblSectorPM.Caption := FSectorDesc;
   LblSubRamaPM.Caption := FSubRamaDesc;
   LblRamaPM.Caption := FRamaDesc;
end;





end.
