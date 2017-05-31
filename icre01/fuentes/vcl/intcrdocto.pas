{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CR_DOCUMENTO
// Fecha de Inicio : 03/07/2003
// Función forma   : Clase de CR_DOCUMENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrDocto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

//Unidades Adicionales
IntCrCesion,
IntParamCre,
IntCrEmisDoc,
IntGenCre,
IntCtoPanel,
IntCrCto, IntCrCredito;

Type
 TCrDocto= class;

  TWCrDocto=Class(TForm)
    InterForma1   : TInterForma;
    lbSITUACION: TLabel;
    lbSIT_DOCUMENTO: TLabel;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    lbUSUA_AUTOR: TLabel;
    lbF_AUTOR: TLabel;
    edF_ALTA: TEdit;
    edF_MODIF: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    edCVE_USUA_AUTOR: TEdit;
    edF_AUTOR: TEdit;
    GroupBox1: TGroupBox;
    btCVE_DOCTO: TBitBtn;
    edDESC_TIPO_DOCTO: TEdit;
    lbID_CESION: TLabel;
    edID_CESION: TEdit;
    lbID_DOCUMENTO: TLabel;
    edID_DOCUMENTO: TEdit;
    lbNUM_PERIODO_DOC: TLabel;
    edNUM_PERIODO_DOC: TEdit;
    lbCVE_DOCUMENTO: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btCESION: TBitBtn;
    edTITULAR: TEdit;
    ilCESION: TInterLinkit;
    ilCVE_DOCTO: TInterLinkit;
    icpCONTRATO: TInterCtoPanel;
    lbCVE_EMISOR_NAFIN: TLabel;
    edCVE_PROV: TEdit;
    edNOMBRE_PROV: TEdit;
    edID_NAFINSA: TEdit;
    GroupBox3: TGroupBox;
    Bevel3: TBevel;
    Label10: TLabel;
    btCALCULA_DIAS: TSpeedButton;
    Label11: TLabel;
    Bevel4: TBevel;
    Label3: TLabel;
    lbF_EMISION: TLabel;
    lbF_COMPRA: TLabel;
    edF_VENCIMIENTO: TEdit;
    InterDateTimePicker3: TInterDateTimePicker;
    edF_PROGRAMADA: TEdit;
    edF_EMISION: TEdit;
    dtpF_EMISION: TInterDateTimePicker;
    edF_COMPRA: TEdit;
    dtpF_COMPRA: TInterDateTimePicker;
    rgCVE_TIPO_INTERES: TRadioGroup;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbTASA_FONDEO: TLabel;
    lbSOBRETASA: TLabel;
    lbTASA_DESCUENTO: TLabel;
    lbTASA_AFORO: TLabel;
    edTASA_FONDEO: TInterEdit;
    edSOBRETASA: TInterEdit;
    edTASA_DESCUENTO: TInterEdit;
    edTASA_AFORO: TInterEdit;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    lbIMP_NOMINAL: TLabel;
    lbIMP_COMPRA: TLabel;
    edREMANENTE: TInterEdit;
    edIMP_COMPRA: TInterEdit;
    edIMP_NOMINAL: TInterEdit;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edTOTAL_COMPRA: TInterEdit;
    edTOTAL_NOMINAL: TInterEdit;
    edPLAZO_DOCTO: TInterEdit;
    btCANCELA_DOCTO: TBitBtn;
    btCANCELA_BLOQUE: TBitBtn;
    Label2: TLabel;
    edIMP_AFORADO: TInterEdit;
    lbTASA_COMISION: TLabel;
    edTASA_COMISION: TInterEdit;
    Bevel5: TBevel;
    cbB_ALAMBRADA: TCheckBox;
    GroupBox7: TGroupBox;
    edDias_pago: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edF_INGRESO: TEdit;
    edF_VencR: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCESIONClick(Sender: TObject);
    procedure ilCESIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilCESIONEjecuta(Sender: TObject);
    procedure edIDCESIONExit(Sender: TObject);
    procedure btCVE_DOCTOClick(Sender: TObject);
    procedure ilCVE_DOCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_DOCTOEjecuta(Sender: TObject);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure edID_DOCUMENTOExit(Sender: TObject);
    procedure edF_COMPRAExit(Sender: TObject);
    procedure edF_EMISIONExit(Sender: TObject);
    procedure edIMP_NOMINALExit(Sender: TObject);
    procedure edTASA_AFOROExit(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    procedure btCALCULA_DIASClick(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure edPLAZO_DOCTOExit(Sender: TObject);
    Procedure consultas;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edTASA_DESCUENTOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCANCELA_BLOQUEClick(Sender: TObject);
    procedure btCANCELA_DOCTOClick(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure InterDateTimePicker3CloseUp(Sender: TObject);
    procedure cbB_ALAMBRADAExit(Sender: TObject);
    procedure edID_DOCUMENTOEnter(Sender: TObject);
    procedure edF_INGRESOExit(Sender: TObject);
    Function  ValFechaHabil(pFecha: TDate) : TDate;
    private
    { Private declarations }
       Procedure TotalImportes(peIdCesion : Integer);
    public
    { Public declarations }
    Objeto : TCrDocto;
end;
 TCrDocto= class(TInterFrame)
      private
      protected

      public
        { Public declarations }
        vgCesion                 : String;
        ID_CESION                : TInterCampo;
        ID_DOCUMENTO             : TInterCampo;
        NUM_PERIODO_DOC          : TInterCampo;
        CVE_TIPO_INTERES         : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;
        F_COMPRA                 : TInterCampo;
        F_EMISION                : TInterCampo;
        IMP_NOMINAL              : TInterCampo;
        IMP_COMPRA               : TInterCampo;
        TASA_FONDEO              : TInterCampo;
        TASA_COMISION            : TInterCampo;
        SOBRETASA                : TInterCampo;
        TASA_DESCUENTO           : TInterCampo;
        TASA_AFORO               : TInterCampo;
        SIT_DOCUMENTO            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_AUTORIZA               : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        ID_CONTRATO              : TInterCampo;
        FOL_CONTRATO             : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        ID_PROV_NAFINSA          : TInterCampo;
        PLAZO_DOCTO              : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        F_PROGRAMADA             : TInterCampo;
        IMP_REMANENTE            : TInterCampo;
        TOTAL_COMPRA             : TInterCampo;
        TOTAL_NOMINAL            : TInterCampo;
        IMP_AFORADO              : TInterCampo;
        B_ALAMBRADA              : TInterCampo;
        F_INGRESO_DOC            : TInterCampo;
        F_VENC_REAL              : TInterCampo;
        //Clases Adcionales
        ParamCre                 : TParamCre;
        Cesion                   : TCrCesion;
        Docto                    : TCrEmisDoc;
        CreCto                   : TCrCto;
        Credito                  : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   CambioSituacion(Sender: TObject);
        Function    InternalPost : Boolean; override;
        Procedure   ObtTasaFondeo;
        Procedure   ObtSobreTasa;
        Procedure   ObtTasaDescuento;
        Procedure   ObtImpAforo;
        Procedure   ObtImpCompra;
        Function    InsertaDocto : Boolean;
        procedure   StpObtRemanente(pImpDepositado, pFactorMoras : Double);
        function    STPCANCELADOCTO( peIdCesion : Integer; peIdDocto : String;
                                     peNumPerDoc : Integer; peImpAforado : Double) : Boolean;
        procedure   STPOBTFPROGPAGO(peAcreditado: Integer);//(peAcreditado: Integer; peFOrigen : TDateTime);
      published
      end;

   var  Query1, Query2, Query3 : TQuery; // JFOF ENE-2013
        vlgbaplica : String;

implementation
Uses IntCrCalDia, //Convierte meses o años a dias
     IntCrCanDoc // cancela documentos en bloque
     ;

{$R *.DFM}


constructor TCrDocto.Create( AOwner : TComponent );
begin Inherited;
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Cesión';
      ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                ID_DOCUMENTO.Caption:='Documento';
      NUM_PERIODO_DOC :=CreaCampo('NUM_PERIODO_DOC',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO_DOC.Caption:='Periodo';
      CVE_TIPO_INTERES :=CreaCampo('CVE_TIPO_INTERES',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIPO_INTERES do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('IN');
                ComboLista.Add('1'); ComboDatos.Add('VE');
          end;
                CVE_TIPO_INTERES.Caption:='Tipo Interés';
      CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_DOCUMENTO.Caption:='Clave Documento';
      F_COMPRA :=CreaCampo('F_COMPRA',ftDate,tsNinguno,tsNinguno,True);
                F_COMPRA.Caption:='Fecha Compra';
      F_EMISION :=CreaCampo('F_EMISION',ftDate,tsNinguno,tsNinguno,True);
                F_EMISION.Caption:='Fecha Emisión';
      IMP_NOMINAL :=CreaCampo('IMP_NOMINAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_NOMINAL.Caption:='Importe Nominal';
      IMP_COMPRA :=CreaCampo('IMP_COMPRA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMPRA.Caption:='Importe Compra';
      TASA_FONDEO :=CreaCampo('TASA_FONDEO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_FONDEO.Caption:='Tasa Fondeo';
      TASA_COMISION :=CreaCampo('TASA_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                TASA_COMISION.Caption:='Tasa Comisión';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';
      TASA_DESCUENTO :=CreaCampo('TASA_DESCUENTO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_DESCUENTO.Caption:='Tasa Descuento';
      TASA_AFORO :=CreaCampo('TASA_AFORO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_AFORO.Caption:='Tasa Aforo';
      SIT_DOCUMENTO :=CreaCampo('SIT_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      With SIT_DOCUMENTO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('NO AUTORIZADO'); ComboDatos.Add('NA');
                ComboLista.Add('AUTORIZADO');    ComboDatos.Add('AU');
                ComboLista.Add('ACTIVO');        ComboDatos.Add('AC');
                ComboLista.Add('CANCELADO');     ComboDatos.Add('CA');
                ComboLista.Add('LIQUIDADO');     ComboDatos.Add('LQ');
          end;
                SIT_DOCUMENTO.Caption:='Situación Documento';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_AUTORIZA :=CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,True);
                F_AUTORIZA.Caption:='Fecha Autoriza';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      FOL_CONTRATO :=CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,False);
      ID_PROV_NAFINSA :=CreaCampo('ID_PROV_NAFINSA',ftFloat,tsNinguno,tsNinguno,False);
      PLAZO_DOCTO :=CreaCampo('PLAZO_DOCTO',ftFloat,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
      F_PROGRAMADA :=CreaCampo('F_PROGRAMADA',ftDate,tsNinguno,tsNinguno,False);
      IMP_REMANENTE :=CreaCampo('IMP_REMANENTE',ftFloat,tsNinguno,tsNinguno,False);
      TOTAL_COMPRA :=CreaCampo('TOTAL_COMPRA',ftFloat,tsNinguno,tsNinguno,False);
      TOTAL_NOMINAL :=CreaCampo('TOTAL_NOMINAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_AFORADO :=CreaCampo('IMP_AFORADO',ftFloat,tsNinguno,tsNinguno,False);
      B_ALAMBRADA := CreaCampo('B_ALAMBRADA',ftString,tsNinguno,tsNinguno,True);
      F_INGRESO_DOC := CreaCampo('F_INGRESO_DOC',ftDate,tsNinguno,tsNinguno,True);
      F_VENC_REAL := CreaCampo('F_VENC_REAL',ftDate,tsNinguno,tsNinguno,True);


      FKeyFields.Add('ID_CESION');
      FKeyFields.Add('ID_DOCUMENTO');

      TableName := 'CR_DOCUMENTO';
      UseQuery := True;
      HelpFile := 'IntCrDocto.Hlp';
      ShowMenuReporte:=True;

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource:=Self;
      Cesion.FieldByName('ID_CESION').MasterField:='ID_CESION';

      Docto := TCrEmisDoc.Create(Self);
      Docto.MasterSource:=Self;
      Docto.FieldByName('CVE_DOCUMENTO').MasterField:='CVE_DOCUMENTO';

      CreCto := TCrCto.Create(Self);
      CreCto.MasterSource:=Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CESION';

      SIT_DOCUMENTO.OnChange := CambioSituacion;
end;

Destructor TCrDocto.Destroy;
begin
   if vgCesion = '' then
       if Cesion <> nil then
          Cesion.Free;
       //end if
   //end if
   if Docto <> nil then
      Docto.Free;
   //end if
   if CreCto <> nil then
      CreCto.Free;
   //end if
   if Credito <> nil then
      Credito.Free;
   //end if
   inherited;
end;


function TCrDocto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrDocto;
begin
   W:=TWCrDocto.Create(Self);
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


Function TCrDocto.InternalBusca:Boolean;
Var T:TInterFindit;
    vlSAlida : Boolean;
begin InternalBusca := False;
      T := CreaBuscador('ICrDoct.it','F,S');
      Try if Active then begin T.Param(0,ID_CESION.AsString);
                               T.Param(1,ID_DOCUMENTO.AsString);
                               end;
          if T.Execute then
          Begin
             vlSalida := FindKey([T.DameCampo(0),T.DameCampo(1)]);
             if vlSalida then
                Cesion.CreCto.FindKey([credito.ContratoCre.ID_CONTRATO.AsString,'1']);
             //end if
          end;
          InternalBusca := vlSalida;
      finally  T.Free;
      end;
end;

//Cambia la situación del Documento
procedure TCrDocto.CambioSituacion(Sender: TObject);
begin
   If (SIT_DOCUMENTO.Control<>nil) and (SIT_DOCUMENTO.Control is TLabel) then
      TLabel(SIT_DOCUMENTO.Control).Caption:=SIT_DOCUMENTO.AsCombo;
   //END IF
end;

//Obtiene Tasa Fondeo
Procedure TCrDocto.ObtTasaFondeo;
var   spObtTasaFondeo : TStoredProc;
      VLBandera       : String;
Begin
       B_ALAMBRADA.GetFromControl;
       VLBandera := B_ALAMBRADA.AsString;
       try
         spObtTasaFondeo := TStoredProc.Create(Self);
         with spObtTasaFondeo do
         begin
            //Inicia el SPT
            spObtTasaFondeo.DatabaseName:= Apli.DatabaseName;
            spObtTasaFondeo.SessionName:= Apli.SessionName;
            spObtTasaFondeo.StoredProcName:= 'PKGCRPERIODO.STPOBTTASAFONDEO';

            // Se crean los parametros del StoreProcedure
            Params.Clear;
            Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
            Params.CreateParam(ftFloat,'PEPLAZO',ptInput);
            Params.CreateParam(ftString,'PEBALAMBRA',ptInput);
            Params.CreateParam(ftFloat,'PSTASAFONDEO',ptOutput);
            Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

            ParamByName('peIdCesion').AsInteger := Cesion.ID_CESION.AsInteger;
            ParamByName('pePlazo').AsInteger := PLAZO_DOCTO.AsInteger;
            ParamByName('PEbalambra').AsString := VLBandera;
            ExecProc;

            if (ParamByName('PSResultado').AsInteger = 0) then
            begin
               TASA_FONDEO.AsFloat := ParamByName('psTasaFondeo').AsFloat;
            end
            else
            Begin
               ShowMessage('PROBLEMAS AL OBTENER LA TASA FONDEO: ' +
                          IntToStr(ParamByName('psRESULTADO').AsInteger));
               ShowMessage(ParamByName('psTxResultado').AsString);
            end;
            //end if;
         end;
       finally
          spObtTasaFondeo.Free;
       end;
end;

//Obtiene SobreTasa
Procedure TCrDocto.ObtSobreTasa;
var   spObtSobreTasa : TStoredProc;
Begin
   try
     spObtSobreTasa := TStoredProc.Create(Self);
     with spObtSobreTasa do
     begin
        //Inicia el SPT
        spObtSobreTasa.DatabaseName:= Apli.DatabaseName;
        spObtSobreTasa.SessionName:= Apli.SessionName;
        spObtSobreTasa.StoredProcName:= 'PKGCRPERIODO.STPOBTSOBRETASA';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
        Params.CreateParam(ftFloat,'PSSOBRETASA',ptOutput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

        ParamByName('peIdCesion').AsInteger := Cesion.ID_CESION.AsInteger;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           SOBRETASA.AsFloat := ParamByName('psSobreTasa').AsFloat;
        end
        else
        Begin
           ShowMessage('PROBLEMAS AL OBTENER LA SOBRETASA: ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end;
        //end if;
     end;
   finally
      spObtSobreTasa.Free;
   end;
end;

//Obtiene Tasa Descuento
Procedure TCrDocto.ObtTasaDescuento;
var   spObtTasaDesc : TStoredProc;
Begin
   begin
        B_ALAMBRADA.GetFromControl;
        try
          spObtTasaDesc := TStoredProc.Create(Self);
          with spObtTasaDesc do
          begin
             //Inicia el SPT
             spObtTasaDesc.DatabaseName:= Apli.DatabaseName;
             spObtTasaDesc.SessionName:= Apli.SessionName;
             spObtTasaDesc.StoredProcName:= 'PKGCRPERIODO.STPOBTTASADESCTO';

             // Se crean los parametros del StoreProcedure
             Params.Clear;
             Params.CreateParam(ftFloat,'PETASAFONDEO',ptInput);
             Params.CreateParam(ftFloat,'PETASACOMISION',ptInput);
             Params.CreateParam(ftFloat,'PESOBRETASA',ptInput);
             Params.CreateParam(ftFloat,'PSTASADESCTO',ptOutput);
             Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
             Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
             //
             ParamByName('peTasaFondeo').AsFloat := TASA_FONDEO.AsFloat;
             ParamByName('peTasaComision').AsFloat := TASA_COMISION.AsFloat;
             ParamByName('peSobreTasa').AsFloat := SOBRETASA.AsFloat;
             ExecProc;

             if (ParamByName('PSResultado').AsInteger = 0) then
             begin
                TASA_DESCUENTO.AsFloat := ParamByName('psTasaDescto').AsFloat;
             end
             else
             Begin
                ShowMessage('PROBLEMAS AL OBTENER LA TASA DE DESCUENTO: ' +
                           IntToStr(ParamByName('psRESULTADO').AsInteger));
                ShowMessage(ParamByName('psTxResultado').AsString);
             end;
             //end if;
          end;
        finally
           spObtTasaDesc.Free;
        end;
   end;
end;

//Obtiene el importe Aforo
Procedure TCrDocto.ObtImpAforo;
var  vlsql        : String;
     vlsqlPeriodo : String;   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
     vlPeriodo    : String;   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
     vlImpAforado : String;
Begin
   vlsqlPeriodo:= 'SELECT COUNT(*) + 1 AS PERIODO FROM CR_DOCUMENTO ' +    //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
                  'WHERE ID_CESION = ' + Cesion.ID_CESION.AsString;        //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL

   GetSQLStr(vlsqlPeriodo, Apli.DataBaseName, Apli.SessionName, 'PERIODO', vlPeriodo, false);   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL

   IMP_NOMINAL.GetFromControl;
   TASA_AFORO.GetFromControl;
   //vlsql := ' SELECT PKGCRPERIODO.OBTENIMPAFORO( ' + IMP_NOMINAL.AsString +    //---DEINTEC.DF 02.MAYO.2008    REMOVED TO DESCUENTO MERCANTIL
   vlsql := ' SELECT PKGCRPERIODO.ObtenImpAforoMer( ' + IMP_NOMINAL.AsString +   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
//            ',' + TASA_AFORO.AsString + ' ) AS IMP_AFORADO ' + ' FROM DUAL';   //---DEINTEC.DF 02.MAYO.2008    REMOVED TO DESCUENTO MERCANTIL
//            ',' + TASA_AFORO.AsString + ', '''+ Cesion.CreCto.Producto.CVE_CAL_CAPITAL.AsString + ''', ' + vlPeriodo + ' ) AS IMP_AFORADO ' + ' FROM DUAL';     //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
            ',' + TASA_AFORO.AsString + ', '''+ 'TRA' + ''', ' + vlPeriodo + ' ) AS IMP_AFORADO ' + ' FROM DUAL';    //DEINTEC.DF PRUEBAS
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'IMP_AFORADO',vlImpAforado,False);
   IMP_AFORADO.AsFloat := StrToFloat(vlImpAforado);
end;

//Obtiene el importe de Compra
Procedure TCrDocto.ObtImpCompra;
var   spObtImpCompra : TStoredProc;
Begin
   CVE_TIPO_INTERES.GetFromControl;
   try
     spObtImpCompra := TStoredProc.Create(Self);
     with spObtImpCompra do
     begin
        //Inicia el SPT
        spObtImpCompra.DatabaseName:= Apli.DatabaseName;
        spObtImpCompra.SessionName:= Apli.SessionName;
        spObtImpCompra.StoredProcName:= 'PKGCRPERIODO.STPDESGLOZAAFORO';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString,'PECVETPOINT',ptInput);
        Params.CreateParam(ftFloat,'PEIMPAFORO',ptInput);
        Params.CreateParam(ftFloat,'PETASADESCTO',ptInput);
        Params.CreateParam(ftInteger,'PEPLAZO',ptInput);
        Params.CreateParam(ftFloat,'PSIMPCOMPRA',ptOutput);
        Params.CreateParam(ftFloat,'psImpInteres',ptOutput);
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        //
       // prepare;
        ParamByName('peCveTpoInt').AsString := Cesion.CVE_TIPO_INTERES.AsString;
        ParamByName('peImpAforo').AsFloat := IMP_AFORADO.AsFloat;
        ParamByName('peTasaDescto').AsFloat := TASA_DESCUENTO.AsFloat;
        ParamByName('pePlazo').AsInteger := PLAZO_DOCTO.AsInteger;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           IMP_COMPRA.AsFloat := ParamByName('psImpCompra').AsFloat;
        end
        else
        Begin
           ShowMessage('PROBLEMAS AL OBTENER EL IMPORTE DE COMPRA: ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end;
        //end if;
     end;
   finally
      spObtImpCompra.Free;
   end;
end;

//Inserta el Documento
function TCrDocto.InsertaDocto: Boolean;
var     VLSalida      : Boolean;
        STPObtDocto  : TStoredProc;
Begin
   VLSalida := False;
   try
      //Inicia el SPT
      PLAZO_DOCTO.GetFromControl;
      F_EMISION.GetFromControl;
      F_COMPRA.GetFromControl;

      STPObtDocto := TStoredProc.Create(Nil);
     with STPObtDocto do
     begin
        STPObtDocto.DatabaseName:= Apli.DatabaseName;
        STPObtDocto.SessionName:= Apli.SessionName;
        STPObtDocto.StoredProcName:='PKGCRCREDITO.STPALTADOCTO';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString,'peIdDocto',ptInput);
        Params.CreateParam(ftFloat,'peIdCesion',ptInput);
        Params.CreateParam(ftString,'peCveDocto',ptInput);
        Params.CreateParam(ftString,'peTipoInteres',ptInput);
        Params.CreateParam(ftDate,'peFEmision',ptInput);
        Params.CreateParam(ftDate,'peFCompra',ptInput);
        Params.CreateParam(ftFloat,'pePlazoCapital',ptInput);
        Params.CreateParam(ftFloat,'peImpNominal',ptInput);
        Params.CreateParam(ftFloat,'peTasaComision',ptInput);
        Params.CreateParam(ftFloat,'peImpCompra',ptInput);
        Params.CreateParam(ftFloat,'peTasaFondeo',ptInput);
        Params.CreateParam(ftFloat,'peSobretasa',ptInput);
        Params.CreateParam(ftFloat,'peTasaDescuento',ptInput);
        Params.CreateParam(ftFloat,'peTasaAforo',ptInput);
        Params.CreateParam(ftFloat,'peImpCapital',ptInput);
        Params.CreateParam(ftFloat,'peImpRemanente',ptInput);
        Params.CreateParam(ftDate,'peFAlta',ptInput);
        Params.CreateParam(ftString,'peCveUsuAlta',ptInput);
        Params.CreateParam(ftString,'peBAlambrada',ptInput);
        Params.CreateParam(ftDate,'peFIngresoDoc',ptInput);
        Params.CreateParam(ftDate,'peFVencReal',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'psNumPeriodoDoc',ptOutput);
        Params.CreateParam(ftString,'psSitDocto',ptOutput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        //
        ParamByName('peIdDocto').AsString := ID_DOCUMENTO.AsString;
        ParamByName('peIdCesion').AsFloat := ID_CESION.AsFloat;
        ParamByName('peCveDocto').AsString := CVE_DOCUMENTO.AsString;
        ParamByName('peTipoInteres').AsString := CVE_TIPO_INTERES.AsString;
        ParamByName('peFEmision').AsDateTime := F_EMISION.AsDateTime;
        ParamByName('peFCompra').AsDateTime := F_COMPRA.AsDateTime;
        ParamByName('pePlazoCapital').AsInteger := PLAZO_DOCTO.AsInteger;
        ParamByName('peImpNominal').AsFloat := IMP_NOMINAL.AsFloat;
        ParamByName('peTasaComision').AsFloat := TASA_COMISION.AsFloat;
        ParamByName('peImpCompra').AsFloat := IMP_COMPRA.AsFloat;
        ParamByName('peTasaFondeo').AsFloat:= TASA_FONDEO.AsFloat;
        ParamByName('peSobretasa').AsFloat:= SOBRETASA.AsFloat;
        ParamByName('peTasaDescuento').AsFloat := TASA_DESCUENTO.AsFloat;
        ParamByName('peTasaAforo').AsFloat:= TASA_AFORO.AsFloat;
        ParamByName('peImpCapital').AsFloat:= IMP_AFORADO.AsFloat;
        ParamByName('peImpRemanente').AsFloat:= IMP_REMANENTE.AsFloat;
        ParamByName('peFAlta').AsDateTime := F_ALTA.AsDateTime;
        ParamByName('peCveUsuAlta').AsString := CVE_USU_ALTA.AsString;
        ParamByName('peBAlambrada').AsString := B_ALAMBRADA.AsString;

        if F_INGRESO_DOC.IsNull then
        begin
        ParamByName('peFIngresoDoc').Clear;
        ParamByName('peFVencReal').Clear;
        end
        else
        begin
        ParamByName('peFIngresoDoc').AsDateTime := F_INGRESO_DOC.AsDateTime; // JFOF ENE-2013 SE AGREGA FECHA INGRESO DOCUMENTO
        ParamByName('peFVencReal').AsDateTime := F_VENC_REAL.AsDateTime;     // JFOF ENE-2013 SE AGREGA FECHA DE VENCIMIENTO REAL
        end;
        ParamByName('peBCommit').AsString := 'V';
        ExecProc;
        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           VLSalida := True;
           NUM_PERIODO_DOC.AsInteger := ParamByName('psNumPeriodoDoc').AsInteger;
           SIT_DOCUMENTO.AsString:= ParambyName('psSitDocto').AsString;
        end
        else // SI NO REALIZA LA CARGA MANDA ERRORES
        Begin
           ShowMessage('PROBLEMAS AL GUARDAR EL DOCUMENTO: ' +
           IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
           GenMsg('Credito' + ID_CESION.AsString + ' Doc' + ID_DOCUMENTO.AsString + 'Desc: ' +ParamByName('psTxResultado').AsString,Apli);
        end;

      end;
   finally
      STPObtDocto.Free;
   end;
   InsertaDocto := VLSalida;
end;

//STP PARA TRAER EL RAMENENTE
// -----------------------------------------------------------------------------
procedure TCrDocto.StpObtRemanente(pImpDepositado, pFactorMoras : Double);
var  STPObtRem : TStoredProc;
Begin
     STPObtRem := TStoredProc.Create(Nil);
     try
        with STPObtRem do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:='PKGCRPERIODO.STPOBTENREMANENTE';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftInteger,'PEMETODO',ptInput);
          Params.CreateParam(ftFloat,'PEIMP_NOMINAL',ptInput);
          Params.CreateParam(ftFloat,'PETASA_AFORO',ptInput);
          Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
          Params.CreateParam(ftString,'PEIDDOCUMENTO',ptInput);
          Params.CreateParam(ftDate,'PEFPAGO',ptInput);
          Params.CreateParam(ftFloat,'PEIMPDEPOSITADO',ptInput);
          Params.CreateParam(ftFloat,'PEFACTORMORAS',ptInput);
          Params.CreateParam(ftFloat,'PSIMPREMANENTE',ptOutput);
          Params.CreateParam(ftFloat,'PSIMPREMINTERES',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('PEMETODO').AsString := CMETODO1;
          ParamByName('PEIMP_NOMINAL').AsFloat := IMP_NOMINAL.AsFloat;
          ParamByName('PETASA_AFORO').AsFloat := TASA_AFORO.AsFloat;
          ParamByName('PEIDCESION').AsInteger := ID_CESION.AsInteger;
          ParamByName('PEIDDOCUMENTO').AsString := ID_DOCUMENTO.AsString;
          ParamByName('PEFPAGO').AsDate := F_PROGRAMADA.AsDateTime;
          ParamByName('PEIMPDEPOSITADO').AsFloat := pImpDepositado;
          ParamByName('PEFACTORMORAS').AsFloat := pFactorMoras;
          ExecProc;

          if (ParamByName('PSRESULTADO').AsInteger = 0) then
          Begin
              IMP_REMANENTE.AsFloat  := ParamByName('PSIMPREMANENTE').AsFloat;
          end
          else
          Begin
             ShowMessage('PROBLEMAS AL OBTENER EL REMANENTE: ' +
             IntToStr(ParamByName('PSRESULTADO').AsInteger));

             ShowMessage(ParamByName('PSTXRESULTADO').AsString);
          end;
        end;
     finally
          STPObtRem.Free;
     end;
end;


//Sobreescribiendo el Internal Post
function TCrDocto.InternalPost: Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;
     if Modo=moEdit then
     begin
          Result:=Inherited InternalPost;
     end;
     if Modo=moAppend then
     begin
        try
           VLSalida := InsertaDocto;
        Except
          on e: exception do
          begin
             Beep;Beep;Beep;Beep;
             ShowMessage('Problemas con el Alta del Documento. Avise Urgentemente a Sistemas');
             ShowMessage(e.Message);
          end;
        end;
     end;
     InternalPost := VLSalida;
end;

{-------------------------------------------------------------------------------------------
        CANCELACION DE DOCUMENTOS
-------------------------------------------------------------------------------------------}
function TCrDocto.STPCANCELADOCTO( peIdCesion : Integer; peIdDocto : String;
                                   peNumPerDoc : Integer; peImpAforado: Double) : Boolean;
var   sptCancelaDoc : TStoredProc;
      vlResultado    : Boolean;
Begin
   vlResultado := True;
   try
     sptCancelaDoc := TStoredProc.Create(Self);
     with sptCancelaDoc do
     begin
        //Inicia el SPT
        sptCancelaDoc.DatabaseName:= Apli.DatabaseName;
        sptCancelaDoc.SessionName:= Apli.SessionName;
        sptCancelaDoc.StoredProcName:= 'PKGCRCREDITO.STPCANCELADOCTO';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
        Params.CreateParam(ftString,'PEIDDOCTO',ptInput);
        Params.CreateParam(ftInteger,'PENUMPERDOC',ptInput);
        Params.CreateParam(ftFloat,'PEIMPAFORADO',ptInput);
        Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
        Params.CreateParam(ftDate,'PEFMODIFICA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCesion').AsInteger := peIdCesion;
        ParamByName('peIdDocto').AsString := peIdDocto;
        ParamByName('peNumPerDoc').AsInteger := peNumPerDoc;
        ParamByName('peImpAforado').AsFloat := peImpAforado;
        ParamByName('peCveUsuMod').AsString := Apli.Usuario;
        ParamByName('peFModifica').AsDateTime := Apli.DameFechaEmpresa;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage('PROBLEMAS AL CANCELAR EL DOCUMENTO: ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
           GenMsg('Credito' + IntToStr(peIdCesion) + ' Doc' + peIdDocto + 'Desc: ' +ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptCancelaDoc.Free;
   end;
   STPCANCELADOCTO := vlResultado;
end;
{-------------------------------------------------------------------------------------------
        OBTENCIÓN DE LA FECHA PROGRAMADA DE PAGO
-------------------------------------------------------------------------------------------}
procedure TCrDocto.STPOBTFPROGPAGO(peAcreditado: Integer);//; peFOrigen: TDateTime);
var  STPObtFProgPago : TStoredProc;
begin
     STPObtFProgPago := TStoredProc.Create(Nil);
     try
        with STPObtFProgPago do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:='PKGCRPERIODO.STPOBTENFECHA_DIASADIC';
          Params.Clear;
          Params.CreateParam(ftInteger,'PEID_ACREDITADO',ptInput);
          Params.CreateParam(ftDate,'PEFECHA_ORIGEN',ptInput);
          Params.CreateParam(ftDate,'PSFECHA_RESULTADO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peId_Acreditado').AsInteger := peAcreditado;
          ParamByName('peFecha_Origen').AsDateTime := F_VENCIMIENTO.AsDateTime;
          ExecProc;

          if (ParamByName('PSRESULTADO').AsInteger = 0) then
          Begin
              F_PROGRAMADA.AsDateTime  := ParamByName('PSFECHA_RESULTADO').AsDateTime;
          end
          else
          Begin
             ShowMessage('PROBLEMAS AL OBTENER LA FECHA PROGRAMADA DE PAGO: ' +
             IntToStr(ParamByName('PSRESULTADO').AsInteger));

             ShowMessage(ParamByName('PSTXRESULTADO').AsString);
          end;
        end;
     finally
          STPObtFProgPago.Free;
     end;
end;

(***********************************************FORMA CR_DOCUMENTO********************)
(*                                                                              *)
(*  FORMA DE CR_DOCUMENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_DOCUMENTO********************)
//Visualiza datos informativos
Procedure TWCrDocto.consultas;
var vlsqlP       : String;
    vlPlazo      : String;
Begin
   vlsqlP := ' SELECT PLAZO  FROM CR_CAPITAL ' +
             ' WHERE ID_CREDITO = ' + Objeto.ID_CESION.AsString +
             ' AND NUM_PERIODO = ' + Objeto.NUM_PERIODO_DOC.AsString;
   //Se visualiza el Plazo
   GetSQLStr(vlsqlP,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'PLAZO',vlPlazo,False);
   Objeto.PLAZO_DOCTO.AsString := vlPlazo;
   //Visualiza las fechas
   Objeto.F_VENCIMIENTO.AsDateTime := Objeto.F_COMPRA.AsDateTime + Objeto.PLAZO_DOCTO.AsInteger;
   Objeto.F_PROGRAMADA.AsDateTime:= Objeto.F_COMPRA.AsDateTime + Objeto.PLAZO_DOCTO.AsInteger;
end;

Procedure TWCrDocto.TotalImportes(peIdCesion : Integer);
var vlSqlIC      : String;
    vlSqlIN      : String;
    vlImpCompra  : String;
    vlImpNominal : String;
    vlsql        : String;
    vlImpAforo   : String;
Begin
   //Remanente
   Objeto.StpObtRemanente(Objeto.IMP_COMPRA.AsFloat, Objeto.Cesion.Credito.FACT_MORAS.AsFloat);
   if Objeto.Cesion.SIT_CESION.AsString <> CSIT_CA then
      if Objeto.Cesion.verifExisDoctos(Objeto.ID_CESION.AsInteger) > 0 then
      Begin
         Objeto.Cesion.ObtSaldosCesion(Objeto.ID_CESION.AsString);
         Objeto.Cesion.FindKey([peIdCesion]);
         edTOTAL_NOMINAL.Text := Objeto.Cesion.IMP_CESION.AsString;
      end;
   //end if
end;

procedure TWCrDocto.FormShow(Sender: TObject);
begin

      icpCONTRATO.Frame := Objeto.Cesion.CreCto.Contrato;
      icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.ID_DOCUMENTO.Control:=edID_DOCUMENTO;
      Objeto.NUM_PERIODO_DOC.Control:=edNUM_PERIODO_DOC;
      Objeto.CVE_TIPO_INTERES.Control:=rgCVE_TIPO_INTERES;
      Objeto.CVE_DOCUMENTO.Control:=edCVE_DOCUMENTO;
      Objeto.F_COMPRA.Control:=edF_COMPRA;
      Objeto.F_EMISION.Control:=edF_EMISION;
      Objeto.IMP_NOMINAL.Control:=edIMP_NOMINAL;
      Objeto.IMP_COMPRA.Control:=edIMP_COMPRA;
      Objeto.TASA_FONDEO.Control:=edTASA_FONDEO;
      Objeto.TASA_COMISION.Control:=edTASA_COMISION;
      Objeto.SOBRETASA.Control:=edSOBRETASA;
      Objeto.TASA_DESCUENTO.Control:=edTASA_DESCUENTO;
      Objeto.TASA_AFORO.Control:=edTASA_AFORO;
      Objeto.SIT_DOCUMENTO.Control:=lbSIT_DOCUMENTO;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
      Objeto.PLAZO_DOCTO.Control := edPLAZO_DOCTO;
      Objeto.F_VENCIMIENTO.Control :=edF_VENCIMIENTO;
      Objeto.F_PROGRAMADA.Control := edF_PROGRAMADA;
      Objeto.IMP_REMANENTE.Control := edREMANENTE;
      Objeto.Cesion.IMP_COMPRA.Control := edTOTAL_COMPRA;
      Objeto.Cesion.IMP_CESION.Control := edTOTAL_NOMINAL;
      Objeto.IMP_AFORADO.Control := edIMP_AFORADO;
      Objeto.F_AUTORIZA.Control:=edF_AUTOR;
      Objeto.CVE_USU_AUTORIZA.Control:=edCVE_USUA_AUTOR;
      Objeto.F_MODIFICA.Control:=edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USUA_MODIF;
      Objeto.B_ALAMBRADA.Control:=cbB_ALAMBRADA;
      Objeto.F_INGRESO_DOC.Control:=edF_INGRESO;
      Objeto.F_VENC_REAL.Control:=edF_VencR;


      Objeto.Cesion.ID_CESION.Control:=edID_CESION;
      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := edTITULAR;
      Objeto.Cesion.EmiProv.ID_PROVEEDOR.Control :=edCVE_PROV;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Cesion.EmiProv.Proveedor.ID_PROV_NAFINSA.Control := edID_NAFINSA;
      Objeto.Cesion.EmiProv.Proveedor.ID_PROV_EXTERNO.Control := edID_NAFINSA;
{/ROIM}
      Objeto.Cesion.EmiProv.Proveedor.Persona.Nombre.Control := edNOMBRE_PROV;
      Objeto.Cesion.Emisor.TASA_COMISION.Control := edTASA_COMISION;
      Objeto.Cesion.CVE_TIPO_INTERES.Control:=rgCVE_TIPO_INTERES;
      Objeto.Cesion.GetParams(Objeto);

      Objeto.Docto.TipoDocto.DESC_DOCUMENTO.Control := edDESC_TIPO_DOCTO;
      Objeto.Docto.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
      edF_VencR.Enabled := False;
end;

procedure TWCrDocto.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CESION.Control:=nil;
      Objeto.ID_DOCUMENTO.Control:=nil;
      Objeto.NUM_PERIODO_DOC.Control:=nil;
      Objeto.CVE_TIPO_INTERES.Control:=nil;
      Objeto.CVE_DOCUMENTO.Control:=nil;
      Objeto.F_COMPRA.Control:=nil;
      Objeto.F_EMISION.Control:=nil;
      Objeto.IMP_NOMINAL.Control:=nil;
      Objeto.IMP_COMPRA.Control:=nil;
      Objeto.TASA_FONDEO.Control:=nil;
      Objeto.TASA_COMISION.Control:=nil;
      Objeto.SOBRETASA.Control:=nil;
      Objeto.TASA_DESCUENTO.Control:=nil;
      Objeto.TASA_AFORO.Control:=nil;
      Objeto.SIT_DOCUMENTO.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.PLAZO_DOCTO.Control := nil;
      Objeto.F_VENCIMIENTO.Control :=nil;
      Objeto.F_PROGRAMADA.Control := nil;
      Objeto.IMP_REMANENTE.Control := nil;
      Objeto.Cesion.IMP_COMPRA.Control := nil;
      Objeto.Cesion.IMP_CESION.Control := nil;
      Objeto.IMP_AFORADO.Control := nil;
      Objeto.F_AUTORIZA.Control:=nil;
      Objeto.CVE_USU_AUTORIZA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.B_ALAMBRADA.Control:=nil;
      Objeto.F_INGRESO_DOC.Control:=nil;
      Objeto.F_VENC_REAL.Control:=nil;

      Objeto.Cesion.ID_CESION.Control:=nil;
      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := nil;
      Objeto.Cesion.EmiProv.ID_PROVEEDOR.Control :=nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Cesion.EmiProv.Proveedor.ID_PROV_NAFINSA.Control := nil;
      Objeto.Cesion.EmiProv.Proveedor.ID_PROV_EXTERNO.Control := nil;
{/ROIM}
      Objeto.Cesion.EmiProv.Proveedor.Persona.Nombre.Control := nil;
      Objeto.Cesion.Emisor.TASA_COMISION.Control := nil;
      Objeto.Cesion.CVE_TIPO_INTERES.Control:=nil;

      Objeto.Docto.TipoDocto.DESC_DOCUMENTO.Control := nil;
end;

procedure TWCrDocto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrDocto.InterForma1DespuesNuevo(Sender: TObject);
begin
   //SE INICIALIZAN INTERCAMPOS
   Objeto.SIT_DOCUMENTO.AsString := 'NA';
   Objeto.IMP_NOMINAL.AsFloat :=0;
   Objeto.IMP_AFORADO.AsFloat := 0;
   Objeto.IMP_COMPRA.AsFloat := 0;
   Objeto.TASA_FONDEO.AsFloat := 0;
   Objeto.TASA_COMISION.AsFloat := Objeto.Cesion.Emisor.TASA_COMISION.AsFloat;
   Objeto.CVE_TIPO_INTERES.AsString := Objeto.Cesion.CVE_TIPO_INTERES.AsString;
   Objeto.TASA_DESCUENTO.AsFloat := 0;
   Objeto.TASA_AFORO.AsFloat := 0;
   Objeto.SOBRETASA.AsFloat := 0;
   Objeto.ID_CESION.AsString := Objeto.Cesion.ID_CESION.AsString;
   Objeto.CVE_DOCUMENTO.AsString := Objeto.Docto.CVE_DOCUMENTO.AsString;
   Objeto.F_COMPRA.AsDateTime := Objeto.Apli.DameFechaEmpresa;//ValidaFecha(Objeto.Apli.DameFechaEmpresa,Objeto.Apli);
   Objeto.F_EMISION.AsDateTime := Objeto.Apli.DameFechaEmpresa;//ValidaFecha(Objeto.Apli.DameFechaEmpresa,Objeto.Apli);
   Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;//ValidaFecha(Objeto.Apli.DameFechaEmpresa,Objeto.Apli);
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   MuestraHints;
   if Objeto.ID_CESION.AsString <> CNULL then
      TotalImportes(Objeto.ID_CESION.AsInteger);
   //end if
   edID_DOCUMENTO.SetFocus;
end;

procedure TWCrDocto.InterForma1DespuesModificar(Sender: TObject);
begin
   icpCONTRATO.RefrescaInfo;
   edCVE_DOCUMENTO.SetFocus;
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   if Objeto.Cesion.SIT_CESION.AsString <> CSIT_CA then
      Objeto.Cesion.ObtSaldosCesion(Objeto.ID_CESION.AsString);
   //end if
   Objeto.Docto.TipoDocto.FindKey([Objeto.CVE_DOCUMENTO.AsString]); 
end;

procedure TWCrDocto.btCESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRDOCTO_CESION',True,True) then
   begin
       //LOLS 07 SEP 2005
       Objeto.Cesion.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPRESA(CR_CESION.ID_CESION) = ' +
                                         IntToStr(Objeto.Apli.IdEmpresa) +
                                         ' AND CR_CESION.SIT_CESION <> ' +  #39 + CSIT_CA + #39;
       Objeto.Cesion.FilterString := Objeto.Cesion.BuscaWhereString;
       //ENDS_LOLS_07_SEP_2005
       Objeto.Cesion.ShowAll := True;
       if Objeto.Cesion.Busca then
       Begin
          Objeto.Cesion.CreCto.FindKey([Objeto.cesion.credito.ContratoCre.ID_CONTRATO.AsString,'1']);
          icpCONTRATO.RefrescaInfo;//Refresca la informacion del Contrato
          if Objeto.Cesion.SIT_CESION.AsString <> CSIT_CA then
             Objeto.Cesion.ObtSaldosCesion(Objeto.ID_CESION.AsString);
          //end if
          InterForma1.NextTab(edID_CESION);
       end;
   end;
end;

procedure TWCrDocto.ilCESIONCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrDocto.ilCESIONEjecuta(Sender: TObject);
begin
   if Objeto.Cesion.FindKey([ilCESION.Buffer]) then
   Begin
      Objeto.Cesion.CreCto.FindKey([Objeto.cesion.credito.ContratoCre.ID_CONTRATO.AsString,'1']);
      icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato
      Objeto.TASA_COMISION.AsFloat := Objeto.Cesion.Emisor.TASA_COMISION.AsFloat;
      Objeto.CVE_TIPO_INTERES.AsString := Objeto.Cesion.CVE_TIPO_INTERES.AsString;
      InterForma1.NextTab(edID_CESION);
   end;
end;

procedure TWCrDocto.edIDCESIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLSalida := True;
      Objeto.ID_CESION.GetFromControl;
      If Objeto.ID_CESION.AsString = '' then
      Begin
          VLSalida := False;
          VLMsg:='Favor de Indicar el número de cesión';
      end;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Objeto.Docto.BuscaWhereString := (' (     CR_EMISOR_DOC.CVE_FND_ENT_DES = ' + Objeto.Cesion.CVE_FND_ENT_DES.AsString +
                                        '   AND CR_EMISOR_DOC.ID_EMISOR = ' + Objeto.Cesion.ID_EMISOR.AsString + ')');
{/ROIM}                                        
      Objeto.Docto.FilterString := Objeto.Docto.BuscaWhereString;
      InterForma1.ValidaExit(edID_CESION,VLSalida,VlMsg,True);
   End;
end;

procedure TWCrDocto.btCVE_DOCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRDOCTO_TDOCTO',True,True) then
   begin
     Objeto.Docto.ShowAll := True;
     if Objeto.Docto.Busca then
     Begin
        Objeto.TASA_AFORO.AsFloat := Objeto.Docto.TASA_AFORO.AsFloat;
        InterForma1.NextTab(edCVE_DOCUMENTO);
     end;
   end;
end;

procedure TWCrDocto.ilCVE_DOCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrDocto.ilCVE_DOCTOEjecuta(Sender: TObject);
begin
   if Objeto.Docto.FindKey( [Objeto.vgCesion,ilCVE_DOCTO.Buffer]) then
   Begin
      Objeto.TASA_AFORO.AsFloat := Objeto.Docto.TASA_AFORO.AsFloat;
      InterForma1.NextTab(edCVE_DOCUMENTO);
   end;
end;

procedure TWCrDocto.edCVE_DOCUMENTOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
        VLSql1,VLSql2,
        VlSql3          : String;
   Function VerificaDocto(pIdProveedor : String; pIdDocumento, pCvedocto : String): Boolean;
   var vlSql    : String;
       vlResult : Integer;
   Begin
      vlSql := ' SELECT pkgcrperiodo.VerifdoctoProv( ' +
                       Objeto.ID_CESION.AsString       + ' ,       ' +
//               SQLStr( Objeto.CVE_DOCUMENTO.AsString ) + ' ,       ' +
               SQLStr( Objeto.ID_DOCUMENTO.AsString  ) + ' ) RESULT' +
               ' FROM DUAL ';
      GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'RESULT',vlResult,False);
      if vlResult = 0 then
         Result := False
      else if vlResult >= 1 then
         Result := True;
   end;
begin
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLSalida := True;
      Objeto.CVE_DOCUMENTO.GetFromControl;
      If Objeto.CVE_DOCUMENTO.AsString = '' then
      Begin
          VLSalida := False;
          VLMsg:='Favor de indicar el tipo de documento';
      end
      else if VerificaDocto(Objeto.Cesion.ID_PROVEEDOR.AsString, Objeto.ID_DOCUMENTO.AsString,
                            Objeto.CVE_DOCUMENTO.AsString) then
      Begin
          VLSalida := False;
          VLMsg:='El documento ya existe';
      end;
     //JFOF ene-2013
     if edCVE_DOCUMENTO.Text <> '' then begin
      VLSql1 := '  SELECT emd.cve_fnd_ent_des, emd.id_emisor, emd.cve_documento, emd.dias_pago,'+
                '         emd.b_f_venc_real'+
                '    FROM cr_emisor_doc emd'+
                '   WHERE 1 = 1'+
                '     AND id_emisor =  (SELECT   id_emisor'+
                '                         FROM cr_cesion'+
                '                        WHERE id_cesion = '+ Objeto.ID_CESION.AsString +
                '                     GROUP BY id_emisor)'+
                '     AND emd.cve_documento = '''+ Objeto.CVE_DOCUMENTO.AsString+'''';

     Query1 :=  GetSQLQuery(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     if Query1 <> nil then
     begin
     edDias_pago.Text := Query1.FieldByName('dias_pago').AsString;
     vlgbaplica := Query1.FieldByName('b_f_venc_real').AsString;
     end;

     //JFOF ene-2013
     if (edDias_pago.Text = '') or (edDias_pago.text = '0') then
     begin
      VLSql2 := ' SELECT crt.cve_documento, crt.desc_documento, crt.dias_pago '+
                '   FROM cr_tipo_docto crt '+
                '  where 1=1 '+
                '    and cve_documento = '''+ Objeto.CVE_DOCUMENTO.AsString +'''';
     Query2 :=  GetSQLQuery(vlsql2, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     if Query2 <> nil then
     edDias_pago.Text := Query2.FieldByName('dias_pago').AsString;
     end;

     if (edDias_pago.text = '') or (edDias_pago.text = '0')  then
       begin
       if Query1 <> nil then begin
           if (Query1.FieldByName('b_f_venc_real').AsString = 'V') then
           begin
           VLSalida := False;
           VLMsg:='No existen días de pago para el emisor/documento';
         end;
        end;
      end;
     end;
     InterForma1.ValidaExit(edCVE_DOCUMENTO,VLSalida,VlMsg,True);
   End;
end;

procedure TWCrDocto.edID_DOCUMENTOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLSalida := True;
      Objeto.ID_DOCUMENTO.GetFromControl;
      If Objeto.ID_DOCUMENTO.AsString = '' then
      Begin
          VLSalida := False;
          VLMsg:='Favor de indicar el número de documento';
      end;
      InterForma1.ValidaExit(edID_DOCUMENTO,VLSalida,VlMsg,True);
   End;
end;

procedure TWCrDocto.edF_COMPRAExit(Sender: TObject);
var     VLSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VlMsg := '';
      VLSalida := True;
      Objeto.F_COMPRA.GetFromControl;
      Objeto.F_EMISION.GetFromControl;
      If Objeto.F_COMPRA.AsString <> '' then
         //Valida Feha no hábil
      Begin
         if ValidaFecha(Objeto.F_COMPRA.AsDateTime,Objeto.Apli) <> 0 then
         begin
            VLMsg := ' La fecha de compra es un día no hábil';
            VLSalida := False;
         end
         else if Objeto.F_COMPRA.AsDateTime > Objeto.Apli.DameFechaEmpresa then
         begin
            VLMsg := ' La fecha de compra no puede ser mayor a la de hoy';
            VLSalida := False;
         end
      end
      else //si es nula coloca la fecha de emisión
         Objeto.F_COMPRA.AsDateTime := Objeto.F_EMISION.AsDateTime;
      InterForma1.ValidaExit(edF_COMPRA,VLSalida,VlMsg,True);
   end;
end;

procedure TWCrDocto.edF_EMISIONExit(Sender: TObject);
var     VLSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VlMsg := '';
      VLSalida := True;
      Objeto.F_EMISION.GetFromControl;
      oBJETO.F_COMPRA.GetFromControl;
      If Objeto.F_EMISION.AsString <> '' then
      Begin
         if Objeto.F_EMISION.AsDateTime > Objeto.Apli.DameFechaEmpresa then
         begin
            VLMsg := ' La fecha de emsión no puede ser mayor a la de hoy';
            VLSalida := False;
         end
         //Valida Feha no hábil
         else if ValidaFecha(Objeto.F_EMISION.AsDateTime,Objeto.Apli) <> 0 then
         begin
            VLMsg := ' La fecha de emisión es un día no hábil';
            VLSalida := False;
         end;
      end
      else       //Si la fecha es nula le asigna la fecha de la empresa
         Objeto.F_EMISION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      InterForma1.ValidaExit(edF_EMISION,VLSalida,VlMsg,True);
   end;
end;

procedure TWCrDocto.edIMP_NOMINALExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.IMP_NOMINAL.GetFromControl;
      if Objeto.IMP_NOMINAL.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El importe nominal no debe de ser menor o igual a cero'
      end;
      Objeto.ObtImpAforo;
      Objeto.ObtImpCompra;
      Objeto.StpObtRemanente(Objeto.IMP_COMPRA.AsFloat, Objeto.Cesion.Credito.FACT_MORAS.AsFloat);
//      TotalImportes(Objeto.ID_CESION.AsInteger);
      InterForma1.NextTab(edIMP_NOMINAL);
      InterForma1.ValidaExit(edIMP_NOMINAL,VLSalida,VLMsg,True);

   end;
end;

procedure TWCrDocto.edTASA_AFOROExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.TASA_AFORO.GetFromControl;
      if not (ValNumPositivo(VlMsg,Objeto.TASA_AFORO.AsInteger)) then
         VLSalida := False;
      //end if
      InterForma1.ValidaExit(edTASA_AFORO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrDocto.InterForma1DespuesCancelar(Sender: TObject);
begin
   IF Objeto.vgCesion <> '' THEN
   beGIN
      Objeto.Cesion.CreCto.FindKey([Objeto.Cesion.CreCto.ID_CONTRATO.AsString,'1']);
      Objeto.Cesion.FindKey([Objeto.Cesion.ID_CESION.AsString]);
   END
   ELSE
   Begin
      Objeto.Cesion.CreCto.FindKey([Objeto.credito.ContratoCre.ID_CONTRATO.AsString,'1']);
      Objeto.Cesion.FindKey([Objeto.ID_CESION.AsString]);
   end;
   icpCONTRATO.RefrescaInfo;
   Objeto.Docto.TipoDocto.FindKey([Objeto.CVE_DOCUMENTO.AsString]);
   Objeto.Docto.TipoDocto.FindKey([Objeto.CVE_DOCUMENTO.AsString]);
   consultas;
   MuestraHints;
   if Objeto.SIT_DOCUMENTO.AsString = CSIT_CA then
      btCANCELA_DOCTO.Enabled := False
   else btCANCELA_DOCTO.Enabled := True;
   edDias_pago.Text := '';
end;

//Llama la ventana para convertir meses o años a Dias
Function TWCrDocto.VentanaCalculo(pDato : String): string;
var   CalDia : TCrCalDia;
      vlDias : String;
begin
   vlDias := pDato;
   CalDia := TCrCalDia.Create(Self);
   Try
      if CalDia.ShowModal = mrOk then
         if CalDia.edDIAS.Text <>'' then vlDias := CalDia.edDIAS.Text;
      //end if
   finally
      CalDia.Free;
   end;
   VentanaCalculo := vlDias;
end;

procedure TWCrDocto.btCALCULA_DIASClick(Sender: TObject);
begin
   if Objeto.Active then
      edPLAZO_DOCTO.Text:= VentanaCalculo(Objeto.PLAZO_DOCTO.AsString);
   //end if
end;

procedure TWCrDocto.edF_VENCIMIENTOExit(Sender: TObject);
var     VLSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VlMsg := '';
      VLSalida := True;
      Objeto.F_COMPRA.GetFromControl;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If Objeto.F_VENCIMIENTO.AsString = '' then
         Objeto.F_VENCIMIENTO.AsDateTime := Objeto.F_COMPRA.AsDateTime + Objeto.PLAZO_DOCTO.AsInteger
      else
      Begin
         if Objeto.F_COMPRA.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime then
         Begin
            VLMsg := ' La fecha de vencimiento no puede ser mayor a la fecha de compra';
            VLSalida := False;
         End
         else if Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Apli.DameFechaEmpresa then
         Begin
            VLMsg := ' La fecha de vencimiento no puede ser menor a la fecha de hoy';
            VLSalida := False;
         End
         else if ValidaFecha(Objeto.F_VENCIMIENTO.AsDateTime,Objeto.Apli) <> 0 then
         Begin
            VLMsg := ' La fecha de vencimiento no es un día hábil';
            VLSalida := False;
         End
         else
         begin
            Objeto.F_PROGRAMADA.AsDateTime:= Objeto.F_VENCIMIENTO.AsDateTime;
            Objeto.PLAZO_DOCTO.AsInteger := Objeto.F_VENCIMIENTO.AsInteger - Objeto.F_COMPRA.AsInteger;
            IF Objeto.PLAZO_DOCTO.AsInteger > 0 THEN
            BEGIN
                //llamar
                Objeto.ObtTasaFondeo;
                Objeto.ObtSobreTasa;
                Objeto.ObtTasaDescuento;
                Objeto.STPOBTFPROGPAGO(Objeto.Cesion.CreCto.Contrato.ID_Titular.AsInteger);
            END;
         end;
      end;
      InterForma1.ValidaExit(edF_VENCIMIENTO,VLSalida,VlMsg,True);
   end;
end;

procedure TWCrDocto.edPLAZO_DOCTOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.PLAZO_DOCTO.GetFromControl;
      IF Objeto.PLAZO_DOCTO.AsInteger <= 0 then
      Begin
         vlMsg := 'El plazo debe de ser mayor  a cero';
         vlSalida := False;
      end
      else
      Begin
         Objeto.F_VENCIMIENTO.AsDateTime := Objeto.F_COMPRA.AsDateTime + Objeto.PLAZO_DOCTO.AsInteger;
         if Objeto.F_COMPRA.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime then
         Begin
            VLMsg := ' La fecha de vencimiento no puede ser mayor a la fecha de compra';
            VLSalida := False;
         End
         else if Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Apli.DameFechaEmpresa then
         Begin
            VLMsg := ' La fecha de vencimiento no puede ser menor a la fecha de hoy';
            VLSalida := False;
         End
         else if ValidaFecha(Objeto.F_VENCIMIENTO.AsDateTime,Objeto.Apli) <> 0 then
         Begin
            VLMsg := ' La fecha de vencimiento no es un día hábil';
            VLSalida := False;
         End
         else
         begin
            Objeto.F_PROGRAMADA.AsDateTime:= Objeto.F_VENCIMIENTO.AsDateTime;
            //llamar
            Objeto.ObtTasaFondeo;
            Objeto.ObtSobreTasa;
            Objeto.ObtTasaDescuento;
            Objeto.STPOBTFPROGPAGO(Objeto.Cesion.CreCto.Contrato.ID_Titular.AsInteger);
         end;
      end;
      InterForma1.ValidaExit(edPLAZO_DOCTO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrDocto.InterForma1DespuesAceptar(Sender: TObject);
begin
   icpCONTRATO.RefrescaInfo;
   Objeto.Docto.TipoDocto.FindKey([Objeto.CVE_DOCUMENTO.AsString]);
   TotalImportes(Objeto.ID_CESION.AsInteger);

   MuestraHints;
end;

procedure TWCrDocto.InterForma1Buscar(Sender: TObject);
var vlsql: String;
    vlImpAforo : String;
    diaspago : String;
begin
    if (Objeto.ID_CESION.AsString <> CNULL) AND (Objeto.ID_DOCUMENTO.AsString = CNULL) then
   Begin
      //LOLS 07 SEP 2005
      //Objeto.BuscaWhereString := ('CR_DOCUMENTO.ID_CESION = ' + Objeto.ID_CESION.AsString);
      Objeto.BuscaWhereString := 'CR_DOCUMENTO.ID_CESION = ' + Objeto.ID_CESION.AsString +
                                 ' AND PKGCRACTUALIZA.STPOBTEMPRESA(CR_DOCUMENTO.ID_CESION) =' + IntToStr(Objeto.Apli.IdEmpresa);
      Objeto.FilterString := Objeto.BuscaWhereString;
      //ENDS_LOLS_07_SEP_2005
   end
   else
   Begin
      //LOLS 07 SEP 2005
      // Objeto.BuscaWhereString := '';
      Objeto.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPRESA(CR_DOCUMENTO.ID_CESION) =' + IntToStr(Objeto.Apli.IdEmpresa);
      Objeto.FilterString := Objeto.BuscaWhereString;
      //ENDS_LOLS_07_SEP_2005
   end;
   if Objeto.Busca then
   Begin
      edDias_pago.Text := '';  // jfof 27/02/2013 SE LIMPIA VARIABLE
      icpCONTRATO.RefrescaInfo;
      TotalImportes(Objeto.ID_CESION.AsInteger);
      vlsql := ' SELECT PKGCRPERIODO.OBTENIMPAFORO( ' + Objeto.IMP_NOMINAL.AsString +
               ',' + Objeto.TASA_AFORO.AsString + ' ) AS IMP_AFORADO ' + ' FROM DUAL';
      GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'IMP_AFORADO',vlImpAforo,False);
      if vlImpAforo = '' then
         vlImpAforo := C_STRZERO;
      //end if
      Objeto.IMP_AFORADO.AsFloat := StrToFloat(vlImpAforo);
      consultas;
      MuestraHints;
      if Objeto.SIT_DOCUMENTO.AsString = CSIT_CA then
         btCANCELA_DOCTO.Enabled := False
      else btCANCELA_DOCTO.Enabled := True;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Objeto.Cesion.EmiProv.Proveedor.FindKey([Objeto.Cesion.ID_PROVEEDOR.AsString]);
      Objeto.Cesion.EmiProv.Proveedor.FindKey([Objeto.Cesion.CVE_FND_ENT_DES.AsString,Objeto.Cesion.ID_PROVEEDOR.AsString]);
{/ROIM}
      Objeto.Docto.TipoDocto.FindKey([Objeto.CVE_DOCUMENTO.AsString]);

      if (trim(edF_INGRESO.text) <> '') and (trim(edF_VencR.text) <> '') then  // jfof 27/02/2013 SE AGREGA CALCULO DE DIAS
      begin
      edDias_pago.Text := FloatToStr(StrToDate(edF_VencR.Text) - StrToDate(edF_INGRESO.Text));
      end;
   end;
end;

procedure TWCrDocto.edTASA_DESCUENTOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.TASA_DESCUENTO.GetFromControl;
      if Objeto.TASA_DESCUENTO.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La tasa de descuento no puede ser menor o igual a cero';
      end
      else
      begin
           if (Objeto.TASA_FONDEO.AsFloat + Objeto.SOBRETASA.AsFloat) <> Objeto.TASA_DESCUENTO.AsFloat then
           begin
                Objeto.SOBRETASA.AsFloat := Objeto.TASA_DESCUENTO.AsFloat - Objeto.TASA_FONDEO.AsFloat;
           end;
      end;
      InterForma1.ValidaExit(edTASA_DESCUENTO,VLSalida,VLMsg,True);
   end;
end;

Procedure TWCrDocto.MuestraHints;
Begin
      edNOMBRE_PROV.Hint := Objeto.Cesion.EmiProv.Proveedor.Persona.Nombre.AsString;
      edNOMBRE_PROV.ShowHint := True;
      edID_DOCUMENTO.Hint := Objeto.ID_DOCUMENTO.AsString;
      edID_DOCUMENTO.ShowHint := True;
      edTITULAR.Hint := Objeto.Cesion.CreCto.Contrato.TITNombre.AsString;
      edTITULAR.ShowHint := True;
      edDESC_TIPO_DOCTO.Hint := Objeto.Docto.TipoDocto.DESC_DOCUMENTO.AsString;
      edDESC_TIPO_DOCTO.ShowHint := True;
End;

procedure TWCrDocto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

//   if  edF_INGRESO.Text = '' then
//       edF_INGRESO.Text := '';

   //nuevo
   if IsNewData then
     Begin
        if MessageDlg('¿Desea almacenar los datos capturados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        Begin
           if Objeto.Cesion.SIT_CESION.AsString = CSIT_NA then
              Realizado := True
           else
           Begin
              showmessage('La situación de la cesión es incorrecta');
              Realizado := False;
           end;
        end
        else Realizado := False;
     end
     else
     Begin
        if MessageDlg('¿Desea guardar los datos modificados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                Realizado := True
        else Realizado := False;
     end
end;

procedure TWCrDocto.btCANCELA_BLOQUEClick(Sender: TObject);
var  CancDocto: TCrcandoc;
begin
   if Objeto.ValidaAccesoEsp('TCRDOCTO_BUQBLO',True,True) then
   begin
      CancDocto := TCrcandoc.Create(self);
      try
         CancDocto.Apli:=Objeto.Apli;
         CancDocto.ParamCre:=Objeto.ParamCre;
         CancDocto.ID_CESION.AsString := Objeto.ID_CESION.AsString;
//         CancDocto.Docto := Objeto;
         CancDocto.Catalogo;
      finally
             Objeto.FindKey([CancDocto.ID_CESION.AsString,CancDocto.ID_DOCUMENTO.AsString]);
             CancDocto.Free;
             icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato
             Objeto.Docto.TipoDocto.FindKey([Objeto.CVE_DOCUMENTO.AsString]);
             TotalImportes(Objeto.ID_CESION.AsInteger);
             consultas;
      end;
   end;
end;

procedure TWCrDocto.btCANCELA_DOCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRDOCTO_CANCDC',True,True) then
   begin
       if Objeto.Active then
       begin
           if Objeto.SIT_DOCUMENTO.AsString = CSIT_CA then
              ShowMessage('El documento ya ha sido Cancelado')
           else if (Objeto.SIT_DOCUMENTO.AsString = CSIT_NA) OR
                   (Objeto.SIT_DOCUMENTO.AsString = CSIT_AC) then
               if MessageDlg('¿Está seguro de cancelar el documento ',
                                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 Begin
                    if Objeto.STPCANCELADOCTO(Objeto.ID_CESION.AsInteger,
                                              Objeto.ID_DOCUMENTO.AsString,
                                              Objeto.NUM_PERIODO_DOC.AsInteger,
                                              Objeto.IMP_AFORADO.AsFloat) then
                    ShowMessage('Se canceló el documento : ' + Objeto.ID_DOCUMENTO.AsString );
    //                Objeto.FindKeyNear([Objeto.ID_DOCUMENTO.AsString],['ID_DOCUMENTO']);
                    Objeto.Docto.FindKey( [Objeto.ID_CESION.AsString,Objeto.ID_DOCUMENTO.AsString]);
                    TotalImportes(Objeto.ID_CESION.AsInteger);
                    consultas;
                    btCANCELA_DOCTO.Enabled := False;
                 end
           else ShowMessage('El documento no puede ser cancelado');
       end
       else
          ShowMessage('Debe de seleccionar un documento para realizar la acción.');
   end;
end;

procedure TWCrDocto.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   if Objeto.Cesion.vlCesion <> '' then
   Begin
     Realizado := False;
     if Objeto.Cesion.SIT_CESION.AsString = CSIT_NA then
        Realizado := True
     else showmessage('La situación de la cesión es incorrecta');
   end
   else realizado := True;
end;

procedure TWCrDocto.InterForma1DespuesShow(Sender: TObject);
begin
   // LOLS 07 SEP 2005
   Objeto.Cesion.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPRESA(CR_CESION.ID_CESION) =' + IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Cesion.FilterString     := Objeto.Cesion.BuscaWhereString;
   //ENDS_LOLS_07_SEP_2005
   if Objeto.vgCesion <>'' then
   Begin
       icpCONTRATO.RefrescaInfo;
//       Objeto.Cesion.FindKey([Objeto.vgCesion]);
       Objeto.ID_CESION.AsString := Objeto.vgCesion;
       TotalImportes(StrToInt(Objeto.vgCesion));
       consultas;
   end;
end;


procedure TWCrDocto.edSOBRETASAExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.SOBRETASA.GetFromControl;
      IF Objeto.SOBRETASA.AsFloat < Objeto.Cesion.Emisor.SOBRETASA.AsFloat then
      Begin
         vlMsg := 'La sobretasa no dede de ser menor a la sobretasa del emisor';
         vlSalida := False;
      end
      else
      begin
           Objeto.ObtTasaDescuento;
      end;
      InterForma1.ValidaExit(edSOBRETASA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrDocto.InterDateTimePicker3CloseUp(Sender: TObject);
begin
   Objeto.STPOBTFPROGPAGO(Objeto.CreCto.Contrato.ID_Titular.AsInteger);
end;

procedure TWCrDocto.cbB_ALAMBRADAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(cbB_ALAMBRADA,true,'',True);
end;

procedure TWCrDocto.edID_DOCUMENTOEnter(Sender: TObject);
begin
   Objeto.Docto.Active := False;
   edCVE_DOCUMENTO.Text := CNULL;
end;

procedure TWCrDocto.edF_INGRESOExit(Sender: TObject);
var  VLSalida : Boolean;
     VlMsg    : STring;
     vlfhabil : tDateTime;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     VLSalida := True;
     VLMsg    := '';
     Objeto.F_INGRESO_DOC.GetFromControl;
     Objeto.F_EMISION.GetFromControl;
     if (vlgbaplica = 'V') and (edF_INGRESO.Text = '') then
     begin
     VLSalida := False;
     vlMsg := 'La fecha de Ingreso es Nula y aplica fecha de vencimiento real.';
     end;

     if Objeto.F_INGRESO_DOC.AsString <> '' then
      begin
       if Objeto.F_INGRESO_DOC.AsDateTime > Objeto.F_EMISION.AsDateTime then
       begin
       VlMsg := 'La fecha de Ingreso no puede ser mayor a la fecha de Inicio ';
       VLSalida := False;
       end;
       vlfhabil := ValFechaHabil(strtodate(edF_INGRESO.Text) + strtoint(edDias_pago.Text));
       edF_VencR.Text := DateTostr(vlfhabil);

       Objeto.F_VENC_REAL.GetFromControl;
       Objeto.F_VENCIMIENTO.GetFromControl;
       if trim(edF_VencR.Text) <> '' then
        begin
         if Objeto.F_VENC_REAL.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime then
         begin
         VlMsg := 'La fecha de vencimiento real NO puede ser mayor a la fecha de vencimiento';
         VLSalida := False;
         end;
        end;
     end
     else begin
     edF_INGRESO.Text := '';
     edF_VencR.Text := '';
     end;
     InterForma1.ValidaExit(edF_INGRESO,VLSalida,VlMsg,True);
   end;
end;


function TWCrDocto.ValFechaHabil(pFecha: TDate): TDate;
var     STPValFecha : TStoredProc;
        VLFecha     : TDate;
Begin
     STPValFecha := TStoredProc.Create(Nil);
     try
          STPValFecha.DatabaseName:= Objeto.Apli.DatabaseName;
          STPValFecha.SessionName:= Objeto.Apli.SessionName;
          STPValFecha.StoredProcName:='PKGFECHAS.SPE_FECHAMET6';
          STPValFecha.Params.CreateParam(ftInteger,'P_IdEmpresa',ptInput);
          STPValFecha.Params.CreateParam(ftString,'p_CveLiq',ptInput);
          STPValFecha.Params.CreateParam(ftDate,'P_Fecha',ptInputOutput);
          STPValFecha.Params.CreateParam(ftInteger,'ps_resp',ptOutput);
          STPValFecha.Prepare;
          STPValFecha.ParamByName('P_IdEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
          STPValFecha.ParamByName('p_CveLiq').AsString := 'SPOT';
          STPValFecha.ParamByName('P_Fecha').AsDate := pFecha;
          STPValFecha.ExecProc;

          vlFecha  := STPValFecha.ParamByName('p_fecha').AsDate;
     finally
          If Assigned(STPValFecha) Then STPValFecha.Free;
     end;
     ValFechaHabil := vlFecha;

end;

end.
