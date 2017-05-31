// Sistema         : Clase de CR_CFDI_BITACORA
// Fecha de Inicio : 13/11/2013
// Función forma   : Clase de CR_CFDI_BITACORA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Herminio Carreón Flores (DEINTEC)
//                 : Rocío Arriaga Cárdenas
// Comentarios     : Bitácora de sellado CFDI para estados de cuenta de crédito
//                   ICRE e INTERCREDITOS que entró en vigencia enero 2014.
//                   Permite resellado (cancelación/envío SAT) de ambos a través
//                   del paquete CFDI.PKGCAPTACIONCFDI
Unit IntCrCfdBit;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, ImgList, Grids,
IntGenCre, ToolEdit, IntLinkit,
IntCrCredito, IntCrCre, IntParamCre, IntCrAcredit, IntUnNeg, Intempre,
  Gauges;

Type
 TCrCfdBit= class;

  TWCrCfdiBitacora=Class(TForm)
    InterForma1             : TInterForma;
    EdIdCredito: TEdit;
    EdFolioCorte: TEdit;
    LIdCredito: TLabel;
    LF_Corte: TLabel;
    LFolioCorte: TLabel;
    LF_Proceso: TLabel;
    EF_Corte: TEdit;
    IDTPF_Corte: TInterDateTimePicker;
    IDTPF_Proceso: TInterDateTimePicker;
    EF_Proceso: TEdit;
    CDColorPCSError: TColorDialog;
    ImageList: TImageList;
    BBBuscarP: TBitBtn;
    BBCPCError: TBitBtn;
    BBCPSError: TBitBtn;
    ILCredito: TInterLinkit;
    btIdCredito: TBitBtn;
    SPSTP_SELLADO: TStoredProc;
    SPPValidar: TStoredProc;
    GBErrSello: TGroupBox;
    MErrores: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btIdCrCre: TBitBtn;
    ILCCredito: TInterLinkit;
    SGCrCfdiBita: TStringGrid;
    RGSelTodosNinguno: TRadioGroup;
    RGFiltrarSinConTodos: TRadioGroup;
    GBOrdenar: TGroupBox;
    CBOrdenar: TCheckBox;
    BBProcesarS: TBitBtn;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Gauge1: TGauge;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure BBBuscarPClick(Sender: TObject);
    procedure Buscadatos(pOrdenamiento:String);
    procedure SGCrCfdiBitaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGCrCfdiBitaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGCrCfdiBitaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BBProcesarSClick(Sender: TObject);
    procedure SGCrCfdiBitaClick(Sender: TObject);
    procedure BBCPCErrorClick(Sender: TObject);
    procedure BBCPSErrorClick(Sender: TObject);
    procedure RGSelTodosNingunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btIdCreditoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btIdCrCreClick(Sender: TObject);
    procedure ILCreditoCapture(Sender: TObject; var Show: Boolean);
    procedure ILCreditoEjecuta(Sender: TObject);
    procedure ILCCreditoCapture(Sender: TObject; var Show: Boolean);
    procedure ILCCreditoEjecuta(Sender: TObject);

    private{ Private declarations }
       procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
    public { Public declarations }
       Objeto : TCrCfdBit;
       procedure Inicializa;
       procedure ConfGrid( SGrid : TStringGrid );
       procedure BuscaRepetido(pGrid : TStringGrid);
       function  SelectRepetido(pGrid : TStringGrid): String;

end;
 TCrCfdBit= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public { Public declarations }
        ParamCre         : TParamCre;
        CreCredito       : TCrCre;//Lanza exception
        CrCredito        : TCrCredito;
        Acreditado       : TCrAcredit;
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;
        GBErrSello       : TGroupBox;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

const
   CO_COL_CHECK           = 0;
   CO_COL_IDCREDITO       = CO_COL_CHECK           +1;
   CO_COL_F_CORTE         = CO_COL_IDCREDITO       +1;
   CO_COL_FOLIO_CORTE     = CO_COL_F_CORTE         +1;
   CO_COL_F_PROCESO       = CO_COL_FOLIO_CORTE     +1;
   CO_COL_tx_err_credito  = CO_COL_F_PROCESO       +1;
   CO_COL_tx_err_comproban= CO_COL_tx_err_credito  +1;
   CO_COL_tx_err_concepto = CO_COL_tx_err_comproban+1;
   CO_COL_tx_err_receptor = CO_COL_tx_err_concepto +1;
   CO_COL_tx_err_traslado = CO_COL_tx_err_receptor +1;
   CO_COL_tx_err_emisor   = CO_COL_tx_err_traslado +1;
   //09Ene2013 HCF Borrar CO_COL_tx_err_retencion= CO_COL_tx_err_emisor   +1;
   //09Ene2013 HCF CO_COL_tx_err_sellado  = CO_COL_tx_err_retencion+1;
   CO_COL_tx_err_sellado  = CO_COL_tx_err_emisor+1;
   CO_COL_tx_err_validacio= CO_COL_tx_err_sellado  +1;
   CO_COL_tx_obj_generador= CO_COL_tx_err_validacio+1;
   CO_COL_Color           = CO_COL_tx_obj_generador+1;

   CO_CHECKED   = 'V';
   CO_UNCHECKED = '';
   CO_NOTCHECK  = '-';
   CO_ASC       = '[^]';
   CO_DESC      = '[v]';

