// Sistema         : Clase de TESO_CHEQUERA
// Fecha de Inicio : 12/05/1998
// Función forma   : Clase de TESO_CHEQUERA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Roberto Hugo Gochicoa Melendez
// Comentarios     :
Unit IntTesoChequ;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntMon, IntInter,
IntPzaCo, Ungene, IntTesSdoChe,
UnSegBtn;

Type
 TTesoChequ= class;

  TWTesoChequera=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    lbNUM_CHEQUE_INI: TLabel;
    lbNUM_CHEQUE_FIN: TLabel;
    lbNUM_CHEQUE_SIG: TLabel;
    lbNUM_TRANSITO: TLabel;
    edNUM_CHEQUE_INI: TInterEdit;
    edNUM_CHEQUE_FIN: TInterEdit;
    edNUM_CHEQUE_SIG: TInterEdit;
    GroupBox2: TGroupBox;
    lbH_APERTURA_OPER: TLabel;
    edH_APERTURA_OPER: TEdit;
    lbH_CIERRE_OPER: TLabel;
    edH_CIERRE_OPER: TEdit;
    GroupBox3: TGroupBox;
    lbCVE_DIA_LIQ_DCH: TLabel;
    chB_EMITE_DOCTO: TCheckBox;
    lbID_SOLICITUD: TLabel;
    edID_SOLICITUD: TInterEdit;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    lbCVE_SUC_BANCO: TLabel;
    edCVE_SUC_BANCO: TEdit;
    edNOM_SUC_BANCO: TEdit;
    lbID_BANCO_CHQRA: TLabel;
    edID_BANCO_CHQRA: TEdit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    lbID_PLAZA: TLabel;
    edID_PLAZA: TEdit;
    edNOM_PLAZA_BANCO: TEdit;
    GroupBox5: TGroupBox;
    lbCVE_CHEQRA: TLabel;
    edCVE_CHEQRA: TEdit;
    lbDESC_CHEQUERA: TLabel;
    edDESC_CHEQUERA: TEdit;
    edNombreBanco: TEdit;
    sbCveMoneda: TSpeedButton;
    edDescripcionMoneda: TEdit;
    sbBanco: TSpeedButton;
    cbSIT_CHEQUERA: TLabel;
    sbPzaComp: TSpeedButton;
    cbCVE_DIA_LIQ_DCH: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    edNUM_TRANSITO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbBancoClick(Sender: TObject);
    procedure sbCveMonedaClick(Sender: TObject);
    procedure sbPzaCompClick(Sender: TObject);
    procedure AsignaClaveTransito;
    function  ValidaFolios : Boolean;
    procedure edNUM_TRANSITOExit(Sender: TObject);
    procedure chB_EMITE_DOCTOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TTesoChequ;
end;
 TTesoChequ= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CHEQRA               : TInterCampo;
        B_EMITE_DOCTO            : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        CVE_DIA_LIQ_DCH          : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_SUC_BANCO            : TInterCampo;
        CVE_USUAR_ALTA           : TInterCampo;
        CVE_USUAR_BAJA           : TInterCampo;
        FH_ALTA                  : TInterCampo;
        FH_BAJA                  : TInterCampo;
        H_APERTURA_OPER          : TInterCampo;
        H_CIERRE_OPER            : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;
        ID_PLAZA                 : TInterCampo;
        ID_SOLICITUD             : TInterCampo;
        ID_TESORERIA             : TInterCampo;
        NOM_PLAZA_BANCO          : TInterCampo;
        NOM_SUC_BANCO            : TInterCampo;
        NUM_CHEQUE_FIN           : TInterCampo;
        NUM_CHEQUE_INI           : TInterCampo;
        NUM_CHEQUE_SIG           : TInterCampo;
        NUM_TRANSITO             : TInterCampo;
        SIT_CHEQUERA             : TInterCampo;
        DESC_CHEQUERA            : TInterCampo;

        Intermediario            : TIntermed;
        Moneda                   : TMoneda;
        PzaComp                  : TPzaComp;
        SaldoChequera            : TTesSdoChe;

        ParamTeso                : TInterFrame;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure   CambioSituacion(Sender: TObject);
        procedure   Post; override;
        procedure   Delete; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TTesoChequ.Create( AOwner : TComponent );
