// Sistema         : Clase de CR_ECC_COM_SOLI
// Fecha de Inicio : 10/08/2005
// Función forma   : Clase de CR_ECC_COM_SOLI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     : CR_ECC_COM_SOLI
Unit IntMEdoCtaC;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntCrAcredit, IntCrCredito, IntMCatFirma, IntGenCre, IntCrEcCoSo;

Type
 TMEdoCtaC= class;

  TWMEdoCtaC=Class(TForm)
    ilID_CREDITO: TInterLinkit;
    GroupBox1: TGroupBox;
    edFOLIO_SOLICITUD: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edF_FIRMA_CONV: TEdit;
    dtpF_FIRMA_CONV: TInterDateTimePicker;
    Label4: TLabel;
    edF_EMIS_EDO_CTA: TEdit;
    dtpF_EMIS_EDO_CTA: TInterDateTimePicker;
    edTX_ENCABEZADO: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    edTX_CALCE: TMemo;
    edNOM_FIRMA: TEdit;
    btCVE_FIRMA: TBitBtn;
    edCVE_FIRMA: TEdit;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    InterForma1: TInterForma;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilID_ACREDITADO: TInterLinkit;
    edDESC_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    Label1: TLabel;
    rgSITUACION: TRadioGroup;
    Label2: TLabel;
    dtpF_ALTA: TInterDateTimePicker;
    edF_ALTA: TEdit;
    ilCVE_FIRMA: TInterLinkit;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilCVE_FIRMAEjecuta(Sender: TObject);
    procedure btCVE_FIRMAClick(Sender: TObject);
    procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FIRMACapture(Sender: TObject; var Show: Boolean);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edCVE_FIRMAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure edF_ALTAExit(Sender: TObject);
    procedure edF_EMIS_EDO_CTAExit(Sender: TObject);
    procedure edF_FIRMA_CONVExit(Sender: TObject);
    procedure edTX_ENCABEZADOExit(Sender: TObject);
    procedure edTX_CALCEExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMEdoCtaC;
end;
 TMEdoCtaC= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        ID_CREDITO               : TInterCampo;
        SITUACION                : TInterCampo;
        F_ALTA                  : TInterCampo;
        F_EMIS_EDO_CTA           : TInterCampo;
        F_FIRMA_CONV             : TInterCampo;
        TX_ENCABEZADO            : TInterCampo;
        TX_CALCE                 : TInterCampo;
        CVE_FIRMA                : TInterCampo;
        FOLIO_SOLICITUD          : TInterCampo;

        Acreditado               : TCrAcredit;
        CrCredito                : TCrCredito;
        MCatFirma                : TMCatFirma;
        ParamCre                 : TParamCre;
        CrEcCoSo                 : TCrEcCoSo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Function    InternalPost:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMEdoCtaC.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='ID_ACREDITADO';
                ID_ACREDITADO.Parametro:='ID_ACREDITADO';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='ID_CREDITO';
                ID_ACREDITADO.Parametro:='ID_CREDITO';
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
      With SITUACION Do Begin
         Size:=2;
         UseCombo:=True;
         ComboLista.Add('0'); ComboDatos.Add('AC');
         ComboLista.Add('1'); ComboDatos.Add('IM');
         ComboLista.Add('2'); ComboDatos.Add('VE');
         ComboLista.Add('3'); ComboDatos.Add('');
      End;

                SITUACION.Caption:='SITUACION';
                SITUACION.Parametro:='SITUACION';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,False);
                F_ALTA.Caption:='F_ALTA';
                F_ALTA.Parametro:='F_ALTA';
      F_EMIS_EDO_CTA :=CreaCampo('F_EMIS_EDO_CTA',ftDate,tsNinguno,tsNinguno,False);
                F_EMIS_EDO_CTA.Caption:='F_EMIS_EDO_CTA';
                F_EMIS_EDO_CTA.Parametro:='F_EMIS_EDO_CTA';
      F_FIRMA_CONV :=CreaCampo('F_FIRMA_CONV',ftDate,tsNinguno,tsNinguno,False);
                F_FIRMA_CONV.Caption:='F_FIRMA_CONV';
                F_FIRMA_CONV.Parametro:='F_FIRMA_CONV';
      TX_ENCABEZADO :=CreaCampo('TX_ENCABEZADO',ftString,tsNinguno,tsNinguno,False);
                TX_ENCABEZADO.Caption:='TX_ENCABEZADO';
                TX_ENCABEZADO.Parametro:='TX_ENCABEZADO';
      TX_CALCE :=CreaCampo('TX_CALCE',ftString,tsNinguno,tsNinguno,False);
                TX_CALCE.Caption:='TX_CALCE';
                TX_CALCE.Parametro:='TX_CALCE';
      CVE_FIRMA :=CreaCampo('CVE_FIRMA',ftString,tsNinguno,tsNinguno,False);
                CVE_FIRMA.Caption:='CVE_FIRMA';
                CVE_FIRMA.Parametro:='CVE_FIRMA';
      FOLIO_SOLICITUD :=CreaCampo('FOLIO_SOLICITUD',ftString,tsNinguno,tsNinguno,False);
                FOLIO_SOLICITUD.Caption:='FOLIO_SOLICITUD';
                FOLIO_SOLICITUD.Parametro:='FOLIO_SOLICITUD';

      FKeyFields.Add('FOLIO_SOLICITUD');
      FKeyFields.Add('ID_CREDITO');

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      MCatFirma := TMCatFirma.Create(Self);
      MCatFirma.MasterSource:=Self;
      CrEcCoSo := TCrEcCoSo.Create(Self);
      CrEcCoSo.MasterSource:=Self;

      TableName := 'CR_ECC_COM_SOLI';
      UseQuery := False;
      HelpFile := 'IntCrEcCoSo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMEdoCtaC.Destroy;