var
   vgOrderBy,
   vgAscDesc,
   vgAscDesc0   :String;
   vgColorCErr  :TColor;
   vgColorSErr  :TColor;
   vgRowCount   :Integer;
   vgStrL         : TStringList;//01Nov2013 HCF
   vgStrG         : TStringGrid;//01Nov2013 HCF

implementation

{$R *.DFM}


constructor TCrCfdBit.Create( AOwner : TComponent );
begin Inherited;

   CrCredito              := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;
   CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
   //Lanza exception
   CreCredito             := TCrCre.Create(Self);
   CreCredito.MasterSource:=Self;
   CreCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
   //
   Empresa       := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

end;

Destructor TCrCfdBit.Destroy;
begin
   //Delphi Help TObject.Free
   //Unlike Destroy, Free is successful even if the object is nil,
   //so if the object was never initialized, Free won’t result in an error.
   if CrCredito <> nil then
      CrCredito.Free;
   if CreCredito <> nil then
      CreCredito.Free;

   inherited;
end;

function TCrCfdBit.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCfdiBitacora;
begin
   W:=TWCrCfdiBitacora.Create(Self);
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

Function TCrCfdBit.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCfBi.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrCfdBit.Reporte:Boolean;
begin //Execute_Reporte();
end;

//31Oct2013 HCF Procedimiento para ordenar el stringGrid.
//31Oct2013 HCF Para avisar al operador que seleccionó creditos_fechaCorte repetidos
//31Oct2013 HCF En esta version se presupone que el operador seleccionó solo una fecha de corte
procedure TWCrCfdiBitacora.BuscaRepetido(pGrid : TStringGrid);
var i,j  : Integer;
    temp : TStringList;
begin
   //31Oct2013 HCF Para este caso la columna que nos interesa es la primera
   //31Oct2013 HCF porque en la primera columna está id_credito
   try
      Temp:= TStringList.Create;
      //{04Nov2013 HCF Para que se vea que esta procesando
      ProgressBar1.min:=0;
      ProgressBar1.max:=pGrid.RowCount;
      ProgressBar1.BringToFront;
      ProgressBar1.max:=(pGrid.RowCount-2)*(pGrid.RowCount-1);
      if ProgressBar1.max > 5 then
         ProgressBar1.Step:=ProgressBar1.max div 5 ;
      {else }
         ProgressBar1.Step:=2;

      Gauge1.MinValue:=0;
      Gauge1.MaxValue:=pGrid.RowCount;
      Gauge1.BringToFront;
      Gauge1.MaxValue:=(pGrid.RowCount-2)*(pGrid.RowCount-1);
      Gauge1.Progress:=2;

      //ProgressBar1.Align:= alBottom;//16Ene2014 HCF Reacomodando y redimensionando la barra de progreso
      ProgressBar1.Top    := GBErrSello.Top;//16Ene2014 HCF Reacomodando la barra de progreso
      ProgressBar1.Left   := GBErrSello.left;//16Ene2014 HCF Reacomodando la barra de progreso
      ProgressBar1.Width  :=GBErrSello.Width;//16Ene2014 HCF Reacomodando la barra de progreso
      ProgressBar1.Height :=25;//16Ene2014 HCF edimensionando la barra de progreso
      ProgressBar1.Visible:=true;

      Gauge1.Top    := ProgressBar1.Top+20{ProgressBar1.Height};//16Ene2014 HCF Reacomodando la barra de progreso
      Gauge1.Left   := GBErrSello.left;//16Ene2014 HCF Reacomodando la barra de progreso
      Gauge1.Width  :=GBErrSello.Width;//16Ene2014 HCF Reacomodando la barra de progreso
      Gauge1.Height :=25;//16Ene2014 HCF edimensionando la barra de progreso
      Gauge1.Visible:=true;
      //}
      with pGrid do
         for i := 1 to RowCount - 2 do
            for j:= i+1 to rowcount-1 do
            begin
               ProgressBar1.StepIt;//04Nov2013 HCF Para que se vea que esta procesando
               Gauge1.AddProgress(2);//04Nov2013 HCF Para que se vea que esta procesando
               Application.ProcessMessages();//04Nov2013 HCF Para que se vea que esta procesando
               if Cells[CO_COL_CHECK,i]= CO_CHECKED
               then if AnsiCompareText(Cells[CO_COL_IDCREDITO,i]+Cells[CO_COL_F_CORTE,i], Cells[CO_COL_IDCREDITO,j]+Cells[CO_COL_F_CORTE,j]) < 0
               then
                  begin
                     temp.assign(rows[j]);
                     rows[j].assign(rows[i]);
                     rows[i].assign(temp);
                  end
            end;
   finally
      temp.free;
   end;
end;

//31Oct2013 HCF Funcion que regresa el primer id_credito repetido.
//31Oct2013 HCF Si no hay repetidos, regresa null
//31Oct2013 HCF El stringGrid, ya debe estar ordenado
function    TWCrCfdiBitacora.SelectRepetido(pGrid : TStringGrid): String;
var vlIdCredito,
    vlFCorte,
    vlIdCreditoL,
    vlFCorteL,
    vlChecadoL,
    vlIdCreditoRepetido:String;
    vlI,
    vlNewRow,
    vlCantRepetidos:Integer;
