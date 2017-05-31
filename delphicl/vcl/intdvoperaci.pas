// Sistema         : Clase de DV_OPERACION
// Fecha de Inicio : 28/01/2011
// Función forma   : Clase de DV_OPERACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Maria Esthela Almanza Camarillo
// Comentarios     :                            
Unit IntDvOperaci;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLdiInsMn, IntLinkit,
UnGene, IntMedio,UnSegBtn, IntDvCanaR24, IntBitDVOpe;


Type
 TDvOperaci= class;

  TWDvOperacion=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_OPERACION : TLabel; 
    edCVE_OPERACION : TEdit; 
    chB_AF_IMP_CHEQUE : TCheckBox; 
    chB_AF_SDO_PROM : TCheckBox; 
    chB_AF_SIT_CHEQUE : TCheckBox; 
    chB_CHK_SOBR : TCheckBox;
    chB_GEN_CTRACTA : TCheckBox;
    chB_MUESTRA_EDOCTA : TCheckBox;
    lbCVE_AF_IMP_ABO : TLabel;
    lbCVE_AF_IMP_CAR : TLabel;
    cbCVE_AF_IMP_CAR: TComboBox;
    lbCVE_AF_IMP_CHQ : TLabel;
    cbCVE_AF_IMP_CHQ: TComboBox;
    lbCVE_AF_IMP_COM : TLabel;
    cbCVE_AF_IMP_COM: TComboBox;
    lbCVE_AF_IMP_INT : TLabel;
    cbCVE_AF_IMP_INT: TComboBox;
    lbCVE_AF_IMP_ISR : TLabel;
    cbCVE_AF_IMP_ISR: TComboBox;
    lbCVE_AF_IMP_IVA : TLabel;
    cbCVE_AF_IMP_IVA: TComboBox;
    lbCVE_AF_IMP_TRANS : TLabel;
    cbCVE_AF_IMP_TRANS: TComboBox;
    lbCVE_AF_NUM_ABO : TLabel;
    cbCVE_AF_NUM_ABO: TComboBox;
    lbCVE_AF_NUM_CAR : TLabel;
    cbCVE_AF_NUM_CAR: TComboBox;
    lbCVE_AF_NUM_CH_DV : TLabel;
    cbCVE_AF_NUM_CH_DV: TComboBox;
    lbCVE_AF_NUM_CHQ : TLabel;
    cbCVE_AF_NUM_CHQ: TComboBox;
    lbCVE_AF_NUM_COM : TLabel;
    cbCVE_AF_NUM_COM: TComboBox;
    lbCVE_AF_NUM_TRANS : TLabel;
    cbCVE_AF_NUM_TRANS: TComboBox;
    lbCVE_AF_SDO_BLOQ : TLabel;
    cbCVE_AF_SDO_BLOQ: TComboBox;
    lbCVE_AF_SDO_COMP : TLabel;
    cbCVE_AF_SDO_COMP: TComboBox;
    lbCVE_AF_SDO_DNC : TLabel;
    cbCVE_AF_SDO_DNC: TComboBox;
    lbCVE_AF_SDO_EFE : TLabel;
    cbCVE_AF_SDO_EFE: TComboBox;
    lbCVE_AF_SDO_PROM : TLabel;
    cbCVE_AF_SDO_PROM: TComboBox;
    lbCVE_AF_SDO_REM : TLabel;
    cbCVE_AF_SDO_REM: TComboBox;
    lbCVE_AF_SDO_SBC : TLabel;
    cbCVE_AF_SDO_SBC: TComboBox;
    lbCVE_AF_SDO_DEUD : TLabel;
    cbCVE_AF_SDO_DEUD: TComboBox;
    lbCVE_MEDIO : TLabel; 
    edCVE_MEDIO : TEdit;
    lbCVE_OPER_CTRACTA : TLabel; 
    edCVE_OPER_CTRACTA : TEdit;
    lbCVE_OPER_SOBR : TLabel; 
    edCVE_OPER_SOBR : TEdit;
    lbCVE_TOPER_CONTAB : TLabel; 
    edCVE_TOPER_CONTAB : TEdit;
    lbDESC_C_ID_PRIM : TLabel; 
    edDESC_C_ID_PRIM : TEdit;
    lbDESC_L_ID_PRIM : TLabel; 
    edDESC_L_ID_PRIM : TEdit;
    lbID_CONTR_CTRACTA : TLabel; 
    edID_CONTR_CTRACTA : TEdit;
    lbCVE_AF_SDO_SGIRO : TLabel;
    cbCVE_AF_SDO_SGIRO: TComboBox;
    chB_APL_TESOR : TCheckBox;
    lbIMP_COMISION : TLabel;
    edIMP_COMISION : TEdit;
    chB_APL_TESOR_IFS : TCheckBox;
    lbCVE_OPER_CANCEL : TLabel; 
    edCVE_OPER_CANCEL : TEdit;
    lbDESC_C_ID_SEC : TLabel; 
    edDESC_C_ID_SEC : TEdit;
    lbDESC_L_ID_SEC : TLabel; 
    edDESC_L_ID_SEC : TEdit; 
    chB_INF_FISCAL : TCheckBox; 
    chB_REPORTE_SITI : TCheckBox;
    lbCVE_INST_MON : TLabel; 
    edCVE_INST_MON : TEdit;
    lbCVE_CONTAB_OPER : TLabel;
    edCVE_CONTAB_OPER : TEdit; 
    chB_AUDITORIA : TCheckBox; 
    chB_SOBREGIRO : TCheckBox; 
    chB_OPER_INET : TCheckBox;
    lbDESC_INET : TLabel; 
    edDESC_INET : TEdit;
    lbSIT_OPERACION : TLabel; 
    chB_OPE_LIDE : TCheckBox; 
    chB_COBRA_LIDE : TCheckBox;
    cbCVE_AF_LIDE: TComboBox;
    lbCVE_AF_LIDE: TLabel;
    SpeedButton1: TSpeedButton;
    edDesc_InstMon: TEdit;
    lbCVE_TIPO_REST: TLabel;
    edCVE_TIPO_REST: TEdit;
    chB_AFE_COM: TCheckBox;
    chB_AFE_IVA: TCheckBox;
    cbCVE_AF_IMP_ABO: TComboBox;
    cbSIT_OPERACION: TComboBox;
    iIdCVE_INST_MON: TInterLinkit;
    SpeedButton2: TSpeedButton;
    edDESC_MEDIO: TEdit;
    IMedio: TInterLinkit;
    Label1: TLabel;
    spbCanal: TSpeedButton;
    edCveCanal: TEdit;
    edDesCanal: TEdit;
    iIdCVE_CANAL: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edCVE_OPERACIONClick(Sender: TObject);
    procedure edCVE_TOPER_CONTABKeyPress(Sender: TObject; var Key: Char);
    procedure edID_CONTR_CTRACTAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_CONTAB_OPERKeyPress(Sender: TObject; var Key: Char);
    procedure iIdCVE_INST_MONCapture(Sender: TObject; var Show: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure IMedioCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MEDIOChange(Sender: TObject);
    procedure edCVE_INST_MONChange(Sender: TObject);
    procedure spbCanalClick(Sender: TObject);
    procedure edCveCanalChange(Sender: TObject);
    procedure iIdCVE_CANALCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    function  BAutorizaPLD() : Boolean;
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TDvOperaci;
end; 
 TDvOperaci= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        (* ACME   AQUI SE ENLISTAN LOS CAMPOS DE LA TABLA   *)
        CVE_OPERACION            : TInterCampo;
        B_AF_IMP_CHEQUE          : TInterCampo;
        B_AF_SDO_PROM            : TInterCampo;
        B_AF_SIT_CHEQUE          : TInterCampo;
        B_CHK_SOBR               : TInterCampo;
        B_GEN_CTRACTA            : TInterCampo;
        B_MUESTRA_EDOCTA         : TInterCampo;
        CVE_AF_IMP_ABO           : TInterCampo;
        CVE_AF_IMP_CAR           : TInterCampo;
        CVE_AF_IMP_CHQ           : TInterCampo;
        CVE_AF_IMP_COM           : TInterCampo;
        CVE_AF_IMP_INT           : TInterCampo;
        CVE_AF_IMP_ISR           : TInterCampo;
        CVE_AF_IMP_IVA           : TInterCampo;
        CVE_AF_IMP_TRANS         : TInterCampo;
        CVE_AF_NUM_ABO           : TInterCampo;
        CVE_AF_NUM_CAR           : TInterCampo;
        CVE_AF_NUM_CH_DV         : TInterCampo;
        CVE_AF_NUM_CHQ           : TInterCampo;
        CVE_AF_NUM_COM           : TInterCampo;
        CVE_AF_NUM_TRANS         : TInterCampo;
        CVE_AF_SDO_BLOQ          : TInterCampo;
        CVE_AF_SDO_COMP          : TInterCampo;
        CVE_AF_SDO_DNC           : TInterCampo;
        CVE_AF_SDO_EFE           : TInterCampo;
        CVE_AF_SDO_PROM          : TInterCampo;
        CVE_AF_SDO_REM           : TInterCampo;
        CVE_AF_SDO_SBC           : TInterCampo;
        CVE_AF_SDO_DEUD          : TInterCampo;
        CVE_MEDIO                : TInterCampo;
        CVE_OPER_CTRACTA         : TInterCampo;
        CVE_OPER_SOBR            : TInterCampo;
        CVE_TOPER_CONTAB         : TInterCampo;
        DESC_C_ID_PRIM           : TInterCampo;
        DESC_L_ID_PRIM           : TInterCampo;
        ID_CONTR_CTRACTA         : TInterCampo;
        CVE_AF_SDO_SGIRO         : TInterCampo;
        B_APL_TESOR              : TInterCampo;
        IMP_COMISION             : TInterCampo;
        B_APL_TESOR_IFS          : TInterCampo;
        CVE_OPER_CANCEL          : TInterCampo;
        DESC_C_ID_SEC            : TInterCampo;
        DESC_L_ID_SEC            : TInterCampo;
        B_INF_FISCAL             : TInterCampo;
        B_REPORTE_SITI           : TInterCampo;
        CVE_INST_MON             : TInterCampo;
        CVE_CONTAB_OPER          : TInterCampo;
        B_AUDITORIA              : TInterCampo;
        B_SOBREGIRO              : TInterCampo;
        B_OPER_INET              : TInterCampo;
        DESC_INET                : TInterCampo;
        SIT_OPERACION            : TInterCampo;
        B_OPE_LIDE               : TInterCampo;
        B_COBRA_LIDE             : TInterCampo;
        CVE_AF_LIDE              : TInterCampo;
        CVE_TIPO_REST            : TInterCampo;
        //FRP NUEVOS CAMPOS
        B_AFE_IMP_COM            : TInterCampo;
        B_AFE_IMP_IVA            : TInterCampo;
        CVE_CANAL                : TInterCampo;
        
        InstMon                  : TLdiInsMn;
        Medio                    : TMedio;
        Canal                    : TDvCanaR24;
        
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


constructor TDvOperaci.Create( AOwner : TComponent ); 
begin Inherited;
      (* ACME   AQUI SE CREAN LOS CAMPOS     *)
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave de Operación';
      B_AF_IMP_CHEQUE :=CreaCampo('B_AF_IMP_CHEQUE',ftString,tsNinguno,tsNinguno,True);
                B_AF_IMP_CHEQUE.Caption:='¿Afecta Importe Cheque?';
      B_AF_SDO_PROM :=CreaCampo('B_AF_SDO_PROM',ftString,tsNinguno,tsNinguno,True);
                B_AF_SDO_PROM.Caption:='¿Afecta Saldo Promedio?';
      B_AF_SIT_CHEQUE :=CreaCampo('B_AF_SIT_CHEQUE',ftString,tsNinguno,tsNinguno,True);
                B_AF_SIT_CHEQUE.Caption:='¿Afecta Situación Cheque?';
      B_CHK_SOBR :=CreaCampo('B_CHK_SOBR',ftString,tsNinguno,tsNinguno,True);
                B_CHK_SOBR.Caption:='¿Checa Sobregiro?';
      B_GEN_CTRACTA :=CreaCampo('B_GEN_CTRACTA',ftString,tsNinguno,tsNinguno,True);
                B_GEN_CTRACTA.Caption:='¿Genera Contra Cuenta?';
      B_MUESTRA_EDOCTA :=CreaCampo('B_MUESTRA_EDOCTA',ftString,tsNinguno,tsNinguno,True);
                B_MUESTRA_EDOCTA.Caption:='¿Se Muestra en Estado de Cuenta?';
      {-----------------------------------}
      CVE_AF_IMP_ABO :=CreaCampo('CVE_AF_IMP_ABO',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_ABO.Caption:='Clave de Afecta Importe Abono';
                WITH CVE_AF_IMP_ABO DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;

      CVE_AF_IMP_CAR :=CreaCampo('CVE_AF_IMP_CAR',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_CAR.Caption:='Clave de Afecta Importe Cargo';
                WITH CVE_AF_IMP_CAR DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;

      CVE_AF_IMP_CHQ :=CreaCampo('CVE_AF_IMP_CHQ',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_CHQ.Caption:='Clave de Afecta Importe Cheque';
                WITH CVE_AF_IMP_CHQ DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_IMP_COM :=CreaCampo('CVE_AF_IMP_COM',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_COM.Caption:='Clave de Afecta Importe Comisión';

                WITH CVE_AF_IMP_COM DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_IMP_INT :=CreaCampo('CVE_AF_IMP_INT',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_INT.Caption:='Clave de Afacta Importe Intéreses';
                WITH CVE_AF_IMP_INT DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_IMP_ISR :=CreaCampo('CVE_AF_IMP_ISR',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_ISR.Caption:='Clave de Afecta Importe ISR';
                WITH CVE_AF_IMP_ISR DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_IMP_IVA :=CreaCampo('CVE_AF_IMP_IVA',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_IVA.Caption:='Clave de Afecta Importe IVA';
                WITH CVE_AF_IMP_IVA DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_IMP_TRANS :=CreaCampo('CVE_AF_IMP_TRANS',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_IMP_TRANS.Caption:='Clave de Afecta Importe Transacción';


                WITH CVE_AF_IMP_TRANS DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_NUM_ABO :=CreaCampo('CVE_AF_NUM_ABO',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_NUM_ABO.Caption:='Clave de Afecta Número Abono';
                WITH CVE_AF_NUM_ABO DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_NUM_CAR :=CreaCampo('CVE_AF_NUM_CAR',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_NUM_CAR.Caption:='Clave de Afecta Número Cargo';
                WITH CVE_AF_NUM_CAR DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_NUM_CH_DV :=CreaCampo('CVE_AF_NUM_CH_DV',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_NUM_CH_DV.Caption:='Clave de Afecta Número Cheque Dev.';
                WITH CVE_AF_NUM_CH_DV DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_NUM_CHQ :=CreaCampo('CVE_AF_NUM_CHQ',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_NUM_CHQ.Caption:='Clave de Afecta Número Cheque';
                WITH CVE_AF_NUM_CHQ DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_NUM_COM :=CreaCampo('CVE_AF_NUM_COM',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_NUM_COM.Caption:='Clave de Afecta Número Comisión';
                WITH CVE_AF_NUM_COM DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_NUM_TRANS :=CreaCampo('CVE_AF_NUM_TRANS',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_NUM_TRANS.Caption:='Clave de Afecta Número Transacción';
                WITH CVE_AF_NUM_TRANS DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_BLOQ :=CreaCampo('CVE_AF_SDO_BLOQ',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_BLOQ.Caption:='Clave de Afecta Saldo Bloqueado';
                WITH CVE_AF_SDO_BLOQ DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_COMP :=CreaCampo('CVE_AF_SDO_COMP',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_COMP.Caption:='Clave de Afecta Saldo Comprometido';
                WITH CVE_AF_SDO_COMP DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_DNC :=CreaCampo('CVE_AF_SDO_DNC',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_DNC.Caption:='Clave Afecta Sañdo Dnc';
                WITH CVE_AF_SDO_DNC DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_EFE :=CreaCampo('CVE_AF_SDO_EFE',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_EFE.Caption:='Clave Afecta Saldo Efectivo';
                WITH CVE_AF_SDO_EFE DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_PROM :=CreaCampo('CVE_AF_SDO_PROM',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_PROM.Caption:='Clave Afecta Saldo Promedio';
                WITH CVE_AF_SDO_PROM DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_REM :=CreaCampo('CVE_AF_SDO_REM',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_REM.Caption:='Clave Afecta Saldo Rem';
                WITH CVE_AF_SDO_REM DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_SBC :=CreaCampo('CVE_AF_SDO_SBC',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_SBC.Caption:='Clave de Afecta Saldo Sbc';
                WITH CVE_AF_SDO_SBC DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_AF_SDO_DEUD :=CreaCampo('CVE_AF_SDO_DEUD',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_DEUD.Caption:='Clave Afecta Saldo Deuudor';
                WITH CVE_AF_SDO_DEUD DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Clave de Medio';
      CVE_OPER_CTRACTA :=CreaCampo('CVE_OPER_CTRACTA',ftString,tsNinguno,tsNinguno,True);
                CVE_OPER_CTRACTA.Caption:='Clave de Operación Contra Cuenta';
      CVE_OPER_SOBR :=CreaCampo('CVE_OPER_SOBR',ftString,tsNinguno,tsNinguno,True);
                CVE_OPER_SOBR.Caption:='Clave Operación Sobregito';
      CVE_TOPER_CONTAB :=CreaCampo('CVE_TOPER_CONTAB',ftString,tsNinguno,tsNinguno,True);
                CVE_TOPER_CONTAB.Caption:='Clave T Operación Contab.';
      DESC_C_ID_PRIM :=CreaCampo('DESC_C_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_C_ID_PRIM.Caption:='Descripción Corta Operación';
      DESC_L_ID_PRIM :=CreaCampo('DESC_L_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_PRIM.Caption:='Descripción Larga Operación';
      ID_CONTR_CTRACTA :=CreaCampo('ID_CONTR_CTRACTA',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTR_CTRACTA.Caption:='Número de Contrato Contra Cuenta';
      CVE_AF_SDO_SGIRO :=CreaCampo('CVE_AF_SDO_SGIRO',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_SDO_SGIRO.Caption:='Clave Afecta Saldo Sobregiro';
                WITH CVE_AF_SDO_SGIRO DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      B_APL_TESOR :=CreaCampo('B_APL_TESOR',ftString,tsNinguno,tsNinguno,True);
                B_APL_TESOR.Caption:='¿Aplica Tesoreria?';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Importe Comisión';
      B_APL_TESOR_IFS :=CreaCampo('B_APL_TESOR_IFS',ftString,tsNinguno,tsNinguno,True);
                B_APL_TESOR_IFS.Caption:='¿Aplica Tesoria IFS?';
      CVE_OPER_CANCEL :=CreaCampo('CVE_OPER_CANCEL',ftString,tsNinguno,tsNinguno,True);
                CVE_OPER_CANCEL.Caption:='Clave de Operación de Cancelación';
      DESC_C_ID_SEC :=CreaCampo('DESC_C_ID_SEC',ftString,tsNinguno,tsNinguno,True);
                DESC_C_ID_SEC.Caption:='Descripción Corta Secundaria';
      DESC_L_ID_SEC :=CreaCampo('DESC_L_ID_SEC',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_SEC.Caption:='Descripción Larga  Secundaria';
      B_INF_FISCAL :=CreaCampo('B_INF_FISCAL',ftString,tsNinguno,tsNinguno,True);
                B_INF_FISCAL.Caption:='¿Información Fiscal?';
      B_REPORTE_SITI :=CreaCampo('B_REPORTE_SITI',ftString,tsNinguno,tsNinguno,True);
                B_REPORTE_SITI.Caption:='¿Reporte SITI?';
      CVE_INST_MON :=CreaCampo('CVE_INST_MON',ftString,tsNinguno,tsNinguno,True);
                CVE_INST_MON.Caption:='Clave de Inst Moneda';
      CVE_CONTAB_OPER :=CreaCampo('CVE_CONTAB_OPER',ftString,tsNinguno,tsNinguno,True);
                CVE_CONTAB_OPER.Caption:='Clave de Contab Operación';
      B_AUDITORIA :=CreaCampo('B_AUDITORIA',ftString,tsNinguno,tsNinguno,True);
                B_AUDITORIA.Caption:='¿Auditoria?';
      B_SOBREGIRO :=CreaCampo('B_SOBREGIRO',ftString,tsNinguno,tsNinguno,True);
                B_SOBREGIRO.Caption:='¿Sobregiro?';
      B_OPER_INET :=CreaCampo('B_OPER_INET',ftString,tsNinguno,tsNinguno,True);
                B_OPER_INET.Caption:='¿Operación Internet?';
      DESC_INET :=CreaCampo('DESC_INET',ftString,tsNinguno,tsNinguno,True);
                DESC_INET.Caption:='Descripción Internet';
      SIT_OPERACION :=CreaCampo('SIT_OPERACION',ftString,tsNinguno,tsNinguno,True);
                SIT_OPERACION.Caption:='Situación Clave de Operación';
                WITH SIT_OPERACION DO
                BEGIN
                  Size := 2;
                  Caption := 'Situación';
                  UseCombo := True;

                  ComboLista.Add('Activa'); ComboDatos.Add('AC');
                  ComboLista.Add('Inactiva'); ComboDatos.Add('IN');
                END;
      B_OPE_LIDE :=CreaCampo('B_OPE_LIDE',ftString,tsNinguno,tsNinguno,True);
                B_OPE_LIDE.Caption:='¿Opera LIDE?';
      B_COBRA_LIDE :=CreaCampo('B_COBRA_LIDE',ftString,tsNinguno,tsNinguno,True);
                B_COBRA_LIDE.Caption:='¿Cobra LIDE?';
      CVE_AF_LIDE :=CreaCampo('CVE_AF_LIDE',ftString,tsNinguno,tsNinguno,True);
                CVE_AF_LIDE.Caption:='¿Clave Afecta LIDE?';
                WITH CVE_AF_LIDE DO
                BEGIN
                  Size := 1;
                  Caption := 'Clave';
                  UseCombo := True;

                  ComboLista.Add('Incrementa'); ComboDatos.Add('I');
                  ComboLista.Add('Decrementa'); ComboDatos.Add('D');
                  ComboLista.Add('No Aplica');       ComboDatos.Add('N');
                END;
      CVE_TIPO_REST :=CreaCampo('CVE_TIPO_REST',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_REST.Caption:='Clave de Tipo Rest';
      FKeyFields.Add('CVE_OPERACION');
      {
        B_AFE_IMP_COM
        B_AFE_IMP_IVA
      }
      B_AFE_IMP_COM :=CreaCampo('B_AFE_IMP_COM',ftString,tsNinguno,tsNinguno,True);
                B_AFE_IMP_COM.Caption:='¿Afecta Importe Comisión?';
      B_AFE_IMP_IVA :=CreaCampo('B_AFE_IMP_IVA',ftString,tsNinguno,tsNinguno,True);
                B_AFE_IMP_IVA.Caption:='¿Afecta Importe IVA?';

      CVE_CANAL :=CreaCampo('CVE_CANAL',ftFloat,tsNinguno,tsNinguno,True);
                CVE_CANAL.Caption:='Clave de Canal';

      InstMon                  := TLdiInsMn.create(self);
      InstMon.MasterSource:= self;
      InstMon.CVE_INST_MON.MasterField:='CVE_INST_MON';

      Medio := TMedio.create(self);
      Medio.MasterSource:= self;
      Medio.CVE_MEDIO.MasterField:='CVE_MEDIO';

      Canal := TDvCanaR24.create(self);
      Canal.MasterSource:= self;
      Canal.CVE_CANAL.MasterField:='CVE_CANAL';

      TableName := 'DV_OPERACION'; 
      UseQuery := True;
      HelpFile := 'IntDvOperaci.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TDvOperaci.Destroy;
begin inherited;
end;


function TDvOperaci.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDvOperacion;
begin
   W:=TWDvOperacion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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


Function TDvOperaci.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
//      T := CreaBuscador('IDvOpera.it','S');
      T := CreaBuscador('IDvOperaC.it','S');

      Try if Active then begin T.Param(0,CVE_OPERACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TDvOperaci.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA DV_OPERACION********************)
(*                                                                              *)
(*  FORMA DE DV_OPERACION                                                            *)
(*                                                                              *)
(***********************************************FORMA DV_OPERACION********************)

procedure TWDvOperacion.FormShow(Sender: TObject);
begin
        (* ACME   AQUI SE LIGAN LOS CAMPOS  A SUS CONTROLES   *)
      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      //edCVE_OPERACION.Hint     := '1';
      Objeto.B_AF_IMP_CHEQUE.Control:=chB_AF_IMP_CHEQUE;
      //chB_AF_IMP_CHEQUE.Hint   := '2';
      Objeto.B_AF_SDO_PROM.Control:=chB_AF_SDO_PROM;
      //chB_AF_SDO_PROM.Hint     := '3';
      Objeto.B_AF_SIT_CHEQUE.Control:=chB_AF_SIT_CHEQUE;
      //chB_AF_SIT_CHEQUE.Hint   := '4';
      Objeto.B_CHK_SOBR.Control:=chB_CHK_SOBR;
      //chB_CHK_SOBR.Hint        := '5';
      Objeto.B_GEN_CTRACTA.Control:=chB_GEN_CTRACTA;
      //chB_GEN_CTRACTA.Hint     := '6';
      Objeto.B_MUESTRA_EDOCTA.Control:=chB_MUESTRA_EDOCTA;
      //chB_MUESTRA_EDOCTA.Hint  := '7';
      Objeto.CVE_AF_IMP_ABO.Control:=cbCVE_AF_IMP_ABO;
      //cbCVE_AF_IMP_ABO.Hint    := '8';
      Objeto.CVE_AF_IMP_CAR.Control:=cbCVE_AF_IMP_CAR;
      //edCVE_AF_IMP_CAR.Hint    := '9';
      Objeto.CVE_AF_IMP_CHQ.Control:=cbCVE_AF_IMP_CHQ;
      //edCVE_AF_IMP_CHQ.Hint    := '10';
      Objeto.CVE_AF_IMP_COM.Control:=cbCVE_AF_IMP_COM;
      //edCVE_AF_IMP_COM.Hint    := '11';
      Objeto.CVE_AF_IMP_INT.Control:=cbCVE_AF_IMP_INT;
      //edCVE_AF_IMP_INT.Hint    := '12';
      Objeto.CVE_AF_IMP_ISR.Control:=cbCVE_AF_IMP_ISR;
      //edCVE_AF_IMP_ISR.Hint    := '13';
      Objeto.CVE_AF_IMP_IVA.Control:=cbCVE_AF_IMP_IVA;
      //edCVE_AF_IMP_IVA.Hint    := '14';
      Objeto.CVE_AF_IMP_TRANS.Control:=cbCVE_AF_IMP_TRANS;
      //edCVE_AF_IMP_TRANS.Hint  := '15';
      Objeto.CVE_AF_NUM_ABO.Control:=cbCVE_AF_NUM_ABO;
      //edCVE_AF_NUM_ABO.Hint    := '16';
      Objeto.CVE_AF_NUM_CAR.Control:=cbCVE_AF_NUM_CAR;
      //edCVE_AF_NUM_CAR.Hint    := '17';
      Objeto.CVE_AF_NUM_CH_DV.Control:=cbCVE_AF_NUM_CH_DV;
      //edCVE_AF_NUM_CH_DV.Hint  := '18';
      Objeto.CVE_AF_NUM_CHQ.Control:=cbCVE_AF_NUM_CHQ;
      //edCVE_AF_NUM_CHQ.Hint    := '19';
      Objeto.CVE_AF_NUM_COM.Control:=cbCVE_AF_NUM_COM;
      //edCVE_AF_NUM_COM.Hint    := '20';
      Objeto.CVE_AF_NUM_TRANS.Control:=cbCVE_AF_NUM_TRANS;
      //edCVE_AF_NUM_TRANS.Hint  := '21';
      Objeto.CVE_AF_SDO_BLOQ.Control:=cbCVE_AF_SDO_BLOQ;
      //edCVE_AF_SDO_BLOQ.Hint   := '22';
      Objeto.CVE_AF_SDO_COMP.Control:=cbCVE_AF_SDO_COMP;
      //edCVE_AF_SDO_COMP.Hint   := '23';
      Objeto.CVE_AF_SDO_DNC.Control:=cbCVE_AF_SDO_DNC;
      //edCVE_AF_SDO_DNC.Hint    := '24';
      Objeto.CVE_AF_SDO_EFE.Control:=cbCVE_AF_SDO_EFE;
      //edCVE_AF_SDO_EFE.Hint    := '25';
      Objeto.CVE_AF_SDO_PROM.Control:=cbCVE_AF_SDO_PROM;
      //edCVE_AF_SDO_PROM.Hint   := '26';
      Objeto.CVE_AF_SDO_REM.Control:=cbCVE_AF_SDO_REM;
      //edCVE_AF_SDO_REM.Hint    := '27';
      Objeto.CVE_AF_SDO_SBC.Control:=cbCVE_AF_SDO_SBC;
      //edCVE_AF_SDO_SBC.Hint    := '28';
      Objeto.CVE_AF_SDO_DEUD.Control:=cbCVE_AF_SDO_DEUD;
      //edCVE_AF_SDO_DEUD.Hint   := '29';
      Objeto.CVE_MEDIO.Control:=edCVE_MEDIO;
      //edCVE_MEDIO.Hint         := '30';
      Objeto.CVE_OPER_CTRACTA.Control:=edCVE_OPER_CTRACTA;
      //edCVE_OPER_CTRACTA.Hint  := '31';
      Objeto.CVE_OPER_SOBR.Control:=edCVE_OPER_SOBR;
      //edCVE_OPER_SOBR.Hint     := '32';
      Objeto.CVE_TOPER_CONTAB.Control:=edCVE_TOPER_CONTAB;
      //edCVE_TOPER_CONTAB.Hint  := '33';
      Objeto.DESC_C_ID_PRIM.Control:=edDESC_C_ID_PRIM;
      //edDESC_C_ID_PRIM.Hint    := '34';
      Objeto.DESC_L_ID_PRIM.Control:=edDESC_L_ID_PRIM;
      //edDESC_L_ID_PRIM.Hint    := '35';
      Objeto.ID_CONTR_CTRACTA.Control:=edID_CONTR_CTRACTA;
      //edID_CONTR_CTRACTA.Hint  := '36';
      Objeto.CVE_AF_SDO_SGIRO.Control:=cbCVE_AF_SDO_SGIRO;
      //edCVE_AF_SDO_SGIRO.Hint  := '37';
      Objeto.B_APL_TESOR.Control:=chB_APL_TESOR;
      //chB_APL_TESOR.Hint       := '38';
      Objeto.IMP_COMISION.Control:=edIMP_COMISION;
      //edIMP_COMISION.Hint      := '39';
      Objeto.B_APL_TESOR_IFS.Control:=chB_APL_TESOR_IFS;
      //chB_APL_TESOR_IFS.Hint   := '40';
      Objeto.CVE_OPER_CANCEL.Control:=edCVE_OPER_CANCEL;
      //edCVE_OPER_CANCEL.Hint   := '41';
      Objeto.DESC_C_ID_SEC.Control:=edDESC_C_ID_SEC;
      //edDESC_C_ID_SEC.Hint     := '42';
      Objeto.DESC_L_ID_SEC.Control:=edDESC_L_ID_SEC;
      //edDESC_L_ID_SEC.Hint     := '43';
      Objeto.B_INF_FISCAL.Control:=chB_INF_FISCAL;
      //chB_INF_FISCAL.Hint      := '44';
      Objeto.B_REPORTE_SITI.Control:=chB_REPORTE_SITI;
      //chB_REPORTE_SITI.Hint    := '45';
      Objeto.CVE_INST_MON.Control:=edCVE_INST_MON;
      //edCVE_INST_MON.Hint      := '46';
      Objeto.CVE_CONTAB_OPER.Control:=edCVE_CONTAB_OPER;
      //edCVE_CONTAB_OPER.Hint   := '47';
      Objeto.B_AUDITORIA.Control:=chB_AUDITORIA;
      //chB_AUDITORIA.Hint       := '48';
      Objeto.B_SOBREGIRO.Control:=chB_SOBREGIRO;
      //chB_SOBREGIRO.Hint       := '49';
      Objeto.B_OPER_INET.Control:=chB_OPER_INET;
      //chB_OPER_INET.Hint       := '50';
      Objeto.DESC_INET.Control:=edDESC_INET;
      //edDESC_INET.Hint         := '51';
      Objeto.SIT_OPERACION.Control:=cbSIT_OPERACION;
      //edSIT_OPERACION.Hint     := '52';
      Objeto.B_OPE_LIDE.Control:=chB_OPE_LIDE;
      //chB_OPE_LIDE.Hint        := '53';
      Objeto.B_COBRA_LIDE.Control:=chB_COBRA_LIDE;
      //chB_COBRA_LIDE.Hint      := '54';
      Objeto.CVE_AF_LIDE.Control:=cbCVE_AF_LIDE;
      //edCVE_AF_LIDE.Hint       := '55';
      Objeto.CVE_TIPO_REST.Control:=edCVE_TIPO_REST;
      //edCVE_TIPO_REST.Hint     := '56';
      Objeto.B_AFE_IMP_COM.Control:=chB_AFE_COM;
      //chB_OPE_LIDE.Hint        := '57';
      Objeto.B_AFE_IMP_IVA.Control:=chB_AFE_IVA;
      //chB_COBRA_LIDE.Hint      := '58';

      Objeto.CVE_CANAL.Control := edCveCanal;   
      Objeto.Canal.CVE_CANAL.Control := edCveCanal;
            
end;

procedure TWDvOperacion.FormDestroy(Sender: TObject);
begin
 (* ACME   AQUI SE DESTRUYEN LOS CAMPOS  *)
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.B_AF_IMP_CHEQUE.Control:=nil;
      Objeto.B_AF_SDO_PROM.Control:=nil;
      Objeto.B_AF_SIT_CHEQUE.Control:=nil;
      Objeto.B_CHK_SOBR.Control:=nil;
      Objeto.B_GEN_CTRACTA.Control:=nil;
      Objeto.B_MUESTRA_EDOCTA.Control:=nil;
      Objeto.CVE_AF_IMP_ABO.Control:=nil;
      Objeto.CVE_AF_IMP_CAR.Control:=nil;
      Objeto.CVE_AF_IMP_CHQ.Control:=nil;
      Objeto.CVE_AF_IMP_COM.Control:=nil;
      Objeto.CVE_AF_IMP_INT.Control:=nil;
      Objeto.CVE_AF_IMP_ISR.Control:=nil;
      Objeto.CVE_AF_IMP_IVA.Control:=nil;
      Objeto.CVE_AF_IMP_TRANS.Control:=nil;
      Objeto.CVE_AF_NUM_ABO.Control:=nil;
      Objeto.CVE_AF_NUM_CAR.Control:=nil;
      Objeto.CVE_AF_NUM_CH_DV.Control:=nil;
      Objeto.CVE_AF_NUM_CHQ.Control:=nil;
      Objeto.CVE_AF_NUM_COM.Control:=nil;
      Objeto.CVE_AF_NUM_TRANS.Control:=nil;
      Objeto.CVE_AF_SDO_BLOQ.Control:=nil;
      Objeto.CVE_AF_SDO_COMP.Control:=nil;
      Objeto.CVE_AF_SDO_DNC.Control:=nil;
      Objeto.CVE_AF_SDO_EFE.Control:=nil;
      Objeto.CVE_AF_SDO_PROM.Control:=nil;
      Objeto.CVE_AF_SDO_REM.Control:=nil;
      Objeto.CVE_AF_SDO_SBC.Control:=nil;
      Objeto.CVE_AF_SDO_DEUD.Control:=nil;
      Objeto.CVE_MEDIO.Control:=nil;
      Objeto.CVE_OPER_CTRACTA.Control:=nil;
      Objeto.CVE_OPER_SOBR.Control:=nil;
      Objeto.CVE_TOPER_CONTAB.Control:=nil;
      Objeto.DESC_C_ID_PRIM.Control:=nil;
      Objeto.DESC_L_ID_PRIM.Control:=nil;
      Objeto.ID_CONTR_CTRACTA.Control:=nil;
      Objeto.CVE_AF_SDO_SGIRO.Control:=nil;
      Objeto.B_APL_TESOR.Control:=nil;
      Objeto.IMP_COMISION.Control:=nil;
      Objeto.B_APL_TESOR_IFS.Control:=nil;
      Objeto.CVE_OPER_CANCEL.Control:=nil;
      Objeto.DESC_C_ID_SEC.Control:=nil;
      Objeto.DESC_L_ID_SEC.Control:=nil;
      Objeto.B_INF_FISCAL.Control:=nil;
      Objeto.B_REPORTE_SITI.Control:=nil;
      Objeto.CVE_INST_MON.Control:=nil;
      Objeto.CVE_CONTAB_OPER.Control:=nil;
      Objeto.B_AUDITORIA.Control:=nil;
      Objeto.B_SOBREGIRO.Control:=nil;
      Objeto.B_OPER_INET.Control:=nil;
      Objeto.DESC_INET.Control:=nil;
      Objeto.SIT_OPERACION.Control:=nil;
      Objeto.B_OPE_LIDE.Control:=nil;
      Objeto.B_COBRA_LIDE.Control:=nil;
      Objeto.CVE_AF_LIDE.Control:=nil;
      Objeto.CVE_TIPO_REST.Control:=nil;

      Objeto.B_AFE_IMP_COM.Control:=nil;
      Objeto.B_AFE_IMP_IVA.Control:=nil;

      Objeto.Canal.CVE_CANAL.Control := nil;
      Objeto.CVE_CANAL.Control    := nil;
   //Objeto
end;

procedure TWDvOperacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDvOperacion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWDvOperacion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWDvOperacion.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWDvOperacion.SpeedButton1Click(Sender: TObject);
Var
  vInst_Mone : String;
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVOPERACI_BTN0',true, true) THEN EXIT;

 
  if Objeto.InstMon.Busca then
  begin
  GetSQLStr(' SELECT CVE_INST_MON, DESC_INST_MON FROM LDIN_INST_MON '+
              ' WHERE CVE_INST_MON = ' + Quotedstr(Trim(edCVE_INST_MON.text)),
              Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_INST_MON',vInst_Mone,True);
  edDesc_InstMon.Text :=  vInst_Mone;
  end;

end;

procedure TWDvOperacion.edCVE_OPERACIONClick(Sender: TObject);
begin
  //ShowMessage(TComponent(Sender).Name + ' - ' + TEdit(Sender).Hint  );
end;

procedure TWDvOperacion.edCVE_TOPER_CONTABKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (not ( StrScan('0123456789',Key) <> nil )) and (Key <> #8 ) then
    Abort;
end;

procedure TWDvOperacion.edID_CONTR_CTRACTAKeyPress(Sender: TObject;
  var Key: Char);
begin
         if (not ( StrScan('0123456789',Key) <> nil )) and (Key <> #8 ) then
    Abort;
end;

procedure TWDvOperacion.edCVE_CONTAB_OPERKeyPress(Sender: TObject;
  var Key: Char);
begin
         if (not ( StrScan('0123456789',Key) <> nil )) and (Key <> #8 ) then
    Abort;
end;

procedure TWDvOperacion.iIdCVE_INST_MONCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWDvOperacion.SpeedButton2Click(Sender: TObject);
Var
  vMedio : String;
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVOPERACI_BTN1',true, true) THEN EXIT;

 
  if Objeto.Medio.Busca then
  begin
  GetSQLStr(' SELECT CVE_MEDIO, DESC_MEDIO  FROM MEDIO '+
              ' WHERE CVE_MEDIO = ' + Quotedstr(Trim(edCVE_MEDIO.text)),
              Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_MEDIO',vMedio,True);
  edDESC_MEDIO.Text :=  vMedio;
  end;

end;

procedure TWDvOperacion.IMedioCapture(Sender: TObject; var Show: Boolean);
begin
  Show := True;
end;

procedure TWDvOperacion.edCVE_MEDIOChange(Sender: TObject);
Var
  vMedio : String;
begin
  GetSQLStr(' SELECT CVE_MEDIO, DESC_MEDIO  FROM MEDIO '+
              ' WHERE CVE_MEDIO = ' + Quotedstr(Trim(edCVE_MEDIO.text)),
              Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_MEDIO',vMedio,True);
  edDESC_MEDIO.Text :=  vMedio;
end;

procedure TWDvOperacion.edCVE_INST_MONChange(Sender: TObject);
Var
  vInst_Mone : String;
begin
  GetSQLStr(' SELECT CVE_INST_MON, DESC_INST_MON FROM LDIN_INST_MON '+
              ' WHERE CVE_INST_MON = ' + Quotedstr(Trim(edCVE_INST_MON.text)),
              Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_INST_MON',vInst_Mone,True);
  edDesc_InstMon.Text :=  vInst_Mone;
end;

procedure TWDvOperacion.spbCanalClick(Sender: TObject);
Var
  vCanal  : String;
begin
  if Objeto.Canal.Busca then
  begin
    GetSQLStr(' SELECT DESC_CANAL FROM DV_CANAL_R24 '+
                ' WHERE CVE_CANAL = ' + Quotedstr(Trim(edCveCanal.text)),
                Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_CANAL',vCanal,True);
    edDesCanal.Text :=  vCanal;
  end;

end;



procedure TWDvOperacion.edCveCanalChange(Sender: TObject);
Var
  vCanal  : String;
begin
  GetSQLStr(' SELECT DESC_CANAL FROM DV_CANAL_R24 '+
              ' WHERE CVE_CANAL = ' + Quotedstr(Trim(edCveCanal.text)),
              Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_CANAL',vCanal,True);
  edDesCanal.Text :=  vCanal;
end;

procedure TWDvOperacion.iIdCVE_CANALCapture(Sender: TObject;
  var Show: Boolean);
begin
Show := True;
end;


procedure TWDvOperacion.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
Var
  vlAutoriza      : Integer;
begin
  Realizado       := True;

  If (BAutorizaPLD) Then Begin
      //Se verifica si el perfil tiene permisos para autorizar las claves de Operacion para DpVista
      //Esto se agrega para usuarios de PLD
      GetSQLInt('SELECT NVL(MAX(1),0) Autoriza FROM PLD_CATALOGOS '+
                ' WHERE CATALOGO = ''PERFILAUTDV'' '+
                '   AND SIT_CLAVE = ''AC'' ' +
                '   AND CLAVE_NUMERICA = ' +  InttoStr(Objeto.Apli.CvePerfil),
                Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'Autoriza',vlAutoriza,True);
      If (vlAutoriza > 0) Then Begin
        Objeto.SIT_OPERACION.AsString := 'AC';
        Realizado  := True;
      end
      Else Begin
        InterMsg(tmInformacion,'',0,'La clave de Operación requiere el VoBo de PLD y FT' +
                                    CHR(10) + CHR(10) +
                                    'Quedará como Inactiva ...');
        Objeto.SIT_OPERACION.AsString := 'IN';
        Realizado  := True;
      End;
  End;
end;

procedure TWDvOperacion.InterForma1DespuesShow(Sender: TObject);
Var
  vlAutoriza      : Integer;
begin
      Interforma1.BtnAyuda.Caption := 'Bitacora';
      Interforma1.BtnImprimir.Caption := 'Autorizar PLD';
      GetSQLInt('SELECT NVL(MAX(1),0) Autoriza FROM PLD_CATALOGOS '+
                ' WHERE CATALOGO = ''PERFILAUTDV'' '+
                '   AND SIT_CLAVE = ''AC'' ' +
                '   AND CLAVE_NUMERICA = ' +  InttoStr(Objeto.Apli.CvePerfil),
                Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'Autoriza',vlAutoriza,True);
      If (vlAutoriza > 0) Then Begin
        Interforma1.BtnImprimir.Visible := True;
      end
      Else Begin
        Interforma1.BtnImprimir.Visible := False;
      End;
end;

procedure TWDvOperacion.InterForma1BtnImprimirClick(Sender: TObject);
Var
  vlUpdate        : String;
begin
  If (BAutorizaPLD) Then Begin
     vlUpdate := 'Update DV_OPERACION ' +
                 '   Set SIT_OPERACION = ''AC'' ' +
                 ' Where CVE_Operacion = ''' + Objeto.CVE_OPERACION.AsString + '''';
     RunSQL(vlUpdate,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     Objeto.Refresh;
     Objeto.FindKey([Objeto.CVE_OPERACION.AsString]);
     Objeto.Refresh;
     InterMsg(tmInformacion,'',0,'La clave de Operación Fue Aprobada por PLD y FT' +
                                 CHR(10) + CHR(10) +
                                 'Quedará como Activa ...');
  End
  Else Begin
     InterMsg(tmInformacion,'',0,'Esta clave de Operación No Requiere Ser Aprobada por PLD y FT' +
                                 CHR(10) + CHR(10) +
                                 'No Sufrirá Cambio Alguno ...');
  End;
end;

function TWDvOperacion.BAutorizaPLD() : Boolean;
Begin
   //PLD autorizará solo si se trata de una clave con un tipo de instrumento Efectivo
   If (Objeto.CVE_INST_MON.AsString = '01') Then
   Begin
      BAutorizaPLD := True;
   End
   Else Begin
      BAutorizaPLD := False;
   End;
End;


procedure TWDvOperacion.InterForma1BtnAyudaClick(Sender: TObject);
begin
  ShowCat(TBitDVOpe.Create(Self),Objeto.Apli)
end;

end.
