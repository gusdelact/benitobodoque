// Sistema         : Clase de CR_AM_OTRADEU
// Fecha de Inicio : 04/05/2010
// Función forma   : Clase de CR_AM_OTRADEU
// Desarrollo por  : Roberto Andres Silva Tello
// Diseñado por    : Roberto Andres Silva Tello
// Comentarios     : Otros Adeudos
Unit IntCrAmOtrad;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntCrCredito,IntMPers,
  IntLinkit, IntSGCtrl;

Type
 TCrAmOtrad= class;

  TWCrAmOtradeu=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbF_MODIFICACION : TLabel; 
    dtpF_MODIFICACION : TInterDateTimePicker; 
    edF_MODIFICACION : TEdit;
    lbCONCEPTO : TLabel; 
    edCONCEPTO : TEdit;
    lbIMPORTE : TLabel; 
    edIMPORTE : TEdit;
    lbF_ORIGEN : TLabel; 
    dtpF_ORIGEN : TInterDateTimePicker; 
    edF_ORIGEN : TEdit;
    lbF_COBRO : TLabel; 
    dtpF_COBRO : TInterDateTimePicker; 
    edF_COBRO : TEdit; 
    edTIPO_ADEU : TEdit;
    RadioGroup1: TRadioGroup;
    rdBinter: TRadioButton;
    rdFIRA: TRadioButton;
    edId_Acreditado: TEdit;
    lblAcreditado: TLabel;
    lblPromotor: TLabel;
    edId_Promotor: TEdit;
    edNomPromotor: TEdit;
    edNomAcreditado: TEdit;
    btID_CREDITO: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    sgBitacora: TSGCtrl;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure rdBinterClick(Sender: TObject);
    procedure rdFIRAClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure sgBitacoraDblClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrAmOtrad;
    procedure AmOtrad;
end; 
 TCrAmOtrad= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_CREDITO               : TInterCampo;
        F_MODIFICACION           : TInterCampo;
        CONCEPTO                 : TInterCampo;
        IMPORTE                  : TInterCampo;
        F_ORIGEN                 : TInterCampo;
        F_COBRO                  : TInterCampo;
        TIPO_ADEU                : TInterCampo;

        Credito                  : TCrCredito;//Disposición
        Promotor                 : TMPersona; //Promotor

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAmOtrad.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      F_MODIFICACION :=CreaCampo('F_MODIFICACION',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICACION.Caption:='Fecha Modificacion';
      CONCEPTO :=CreaCampo('CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CONCEPTO.Caption:='Concepto';
      IMPORTE :=CreaCampo('IMPORTE',ftFloat,tsNinguno,tsNinguno,True);
                IMPORTE.Caption:='Importe';
      F_ORIGEN :=CreaCampo('F_ORIGEN',ftDate,tsNinguno,tsNinguno,True);
                F_ORIGEN.Caption:='Fecha Origen';
      F_COBRO :=CreaCampo('F_COBRO',ftDate,tsNinguno,tsNinguno,True);
                F_COBRO.Caption:='Fecha Cobro';
      TIPO_ADEU :=CreaCampo('TIPO_ADEU',ftString,tsNinguno,tsNinguno,True);
                TIPO_ADEU.Caption:='Tipo Adeu';

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('F_MODIFICACION');
      FKeyFields.Add('CONCEPTO');

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Promotor := TMPersona.Create(Self);
      Promotor.MasterSource:=Self;

      TableName := 'ADMIPROD.CR_AM_OTRADEU';
      UseQuery := True; 
      HelpFile := 'IntCrAmOtrad.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAmOtrad.Destroy;
begin inherited;
end;


function TCrAmOtrad.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAmOtradeu;
begin
   W:=TWCrAmOtradeu.Create(Self);
   try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
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


Function TCrAmOtrad.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
  InternalBusca := False;
  T := CreaBuscador('ICrAmOtr.it','F,D,S');
  Try
  if Active then begin
    T.Param(0,ID_CREDITO.AsString);
        T.Param(1,F_MODIFICACION.AsString);
            T.Param(2,CONCEPTO.AsString);
  end;
  if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
  //FormatDateTime('dd/mm/yyyy hh:nn:ss',StrToDateTime(
  finally  T.Free;
  end;
end;

function TCrAmOtrad.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_AM_OTRADEU********************)
(*                                                                              *)
(*  FORMA DE CR_AM_OTRADEU                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AM_OTRADEU********************)

procedure TWCrAmOtradeu.FormShow(Sender: TObject);
begin

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.F_MODIFICACION.Control:=edF_MODIFICACION;
      Objeto.CONCEPTO.Control:=edCONCEPTO;
      Objeto.IMPORTE.Control:=edIMPORTE;
      Objeto.F_ORIGEN.Control:=edF_ORIGEN;
      Objeto.F_COBRO.Control:=edF_COBRO;
      Objeto.TIPO_ADEU.Control:=edTIPO_ADEU;

      Objeto.Credito.ContratoCre.Contrato.ID_Titular.Control := edId_Acreditado;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control  := edNomAcreditado;
      Objeto.Credito.ContratoCre.ID_PROM_ADMON.Control       := edID_PROMOTOR;
      Objeto.Promotor.Nombre.Control                         := edNomPromotor;
end;

procedure TWCrAmOtradeu.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.F_MODIFICACION.Control:=nil;
      Objeto.CONCEPTO.Control:=nil;
      Objeto.IMPORTE.Control:=nil;
      Objeto.F_ORIGEN.Control:=nil;
      Objeto.F_COBRO.Control:=nil;
      Objeto.TIPO_ADEU.Control:=nil;
   //Objeto
end;

procedure TWCrAmOtradeu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAmOtradeu.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
edF_MODIFICACION.Text := DatetoStr(now());
  rdBinter.Checked:=True;
  rdBinter.Enabled := True;
  rdFIRA.Enabled := True;
  edTIPO_ADEU.Text := 'BI';
  AmOtrad;
end;

procedure TWCrAmOtradeu.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
IF edTIPO_ADEU.Text = 'BI' Then
rdBinter.Checked := True
ELSE IF edTIPO_ADEU.Text = 'FI' then
rdFIRA.Checked:= True;

rdBinter.Enabled := True;
rdFIRA.Enabled := True;
end;

//procedure TWCrAmOtradeu.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrAmOtradeu.btID_CREDITOClick(Sender: TObject);
var encuentra : Boolean;
begin
if Objeto.Credito.Busca then
  Objeto.Promotor.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);

  AmOtrad;
