unit RepCttoTolucaMandato;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, unGene, IntFrm;

type
  TRepMandato = class(TQuickRep)
    QRBand2: TQRBand;
    lbPiePagina: TQRLabel;
    TitleBand1: TQRBand;
    ChildBand2: TQRChildBand;
    QRMemoTxt: TQRMacvMemo;
    QRShape2: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    qrmNomRepresenta: TQRMemo;
    qrlLeyenda: TQRLabel;
    qrlLeyendaEmp: TQRLabel;
    qrlNomEmp: TQRLabel;
    qrlContratoFecha: TQRLabel;
    procedure qrMandatoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    FInterFrame: TInterFrame;
  public
    Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
  end;

var
  qrMandato: TRepMandato;

Procedure Execute_RepTolucaMandato(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_RepTolucaMandato(Padre: TInterFrame; Preview: Boolean);
Var
   Rep: TRepMandato;
begin
  Rep:= TRepMandato.Create(nil);
  Try
    Rep.InterFrame:= Padre;
    if Preview then
       Rep.Preview
    else
       Rep.Print;
  finally
    If Rep <> nil Then
       Rep.Free;
  end;//try & finally
end;//procedure

procedure TRepMandato.qrMandatoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  //Asigna los valores por default
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(InterFrame.FieldByName('NOM_CLIENTE').asString);
  lbPiePagina.Caption:= InterFrame.FieldByName('LEYENDA_PIE').asString;
  QRMemoTxt.Textos.Clear;
//  QRMemoLeyenda.Textos.Clear;
  if (InterFrame.FieldByName('TIPO_CONTRATO').asString = 'IFON') OR
     (InterFrame.FieldByName('TIPO_CONTRATO').asString = 'PRBC') Then
  Begin
     QRMemoTxt.Textos.Append('OTORGO EN ESTE ACTO A LAS PERSONAS CUYOS NOMBRES Y FIRMAS SE ASIENTAN EN EL PUNTO INMEDIATO ANTERIOR, PARA SER EJECUTADO EN LOS TERMINOS '+
                              'ASI MISMO SEÑALADOS, UN MANDATO DE CARACTER GRATUITO PARA ACTOS CONCRETOS DE COMERCIO, EN LOS TERMINOS DEL ARTICULO 273 DEL CODIGO '+
                              'DE COMERCIO, A EFECTO DE QUE GIREN AL BANCO INSTRUCCIONES PARA EL DESEMPEÑO DEL MANDATO PARA ACTOS DE INTERMEDIACION '+
                              'QUE SE LE CONFIERE EN LA CLAUSULA PRIMERA DEL PRESENTE CONTRATO DE PRESTACION DE SERVICIOS BANCARIOS.');
     QRMemoTxt.Textos.Append('  ');
     QRMemoTxt.Textos.Append('  ');
     QRMemoTxt.Textos.Append('LAS PERSONAS MENCIONADAS EN EL PARRAFO ANTERIOR EJERCERAN LAS FACULTADES QUE SE LES CONFIEREN EN LO CONDUCENTE A CUALQUIER OPERACION '+
                              'O ACTO ENCOMENDADO AL BANCO RESPECTO DE LAS ACCIONES DE SOCIEDADES DE INVERSION CON LAS QUE ESTE ULTIMO PUEDA OPERAR, '+
                              'OBLIGANDONOS EXPRESAMENTE A CUMPLIR EN TODOS SUS TERMINOS LAS OBLIGACIONES ASUMIDAS POR EL BANCO FRENTE A LAS PERSONAS '+
                              'QUE CONTRATE POR INSTRUCCIONES DE DICHAS PERSONAS Y A NOTIFICAR POR ESCRITO AL BANCO LA REVOCACION DE LAS FACULTADES OTORGADAS '+
                              'A LAS MISMAS.');

     qrlLeyenda.Caption:= 'ESTA HOJA FORMA PARTE DEL CONTRATO DE PRESTACION DE SERVICIOS BANCARIOS';
     qrlLeyendaEmp.Caption:= 'CELEBRADO ENTRE BANCO INTERACCIONES, S.A., INSTITUCION DE BANCA MULTIPLE, GRUPO FINANCIERO INTERACCIONES';
{     QRMemoLeyenda.Textos.Append('ESTA HOJA FORMA PARTE DEL CONTRATO DE PRESTACION DE SERVICIOS BANCARIOS No. @@0@' + Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 'CELEBRADO ENTRE BANCO INTERACCIONES, S.A., INSTITUCION DE BANCA MULTIPLE, GRUPO FINANCIERO INTERACCIONES Y @@1@,' + Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 'CON FECHA @@2@.');
}
  end//if
  else
  if (InterFrame.FieldByName('TIPO_CONTRATO').asString = 'OFON') OR
     (InterFrame.FieldByName('TIPO_CONTRATO').asString = 'PROF') Then
  Begin
     QRMemoTxt.Textos.Append('OTORGO EN ESTE ACTO A LAS PERSONAS CUYOS NOMBRES Y FIRMAS SE ASIENTAN EN EL PUNTO INMEDIATO ANTERIOR, PARA SER EJECUTADO EN LOS TERMINOS '+
                              'ASI MISMO SEÑALADOS, UN MANDATO DE CARACTER GRATUITO PARA ACTOS CONCRETOS DE COMERCIO, EN LOS TERMINOS DEL ARTICULO 273 DEL CODIGO '+
                              'DE COMERCIO A EFECTO DE QUE GIREN A LA OPERADORA INSTRUCCIONES PARA EL DESEMPEÑO DEL MANDATO PARA ACTOS DE INTERMEDIACIÓN '+
                              'QUE SE LE CONFIEREN EN LA CLAUSULA PRIMERA DEL PRESENTE CONTRATO NORMATIVO DE OPERACIONES DE COMPRAVENTA DE ACCIONES '+
                              'DE SOCIEDADES DE INVERSIÓN.');
     QRMemoTxt.Textos.Append('  ');
     QRMemoTxt.Textos.Append('  ');
     QRMemoTxt.Textos.Append('LAS PERSONAS MENCIONADAS EN EL PARRAFO ANTERIOR EJERCEN LAS FACULTADES QUE SE LES CONFIEREN EN LO CONDUCENTE A CUALQUIER OPERACIÓN '+
                              'O ACTO ENCOMENDADO A LA OPERADORA RESPECTO DE LAS ACCIONES DE SOCIEDADES DE INVERSIÓN CON LAS QUE ESTE ULTIMO PUEDA OPERAR, '+
                              'OBLIGÁNDONOS EXPRESAMENTE A CUMPLIR EN TODOS SUS TERMINOS LAS OBLIGACIONES ASUMIDAS POR LA OPERADORA FRENTE A LAS PERSONAS '+
                              'QUE CONTRATE POR INSTRUCCIONES DE DICHAS PERSONAS Y A NOTIFICAR POR ESCRITO A LA OPERADORA LA REVOCACIÓN DE LAS FACULTADES OTORGADAS '+
                              'A LAS MISMAS.');

     qrlLeyenda.Caption:= 'ESTA HOJA FORMA PARTE DEL CONTRATO NORMATIVO DE OPERACIONES DE COMPRAVENTA DE ACCIONES DE SOCIEDADES DE INVERSIÓN';
     qrlLeyendaEmp.Caption:= 'CELEBRADO ENTRE INTERACCIONES, SOCIEDAD OPERADORA DE SOCIEDADES DE INVERSIÓN, S.A. DE C.V., GRUPO FINANCIERO INTERACCIONES';
{     QRMemoLeyenda.Textos.Append('ESTA HOJA FORMA PARTE DEL CONTRATO NORMATIVO DE OPERACIONES DE COMPRAVENTA DE ACCIONES DE SOCIEDADES DE INVERSIÓN ' + Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 'NÚMERO  @@0@ .' + Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 'CELEBRADO ENTRE INTERACCIONES, SOCIEDAD OPERADORA DE SOCIEDADES DE INVERSIÓN, S.A. DE C.V., GRUPO FINANCIERO INTERACCIONES Y @@1@,' + Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 Chr(VK_RETURN) +
                                 'CON FECHA @@2@. ');
}
  end;//if}

  qrlNomEmp.Caption:=  'Y ' + InterFrame.FieldByName('NOM_CONTRATO').asString + ',';
  If InterFrame.FieldByName('B_PROSPECTO').AsString = 'V' Then
    qrlContratoFecha.Caption:= 'CON NÚMERO  ' + InterFrame.FieldByName('CONTRATO').asString + '  DE FECHA  ' + InterFrame.FieldByName('FECHA_CONTRATO').AsString + '.'
  else qrlContratoFecha.Caption:= 'CON NÚMERO  ' + InterFrame.FieldByName('CONTRATO').asString + '  DE FECHA  ' + UpperCase(FmtFecha(InterFrame.FieldByName('FECHA_CONTRATO').AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';
end;

end.
