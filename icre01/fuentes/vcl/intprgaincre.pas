// Sistema         : Clase de PRGAINCREMENTO
// Fecha de Inicio : 11/05/2004
// Función forma   : Clase de PRGAINCREMENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntPrgaincre;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

IntProrroga,   //Prorrogas
IntParamCre,   // Objeto de Parametros
IntGenCre      // Funciones Genéricas
;
const
  CO_CORTE = '* * * * * * * * * * * * * * * * *';

Type
 TPrgaincre= class; 

  TWPrgaincremento=Class(TForm)
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    memMessage: TMemo;
    btnAplicar: TButton;
    Panel1: TPanel;
    Label27: TLabel;
    Label26: TLabel;
    edID_CREDITO: TEdit;
    edNUM_PERIODO: TEdit;
    InterForma1: TInterForma;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edIMP_CAPITAL_NVO: TInterEdit;
    edIMP_CAPITAL: TInterEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edIMP_DIFERENCIA: TInterEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpF_VENCIMIENTO: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    dtpF_VENC_PRGA: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    PnlMsg: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure edIMP_CAPITAL_NVOExit(Sender: TObject);
    private
    { Private declarations }
     function  EsValidoIMP_CAPITAL_NVO : Boolean;
    public
    { Public declarations }
    Objeto : TPrgaincre;
     procedure MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
    published
     { Published declarations }

end;
 TPrgaincre= class(TInterFrame)
      private
      protected
     //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO      :  TInterCampo;
        NUM_PERIODO     :  TInterCampo;
        F_VENC_PRGA     :  TInterCampo;
        F_VENCIMIENTO   :  TInterCampo;
        IMP_CAPITAL     :  TInterCampo;
        IMP_CAPITAL_NVO :  TInterCampo;
        IMP_DIFERENCIA  :  TInterCampo;

        ParamCre     :  TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}