end;

procedure TWCrAmOtradeu.ilID_CREDITOEjecuta(Sender: TObject);
begin
  if Objeto.Credito.findKey([ilID_CREDITO.buffer]) then
  begin

    Objeto.Promotor.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);
  end;

  AmOtrad;
end;

procedure TWCrAmOtradeu.InterForma1Buscar(Sender: TObject);
begin
  if objeto.InternalBusca then
    Objeto.Promotor.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);

         IF edTIPO_ADEU.Text = 'BI' Then
        rdBinter.Checked := True
    ELSE IF edTIPO_ADEU.Text = 'FI' Then
    rdFIRA.Checked := True;

    AmOtrad;
end;

procedure TWCrAmOtradeu.rdBinterClick(Sender: TObject);
begin
 edTIPO_ADEU.Text := 'BI';
end;

procedure TWCrAmOtradeu.rdFIRAClick(Sender: TObject);
begin
  edTIPO_ADEU.Text := 'FI';
end;

procedure TWCrAmOtradeu.InterForma1DespuesAceptar(Sender: TObject);
begin
rdBinter.Enabled := False;
rdFIRA.Enabled := False;

IF edTIPO_ADEU.Text = 'BI' Then
rdBinter.Checked := True
ELSE IF edTIPO_ADEU.Text = 'FI' then
rdFIRA.Checked:= True;

AmOtrad;

end;

procedure TWCrAmOtradeu.InterForma1DespuesCancelar(Sender: TObject);
begin
  IF edTIPO_ADEU.Text = '' Then
  rdBinter.Checked := False
  Else
  Begin
    IF edTIPO_ADEU.Text = 'BI' Then
        rdBinter.Checked := True
    ELSE IF edTIPO_ADEU.Text = 'FI' then
    rdFIRA.Checked := True;



  End;

  rdBinter.Enabled := False;
  rdFIRA.Enabled := False;


end;

procedure TWCrAmOtradeu.InterForma1DespuesEliminar(Sender: TObject);
begin
rdBinter.Checked := False;
end;

procedure TWCrAmOtradeu.AmOtrad;
var
  vlSQL : String;
  vgQryBitacora : TQuery;
  vlQry : TQuery;
begin
sgBitacora.Clear('NO EXISTEN DATOS'#30'>C');
  if edID_CREDITO.Text <> '' then
  begin

    vlSQL :=
    'SELECT ' +
      '	   Concepto, Importe, F_Origen, F_Cobro, ' +
      '	   (CASE                                    ' +
      '	   		 WHEN TIPO_ADEU = ' + #39 + 'BI' +  #39 + ' THEN ' + #39 + 'BINTER' + #39  +
      '	   		 WHEN TIPO_ADEU = ' + #39 + 'FI' + #39 +  ' THEN ' + #39 + 'FIRA' + #39 + ' END) TipoAdeudo, F_MODIFICACION ' +
      '  FROM   ' +
      '	ADMIPROD.CR_AM_OTRADEU ' +
      ' where		 id_credito = ' + edID_CREDITO.Text +
      ' order by f_Modificacion desc ';

    vgQryBitacora  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(vgQryBitacora) Then
    begin
      try
      vgQryBitacora.FieldByName('Concepto').DisplayLabel := 'Concepto';
      vgQryBitacora.FieldByName('Concepto').DisplayWidth := 24;
      vgQryBitacora.FieldByName('Importe').DisplayLabel := 'Importe';
      vgQryBitacora.FieldByName('Importe').DisplayWidth := 24;
      vgQryBitacora.FieldByName('F_Origen').DisplayLabel := 'Fecha Origen';
      vgQryBitacora.FieldByName('F_Origen').DisplayWidth := 24;
      vgQryBitacora.FieldByName('F_Cobro').DisplayLabel := 'Fecha Cobro';
      vgQryBitacora.FieldByName('F_Cobro').DisplayWidth := 24;
      vgQryBitacora.FieldByName('TipoAdeudo').DisplayLabel := 'Tipo de Adeudo';
      vgQryBitacora.FieldByName('TipoAdeudo').DisplayWidth := 24;
      vgQryBitacora.FieldByName('F_MODIFICACION').Visible := False;

      sgBitacora.AddQry(vgQryBitacora,True,True,-1,-1,-1,True);
      finally vgQryBitacora.Free;
      end;
    end;

  end;
end;

procedure TWCrAmOtradeu.sgBitacoraDblClick(Sender: TObject);
var
  fecha   : String;
  row : Integer;
  Conc: String;
begin
if objeto.Modo = moBrowse then
  begin
    row := sgBitacora.SG.Row;
    Conc := sgBitacora.SG.Cells[4,row];
    fecha := sgBitacora.SG.Cells[3,row];

    Objeto.FindKey([edID_CREDITO.Text, fecha,Conc]);
  end;

end;

procedure TWCrAmOtradeu.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  objeto.F_MODIFICACION.AsDateTime := Now;
end;

end.
