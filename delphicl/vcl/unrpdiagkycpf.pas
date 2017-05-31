unit UnRpDiagKYCPF;
//------------------------------------------------------------------------------
//  Diagnóstico de KYC para Personas Fisicas
//  Realizó  : Carlos A. Mejía Ledón
//  Fecha    : Junio 2004
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl, IntHead, UnGene, DmCttoEstado, UnConKYC, UnSQL2;

type
  TqrDiagKYCPF = class(TQuickRep)
    qContrato: TQuery;
    dsContrato: TDataSource;
    qContratoSECCION: TStringField;
    qContratoCOLUMNA: TStringField;
    qContratoVALOR: TStringField;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape1: TQRShape;
    QRShape6: TQRShape;

  private
    vgTotObTiene       : Integer;
    vgTotObFalta       : Integer;
    vgTotDeTiene       : Integer;
    vgTotDeFalta       : Integer;
    vgBTotalCalculados : Boolean;
    vgNumObligatorios  : Integer;
    vgNumDeseables     : Integer;


  public
    Apli : TInterApli;
  end;

var
  qrDiagDiagKYCPF : TqrDiagKYCPF;
  procedure EXECUTE_RP_DIAGKYCPF(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_DIAGKYCPF(pApli: TInterApli; pVerImprimir: String; pIdContrato : Integer);
var
  qrDiagKYCPF: TqrDiagKYCPF;
  vlNumCampos   : Integer;
  tQry : TQuery;
  sQry : String;
begin
  qrDiagKYCPF := TqrDiagKYCPF.Create(Nil);
  with qrDiagKYCPF do
  try
    Apli                        := pApli;
    QRInterEncabezado1.Apli     := Apli;

    sQry :=   ' SELECT CTO.ID_EMPRESA, PER.CVE_PER_JURIDICA, NVL(FIS.B_ACTIV_EMPRESA,''F'' ) B_ACTIV_EMPRESA '
            + ' FROM CONTRATO        CTO, '
	    + '      PERSONA         PER,  '
            + '      PERSONA_FISICA  FIS  '
            + ' WHERE 1=1          '
            + '   AND CTO.ID_CONTRATO    = ' + IntToStr(pIdContrato)
	    + '   AND PER.ID_PERSONA (+) = CTO.ID_TITULAR  '
            + '   AND FIS.ID_PERSONA (+) = PER.ID_PERSONA  ' ;

    tQry := GetSQLQuery( sQry, Apli.DataBaseName, Apli.SessionName, True);

     if  tQry = nil then
       begin
            QRInterEncabezado1.Titulo1  := 'Diagnostico KYC Personas Fisicas';
            QRInterEncabezado1.Titulo2  := 'Contrato ' + IntToStr(pIdContrato);
            QRInterEncabezado1.IdEmpresa:= 1 ;
       end
     else
       begin
            QRInterEncabezado1.Titulo1  := 'Diagnostico KYC';

            if  tQry.FieldByName('CVE_PER_JURIDICA').AsString = 'PF' then
            begin
                 if  tQry.FieldByName('B_ACTIV_EMPRESA').AsString = 'V' then
                        QRInterEncabezado1.Titulo1  := 'Diagnostico KYC Personas Fisicas con Actividad Empresarial'
                 else
                        QRInterEncabezado1.Titulo1  := 'Diagnostico KYC Personas Fisicas ';
            end
            else
                QRInterEncabezado1.Titulo1 := QRInterEncabezado1.Titulo1 + ' Personas Morales';


            QRInterEncabezado1.Titulo2  := 'Contrato ' + IntToStr(pIdContrato);
            QRInterEncabezado1.IdEmpresa:= tQry.FieldByName('ID_EMPRESA').AsInteger ;
       end;



    vgTotObTiene       := 0;
    vgTotObFalta       := 0;
    vgTotDeTiene       := 0;
    vgTotDeFalta       := 0;
    vgNumObligatorios  := 0;
    vgNumDeseables     := 0;
    vgBTotalCalculados := False;


    qContrato.DatabaseName    := Apli.DataBaseName;
    qContrato.SessionName     := Apli.SessionName;
    qContrato.ParamByName('pIdContrato').AsString := IntToStr( pIdContrato );
    qContrato.Open;

    if not qContrato.IsEmpty then
    begin
       vlNumCampos := qContrato.FieldCount;
      // Message( IntToStr (vlNumCampos) );



       if pVerImprimir = 'Ver' then
          Preview
        else if pVerImprimir = 'Imprimir' then
          Print;
    end;

  finally
    qContrato.Close;
    Free;
  end;
end;


end.

