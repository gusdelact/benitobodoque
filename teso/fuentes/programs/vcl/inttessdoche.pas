// Sistema         : Clase de TESO_SDO_CHEQRA
// Fecha de Inicio : 16/06/1998
// Función forma   : Clase de TESO_SDO_CHEQRA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntTesSdoChe;

interface  

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,Ungene;

Type
 TTesSdoChe= class;

  TWTesoSdoCheqra=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lbIMP_DEPOSITO: TLabel;
    lbIMP_RETIRO: TLabel;
    lbSDO_FLOATING: TLabel;
    lbSDO_INICIAL_BCO: TLabel;
    lbSDO_INICIAL_CALC: TLabel;
    GroupBox1: TGroupBox;
    lbIMP_DEP_VIRT: TLabel;
    lbIMP_RETIRO_VIRT: TLabel;
    edIMP_DEP_VIRT: TInterEdit;
    edIMP_RETIRO_VIRT: TInterEdit;
    edIMP_DEPOSITO: TInterEdit;
    edIMP_RETIRO: TInterEdit;
    edSDO_INICIAL_BCO: TInterEdit;
    edSDO_INICIAL_CALC: TInterEdit;
    edSDO_FLOATING: TInterEdit;
    GroupBox4: TGroupBox;
    lbCVE_CHEQRA: TLabel;
    edCVE_CHEQRA: TEdit;
    lbF_OPERACION: TLabel;
    edF_OPERACION: TEdit;
    dtpF_OPERACION: TInterDateTimePicker;
    Panel3: TPanel;
    Label1: TLabel;
    lbSDO_DISPONIBLE: TLabel;
    edSDO_DISPONIBLE: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure Button1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TTesSdoChe;
end;
 TTesSdoChe= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CHEQRA               : TInterCampo;
        F_OPERACION              : TInterCampo;
        IMP_DEP_VIRT             : TInterCampo;
        IMP_DEPOSITO             : TInterCampo;
        IMP_RETIRO               : TInterCampo;
        IMP_RETIRO_VIRT          : TInterCampo;
        SDO_FLOATING             : TInterCampo;
        SDO_INICIAL_BCO          : TInterCampo;
        SDO_INICIAL_CALC         : TInterCampo;

        F_CONSULTA               : TInterCampo;

        SDO_DISPONIBLE           : TInterCampo;

        ParamTeso   : TInterFrame;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Procedure   CorrimientoSaldo(pFechaD000:TDateTime; pFechaD001:TDateTime; pFechaD002:TDateTime);
        Procedure   CalcSdoDisp;
        Function    ValidaMovimientos(pFechaD000:TDateTime) : Boolean;
        Function    ValidaMovimientosQ(pFechaD000:TDateTime):String;
      published
      end;

implementation

//Uses RepMon;

{$R *.DFM}