begin
   If Acreditado<> nil Then
      Acreditado.Free;
   If CrCredito <> nil Then
      CrCredito.Free;
   If MCatFirma <> nil  Then
      MCatFirma.Free;
   If CrEcCoSo <> nil Then
      CrEcCoSo.Free;      
   inherited;
end;


function TMEdoCtaC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMEdoCtaC;
begin
   W:=TWMEdoCtaC.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMEdoCtaC.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMEdoCtaC.it','');
      Try if Active then begin //T.Param(0,CVE_SEGURO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TMEdoCtaC.Reporte:Boolean;
begin //Execute_Reporte();
end;

Function TMEdoCtaC.InternalPost : Boolean;
Var
   stpGenBloq: TStoredProc;
   VLSalida : Boolean;
Begin
   InternalPost := False;
   VLSalida := False;
   If Modo=moAppEnd Then Begin
      stpGenBloq:=TStoredProc.Create(Nil);
      Try
         Try
            stpGenBloq.DatabaseName:=DataBaseName;
            stpGenBloq.SessionName:=SessionName;
            stpGenBloq.Active:=False;
            stpGenBloq.Params.Clear;
            stpGenBloq.StoredProcName:='PKGCRPRUEBA.STPGENEDOCTACERT';
            stpGenBloq.Params.CreateParam(ftInteger,'PEFOL_SOLID',ptInputOutput);
            stpGenBloq.Params.CreateParam(ftInteger,'PEID_ACREDITADO',ptInput);
            stpGenBloq.Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
            stpGenBloq.Params.CreateParam(ftString,'PESITUACION',ptInput);
            stpGenBloq.Params.CreateParam(ftDate,'PEF_CORTE',ptInput);
            stpGenBloq.Params.CreateParam(ftDate,'PEF_EMIS_EDO_CTA',ptInput);
            stpGenBloq.Params.CreateParam(ftDate,'PEF_FIRMA_CONV',ptInput);
            stpGenBloq.Params.CreateParam(ftMemo,'PETX_ENCABEZADO',ptInput);
            stpGenBloq.Params.CreateParam(ftMemo,'PETX_CALCE',ptInput);
            stpGenBloq.Params.CreateParam(ftString,'PECVE_FIRMA',ptInput);
            stpGenBloq.Params.CreateParam(ftInteger,'PEID_EMPRESA',ptInput);
            stpGenBloq.Params.CreateParam(ftDate,'PEF_ALTA',ptInput);
            stpGenBloq.Params.CreateParam(ftString,'PECVE_USU_ALTA',ptInput);
            stpGenBloq.Params.CreateParam(ftString,'PECOMMIT',ptInput);
            stpGenBloq.Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
            stpGenBloq.Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

            stpGenBloq.ParamByName('PEFOL_SOLID').AsInteger := FOLIO_SOLICITUD.AsInteger;
            If ID_ACREDITADO.AsInteger<> 0 Then
               stpGenBloq.ParamByName('PEID_ACREDITADO').AsInteger := ID_ACREDITADO.AsInteger
            Else stpGenBloq.ParamByName('PEID_ACREDITADO').Clear;

            If ID_CREDITO.AsInteger<>0 Then
               stpGenBloq.ParamByName('PEID_CREDITO').AsInteger := ID_CREDITO.AsInteger
            Else stpGenBloq.ParamByName('PEID_CREDITO').Clear;

            If SITUACION.AsString <> '' Then
               stpGenBloq.ParamByName('PESITUACION').AsString := SITUACION.AsString
            Else stpGenBloq.ParamByName('PESITUACION').Clear;

            If F_ALTA.AsDateTime <>0 Then
               stpGenBloq.ParamByName('PEF_CORTE').AsDate := F_ALTA.AsDateTime
            Else stpGenBloq.ParamByName('PEF_CORTE').Clear;

            If F_EMIS_EDO_CTA.AsDateTime <>0 Then
               stpGenBloq.ParamByName('PEF_EMIS_EDO_CTA').AsDate := F_EMIS_EDO_CTA.AsDateTime
            Else stpGenBloq.ParamByName('PEF_EMIS_EDO_CTA').Clear;

            If F_FIRMA_CONV.AsDateTime <>0 Then
               stpGenBloq.ParamByName('PEF_FIRMA_CONV').AsDate := F_FIRMA_CONV.AsDateTime
            Else stpGenBloq.ParamByName('PEF_FIRMA_CONV').Clear;

            stpGenBloq.ParamByName('PETX_ENCABEZADO').AsString:= TX_ENCABEZADO.AsString;
            stpGenBloq.ParamByName('PETX_CALCE').AsString := TX_CALCE.AsString;
            stpGenBloq.ParamByName('PECVE_FIRMA').AsString := CVE_FIRMA.AsString;
            stpGenBloq.ParamByName('PEID_EMPRESA').AsInteger := Self.Apli.IdEmpresa;
            stpGenBloq.ParamByName('PEF_ALTA').AsDate:= Self.Apli.DameFechaEmpresaDia('D000');
            stpGenBloq.ParamByName('PECVE_USU_ALTA').AsString:= Self.Apli.Usuario;
            stpGenBloq.ParamByName('PECOMMIT').AsString:= 'V';

            stpGenBloq.ExecProc;
            If stpGenBloq.ParamByName('PSRESULTADO').AsFloat = 0 Then Begin
               FOLIO_SOLICITUD.AsInteger:= stpGenBloq.ParamByName('PEFOL_SOLID').AsInteger;
               VLSalida:= True;
            End Else Begin
                ShowMessage('ERROR EN ALTA: ' +  IntToStr(stpGenBloq.ParamByName('PSRESULTADO').AsInteger)+
                            stpGenBloq.ParamByName('PSTX_RESULTADO').AsString);
            End;
         Except
            on e: exception do
            begin
                 ShowMessage('Problemas con el Alta. Avise Urgentemente a Sistemas');
                 ShowMessage(e.Message);
            end;
         End;
      Finally
         If stpGenBloq <> Nil Then Begin
            stpGenBloq.UnPrepare;
            stpGenBloq.Free;
         End;
      End;
   End Else If Modo= moEdit Then Begin
      Try
         CrEcCoSo:= TCrEcCoSo.Create(Nil);
         CrEcCoSo.IsCheckSecu := False;
         CrEcCoSo.Apli := Apli;
         CrEcCoSo.Append;
         CrEcCoSo.FOLIO_SOLICITUD.AsInteger:= FOLIO_SOLICITUD.AsInteger;
         CrEcCoSo.ID_CREDITO.AsInteger := Self.ID_CREDITO.AsInteger;

         CrEcCoSo.F_EMIS_EDO_CTA.AsDateTime   := F_EMIS_EDO_CTA.AsDateTime;
         CrEcCoSo.F_FIRMA_CONV.AsDateTime     := F_FIRMA_CONV.AsDateTime;
         CrEcCoSo.TX_ENCABEZADO.AsString      := TX_ENCABEZADO.AsString;
         CrEcCoSo.TX_CALCE.AsString           := TX_CALCE.AsString;
         CrEcCoSo.CVE_FIRMA.AsString          := CVE_FIRMA.AsString;
         VLSalida:= CrEcCoSo.InternalPost;
      Finally
         CrEcCoSo.Free;
      End;
   End;
   AutoRefresh := False;
   InternalPost := VLSalida;
