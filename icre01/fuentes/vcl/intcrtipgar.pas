// Sistema         : Clase de CR_TIPOS_GARAN
// Fecha de Inicio : 06/02/2013
// Función forma   : Clase de CR_TIPOS_GARAN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrTipGar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntParamCre
;


Type
 TCrTipGar= class; 

  TWCrTiposGaran=Class(TForm)
    InterForma1             : TInterForma;
    Label3: TLabel;
    lMontos: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    cbhGAR_PART: TCheckBox;
    chbGAR_APORT: TCheckBox;
    chbING_PROPIOS: TCheckBox;
    edMON_GAR_PART: TInterEdit;
    edMON_GAR_APORT: TInterEdit;
    edMON_ING_PROPIOS: TInterEdit;
    edPCT_PART: TEdit;
    edPCT_APORT: TEdit;
    edPCT_ING_PROP: TEdit;
    lbID_CONTRATO: TLabel;
    chbMANDATO: TCheckBox;
    chbINS_IRREV: TCheckBox;
    chbFIDEICOMISO: TCheckBox;
    chbB_COBERTURA_TASA: TCheckBox;
    rgFUENTE_PAGO: TRadioGroup;
    rgTIPO_LINEA: TRadioGroup;
    Bevel1: TBevel;
    Label6: TLabel;
    chbB_AUT_LEG_LOCAL: TCheckBox;
    chbB_MEC_CLARO_PAGO: TCheckBox;
    chbB_OPIN_DESP_JUR: TCheckBox;
    chbB_OPIN_INTER_JUR: TCheckBox;
    chbB_APL_INSCR_DEUD: TCheckBox;
    Label14: TLabel;
    edNUM_INSCR_DEUDA: TEdit;
    Label15: TLabel;
    edF_ALTA_INSCR_DEU: TEdit;
    idtpF_ALTA_INSCR_DEU: TInterDateTimePicker;
    idtpF_PROG_INSCR_D: TInterDateTimePicker;
    edF_PROG_INSCR_D: TEdit;
    Label16: TLabel;
    edINS_FEDERAL: TEdit;
    Label4: TLabel;
    chbB_REPORTE_SIC: TCheckBox;
    chbB_GTIA_LEY_FED: TCheckBox;
    chbB_CONT_GUBERNA: TCheckBox;
    Bevel2: TBevel;
    Label1: TLabel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbCVE_USU_ALTA: TLabel;
    edCVE_USU_ALTA: TEdit;
    Bevel3: TBevel;
    rgPOSICION: TRadioGroup;
    edF_REG_GAR_PART: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    InterDateTimePicker2: TInterDateTimePicker;
    edF_REG_GAR_APORT: TEdit;
    InterDateTimePicker3: TInterDateTimePicker;
    edF_REG_ING_PROPIOS: TEdit;
    edID_CONTRATO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure InterForma1BtnBuscarClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure chbING_PROPIOSClick(Sender: TObject);
    procedure chbGAR_APORTClick(Sender: TObject);
    procedure cbhGAR_PARTClick(Sender: TObject);
    procedure ActivaComponente(Objeto : TObject; Activar : Boolean);
    procedure chbB_APL_INSCR_DEUDClick(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);

    private
    { Private declarations }
      strContrato : String;

      function  BooleanToString(ABool : Boolean): String;

    public
      { Public declarations }
      Objeto : TCrTipGar;


    end;

 TCrTipGar= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;

        ID_CONTRATO              : TInterCampo;
        POSICION                 : TInterCampo;
        TIPO_LINEA               : TInterCampo;
        FUENTE_PAGO              : TInterCampo;
        INS_IRREV                : TInterCampo;
        MANDATO                  : TInterCampo;
        GAR_PART                 : TInterCampo;
        GAR_APORT                : TInterCampo;
        MON_INS_IRREV            : TInterCampo;
        MON_MANDATO              : TInterCampo;
        MON_GAR_PART             : TInterCampo;
        MON_GAR_APORT            : TInterCampo;
        MON_ING_PROPIOS          : TInterCampo;
        INS_FEDERAL              : TInterCampo;
        FIDEICOMISO              : TInterCampo;
        ING_PROPIOS              : TInterCampo;
        B_AUT_LEG_LOCAL          : TInterCampo;
        B_MEC_CLARO_PAGO         : TInterCampo;
        B_OPIN_DESP_JUR          : TInterCampo;
        B_OPIN_INTER_JUR         : TInterCampo;
        F_REG_GAR_PART           : TInterCampo;
        F_REG_GAR_APORT          : TInterCampo;
        F_REG_ING_PROPIOS        : TInterCampo;
        B_COBERTURA_TASA         : TInterCampo;
        B_APL_INSCR_DEUD         : TInterCampo;
        NUM_INSCR_DEUDA          : TInterCampo;
        F_ALTA_INSCR_DEU         : TInterCampo;
        F_PROG_INSCR_D           : TInterCampo;
        ID_REG_VIGENTE           : TInterCampo;
        PCT_PART                 : TInterCampo;
        PCT_APORT                : TInterCampo;
        PCT_ING_PROP             : TInterCampo;
        B_REPORTE_SIC            : TInterCampo;
        B_GTIA_LEY_FED           : TInterCampo;
        B_CONT_GUBERNA           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;

        bolEsNuevo               : Boolean;
        strContrato              : string;

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