begin
   //31Oct2013 HCF Se crea un stringGrid de trabajo para no alterar la pantalla al operador.
   vgStrG:= TStringGrid.Create(self);
   vgStrL:= TStringList.Create;//01Nov2013 HCF
   vlNewRow:=0;
   //31Oct2013 HCF Se copian al stringGrid de trabajo los renglones checados.
   for vlI := pGrid.FixedRows to vgRowCount do
      if pGrid.Cells[CO_COL_CHECK,vlI]= CO_CHECKED then
      begin
         vlNewRow:=vlNewRow+1;
         vgStrG.Rows[vlNewRow].Assign(pGrid.Rows[vlI]);
         vgStrL.Assign(pGrid.Rows[vlI]);//01Nov2013 HCF
      end;
      vgStrG.RowCount:=vlNewRow;
   //31Oct2013 HCF Se ordena el stringGrid de trabajo para determinar si seleccionó repetidos.
   BuscaRepetido(vgStrG);
   //31Oct2013 HCF Variables para determinar repetidos.
   vlIdCredito    :='';
   vlFCorte       :='';
   //31Oct2013 HCF Se Variable para decidir si hay repetidos.
    vlIdCreditoRepetido:='';
   try
      with vgStrG do
         for vlI := FixedRows to RowCount+1 do
         begin
            vlIdCreditoL:=Cells[CO_COL_IDCREDITO,vlI];
            vlFCorteL:=Cells[CO_COL_F_CORTE,vlI];
            vlChecadoL:=Cells[CO_COL_CHECK,vlI];
            //31Oct2013 HCF Al encontrar el primer repetido se deja de buscar.
            if vlCantrepetidos=0 then
               if Cells[CO_COL_CHECK,vlI]= CO_CHECKED then //31Oct2013 HCF Compara solo checados (se supone que aqui están solo los checados)
                  if AnsiCompareText(Cells[CO_COL_IDCREDITO,vlI]+Cells[CO_COL_F_CORTE,vlI], vlIdCredito+vlFCorte) = 0 then
                  begin
                     vlCantrepetidos:=vlCantrepetidos+1;//31Oct2013 HCF Encontro repetido.
                     vlIdCreditoRepetido:='Repetido:'+Cells[CO_COL_IDCREDITO,vlI]+' - '+Cells[CO_COL_F_CORTE,vlI];
                  end
                  else
                  begin//31Oct2013 HCF No es repetido se actualizan las variables de comparación
                     vlIdCredito:=Cells[CO_COL_IDCREDITO,vlI];
                     vlFCorte   :=Cells[CO_COL_F_CORTE,vlI];
                  end;
         end;
   finally
      SelectRepetido:= vlIdCreditoRepetido;//31Oct2013 HCF Se regresa la variable para decidir si hay repetidos
      freeandnil(vgStrG);
   end;
end;
(***********************************************FORMA CR_CFDI_BITACORA********************)
(*                                                                              *)
(*  FORMA DE CR_CFDI_BITACORA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CFDI_BITACORA********************)

procedure TWCrCfdiBitacora.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCfdiBitacora.BBBuscarPClick(Sender: TObject);
var vlOrdenamiento:String;
begin
if Objeto.ValidaAccesoEsp('TCRCFDBIT_INBUSQ',True,True) then // JFOF SEGURIDAD DE BOTONES
   begin
     ClearGrid(SGCrCfdiBita,0);
     ConfGrid(SGCrCfdiBita);

     //Realiza la consulta
     if CBOrdenar.Checked
     then vlOrdenamiento:=vgOrderBy+vgAscDesc
     else vlOrdenamiento:=' ';
     Buscadatos(vlOrdenamiento);
     RGSelTodosNinguno.ItemIndex:=1;
     //cambia de ascendente a descencdengte o viceversa
     if vgAscDesc = 'asc  ' then
        vgAscDesc := 'desc ' {Ordenar descendente}
     else
        vgAscDesc := 'asc  ';{Ordenar ascendente}
   end;
end;

procedure TWCrCfdiBitacora.ConfGrid(SGrid: TStringGrid);

begin
   With SGrid Do
   Begin
       ColCount := 15;
       RowHeights[0] := DefaultRowHeight;
       RowCount := 1;
{01}   ColWidths[CO_COL_CHECK]           := 40;
{02}   ColWidths[CO_COL_IDCREDITO]       := 60;
{03}   ColWidths[CO_COL_F_CORTE]         := 70;
{04}   ColWidths[CO_COL_FOLIO_CORTE]     := 50;
{05}   ColWidths[CO_COL_F_PROCESO]       := 80;
{06}   ColWidths[CO_COL_tx_err_credito]  := 70;
{07}   ColWidths[CO_COL_tx_err_comproban]:= 70;
{08}   ColWidths[CO_COL_tx_err_concepto] := 70;
{09}   ColWidths[CO_COL_tx_err_receptor] := 70;
{10}   ColWidths[CO_COL_tx_err_traslado] := 70;
{11}   ColWidths[CO_COL_tx_err_emisor]   := 70;
{12}   //09Ene2013 HCF ColWidths[CO_COL_tx_err_retencion]:= 70;
{13}   ColWidths[CO_COL_tx_err_sellado]  := 100;
{14}   ColWidths[CO_COL_tx_err_validacio]:= 90;
{15}   ColWidths[CO_COL_tx_obj_generador]:= 130;
{16}   ColWidths[CO_COL_Color]           := 40;
       //
       vgAscDesc0:='';
       if CBOrdenar.Checked then
           if vgAscDesc = 'asc  '
           then vgAscDesc0:=CO_ASC
           else vgAscDesc0:=CO_DESC;

       cells[CO_COL_CHECK,0]           := ' ';
       if pos('id_credito',vgOrderBy)>0
       then cells[CO_COL_IDCREDITO,0]       := 'Crédito '+vgAscDesc0
       else cells[CO_COL_IDCREDITO,0]       := 'Crédito ';

       if pos('f_corte',vgOrderBy)>0
       then cells[CO_COL_F_CORTE,0]       := 'Corte '+vgAscDesc0
       else cells[CO_COL_F_CORTE,0]       := 'Corte ';

       if pos('folio_corte',vgOrderBy)>0
       then cells[CO_COL_FOLIO_CORTE,0]     := 'Corte '+vgAscDesc0
       else cells[CO_COL_FOLIO_CORTE,0]     := 'Corte ';

       if pos('f_proceso',vgOrderBy)>0
       then cells[CO_COL_F_PROCESO,0]       := 'Proceso '+vgAscDesc0
       else cells[CO_COL_F_PROCESO,0]       := 'Proceso ';

       cells[CO_COL_tx_err_credito,0]  := 'Cr_Credito';
       cells[CO_COL_tx_err_comproban,0]:= 'Cr_Comprobante';
       cells[CO_COL_tx_err_concepto,0] := 'Cr_Concepto';
       cells[CO_COL_tx_err_receptor,0] := 'Cr_Receptor';
       cells[CO_COL_tx_err_traslado,0] := 'Cr_Traslado';
       cells[CO_COL_tx_err_emisor,0]   := 'Cr_Emisor';
       //09Ene2013 HCF cells[CO_COL_tx_err_retencion,0]:= 'Cr_Retencion';
       cells[CO_COL_tx_err_sellado,0]  := 'Sellado';
       cells[CO_COL_tx_err_validacio,0]:= 'BD validadión';
       cells[CO_COL_tx_obj_generador,0]:= 'Obj Generador ';
       cells[CO_COL_Color,0]           := 'CSErr';
   End;