End;

(***********************************************FORMA CR_ECC_COM_SOLI********************)
(*                                                                              *)
(*  FORMA DE CR_ECC_COM_SOLI                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ECC_COM_SOLI********************)

procedure TWMEdoCtaC.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      InterForma1.BtnModificar.Visible:= False;
      InterForma1.BtnEliminar.Visible:= False;
      Interforma1.MsgPanel := MsgPanel;

      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.SITUACION.Control:=rgSITUACION;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.F_EMIS_EDO_CTA.Control:=edF_EMIS_EDO_CTA;
      Objeto.F_FIRMA_CONV.Control:=edF_FIRMA_CONV;
      Objeto.TX_ENCABEZADO.Control:=edTX_ENCABEZADO;
      Objeto.TX_CALCE.Control:=edTX_CALCE;
      Objeto.CVE_FIRMA.Control:=edCVE_FIRMA;
      Objeto.FOLIO_SOLICITUD.Control:=edFOLIO_SOLICITUD;

      Objeto.Acreditado.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control:=edNOM_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);
      Objeto.CrCredito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_CREDITO;
      Objeto.CrCredito.GetParams(Objeto);
      Objeto.MCatFirma.CVE_FIRMA.Control:=edCVE_FIRMA;
      Objeto.MCatFirma.DESC_L_BLOQUE.Control:=edNOM_FIRMA;
      Objeto.MCatFirma.GetParams(Objeto);

      Objeto.CrEcCoSo.FOLIO_SOLICITUD.Control:=edFOLIO_SOLICITUD;
      Objeto.CrEcCoSo.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CrEcCoSo.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control:=edDESC_CREDITO;
      Objeto.CrEcCoSo.F_ALTA.Control:=edF_ALTA;
      Objeto.CrEcCoSo.F_EMIS_EDO_CTA.Control:=edF_EMIS_EDO_CTA;
      Objeto.CrEcCoSo.F_FIRMA_CONV.Control:=edF_FIRMA_CONV;
      Objeto.CrEcCoSo.TX_ENCABEZADO.Control:=edTX_ENCABEZADO;
      Objeto.CrEcCoSo.TX_CALCE.Control:=edTX_CALCE;
      Objeto.CrEcCoSo.CVE_FIRMA.Control:=edCVE_FIRMA;
      Objeto.CrEcCoSo.MCatFirma.CVE_FIRMA.Control:=edCVE_FIRMA;