begin Inherited;
      CVE_CHEQRA :=CreaCampo('CVE_CHEQRA',ftString,tsNinguno,tsNinguno,True);
        CVE_CHEQRA .Size:=8;
                CVE_CHEQRA.Caption:='Clave de Cheqra';
      B_EMITE_DOCTO :=CreaCampo('B_EMITE_DOCTO',ftString,tsNinguno,tsNinguno,True);
        B_EMITE_DOCTO .Size:=1;
                B_EMITE_DOCTO.Caption:='Emite Docto';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
        CUENTA_BANCO .Size:=20;
                CUENTA_BANCO.Caption:='Cuenta Banco';
      CVE_DIA_LIQ_DCH :=CreaCampo('CVE_DIA_LIQ_DCH',ftString,tsNinguno,tsNinguno,True);
        With CVE_DIA_LIQ_DCH do
        begin Size:=4;
            UseCombo:=True;
            ComboLista.Add('Mismo Día'); ComboDatos.Add('D000');
            ComboLista.Add('Sig. Día');  ComboDatos.Add('D001');
        end;
                CVE_DIA_LIQ_DCH.Caption:='Clave de Dia Liq Dch';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      CVE_SUC_BANCO :=CreaCampo('CVE_SUC_BANCO',ftString,tsNinguno,tsNinguno,True);
        CVE_SUC_BANCO .Size:=4;
                CVE_SUC_BANCO.Caption:='Clave de Suc Banco';
      CVE_USUAR_ALTA :=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,True);
        CVE_USUAR_ALTA .Size:=8;
                CVE_USUAR_ALTA.Caption:='Clave de Usuario Alta';
      CVE_USUAR_BAJA :=CreaCampo('CVE_USUAR_BAJA',ftString,tsNinguno,tsNinguno,True);
        CVE_USUAR_BAJA .Size:=8;
                CVE_USUAR_BAJA.Caption:='Clave de Usuario Baja';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      FH_BAJA :=CreaCampo('FH_BAJA',ftDate,tsNinguno,tsNinguno,True);
                FH_BAJA.Caption:='Fecha y Hora Baja';
      H_APERTURA_OPER :=CreaCampo('H_APERTURA_OPER',ftFloat,tsNinguno,tsNinguno,True);
                H_APERTURA_OPER.Caption:='H Apertura Operación';
      H_CIERRE_OPER :=CreaCampo('H_CIERRE_OPER',ftFloat,tsNinguno,tsNinguno,True);
                H_CIERRE_OPER.Caption:='H Cierre Operación';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,True);
                ID_BANCO_CHQRA.Caption:='Número de Banco Chqra';
      ID_PLAZA :=CreaCampo('ID_PLAZA',ftString,tsNinguno,tsNinguno,True);
        ID_PLAZA .Size:=3;
                ID_PLAZA.Caption:='Número de Plaza';
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      ID_TESORERIA :=CreaCampo('ID_TESORERIA',ftFloat,tsNinguno,tsNinguno,True);
                ID_TESORERIA.Caption:='Número de Tesoreria';
      NOM_PLAZA_BANCO :=CreaCampo('NOM_PLAZA_BANCO',ftString,tsNinguno,tsNinguno,True);
                NOM_PLAZA_BANCO.Caption:='Nombre Plaza Banco';
      NOM_SUC_BANCO :=CreaCampo('NOM_SUC_BANCO',ftString,tsNinguno,tsNinguno,True);
                NOM_SUC_BANCO.Caption:='Nombre Suc Banco';
      NUM_CHEQUE_FIN :=CreaCampo('NUM_CHEQUE_FIN',ftFloat,tsNinguno,tsNinguno,True);
                NUM_CHEQUE_FIN.Caption:='Número Cheque Fin';
      NUM_CHEQUE_INI :=CreaCampo('NUM_CHEQUE_INI',ftFloat,tsNinguno,tsNinguno,True);
                NUM_CHEQUE_INI.Caption:='Número Cheque Ini';
      NUM_CHEQUE_SIG :=CreaCampo('NUM_CHEQUE_SIG',ftFloat,tsNinguno,tsNinguno,True);
                NUM_CHEQUE_SIG.Caption:='Número Cheque Sig';
      NUM_TRANSITO :=CreaCampo('NUM_TRANSITO',ftString,tsNinguno,tsNinguno,True);
        NUM_TRANSITO .Size:=9;
                NUM_TRANSITO.Caption:='Número Transito';
      SIT_CHEQUERA :=CreaCampo('SIT_CHEQUERA',ftString,tsNinguno,tsNinguno,True);
        With SIT_CHEQUERA do
        begin Size:=2;
             UseCombo:=True;
             ComboLista.Add('Activa');    ComboDatos.Add('AC');
             ComboLista.Add('Cancelada'); ComboDatos.Add('CA');
        end;
                SIT_CHEQUERA.Caption:='Situación Chequera';
      DESC_CHEQUERA :=CreaCampo('DESC_CHEQUERA',ftString,tsNinguno,tsNinguno,True);
                DESC_CHEQUERA.Caption:='Descripción Chequera';
      FKeyFields.Add('CVE_CHEQRA');

      TableName := 'TESO_CHEQUERA';
      UseQuery := True;
      HelpFile := 'IntTesoChequ.Hlp';
      ShowMenuReporte:=True;

   // Creación de objetos adicionales

      Intermediario := TIntermed.Create(Self);
      Intermediario.MasterSource:= self;
      Intermediario.ID_INTERMEDIARIO.MasterField := 'ID_BANCO_CHQRA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.Cve_Moneda.MasterField:='CVE_MONEDA';

      PzaComp := TPzaComp.Create(Self);
      PzaComp.MasterSource:= self;
      PzaComp.ID_PLAZA.MasterField := 'ID_PLAZA';

      SaldoChequera := TTesSdoChe.Create(Self);
      SaldoChequera.MasterSource:=self;

      SIT_CHEQUERA.OnChange:=CambioSituacion;
