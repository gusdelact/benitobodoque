// Sistema         : Clase de CR_ACCIONISTA
// Fecha de Inicio : 06/05/2004
// Función forma   : Clase de CR_ACCIONISTA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrAccioni;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, InterEdit,
IntLinkit,Ungene,
//Unidades Adicionales
IntParamCre, IntGenCre,
IntCrAcredit, IntDom,
IntCrAcrCon,
IntPers
;

Type
 TCrAccioni= class;

  TWCrAccionista=Class(TForm)
    InterForma1             : TInterForma;
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    lbID_ACCIONISTA: TLabel;
    edID_ACCIONISTA: TEdit;
    lbCVE_TIPO_ACCION : TLabel;
    lbPCT_PARTICIPA : TLabel;
    IedPCT_PARTICIPA : TInterEdit;
    rgSIT_ACCIONISTA : TRadioGroup;
    edNOMBRE_ACREDITADO: TEdit;
    edNOMBRE: TEdit;
    btACREDITADO: TBitBtn;
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
    Label7: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    Label9: TLabel;
    Bevel3: TBevel;
    sgACCIONISTAS: TSGCtrl;
    Label1: TLabel;
    Label2: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    MsgPanel: TPanel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    ilPUESTO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    edCVE_PUESTO: TEdit;
    btPUESTO: TBitBtn;
    edDESC_PUESTO: TEdit;
    Bevel5: TBevel;
    Label10: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edF_RFC: TInterEdit;
    edHOMOCLAVE_RFC: TInterEdit;
    edSIGLAS_RFC: TInterEdit;
    Label17: TLabel;
    cbTIPO_ACCIONISTA: TComboBox;
    edAPELLIDO_PATERNO: TEdit;
    edAPELLIDO_MATERNO: TEdit;
    edNOMBRE1: TEdit;
    edNOMBRE2: TEdit;
    lbDOMICILIO: TLabel;
    edID_DOMICILIO: TEdit;
    btDOMICILIO: TBitBtn;
    edCALLE_NUMERO: TEdit;
    ilDOMICILIO: TInterLinkit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edCURP_ACC: TEdit;
    Label23: TLabel;
    edNUMERO_TELEFONO: TEdit;
    Label24: TLabel;
    edEXTENSION_TELEFONICA: TEdit;
    Label25: TLabel;
    edFAX: TEdit;
    Label26: TLabel;
    Bevel8: TBevel;
    Label27: TLabel;
    lblID_PER_ACC: TLabel;
    edID_PER_ACC: TEdit;
    edNOM_PER_ACC: TEdit;
    btID_PER_ACC: TBitBtn;
    ilID_PER_ACC: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_ACCIONISTAExit(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPUESTOCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure sgACCIONISTASMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure cbCVE_TIPO_ACCIONExit(Sender: TObject);
    procedure IedPCT_PARTICIPAExit(Sender: TObject);
    procedure rgSIT_ACCIONISTAExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure sgACCIONISTASCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure btPUESTOClick(Sender: TObject);
    procedure ilPUESTOEjecuta(Sender: TObject);
    procedure edCVE_PUESTOExit(Sender: TObject);
    procedure edNOMBREExit(Sender: TObject);
    procedure edID_DOMICILIOExit(Sender: TObject);
    procedure btDOMICILIOClick(Sender: TObject);
    procedure ilDOMICILIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilDOMICILIOEjecuta(Sender: TObject);
    procedure cbTIPO_ACCIONISTAExit(Sender: TObject);
    procedure cbTIPO_ACCIONISTAChange(Sender: TObject);
    procedure edSIGLAS_RFCExit(Sender: TObject);
    procedure edF_RFCExit(Sender: TObject);
    procedure edAPELLIDO_PATERNOExit(Sender: TObject);
    procedure edAPELLIDO_MATERNOExit(Sender: TObject);
    procedure edNOMBRE1Exit(Sender: TObject);
    procedure edNOMBRE2Exit(Sender: TObject);
    procedure edHOMOCLAVE_RFCExit(Sender: TObject);
    procedure edCURP_ACCExit(Sender: TObject);
    procedure edNUMERO_TELEFONOExit(Sender: TObject);
    procedure edEXTENSION_TELEFONICAExit(Sender: TObject);
    procedure edFAXExit(Sender: TObject);
    procedure btDOMICILIOExit(Sender: TObject);
    procedure edID_PER_ACCExit(Sender: TObject);
    procedure btID_PER_ACCClick(Sender: TObject);
    procedure ilID_PER_ACCEjecuta(Sender: TObject);
    procedure ilID_PER_ACCCapture(Sender: TObject; var Show: Boolean);
    procedure btID_PER_ACCExit(Sender: TObject);
    procedure lbDOMICILIODblClick(Sender: TObject);
    procedure lblID_PER_ACCDblClick(Sender: TObject);
    private
    { Private declarations }
       vgTotalPct : Double;
       vgValorPct : Double;
       Procedure    MuestraAccionistas(pAcreditado : String);
       Procedure    MuestraHints;
       procedure    MuestraEdits (TipoAcci: String) ;
       Procedure    AplicaPCT;
    public
    { Public declarations }
    Objeto : TCrAccioni;
end;
 TCrAccioni= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        ID_ACCIONISTA            : TInterCampo;
        NOMBRE                   : TInterCampo;
        CVE_PUESTO               : TInterCampo;
        PCT_PARTICIPA            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_ACCIONISTA           : TInterCampo;

        // Nuevo Codigo MAMG.
        SIGLAS_RFC               : TInterCampo;
        F_RFC                    : TInterCampo;
        HOMOCLAVE_RFC            : TInterCampo;
        // Termina codigo nuevo

        // FJR 05.07.2012
        TIPO_ACCIONISTA          : TInterCampo;
        ID_DOMICILIO             : TInterCampo;
        APELLIDO_PATERNO         : TInterCampo;
        APELLIDO_MATERNO         : TInterCampo;
        NOMBRE1                  : TInterCampo;
        NOMBRE2                  : TInterCampo;
        CURP_ACC                 : TInterCampo;
        NUMERO_TELEFONO          : TInterCampo;
        EXTENSION_TELEFONICA     : TInterCampo;
        FAX                      : TInterCampo;
        ID_PER_ACC               : TInterCampo;
        // FJR 05.07.2012

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Puesto                   : TCrAcrCon;
        //FJR 05.07.2012
        Domicilio                : TDomicilio;
        Persona                  : TPersona;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    InternalPost : Boolean; override;
        Function    InsertaDatos : Boolean;
      published
      end;



implementation
{$R *.DFM}


constructor TCrAccioni.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Número de Acreditado';
      ID_ACCIONISTA :=CreaCampo('ID_ACCIONISTA',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACCIONISTA.Caption:='Número de Accionista';
      NOMBRE :=CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
                NOMBRE.Caption:='Nombre';
      CVE_PUESTO :=CreaCampo('CVE_PUESTO',ftString,tsNinguno,tsNinguno,True);
                CVE_PUESTO.Caption:='Clave de Puesto';
      PCT_PARTICIPA :=CreaCampo('PCT_PARTICIPA',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PARTICIPA.Caption:='Pct Participa';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

                // Nuevo Codigo MAMG.
     SIGLAS_RFC    := CreaCampo('SIGLAS_RFC',ftString,tsNinguno,tsNinguno,True);
                SIGLAS_RFC.Caption := 'Siglas R.F.C.';
     F_RFC := CreaCampo('F_RFC',ftString,tsNinguno,tsNinguno,True);
                F_RFC.Caption  := 'Fecha R.F.C.';
     HOMOCLAVE_RFC := CreaCampo('HOMOCLAVE_RFC',ftString,tsNinguno,tsNinguno,True);
                HOMOCLAVE_RFC.Caption := 'HomoClave R.F.C.';
     // Termina codigo nuevo


      SIT_ACCIONISTA :=CreaCampo('SIT_ACCIONISTA',ftString,tsNinguno,tsNinguno,True);
         With SIT_ACCIONISTA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1'); ComboDatos.Add(CSIT_IN);
          end;
                SIT_ACCIONISTA.Caption:='Situación Accionista';

      // FJR 05.07.2012
      TIPO_ACCIONISTA := CreaCampo('TIPO_ACCIONISTA', ftString, tsNinguno, tsNinguno, True) ;
                         TIPO_ACCIONISTA.Caption := 'Tipo de accionista';

      ID_DOMICILIO := CreaCampo('ID_DOMICILIO', ftFloat, tsNinguno, tsNinguno, True);
                      ID_DOMICILIO.Caption:= 'Domicilio del accionista';

      APELLIDO_PATERNO:= CreaCampo('APELLIDO_PATERNO', ftString, tsNinguno, tsNinguno, True);
                         APELLIDO_PATERNO.Caption:= 'Apellido paterno del accionista';

      APELLIDO_MATERNO:= CreaCampo('APELLIDO_MATERNO', ftString, tsNinguno, tsNinguno, True);
                         APELLIDO_MATERNO.Caption:= 'Apellido materno del accionista';

      NOMBRE1:= CreaCampo('NOMBRE1', ftString, tsNinguno, tsNinguno, True);
                         NOMBRE1.Caption:= 'Nombre del accionista (PF/PFAE) / Razon social del accionista (PM)';

      NOMBRE2:= CreaCampo('NOMBRE2', ftString, tsNinguno, tsNinguno, True);
                         NOMBRE2.Caption:= 'Segundo nombre del Accionista';

      CURP_ACC:= CreaCampo('CURP_ACC', ftString, tsNinguno, tsNinguno, True);
                         CURP_ACC.Caption:= 'CURP del accionista ';

      NUMERO_TELEFONO:= CreaCampo('NUMERO_TELEFONO', ftString, tsNinguno, tsNinguno, True);
                         NUMERO_TELEFONO.Caption:= 'Numero telefonico del accionista';

      EXTENSION_TELEFONICA:= CreaCampo('EXTENSION_TELEFONICA', ftString, tsNinguno, tsNinguno, True);
                         EXTENSION_TELEFONICA.Caption:= 'Extension telefonica ';

      FAX:= CreaCampo('FAX', ftString, tsNinguno, tsNinguno, True);
                         FAX.Caption:= 'Numero telefonico del fax del accionista';
      // FJR 05.07.2012

      ID_PER_ACC := CreaCampo('ID_PER_ACC', ftFloat, tsNinguno, tsNinguno, True);
                      ID_PER_ACC.Caption:= 'Id Persona (Accionista)';

      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('ID_ACCIONISTA');

      TableName := 'CR_ACCIONISTA';
      UseQuery := True;
      HelpFile := 'IntCrAccioni.Hlp';
      ShowMenuReporte:=True;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
      Acreditado.Persona.BuscaWhereString := ' PERSONA.CVE_PER_JURIDICA = ' + SQLStr(CPER_MORAL) +
                                             '  AND PERSONA.SIT_PERSONA = ' + SQLStr(CSIT_AC);
      Acreditado.Persona.FilterString := Acreditado.Persona.BuscaWhereString;
      Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO =' + SQLStr(CSIT_AC);
      Acreditado.FilterString := Acreditado.BuscaWhereString;

      Puesto := TCrAcrCon.Create(Self);
      Puesto.MasterSource:=Self;
      Puesto.FieldByName('CVE_PUESTO').MasterField:='CVE_PUESTO';

      // FJR 05.07.2012
      Domicilio := TDomicilio.Create(Self);
      Domicilio.MasterSource:= Self;
      Domicilio.FieldByName('ID_DOMICILIO').Masterfield:='ID_DOMICILIO';
      // FJR 05.07.2012

      Persona := TPersona.Create(Self);
      Persona.MasterSource:= Self;
      Persona.FieldByName('ID_PERSONA').Masterfield:='ID_PER_ACC';

end;

Destructor TCrAccioni.Destroy;
begin
  // FJR 05.07.2012
  if Domicilio <> nil then
     Domicilio.Free;

  if Persona <> nil then
     Persona.Free;

   if Puesto <> nil then
      Puesto.Free;
   //end if
   inherited;
end;


function TCrAccioni.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAccionista;
begin
   W:=TWCrAccionista.Create(Self);
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


Function TCrAccioni.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAccio.it','F,F,S');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString);
                               T.Param(1,ID_ACCIONISTA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

//Sobreescribiendo el Internal Post
Function TCrAccioni.InternalPost : Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;
     if Modo=moEdit then
     begin
          Result:=Inherited InternalPost;
          VLSalida := True;
     end;
     if Modo=moAppend then
     begin
        try
           VLSalida := InsertaDatos;
        Except
          on e: exception do
          bEGIN
           Beep;Beep;Beep;Beep;
           ShowMessage('Problemas con el Alta. Avise Urgentemente a Sistemas');
           ShowMessage(e.Message);
          end;
         end;
     end;
     InternalPost := VLSalida;
End;

Function  TCrAccioni.InsertaDatos;
var     vlResult      : Boolean;
        STPAltaAcc    : TStoredProc;
//Inicio Inserta Crédito
Begin
    vlResult := False;

    //Obtiene Datos de algunos Intercampos

    STPAltaAcc := TStoredProc.Create(Self);
    try
       with STPAltaAcc do
       begin
          STPAltaAcc.DatabaseName:= Apli.DatabaseName;
          STPAltaAcc.SessionName:= Apli.SessionName;
          STPAltaAcc.StoredProcName:='PKGCRCREDITO.STPALTAACCIONISTA';
          //STPAltaAcc.StoredProcName:='STPCRALTAACCION_P';

          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDACREDITADO',ptInput);
          Params.CreateParam(ftString,'PENOMBRE',ptInput);
          Params.CreateParam(ftString,'PECVEPUESTO',ptInput);
          Params.CreateParam(ftFloat,'PEPCTPARTICIPACION',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSIDACCIONISTA',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          // Nuevo Codigo MAMG.
          Params.CreateParam(ftString,'peSIGLASRFC',ptInput);
          Params.CreateParam(ftString,'peFRFC',ptInput);
          Params.CreateParam(ftString,'peHOMOCLAVERFC',ptInput);
          // Termina codigo nuevo

          //{ FJR 06.07.2012
          Params.CreateParam(ftString,'PETIPOACCION',ptInput);
          Params.CreateParam(ftFloat,'PEIDDOMICILIO',ptInput);
          Params.CreateParam(ftString,'PEAP_PATERNO',ptInput);
          Params.CreateParam(ftString,'PEAP_MATERNO',ptInput);
          Params.CreateParam(ftString,'PENOMBRE1',ptInput);
          Params.CreateParam(ftString,'PENOMBRE2',ptInput);
          Params.CreateParam(ftString,'PECURP_ACC',ptInput);
          Params.CreateParam(ftString,'PENUMERO_TELEFONO',ptInput);
          Params.CreateParam(ftString,'PEEXTENSION_TELEFONICA',ptInput);
          Params.CreateParam(ftString,'PEFAX',ptInput);
          // FJR 06.07.2012 }
          Params.CreateParam(ftFloat,'peID_PER_ACC',ptInput);

    //  Se quita el Prepare;

          ParamByName('peIdAcreditado').AsFloat := ID_ACREDITADO.AsFloat;
          ParamByName('peNombre').AsString := NOMBRE.AsString;
          ParamByName('peCvepuesto').AsString := CVE_PUESTO.AsString;
          ParamByName('pePctParticipacion').AsFloat := PCT_PARTICIPA.AsFloat;

          // Nuevo Codigo MAMG.
          ParamByName('peSIGLASRFC').AsString := SIGLAS_RFC.AsString;
          ParamByName('peFRFC').AsString := F_RFC.AsString;
          ParamByName('peHOMOCLAVERFC').AsString := HOMOCLAVE_RFC.AsString;
          // Termina codigo nuevo

          //{ FJR 06.07.2012
          ParamByName('peTipoAccion').AsString := TIPO_ACCIONISTA.AsString;
          ParamByName('peIdDomicilio').AsString := ID_DOMICILIO.AsString;
          ParamByName('peAp_Paterno').AsString := APELLIDO_PATERNO.AsString;
          ParamByName('peAp_Materno').AsString := APELLIDO_MATERNO.AsString;
          ParamByName('peNombre1').AsString := NOMBRE1.AsString;
          ParamByName('peNombre2').AsString := NOMBRE2.AsString;
          ParamByName('peCurp_Acc').AsString := CURP_ACC.AsString;
          ParamByName('peNumero_Telefono').AsString := NUMERO_TELEFONO.AsString;
          ParamByName('peExtension_Telefonica').AsString := EXTENSION_TELEFONICA.AsString;
          ParamByName('peFax').AsString := FAX.AsString;
          //FJR 06.07.2012}
          ParamByName('peID_PER_ACC').AsFloat := ID_PER_ACC.AsFloat;

          ParamByName('peCveUsuAlta').AsString := CVE_USU_ALTA.AsString;
          ParamByName('peBCommit').AsString := 'V';
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             ID_ACCIONISTA.AsInteger := ParamByName('PSIDACCIONISTA').AsInteger;
             vlResult := True;
          end
          else
          Begin
             ShowMessage('PROBLEMAS EN ALTA: ' +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       STPAltaAcc.Free;
    end;
    InsertaDatos := vlResult;
end;
(***********************************************FORMA CR_ACCIONISTA********************)
(*                                                                              *)
(*  FORMA DE CR_ACCIONISTA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACCIONISTA********************)
procedure TWCrAccionista.MuestraAccionistas(pAcreditado: String);
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT CA.ID_ACREDITADO   , ' + coCRLF +
              '        CA.ID_ACCIONISTA   , ' + coCRLF +
              '        NVL(CA.NOMBRE, TRIM(CA.NOMBRE1)||TRIM(CA.NOMBRE2||TRIM(CA.APELLIDO_PATERNO)||TRIM(CA.APELLIDO_MATERNO))) AS NOMBRE, ' + coCRLF +
              '        CAC.DESC_PUESTO PUESTO , ' + coCRLF +
              '        CA.PCT_PARTICIPA , ' + coCRLF +
              '        CA.SIT_ACCIONISTA,  ' + coCRLF +
              '        CA.SIGLAS_RFC,  ' + coCRLF +
              '        CA.F_RFC,  ' + coCRLF +
              '        CA.HOMOCLAVE_RFC  ' + coCRLF +
              ' FROM CR_ACCIONISTA CA, CR_ACRED_CONST CAC' + coCRLF +
              ' WHERE CA.ID_ACREDITADO = '+   pAcreditado  + coCRLF +
              ' AND     CAC.CVE_PUESTO = CA.CVE_PUESTO   ' + coCRLF +
              ' ORDER BY CA.ID_ACCIONISTA' ;

     vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('ID_ACREDITADO').Visible := False;

            vlQry.FieldByName('ID_ACCIONISTA').DisplayWidth := 12;
            vlQry.FieldByName('NOMBRE').DisplayWidth := 40;
            vlQry.FieldByName('PUESTO').DisplayWidth :=25;
            vlQry.FieldByName('PCT_PARTICIPA').DisplayWidth := 13;
            vlQry.FieldByName('SIT_ACCIONISTA').DisplayWidth := 5;

            // Nuevo Codigo MAMG.
            vlQry.FieldByName('SIGLAS_RFC').DisplayWidth := 8;
            vlQry.FieldByName('F_RFC').DisplayWidth := 13;
            vlQry.FieldByName('HOMOCLAVE_RFC').DisplayWidth := 13;
            // Termina codigo nuevo


            //TNumericField(vlQry.FieldByName('PCT_PARTICIPA')).DisplayFormat := '#######0.00';
            TNumericField(vlQry.FieldByName('PCT_PARTICIPA')).DisplayFormat := '#######0.0000';

            sgACCIONISTAS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
           sgACCIONISTAS.Clear('NO HAY REGISTROS'#30'>C');
           vgTotalPct  := 0;
           vgValorPct  := 0;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrAccionista.FormShow(Sender: TObject);
//var Qry: TQuery ;
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Acreditado.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.ID_ACCIONISTA.Control:=edID_ACCIONISTA;
      Objeto.NOMBRE.Control := edNOMBRE;
      Objeto.CVE_PUESTO.Control:=edCVE_PUESTO;
      Objeto.PCT_PARTICIPA.Control:=IedPCT_PARTICIPA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.SIT_ACCIONISTA.Control:=rgSIT_ACCIONISTA;

      // Nuevo Codigo MAMG.
      Objeto.SIGLAS_RFC.Control:=edSIGLAS_RFC;
      Objeto.F_RFC.Control:=edF_RFC;
      Objeto.HOMOCLAVE_RFC.Control:=edHOMOCLAVE_RFC;
       // Termina codigo nuevo

      // FJR 05.07.2012
      Objeto.TIPO_ACCIONISTA.Control := cbTIPO_ACCIONISTA;
      Objeto.ID_DOMICILIO.Control := edID_DOMICILIO;
      Objeto.APELLIDO_PATERNO.Control:= edAPELLIDO_PATERNO;
      Objeto.APELLIDO_MATERNO.Control:= edAPELLIDO_MATERNO;
      Objeto.NOMBRE1.Control:= edNOMBRE1;
      Objeto.NOMBRE2.Control:= edNOMBRE2;
      Objeto.CURP_ACC.Control:= edCURP_ACC;
      Objeto.NUMERO_TELEFONO.Control:= edNUMERO_TELEFONO;
      Objeto.EXTENSION_TELEFONICA.Control:= edEXTENSION_TELEFONICA;
      Objeto.FAX.Control:= edFAX;

      //Objeto.Domicilio.IdDomicilio.Control := edID_DOMICILIO;
      Objeto.Domicilio.CalleNumero.Control := edCALLE_NUMERO;
      Objeto.Domicilio.GetParams(Objeto);
      // FJR 05.07.2012

      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);

      Objeto.Puesto.DESC_PUESTO.Control := edDESC_PUESTO;
      Objeto.Puesto.GetParams(Objeto);


      Objeto.ID_PER_ACC.Control := edID_PER_ACC;
      Objeto.Persona.Id_Persona.Control := edID_PER_ACC;
      Objeto.Persona.Nombre.Control := edNOM_PER_ACC;
      Objeto.Persona.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;

      cbTIPO_ACCIONISTA.Items.Clear ;
      cbTIPO_ACCIONISTA.Items.Append('PF') ;
      cbTIPO_ACCIONISTA.Items.Append('PM') ;
      cbTIPO_ACCIONISTA.Items.Append('FID') ;
      cbTIPO_ACCIONISTA.Items.Append('GOB') ;
end;

procedure TWCrAccionista.FormDestroy(Sender: TObject);
begin
      Objeto.Acreditado.ID_ACREDITADO.Control:=nil;
      Objeto.ID_ACCIONISTA.Control:=nil;
      Objeto.NOMBRE.Control:=nil;
      Objeto.CVE_PUESTO.Control:=nil;
      Objeto.PCT_PARTICIPA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SIT_ACCIONISTA.Control:=nil;

      // Nuevo Codigo MAMG.
      Objeto.SIGLAS_RFC.Control := nil;
      Objeto.F_RFC.Control := nil;
      Objeto.HOMOCLAVE_RFC.Control := nil;
      // Termina codigo nuevo

      // FJR 05.07.2012
      Objeto.TIPO_ACCIONISTA.Control := nil;
      Objeto.ID_DOMICILIO.Control := nil;
      Objeto.APELLIDO_PATERNO.Control:= nil;
      Objeto.APELLIDO_MATERNO.Control:= nil;
      Objeto.NOMBRE1.Control:= nil;
      Objeto.NOMBRE2.Control:= nil;
      Objeto.CURP_ACC.Control:= nil;
      Objeto.NUMERO_TELEFONO.Control:= nil;
      Objeto.EXTENSION_TELEFONICA.Control:= nil;
      Objeto.FAX.Control:= nil;

      //Objeto.Domicilio.IdDomicilio.Control := nil;
      Objeto.Domicilio.CalleNumero.Control := nil;
      // FJR 05.07.2012

      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Puesto.DESC_PUESTO.Control := nil;

      Objeto.ID_PER_ACC.Control := nil;
      Objeto.Persona.Id_Persona.Control := nil;
      Objeto.Persona.Nombre.Control := nil;
end;

procedure TWCrAccionista.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAccionista.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.AsString;
   rgSIT_ACCIONISTA.ItemIndex := 0;

   IedPCT_PARTICIPA.Enabled := True;
   IedPCT_PARTICIPA.Color := clWindow;
   IedPCT_PARTICIPA.TabStop := True;

    // Nuevo Codigo MAMG.
   edSIGLAS_RFC.Enabled := True;
   edSIGLAS_RFC.Color := clWindow;
   edSIGLAS_RFC.TabStop := True;

   edF_RFC.Enabled := True;
   edF_RFC.Color := clWindow;
   edF_RFC.TabStop := True;

   edHOMOCLAVE_RFC.Enabled := True;
   edHOMOCLAVE_RFC.Color := clWindow;
   edHOMOCLAVE_RFC.TabStop := True;
   // Termina codigo nuevo
   //edID_ACREDITADO.SetFocus;

   cbTIPO_ACCIONISTA.SetFocus ;

end;

procedure TWCrAccionista.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;

   IF Objeto.SIT_ACCIONISTA.AsString = CSIT_AC then
     Begin
        //edCVE_PUESTO.Enabled := True;
        //edCVE_PUESTO.Color := clWindow;

        IedPCT_PARTICIPA.Enabled := True;
        IedPCT_PARTICIPA.Color := clWindow;

        //edNOMBRE.Enabled := True;      FJR 19.09.2012
        //edNOMBRE.Color := clWindow;    FJR 19.09.2012

        // Nuevo Codigo MAMG.
        edSIGLAS_RFC.Enabled := True;
        edSIGLAS_RFC.Color := clWindow;

        edF_RFC.Enabled := True;
        edF_RFC.Color := clWindow;

        edHOMOCLAVE_RFC.Enabled := True;
        edHOMOCLAVE_RFC.Color := clWindow;
        // Termina codigo nuevo

        AplicaPCT;
        vgValorPct := Objeto.PCT_PARTICIPA.AsFloat;
        //edCVE_PUESTO.SetFocus;
        cbTIPO_ACCIONISTA.SetFocus;
     end
   else
     Begin
        //edCVE_PUESTO.Enabled := False;
        //edCVE_PUESTO.Color := clBtnFace;

        IedPCT_PARTICIPA.Enabled := False;
        IedPCT_PARTICIPA.Color := clBtnFace;

        //edNOMBRE.Enabled := False;       FJR 19.09.2012
        //edNOMBRE.Color := clBtnFace;     FJR 19.09.2012

        // Nuevo Codigo MAMG.
        edSIGLAS_RFC.Enabled := False;
        edSIGLAS_RFC.Color := clBtnFace;

        edF_RFC.Enabled := False;
        edF_RFC.Color := clBtnFace;

        edHOMOCLAVE_RFC.Enabled := False;
        edHOMOCLAVE_RFC.Color := clBtnFace;
        // Termina codigo nuevo

        rgSIT_ACCIONISTA.SetFocus;
     end  ;
   MuestraEdits(Objeto.TIPO_ACCIONISTA.AsString) ;

end;

procedure TWCrAccionista.InterForma1DespuesShow(Sender: TObject);
begin
   IF Objeto.Acreditado.ID_ACREDITADO.AsString <> CNULL then
   Begin
      Objeto.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.AsString;
      MuestraAccionistas(Objeto.ID_ACREDITADO.AsString);
      rgSIT_ACCIONISTA.ItemIndex := 0;
      Objeto.FindKey([ sgACCIONISTAS.CellStr['ID_ACREDITADO',sgACCIONISTAS.SG.Row],
                       sgACCIONISTAS.CellStr['ID_ACCIONISTA',sgACCIONISTAS.SG.Row]]);
      MuestraHints;
   end;
end;


procedure TWCrAccionista.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACCIONI_ACRED',True,True) then
   begin
       Objeto.Acreditado.ShowAll := True;
       if Objeto.Acreditado.Busca then
          InterForma1.NextTab(edID_ACREDITADO);
       //end if
   end;
end;

procedure TWCrAccionista.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
      InterForma1.NextTab(edID_ACREDITADO);
   //end if
end;

procedure TWCrAccionista.edID_ACREDITADOExit(Sender: TObject);
var   vlSalida    : Boolean;
      vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      If Objeto.Acreditado.ID_ACREDITADO.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar el acreditado';
         vlSalida := False;
      end
      else if Objeto.Acreditado.SIT_ACREDITADO.AsString = CSIT_IN then
      Begin
         vlMsg := 'Acreditado inactivo';
         vlSalida := False;
      end
      else if Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString <> CPER_MORAL then
      Begin
         vlMsg := 'El acreditado solo puede ser persona Moral';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edID_ACREDITADO,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrAccionista.edID_ACCIONISTAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_ACCIONISTA,True,'',True);
end;

procedure TWCrAccionista.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrAccionista.ilPUESTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrAccionista.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //FJR 18.09.2012 AGREGADO PARA INSERTAR UN VALOR NO NULO EN EL CAMPO NOMBRE, Y DE PASO RESPETAR A QUIENES LO USAN.
   Objeto.APELLIDO_PATERNO.GetFromControl;
   Objeto.APELLIDO_MATERNO.GetFromControl;
   Objeto.NOMBRE1.GetFromControl;
   Objeto.NOMBRE2.GetFromControl;
   Objeto.NOMBRE.AsString := Trim(Trim(Objeto.APELLIDO_PATERNO.AsString)+' '+Trim(Trim(Objeto.APELLIDO_MATERNO.AsString)+' '+Trim(Trim(Objeto.NOMBRE1.AsString)+' '+Trim(Objeto.NOMBRE2.AsString)))) ;
   Objeto.NOMBRE.AsString := Copy(Objeto.NOMBRE.AsString, 1, 100) ;
   //FJR 18.09.2012 FIN
   //nuevo
  if IsNewData then   // trae el estado del boton nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
        //Objeto.PCT_PARTICIPA.GetFromControl;
        // valida porcentaje de participacion
        {if   (trim(IedPCT_PARTICIPA.Text) = '0') or (trim(IedPCT_PARTICIPA.Text) =  '') or (Objeto.PCT_PARTICIPA.AsFloat = 0)    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el porcentaje de participación.');
        end
        else
        begin }
        Realizado := true;
        //end;

        // valida siglas rfc
        {if   (trim(edSIGLAS_RFC.Text) = '0') or (trim(edSIGLAS_RFC.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar las siglas del R.F.C.');
        end
        else
        begin
        Realizado := true;
        end;}

        // valida fecha rfc
        {if   (trim(edF_RFC.Text) = '0') or (trim(edF_RFC.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar la fecha del R.F.C.');
        end
        else
        begin
        Realizado := true;
        end;}

        // valida homoclave rfc
        {if   (trim(edHOMOCLAVE_RFC.Text) = '0') or (trim(edHOMOCLAVE_RFC.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar la homoclave del R.F.C.');
        end
        else
        begin
        Realizado := true;
        end;}
      end
      else
      begin
      Realizado := false;
      end;
   end
   else  // Entra con el estado del boton modificar
   begin
     if  MessageDlg('¿Desea Guardar los datos Modificados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin

           // valida porcentaje
           //if   {(trim(IedPCT_PARTICIPA.Text ) = '0') or} (trim(IedPCT_PARTICIPA.Text) =  '') then
           {begin
             Realizado := false;
             ShowMessage('Es necesario ingresar el porcentaje de participación');
           end
           else
           begin }
           Realizado := true;
          // end;

           // valida siglas
           {if   (trim(edSIGLAS_RFC.Text ) = '0') or (trim(edSIGLAS_RFC.Text) =  '')    then
           begin
             Realizado := false;
             ShowMessage('Es necesario ingresar las siglas del R.F.C.');
           end
           else
           begin
           Realizado := true;
           end;}

           // valida fecha RFC
           {if   (trim(edF_RFC.Text) = '0') or (trim(edF_RFC.Text) =  '')    then
           begin
             Realizado := false;
             ShowMessage('Es necesario ingresar la fecha del R.F.C.');
           end
           else
           begin
           Realizado := true;
           end; }

           // valida homoclave RFC
           {if   (trim(edHOMOCLAVE_RFC.Text) = '0') or (trim(edHOMOCLAVE_RFC.Text) =  '')    then
           begin
             Realizado := false;
             ShowMessage('Es necesario ingresar la homoclave del R.F.C.');
           end
           else
           begin
           Realizado := true;
           end;}
       end
       else
       begin
        Realizado := false;
       end;
   end;
end;


procedure TWCrAccionista.InterForma1DespuesAceptar(Sender: TObject);
begin
      MuestraAccionistas(Objeto.ID_ACREDITADO.AsString);
      Objeto.FindKey([ sgACCIONISTAS.CellStr['ID_ACREDITADO',sgACCIONISTAS.SG.Row],
                       sgACCIONISTAS.CellStr['ID_ACCIONISTA',sgACCIONISTAS.SG.Row]]);
      edID_ACCIONISTA.Enabled := True;
      IedPCT_PARTICIPA.Enabled := True;
      //FJR 20.09.2012 OCULTAMOS EDITS Y ETIQUETAS
      edAPELLIDO_PATERNO.Visible:= False;
      edAPELLIDO_MATERNO.Visible:= False;
      edNOMBRE1.Visible:= False;
      edNOMBRE2.Visible:= False;
      Label18.Visible:= False;
      Label19.Visible:= False;
      Label20.Visible:= False;
      Label21.Visible:= False;
      MuestraEdits(Objeto.TIPO_ACCIONISTA.AsString);
end;

procedure TWCrAccionista.sgACCIONISTASMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   IF sgACCIONISTAS.CellStr['ID_ACCIONISTA',ToIndex] <> CNULL THEN
   Begin
        Objeto.FindKey([ sgACCIONISTAS.CellStr['ID_ACREDITADO',ToIndex],
                         sgACCIONISTAS.CellStr['ID_ACCIONISTA',ToIndex]]);
        MuestraEdits(Objeto.TIPO_ACCIONISTA.AsString);
   end
end;

procedure TWCrAccionista.cbCVE_TIPO_ACCIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_PUESTO,True,'',True);
end;

procedure TWCrAccionista.IedPCT_PARTICIPAExit(Sender: TObject);
Var   vlSalida        : Boolean;
      vlMsg           : String;
      vlSuma          : Double;
      vlPCT           : Double;
begin
   vlSalida := True;
   vlMsg    := '';
   vlSuma   := 0;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.PCT_PARTICIPA.GetFromControl;
      Objeto.SIT_ACCIONISTA.GetFromControl;
      vlSuma := Objeto.PCT_PARTICIPA.AsFloat + vgTotalPct;
      if (Objeto.Modo = moEdit) then
         if Objeto.SIT_ACCIONISTA.AsString = CSIT_AC then
            vlSuma := Objeto.PCT_PARTICIPA.AsFloat + (vgTotalPct - vgValorPct);


   //Verifica que el dato no sea negativo
      if ( Objeto.PCT_PARTICIPA.AsFloat < 0 ) then
      Begin
         VLSalida := False;
         vlMsg := 'El porcentaje de participación no puede ser menor a cero';
         InterForma1.ValidaExit(IedPCT_PARTICIPA,vlSalida,vlMsg,True);
      end
      else if ( vlSuma > 100 ) then
         Begin
            VLSalida := False;
            vlPCT:= 100 - vgTotalPct;
            vlMsg := 'El porcentaje de participación sobre pasa al 100%, debe der menor o igual a:' + FloattoStr(vlPCT);
            InterForma1.ValidaExit(IedPCT_PARTICIPA,vlSalida,vlMsg,True);
         end;
//      InterForma1.ValidaExit(IedPCT_PARTICIPA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrAccionista.rgSIT_ACCIONISTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_ACCIONISTA,True,'',True);
end;

procedure TWCrAccionista.MuestraHints;
begin
   edNOMBRE1.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE1.ShowHint := True;
   edNOMBRE.Hint := Objeto.NOMBRE.AsString;
   edNOMBRE.ShowHint := True;
end;

procedure TWCrAccionista.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
   Begin
      MuestraAccionistas(Objeto.ID_ACREDITADO.AsString);
      MuestraHints;
   end;
end;

procedure TWCrAccionista.InterForma1DespuesEliminar(Sender: TObject);
begin
  Objeto.FindKey([ sgACCIONISTAS.CellStr['ID_ACREDITADO',sgACCIONISTAS.SG.Row],
                   sgACCIONISTAS.CellStr['ID_ACCIONISTA',sgACCIONISTAS.SG.Row]]);
  MuestraAccionistas(Objeto.Acreditado.ID_ACREDITADO.AsString);
end;

procedure TWCrAccionista.sgACCIONISTASCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
var  vlCadTotal : String;
begin
  {Inicializa las variable de total }
  if ( RowCaso = rcQueryBegin ) then
  begin
      vgTotalPct  := 0;
      vgValorPct  := 0;
      vlCadTotal := '';
  end;
  {}
  if ( RowCaso = rcRowBegin ) then
    begin
       if DataSet.FieldByName('SIT_ACCIONISTA').AsString  <>  CSIT_IN then
          vgTotalPct := vgTotalPct + DataSet.FieldByName('PCT_PARTICIPA').AsFloat;
       //END IF
    end;
    { Valida fin de Query }
  if ( RowCaso = rcQueryEnd ) then
    begin
        vlCadTotal := '% TOTAL :                                                          ' +
                      '                                                                                    ' +
              //Format('%8.2n',[ vgTotalPct ] );     //modificación del CFORMAT_TASA para aceptar solamente 2 decimales, la línea original está en el sig renglón
              Format(CFORMAT_TASA,[ vgTotalPct ] );
        sgACCIONISTAS.AddTexto( vlCadTotal, tcCenter, clMaroon, 15);
    end;//ends_if
end;

procedure TWCrAccionista.btPUESTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACCIONI_PUEST',True,True) then
   begin
     Objeto.Puesto.ShowAll:= True;
     if Objeto.Puesto.Busca then
        InterForma1.NextTab(btPUESTO);
     //end if; 
   end;
end;

procedure TWCrAccionista.ilPUESTOEjecuta(Sender: TObject);
begin
   if Objeto.Puesto.FindKey([ilPUESTO.Buffer]) then
      InterForma1.NextTab(edCVE_PUESTO);
   //end if;
end;

procedure TWCrAccionista.edCVE_PUESTOExit(Sender: TObject);
var   vlSalida    : Boolean;
      vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.CVE_PUESTO.GetFromControl;
      If Objeto.CVE_PUESTO.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar el puesto';
         vlSalida := False;
      end;
      AplicaPCT;
      InterForma1.ValidaExit(btPUESTO,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrAccionista.edNOMBREExit(Sender: TObject);
var   vlSalida    : Boolean;
      vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.NOMBRE.GetFromControl;
      If Objeto.NOMBRE.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar el Nombre';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edNOMBRE,vlSalida,vlMsg,True);
   End;
end;

Procedure TWCrAccionista.AplicaPCT;
begin
   IF Objeto.Puesto.B_PCT_PARTIC_ACC.AsString = CFALSO then
      Begin
         IedPCT_PARTICIPA.Enabled := False;
         IedPCT_PARTICIPA.Color := clBtnFace;
      end
   else
      Begin
         IedPCT_PARTICIPA.Enabled := True;
         IedPCT_PARTICIPA.Color := clWindow;
      end;
end;
//procedure TWCrAccionista.edSIGLAS_RFCKeyPress(Sender: TObject;
//  var Key: Char);
//begin
//  if not (key in ['a'..'z', 'A'.. 'Z', #8])  then
//  begin
//    key := #0;
 //   showmessage('capture solo letras')
//  end;
//end;

//procedure TWCrAccionista.edF_RFCKeyPress(Sender: TObject; var Key: Char);
//begin
//if not (key in [#48..#57, #8]) then
//  begin
 //    key := #0;
 //    showmessage('capture solo numeros')
//  end;
//end;
procedure TWCrAccionista.edID_DOMICILIOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
{   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.ID_DOMICILIO.GetFromControl;
      If Objeto.ID_DOMICILIO.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar el Domicilio';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edID_DOMICILIO,vlSalida,vlMsg,True);
   End; }


   {VLSalida := True;
   VLMsg := '';
   if (Objeto.Modo = moEdit) or (Objeto.Modo= moAppend) then
      Objeto.ID_DOMICILIO.GetFromControl;

   if Objeto.ID_DOMICILIO.AsString = '' then
   Begin
       VLSalida:= False;
       VLMsg:= 'Favor de indicar el Domicilio';
   end;
   InterForma1.ValidaExit(edID_DOMICILIO,VLSalida,VLMsg,True); }
   InterForma1.ValidaExit(edID_DOMICILIO,True,'',True);
end;

procedure TWCrAccionista.btDOMICILIOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACCIONI_DOM',True,True) then
   begin
       Objeto.Domicilio.ShowAll := True;
       if Objeto.Domicilio.Busca then
          InterForma1.NextTab(edID_DOMICILIO);
   end;
end;

procedure TWCrAccionista.ilDOMICILIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrAccionista.ilDOMICILIOEjecuta(Sender: TObject);
begin
   if Objeto.Domicilio.FindKey([ilDOMICILIO.Buffer]) then
      InterForma1.NextTab(edID_DOMICILIO);
end;

procedure TWCrAccionista.cbTIPO_ACCIONISTAExit(Sender: TObject);
var vlMsg: String;
    vlSalida: Boolean;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.TIPO_ACCIONISTA.GetFromControl;
      If (   (Objeto.TIPO_ACCIONISTA.AsString = 'PF')
          or (Objeto.TIPO_ACCIONISTA.AsString = 'PM')
          or (Objeto.TIPO_ACCIONISTA.AsString = 'FID')
          or (Objeto.TIPO_ACCIONISTA.AsString = 'GOB')
         ) then
      Begin
         vlMsg := '';
         vlSalida := True;
      End
      Else Begin
         vlMsg := 'Favor de indicar personalidad del accionista.';
         vlSalida := False;
      End ;

      InterForma1.ValidaExit(cbTIPO_ACCIONISTA,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrAccionista.cbTIPO_ACCIONISTAChange(Sender: TObject);
begin
   If (Objeto.Modo= moEdit) or (Objeto.Modo= moAppend) then
      begin
         Objeto.TIPO_ACCIONISTA.GetFromControl ;
         Objeto.NOMBRE.AsString := '';
         Objeto.SIGLAS_RFC.AsString := '';
         Objeto.F_RFC.AsString := '';
         Objeto.HOMOCLAVE_RFC.AsString :='';
         Objeto.APELLIDO_PATERNO.AsString:='';
         Objeto.APELLIDO_MATERNO.AsString:='';
         Objeto.NOMBRE1.AsString:= '';
         Objeto.NOMBRE2.AsString:='';
         Objeto.CVE_PUESTO.AsString:= '' ;
         Objeto.PCT_PARTICIPA.AsFloat:= 0;
         Objeto.ID_DOMICILIO.AsString:='';
         Objeto.CURP_ACC.AsString:= '';
         Objeto.NUMERO_TELEFONO.AsString:='';
         Objeto.EXTENSION_TELEFONICA.AsString:='';
         Objeto.FAX.AsString:='';
         Objeto.ID_PER_ACC.AsString:='';

         MuestraEdits(Objeto.TIPO_ACCIONISTA.AsString) ;
      end ;
end;

procedure TWCrAccionista.MuestraEdits (TipoAcci: String) ;
begin
   edNOMBRE1.Visible:= True;
   edNOMBRE2.Visible:= (TipoAcci = 'PF') ;
   edAPELLIDO_PATERNO.Visible := edNOMBRE1.Visible ;
   edAPELLIDO_MATERNO.Visible := edNOMBRE1.Visible ;
   edCURP_ACC.Visible := edNOMBRE2.Visible ;
   Label22.Visible := edCURP_ACC.Visible;
   Label18.Visible := (edNOMBRE1.Visible) or (edNOMBRE2.Visible) ;
   Label19.Visible := edNOMBRE2.Visible ;
   Label20.Visible := edNOMBRE2.Visible ;
   Label21.Visible := edNOMBRE2.Visible ;
   if TipoAcci = 'PF' then begin
      edNOMBRE1.Left:= 445;
      edNOMBRE1.Width:= 152;
      Label18.Caption:= 'Apellido Paterno' ;
      end
   else begin
      edNOMBRE1.Left:= 135;
      edNOMBRE1.Width:= 456;
      Label18.Caption:= 'Razon social de accionista' ;
      end ;
end;

procedure TWCrAccionista.edSIGLAS_RFCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edSIGLAS_RFC,True,'',True);
end;

procedure TWCrAccionista.edF_RFCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_RFC,True,'',True);
end;

procedure TWCrAccionista.edAPELLIDO_PATERNOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edAPELLIDO_PATERNO,True,'',True);
end;

procedure TWCrAccionista.edAPELLIDO_MATERNOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edAPELLIDO_MATERNO,True,'',True);
end;

procedure TWCrAccionista.edNOMBRE1Exit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOMBRE1,True,'',True);
end;

procedure TWCrAccionista.edNOMBRE2Exit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOMBRE2,True,'',True);
end;

procedure TWCrAccionista.edHOMOCLAVE_RFCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edHOMOCLAVE_RFC,True,'',True);
end;

procedure TWCrAccionista.edCURP_ACCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCURP_ACC,True,'',True);
end;

procedure TWCrAccionista.edNUMERO_TELEFONOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNUMERO_TELEFONO,True,'',True);
end;

procedure TWCrAccionista.edEXTENSION_TELEFONICAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edEXTENSION_TELEFONICA,True,'',True);
end;

procedure TWCrAccionista.edFAXExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edFAX,True,'',True);
end;

procedure TWCrAccionista.btDOMICILIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btDOMICILIO,True,'',True);
end;

procedure TWCrAccionista.edID_PER_ACCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PER_ACC,True,'',True);
end;