end;

procedure TWMEdoCtaC.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.SITUACION.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.F_EMIS_EDO_CTA.Control:=nil;
      Objeto.F_FIRMA_CONV.Control:=nil;
      Objeto.TX_ENCABEZADO.Control:=nil;
      Objeto.TX_CALCE.Control:=nil;
      Objeto.CVE_FIRMA.Control:=nil;
      Objeto.FOLIO_SOLICITUD.Control:=nil;

      Objeto.Acreditado.ID_ACREDITADO.Control:=nil;
      Objeto.Acreditado.Persona.Nombre.Control:=nil;
      Objeto.CrCredito.ID_CREDITO.Control := nil;
      Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
      Objeto.MCatFirma.CVE_FIRMA.Control:=nil;
      Objeto.MCatFirma.DESC_L_BLOQUE.Control:=nil;

      Objeto.CrEcCoSo.FOLIO_SOLICITUD.Control:=nil;
      Objeto.CrEcCoSo.ID_CREDITO.Control:=nil;
      Objeto.CrEcCoSo.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control:=nil;
      Objeto.CrEcCoSo.F_ALTA.Control:=nil;
      Objeto.CrEcCoSo.F_EMIS_EDO_CTA.Control:=nil;
      Objeto.CrEcCoSo.F_FIRMA_CONV.Control:=nil;
      Objeto.CrEcCoSo.TX_ENCABEZADO.Control:=nil;
      Objeto.CrEcCoSo.TX_CALCE.Control:=nil;
      Objeto.CrEcCoSo.CVE_FIRMA.Control:=nil;
      Objeto.CrEcCoSo.MCatFirma.CVE_FIRMA.Control:=nil;