constructor TCrTipGar.Create( AOwner : TComponent );
begin Inherited;

      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      POSICION :=CreaCampo('POSICION',ftInteger,tsNinguno,tsNinguno,True);
      With POSICION do begin
        UseCombo:=True;
        ComboLista.Add('0');  ComboDatos.Add('1');
        ComboLista.Add('1'); ComboDatos.Add('2');
      end;
      FUENTE_PAGO :=CreaCampo('FUENTE_PAGO',ftInteger,tsNinguno,tsNinguno,True);
      With FUENTE_PAGO do begin
        UseCombo:=True;
        ComboLista.Add('0');  ComboDatos.Add('1');
        ComboLista.Add('1'); ComboDatos.Add('2');
      end;
      TIPO_LINEA :=CreaCampo('TIPO_LINEA',ftInteger,tsNinguno,tsNinguno,True);
      With TIPO_LINEA do begin
        UseCombo:=True;
        ComboLista.Add('0');  ComboDatos.Add('1');
        ComboLista.Add('1'); ComboDatos.Add('2');
      end;

      ING_PROPIOS :=CreaCampo('ING_PROPIOS',ftString,tsNinguno,tsNinguno,True);
                ING_PROPIOS.Caption:='Ing Propios';
      GAR_PART :=CreaCampo('GAR_PART',ftString,tsNinguno,tsNinguno,True);
                GAR_PART.Caption:='Gar Part';
      GAR_APORT :=CreaCampo('GAR_APORT',ftString,tsNinguno,tsNinguno,True);
                GAR_APORT.Caption:='Gar Aport';
      MON_GAR_APORT :=CreaCampo('MON_GAR_APORT',ftFloat,tsNinguno,tsNinguno,True);
                MON_GAR_APORT.Caption:='Moneda Gar Aport';
      MON_ING_PROPIOS :=CreaCampo('MON_ING_PROPIOS',ftFloat,tsNinguno,tsNinguno,True);
                MON_ING_PROPIOS.Caption:='Moneda Ing Propios';
      F_REG_GAR_PART :=CreaCampo('F_REG_GAR_PART',ftDate,tsNinguno,tsNinguno,True);
                F_REG_GAR_PART.Caption:='Fecha Reg Gar Part';
      F_REG_GAR_APORT :=CreaCampo('F_REG_GAR_APORT',ftDate,tsNinguno,tsNinguno,True);
                F_REG_GAR_APORT.Caption:='Fecha Reg Gar Aport';
      F_REG_ING_PROPIOS :=CreaCampo('F_REG_ING_PROPIOS',ftDate,tsNinguno,tsNinguno,True);
                F_REG_ING_PROPIOS.Caption:='Fecha Reg Ing Propios';
      PCT_PART :=CreaCampo('PCT_PART',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PART.Caption:='Pct Part';
      PCT_APORT :=CreaCampo('PCT_APORT',ftFloat,tsNinguno,tsNinguno,True);
                PCT_APORT.Caption:='Pct Aport';
      PCT_ING_PROP :=CreaCampo('PCT_ING_PROP',ftFloat,tsNinguno,tsNinguno,True);
                PCT_ING_PROP.Caption:='Pct Ing Prop';
      B_REPORTE_SIC :=CreaCampo('B_REPORTE_SIC',ftString,tsNinguno,tsNinguno,True);
                B_REPORTE_SIC.Caption:='Reporte Sic';
      B_GTIA_LEY_FED :=CreaCampo('B_GTIA_LEY_FED',ftString,tsNinguno,tsNinguno,True);
                B_GTIA_LEY_FED.Caption:='Gtia Ley Fed';
      B_CONT_GUBERNA :=CreaCampo('B_CONT_GUBERNA',ftString,tsNinguno,tsNinguno,True);
                B_CONT_GUBERNA.Caption:='Cont Guberna';	  				
      INS_IRREV :=CreaCampo('INS_IRREV',ftString,tsNinguno,tsNinguno,True);
                INS_IRREV.Caption:='Ins Irrev';
      MANDATO :=CreaCampo('MANDATO',ftString,tsNinguno,tsNinguno,True);
                MANDATO.Caption:='Mandato';
      MON_GAR_PART :=CreaCampo('MON_GAR_PART',ftFloat,tsNinguno,tsNinguno,True);
                MON_GAR_PART.Caption:='Moneda Gar Part';
      FIDEICOMISO :=CreaCampo('FIDEICOMISO',ftString,tsNinguno,tsNinguno,True);
                FIDEICOMISO.Caption:='Fideicomiso';
      B_AUT_LEG_LOCAL :=CreaCampo('B_AUT_LEG_LOCAL',ftString,tsNinguno,tsNinguno,True);
                B_AUT_LEG_LOCAL.Caption:='Aut Leg Local';
      B_MEC_CLARO_PAGO :=CreaCampo('B_MEC_CLARO_PAGO',ftString,tsNinguno,tsNinguno,True);
                B_MEC_CLARO_PAGO.Caption:='Mec Claro Pago';
      B_OPIN_DESP_JUR :=CreaCampo('B_OPIN_DESP_JUR',ftString,tsNinguno,tsNinguno,True);
                B_OPIN_DESP_JUR.Caption:='Opin Desp Jur';
      B_OPIN_INTER_JUR :=CreaCampo('B_OPIN_INTER_JUR',ftString,tsNinguno,tsNinguno,True);
                B_OPIN_INTER_JUR.Caption:='Opin Inter Jur';
      B_COBERTURA_TASA :=CreaCampo('B_COBERTURA_TASA',ftString,tsNinguno,tsNinguno,True);
                B_COBERTURA_TASA.Caption:='Cobertura Tasa';
      B_APL_INSCR_DEUD :=CreaCampo('B_APL_INSCR_DEUD',ftString,tsNinguno,tsNinguno,True);
                B_APL_INSCR_DEUD.Caption:='Apl Inscr Deud';
      NUM_INSCR_DEUDA :=CreaCampo('NUM_INSCR_DEUDA',ftString,tsNinguno,tsNinguno,True);
                NUM_INSCR_DEUDA.Caption:='Inscr Deud E';
      INS_FEDERAL :=CreaCampo('INS_FEDERAL',ftString,tsNinguno,tsNinguno,True);
                INS_FEDERAL.Caption:='Inscr Deud F';
	    F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA_INSCR_DEU :=CreaCampo('F_ALTA_INSCR_DEU',ftDate,tsNinguno,tsNinguno,True);
      F_PROG_INSCR_D :=CreaCampo('F_PROG_INSCR_D',ftDate,tsNinguno,tsNinguno,True);


      FKeyFields.Add('ID_CONTRATO');
      //FKeyFields.Add('F_ALTA');

      TableName := 'CR_TIPOS_GARAN';
      UseQuery := True;
      HelpFile := 'IntCrTipGar.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCrTipGar.Destroy;
begin
//
inherited;
end;


function TCrTipGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTiposGaran;
begin
   W:=TWCrTiposGaran.Create(Self);
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


Function TCrTipGar.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRTIGA.IT','F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrTipGar.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_TIPOS_GARAN********************)
(*                                                                              *)
(*  FORMA DE CR_TIPOS_GARAN                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPOS_GARAN********************)