end;

procedure TWCrCfdiBitacora.Buscadatos(pOrdenamiento:String);

var vlQry, vlQryTmp            : TQuery;
    vlSQLCad,
    //09Ene2013 HCF vlTx_err_retencion,
    vlConSinTodos    : String;
    vlFnCargaMonitor : TStoredProc;
    vlNReng          : Integer;

begin
//copia de una clase de Aaron.
   try
      //Para filtrar con error, sin error, todos
      vlConSinTodos := ' (Tx_Err_Credito   = ''0'' and '+
                         'Tx_Err_Comproban = ''0'' and '+
                         'Tx_err_concepto  = ''0'' and '+
                         'Tx_Err_Receptor  = ''0'' and '+
                         'Tx_Err_Traslado  = ''0'' and '+
                         'Tx_Err_Emisor    = ''0'' and '+
                         'instr(nvl(Tx_Err_Sellado,'' ''), ''OK'') <> 0 and '+
                         'Tx_Err_Validacio is null)';
      //Inicialmente no está checado
      if RGFiltrarSinConTodos.ItemIndex=-1 then
         RGFiltrarSinConTodos.ItemIndex:=1;

      case RGFiltrarSinConTodos.ItemIndex of
         0: vlConSinTodos := 'and '    +vlConSinTodos;{'Sin error'}
         1: vlConSinTodos := 'and not '+vlConSinTodos;{'Con error'}
         else
         vlConSinTodos := ' '; {'todos'}
      end;

      vlSQLCad:= 'select id_credito,'+
                        'f_corte,'+
                        'folio_corte,'+
                        'f_proceso,'+
                        'Tx_Err_Credito  ,'+//23Oct2013 HCF
                        'Tx_Err_Comproban,'+//23Oct2013 HCF
                        'Tx_err_concepto ,'+//23Oct2013 HCF
                        'Tx_Err_Receptor ,'+//23Oct2013 HCF
                        'Tx_Err_Traslado ,'+//23Oct2013 HCF
                        'Tx_Err_Emisor   ,'+//23Oct2013 HCF
       {//23Oct2013 HCF Porque inicialmente se grababa el codigo de error. Ahora se graba la descripcion del error
                        'PKGCR_SELLADO_FEICRE.err_unchain(Tx_Err_Credito)   Tx_Err_Credito  ,'+//22Oct2013 HCF PKG por PKGCR
                        'PKGCR_SELLADO_FEICRE.err_unchain(Tx_Err_Comproban) Tx_Err_Comproban,'+//22Oct2013 HCF PKG por PKGCR
                        'PKGCR_SELLADO_FEICRE.err_unchain(Tx_err_concepto)  Tx_err_concepto ,'+//22Oct2013 HCF PKG por PKGCR
                        'PKGCR_SELLADO_FEICRE.err_unchain(Tx_Err_Receptor)  Tx_Err_Receptor ,'+//22Oct2013 HCF PKG por PKGCR
                        'PKGCR_SELLADO_FEICRE.err_unchain(Tx_Err_Traslado)  Tx_Err_Traslado ,'+//22Oct2013 HCF PKG por PKGCR
                        'PKGCR_SELLADO_FEICRE.err_unchain(Tx_Err_Emisor)    Tx_Err_Emisor   ,'+//22Oct2013 HCF PKG por PKGCR
       }
                        //09Ene2013 HCF 'PKG_SELLADO_FEICRE.err_unchain(Tx_Err_Retencion) Tx_Err_Retencion,'+
                        'Tx_Err_Sellado,'+
                        'Tx_Err_Validacio, '+
                        'tx_obj_generador, '+
                        'decode(ccb.Tx_Err_Credito      ,''0'',0,1)             +'+
                        'decode(ccb.tx_err_comproban    ,''0'',0,1)             +'+
                        'decode(ccb.tx_err_concepto     ,''0'',0,1)             +'+
                        'decode(ccb.tx_err_receptor     ,''0'',0,1)             +'+
                        'decode(ccb.tx_err_traslado     ,''0'',0,1)             +'+
                        'decode(ccb.tx_err_emisor       ,''0'',0,1)             +'+
                        'decode(nvl(Tx_Err_Validacio    ,''0''),''0'',0,1)      +'+
                        'decode(instr(nvl(Tx_Err_Sellado,'' ''), ''OK''),0,1,0) +'+
                        'decode(nvl(Tx_Err_Validacio,0),''0'',0,1) hayError          '+
                  'from cr_cfdi_bitacora ccb '+
                  'where ccb.id_credito      = decode('+QuotedStr(EdIdCredito.text) +',null,ccb.id_credito, '                   +QuotedStr(EdIdCredito.text)                 +')  '+
                    'and ccb.f_corte         = decode('+QuotedStr(EF_Corte.text)    +',null,ccb.f_corte,to_date('               +QuotedStr(EF_Corte.text)    +',''dd/mm/yyyy''))  '+
                    'and ccb.folio_corte     = decode('+QuotedStr(EdFolioCorte.text)+',null,ccb.folio_corte,'                   +QuotedStr(EdFolioCorte.text)                +')  '+
                    'and trunc(ccb.f_proceso)= decode('+QuotedStr(EF_Proceso.text)  +',null,trunc(ccb.f_proceso),trunc(to_date('+QuotedStr(EF_Proceso.text)  +',''dd/mm/yyyy''))) '+
                    vlConSinTodos+
                    pOrdenamiento;
      vlQryTmp:=TQuery.Create(self);
      vlQryTmp.SQL.Add(vlSQLCad);
      freeAndNil(vlQryTmp);
      vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      //First;
      vlNReng:=0;

      if vlQry <> nil then

      begin
         SGCrCfdiBita.ShowHint:=True;
         with vlQry do
            while not Eof do
            begin
               //Llena grid
               //09Ene2013 HCF vlTx_err_retencion:=' ';
               //09Ene2013 HCF if not (fieldByName('tx_err_retencion').value =  Null) then
               //09Ene2013 HCF    vlTx_err_retencion:=fieldByName('tx_err_retencion').value;

               vlNReng:=vlNReng+1;

               SGCrCfdiBita.Cells[CO_COL_CHECK,vlNReng]           :='';
               SGCrCfdiBita.Cells[CO_COL_IDCREDITO,vlNReng]       :=fieldByName('ID_CREDITO').asString;
               SGCrCfdiBita.Cells[CO_COL_F_CORTE,vlNReng]         :=fieldByName('F_CORTE').asString;
               SGCrCfdiBita.Cells[CO_COL_FOLIO_CORTE,vlNReng]     :=fieldByName('FOLIO_CORTE').asString;
               SGCrCfdiBita.Cells[CO_COL_F_PROCESO,vlNReng]       :=fieldByName('F_PROCESO').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_credito,vlNReng]  :=fieldByName('tx_err_credito').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_comproban,vlNReng]:=fieldByName('tx_err_comproban').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_concepto,vlNReng] :=fieldByName('tx_err_concepto').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_receptor,vlNReng] :=fieldByName('tx_err_receptor').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_traslado,vlNReng] :=fieldByName('tx_err_traslado').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_emisor,vlNReng]   :=fieldByName('tx_err_emisor').asString;
               //09Ene2013 HCF SGCrCfdiBita.Cells[CO_COL_tx_err_retencion,vlNReng]:=vlTx_err_retencion;
               SGCrCfdiBita.Cells[CO_COL_tx_err_sellado,vlNReng]  :=fieldByName('tx_err_sellado').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_err_validacio,vlNReng]:=fieldByName('tx_err_validacio').asString;
               SGCrCfdiBita.Cells[CO_COL_tx_obj_generador,vlNReng]:=fieldByName('tx_obj_generador').asString;
               SGCrCfdiBita.Cells[CO_COL_Color,vlNReng]           :=fieldByName('hayError').asString;

               Next;
            end;
      end
      else
         SGCrCfdiBita.ShowHint:=False;
      SGCrCfdiBita.visible:=True;
      SGCrCfdiBita.ScrollBars:=ssBoth;
      Label1.Caption:=' Resultado de los procesos de sellado '+IntToStr(vlNReng);
   finally
      if vlQry <> nil then
         vlQry.Free;
   end;
   vgRowCount:=vlNReng;
   SGCrCfdiBita.RowCount:=vlNReng+1;
   //Aqui fijar la columna de encabezados.
   if SGCrCfdiBita.RowCount>1 then
      SGCrCfdiBita.FixedRows:=1;
   SGCrCfdiBita.Fixedcols:=1;