End;

procedure TWMEdoCtaC.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMEdoCtaC.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgSITUACION.ItemIndex:= 3;
   Objeto.F_ALTA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_EMIS_EDO_CTA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FIRMA_CONV.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edID_ACREDITADO.SetFocus;
end;

procedure TWMEdoCtaC.InterForma1DespuesModificar(Sender: TObject);
begin
   edID_ACREDITADO.SetFocus;
end;

procedure TWMEdoCtaC.btID_ACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      Objeto.CrCredito.Active:= False;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMEdoCtaC.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer])Then Begin
      Objeto.CrCredito.Active:= False;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMEdoCtaC.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.CrCredito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      Objeto.Acreditado.Active:= False;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWMEdoCtaC.ilID_CREDITOEjecuta(Sender: TObject);
begin
   Objeto.CrCredito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
   If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
      Objeto.Acreditado.Active:= False;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWMEdoCtaC.ilCVE_FIRMAEjecuta(Sender: TObject);
begin
   If Objeto.MCatFirma.FindKey([ilCVE_FIRMA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FIRMA);
   End;
end;

procedure TWMEdoCtaC.btCVE_FIRMAClick(Sender: TObject);
begin
   Objeto.MCatFirma.ShowAll := True;
   If Objeto.MCatFirma.Busca Then Begin
      InterForma1.NextTab(edCVE_FIRMA);
   End;
end;

procedure TWMEdoCtaC.ilID_ACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMEdoCtaC.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMEdoCtaC.ilCVE_FIRMACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMEdoCtaC.edID_ACREDITADOExit(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      InterForma1.ValidaExit(edID_ACREDITADO,True,'',True);
   End;
end;

procedure TWMEdoCtaC.edID_CREDITOExit(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      InterForma1.ValidaExit(edID_CREDITO,True,'',True);
   End;
end;

procedure TWMEdoCtaC.edCVE_FIRMAExit(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      InterForma1.ValidaExit(edCVE_FIRMA,True,'',True);
   End;
end;

procedure TWMEdoCtaC.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   Objeto.GetFromControl;
   If IsNewData Then Begin
      If (Objeto.ID_ACREDITADO.AsString = '')And(Objeto.ID_CREDITO.AsString = '') Then Begin
         ShowMessage('Debe seleccionar un crédito o un acreditado');
         Realizado := False;
      End Else Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            Realizado := True;
         End else
            Realizado := False;
      End;
   End Else Begin
      If MessageDlg('El registro no puede ser modificado',
         //MessageDlg('¿Desea guardar los datos modificados?',
           mtWarning,[mbOK], 0) = mrYes Then
         Realizado := False;
   End
end;

procedure TWMEdoCtaC.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,'',True);
end;

procedure TWMEdoCtaC.edF_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_ALTA,True,'',True);
end;

procedure TWMEdoCtaC.edF_EMIS_EDO_CTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_EMIS_EDO_CTA,True,'',True);
end;

procedure TWMEdoCtaC.edF_FIRMA_CONVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_FIRMA_CONV,True,'',True);
end;

procedure TWMEdoCtaC.edTX_ENCABEZADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_ENCABEZADO,True,'',True);
end;

procedure TWMEdoCtaC.edTX_CALCEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_CALCE,True,'',True);
end;

procedure TWMEdoCtaC.InterForma1Buscar(Sender: TObject);
begin
   If Objeto.CrEcCoSo.Busca Then Begin
      Objeto.CrCredito.FindKey([Objeto.CrEcCoSo.ID_CREDITO.AsString]);
      Objeto.MCatFirma.FindKey([Objeto.CrEcCoSo.CVE_FIRMA.AsString]);
   End;
end;

end.