end;

Destructor TTesoChequ.Destroy;
begin
  if Intermediario <> nil then
     Intermediario.Free;
  if Moneda <> nil then
     Moneda.Free;
  if PzaComp <> nil then
     PzaComp.Free;
  if SaldoChequera <> nil then
     SaldoChequera.Free;
  inherited;
end;


function TTesoChequ.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTesoChequera;
begin
   W:=TWTesoChequera.Create(Self);
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


Function TTesoChequ.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ITesChe.it','S');
      Try if Active then begin T.Param(0,CVE_CHEQRA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

procedure   TTesoChequ.CambioSituacion(Sender: TObject);
begin
  If (SIT_CHEQUERA.Control<>nil) and (SIT_CHEQUERA.Control is TLabel) then
     TLabel(SIT_CHEQUERA.Control).Caption:=SIT_CHEQUERA.AsCombo;
end;

procedure TTesoChequ.Post;
var vlModo : TModo;
begin

    vlModo := modo;

    inherited;

    if vlModo = moappend then
    begin
      SaldoChequera.Append;

       SaldoChequera.CVE_CHEQRA.AsString     := CVE_CHEQRA.AsString;
       SaldoChequera.F_OPERACION.AsDateTime  := Apli.DameFechaEmpresa;
       SaldoChequera.IMP_DEP_VIRT.AsFloat    := 0;
       SaldoChequera.IMP_DEPOSITO.AsFloat    := 0;
       SaldoChequera.IMP_RETIRO.AsFloat      := 0;
       SaldoChequera.IMP_RETIRO_VIRT.AsFloat := 0;
       SaldoChequera.SDO_FLOATING.AsFloat    := 0;
       SaldoChequera.SDO_INICIAL_BCO.AsFloat := 0;
       SaldoChequera.SDO_INICIAL_CALC.AsFloat:= 0;

       SaldoChequera.Post;
    end;
end;

procedure TTesoChequ.Delete;
begin
   Edit;
   SIT_CHEQUERA.AsString := 'CA';
   Post;
end;

function TTesoChequ.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA TESO_CHEQUERA********************)
(*                                                                              *)
(*  FORMA DE TESO_CHEQUERA                                                            *)
(*                                                                              *)
(***********************************************FORMA TESO_CHEQUERA********************)

