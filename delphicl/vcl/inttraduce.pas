unit IntTraduce;
interface


USes Classes, SysUtils, UnSql2, InterApl, DB, DBTables, IntSGCtrl, UnGene,
     UnSubGen, comCtrls, Graphics,Controls, Forms, Windows, Dialogs, dbGrids, stdctrls,
     IntFrm;


//Lenguajes: 0 Español
//           1 Ingles

Const MaxTxMsg=145;
      TxMsg:Array[1..MaxTxMsg] of Array[0..1] of String=
({1}    ('Seleccione Tipo de Consulta'  ,'Select type of Inquire'), {ok}
{2}     ('No Existe un Contrato para Localizar sus Movimientos','Account not Exists'), {ok}
{3}     ('No Existe un Objeto de Grid','Object Grid not Exists'), {ok}
{4}     ('al','to'), {ok}
{5}     ('en Adelante','beyond'),//?? forward
{6}     ('La Fecha de Inicio es Mayor a la Fecha Final. Verifique.','Start Date is greater than Final Date. Verify.'), {??}
{7}     ('Consulta de Movimientos del' ,'Activity From'),
{8}     ('Consulta del','Inquire From'),
{9}     ('Día','Day'),
{10}    ('Operación','Description'),
{11}    ('Emisora','Security'),  {ok}
{12}    ('Num. Titulos','Shares'),
{13}    ('Plazo','Term'),
{14}    ('Precio','Price'),
{15}    ('Tasa Rend.','Yield Rate'),
{16}    ('Importe Neto','Net Amount'),
{17}    ('Moneda','Currency'),
{18}    ('Saldo al Día','Balance'),
{19}    ('Saldo Inicial','Starting Balance'),
{20}    ('Saldo Final','Final Balance'),
{21}    ('Error en saldo','Error in Balance'),
{22}    ('No Existen Movimientos para el Contrato Seleccionado','There are not Activites for this Contract'),
{23}    ('Mes Anterior','Last Month'),  {ok}
{24}    ('Mes Actual','Current Month'),  {ok}
{25}    ('Mismo Día','Today'),          {ok}
{26}    ('Despues Hoy','All'),          {0k}
{27}    ('Todos','All'),
{28}    ('Inicio al día','Begin at'),
{29}    ('Consulta por','Inquire By'),
        ('Contrato','Account'),  {ok}
        ('Lenguaje','Language'), {ok}
        ('Consultar Mes**','Inquire Month**'),
        ('Debe Seleccionar','Requiered Trader Choose'), {?}
        ('Error Fecha Invalida','Error Invalid Date'),
        ('Consulta de Movimientos' ,'Activities'),
        ('Fecha' ,'Date'),
        ('Tasa de Interes','Interest Rate'),
    {38}('Importe Cargado','Amount Debited'),
        ('Situación','Situation'),
        ('Total de Interes','Total of Interest'),
        ('Consulta de Interes por Saldo Deudor','Debit Balance Interest'), {ok}
        ('Saldo Deudor','Debit Balance'),
        ('Procesado'   ,'Procesing'),
    {44}('Sin Procesar','Without Procesing'),
    {45}('Operador','Operador'),
     {46}('Fondo','Fund'), {ok}
    {47}('Descripción','Descripción'),
    {48}('I.S.R. Retenido','Tax'),
    {49}('Consulta de Retención de I.S.R. en Sociedades de Inversión','Mutual Fund Taxes'),
    {50}('Total de I.S.R. Retenido','Tax Debited'),
    {51}('Total de I.S.R Retenido al Día','Tax Debited at '),
    {52}('Sociedad de Inversión','Mutual Fund'), {ok}
    {53}('Saldo Acreedor','Credit Balance'),
    {54}('Consulta Saldos Deudor y Acreedor','Credit/Debit Balance'),
    {55}('Nombre','Name'),
    {56}('Total','Total'),
    {57}('Grupo','Group'),
    {58}('Promotor','Trader'),
    {59}('Saldo Ayer','Balance'),
    {60}('Saldo Actual','Balance'),
    {61}('Debe Seleccionar un Promotor/Grupo','Requiered Trader Choose'), {?}
    {62}('Debe Seleccionar una Unidad de Negocio/Sucursal','Requiered Branch Choose'), {?}
    {63}('No Tiene Derechos de Super Usuario para Consultar Todos los Clientes','Super User Rights Requiered'), {?}
    {64}('Sucursal','Branch'), {ok}
    {65}('Total Saldo Deudor','Total'),   {??}
    {66}('Total Saldo Acreedor','Total'),  {??}
    {67}('Importe','Ammount'), {ok}
    {68}('Clientes de un Promotor','Accounts by Trader'),
    {69}('Clientes de una Sucursal','Acounts by Branch'),
    {70}('Todos los Clientes','All Accounts'),
    {71}('Consulta de Portafolios','Type of Market/Instrument'),
    {72}('Consultar','InQuery'),
    {73}('Mercado o Tipo de Instrumento','Type of Market/Instrument'),
    {74}('Valor Actual','Porfolio'),
    {75}('de la Cartera','Current Value'),
    {76}('% Portafolio','% Portfolio'),
    {77}('Mercado de Capitales','Capital Market'),
    {78}('Mercado de Dinero','Money Market'),
    {79}('Reportos','Repos'),
    {80}('Sociedades de Inversión de Deuda','Debt Mutual Funds'),
    {81}('Sociedades de Inversión de Capitales','Common Mutual Funds'),
    {82}('Efectivo','Cash'),
    {83}('SubTotal','SubTotal'),
    {84}('Seleccionar Mes','Select Month'),
    {85}('Consulta de Portafolios','Type of Market/Instrument'),
    {86}('Posición Prestada'   ,'Borrowes Securities'),
    {87}('Posición en Préstamo','Loaned Securities'),
//    {88}('Posición','Shares'),
    {88}('Posición','Quantity'),
    {89}('Precio'#13#10'Promedio','Aver.'#13#10'Price'),
    {90}('Fecha'#13#10'Promedio','Aver.'#13#10'Date'),
    {91}('Precio'#13#10'Mercado','Market'#13#10'Price'),
    {92}('Plusvalia'#13#10'(Minusvalia)','P&L'),
    {93}('Valuación'#13#10'Mercado','Market'#13#10'Value'),
    {94}('Cartera','Portfolio'),
    {95}('Mismo Día(Hoy)','Today'),
//    {96}('Inicio de Día','Beginning of Day'),
    {96}('Cierre Día Anterior','Day Before'),
    {97}('Posición en Prestamo','Loaned Securities'),
    {98}('Valuación Cartera','Portfolio Value'),
    {99}('Saldo de Efectivo','Cash Balance'),
   {100}('Valuación Total','Portfolio Net Value'),
   {101}('No Existe Contrato','Account not Exists'), {?}
   {102}('No Existen un Registro de Fechas para la Empresa del Contrato','Record Date not Exists'), {9}
   {103}('Valuación'#13#10'Mercado','Market'#13#10'Value'),
   {104}('Hasta el Día','At Day'),
   {105}('Consulta de Posición','Portfolio'),
   {106}('Valor Actual'#13#10'de la Cartera','Portfolio'#13#10'Current Value'),
   {107}('Portafolio','Portfolio'),
   {108}('Ver Todos','All'),
   {109}('Ver Todos los Fondos o el Fondo Seleccionado','All Mutual Funds or Fund Chosen'),
   {110}('Selección','Select'),
   {111}('Después de Hoy','After Today'), {?}
   {112}('Inicio el Día','Begin at'), {9}
   {113}('Posición al Día','Posición al Día'),
   {114}('Posición al Cierre','Posición al Cierre'),
   {115}('Valuación de Reportos al','Repo On'),
   {116}('Folio','Reference'),
   {117}('Fecha'#13#10'Inicio','Beginning'),
   {118}('Fecha'#13#10'Vencimiento','Maturity'),
   {119}('Tasa','Int.Rate'),
   {120}('Tasa'#13#10'Neta','Net'#13#10'Rate'),
   {121}('Días'#13#10'Aplicados','ELD'), {?}
//   {122}('Interes','Goodwill'), {9}
   {122}('Interes','Accrued'#13#10'Interest'), {9}
   {123}('Valor'#13#10'Teórico','Theoric'#13#10'Value'),
   {124}('Posición de Valores Prestados al','Borrowes Securities at'),
   {125}('Posición de Valores Recibidos en Prestamo al','Loaned Securities at'),
   {126}('Cupón','Cupon'),
   {127}('Tasa'#13#10'Premio','Loan Rate'),
   {128}('Dias'#13#10'Trans.','ELD'),
   {129}('Precio'#13#10'Pactado','Agreed'#13#10'Price'),
   {130}('Premio'#13#10'Por Pagar','Loan Amount'#13#10'to Pay'),
   {131}('Valor'#13#10'Mercado','Market'#13#10'Value'), {?}
   {132}('Emisora'#13#10'Serie','Security'), {9}
   {133}('Referencia','Reference'),
   {134}('Fecha de Vigencia','Date of use'),
   {135}('Dias por'#13#10'Vencer','Time to'#13#10'Maturity'),
   {136}('Fecha Operacion','Trade Date'),
   {137}('Fecha Liquidacion','Settlement Date'),
   {138}('Liquidacion','Settlement'),
   {139}('Operacion','Trade'),
   {140}('Totales','Total'),
   {141}('Servicio','Service'),
   {142}('Consulta de Inventario por Servicio','Portfolio by Service'),
   {143}('Interes'#13#10'Cliente', 'Client'#13#10'Interest'),
   {144}('Valuación'#13#10'Costo','Cost'#13#10'Value'),
   {145}('Histórica','History')
        );

Const
 kSeleccione_Tipo_de_Consulta=1;
 kNo_Existe_Contrato=2;
 kNo_Existe_Grid=3;
 k_Al_=4;
 k_en_Adelante_=5;
 k_La_Fecha=6;
 kConsulta_de_Movimientos_Contrato=7;
 kConsulta_del=8;
 kDia=9;
 kOperacion=10;
 kEmisora=11;
 kNum_Titulos=12;
 kPlazo=13;
 kPrecio=14;
 kTasa_Rend=15;
 kImporte_Neto=16;
 kMoneda=17;
 kSaldo_al_Dia=18;
 kSaldo_Inicial=19;
 kSaldo_Final=20;
 kError_en_saldo=21;
 kNo_Existen_Momivientos=22;
 kMes_Anterior=23;
 kMes_Actual=24;
 kMismo_Dia=25;
 kDespues_Hoy=26;
 kTodos=27;
 kInicio_el_dia=28;
 kConsulta_Por=29;
 kcontrato=30;
 kLenguaje=31;
 kConsultar_Mes=32;
 kDebe_Seleccionar=33;
 kError_Fecha_Invalida=34;
 kConsulta_de_Movimientos=35;
 kFecha=36;
 kTasa_de_Interes=37;
 kImporte_Cargado=38;
 kSituacion=39;
 kTotal_de_Interes =40;
 kConsulta_de_Interes_por_Saldo_Deudor =41;
 kSaldo_Deudor=42;
 kProcesado=43;
 kSin_Procesar=44;
 kOperador=45;
 kFondo=46;
 kDescripcion=47;
 kISR_Retenido=48;
 kConsulta_de_Retencion_de_ISR=49;
 kTotal_de_ISR=50;
 kTotal_de_ISR_al_Dia=51;
 kSociedad_de_Inversion=52;
 kSaldo_Acreedor=53;
 kConsulta_Saldos_Deudor_y_Acreedor=54;
 kNombre=55;
 kTotal=56;
 kGrupo=57;
 kPromotor=58;
 kSaldo_Ayer=59;
 kSaldo_Actual=60;
 kDebe_Seleccionar_un_Promotor=61;
 kDebe_Seleccionar_una_Unidad_de_Negocio=62;
 kNo_Tiene_Derechos_de_Super_Usuario=63;
 kSucursal=64;
 kTotal_Saldo_Deudor=65;
 kTotal_Saldo_Acreedor=66;
 kImporte=67;
 kClientes_de_un_Promotor=68;
 kClientes_de_una_Sucursal=69;
 kTodos_los_Clientes=70;
 kConsulta_de_portafolios=71;
 kConsultar=72;
 kMercado_o_Tipo_de_Instrumento=73;
 kValor_Actual=74;
 kde_la_Cartera=75;
 kPorciento_de_Portafolio=76;
 kMercado_de_Capitales=77;
 kMercado_de_Dinero=78;
 kReportos=79;
 kSociedades_de_Inversion_de_Deuda=80;
 kSociedades_de_Inversion_de_Capitales=81;
 kEfectivo=82;
 kSubTotal=83;
 kSeleccionar_Mes=84;
 kConsulta_de_Portafolios_2=85;
 kPosicion_Prestada=86;
 kPosicion_en_Prestamo=87;

 var vgFindActiveApp:Boolean;
    vgFindActiveAppName:String;
    vgFindActiveAppCount:Integer;
    vgFindActiveAppHandle:THandle;
    vgFindActiveAppShow:Boolean;
    vgFindActiveMsg:String;
    vgFindShowApp:Boolean;
    vgFindActiveCuenta:Boolean;




Const kTraduceMeses:Array[1..12,0..1] of ShortString=
   ( ('Enero'      ,'January'),
     ('Febrero'    ,'February'),
     ('Marzo'      ,'March'),
     ('Abril'      ,'April'),
     ('Mayo'       ,'May'),
     ('Junio'      ,'June'),
     ('Julio'      ,'July'),
     ('Agosto'     ,'August'),
     ('Septiembre' ,'September'),
     ('Octubre'    ,'October'),
     ('Noviembre'  ,'November'),
     ('Diciembre'  ,'December')
     );

Function  Traduce(I:Integer; vgIdioma:Integer):String;
Function  TraduceAnoMes(AnoMes:Integer; vgIdioma:Integer):String;

Function StrMultiComp(Texto:String; Llaves, Resultados, ResultadoError:String):string;
//Const vgIdioma:Integer;



Function IAnoMesToDate(AnoMes:Integer):TDateTime;
Function IDateToStr(Fecha:TDateTime):String;
Function IStrDateOK(Fecha:String):Boolean;
Function IDateIniMes(FechaHoy:TDateTime):TDateTime;
Function ISigMes(FechaHoy:TDateTime):TDateTime;
Function IDateFinMes(FechaHoy:TDateTime):TDateTime;
Function IFechaLargaStr(Date:TDate; Idioma:Integer):String;
Function IShowAsTime(S:String):String;
Function ITime(S:TDateTime):Integer;
Function IDia(FechaHoy:TDateTime):Integer;
Function IAno(FechaHoy:TDateTime):Integer;

Procedure IShowQuery(SQL:String; DataBaseName,SessionName:String);


 Type
    TInterCampoIdioma=Class(TInterCampo)
                        Public
                              Function    Trad(S:String):String;
                              Constructor CreaCampoIdioma(AOwner:TComponent; eNombreCampo:string; eTipo:TFieldType;
                                              eStpEntrada,eStpSalida:LongInt;
                                              eReadFromQuery:Boolean); Virtual;
                      end;



Type
  TFastFecha=Class
             Private
              FApli    :TInterApli;
              FID_Empresa :Integer;
              FD000    :TDateTime;
              FD001    :TDateTime;
              FD002    :TDateTime;
              FAYER    :TDateTime;
              FIMAN    :TDateTime;
              FIMAC    :TDateTime;
              FFMAN    :TDateTime;
              FFMAC    :TDateTime;
             Protected
               Procedure SetID_Empresa(I:Integer);
               Procedure SetApli(Apli:TInterApli);
             Public
              DataBaseName:String;
              SessionName:String;
              Property Apli:TInterApli Read FApli Write SetApli;
              Property ID_EMPRESA:Integer Read FID_EMPRESA Write SetID_Empresa;
              Property D000:TDateTime read FD000;
              Property D001:TDateTime read FD001;
              Property D002:TDateTime read FD002;
              Property AYER:TDateTime read FAYER;
              Property IMAN:TDateTime read FIMAN;
              Property IMAC:TDateTime read FIMAC;
              Property FMAN:TDateTime read FFMAN;
              Property FMAC:TDateTime read FFMAC;
              Function TextoMes(F:TDateTime; vgIdioma:Integer):String;
              Procedure Refresh;
            end;


Type
  TIListaCto=Class(TPersistent)
             Private
               FListaCto:TStringList;
               FListaEmp:TStringList;
             Protected
             Public
               Procedure  Clear;
               Procedure  AddCto(Cto:String);
               Function   SQLCtoEmpOr(CampoEmpresa,CampoCto:String):String;
               Function   SQLCto(CampoCto,Operacion:String):String;
               Procedure  AddCtoEmp(Cto,Emp:String);
               Function   SQLCtoEmp(CampoEmpresa,CampoCto,Operacion:String):String;
               function   Count: Integer;
               Constructor Create; Virtual;
               Destructor  Destroy; override;
            end;





Function Lana(R:Extended):String;
Function Procen(R:Extended):String;

Function Lana00(R:Extended):String;

Function DivNoCero(X,Y:TTipoDinero):TTipoDinero;
Function Trad(S:String; vgIdioma:Integer):String;

Function ITexto(S:String):String;
Function IDinero(R:Extended):String;
Function IDinero00(R:Extended):String;
Function IEntero(R:Extended):String;
Function IEnteroSig(R:Extended):String;
Function IEnteroDinero(R:Extended):String;
Function IMulStr(Str1,Str2:String):String;
Function IMulStr00(Str1,Str2:String):String;
Function IValidStrToFloat(Str:String; ErrVal:Extended):Extended;
Function ISinQuote(S:String):String;

Function ISegundos(TInicio,TFin:TDateTime):Integer;
Function IMinutos(TInicio,TFin:TDateTime):Integer;
Function IStrTimeToSeg(S:String):Integer;



Procedure LVCarga(LV:TListView; Q:TQuery);
Function VarRecAsStr(Dato:TVarRec):String;
Procedure LvClear(LV:TListView);
Function LVSel(LVOrigen:TListView;  Var NodoOrigen:TListItem):Boolean;
Function LvAddHeader(LV:TListView; Dato:Array of Const; Objeto:TObject):TListItem;
Procedure LvDelNodo(LV:TListView; Nodo:TListItem);
Function ILeft(S:String; Tam:Integer):String;
Function IRigth(S:String; Tam:Integer):String;
Function ILeftCanvas(S:String; Canvas:TCanvas; Tam:Integer):String;
Function ILeftControl(S:String; Control:TWinControl; Tam:Integer):String;
Function IRigthControl(S:String; Control:TWinControl; Tam:Integer):String;

Function IPrecio(E:Extended):Extended;
Function I00(E:Extended):Extended;
Function IHora(T:TDateTime):Integer;

Function IFindActiveApp(AppName:String; ShowApp:Boolean; MsgIfFind:String):Boolean;
Function IFindActiveAppHandle(AppName:String; ShowApp:Boolean; MsgIfFind:String; Var Handle:THandle):Boolean;

implementation


Function IPrecio(E:Extended):Extended;
begin Result:=StrToFloat(FormatFloat('0.0000000',E));
end;

Function I00(E:Extended):Extended;
begin Result:=StrToFloat(FormatFloat('0.00',E));
end;


Constructor TInterCampoIdioma.CreaCampoIdioma(AOwner:TComponent; eNombreCampo:string; eTipo:TFieldType;
                                              eStpEntrada,eStpSalida:LongInt;
                                              eReadFromQuery:Boolean);
begin Inherited Create(AOwner);
      Nombre:=eNombreCampo;
      Parametro:=TInterFrame(AOwner).FPrefijo+eNOmbreCampo;
      Tipo:=eTipo;
      TInterFrame(AOwner).FFields.Add(Self);
      StpEntrada:=eStpEntrada;
      StpSalida :=eStpSalida;
      ReadFromQuery:=eReadFromQuery;
end;

Function TInterCampoIdioma.Trad(S:String):String;
begin Result:=IntTraduce.Trad(S,AsInteger);
end;



Function IShowAsTime(S:String):String;
begin S:='000000'+S;
      S:=Copy(S,Length(S)-5,6);
      Result:=Copy(S,1,2)+':'+Copy(S,3,2)+':'+Copy(S,5,2);
end;

Function IStrTimeToSeg(S:String):Integer;
var SS:String;
    T:TDateTime;
    sa:Real;
begin if Trim(S)='-1' then begin Result:=-1; exit; end;
      SS:='000000'+S;
      SS:=Copy(SS,Length(SS)-5,6);
      T:=EncodeTime(StrToInt(Copy(SS,1,2)),
                    StrToInt(Copy(SS,3,2)),
                    StrToInt(Copy(SS,5,2)),0);
      sa:=1/(((1/24)/60)/60);
      Result:=Round((T-Trunc(T))*sa);
end;


Function ITime(S:TDateTime):Integer;
var ss:String;
begin Result:=StrToInt(FormatDateTime('HHNNSS',S));
end;

Function ISeg(S:TDateTime):Integer;
var ss:String;
begin Result:=StrToInt(FormatDateTime('HHNNSS',S));
end;



Function IAnoMesToDate(AnoMes:Integer):TDateTime;
var Ano,Mes,Dia:Integer;
begin Ano:=AnoMes div 100;
      Mes:=AnoMes mod 100;
      Dia:=01;
      Result:=EncodeDate(Ano,Mes,Dia);
end;

Function IHora(T:TDateTime):Integer;
var Hora,Min,Seg,MSec:Word;
begin DecodeTime(T,Hora,Min,Seg,MSec);
      Result:=Hora;
end;


Function IFechaLargaStr(Date:TDate; Idioma:Integer):String;
var AnoMes:Integer;
    Y,M,D:Word;
begin DecodeDate(Date,Y,M,D);
      Result:=kTraduceMeses[M,Idioma]+' '+IntToStr(D)+','+IntToStr(Y);
end;


Procedure  TIListaCto.Clear;
begin FListaCto.Clear;
      FListaEmp.Clear;
end;


Procedure  TIListaCto.AddCto(Cto:String);
begin FListaCto.Add(Cto);
end;

Procedure  TIListaCto.AddCtoEmp(Cto,Emp:String);
begin FListaCto.Add(Cto);
      FListaEmp.Add(Emp);
end;

function TIListaCto.Count: Integer;
Begin
  If FListaCto <> nil then count:= FListaCto.Count
  else count:= 0;
end;

Function   TIListaCto.SQLCtoEmp(CampoEmpresa,CampoCto,Operacion:String):String;
var S:String;
    i:Integer;
begin Result:=''; S:='';
      For i:=0 to FListaCto.Count-1 do
      begin if S<>'' then S:=S+' '+Operacion+' ';
            S:=S+'('+CampoEmpresa+' = '+FListaEmp.Strings[i]+' AND '
                    +CampoCto    +' = '+FListaCto.Strings[i]+' ) ';

      end;
      if S<>'' then S:='('+S+')';
      Result:=S;
end;

Function   TIListaCto.SQLCto(CampoCto,Operacion:String):String;
var S:String;
    i:Integer;
begin Result:=''; S:='';
      For i:=0 to FListaCto.Count-1 do
      begin if S<>'' then S:=S+' '+Operacion+' ';
            S:=S+'('+CampoCto+' = '+FListaCto.Strings[i]+' ) ';
      end;
      if S<>'' then S:='('+S+')';
      Result:=S;
end;

Function   TIListaCto.SQLCtoEmpOr(CampoEmpresa,CampoCto:String):String;
begin Result:=SQLCtoEmp(CampoEmpresa,CampoCto,' OR ');
end;



Constructor TIListaCto.Create;
begin Inherited;
      FListaCto:=TStringList.Create; FListaCto.Clear;
      FListaEmp:=TStringList.Create; FListaEmp.Clear;
end;

Destructor TIListaCto.Destroy;
begin if FlistaCto<>nil then FListaCto.Clear;
      if FlistaEmp<>nil then FListaEmp.Clear;
      Inherited;
end;


Function ActiveAppEnumWindowsProc(H:THandle; LParam:LongInt):Bool; far; stdcall;
var S, PP:String;
    i:IntegeR;
begin Result:=True;
      S:=''; for i:=0 to 256 do S:=S+#0;
      GetClassName(H,Pchar(S ),255);
      S:=Trim(S);
      PP:=''; for i:=0 to 256 do PP:=PP+#0;
      GetWindowText(H,Pchar(PP),255);
      if (UpperCase(S)<>'TAPPBUILDER') and  (Pos(vgFindActiveAppName,UpperCase(PP))>0)
         then begin inc(vgFindActiveAppCount);
                    if (vgFindActiveAppCount>=1) and (Not vgFindActiveCuenta)
                    then begin vgFindActiveAppHandle:=H;
                               vgFindActiveApp:=True;
                               if vgFindShowApp
                               then begin ShowWindow(H,SW_MINIMIZE);
                                          ShowWindow(H,SW_RESTORE);
                                    end;
                         end;
              end;
end;

Function IFindActiveApp(AppName:String; ShowApp:Boolean; MsgIfFind:String):Boolean;
begin vgFindShowApp:=ShowApp;
      vgFindActiveApp:=False;
      vgFindActiveAppCount:=0;
      vgFindActiveAppName:=UpperCase(AppName);
      vgFindActiveAppShow:=ShowApp;
      vgFindActiveMsg:=MsgIfFind;
      vgFindActiveCuenta:=True;
      EnumWindows(@ActiveAppEnumWindowsProc,0);
      if (vgFindActiveAppCount>=1)
      then begin if Trim(vgFindActiveMsg)<>'' then ShowMessage(vgFindActiveMsg);
                 vgFindActiveCuenta:=False;
                 EnumWindows(@ActiveAppEnumWindowsProc,0);
           end;

      Result:=vgFindActiveApp;
end;


Function IFindActiveAppHandle(AppName:String; ShowApp:Boolean; MsgIfFind:String; Var Handle:THandle):Boolean;
begin vgFindShowApp:=ShowApp;
      vgFindActiveApp:=False;
      vgFindActiveAppCount:=0;
      vgFindActiveAppName:=UpperCase(AppName);
      vgFindActiveAppShow:=ShowApp;
      vgFindActiveMsg:=MsgIfFind;
      vgFindActiveCuenta:=True;
      EnumWindows(@ActiveAppEnumWindowsProc,0);
      if (vgFindActiveAppCount>=2)
      then begin if Trim(vgFindActiveMsg)<>'' then ShowMessage(vgFindActiveMsg);
                 vgFindActiveCuenta:=False;
                 EnumWindows(@ActiveAppEnumWindowsProc,0);
           end;
      Handle:=vgFindActiveAppHandle;
      Result:=vgFindActiveApp;
end;





Function IMulStr(Str1,Str2:String):String;
var Valor1,Valor2:Real; Err:Integer;
begin Str1:=Trim(Str1); Str2:=Trim(Str2);
      Val(Str1,Valor1,Err);
      if (Str1='') or (Err<>0) then Valor1:=0;
      Val(Str2,Valor2,Err);
      if (Str2='') or (Err<>0) then Valor1:=0;
      Result:=FormatFloat('0.#######',Valor1*Valor2);
end;

Function IMulStr00(Str1,Str2:String):String;
var Valor1,Valor2:Real; Err:Integer;
begin Str1:=Trim(Str1); Str2:=Trim(Str2);
      Val(Str1,Valor1,Err);
      if (Str1='') or (Err<>0) then Valor1:=0;
      Val(Str2,Valor2,Err);
      if (Str2='') or (Err<>0) then Valor1:=0;
      Result:=FormatFloat('0.##',Valor1*Valor2);
end;

Function ISinQuote(S:String):String;
var AuxS:string;
    I:Integer;
begin AuxS:='';
      i:=1;
      While (i<=Length(S)) do
      begin //if S[i]=#10 then {No Hace Nada} else
            if S[i]=#39
                 then AuxS:=AuxS+#39+#39
                 else AuxS:=AuxS+S[i];
            Inc(i);
      end;
      Result:=AuxS;
end;


Function IStrDateOK(Fecha:String):Boolean;
var Dt:TDateTime;
begin Result:=False;
      Try Dt:=StrToDate(Fecha);
          Result:=True;
      Except
       On EConvertError do
          Result:=False;
      end;
end;


Procedure IShowQuery(SQL:String; DataBaseName,SessionName:String);
var Q:TQuery;
    Ds:TDataSource;
    DBG:TDBGrid;
    F:TForm;
    M:TMemo;
begin Try
      Q:=GetSQLQuery(SQL,DataBaseName,SessionName,True);
      Except  Application.CreateForm(TForm,F);
              Try
                 M:=Tmemo.Create(F);
                 M.Parent:=F;
                 M.SetBounds(0,0,100,100);
                 M.Align:=alClient; //Top;
                 M.Lines.Text:=SQL;
                 F.ShowModal;
              Finally F.Free;
              end;
              Exit;
      end;
      //if Q=nil then exit;
      Try
        Application.CreateForm(TForm,F);
        Try  Ds:=TDataSource.Create(F);
             Ds.DataSet:=Q;
             DBG:=TDBGrid.Create(F);
             DBG.Parent:=F;
             DBG.SetBounds(0,0,100,100);
             DBg.Align:=alClient;
             M:=Tmemo.Create(F);
             M.Parent:=F;
             M.SetBounds(0,0,100,100);
             M.Align:=alTop;
             M.Lines.Text:=SQL;
             DBG.DataSource:=Ds;
             F.ShowModal;
        Finally F.Free;
        end;
      Finally Q.Free;
      end;
end;


Function ILeft(S:String; Tam:Integer):String;
Var k : Integer;
vacio : string;
begin
vacio := '';
for k := 1 to tam Do vacio := vacio + ' ';
Result:=Copy(Vacio+S,(Length(S)+Length(Vacio))-(Tam-1),Tam);
end;

Function IRigth(S:String; Tam:Integer):String;
Var k : Integer;
vacio : string;
begin
Vacio :='';
for k := 1 to tam Do vacio := vacio + ' ';
Result:=Copy(S+Vacio,1,Tam);
end;


Function ILeftCanvas(S:String; Canvas:TCanvas; Tam:Integer):String;
var   i,Min,N,TxS,Falta:Integer;
      Vacio:String;
begin S:=Copy(S,1,Tam);
      Min:=Canvas.TextWidth(' ');
      N:=(Min*2)*Tam;
      TxS:=Canvas.TextWidth(S);
      Falta:=N-TxS;
      if Falta<0 then Falta:=0;
      Falta:=Round(Falta/Min);
      For i:=1 to Falta do
        Vacio:=Vacio+' ';
      S:=Copy(Vacio,1,Falta)+S;
      ILeftCanvas:=S;
end;

Function ILeftControl(S:String; Control:TWinControl; Tam:Integer):String;
var   Max,i,Min,N,TxS,Falta:Integer;
      Canvas:TCanvas;
      H:THandle;
      SS,Vacio:String;
begin SS:=S;
      Canvas:=TCanvas.Create;
      H:=GetDC(Control.Handle);
      try
      Canvas.Handle:=H;
      if Control is TTReeView then Canvas.Font.Assign(TTreeView(Control).Font);
      Max:=Canvas.TextWidth('M');
      Min:=Canvas.TextWidth(' ');
      N:=Round(Max*Tam);
      While (Canvas.TextWidth(S)>N) and (S<>'') do
      begin S:=Copy(S,2,Length(S)-1);
      end;
      if (S<>SS ) then begin if (Length(S)>4)
                                then S:='...'+Copy(S,4,Length(S))
                                else S:=Copy('########',1,Length(S));
                       end;
      TxS:=Canvas.TextWidth(S);
      Falta:=N-TxS;
      if Falta<0 then Falta:=0;
      Falta:=Round(Falta/Min);
      For i:=1 to Falta do
        Vacio:=Vacio+' ';
      S:=Copy(Vacio,1,Falta)+S;
      ILeftControl:=S;
      Finally ReleaseDC(Control.Handle,H);
              Canvas.Free;
      end;
end;


Function IRigthControl(S:String; Control:TWinControl; Tam:Integer):String;
var   i,Min,Max,N,TxS,Falta:Integer;
      Canvas:TCanvas;
      H:THandle;
      SS,Vacio:String;
begin SS:=S;
      Canvas:=TCanvas.Create;
      H:=GetDC(Control.Handle);
      try
      Canvas.Handle:=H;
      if Control is TTReeView then Canvas.Font.Assign(TTreeView(Control).Font);
      Max:=Canvas.TextWidth('M');
      Min:=Canvas.TextWidth(' ');
      N:=Round(Max*Tam);
      While (Canvas.TextWidth(S)>N) and (S<>'') do
      begin S:=Copy(S,1,Length(S)-1);
      end;
      if (S<>SS ) then begin if (Length(S)>4)
                             then S:=Copy(S,1,Length(S)-4)+'...'
                             else S:=Copy('########',1,Length(S));
                       end;

      TxS:=Canvas.TextWidth(S);
      Falta:=N-TxS;
      if Falta<0 then Falta:=0;
      Falta:=Round(Falta/Min);
      Vacio:='';
      For i:=1 to Falta do
      begin Vacio:=Vacio+' ';
      end;
      S:=S+Copy(Vacio,1,Falta);
      Result:=S;
      Finally ReleaseDC(Control.Handle,H);
              Canvas.Free;
      end;
end;


Function IDia(FechaHoy:TDateTime):Integer;
var Ano,Mes,Dia:Word;
begin DecodeDate(FechaHoy,Ano,Mes,Dia);
      Result:=Dia;
end;

Function IAno(FechaHoy:TDateTime):Integer;
var Ano,Mes,Dia:Word;
begin DecodeDate(FechaHoy,Ano,Mes,Dia);
      Result:=Ano;
end;


Function IDateIniMes(FechaHoy:TDateTime):TDateTime;
var Ano,Mes,Dia:Word;
begin DecodeDate(FechaHoy,Ano,Mes,Dia);
      Result:=EncodeDate(Ano,Mes,1);
end;

Function ISigMes(FechaHoy:TDateTime):TDateTime;
var Ano,Mes,Dia:Word;
begin DecodeDate(FechaHoy,Ano,Mes,Dia);
      Mes:=Mes+1; if Mes>12 then begin Mes:=1; Ano:=Ano+1; end;
      Result:=EncodeDate(Ano,Mes,Dia);
end;


Function IDateFinMes(FechaHoy:TDateTime):TDateTime;
var Ano,Mes,Dia:Word;
begin DecodeDate(FechaHoy,Ano,Mes,Dia);
      Mes:=Mes+1; if Mes>12 then begin Mes:=1; Ano:=Ano+1; end;
      Dia:=1;
      Result:=EncodeDate(Ano,Mes,Dia)-1;
end;




Procedure LVCarga(LV:TListView; Q:TQuery);
var
  I: integer;
  NewColumn: TListColumn;
  ListItem: TListItem;
  ListView: TListView;
  Primera:Boolean;
begin LV.Items.Clear;
      LV.ViewStyle := vsReport;
      if Q=nil then Exit;
      For i:=0 to Q.FieldCount-1 do
      begin if Q.Fields[i].Visible
            then begin NewColumn := LV.Columns.Add;
                       NewColumn.Caption :=Q.Fields[i].DisplayLabel;
                       NewColumn.Width:=Q.Fields[i].DisplayWidth*LV.StringWidth('M');
                 end;
      end;
      While Not Q.EOF do
      begin ListItem := LV.Items.Add;
            Primera:=True;
            For i:=0 to Q.FieldCount-1 do
            begin if Q.Fields[i].Visible
                  then begin if Primera
                             then ListItem.Caption :=Q.Fields[i].AsString
                             else ListItem.SubItems.Add(Q.Fields[i].AsString);
                             Primera:=False;
                       end;

            end;
            Q.Next;
      end;

end;

Function VarRecAsStr(Dato:TVarRec):String;
Const VL:Array[0..1] of String=('False','True');
var S:String;
begin with Dato do
      case Dato.VType of
       vtInteger:begin S:=IntToStr(VInteger);
                       //FieldByName(FKeyFields.Strings[i]).AsInteger:=VInteger;
                 end;
       vtBoolean:begin S:=Vl[Byte(VBoolean)]+#39;
                 end;
       vtChar   :begin S:=VChar;
                 end;
      vtExtended:begin S:=FloatToStr(VExtended^);
                 end;
       vtString :begin S:=VString^;
                 end;
       vtPChar  :begin S:=VPChar;
                 end;
    vtAnsiString:begin S:=string(VAnsiString);
                 end;
       vtObject :;//     Result := Result + VObject.ClassName;
       vtClass  :; //     Result := Result + VClass.ClassName;
      vtCurrency:begin S:=CurrToStr(VCurrency^);
                 end;

      vtVariant:begin S:=string(VVariant^);
                 end;
     end;
     Result:=S;
end;

Procedure LvClear(LV:TListView);
begin LV.Selected:=nil;
      LV.Items.Clear;
      LV.ViewStyle := vsReport;
end;

Function LVSel(LVOrigen:TListView;  Var NodoOrigen:TListItem):Boolean;
var ListItem : TListItem;
begin Result:=False;
      if LVOrigen.Selected=Nil then Exit;
      NodoOrigen :=LVOrigen.Selected;
      Result:=True;
end;




Function LvAddHeader(LV:TListView; Dato:Array of Const; Objeto:TObject):TListItem;
var
  I: integer;
  NewColumn: TListColumn;
  ListItem : TListItem;
  ListView : TListView;
  Primera  : Boolean;
  SDato:String;
begin Result:=nil;
      ListItem:=nil;
      Primera:=True;
      for i:=0 to High(Dato) do
      begin SDato:=VarRecAsStr(Dato[i]);
            if Primera
            then begin ListItem := LV.Items.Add;
                       ListItem.Caption :=SDato;
                       ListItem.Data:=Objeto;
                       if LV.Selected=nil then LV.Selected:=ListItem;
                 end
            else ListItem.SubItems.Add(SDato);
            Primera:=False;
      end;
      Result:=ListItem;
end;

Procedure LvDelNodo(LV:TListView; Nodo:TListItem);
var i:Integer;
    OldNodo:TListItem;
begin OldNodo:=nil;
      For i:=0 to LV.Items.Count-1 do
      begin if (LV.Items.Item[i].Data<>nil) and (LV.Items.Item[i]<>Nodo) and (OldNodo=nil)
              then OldNodo:=LV.Items.Item[i];
      end;
      Nodo.Delete;
      if OldNodo<>nil then LV.Selected:=OldNodo;
end;



Function ITexto(S:String):String;
var p:Integer;
begin P:=Pos(#30,S);
      if P>0
      then Result:=Copy(S,1,P-1)
      else Result:=S;
end;

Function IEntero(R:Extended):String;
begin Result:=FormatFloat('###########0;(###########0)',R);
end;

Function IEnteroSig(R:Extended):String;
begin Result:=FormatFloat('###########0;',R);
end;


Function ISegundos(TInicio,TFin:TDateTime):Integer;
var s:Real;
begin S:=1/(((1/24)/60)/60);
      Result:=Trunc((TFin-TInicio)*S);
end;

Function IMinutos(TInicio,TFin:TDateTime):Integer;
var S:Real;
begin S:=1/(((1/24)/60)/60);
      Result:=Trunc(((TFin-TInicio)*S)/60);
end;


Function IEnteroDinero(R:Extended):String;
begin Result:=FormatFloat('###,###,###,##0;(###,###,###,##0)',R);
end;


Function IValidStrToFloat(Str:String; ErrVal:Extended):Extended;
var E:Extended;
    Err:Integer;
begin Val(Str,E,Err);
      if (Str='') or (Err<>0)
         then Result:=ErrVal
         else Result:=E;
end;



Function IDinero(R:Extended):String;
begin Result:=Lana(R);
end;

Function IDinero00(R:Extended):String;
begin Result:=Lana00(R);
end;


Function IDateToStr(Fecha:TDateTime):String;
begin Result:=FormatDateTime(ToFecha,Fecha);
end;





Function DivNoCero(X,Y:TTipoDinero):TTipoDinero;
begin if Y=0 then Result:=0
             else Result:=X/Y;
end;


Function Lana(R:Extended):String;
begin Lana:=FormatFloat('###,###,###,##0.00#####;(###,###,###,##0.00#####)',R);
end;

Function Lana00(R:Extended):String;
begin Lana00:=FormatFloat('###,###,###,##0.00;(###,###,###,##0.00)',R);
end;


Function Procen(R:Extended):String;
begin Procen:=FormatFloat('##0.00;(##0.00)',R*100)+' %';
end;


Function   Trad(S:String; vgIdioma:Integer):String;
var i:Integer;
    SS:String;

Function SinChar(S:String):String;
begin SinChar:=S;
end;

begin SS:=S;
      S:=Trim(UpperCase(S));
      if vgIdioma=0
      then begin Result:=SS
           end
      else begin For i:=1 to MaxTxMsg do
                      begin if S=UpperCase(TxMsg[i][0])
                            then begin Result:=TxMsg[i][vgIdioma];
                                       Exit;
                                 end;
                      end;
                      Result:='<TR>'+S;
                end;
end;


Function   Traduce(I:Integer; vgIdioma:Integer):String;
begin Result:=TxMsg[i][vgIdioma];
end;


Function TraduceAnoMes(AnoMes:Integer; vgIdioma:Integer):String;
var Mes,Ano:Integer;
begin  Result:=Traduce(kDebe_Seleccionar,vgIdioma);
       if Length(IntToStr(AnoMes))>=6
       then begin Ano:=StrToInt(Copy(IntToStr(AnoMes),1,4));
                  Mes:=StrToInt(Copy(IntToStr(AnoMes),5,2));
                  Result:=kTraduceMeses[Mes,vgIdioma]+', '+IntToStr(Ano);
            end;
end;


Procedure TFastFecha.Refresh;
var Q1:TQuery;
    S:string;
begin Q1:=GetSQLQuery('SELECT * FROM FECHA_EMPRESA WHERE ID_EMPRESA='+IntToStr(FID_Empresa)
                      ,DataBaseName,SessionName,True);
     Try
      FD000    :=0;
      FAYER    :=0;
      FIMAN    :=0;
      FIMAC    :=0;
      FFMAN    :=0;
      FFMAC    :=0;
      if Q1<>nil then
      While Not (Q1.EOF) do
      begin S:=Q1.FieldByName('CVE_DIA_LIQUIDA').AsString;
            if S='D000' then FD000:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='D001' then FD001:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='D002' then FD002:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='AYER' then FAYER:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='IMAN' then FIMAN:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='IMAC' then FIMAC:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='FMAN' then FFMAN:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            if S='FMAC' then FFMAC:=Q1.FieldByName('F_REFERENCIA').AsDateTime;
            Q1.Next;
      end;
     Finally if Q1<>nil then Q1.Free; Q1:=nil;
     end;
end;

Procedure TFastFecha.SetID_Empresa(I:Integer);
begin FID_Empresa:=I;
      Refresh;
end;

Function TFastFecha.TextoMes(F:TDateTime; vgIdioma:Integer):String;
var D,M,A:Word;
begin if F=0
      then Result:='<Error> Fecha Invalida '
      else begin DecodeDate(F,A,M,D);
                 Result:=kTraduceMeses[M,vgIdioma]+', '+IntToStr(A);
           end;
end;


Procedure TFastFecha.SetApli(Apli:TInterApli);
begin FApli:=Apli;
      if Apli<>nil
      then begin DataBaseName:=Apli.DataBaseName;
                 SessionName:=Apli.SessionName;
                 ID_Empresa:=Apli.IdEmpresa;
           end;
end;

Function StrMultiComp(Texto:String; Llaves, Resultados, ResultadoError:String):string;
Type TMulti=Array[0..20] of String;
var i:Integer;
    Lista1,Lista2:TMulti;
    MaxLista1,MaxLista2:Integer;
Procedure LlenaLista(Texto:String; Var Lista:TMulti; Var Total:Integer);
var i:Integer;
    S:string;
begin S:='';
      Total:=-1;
      For i:=1 to Length(Texto) do
      begin if ((Texto[i]=#30) or (I=Length(Texto)))
            then begin if Texto[i]<>#30 then S:=S+Texto[i];
                       Inc(Total);
                       Lista[Total]:=S;
                       S:='';
                 end
            else begin S:=S+Texto[i];
                 end;
      end;
end;

begin LlenaLista(Llaves,Lista1,MaxLista1);
      LlenaLista(Resultados,Lista2,MaxLista2);
      Texto:=UpperCase(Texto);
      Result:=ResultadoError + Texto;
      For i:=0 to MaxLista1 do
      begin if Trim(Lista1[i])=Trim(Texto)
            then begin Result:=Lista2[i];
                 end
      end;
end;

end.