end;

procedure TWCrCfdiBitacora.SGCrCfdiBitaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   SGCrCfdiBita.MouseToCell(X, Y, nCol, nRow);

   if (nRow>0) and (nCol=0) then
      //09Ene2013 HCF if strToInt(SGCrCfdiBita.cells[15,nRow])=0 then
//      if strToInt(SGCrCfdiBita.cells[14,nRow])=0 then
//         showMessage('No puede seleccionar un crédito procesado sin errores')
//      else
         if (nCol = CO_COL_CHECK) and (nRow>0) then
            InvertCheck(SGCrCfdiBita, nCol, nRow);
end;

procedure TWCrCfdiBitacora.InvertCheck(StrinGrid: TStringGrid; nCol,
  nRow: Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow] = CO_CHECKED) Then
        Cells[nCol, nRow] := CO_UNCHECKED
     Else
        Cells[nCol, nRow] := CO_CHECKED;
   End;
end;

procedure TWCrCfdiBitacora.SGCrCfdiBitaDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp         : TBitmap;
    sTexto,                   // Texto que va a imprimir en la celda actual
    sColor: String;           // Color de renglon
    Alineacion  : TAlignment; // Alineación que le vamos a dar al texto
    iAnchoTexto : Integer;    // Ancho del texto a imprimir en pixels