constructor TTesSdoChe.Create( AOwner : TComponent );
begin Inherited;
      CVE_CHEQRA :=CreaCampo('CVE_CHEQRA',ftString,tsNinguno,tsNinguno,True);
        CVE_CHEQRA .Size:=8;
                CVE_CHEQRA.Caption:='Clave de Cheqra';
      F_OPERACION :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                F_OPERACION.Caption:='Fecha Operacion';
      IMP_DEP_VIRT :=CreaCampo('IMP_DEP_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_DEP_VIRT.Caption:='Imp Dep Virt';
      IMP_DEPOSITO :=CreaCampo('IMP_DEPOSITO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_DEPOSITO.Caption:='Imp Deposito';
      IMP_RETIRO :=CreaCampo('IMP_RETIRO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_RETIRO.Caption:='Imp Retiro';
      IMP_RETIRO_VIRT :=CreaCampo('IMP_RETIRO_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_RETIRO_VIRT.Caption:='Imp Retiro Virt';
      SDO_FLOATING :=CreaCampo('SDO_FLOATING',ftFloat,tsNinguno,tsNinguno,True);
                SDO_FLOATING.Caption:='Sdo Floating';
      SDO_INICIAL_BCO :=CreaCampo('SDO_INICIAL_BCO',ftFloat,tsNinguno,tsNinguno,True);
                SDO_INICIAL_BCO.Caption:='Sdo Inicial Bco';
      SDO_INICIAL_CALC :=CreaCampo('SDO_INICIAL_CALC',ftFloat,tsNinguno,tsNinguno,True);
                SDO_INICIAL_CALC.Caption:='Sdo Inicial Calc';
      F_CONSULTA :=CreaCampo('F_CONSULTA',ftDate,tsNinguno,tsNinguno,False);
                F_CONSULTA.Caption:='Fecha consulta';

      SDO_DISPONIBLE :=CreaCampo('SDO_DISPONIBLE',ftFloat,tsNinguno,tsNinguno,False);
                SDO_DISPONIBLE.Caption:='Sdo Disponible';

      FKeyFields.Add('CVE_CHEQRA');
      FKeyFields.Add('F_OPERACION');

      TableName := 'TESO_SDO_CHEQRA';
      UseQuery := True;
      HelpFile := 'IntTesSdoChe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TTesSdoChe.Destroy;
begin inherited;
end;


function TTesSdoChe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTesoSdoCheqra;
begin
   W:=TWTesoSdoCheqra.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnEliminar:=False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TTesSdoChe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ITeSdCh.it','S,S');

      T.WhereString:='TESO_SDO_CHEQRA.F_OPERACION >= ' + #39 +DateTimeToStr(Apli.DameFechaEmpresa)+ #39;

      Try if Active then begin T.Param(0,CVE_CHEQRA.AsString);
                               T.Param(1,F_OPERACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
      CalcSdoDisp;
end;

function TTesSdoChe.Reporte:Boolean;
begin //Execute_Reporte();
end;

Procedure TTesSdoChe.CalcSdoDisp;
begin
   SDO_DISPONIBLE.asfloat:=SDO_INICIAL_CALC.asfloat+IMP_DEPOSITO.asfloat-
   IMP_RETIRO.asfloat+SDO_FLOATING.asfloat;
end;

procedure TTesSdoChe.CorrimientoSaldo(pFechaD000:TDateTime; pFechaD001:TDateTime; pFechaD002:TDateTime);
var TSaldoMismoDia     : TQuery;
    TMovtos24Horas     : TQuery;
    vlFechaMismoDia    : TDateTime;
    vlFechaSigDia      : TDateTime;
    vlFecha48Horas     : TDateTime;
    vlImpDepVirt       : Double;
    vlImpDeposito      : Double;
    vlImpRetiro        : Double;
    vlImpRetiroVirt    : Double;
    vlCveAfSaldo       : String;
    vlImpMovimiento    : Double;
    vlBEmiteDocto      : String;
    vlBEmiteDoctoInstr : String;
    vbCierreOK         : Boolean;
begin
   // Obtiene fechas válidas para mismo día y 24 horas

    vlFechaMismoDia := pFechaD000;
    vlFechaSigDia   := pFechaD001;
    vlFecha48Horas  := pFechaD002;
    vbCierreOK      := False;


    // Obtiene saldos finales para la fecha mismo dia
    TSaldoMismoDia := GetSqlQuery('SELECT  TSC.CVE_CHEQRA,     ' +
                                  '       (TSC.SDO_INICIAL_CALC   + TSC.IMP_DEPOSITO - TSC.IMP_RETIRO) SALDO ' +
                                  'FROM   TESO_SDO_CHEQRA TSC, ' +
                                  '       TESO_CHEQUERA   TC   ' +
                                  'WHERE  TSC.F_OPERACION  =   ' + SQLFecha(vlFechaMismoDia) + ' AND ' +
                                  '       TC.ID_TESORERIA  =   ' + ParamTeso.FieldByName('ID_TESORERIA').AsSql + ' AND ' +
                                 // 'TC.ID_TESORERIA IN (SELECT ID_TESORERIA FROM TESO_TESORERIA WHERE ID_EMPRESA = 2) AND '+
                                  '       TC.CVE_CHEQRA    =   TSC.CVE_CHEQRA',
                                  Apli.DataBaseName,Apli.SessionName,True);

    Try
      If TSaldoMismoDia <> nil then // Encontró chequeras mismo día
      begin
         TSaldoMismoDia.First;
         While not TSaldoMismoDia.EOF do
         begin

           // Elimina movimientos 24 horas para las chequeras de la tesorería.
            RunSql('DELETE ' +
                   'FROM    TESO_SDO_CHEQRA ' +
                   'WHERE   F_OPERACION   = ' + SQLFecha(vlFechaSigDia) + ' AND ' +
                   '        CVE_CHEQRA    = ''' + TSaldoMismoDia.FieldByName('CVE_CHEQRA').AsString + '''',
                   Apli.DataBaseName,Apli.SessionName,True);

           // Elimina movimientos 48 horas para las chequeras de la tesorería.
            RunSql('DELETE ' +
                   'FROM    TESO_SDO_CHEQRA ' +
                   'WHERE   F_OPERACION   = ' + SQLFecha(vlFecha48Horas) + ' AND ' +
                   '        CVE_CHEQRA    = ''' + TSaldoMismoDia.FieldByName('CVE_CHEQRA').AsString + '''',
                   Apli.DataBaseName,Apli.SessionName,True);

            vlImpDepVirt       := 0;
            vlImpDeposito      := 0;
            vlImpRetiro        := 0;
            vlImpRetiroVirt    := 0;

            // Obtiene movimientos 24 horaas.
            TMovtos24Horas := GetSqlQuery('SELECT TME.IMP_MOVIMIENTO,  ' +
                                          '       TME.TIPO_CAMBIO,     ' +
                                          '       TOP.CVE_AF_SALDO,    ' +
                                          '       TC.B_EMITE_DOCTO,    ' +
                                          '       TMC.SIT_MOVTO_CHEQRA,' +
                                          '       TIO.B_EMITE_DOCTO B_EMITE_DOCTO_INSTR ' +
                                          'FROM   TESO_MOV_EFVO   TME, ' +
                                          '       TESO_OPERACION  TOP, ' +
                                          '       TESO_CHEQUERA   TC,  ' +
                                          '       TESO_MOV_CHEQRA TMC, ' +
                                          '       TESO_INSTR_OPER TIO  ' +
                                          'WHERE  TMC.CVE_CHEQRA     = ''' +  TSaldoMismoDia.FieldByName('CVE_CHEQRA').AsString + ''' AND ' +
                                          '       TMC.FOL_MOVTO_EFVO = TME.FOL_MOVTO_EFVO AND ' +
                                          '       TME.SIT_MOVTO      = ''AC''             AND ' +
                                          '       TME.F_LIQUIDACION  = ' + SQLFecha(vlFechaSigDia) + ' AND ' +
                                          '       TME.CVE_OPERACION  = TOP.CVE_OPERACION AND   ' +
                                          '       TC.CVE_CHEQRA      = ''' + TSaldoMismoDia.FieldByName('CVE_CHEQRA').AsString + ''' AND ' +
                                          '       TIO.CVE_INSTRUMENTO = TME.CVE_INSTRUMENTO',
                                          Apli.DataBaseName,Apli.SessionName,True);

            Try
              if TMovtos24Horas <> nil then
              begin

                 TMovtos24Horas.First;
                 While not TMovtos24Horas.Eof do
                 begin
                   vlCveAfSaldo    := TMovtos24Horas.FieldByName('CVE_AF_SALDO').AsString;
                   vlBEmiteDocto   := TMovtos24Horas.FieldByName('B_EMITE_DOCTO').AsString;
                   vlImpMovimiento := TMovtos24Horas.FieldByName('IMP_MOVIMIENTO').AsFloat *
                                      TMovtos24Horas.FieldByName('TIPO_CAMBIO').AsFloat;
                   vlBEmiteDoctoInstr := TMovtos24Horas.FieldByName('B_EMITE_DOCTO_INSTR').AsString;
                   // Si la clave de afectación es incrementa, afecta en depósitos
                   if vlCveAfSaldo = 'I' then
                   begin
                     vlImpDepVirt    := vlImpDepVirt + vlImpMovimiento;
//                     if vlBEmiteDocto = 'F' then
                     if TMovtos24Horas.FieldByName('SIT_MOVTO_CHEQRA').AsString <> 'SD' then
                     begin
                       vlImpDeposito := vlImpDeposito + vlImpMovimiento;
                     end; //  Sit_Movto_Cheqra  // vlBEmiteDocto = 'F'
                   end;  // vlCveAfSaldo = 'I'

                   // Si la clave de afectaación es decrementa, afecta en retiros
                   if vlCveAfSaldo = 'D' then
                   begin
                     vlImpRetiroVirt := vlImpRetiroVirt + vlImpMovimiento;
                     if (vlBEmiteDocto = 'F')      or
                        (vlBEmiteDoctoInstr = 'F') or
                        (TMovtos24Horas.FieldByName('SIT_MOVTO_CHEQRA').AsString <> 'SD') then
                     begin
                       vlImpRetiro := vlImpRetiro + vlImpMovimiento;
                     end; // vlBEmiteDocto = 'F'
                   end; // vlCveAfSaldo = 'D'

                   TMovtos24Horas.Next;

                 end; // While TMovtos24Horas
              end; // TMovtos24Horas <> nil
              // Crea registro de saldo 24 horas.

              Append;

              CVE_CHEQRA.AsString      := TSaldoMismoDia.FieldByName('CVE_CHEQRA').AsString;
              F_OPERACION.AsDateTime   := vlFechaSigDia;
              IMP_DEP_VIRT.AsFloat     := vlImpDepVirt;
              IMP_DEPOSITO.AsFloat     := vlImpDeposito;
              IMP_RETIRO.AsFloat       := vlImpRetiro;
              IMP_RETIRO_VIRT.AsFloat  := vlImpRetiroVirt;
              SDO_FLOATING.AsFloat     := 0;
              SDO_INICIAL_BCO.AsFloat  := TSaldoMismoDia.FieldByName('SALDO').AsFloat;
              SDO_INICIAL_CALC.AsFloat := TSaldoMismoDia.FieldByName('SALDO').AsFloat;

              Post;

              // Crea registro de saldo 48 horas.
              Append;

              CVE_CHEQRA.AsString      := TSaldoMismoDia.FieldByName('CVE_CHEQRA').AsString;
              F_OPERACION.AsDateTime   := vlFecha48Horas;
              IMP_DEP_VIRT.AsFloat     := 0;
              IMP_DEPOSITO.AsFloat     := 0;
              IMP_RETIRO.AsFloat       := 0;
              IMP_RETIRO_VIRT.AsFloat  := 0;
              SDO_FLOATING.AsFloat     := 0;
              SDO_INICIAL_BCO.AsFloat  := 0;
              SDO_INICIAL_CALC.AsFloat := 0;

              Post;

            Finally TMovtos24Horas.Free
            end;

            TSaldoMismoDia.Next;
         end; // While mismo dia
         vbCierreOK := True;
      end; // TSaldoMismoDia <> nil
    Finally
      begin
        TSaldoMismoDia.Free;
        // Actualiza fecha de último corte para la tesorería.
        if vbCierreOK then
           RunSql('UPDATE TESO_TESORERIA ' +
                  'SET F_ULT_CORTE    =  ' + SQLFecha(vlFechaMismoDia) +
                  'WHERE ID_TESORERIA =  ' + ParamTeso.FieldByName('ID_TESORERIA').AsSql,
                  Apli.DataBaseName,Apli.SessionName,True)
        else
           InterMsg(tmmal,' ',0,'Problemas con el cierre.  Verifique ...');
      end;
    end;
end;


Function TTesSdoChe.ValidaMovimientosQ(pFechaD000:TDateTime) : String;
begin
    ValidaMovimientosQ:='';
    if ParamTeso.FieldByName('ID_EMPRESA').AsInteger  = 2 then
     begin
       ValidaMovimientosQ := 'SELECT * ' +
                                 'FROM TESO_MOV_EFVO ' +
                                 'WHERE (ID_TESORERIA IN (SELECT ID_TESORERIA FROM TESO_TESORERIA WHERE ID_EMPRESA = 2) ) AND ' +
                                 '      (SIT_MOVTO IN (''PC'',''PR'')) AND ' +
                                 '      (F_LIQUIDACION = ' + SQLFecha(pFechaD000) +')';
     end
    else
      begin
        ValidaMovimientosQ := 'SELECT * ' +
                                 'FROM TESO_MOV_EFVO ' +
                                 'WHERE (ID_TESORERIA = ' + ParamTeso.FieldByName('ID_TESORERIA').AsSql + ') AND ' +
                                 '      (SIT_MOVTO IN (''PC'',''PR'')) AND ' +
                                 '      (F_LIQUIDACION = ' + SQLFecha(pFechaD000) +')';
      end;
 end;


Function TTesSdoChe.ValidaMovimientos(pFechaD000:TDateTime) : Boolean;
var TMovtoEfectivo : TQuery;
begin
   TMovtoEfectivo := GetSqlQuery(ValidaMovimientosQ(pFechaD000),
                                 Apli.DataBaseName,Apli.SessionName,True);
   ValidaMovimientos := False;

   Try
     if TMovtoEfectivo <> nil then
     begin
        ValidaMovimientos := True;
     end;
   Finally TMovtoEfectivo.Free;
   end;

end;

(***********************************************FORMA TESO_SDO_CHEQRA********************)
(*                                                                              *)
(*  FORMA DE TESO_SDO_CHEQRA                                                            *)
(*                                                                              *)
(***********************************************FORMA TESO_SDO_CHEQRA********************)

procedure TWTesoSdoCheqra.FormShow(Sender: TObject);
begin
      Objeto.ParamTeso.FieldByName('NOMBRE_TESO').Control:=Label1;
      Objeto.CVE_CHEQRA.Control:=edCVE_CHEQRA;
      Objeto.F_OPERACION.Control:=edF_OPERACION;
      Objeto.IMP_DEP_VIRT.Control:=edIMP_DEP_VIRT;
      Objeto.IMP_DEPOSITO.Control:=edIMP_DEPOSITO;
      Objeto.IMP_RETIRO.Control:=edIMP_RETIRO;
      Objeto.IMP_RETIRO_VIRT.Control:=edIMP_RETIRO_VIRT;
      Objeto.SDO_FLOATING.Control:=edSDO_FLOATING;
      Objeto.SDO_INICIAL_BCO.Control:=edSDO_INICIAL_BCO;
      Objeto.SDO_INICIAL_CALC.Control:=edSDO_INICIAL_CALC;
      Objeto.F_OPERACION.AsDateTime:=Objeto.Apli.DameFechaEmpresa;
      Objeto.SDO_DISPONIBLE.Control:=edSDO_DISPONIBLE;
      Objeto.CalcSdoDisp;
end;

procedure TWTesoSdoCheqra.FormDestroy(Sender: TObject);
begin
      Try
        Objeto.ParamTeso.FieldByName('NOMBRE_TESO').Control:=nil;
      Except
      end;  
      Objeto.CVE_CHEQRA.Control:=nil;
      Objeto.F_OPERACION.Control:=nil;
      Objeto.IMP_DEP_VIRT.Control:=nil;
      Objeto.IMP_DEPOSITO.Control:=nil;
      Objeto.IMP_RETIRO.Control:=nil;
      Objeto.IMP_RETIRO_VIRT.Control:=nil;
      Objeto.SDO_FLOATING.Control:=nil;
      Objeto.SDO_INICIAL_BCO.Control:=nil;
      Objeto.SDO_INICIAL_CALC.Control:=nil;
      Objeto.SDO_DISPONIBLE.Control:=nil;
   //Objeto
end;

procedure TWTesoSdoCheqra.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTesoSdoCheqra.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWTesoSdoCheqra.InterForma1DespuesModificar(Sender: TObject);
begin
     edSDO_INICIAL_BCO.SetFocus;
end;

//procedure TWTesoSdoCheqra.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWTesoSdoCheqra.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
     Objeto.SDO_FLOATING.GetFromControl;
     Objeto.SDO_INICIAL_BCO.GetFromControl;
     Objeto.SDO_INICIAL_CALC.GetFromControl;
     Objeto.SDO_FLOATING.AsFloat:=Objeto.SDO_INICIAL_BCO.AsFloat-Objeto.SDO_INICIAL_CALC.AsFloat;
     Objeto.CalcSdoDisp;
end;


procedure TWTesoSdoCheqra.Button1Click(Sender: TObject);
begin
   Objeto.CorrimientoSaldo(Objeto.Apli.DameFechaEmpresa,Objeto.Apli.DameFechaEmpresaDia('D001'),
                           Objeto.Apli.DameFechaEmpresaDia('D002'));
end;

end.