constructor TPrgaincre.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO      :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      NUM_PERIODO     :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,False);
      F_VENC_PRGA     :=CreaCampo('F_VENC_PRGA',ftDateTime,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO   :=CreaCampo('F_VENCIMIENTO',ftDateTime,tsNinguno,tsNinguno,False);
      IMP_CAPITAL     :=CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAPITAL_NVO :=CreaCampo('IMP_CAPITAL_NVO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_DIFERENCIA  :=CreaCampo('IMP_DIFERENCIA',ftFloat,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntPrgaincre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPrgaincre.Destroy;
begin inherited;
end;


function TPrgaincre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPrgaincremento;
begin
   W:=TWPrgaincremento.Create(Self);
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

Function TPrgaincre.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IPrgainc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA PRGAINCREMENTO********************)
(*                                                                              *)
(*  FORMA DE PRGAINCREMENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA PRGAINCREMENTO********************)

procedure TWPrgaincremento.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   ID_CREDITO.Control      := edID_CREDITO;
   NUM_PERIODO.Control     := edNUM_PERIODO;
   F_VENC_PRGA.Control     := dtpF_VENC_PRGA;
   F_VENCIMIENTO.Control   := dtpF_VENCIMIENTO;
   IMP_CAPITAL.Control     := edIMP_CAPITAL;
   IMP_CAPITAL_NVO.Control := edIMP_CAPITAL_NVO;
   IMP_DIFERENCIA.Control  := edIMP_DIFERENCIA;
   End;
end;

procedure TWPrgaincremento.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   ID_CREDITO.Control       := Nil;
   NUM_PERIODO.Control      := Nil;
   F_VENC_PRGA.Control      := Nil;
   F_VENCIMIENTO.Control    := Nil;
   IMP_CAPITAL.Control      := Nil;
   IMP_CAPITAL_NVO.Control  := Nil;
   IMP_DIFERENCIA.Control   := Nil;
   End;
end;

procedure TWPrgaincremento.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPrgaincremento.MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
begin
  MessageDlg(pstrMsg, MsgDlgType, [mbOk], 0);
  memMessage.Lines.Add(CO_CORTE+coCRLF+FormatDateTime('HH:MM:SS AM/PM',Time)+#32+pstrMsg);
end;

procedure TWPrgaincremento.btnAplicarClick(Sender: TObject);

  function EsValido : Boolean;
  begin
   Objeto.F_VENC_PRGA.GetFromControl;    
   If (Trim(dtpF_VENC_PRGA.Text) = '') Then
    Begin
    MuestraMensaje('Favor de indicar la Fecha de Vencimiento del Periodo.',mtError);
    If (dtpF_VENC_PRGA.CanFocus) Then dtpF_VENC_PRGA.SetFocus;
    Result := False;
    End
   Else If (Objeto.F_VENC_PRGA.AsDateTime <= Objeto.F_VENCIMIENTO.AsDateTime) Then
    Begin
    MuestraMensaje('La Nueva Fecha de Vencimiento debe ser mayor a la Actual.',mtError);
    If (dtpF_VENC_PRGA.CanFocus) Then dtpF_VENC_PRGA.SetFocus;    
    Result := False;
    End
   Else // Por último valida el nuevo capital indicado
    Result := EsValidoIMP_CAPITAL_NVO;
  end;

var
  StpProrroga : TStoredProc;
  vlID_GPO_PRGA : Integer;
  vlstrMensaje : String;
begin
  Objeto.F_VENC_PRGA.GetFromControl;
  If Not EsValido Then
   Exit;

  CreateSTP_PRORROGA(StpProrroga, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName);
  If Assigned(StpProrroga) Then
   With (StpProrroga) Do
     Begin
      ParamByName('PEID_CREDITO').AsFloat := Objeto.ID_CREDITO.AsInteger;
      ParamByName('PEID_PERIODO').AsFloat := Objeto.NUM_PERIODO.AsInteger;
      ParamByName('PEID_PERIODO_PRGA').AsFloat := Objeto.NUM_PERIODO.AsInteger;      
      ParamByName('PECVE_PRORROGA').AsString := 'PROINC';
      ParamByName('PECVE_CONCEPTO').AsString := 'KA';
      ParamByName('PEIMP_CAP_PRGA').AsFloat := Objeto.IMP_CAPITAL_NVO.AsFloat;      
      ParamByName('PEF_VENC_PRGA').AsDateTime := Objeto.F_VENC_PRGA.AsDateTime;
      ParamByName('PEF_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
      ParamByName('PECVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
      ParamByName('PEB_COMMIT').AsString := CVERDAD;
      ExecProc;

      If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
        MuestraMensaje((ParamByName('PSTX_RESULTADO').AsString),mtError)
      Else
        Begin
        vlID_GPO_PRGA := ParamByName('PESID_GPO_PRGA').AsInteger;
        If ActivaGrupoProrroga(vlID_GPO_PRGA, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, vlstrMensaje) Then
         Begin
         MuestraMensaje('Prórroga Realizada.', mtInformation);
         InterForma1.Salir;
         End;
        End;
     End;
end;

function  TWPrgaincremento.EsValidoIMP_CAPITAL_NVO : Boolean;
begin
 With Objeto Do
  Begin
  IMP_CAPITAL_NVO.GetFromControl;
  IMP_CAPITAL.GetFromControl;  
  Result := True;
  If (IMP_CAPITAL_NVO.AsFloat > IMP_CAPITAL.AsFloat) Then
    Begin
    MuestraMensaje('El "Nuevo Importe", no debe ser mayor al "Importe de Capital".', mtError);
    Result := False;
    End
  Else If (IMP_CAPITAL_NVO.AsFloat = 0) Then
    Begin
    MuestraMensaje('Favor de indicar el "Nuevo Importe".', mtError);
    Result := False;
    End;
  End;
end;

procedure TWPrgaincremento.edIMP_CAPITAL_NVOExit(Sender: TObject);
begin
  With Objeto Do
   If EsValidoIMP_CAPITAL_NVO Then
    IMP_DIFERENCIA.AsFloat := IMP_CAPITAL.AsFloat - IMP_CAPITAL_NVO.AsFloat;
end;

end.