begin
   If (Sender Is TStringGrid) Then
   With (Sender As TStringGrid) Do
   Begin
      //Color al renglón fijo
      if (gdFixed in State) then
         Brush.Color := clNavy;

      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      //Color al renglón dependiendo de si hay error
      sColor:=Cells[14,ARow];
      if (length(sColor)>0) and (sColor<>'CSErr') then
         if StrToInt(sColor)=0 then
            Canvas.font.Color:=vgColorSErr
         else
            Canvas.font.Color:=vgColorCErr;//

      //Color al primer renglón
      if (ARow=0) then
      begin
         Canvas.Brush.Color := $00BBFFFF;
         Canvas.FillRect(Rect);
      end;

      //Color a la primera columna
      if (ARow>0) and (ACol=0) then
      begin
         Canvas.Brush.Color := clWhite;
         Canvas.FillRect(Rect);
      end;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;

      If (ARow>0) and (ACol = CO_COL_CHECK) Then
      Begin
         Bmp := TBitmap.Create;
         If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;

   End;

end;

procedure TWCrCfdiBitacora.SGCrCfdiBitaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   SGCrCfdiBita.MouseToCell(X, Y, nCol, nRow);
   if (nCol > CO_COL_CHECK) and (nRow>0) then
   begin
      SGCrCfdiBita.Hint:=SGCrCfdiBita.Cells[nCol, nRow];
   end;

end;

procedure TWCrCfdiBitacora.BBProcesarSClick(Sender: TObject);
var vlNRow,
    vlNChecados,
    vlNProcesados,
    buttonSelected:Integer;
    //vlIcreInter   :String;//30Oct2013 HCF La bitacora sabe si es credito icre o inter.
    vlProcesaSiNo,
    vlMsgRepetidos :String;

