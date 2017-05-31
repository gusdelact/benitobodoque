// Sistema         : Clase de CrCamTasM
// Fecha de Inicio : 24/10/2013
// Función forma   : Clase de CrCamTasM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCamTasM;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
//UNIDADES ADICONALES
IntParamCre,
IntGenCre,
IntCrCto,
IntBasicCred,
IntTasIndFin
;
Type
 TCrCamTasM= class; 

  TWCrCamTasM=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    Label1: TLabel;
    edCVE_TAS_REF: TEdit;
    edDESC_TASA_REFER: TEdit;
    Label9: TLabel;
    edSOBRETASA: TEdit;
    GroupBox2: TGroupBox;
    ilTASA_REFER: TInterLinkit;
    edFOL_CAMBIO: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edF_APLICACION: TEdit;
    dtpF_APLICACION: TInterDateTimePicker;
    edNUM_PERIODO: TInterEdit;
    Label6: TLabel;
    lbCVE_TASA_REFER: TLabel;
    edCVE_TAS_REF_NVA: TEdit;
    btTASA_REFER: TBitBtn;
    Label7: TLabel;
    edSOBRETASA_NVA: TInterEdit;
    chB_APL_SIG_PER: TCheckBox;
    lbSITUACION: TLabel;
    lbSIT_CAMBIO: TLabel;
    btAUTORIZA: TBitBtn;
    btCANCELA: TBitBtn;
    GroupBox3: TGroupBox;
    lbUSUA_ALTA: TLabel;
    lbF_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    edFH_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_MODIF: TLabel;
    edCVE_USUA_MODIF: TEdit;
    edFH_MODIF: TEdit;
    lbUSUA_AUTOR: TLabel;
    edCVE_USUA_AUTOR: TEdit;
    lbF_AUTOR: TLabel;
    edF_AUTOR: TEdit;
    Label2: TLabel;
    edCVE_USUA_CANCELA: TEdit;
    Label3: TLabel;
    edFH_CANCELA: TEdit;
    Label8: TLabel;
    edCVE_TAS_REF_ANT: TEdit;
    Label10: TLabel;
    edSOBRETASA_ANT: TInterEdit;
    MsgPanel: TPanel;
    lbSit_Per_Interes: TLabel;
    Label32: TLabel;
    Label11: TLabel;
    chB_REINICIA_PER: TCheckBox;
    lbOPERADOR_STASA: TLabel;
    cbOPERADOR_STASA: TEdit;
    Label12: TLabel;
    edVariacionTasa: TInterEdit;
    rgB_APL_PCT_VARIA: TRadioGroup;
    lbCVE_CALCULO: TLabel;
    edDESC_CALC_INT: TEdit;
    edCVE_CALCULO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edF_APLICACIONExit(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure edCVE_TAS_REF_NVAExit(Sender: TObject);
    procedure chB_APL_SIG_PERExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edF_APLICACIONEnter(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure chB_REINICIA_PERExit(Sender: TObject);
    procedure cbOPERADOR_STASAKeyPress(Sender: TObject; var Key: Char);
    procedure cbOPERADOR_STASAExit(Sender: TObject);
    procedure edVariacionTasaExit(Sender: TObject);
    procedure rgB_APL_PCT_VARIAExit(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
      vlAutCamTas  : Boolean;
      vlCanCamTas  : Boolean;

      Procedure DeshabilitaBotones;
      Function ValidaExistePago:Boolean;
      Function ValCambiosPosCan:Boolean;
      Function ValidaTraspVenc:Boolean;
      Function ValCambiosPosteriores:Boolean;
      Procedure ValidaUsuario;
    public
    { Public declarations }
    Objeto : TCrCamTasM;
end;
 TCrCamTasM= class(TInterFrame)
      private
        fCurrentValue  : Double;
        fCurrentDate   : TDate;
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgCredito                : String;

        ID_CREDITO               : TInterCampo;
        FOL_CAMBIO               : TInterCampo;
        F_APLICACION             : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        SOBRETASA_ANT            : TInterCampo;
        CVE_TAS_REF_ANT          : TInterCampo;
        SOBRETASA_NVA            : TInterCampo;
        CVE_TAS_REF_NVA          : TInterCampo;
        B_APL_PCT_VARIA          : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        VARIACION_STASA          : TInterCampo;
        B_APL_SIG_PER            : TInterCampo;
        B_REINICIA_PER           : TInterCampo;
        SIT_CAMBIO               : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_AUTORIZA               : TInterCampo;
        FH_AUTORIZA              : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        FH_CANCELA               : TInterCampo;
        CVE_USU_CANCELA          : TInterCampo;

        //CLASES ADICIONALES
        ParamCre                 : TParamCre;
        BasicCred                : TBasicCred;
        ContratoCre              : TCrCto;
        TasaRefer                : TTasIndFin;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure   setCurrentDate( Sender: TInterCampo );
        function    getCurrentDate: TDate;
        Function    StpAutoriza: Boolean;
        Function    StpCancela : Boolean;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCamTasM.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO   :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CREDITO.Caption:='Id Disposición';
      FOL_CAMBIO   :=CreaCampo('FOL_CAMBIO',ftFloat,tsNinguno,tsNinguno,True);
      FOL_CAMBIO.Caption:='Folio';
      F_APLICACION := CreaCampo('F_APLICACION',ftDate,tsNinguno,tsNinguno,True);
      F_APLICACION.Caption:='Fecha Aplicación';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
      NUM_PERIODO.Caption:='Núm. Periodo';
      SOBRETASA_ANT :=CreaCampo('SOBRETASA_ANT',ftFloat,tsNinguno,tsNinguno,True);
      SOBRETASA_ANT.Caption:='Sobretasa Anterior';
      CVE_TAS_REF_ANT:=CreaCampo('CVE_TAS_REF_ANT',ftString,tsNinguno,tsNinguno,True);
      CVE_TAS_REF_ANT.Caption:='Tasa Ref. Anterior';
      SOBRETASA_NVA :=CreaCampo('SOBRETASA_NVA',ftFloat,tsNinguno,tsNinguno,True);
      SOBRETASA_NVA.Caption:='Sobretasa Nueva';
      CVE_TAS_REF_NVA:=CreaCampo('CVE_TAS_REF_NVA',ftString,tsNinguno,tsNinguno,True);
      CVE_TAS_REF_NVA.Caption:='Tasa Ref. Nueva';
      B_APL_PCT_VARIA := CreaCampo('B_APL_PCT_VARIA',ftString,tsNinguno,tsNinguno,True);
      B_APL_PCT_VARIA.Caption := 'Aplica por porcentaje la variación';
      With B_APL_PCT_VARIA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');    ComboDatos.Add('F');
                ComboLista.Add('1');    ComboDatos.Add('V');
          end;
      OPERADOR_STASA:= CreaCampo('OPERADOR_STASA', ftString, tsNinguno, tsNinguno, True);
      OPERADOR_STASA.Caption:= 'Operador Sobre - Tasa';
      VARIACION_STASA :=CreaCampo('VARIACION_STASA',ftFloat,tsNinguno,tsNinguno,True);
      VARIACION_STASA.Caption:='Variación de la sobretasa';
      B_APL_SIG_PER :=CreaCampo('B_APL_SIG_PER',ftString,tsNinguno,tsNinguno,True);
      B_APL_SIG_PER.Caption:='Aplica Sig. Periodo';
      B_REINICIA_PER:=CreaCampo('B_REINICIA_PER',ftString,tsNinguno,tsNinguno,True);
      B_REINICIA_PER.Caption:='Reinicia cálculo a la fecha de cambio';
      SIT_CAMBIO:= CreaCampo('SIT_CAMBIO', ftString, tsNinguno, tsNinguno, True);
      with SIT_CAMBIO do
      begin
        Size:= 2;
        UseCombo:= True;
        ComboLista.Add('NO AUTORIZADO');
        ComboDatos.Add(CSIT_NA);
        ComboLista.Add('AUTORIZADO');
        ComboDatos.Add(CSIT_AU);
        ComboLista.Add('CANCELADO');
        ComboDatos.Add(CSIT_CA);
      end;
      SIT_CAMBIO.Caption:= 'Situación Cambio';
      FH_ALTA := CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_ALTA.Caption:='Fecha Hora Alta';
      CVE_USU_ALTA:=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_MODIFICA:= CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_MODIFICA.Caption:='Fecha Hora Modifica';
      CVE_USU_MODIFICA:=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_AUTORIZA:= CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,True);
      F_AUTORIZA.Caption:='Fecha Autoriza';
      FH_AUTORIZA:= CreaCampo('FH_AUTORIZA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_AUTORIZA.Caption:='Fecha Hora Autoriza';
      CVE_USU_AUTORIZA:=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      FH_CANCELA:= CreaCampo('FH_CANCELA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_CANCELA.Caption:='Fecha Hora Cancela';
      CVE_USU_CANCELA:=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_CANCELA.Caption:='Clave de Usu Cancela';

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('FOL_CAMBIO');
      TableName := 'CR_TASA_CAMBIO';
      UseQuery := True;
      HelpFile := 'IntCrCamTasM.Hlp';
      ShowMenuReporte:=True;

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:= Self;

      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TAS_REF_NVA';
      TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer.FilterString := TasaRefer.BuscaWhereString;
end;

Destructor TCrCamTasM.Destroy;
begin
   if ContratoCre <> nil then
      ContratoCre.Free;
   If TasaRefer <> nil then
       TasaRefer.Free;

   inherited;
end;


function TCrCamTasM.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCamTasM;
begin
   W:=TWCrCamTasM.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
//      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCamTasM.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCamTasM.it','F,F');
      Try if Active then
          begin
             T.Param(0,ID_CREDITO.AsString);
             T.Param(1,FOL_CAMBIO.AsString);
          end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
      finally
          T.Free;
      end;
end;

function TCrCamTasM.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrCamTasM********************)
(*                                                                              *)
(*  FORMA DE CrCamTasM                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCamTasM********************)

procedure TWCrCamTasM.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control := edID_CREDITO;
      Objeto.FOL_CAMBIO.Control := edFOL_CAMBIO;
      Objeto.F_APLICACION.Control := edF_APLICACION;
      Objeto.NUM_PERIODO.Control := edNUM_PERIODO;
      Objeto.CVE_TAS_REF_NVA.Control := edCVE_TAS_REF_NVA;
      Objeto.SOBRETASA_NVA.Control := edSOBRETASA_NVA;
      Objeto.CVE_TAS_REF_ANT.Control := edCVE_TAS_REF_ANT;
      Objeto.SOBRETASA_ANT.Control := edSOBRETASA_ANT;
      Objeto.B_APL_PCT_VARIA.Control := rgB_APL_PCT_VARIA;
      Objeto.OPERADOR_STASA.Control := cbOPERADOR_STASA;
      Objeto.VARIACION_STASA.Control := edVariacionTasa;
      Objeto.B_APL_SIG_PER.Control := chB_APL_SIG_PER;
      Objeto.B_REINICIA_PER.Control := chB_REINICIA_PER;
      Objeto.SIT_CAMBIO.Control:= lbSIT_CAMBIO;

      Objeto.FH_ALTA.Control := edFH_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
      Objeto.FH_MODIFICA.Control := edFH_MODIF;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      Objeto.F_AUTORIZA.Control := edF_AUTOR;
      Objeto.CVE_USU_AUTORIZA.Control := edCVE_USUA_AUTOR;
      Objeto.FH_CANCELA.Control := edFH_CANCELA;
      Objeto.CVE_USU_CANCELA.Control := edCVE_USUA_CANCELA;

      Objeto.ID_CREDITO.AsString := Objeto.vgCredito;
      Objeto.F_APLICACION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      dtpF_APLICACION.DateTime := Objeto.Apli.DameFechaEmpresa;
      Objeto.setCurrentDate(Objeto.F_APLICACION);      
      edID_CREDITO.Text := Objeto.BasicCred.ID_CREDITO.AsString;
      edCVE_PRODUCTO.Text := Objeto.BasicCred.CVE_PRODUCTO.AsString;
      edDESC_PRODUCTO.Text := Objeto.BasicCred.DESC_L_PRODUCTO.AsString;
      edCVE_CALCULO.Text := Objeto.BasicCred.CVE_CALCULO.AsString;
      edDESC_CALC_INT.Text := Objeto.BasicCred.DESC_CALC_INT.AsString;
      edCVE_TAS_REF.Text := Objeto.BasicCred.CVE_TASA_REFER.AsString;
      edDESC_TASA_REFER.Text := Objeto.BasicCred.DESC_TASA_REFER.AsString;
      edSOBRETASA.Text := Objeto.BasicCred.SOBRETASA.AsString;
      InterForma1.MsgPanel := MsgPanel;

      If not(Objeto.ContratoCre.Active) then
      begin
        if objeto.ContratoCre.FindKey([Objeto.BasicCred.ID_CONTRATO.AsInteger,'1']) then
        begin
          if ( Objeto.ContratoCre.Acreditado.B_APLI_REL_MON.AsString = CFALSO ) OR
             ( Objeto.ContratoCre.Acreditado.B_APLI_REL_MON.AsString = CNULL  )then Begin
             Objeto.TasaRefer.BuscaWhereString := ' TASA_INDIC_FINAN.CVE_TASA_INDICAD IN  ' +
                                                  ' ( SELECT CVE_TASA_REFER FROM CR_REL_PROD_MON ' +
                                                  ' WHERE     CR_REL_PROD_MON.CVE_MONEDA = ' + Objeto.ContratoCre.CVE_MONEDA.AsString+
                                                  ' AND CR_REL_PROD_MON.CVE_PRODUCTO_CRE = ' + #39 + Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString + #39 + ')';
             Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
          end
          else Begin
             Objeto.TasaRefer.BuscaWhereString := '';
             Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
          end;
        end;
      end;

      ValidaUsuario;

      If Objeto.BasicCred.CVE_TASA_REFER.AsString = 'FIJA' Then
      begin
        Objeto.CVE_TAS_REF_NVA.AsString := 'FIJA';
        Objeto.TasaRefer.FindKey(['FIJA']);
        edCVE_TAS_REF_NVA.Tag := 0;
        edCVE_TAS_REF_NVA.TabStop := False;
        edCVE_TAS_REF_NVA.Color := clBtnFace;
        edCVE_TAS_REF_NVA.ReadOnly := True;
        edCVE_TAS_REF_NVA.Enabled := False;
        btTASA_REFER.Tag := 0;
        btTASA_REFER.Enabled := False;
        btTASA_REFER.Visible := False;
      end
      else
      begin
        edCVE_TAS_REF_NVA.Tag := 530;
        edCVE_TAS_REF_NVA.TabStop := True;
        edCVE_TAS_REF_NVA.Color := clWindow;
        edCVE_TAS_REF_NVA.ReadOnly := False;
        edCVE_TAS_REF_NVA.Enabled := True;
        btTASA_REFER.Tag := 18;        
        btTASA_REFER.Enabled := True;
        btTASA_REFER.Visible := True;
      end;

      InterForma1.ShowBtnEliminar := False;
end;

procedure TWCrCamTasM.FormDestroy(Sender: TObject);
begin
  Objeto.ID_CREDITO.Control := Nil;
  Objeto.FOL_CAMBIO.Control := Nil;
  Objeto.F_APLICACION.Control := Nil;
  Objeto.NUM_PERIODO.Control := Nil;
  Objeto.CVE_TAS_REF_NVA.Control := Nil;
  Objeto.SOBRETASA_NVA.Control := Nil;
  Objeto.CVE_TAS_REF_ANT.Control := Nil;
  Objeto.SOBRETASA_ANT.Control := Nil;
  Objeto.B_APL_PCT_VARIA.Control := Nil;
  Objeto.OPERADOR_STASA.Control := Nil;
  Objeto.VARIACION_STASA.Control := Nil;
  Objeto.B_APL_SIG_PER.Control := Nil;
  Objeto.B_REINICIA_PER.Control := Nil;
  Objeto.SIT_CAMBIO.Control:= Nil;
  Objeto.FH_ALTA.Control := Nil;
  Objeto.CVE_USU_ALTA.Control := Nil;
  Objeto.FH_MODIFICA.Control := Nil;
  Objeto.CVE_USU_MODIFICA.Control := Nil;
  Objeto.F_AUTORIZA.Control := Nil;
  Objeto.CVE_USU_AUTORIZA.Control := Nil;
  Objeto.FH_CANCELA.Control := Nil;
  Objeto.CVE_USU_CANCELA.Control := Nil;
end;

procedure TWCrCamTasM.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCamTasM.InterForma1DespuesNuevo(Sender: TObject);
var
  vlSigFolio : Integer;
  vlsql : String;
  qry : TQuery;
begin
   Objeto.F_APLICACION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.FH_ALTA.AsDateTime := Now;
   Objeto.ID_CREDITO.AsString := Objeto.vgCredito;
   chB_APL_SIG_PER.Checked := False;
   chB_REINICIA_PER.Checked := False;
   Objeto.CVE_TAS_REF_ANT.AsString := Objeto.BasicCred.CVE_TASA_REFER.AsString;
   Objeto.SOBRETASA_ANT.AsFloat := Objeto.BasicCred.SOBRETASA.AsFloat;
   Objeto.SIT_CAMBIO.AsString := CSIT_NA;
   rgB_APL_PCT_VARIA.ItemIndex := 0;

   vlsql := ' SELECT NVL(MAX(FOL_CAMBIO),0) + 1 SIG_FOL ' +
            ' FROM CR_TASA_CAMBIO ' +
            ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
   GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'SIG_FOL', vlSigFolio,False);
   Objeto.FOL_CAMBIO.AsInteger := vlSigFolio;
   DeshabilitaBotones;
   edF_APLICACION.SetFocus;

   If Objeto.BasicCred.CVE_TASA_REFER.AsString = 'FIJA' Then
   begin
     Objeto.TasaRefer.FindKey(['FIJA']);
     Objeto.CVE_TAS_REF_NVA.AsString := 'FIJA';
   end;
end;

procedure TWCrCamTasM.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   Objeto.FH_MODIFICA.AsDateTime := Now;
   DeshabilitaBotones;
   edF_APLICACION.SetFocus;
end;

procedure TWCrCamTasM.edF_APLICACIONExit(Sender: TObject);
var
  vlsql : String;
  qry   : TQuery;
  vlHay :Integer;
  vlPeriodo  : Integer;
  vlSitInter : String;
  vlSalida   : Boolean;
  vlMsg      : String;
  vlcontinua : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     vlSalida := True;
     vlContinua := True;
     Objeto.F_APLICACION.GetFromControl;
     if Objeto.F_APLICACION.AsDateTime <> Objeto.getCurrentDate then
        if MessageDlg( '¿Desea actualizar la fecha de aplicación?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
        begin
          // se debe validar que la fecha esté dentro de las fechas de inicio y vencimiento del crédito
          vlsql := ' SELECT COUNT(*) HAY ' +
                   ' FROM CR_CREDITO ' +
                   ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
                   '  AND ' + SQLFecha(Objeto.F_APLICACION.AsDateTime) +
                   '  BETWEEN F_INICIO AND F_VENCIMIENTO ';
          GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY', vlHay,False);
          If vlHay = 0 THEN
          begin
             vlMsg := 'La fecha debe estar dentro de la vigencia de la disposición. Favor de validar.';
             vlContinua := False;
             Objeto.F_APLICACION.AsDateTime := Objeto.getCurrentDate;
          end;
          // se valida la existencia de cambios de tasa con fecha de aplicación posterior a la fecha capturada
          if vlcontinua and ValCambiosPosteriores then
          begin
             vlMsg := 'Existen cambios de tasa con fecha de aplicación mayor o igual a la capturada, con status NA o AU. Favor de validar.';
             vlcontinua := False;
             Objeto.F_APLICACION.AsDateTime := Objeto.getCurrentDate;
          end;

          if vlcontinua then
          begin
             Objeto.setCurrentDate(Objeto.F_APLICACION);
             vlMsg := '';
             vlSalida := True;
          end
          else
             vlSalida := False;
        end
        else
        begin
          Objeto.F_APLICACION.AsDateTime := Objeto.getCurrentDate;
          vlMsg := '';
          vlSalida := True;
        end;

     IF vlSalida THEN
     BEGIN
       // se informa la existencia de eventos de afectación de pagos, quitas, condonaciones, etc
       If ValidaExistePago THEN
          MessageDlg('Existen transacciones intermedias de afectación al importe pagado, por lo que no se prodrá autorizar el cambio de tasa',
                     mtInformation, [mbOK], 0);

       If ValidaTraspVenc THEN
          MessageDlg('La fecha de aplicación es anterior a la fecha de traspaso a vencido, por lo que no se podrá autorizar el cambio de tasa',
                     mtInformation, [mbOK], 0);

       // se busca el periodo de interes al que afectará
       vlsql := ' SELECT NVL(MIN(NUM_PERIODO),0) PERIODO FROM CR_INTERES ' +
                ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
                '   AND ' + SQLFecha(Objeto.F_APLICACION.AsDateTime) +
                ' BETWEEN F_VENCIMIENTO-PLAZO AND F_VENCIMIENTO-1 ';
       GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'PERIODO', vlPeriodo,False);
       Objeto.NUM_PERIODO.AsInteger := vlPeriodo;

       // se obtiene la situación del periodo
       vlsql := ' SELECT SIT_INTERES FROM CR_INTERES ' +
                ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
                '   AND NUM_PERIODO = ' + Objeto.NUM_PERIODO.AsString;
       GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'SIT_INTERES', vlSitInter,False);
       lbSit_Per_Interes.Caption := vlSitInter;
     END;

     InterForma1.ValidaExit(edF_APLICACION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCamTasM.btTASA_REFERClick(Sender: TObject);
begin
 if Objeto.ValidaAccesoEsp('TCRCAMTASM_TSREF',True,True) then
 begin
       Objeto.TasaRefer.ShowAll := True;
       if Objeto.TasaRefer.Busca then
          InterForma1.NextTab(btTASA_REFER);
 end;
end;

procedure TWCrCamTasM.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TAS_REF_NVA);
end;

procedure TWCrCamTasM.edCVE_TAS_REF_NVAExit(Sender: TObject);
var
   vlSalida : Boolean;
   vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMesg   := CNULL;
      vlSalida := True;

      Objeto.CVE_TAS_REF_NVA.GetFromControl;
      if Objeto.CVE_TAS_REF_NVA.AsString = CNULL then
      begin
        vlSalida := False;
        vlMesg := 'Debe especificar la nueva tasa, aunque sea la misma que la actual.';
      end;

      InterForma1.ValidaExit(edCVE_TAS_REF_NVA,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrCamTasM.chB_APL_SIG_PERExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      InterForma1.ValidaExit(chB_APL_SIG_PER,True,'',True);
   end;
end;

procedure TWCrCamTasM.DeshabilitaBotones;
begin
   Objeto.SIT_CAMBIO.GetFromControl;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := False;
   end
   else
     if (Objeto.SIT_CAMBIO.AsString = CSIT_NA) Then
     Begin
        if vlAutCamTas then
           btAUTORIZA.Enabled := True;
        if vlCanCamTas then
           btCANCELA.Enabled := True;
        InterForma1.ShowBtnModificar := True;
     end
     else if ( Objeto.SIT_CAMBIO.AsString = CSIT_AU ) OR
             ( Objeto.SIT_CAMBIO.AsString = CSIT_AC ) then
     Begin
        btAUTORIZA.Enabled := False;
        if vlCanCamTas then
           btCANCELA.Enabled := True;
        InterForma1.ShowBtnModificar := False;
     end
     else if ( Objeto.SIT_CAMBIO.AsString = CSIT_CA ) then
     Begin
        btAUTORIZA.Enabled := False;
        btCANCELA.Enabled := False;
        InterForma1.ShowBtnModificar := False;
     end;
end;

procedure TWCrCamTasM.InterForma1Buscar(Sender: TObject);
var
  vlsql : String;
  vlSitInter : String;
begin
   If Objeto.vgCredito <> '' Then Begin
      Objeto.BuscaWhereString := 'CR_TASA_CAMBIO.ID_CREDITO = ' + Objeto.vgCredito;
      Objeto.FilterString := Objeto.BuscaWhereString;
   End Else Begin
      Objeto.BuscaWhereString := '';
      Objeto.FilterString := Objeto.BuscaWhereString;
   End;
   if Objeto.Busca then
   Begin
     // se obtiene la situación del periodo
     vlsql := ' SELECT SIT_INTERES FROM CR_INTERES ' +
              ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
              '   AND NUM_PERIODO = ' + Objeto.NUM_PERIODO.AsString;
     GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'SIT_INTERES', vlSitInter,False);
     lbSit_Per_Interes.Caption := vlSitInter;

     DeshabilitaBotones;
   End;
end;

procedure TWCrCamTasM.InterForma1DespuesAceptar(Sender: TObject);
begin
  DeshabilitaBotones;
end;

function TCrCamTasM.getCurrentDate: TDate;
begin
  Result := fCurrentDate;
end;

procedure TCrCamTasM.setCurrentDate(Sender: TInterCampo);
begin
  fCurrentDate := Sender.AsDateTime;
end;

procedure TWCrCamTasM.edF_APLICACIONEnter(Sender: TObject);
begin
  Objeto.setCurrentDate(Objeto.F_APLICACION);
end;

function TCrCamTasM.StpAutoriza: Boolean;
var   sptAutoriza : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptAutoriza := TStoredProc.Create(Self);
     with sptAutoriza do
     begin
        //Inicia el SPT
        sptAutoriza.DatabaseName:= Apli.DatabaseName;
        sptAutoriza.SessionName:= Apli.SessionName;
        sptAutoriza.StoredProcName:= 'PKGCRCREDITO.STPCAMBIOTASA';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',  ptInput);
        Params.CreateParam(ftInteger,'PEFOLCAMBIO',  ptInput);
        Params.CreateParam(ftString, 'PECVEUSUAUT',  ptInput);
        Params.CreateParam(ftString, 'PEBCOMMIT',    ptInput);
        Params.CreateParam(ftFloat,  'PSRESULTADO',  ptOutput);
        Params.CreateParam(ftString, 'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEIDCREDITO').AsInteger := ID_CREDITO.AsInteger;
        ParamByName('PEFOLCAMBIO').AsInteger := FOL_CAMBIO.AsInteger;
        ParamByName('PECVEUSUAUT').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
        end;
        //end if;
     end;
   finally
      sptAutoriza.Free;
   end;
   StpAutoriza := vlResultado;
end;

function TCrCamTasM.StpCancela: Boolean;
var   SptCancela  : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     SptCancela := TStoredProc.Create(Self);
     with SptCancela do
     begin
        //Inicia el SPT
        SptCancela.DatabaseName:= Apli.DatabaseName;
        SptCancela.SessionName:= Apli.SessionName;
        SptCancela.StoredProcName:= 'PKGCRCREDITO.STPCANCELACAMBIOTASA';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',  ptInput);
        Params.CreateParam(ftInteger,'PEFOLCAMBIO',  ptInput);
        Params.CreateParam(ftString, 'PECVEUSUCAN',  ptInput);
        Params.CreateParam(ftString, 'PEBCOMMIT',    ptInput);
        Params.CreateParam(ftFloat,  'PSRESULTADO',  ptOutput);
        Params.CreateParam(ftString, 'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEIDCREDITO').AsInteger := ID_CREDITO.AsInteger;
        ParamByName('PEFOLCAMBIO').AsInteger := FOL_CAMBIO.AsInteger;
        ParamByName('PECVEUSUCAN').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
        end;
        //end if;
     end;
   finally
      SptCancela.Free;
   end;
   StpCancela := vlResultado;
end;

procedure TWCrCamTasM.btAUTORIZAClick(Sender: TObject);
var
  vlContinua : Boolean;
begin
IF Objeto.ValidaAccesoEsp('TCRCAMTASM_AUTOR',True,True) THEN
BEGIN
    vlContinua := True;
    if Objeto.Active then
    begin
      // RABA ENE 2014
      if Objeto.CVE_USU_ALTA.AsString = Objeto.Apli.Usuario then
      begin
         MessageDlg('El usuario que autoriza no pede ser el mismo que capturó el cambio de tasa.',
                    mtInformation, [mbOK], 0);
         vlContinua := False;
      end;
      // FIN RABA
      if Objeto.SIT_CAMBIO.AsString = CSIT_AU then
      begin
         ShowMessage('El cambio de tasa ya se encuentra autorizado.');
         vlContinua := False;
      end;

      if Objeto.SIT_CAMBIO.AsString = CSIT_CA then
      begin
         ShowMessage('El cambio de tasa se encuentra cancelado.');
         vlContinua := False;
      end;

      if Objeto.SIT_CAMBIO.AsString <> CSIT_NA then
      begin
         ShowMessage('La situación del cambio de tasa debe ser No Autorizado.');
         vlContinua := False;
      end;

      if vlContinua then
      Begin
        // se informa la existencia de eventos de afectación de pagos, quitas, condonaciones, etc
        If ValidaExistePago THEN
        begin
           MessageDlg('Existen transacciones intermedias de afectación al importe pagado,' + chr(13) +
                      'por lo que no se puede autorizar el cambio de tasa.',
                   mtInformation, [mbOK], 0);
           vlContinua := False;
        end;

        If ValidaTraspVenc THEN
        begin
           MessageDlg('Existe traspaso a vencido, por lo que no se podrá cancelar el cambio de tasa.',
                      mtInformation, [mbOK], 0);
           vlContinua := False;
        end;

        if vlContinua then
            if MessageDlg('¿Está seguro de autorizar el cambio de tasa?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
              If Objeto.StpAutoriza then
              begin
                ShowMessage('Se autorizó el cambio de tasa.');
                Objeto.FindKey([Objeto.ID_CREDITO.AsString, Objeto.FOL_CAMBIO.AsString]);
                Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
                edCVE_TAS_REF.Text := Objeto.BasicCred.CVE_TASA_REFER.AsString;
                edDESC_TASA_REFER.Text := Objeto.BasicCred.DESC_TASA_REFER.AsString;
                edSOBRETASA.Text := Objeto.BasicCred.SOBRETASA.AsString;
                DeshabilitaBotones;
              end;
            end;
      end;
    end;
END;
end;

procedure TWCrCamTasM.btCANCELAClick(Sender: TObject);
var
  vlContinua : Boolean;
begin
IF Objeto.ValidaAccesoEsp('TCRCAMTASM_CANCE',True,True) THEN
BEGIN
    vlContinua := True;
    if Objeto.Active then
    begin
      if Objeto.SIT_CAMBIO.AsString = CSIT_CA  then
      begin
         ShowMessage('El cambio de tasa ya se encuentra cancelado.');
         vlContinua := False;
      end;

      if vlContinua then
      Begin
        If Objeto.SIT_CAMBIO.AsString = CSIT_AU then
        begin
           // se informa la existencia de eventos de afectación de pagos, quitas, condonaciones, etc
           If ValidaExistePago THEN
           begin
              MessageDlg('Existen transacciones intermedias de afectación al importe pagado,' + chr(13) +
                         'por lo que no se puede cancelar el cambio de tasa.',
                         mtInformation, [mbOK], 0);
              vlContinua := False;
           end;

           If ValidaTraspVenc THEN
           begin
              MessageDlg('Existe traspaso a vencido, por lo que no se podrá cancelar el cambio de tasa.',
                         mtInformation, [mbOK], 0);
              vlContinua := False;
           end;
        end;

        if vlContinua Then
           if ValCambiosPosCan then
           begin
              MessageDlg('Existen cambios de tasa, posteriores al que desea cancelar' + chr(13) +
                         'la cancelación debe ser en orden.',
                     mtInformation, [mbOK], 0);
              vlContinua := False;
           end;

        if vlContinua Then
           if MessageDlg('¿Está seguro de cancelar el cambio de tasa?',
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
             If Objeto.StpCancela then
             begin
                ShowMessage('Se canceló el cambio de tasa.');
                Objeto.FindKey([Objeto.ID_CREDITO.AsString, Objeto.FOL_CAMBIO.AsString]);
                Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
                edCVE_TAS_REF.Text := Objeto.BasicCred.CVE_TASA_REFER.AsString;
                edDESC_TASA_REFER.Text := Objeto.BasicCred.DESC_TASA_REFER.AsString;
                edSOBRETASA.Text := Objeto.BasicCred.SOBRETASA.AsString;
                DeshabilitaBotones;
             end;
           end;
      end; // if vlContinua then después de evaluar que no esta en situación de cancelado
    end; // if Objeto.Active then
END;
end;

procedure TWCrCamTasM.chB_REINICIA_PERExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      InterForma1.ValidaExit(chB_REINICIA_PER,True,'',True);
   end;
end;

procedure TWCrCamTasM.cbOPERADOR_STASAKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Not((key=Char(42)) or (key=Char(43)) or (key=Char(45)) or (key=Char(47)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
     end;
end;

procedure TWCrCamTasM.cbOPERADOR_STASAExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     Objeto.OPERADOR_STASA.GetFromControl;
     if Objeto.OPERADOR_STASA.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el Operador de la Sobretasa';
     end;
     InterForma1.ValidaExit(cbOPERADOR_STASA,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrCamTasM.edVariacionTasaExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
    vlnvast   : double;
    vlpct     : double;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     Objeto.B_APL_PCT_VARIA.GetFromControl;
     Objeto.VARIACION_STASA.GetFromControl;
     Objeto.OPERADOR_STASA.GetFromControl;

     if (Objeto.VARIACION_STASA.AsString = CNULL) then
     Begin
        vlSalida := False;
        vlMesg := 'Indique la variación de la sobretasa';
     end
     else
     begin
       if Objeto.OPERADOR_STASA.AsString = CNULL then
       Begin
          vlSalida := True;
          vlMesg := 'Se debe indicar el operador para obtener la nueva sobretasa';
          cbOPERADOR_STASA.SetFocus;
       end
       else
       begin
         IF Objeto.B_APL_PCT_VARIA.AsString <> 'V' then
         begin
           if Objeto.OPERADOR_STASA.AsString = '+' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat + Objeto.VARIACION_STASA.AsFloat
           else if Objeto.OPERADOR_STASA.AsString = '-' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat - Objeto.VARIACION_STASA.AsFloat
           else if Objeto.OPERADOR_STASA.AsString = '*' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat * Objeto.VARIACION_STASA.AsFloat
           else if Objeto.OPERADOR_STASA.AsString = '/' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat / Objeto.VARIACION_STASA.AsFloat
           else
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat + Objeto.VARIACION_STASA.AsFloat;
         end
         else
         begin
           vlpct := Objeto.SOBRETASA_ANT.AsFloat * Objeto.VARIACION_STASA.AsFloat/100;

           if Objeto.OPERADOR_STASA.AsString = '+' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat + vlpct
           else if Objeto.OPERADOR_STASA.AsString = '-' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat - vlpct
           else if Objeto.OPERADOR_STASA.AsString = '*' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat * vlpct
           else if Objeto.OPERADOR_STASA.AsString = '/' then
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat / vlpct
           else
              vlnvast := Objeto.SOBRETASA_ANT.AsFloat + vlpct;
         end;

         If vlnvast <= 0 then
         Begin
           vlSalida := False;
           vlMesg := 'La nueva sobretasa no puede ser menor o igual a cero.';
         end;

         edSOBRETASA_NVA.text := FormatFloat('0.###0', vlnvast);

       end;
     end;

     InterForma1.ValidaExit(edVariacionTasa,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrCamTasM.rgB_APL_PCT_VARIAExit(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
      InterForma1.ValidaExit(rgB_APL_PCT_VARIA,True,'',True);
  end;
end;

procedure TWCrCamTasM.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
var
  vlsql : String;
  vlHay : Integer;

begin
  vlsql := ' SELECT COUNT(*) HAY ' +
           ' FROM CR_TASA_CAMBIO ' +
           ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
           '  AND SIT_CAMBIO = ''NA'' ';
  GetSQLInt(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'HAY', vlHay, False);
  If vlHay <> 0 then
  begin
    MessageDlg('Existe un cambio de tasa sin autorizar o cancelar, ' + chr(13) + ' por lo que no es posible dar de alta otro cambio.',
               mtInformation, [mbOK],0);
    Realizado := False;
  end;
end;

function TWCrCamTasM.ValidaExistePago: Boolean;
var
  vlsql : String;
  vlHay :Integer;
begin
  ValidaExistePago := False;

  // se informa la existencia de eventos de afectación de pagos, quitas, condonaciones, etc
  vlsql := ' SELECT COUNT(*) HAY_PAGOS ' +
           ' FROM CR_TRANSACCION TR, ' +
           '      (SELECT DISTINCT CVE_OPERACION FROM CR_REL_CON_AFEC WHERE CVE_AFECTACION IN (''CIIMPA'', ''CAIMPA'', ''FNIMPA'', ''COIMPA'')) OPIN ' +
           ' WHERE TR.CVE_OPERACION = OPIN.CVE_OPERACION ' +
           '   AND TR.ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
//           '   AND TR.F_OPERACION > ' + SQLFecha(Objeto.F_APLICACION.AsDateTime) +
           '   AND TR.F_VALOR > ' + SQLFecha(Objeto.F_APLICACION.AsDateTime) +
           '   AND TR.SIT_TRANSACCION = ''AC'' ' +
           '   AND TR.ID_TRANS_CANCELA IS NULL ';
  GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY_PAGOS', vlHay,True);
  If vlHay > 0 THEN
  begin
//    MessageDlg('Existen transacciones intermedias de afectación al importe pagado, por lo que no se prodrá autorizar el cambio de tasa',
//               mtInformation, [mbOK], 0);
    ValidaExistePago := True;
  end;
end;

function TWCrCamTasM.ValCambiosPosCan: Boolean;
var
  vlsql : String;
  vlHay : Integer;
begin
  ValCambiosPosCan := False;

  // se informa la existencia de cambios posteriores al que se requiere cancelar, por lo que no dejará cancelar
  vlsql := ' SELECT COUNT(*) HAY_CAMBIOS ' +
           ' FROM CR_TASA_CAMBIO  ' +
           ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
           '  AND FOL_CAMBIO > ' + Objeto.FOL_CAMBIO.AsString +
           '  AND SIT_CAMBIO <> ''CA'' ';

  GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY_CAMBIOS', vlHay,True);
  If vlHay > 0 THEN
  begin
    ValCambiosPosCan := True;
  end;

end;

function TWCrCamTasM.ValidaTraspVenc: Boolean;
var
  vlsql : String;
  vlHay :Integer;
begin
  ValidaTraspVenc := False;

  // se informa la existencia fecha de traspaso a vencido posterior a la fecha de aplicación de cambio de tasa
  vlsql := ' SELECT CASE WHEN F_TRASPASO_VENC IS NULL THEN 0 ' +
           '             WHEN F_TRASPASO_VENC <= ' + SQLFecha(Objeto.F_APLICACION.AsDateTime) + ' THEN 0 ' +
           '             ELSE 1  END  HAY_TRASP_VENC ' +
           ' FROM CR_CREDITO ' +
           ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
  GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY_TRASP_VENC', vlHay,True);
  If vlHay > 0 THEN
  begin
    ValidaTraspVenc := True;
  end;
end;

procedure TWCrCamTasM.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //se valida que exista un cambio
  Objeto.CVE_TAS_REF_ANT.GetFromControl;
  Objeto.CVE_TAS_REF_NVA.GetFromControl;
  Objeto.SOBRETASA_ANT.GetFromControl;
  Objeto.SOBRETASA_NVA.GetFromControl;

  IF (Objeto.CVE_TAS_REF_ANT.AsString = Objeto.CVE_TAS_REF_NVA.AsString) AND
     (Objeto.SOBRETASA_ANT.AsFloat = Objeto.SOBRETASA_NVA.AsFloat) then
  begin
      MessageDlg('No se detecta ningún cambio de tasa, favor de verificar.', mtInformation, [mbok], 0);
      Realizado := False;
  end;

end;

procedure TWCrCamTasM.ValidaUsuario;
Var   qyQuery   : TQuery;
      vlSQL     : String;
begin
   vlAutCamTas  := False;
   vlCanCamTas  := False;

   vlSQL := ' SELECT B_AUTORIZA_CTAS, ' + coCRLF +
            '        B_CANCELA_CTAS  ' + coCRLF +
            ' FROM  CR_PERF_PROD_USU  ' + coCRLF +
            ' WHERE CVE_PRODUCTO   =  ' + SQLStr( Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString )+ coCRLF +
//            ' WHERE CVE_PRODUCTO   =  ' + SQLStr( edCVE_PRODUCTO.Text )+ coCRLF +
            ' AND   CVE_GPO_ACCESO =  ' + IntToStr( Objeto.Apli.CvePerfil ) + coCRLF ;

   qyQuery := GetSQLQuery(vlSQL,Objeto.DataBaseName,Objeto.SessionName,True);
   If (qyQuery <> nil) Then
   Begin
      if qyQuery.FieldbyName('B_AUTORIZA_CTAS').AsString = CVERDAD then
         vlAutCamTas := True;

      if qyQuery.FieldbyName('B_CANCELA_CTAS').AsString = CVERDAD then
         vlCanCamTas := True;
   End;
end;

function TWCrCamTasM.ValCambiosPosteriores: Boolean;
var
  vlsql : String;
  vlHay : Integer;
begin
  ValCambiosPosteriores := False;

  // se informa la existencia de cambios de tasa con fecha de aplicación posterior a la fecha que se está capturando (autorizados o no autorizados),
  // por lo que no se debe permitir la captura
  vlsql := ' SELECT COUNT(*) HAY_CAMBIOS ' +
           ' FROM CR_TASA_CAMBIO ' +
           ' WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
           '   AND F_APLICACION >= ' + SQLFecha(Objeto.F_APLICACION.AsDateTime) +
           '   AND SIT_CAMBIO <> ''CA'' ';

  GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY_CAMBIOS', vlHay,True);
  If vlHay > 0 THEN
  begin
    ValCambiosPosteriores := True;
  end;

end;

end.
