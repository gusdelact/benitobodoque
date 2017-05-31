unit UnRpCtoBitInactiva;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, InterApl, Db, DBTables, IntHead, UnSql2, UnGene,
  IntFrm, UnCtoBitInactiva;

type
  TqrCtoBitInactiva = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qrEncabezado: TQRInterEncabezado;
    qrbDetail: TQRBand;
    QRBand1: TQRBand;
    qrlblContenido: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    Query1: TQuery;
    qContratos: TQuery;
    QRDBText2: TQRDBText;
    qrlblProceso: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    qrbHeaderRes: TQRChildBand;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrmemoDescMotivo: TQRMemo;
    qrmemoTxMotivo: TQRMemo;
    QRDBText4: TQRDBText;
    procedure qrbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    function AddValue(Variable: String; Value: String; Separador: String): String;
    function PreparaReporte(Padre: TCtoBitIn): Boolean;
  public
    { Public declarations }
  end;

  procedure Execute_RepCtoBitInactiva(ShowPreview:Boolean; Padre: TCtoBitIn);

implementation
{$R *.DFM}

procedure Execute_RepCtoBitInactiva(ShowPreview:Boolean; Padre: TCtoBitIn);
var
   Reporte : TqrCtoBitInactiva;
begin
   Reporte := TqrCtoBitInactiva.Create(Padre);
   try
      if Reporte.PreparaReporte(Padre) then
      begin
         if ShowPreview then
            Reporte.Preview
         else
            Reporte.Print;
      end;
   finally
      Reporte.Free;
   end;
end;

function TqrCtoBitInactiva.AddValue(Variable: String; Value: String; Separador: String): String;
begin
   AddValue := '';
   if (trim(Value) <> '') and (trim(Separador) <> '') then
   begin
      if trim(Variable) = '' then
         AddValue := '''' + trim(Value) + ''''
      else
         AddValue := trim(Variable) + trim(Separador) + '''' + trim(Value) + '''';
   end
   else
      AddValue := trim(Variable);
end;

function TqrCtoBitInactiva.PreparaReporte(Padre: TCtoBitIn): Boolean;
var
  strSelect   : String;
  strFrom     : String;
  strWhere    : String;
  strContenido: String;
  strTitulo2  : String;
  strSituacion: String;