begin
if Objeto.ValidaAccesoEsp('TCRCFDBIT_RESELL',True,True) then // JFOF SEGURIDAD DE BOTONES
   begin
    vlNChecados:=0;
    vlMsgRepetidos:=' ';//31Oct2013 HCF
   for vlNRow := 1 to vgRowCount do
       if SGCrCfdiBita.Cells[CO_COL_CHECK, vlNRow] = CO_CHECKED then
          vlNChecados:=vlNChecados+1;//Cuenta cuantos están seleccionados.
   if not (vlNChecados>0) then//No hay seleccionados.
      //Informa que para reprocesar, debe seleccionar renglones (créditos).
      begin
         ShowMessage('Seleccione el/los crédito/s que desea reprocesar');
         exit;
      end;
   if vlNChecados>0 then//Si hay checados (seleccionados).
      //Informa cuantos estan checados y da la opcion de procesar/no procesar.
      vlMsgRepetidos:=SelectRepetido(SGCrCfdiBita);//31Oct2013 HCF
      if vlMsgRepetidos<>'' then//01Oct2013 HCF
        if MessageDlg('Se cancela el proceso porque hay repetidos:'+vlMsgRepetidos,
                      mtInformation, [mbOK], 0) = mrOk then
        begin
           ProgressBar1.Visible:=False;
           Gauge1.Visible:=False;
           exit;
        end;
     ProgressBar1.Visible:=False;
      Gauge1.Visible:=False;
      if MessageDlg('Creditos seleccionados: '+IntToStr(vlNChecados)+vlMsgRepetidos+'.  Confirma Reprocesar?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         //Recorre todas las columnas del stringGrid.
         {//30Oct2013 HCF No usar la función que determina si el crédito es icre o inter
         SpPValidar.DatabaseName:= objeto.DataBaseName;//Asigna base de datos.
         SpPValidar.SessionName:= objeto.SessionName;  //Asigna base de datos.

         SpPValidar.Params.Clear ;
         SpPValidar.StoredProcName:='PKGCR_SELLADO_FEICRE.STP_ES_ICRE_INTER';
         SpPValidar.Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
         SpPValidar.Params.CreateParam(ftString,'PEICREINTER',ptOutput);
         }
         SPSTP_SELLADO.Close;
         SPSTP_SELLADO.DatabaseName:= objeto.DataBaseName;//Asigna base de datos.
         SPSTP_SELLADO.SessionName := objeto.SessionName; //Asigna base de datos.
         {
          20Nov2013  JHerminioM CarreónF  Se califican todos los objetos de la facturación electrónica (CFDI) que están en ambos esquemas (ADMIPROD) (CFDI)
                                          se califican con el prefijo del esquema CFDI
         }
         SPSTP_SELLADO.StoredProcName:='CFDI.PKGCAPTACIONCFDI.STPREGENERACFDI';
         SPSTP_SELLADO.Params.Clear ;
         SPSTP_SELLADO.Params.CreateParam(ftString,'peSERIE_RECIBO',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftInteger,'peID_EMPRESA',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftInteger,'peID_CESION',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftString,'peID_DOCUMENTO',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftInteger,'peID_CONTRATO',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftString,'peCVE_USUARIO',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftString,'peCVE_CREDITO',ptInput);
         SPSTP_SELLADO.Params.CreateParam(ftString,'psSTR_RESP',ptOutput);
         SPSTP_SELLADO.Params.CreateParam(ftInteger,'psCOD_RESP',ptOutput);

         SPSTP_SELLADO.ParamByName('peSERIE_RECIBO').Value := 'ECOL';
         SPSTP_SELLADO.ParamByName('peID_EMPRESA').Value := 2;
         SPSTP_SELLADO.ParamByName('peID_DOCUMENTO').Value := '0';
         SPSTP_SELLADO.ParamByName('peCVE_USUARIO').Value := Objeto.DameUsuario;

         vlNProcesados:=0;//Cuenta cuantos se van a reprocesar.
         MErrores.Lines.Clear;
         GBErrSello.Visible:=False;
         buttonSelected:=-1;//30Oct2013 HCF Para manejar YesToAll
         //for vlNRow := 1 to vgRowCount do//23Oct2013 HCF Se reemplaza por while. Para confirmar en cada renglon
         //23Oct2013 HCF Para reemplazar el for. Para confirmar en cada renglon
         vlNRow := 1; //23Oct2013 HCF Para confirmar en cada renglon
         while vlNRow <= vgRowCount do //23Oct2013 HCF Para confirmar en cada renglon
         begin
            if SGCrCfdiBita.Cells[CO_COL_CHECK, vlNRow] = CO_CHECKED then
            begin
               if buttonSelected<>10
               then
               buttonSelected:=messagedlg('Confirme resellar el crédito('+intToStr(vlNProcesados+1)+' de '+intToStr(vlNChecados)+'): '+
                                           SGCrCfdiBita.Cells[CO_COL_IDCREDITO, vlNRow],
                                           mtconfirmation,
                                           [mbNo, mbNoToAll, mbYes, mbYesToAll], 0);//23Oct2013 HCF Para confirmar resellar

               case buttonSelected of
                  6,10: begin//El renglón vlNRow está seleccionado.  //23Oct2013 HCF Para confirmar resello (si resellar)
                        //Identifica si es crédito o intercrédito y si es resellable (situacion 'AC')
                        {//30Oct2013 HCF Posiblemente quitar del paquete
                        SpPValidar.ParamByName('peId_credito').value:=strToInt(SGCrCfdiBita.Cells[1, vlNRow]);
                        SpPValidar.ExecProc;
                        }
                        {//30Oct2013 HCF La bitacora sabe si es credito icre o inter.
                        vlIcreInter:=SpPValidar.Parambyname('PEICREINTER').value;
                        vlProcesaSiNo:='S';
                       if ((vlIcreInter = 'ICRE') or
                           (vlIcreInter = 'INTER')) then
                       begin
                       }
                         vlNProcesados:=vlNProcesados+1;//Cuenta cuantos se van a reprocesar.
                         SPSTP_SELLADO.ParamByName('peID_CESION').Value := FormatDateTime('YYYYMM', strTodate(SGCrCfdiBita.Cells[CO_COL_F_CORTE, vlNRow]));
                         SPSTP_SELLADO.ParamByName('peID_CONTRATO').Value := strToInt(SGCrCfdiBita.Cells[CO_COL_IDCREDITO, vlNRow]);
                         //SPSTP_SELLADO.ParamByName('peCVE_CREDITO').Value := vlIcreInter; //30Oct2013 HCF La bitacora sabe si es credito icre o inter.
                         SPSTP_SELLADO.ParamByName('peCVE_CREDITO').Value := SGCrCfdiBita.Cells[CO_COL_tx_obj_generador, vlNRow];//30Oct2013 HCF La bitacora sabe si es credito icre o inter.
                         SPSTP_SELLADO.ExecProc;
                       {//30Oct2013 HCF La bitacora sabe si es credito icre o inter.
                       end
                       else
                       begin
                         MErrores.Lines.Add('Crédito: '+SGCrCfdiBita.Cells[1, vlNRow]+' no procesado, Razón: '+vlIcreInter);
                         GBErrSello.Visible:=True;
                       end;
                       }
                     end;
                  9: vlNRow:=vgRowCount;//23Oct2013 HCF Para confirmar resello (No a todo)
               else//23Oct2013 HCF Para confirmar resello
               end;//23Oct2013 HCF Para confirmar resello
            end;
            vlNRow:=vlNRow+1;
         end;

         if MessageDlg('Creditos procesados: '+IntToStr(vlNProcesados)+'.  Actualizar la bitacora?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            BBBuscarPClick(self);
      end;
   end;
end;

procedure TWCrCfdiBitacora.SGCrCfdiBitaClick(Sender: TObject);
begin
   if SGCrCfdiBita.RowCount>1 then
       if CBOrdenar.Checked then
       begin
           vgOrderBy:=' order  by ccb.f_corte ';
           case SGCrCfdiBita.col of
              1: begin vgOrderBy:=' order  by ccb.id_credito ';
                    BBBuscarPClick(self); end;
              2: begin vgOrderBy:=' order  by ccb.f_corte ';
                    BBBuscarPClick(self); end;
              3: begin vgOrderBy:=' order  by ccb.folio_corte ';
                    BBBuscarPClick(self); end;
              4: begin vgOrderBy:=' order  by ccb.f_proceso ';
                    BBBuscarPClick(self); end;
           end;
       end;
end;

procedure TWCrCfdiBitacora.BBCPCErrorClick(Sender: TObject);
begin
   if CDColorPCSError.Execute then
   begin
      vgColorCErr:=CDColorPCSError.Color;
      BBCPCError.Font.Color:=vgColorCErr;
      BBBuscarPClick(BBCPCError);
   end;
end;

procedure TWCrCfdiBitacora.BBCPSErrorClick(Sender: TObject);
begin
   if CDColorPCSError.Execute then
   begin
      vgColorSErr:=CDColorPCSError.Color;
      BBCPSError.Font.Color:=vgColorSErr;
      self.BBBuscarPClick(BBCPCError);
   end;

end;

procedure TWCrCfdiBitacora.Inicializa;
begin
   CBOrdenar.Checked;
   //vgOrderBy:=' order  by ccb.f_corte ';   //29Oct2013 HCF
   vgOrderBy:=' order  by ccb.folio_corte '; //29Oct2013 HCF
   //vgAscDesc  :='desc  '; //29Oct2013 HCF
   vgAscDesc  :='asc  ';    //29Oct2013 HCF
   vgColorCErr:=clRed;
   vgColorSErr:=clGreen;
   BBCPCError.Font.Color:=vgColorCErr;
   BBCPSError.Font.Color:=vgColorSErr;

end;

procedure TWCrCfdiBitacora.RGSelTodosNingunoClick(Sender: TObject);
var vlNRow  ,
    vlNCheck,
    vlNConError :Integer;
begin
   //Checar / desChecar todo
   vlNCheck   :=0;//Para saber si todos estaban checados o ninguno estaba checado.
   vlNConError:=0;//Para saber cuantos tienen error (los que se pueden reprocesar).
   case RGSelTodosNinguno.ItemIndex of
       0: for vlNRow := 1 to SGCrCfdiBita.RowCount do
              //09Ene2013 HCF if (SGCrCfdiBita.Cells[15, vlNRow]<>'0') then
              //23Oct2013 HCF if (SGCrCfdiBita.Cells[14, vlNRow]<>'0') then
                 SGCrCfdiBita.Cells[CO_COL_CHECK, vlNRow] := CO_CHECKED;{Checar todos}
       1: for vlNRow := 1 to SGCrCfdiBita.RowCount do
              //09Ene2013 HCF if (SGCrCfdiBita.Cells[15, vlNRow]<>'0') then
              //23Oct2013 HCF if (SGCrCfdiBita.Cells[14, vlNRow]<>'0') then
                  SGCrCfdiBita.Cells[CO_COL_CHECK, vlNRow] := CO_UNCHECKED;{Checar ninguno}
       2: begin
             for vlNRow := 1 to SGCrCfdiBita.RowCount do
                 //09Ene2013 HCF if (SGCrCfdiBita.Cells[15, vlNRow]<>'0') then
                 //if (SGCrCfdiBita.Cells[14, vlNRow]<>'0') then//22Oct2013 HCF
                 begin
                    vlNConError:=vlNConError+1;
                    if SGCrCfdiBita.Cells[CO_COL_CHECK, vlNRow] = CO_CHECKED
                    then vlnCheck:=vlNCheck+1;
                    InvertCheck(SGCrCfdiBita, CO_COL_CHECK, vlNRow);{Invierte selección}
                    RGSelTodosNinguno.ItemIndex:=-1;
                 end;
             if vlNConError = vlnCheck then
                RGSelTodosNinguno.ItemIndex:=1
             else if vlnCheck=0 then
                     RGSelTodosNinguno.ItemIndex:=0;
          end;
    end;

end;

procedure TWCrCfdiBitacora.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control  := EdIdCredito;
      CrCredito.GetParams(Objeto);
      //{Lanza exception
      CreCredito.ID_CREDITO.Control := EdIdCredito;
      CreCredito.GetParams(Objeto);
      //}
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   end;

end;

procedure TWCrCfdiBitacora.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control  := Nil;
      CreCredito.ID_CREDITO.Control := Nil;//Lanza exception
   End;

end;

procedure TWCrCfdiBitacora.btIdCreditoClick(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ShowAll := True;
      If CrCredito.Busca then Begin
         InterForma1.NextTab(EdIdCredito);
         if length(EdIdCredito.Text)<>0 then
            self.BBBuscarPClick(self);
      End;
   End;

end;

procedure TWCrCfdiBitacora.FormCreate(Sender: TObject);
begin
   inicializa;
end;

procedure TWCrCfdiBitacora.btIdCrCreClick(Sender: TObject);
begin
   //{ Lanza exception
   With Objeto Do Begin
      CreCredito.ShowAll := True;
      If CreCredito.Busca then Begin
         InterForma1.NextTab(EdIdCredito);
         if length(EdIdCredito.Text)<>0 then
            self.BBBuscarPClick(self);
      End;
   End;
   //}
end;

procedure TWCrCfdiBitacora.ILCreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWCrCfdiBitacora.ILCreditoEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ILCredito.Buffer]) Then Begin
      InterForma1.NextTab(EdIdCredito);
   End;

end;

procedure TWCrCfdiBitacora.ILCCreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWCrCfdiBitacora.ILCCreditoEjecuta(Sender: TObject);
begin
   //{Lanza exception
   If Objeto.CreCredito.FindKey([ILCCredito.Buffer]) Then Begin
      InterForma1.NextTab(EdIdCredito);
   End;
   //}
end;

end.