procedure TWCrTiposGaran.FormShow(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control := edID_CONTRATO;
      Objeto.POSICION.Control := rgPOSICION;
      Objeto.FUENTE_PAGO.Control := rgFUENTE_PAGO;
      Objeto.TIPO_LINEA.Control := rgTIPO_LINEA;
      Objeto.ING_PROPIOS.Control := chbING_PROPIOS;
      Objeto.GAR_PART.Control := cbhGAR_PART;
      Objeto.GAR_APORT.Control := chbGAR_APORT;
      Objeto.MON_GAR_PART.Control := edMON_GAR_PART;
      Objeto.MON_GAR_APORT.Control := edMON_GAR_APORT;
      Objeto.MON_ING_PROPIOS.Control := edMON_ING_PROPIOS;
      Objeto.F_REG_GAR_PART.Control := edF_REG_GAR_PART;
      Objeto.F_REG_GAR_APORT.Control := edF_REG_GAR_APORT;
      Objeto.F_REG_ING_PROPIOS.Control := edF_REG_ING_PROPIOS;
      Objeto.PCT_PART.Control := edPCT_PART;
      Objeto.PCT_APORT.Control := edPCT_APORT;
      Objeto.PCT_ING_PROP.Control := edPCT_ING_PROP;
      Objeto.MANDATO.Control := chbMANDATO;
      Objeto.INS_IRREV.Control := chbINS_IRREV;
      Objeto.FIDEICOMISO.Control := chbFIDEICOMISO;
      Objeto.B_COBERTURA_TASA.Control := chbB_COBERTURA_TASA;
      Objeto.B_AUT_LEG_LOCAL.Control := chbB_AUT_LEG_LOCAL;
      Objeto.B_MEC_CLARO_PAGO.Control := chbB_MEC_CLARO_PAGO;
      Objeto.B_OPIN_DESP_JUR.Control := chbB_OPIN_DESP_JUR;
      Objeto.B_OPIN_INTER_JUR.Control := chbB_OPIN_INTER_JUR;
      Objeto.B_REPORTE_SIC.Control := chbB_REPORTE_SIC;
      Objeto.B_GTIA_LEY_FED.Control := chbB_GTIA_LEY_FED;
      Objeto.B_CONT_GUBERNA.Control := chbB_CONT_GUBERNA;
      Objeto.B_APL_INSCR_DEUD.Control := chbB_APL_INSCR_DEUD;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.NUM_INSCR_DEUDA.Control := edNUM_INSCR_DEUDA;
      Objeto.INS_FEDERAL.Control := edINS_FEDERAL;
      Objeto.F_ALTA_INSCR_DEU.Control := edF_ALTA_INSCR_DEU;
      Objeto.F_PROG_INSCR_D.Control := edF_PROG_INSCR_D;
      Objeto.F_ALTA_INSCR_DEU.Control:=edF_ALTA_INSCR_DEU;
      Objeto.F_PROG_INSCR_D.Control:=edF_PROG_INSCR_D;

end;

procedure TWCrTiposGaran.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control := nil;
      Objeto.POSICION.Control := nil;
      Objeto.FUENTE_PAGO.Control := nil;
      Objeto.TIPO_LINEA.Control := nil;
      Objeto.ING_PROPIOS.Control := nil;
      Objeto.GAR_PART.Control := nil;
      Objeto.GAR_APORT.Control := nil;
      Objeto.MON_GAR_PART.Control := nil;
      Objeto.MON_GAR_APORT.Control := nil;
      Objeto.MON_ING_PROPIOS.Control := nil;
      Objeto.F_REG_GAR_PART.Control := nil;
      Objeto.F_REG_GAR_APORT.Control := nil;
      Objeto.F_REG_ING_PROPIOS.Control := nil;
      Objeto.PCT_PART.Control := nil;
      Objeto.PCT_APORT.Control := nil;
      Objeto.PCT_ING_PROP.Control := nil;
      Objeto.MANDATO.Control := nil;
      Objeto.INS_IRREV.Control := nil;
      Objeto.FIDEICOMISO.Control := nil;
      Objeto.B_COBERTURA_TASA.Control := nil;
      Objeto.B_AUT_LEG_LOCAL.Control := nil;
      Objeto.B_MEC_CLARO_PAGO.Control := nil;
      Objeto.B_OPIN_DESP_JUR.Control := nil;
      Objeto.B_OPIN_INTER_JUR.Control := nil;
      Objeto.B_REPORTE_SIC.Control := nil;
      Objeto.B_GTIA_LEY_FED.Control := nil;
      Objeto.B_CONT_GUBERNA.Control := nil;
      Objeto.B_APL_INSCR_DEUD.Control := nil;
      Objeto.F_ALTA.Control  :=  nil;
      Objeto.CVE_USU_ALTA.Control  :=  nil;
      Objeto.NUM_INSCR_DEUDA.Control := nil;
      Objeto.INS_FEDERAL.Control := nil;
      Objeto.F_ALTA_INSCR_DEU.Control := nil;
      Objeto.F_PROG_INSCR_D.Control := nil;

   //Objeto
end;

procedure TWCrTiposGaran.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTiposGaran.InterForma1DespuesNuevo(Sender: TObject);
var
  qryDatos : TQuery;
  strSQL : String;
begin

  strSQL := '' +
      ' select id_contrato,  b_apl_inscr_deud, num_inscr_deuda, cve_tip_inscr_d, ' +
      '     cve_fuente_pago, f_alta_inscr_deu, f_prog_inscr_d ' +
      ' from cr_contrato where id_contrato = ' + strContrato;

   with Objeto do
   begin
      if bolEsNuevo  then
      begin
        qryDatos := GetSQLQuery(strSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, True);

        if Assigned(qryDatos) and NOT( qryDatos.IsEmpty ) THEN
        begin
          edID_CONTRATO.text := strContrato;
          edNUM_INSCR_DEUDA.Text := qryDatos.FieldByName('NUM_INSCR_DEUDA').AsString;
          edF_ALTA_INSCR_DEU.Text := qryDatos.FieldByName('F_ALTA_INSCR_DEU').AsString;
          edF_PROG_INSCR_D.text := qryDatos.FieldByName('F_PROG_INSCR_D').AsString;
          if qryDatos.FieldByName('B_APL_INSCR_DEUD').AsString = 'V' then
            chbB_APL_INSCR_DEUD.Checked := true
          else chbB_APL_INSCR_DEUD.Checked := false
        end;

        qryDatos.Free;

      end;
   end;
   
end;

procedure TWCrTiposGaran.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;

  cbhGAR_PARTClick(Self);
  chbGAR_APORTClick(Self);
  chbING_PROPIOSClick(Self);
  chbB_APL_INSCR_DEUDClick(Self);

end;

//procedure TWCrTiposGaran.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrTiposGaran.FormActivate(Sender: TObject);
begin
  // Esto lo hacemos por que por alguna razon no me permite la pantalla
  //  asignar el nuero de contrato heredado de la pantalla de Contrato.
  //  Solo es efecto visual
  // Los registros nuevos se manejan desde "intCrCto"
  InterForma1.BtnNuevo.Enabled := false;
  InterForma1.BtnNuevo.Visible := false;

end;

procedure TWCrTiposGaran.InterForma1BtnBuscarClick(Sender: TObject);
begin
  // Los datos del contrato "Objeto.ID_CONTRATO.AsString" lo pasamos desde que llamamos a forma
  Objeto.BuscaWhereString:= ' ID_REG_VIGENTE = 1 AND ID_CONTRATO = ' + QuotedStr( Objeto.ID_CONTRATO.AsString );
  Objeto.FilterString := Objeto.BuscaWhereString;

  if Objeto.Busca then
     InterForma1.NextTab(edID_CONTRATO);

end;

procedure TWCrTiposGaran.InterForma1DespuesAceptar(Sender: TObject);
var
  strSQL : string;
begin
  strSQL := '' +
    ' Update Cr_Contrato ' +
    '    Set B_Apl_Inscr_Deud = ' +  QuotedStr( BooleanToString(chbB_APL_INSCR_DEUD.Checked) )+
    '        ,Num_Inscr_Deuda  = ' + QuotedStr( Objeto.NUM_INSCR_DEUDA.AsString )+
    '        ,Cve_Tip_Inscr_D  = ' + QuotedStr('') +
    '        ,Cve_Fuente_Pago  = ' + QuotedStr('') +
    '        ,F_Alta_Inscr_Deu = to_date(' + QuotedStr(Objeto.F_ALTA_INSCR_DEU.AsString) + ', ' + QuotedStr('dd/mm/yyyy') + ')' +
    '        ,F_Prog_Inscr_D   = to_date(' + QuotedStr(Objeto.F_PROG_INSCR_D.AsString) + ', ' + QuotedStr('dd/mm/yyyy') + ')' +
    '  Where Id_Contrato = ' + QuotedStr(Objeto.ID_CONTRATO.AsString);

  RunSQL(strSQL, Objeto.DataBaseName, Objeto.SessionName, true);
  
end;

function TWCrTiposGaran.BooleanToString(ABool: Boolean): String;
var
   resultado : String;
begin
   if ABool then
      resultado := 'V'
   else
      resultado := 'F';

   Result := resultado;
end;

procedure TWCrTiposGaran.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

   with Objeto do
   begin
      if IsNewData then
      begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
           CVE_USU_ALTA.AsString := DameUsuario;
           F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
         end else
            Realizado := False;
      end else
      begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            {CVE_USU_MODIFICA.AsString := DameUsuario;
            FH_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');  }
            Realizado := True;
         end else
            Realizado := False;
      end

   end;

end;

procedure TWCrTiposGaran.chbING_PROPIOSClick(Sender: TObject);
begin

  if chbING_PROPIOS.Checked then
  begin
    ActivaComponente(edMON_ING_PROPIOS, true);
    ActivaComponente(edF_REG_ING_PROPIOS, true);
    ActivaComponente(InterDateTimePicker3, true);
    ActivaComponente(edPCT_ING_PROP, true);
  end
  else begin
    ActivaComponente(edMON_ING_PROPIOS, false);
    ActivaComponente(edF_REG_ING_PROPIOS, false);
    ActivaComponente(InterDateTimePicker3, false);
    ActivaComponente(edPCT_ING_PROP, false);
  end;

end;

procedure TWCrTiposGaran.chbGAR_APORTClick(Sender: TObject);
begin

  if chbGAR_APORT.Checked then
  begin
    ActivaComponente(edMON_GAR_APORT, true);
    ActivaComponente(edF_REG_GAR_APORT, true);
    ActivaComponente(InterDateTimePicker2, true);
    ActivaComponente(edPCT_APORT, true);
  end
  else begin
    ActivaComponente(edMON_GAR_APORT, false);
    ActivaComponente(edF_REG_GAR_APORT, false);
    ActivaComponente(InterDateTimePicker2, false);
    ActivaComponente(edPCT_APORT, false);
  end;

end;

procedure TWCrTiposGaran.cbhGAR_PARTClick(Sender: TObject);
begin

  if cbhGAR_PART.Checked then
  begin
    ActivaComponente(edMON_GAR_PART, true);
    ActivaComponente(edF_REG_GAR_PART, true);
    ActivaComponente(InterDateTimePicker1, true);
    ActivaComponente(edPCT_PART, true);
  end
  else begin
    ActivaComponente(edMON_GAR_PART, false);
    ActivaComponente(edF_REG_GAR_PART, false);
    ActivaComponente(InterDateTimePicker1, false);
    ActivaComponente(edPCT_PART, false);
  end;

end;

procedure TWCrTiposGaran.chbB_APL_INSCR_DEUDClick(Sender: TObject);
begin

  if chbB_APL_INSCR_DEUD.Checked then
  begin
    ActivaComponente(edNUM_INSCR_DEUDA, true);
    ActivaComponente(edINS_FEDERAL, true);
    ActivaComponente(edF_ALTA_INSCR_DEU, true);
    ActivaComponente(edF_PROG_INSCR_D, true);
    ActivaComponente(idtpF_ALTA_INSCR_DEU, true);
    ActivaComponente(idtpF_PROG_INSCR_D, true);
  end
  else begin
    ActivaComponente(edNUM_INSCR_DEUDA, false);
    ActivaComponente(edINS_FEDERAL, false);
    ActivaComponente(edF_ALTA_INSCR_DEU, false);
    ActivaComponente(edF_PROG_INSCR_D, false);
    ActivaComponente(idtpF_ALTA_INSCR_DEU, false);
    ActivaComponente(idtpF_PROG_INSCR_D, false);
  end;

end;

procedure TWCrTiposGaran.ActivaComponente(Objeto: TObject;
  Activar: Boolean);
begin

    if Objeto is TEdit   then
      TEdit(Objeto).Enabled := Activar
    else if Objeto is TInterEdit   then
      TInterEdit(Objeto).Enabled := Activar
    else if Objeto is TInterDateTimePicker then
      TInterDateTimePicker(Objeto).Enabled := Activar
    else if Objeto is TComboBox then
      TComboBox(Objeto).Enabled := Activar

end;

procedure TWCrTiposGaran.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  strContrato := Objeto.ID_CONTRATO.AsString;
end;

end.