procedure TWCrAccionista.btID_PER_ACCClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACCIONI_PER',True,True) then
   begin
       Objeto.Persona.ShowAll := True;
       if Objeto.Persona.Busca then
          InterForma1.NextTab(edID_PER_ACC);
   end;
end;

procedure TWCrAccionista.ilID_PER_ACCEjecuta(Sender: TObject);
begin
   if Objeto.Persona.FindKey([ilID_PER_ACC.Buffer]) then
      InterForma1.NextTab(edID_PER_ACC);
end;

procedure TWCrAccionista.ilID_PER_ACCCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrAccionista.btID_PER_ACCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btID_PER_ACC,True,'',True);
end;

procedure TWCrAccionista.lbDOMICILIODblClick(Sender: TObject);
begin
    edID_DOMICILIO.Text  := '';
    edCALLE_NUMERO.Text := '';
    Objeto.Domicilio.IdDomicilio.IsNull;
    Objeto.Domicilio.CalleNumero.IsNull;
end;

procedure TWCrAccionista.lblID_PER_ACCDblClick(Sender: TObject);
begin
    edID_PER_ACC.Text  := '';
    edNOM_PER_ACC.Text := '';
    Objeto.Persona.Id_Persona.IsNull;
    Objeto.Persona.Nombre.IsNull;
end;

end.