procedure TWTesoChequera.FormShow(Sender: TObject);
begin
      Objeto.ParamTeso.FieldByName('NOMBRE_TESO').Control:=Label1;

      // Asigna controles al intermediario
      Objeto.Intermediario.Persona.Nombre.Control:=edNombreBanco;
      Objeto.Intermediario.MasterSourceEditControl:=sbBanco;
      // Asigna controles a la moneda
      Objeto.Moneda.Desc_Moneda.Control:=edDescripcionMoneda;
      Objeto.Moneda.MasterSourceEditControl:=sbCveMoneda;
      // Asigna controles a la plaza de compensación
      Objeto.PzaComp.Nom_Plaza.Control:=edNOM_PLAZA_BANCO;
      Objeto.PzaComp.MasterSourceEditControl:=sbPzaComp;

      Objeto.CVE_CHEQRA.Control:=edCVE_CHEQRA;
      Objeto.B_EMITE_DOCTO.Control:=chB_EMITE_DOCTO;
      Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
      Objeto.CVE_DIA_LIQ_DCH.Control:=cbCVE_DIA_LIQ_DCH;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_SUC_BANCO.Control:=edCVE_SUC_BANCO;
//      Objeto.CVE_USUAR_ALTA.Control:=edCVE_USUAR_ALTA;
//      Objeto.CVE_USUAR_BAJA.Control:=edCVE_USUAR_BAJA;
//      Objeto.FH_ALTA.Control:=edFH_ALTA;
//      Objeto.FH_BAJA.Control:=edFH_BAJA;
      Objeto.H_APERTURA_OPER.Control:=edH_APERTURA_OPER;
      Objeto.H_CIERRE_OPER.Control:=edH_CIERRE_OPER;
      Objeto.ID_BANCO_CHQRA.Control:=edID_BANCO_CHQRA;
      Objeto.ID_PLAZA.Control:=edID_PLAZA;
      Objeto.ID_SOLICITUD.Control:=edID_SOLICITUD;
//      Objeto.ID_TESORERIA.Control:=edID_TESORERIA;
      Objeto.NOM_PLAZA_BANCO.Control:=edNOM_PLAZA_BANCO;
      Objeto.NOM_SUC_BANCO.Control:=edNOM_SUC_BANCO;
      Objeto.NUM_CHEQUE_FIN.Control:=edNUM_CHEQUE_FIN;
      Objeto.NUM_CHEQUE_INI.Control:=edNUM_CHEQUE_INI;
      Objeto.NUM_CHEQUE_SIG.Control:=edNUM_CHEQUE_SIG;
      Objeto.NUM_TRANSITO.Control:=edNUM_TRANSITO;
      Objeto.SIT_CHEQUERA.Control:=cbSIT_CHEQUERA;
      Objeto.DESC_CHEQUERA.Control:=edDESC_CHEQUERA;
end;

procedure TWTesoChequera.FormDestroy(Sender: TObject);
begin

      Try
        Objeto.ParamTeso.FieldByName('NOMBRE_TESO').Control:=nil;
      Except
      end;  
      // Desasigna controles del objeto intermediario
      Objeto.Intermediario.Persona.Nombre.Control:=nil;
      Objeto.Intermediario.MasterSourceEditControl:=nil;

      // Desasigna controles del objeto moneda
      Objeto.Moneda.Desc_Moneda.Control:=nil;
      Objeto.Moneda.MasterSourceEditControl:=nil;

      // Desasigna controles del objeto plaza compensación
      Objeto.PzaComp.Nom_Plaza.Control:=nil;
      Objeto.PzaComp.MasterSourceEditControl:=nil;

      Objeto.CVE_CHEQRA.Control:=nil;
      Objeto.B_EMITE_DOCTO.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
      Objeto.CVE_DIA_LIQ_DCH.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_SUC_BANCO.Control:=nil;
//      Objeto.CVE_USUAR_ALTA.Control:=nil;
//      Objeto.CVE_USUAR_BAJA.Control:=nil;
//      Objeto.FH_ALTA.Control:=nil;
//      Objeto.FH_BAJA.Control:=nil;
      Objeto.H_APERTURA_OPER.Control:=nil;
      Objeto.H_CIERRE_OPER.Control:=nil;
      Objeto.ID_BANCO_CHQRA.Control:=nil;
      Objeto.ID_PLAZA.Control:=nil;
      Objeto.ID_SOLICITUD.Control:=nil;