begin
  PreparaReporte:= False;

  {Inicialización de la sentencia SQL y del label de contenido del reporte}
  strTitulo2:= '';
  strContenido:= 'Contenido : ';
  strSelect:= '' +
    ' SELECT Cto_Bit_Inactiva.Id_Contrato,' +
    '       SUBSTR(pkgFunProcCORP.ClientePromotor(Cto_Bit_Inactiva.Id_Contrato, ''NOMBRE_CLIENTE''),1,80) as Cliente,' +
    '       Cto_Bit_Inactiva.F_Proceso,' +
    '       Cto_Bit_Inactiva.Id_Gpo_Proceso,' +
    '       Cto_Bit_Inactiva.Sit_Contrato,' +
    '       Cto_Bit_Inactiva.Tipo_Proceso,' +
    '       Motivo_Inactiva.Desc_Motivo,' +
    '       Cto_Bit_Inactiva.Tx_Motivo,' +
    '       Cto_Bit_Inactiva.Cve_Usuario,' +
    '       Persona.Nombre As Nom_Usuario ';

  strFrom:= ' FROM Cto_Bit_Inactiva, Contrato, Motivo_Inactiva, Usuario, Persona ';

  strWhere:= '' +
    ' WHERE Cto_Bit_Inactiva.Id_Contrato = Contrato.Id_Contrato ' +
    '   and Cto_Bit_Inactiva.Cve_Motivo  = Motivo_Inactiva.Cve_Motivo ' +
    '   and Usuario.Cve_Usuario          = Cto_Bit_Inactiva.Cve_Usuario ' +
    '   and Persona.Id_Persona           = Usuario.Id_Persona';

  If Padre.Contrato.Active Then
  Begin
    strContenido:= strContenido + ' Contrato < ' + Padre.Contrato.ID_Contrato.AsString + ' > ';
    strWhere:= strWhere + ' and Cto_Bit_Inactiva.Id_Contrato = ' + Padre.Contrato.ID_Contrato.AsSQL;
  end
  else strContenido:= strContenido + ' Contrato < Todos > ';

  If Padre.Empresa.Active Then
  Begin
    strContenido:= strContenido + ', Empresa < ' + Padre.Empresa.ID_Empresa.AsString + ' > ';
    strWhere:= strWhere + ' and Contrato.Id_Empresa = ' + Padre.Empresa.ID_Empresa.AsSQL;
  end
  else strContenido:= strContenido + ', Empresa < Todas > ';

  If Padre.TipoContrato.Active Then
  Begin
    strContenido:= strContenido + ', Tipo Contrato < ' + Padre.TipoContrato.Cve_Tip_Contrato.AsString + ' > ';
    strWhere:= strWhere + ' and Contrato.Cve_Tip_Contrato = ' + Padre.TipoContrato.Cve_Tip_Contrato.AsSQL;
  end
  else strContenido:= strContenido + ', Tipo Contrato < Todos > ';

  If Padre.Producto.Active Then
  Begin
    strContenido:= strContenido + ', Producto < ' + Padre.Producto.Cve_Producto.AsString + ' > ';
    strWhere:= strWhere + ' and Contrato.Cve_Producto = ' + Padre.Producto.Cve_Producto.AsSQL;
  end
  else strContenido:= strContenido + ', Producto < Todos > ';

  If Padre.Promotor.Active Then
  Begin
    strContenido:= strContenido + ', Promotor < ' + Padre.Promotor.NUM_PROMOTOR.AsString + ' > ';
    strFrom:= strFrom + ', Gpo_Contrato ';
    strWhere:= strWhere +
      ' and Contrato.Id_Pers_Asociad = Gpo_Contrato.Id_Pers_Asociad' +
      ' and Contrato.Id_Grupo = Gpo_Contrato.Id_Grupo' +
      ' and Gpo_Contrato.Num_Promotor = ' + Padre.Promotor.NUM_PROMOTOR.AsSQL;
  end
  else strContenido:= strContenido + ', Promotor < Todos > ';

  If Padre.Motivo.Active Then
  Begin
    strContenido:= strContenido + ', Motivo < ' + Padre.Motivo.CVE_MOTIVO.AsString + ' > ';
    strWhere:= strWhere + ' and Cto_Bit_Inactiva.Cve_Motivo = ' + Padre.Motivo.CVE_MOTIVO.AsSQL;
  end
  else strContenido:= strContenido + ', Motivo < Todos > ';

  If (not Padre.FProcesoIni.IsNull) and (not Padre.FProcesoFin.IsNull) Then
  Begin
    strWhere:= strWhere + ' and Cto_Bit_Inactiva.F_Proceso Between ' + Padre.FProcesoIni.AsSQL + ' and ' +  Padre.FProcesoFin.AsSQL;
    strTitulo2:= 'del '+ FmtFecha(Padre.FProcesoIni.AsDateTime,'@DD-@MMM-@YYYY') + ' al ' + FmtFecha(Padre.FProcesoFin.AsDateTime,'@DD-@MMM-@YYYY');
  end
  else
  If not Padre.FProcesoIni.IsNull Then
  Begin
    strWhere:= strWhere + ' and Cto_Bit_Inactiva.F_Proceso = ' + Padre.FProcesoIni.AsSQL;
    strTitulo2:= 'del '+ FmtFecha(Padre.FProcesoIni.AsDateTime, '@DD-@MMM-@YYYY');
  end;

  strSituacion:= '';
  If Padre.SitALL.AsString = 'V' Then
    strContenido:= strContenido + ', Tipo Proceso < Todos > '
  else
  Begin
    If Padre.SitAC.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'AC', ', ');
    If Padre.SitIN.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'IN', ', ');
    If Padre.SitBL.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'BL', ', ');
    If Padre.SitDB.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'DB', ', ');
    If Padre.SitBP.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'BP', ', ');
    If Padre.SitDP.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'DP', ', ');
    If Padre.SitCa.AsString = 'V' Then strSituacion:= AddValue(strSituacion, 'CA', ', ');

    If strSituacion <> '' then
    Begin
      strWhere:= strWhere + ' and Cto_Bit_Inactiva.Tipo_Proceso in (' + strSituacion + ')';
      strContenido:= strContenido + ', Tipo Proceso < ' + strSituacion + ' > ';
    end
    else strContenido:= strContenido + ', Tipo Proceso < Todos > ';
  end;

  { Asignación de controles en el reporte }
  qrlblContenido.Caption:= strContenido;
  qrEncabezado.Apli:= Padre.Apli;
  qrEncabezado.Titulo2:= strTitulo2;

  { Inicialización de datos }
  qContratos.DataBaseName := Padre.DataBaseName;
  qContratos.SessionName := Padre.SessionName;
  qContratos.Sql.Clear;
  qContratos.Sql.Add(strSelect + strFrom + strWhere + ' ORDER BY CTO_BIT_INACTIVA.FOL_PROCESO');
  qContratos.Open;

  if qContratos.IsEmpty Then
    InterMsg(tmInformacion,'',0,'No existe Información para ser presentada...')
  else PreparaReporte:= True;
end;

procedure TqrCtoBitInactiva.qrbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
        if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'AC' then    qrlblProceso.Caption := 'Reactivación'
   else if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'IN' then    qrlblProceso.Caption := 'Inactivación'
   else if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'BL' then    qrlblProceso.Caption := 'Bloqueo'
   else if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'DB' then    qrlblProceso.Caption := 'Desbloqueo'
   else if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'BP' then    qrlblProceso.Caption := 'Bloqueo Perfil'
   else if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'DP' then    qrlblProceso.Caption := 'Desbloqueo Perfil'
   else if trim(qContratos.FieldByName('TIPO_PROCESO').AsString) = 'CA' then    qrlblProceso.Caption := 'Cancelación'
   else                                                                         qrlblProceso.Caption := trim(qContratos.FieldByName('TIPO_PROCESO').AsString);
   qrmemoDescMotivo.Lines.Clear;
   qrmemoTxMotivo.Lines.Clear;
   qrmemoDescMotivo.Lines.Add(qContratos.FieldByName('DESC_MOTIVO').AsString);
   qrmemoTxMotivo.Lines.Add(qContratos.FieldByName('TX_MOTIVO').AsString);
end;
end.