//      Objeto.ID_TESORERIA.Control:=nil;
      Objeto.NOM_PLAZA_BANCO.Control:=nil;
      Objeto.NOM_SUC_BANCO.Control:=nil;
      Objeto.NUM_CHEQUE_FIN.Control:=nil;
      Objeto.NUM_CHEQUE_INI.Control:=nil;
      Objeto.NUM_CHEQUE_SIG.Control:=nil;
      Objeto.NUM_TRANSITO.Control:=nil;
      Objeto.SIT_CHEQUERA.Control:=nil;
      Objeto.DESC_CHEQUERA.Control:=nil;
   //Objeto
end;

procedure TWTesoChequera.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTesoChequera.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
    // Inicia valores para nueva chequera

    Objeto.ID_TESORERIA.AsInteger:= Objeto.ParamTeso.FieldByName('ID_TESORERIA').AsInteger;
    Objeto.Moneda.FindKey([Objeto.ParamTeso.FieldByName('CVE_MONEDA_BASE').AsSQL]);
    Objeto.SIT_CHEQUERA.AsString := 'AC';
    Objeto.CVE_USUAR_ALTA.AsString := Objeto.ParamTeso.FieldByName('CVE_USUARIO').AsString;
    Objeto.FH_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
    Objeto.NUM_CHEQUE_FIN.AsInteger := 0;
    Objeto.NUM_CHEQUE_INI.AsInteger := 0;
    Objeto.NUM_CHEQUE_SIG.AsInteger := 0;
    Objeto.NUM_TRANSITO.AsInteger   := 0;
    Objeto.ID_SOLICITUD.AsInteger   := 0;
    cbCVE_DIA_LIQ_DCH.ItemIndex := 0;
    AsignaClaveTransito;
    edCVE_CHEQRA.SetFocus;
end;

procedure TWTesoChequera.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWTesoChequera.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure  TWTesoChequera.AsignaClaveTransito;
begin
  Objeto.GetFromControl;
  if Objeto.CVE_MONEDA.AsInteger   = 484 then
     Objeto.NUM_TRANSITO.AsString := '51'
  else
     Objeto.NUM_TRANSITO.AsString := '70';
end;

function TWTesoChequera.ValidaFolios : Boolean;
begin
   Objeto.GetFromControl;
   ValidaFolios := True;
   if (Objeto.B_EMITE_DOCTO.AsString = 'F')                               and
      (Objeto.NUM_CHEQUE_FIN.AsInteger < Objeto.NUM_CHEQUE_INI.AsInteger) then
   begin
      ValidaFolios := False;
   end;
end;

procedure TWTesoChequera.sbBancoClick(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOCHEQU_BTN1',true, true) THEN EXIT;

  Objeto.Intermediario.BuscaWhereString:= '((CVE_TIPO_INTERM = ''BA'') OR (CVE_TIPO_INTERM = ''AF''))';
  Objeto.Intermediario.Busca;
end;

procedure TWTesoChequera.sbCveMonedaClick(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOCHEQU_BTN0',true, true) THEN EXIT;

  Objeto.GetFromControl;
  if Objeto.Moneda.Busca then
  begin
    AsignaClaveTransito;
  end;
end;

procedure TWTesoChequera.sbPzaCompClick(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOCHEQU_BTN2',true, true) THEN EXIT;

   Objeto.GetFromControl;
   if Objeto.PzaComp.Busca then
   begin
      Objeto.NUM_TRANSITO.AsString := Objeto.NUM_TRANSITO.AsString +
                                      IntToStr(Objeto.ID_PLAZA.AsInteger);
   end;
end;

procedure TWTesoChequera.edNUM_TRANSITOExit(Sender: TObject);
var vlNumBanco : String;
    vlCtaBanco : Double;
begin
    Objeto.GetFromControl;
    vlNumBanco := Copy(Objeto.NUM_TRANSITO.AsString,6,3);
    Objeto.NUM_TRANSITO.AsString := Copy(Objeto.NUM_TRANSITO.AsString,1,8) +
                       IntToStr(Digito_Verif_Intcam(vlNumBanco,Objeto.CUENTA_BANCO.AsFloat));
end;

procedure TWTesoChequera.chB_EMITE_DOCTOExit(Sender: TObject);
begin
 if not ValidaFolios then
    Raise EInterFrame.Create('Folios Incorrectos.  Verifique ...');


end;

procedure TWTesoChequera.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if not ValidaFolios then
      Raise EInterFrame.Create('Folios Incorrectos.  Verifique ...');
end;

end.
