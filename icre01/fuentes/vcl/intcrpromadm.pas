// Sistema         : Clase de CRAcProm
// Fecha de Inicio : 16/01/2004
// Función forma   : Clase de CRAcProm
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrPromAdm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,
//Unidades Adicionales
IntParamCre,

IntCrCredito,
//IntMPers,       //Disposicion / Promotor Administrativo
IntGencre,
IntLinkit;


Type
 TCrPromAdm= class;

  TWCrPromAdm=Class(TForm)
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
    gbDISPOSICION: TGroupBox;
    Label1: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    Label2: TLabel;
    edPROM_DISP_OLD: TEdit;
    BTPROM_DISP_OLD: TBitBtn;
    edNOM_PROM_DISP_OLD: TEdit;
    Label6: TLabel;
    cbDISPOSICION: TCheckBox;
    CBPROM_DISP_OLD: TCheckBox;
    Label8: TLabel;
    edFECHA_DISP: TEdit;
    dtFECHA_DISP: TInterDateTimePicker;
    Label9: TLabel;
    cbFECHA_DISP: TCheckBox;
    Label10: TLabel;
    edPROM_DISP_NEW: TEdit;
    btPROM_DISP_NEW: TBitBtn;
    edNOM_PROM_DISP_NEW: TEdit;
    Bevel2: TBevel;
    btACTUALIZA_DISP: TBitBtn;
    ilDISPOSICION: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure ilDISPOSICIONEjecuta(Sender: TObject);
    procedure cbDISPOSICIONClick(Sender: TObject);
    procedure BTPROM_DISP_OLDClick(Sender: TObject);
//    procedure ilPROM_DISP_OLDEjecuta(Sender: TObject);
    procedure CBPROM_DISP_OLDClick(Sender: TObject);
    procedure cbFECHA_DISPClick(Sender: TObject);
    procedure btPROM_DISP_NEWClick(Sender: TObject);
//    procedure liPROM_DISP_NEWEjecuta(Sender: TObject);
    procedure btACTUALIZA_DISPClick(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPromAdm;
end;
 TCrPromAdm= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        ID_PROM_ADMON           : TInterCampo;
        NOM_PROM_ADMON          : TInterCampo;
        ID_PROM_ADM_NEW         : TInterCampo;
        NOM_PROM_ADM_NEW        : TInterCampo;

        ParamCre                 : TParamCre;

        Credito                  : TCrCredito; //Disposicion
//      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
//        PromAdmOld               : TMPersona;  //Promotor Administrativo Old
//        PromAdmNew               : TMPersona;  //Promotor Administrativo New
//        EASA >
        { Public declarations }
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    ActualizaPromotor(pTipoCambio : String; pCredCtto,pPromOld,pPromNew : String;
                                      pFecha: String ) : Boolean;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPromAdm.Create( AOwner : TComponent );
begin Inherited;
      ID_PROM_ADMON :=CreaCampo('ID_PROM_ADMON',ftFloat,tsNinguno,tsNinguno,False);
      NOM_PROM_ADMON := CreaCampo('NOM_PROM_ADMON', ftString, tsNinguno, tsNinguno, False );
      ID_PROM_ADM_NEW :=CreaCampo('ID_PROM_ADM_NEW',ftFloat,tsNinguno,tsNinguno,False);
      NOM_PROM_ADM_NEW := CreaCampo('NOM_PROM_ADM_NEW', ftString, tsNinguno, tsNinguno, False );

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrPromAdm.Hlp';
      ShowMenuReporte:=True;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
      PromAdmOld := TMPersona.Create(Self);
      PromAdmOld.FilterBy := fbTMPersonaEmpleado;
      PromAdmOld.MasterSource := Self;
      PromAdmOld.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromAdmNew := TMPersona.Create(Self);
      PromAdmNew.FilterBy := fbTMPersonaEmpleado;
      PromAdmNew.MasterSource := Self;
      PromAdmNew.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      EASA > /
}
 end;

Destructor TCrPromAdm.Destroy;
begin
   if Credito <> nil then
      Credito.free;
   //end if
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
   if PromAdmOld <> nil then
      PromAdmOld.free;
   //end if

   if PromAdmNew <> nil then
      PromAdmNew.free;
   //end if
      EASA > /
}
   inherited;
end;


function TCrPromAdm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPromAdm;
begin
   W:=TWCrPromAdm.Create(Self);
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


Function TCrPromAdm.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRAcProm.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrPromAdm.ActualizaPromotor(pTipoCambio : String; pCredCtto,pPromOld,pPromNew : String;
                                     pFecha: String ) : Boolean;
var     VLSalida      : Boolean;
        StpActProm    : TStoredProc;
Begin
     //Inicia el SPT
     vlSalida := True;
     StpActProm := TStoredProc.Create(Self);
     try
        with StpActProm do
        begin
          StpActProm.DatabaseName:= Apli.DatabaseName;
          StpActProm.SessionName:= Apli.SessionName;
          StpActProm.StoredProcName:='PKGCRCREDITO.STPACTUALPROMOTOR';
          Params.Clear;
          Params.CreateParam(ftString,'peTipoCambio',ptInput);
          Params.CreateParam(ftFloat,'peIdCredCto',ptInput);
          Params.CreateParam(ftFloat,'pePromOld',ptInput);
          Params.CreateParam(ftFloat,'pePromNew',ptInput);
          Params.CreateParam(ftDate,'peFechaAlta',ptInput);
          Params.CreateParam(ftString,'peCveUsuMod',ptInput);
          Params.CreateParam(ftString,'peFechaModif',ptInput);
          Params.CreateParam(ftString,'peBCommit',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peTipoCambio').AsString := pTipoCambio;
          ParamByName('peIdCredCto').AsString := pCredCtto;
          ParamByName('pePromOld').AsString:= pPromOld;
          ParamByName('pePromNew').AsString := pPromNew;
          ParamByName('peFechaAlta').AsString:= pFecha;
          ParamByName('peCveUsuMod').AsString := Apli.Usuario;
          ParamByName('peFechaModif').AsDateTime := Apli.DameFechaEmpresa;
          ParamByName('peBCommit').AsString := 'V';
          ExecProc;

          //SI CARGA MANDA LA CESION Y Y LA SITUACION DEL MISMO
          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             ShowMessage('Problemas al actualizar el promotor: ' +
             IntToStr(ParamByName('psRESULTADO').AsInteger));
             ShowMessage(ParamByName('psTxResultado').AsString);
             vlSalida := False;
          end;
        end;
     finally
          StpActProm.Free;
     end;
     ActualizaPromotor := VLSalida;
end;



(***********************************************FORMA CRAcProm********************)
(*                                                                              *)
(*  FORMA DE CRAcProm                                                            *)
(*                                                                              *)
(***********************************************FORMA CRAcProm********************)

procedure TWCrPromAdm.FormShow(Sender: TObject);
begin
     //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     dtFECHA_DISP.DateTime:= Objeto.Apli.DameFechaEmpresa;
     edFECHA_DISP.text:=FormatDateTime('dd/mm/yyyy',dtFECHA_DISP.DateTime);

     with objeto do
     Begin
        Credito.ID_CREDITO.Control := edID_CREDITO;
        Credito.ContratoCre.Contrato.TITNombre.Control :=edNOM_ACREDITADO;
        Credito.GetParams(Objeto);
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
        PromAdmOld.ID_Persona.Control := edPROM_DISP_OLD;
        PromAdmOld.Nombre.Control :=  edNOM_PROM_DISP_OLD;
        PromAdmOld.GetParams(Objeto);

        PromAdmNew.ID_Persona.Control := edPROM_DISP_NEW;
        PromAdmNew.Nombre.Control :=  edNOM_PROM_DISP_NEW;
        PromAdmNew.GetParams(Objeto);
}
        Objeto.ID_PROM_ADMON.Control := edPROM_DISP_OLD;
        Objeto.NOM_PROM_ADMON.Control := edNOM_PROM_DISP_OLD;
        ID_PROM_ADM_NEW.Control := edPROM_DISP_NEW;
        NOM_PROM_ADM_NEW.Control := edNOM_PROM_DISP_NEW;
//      EASA > /

     end;
end;

procedure TWCrPromAdm.FormDestroy(Sender: TObject);
begin
     with objeto do
     Begin
        Credito.ID_CREDITO.Control := nil;
        Credito.ContratoCre.Contrato.TITNombre.Control :=nil;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
        PromAdmOld.ID_Persona.Control := nil;
        PromAdmOld.Nombre.Control :=  nil;
        PromAdmNew.ID_Persona.Control := nil;
        PromAdmNew.Nombre.Control :=  nil;
}
        Objeto.ID_PROM_ADMON.Control := nil;
        Objeto.NOM_PROM_ADMON.Control := nil;
        ID_PROM_ADM_NEW.Control := nil;
        NOM_PROM_ADM_NEW.Control := nil;
//      EASA > /
     end;
end;

procedure TWCrPromAdm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPromAdm.ilDISPOSICIONEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilDISPOSICION.Buffer]) then
   Begin
      edPROM_DISP_OLD.Text := Objeto.Credito.ID_PROM_ADM.AsString;
      edNOM_PROM_DISP_OLD.Text := Objeto.Credito.PromotorAdm.Nombre.AsString;
      edFECHA_DISP.Enabled := False;
      cbFECHA_DISP.Checked := False;
      cbDISPOSICION.Checked := True;
      CBPROM_DISP_OLD.Checked := False;
      BTPROM_DISP_OLD.Enabled := False;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
      Objeto.PromAdmNew.Active := False;
}
      edPROM_DISP_NEW.Text := '';
      edNOM_PROM_DISP_NEW.Text := '';
//      EASA > /
      InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TWCrPromAdm.cbDISPOSICIONClick(Sender: TObject);
begin
     if not(cbDISPOSICION.Checked) then
     Begin
        Objeto.Credito.Active := False;

{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
        Objeto.PromAdmNew.Active := False;
}
        edPROM_DISP_NEW.Text := '';
        edNOM_PROM_DISP_NEW.Text := '';
//      EASA > /
        BTPROM_DISP_OLD.Enabled := True;
        cbDISPOSICION.Checked := False;
        if not(CBPROM_DISP_OLD.Checked) then
        Begin
           edPROM_DISP_OLD.Text := '';
           edNOM_PROM_DISP_OLD.Text := '';
        end;
     end
     else
     Begin
        cbDISPOSICION.Checked := True;
        cbDISPOSICION.Enabled := True;
     end;
     if not Objeto.Credito.Active then
        cbDISPOSICION.Checked := False;
end;

procedure TWCrPromAdm.BTPROM_DISP_OLDClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRPROMADM_PMAD1',True,True) then
   begin
      With Objeto Do
        Begin
          T := CreaBuscador('CRGPOPROM.IT','I');
          Try
            If T.Execute Then
               Begin
                  ID_PROM_ADMON.AsString := T.DameCampo(2);
                  NOM_PROM_ADMON.AsString := T.DameCampo(3);
                  Objeto.Credito.Active := False;
                  cbDISPOSICION.Checked := False;
                  CBPROM_DISP_OLD.Checked := True;
                  edFECHA_DISP.Enabled := True;
                  cbFECHA_DISP.Enabled := True;
                  cbFECHA_DISP.Checked := True;
                  InterForma1.NextTab(edPROM_DISP_OLD);
               End;
          Finally
            T.Free;
          End;
        End;
   end;
end;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
   Objeto.PromAdmOld.ShowAll := True;
   if not Objeto.PromAdmOld.Busca then
   Begin
      Objeto.Credito.Active := False;
      cbDISPOSICION.Checked := False;
      CBPROM_DISP_OLD.Checked := True;
      edFECHA_DISP.Enabled := True;
      cbFECHA_DISP.Enabled := True;
      cbFECHA_DISP.Checked := True;
      Objeto.PromAdmNew.Active := False;
      InterForma1.NextTab(edPROM_DISP_OLD);
   end;

end;

procedure TWCrPromAdm.ilPROM_DISP_OLDEjecuta(Sender: TObject);
begin
   if Objeto.PromAdmOld.FindKey([ilPROM_DISP_OLD.Buffer]) then
   Begin
      Objeto.Credito.Active := False;
      cbDISPOSICION.Checked := False;
      CBPROM_DISP_OLD.Checked := True;
      edFECHA_DISP.Enabled := True;
      cbFECHA_DISP.Enabled := True;
      cbFECHA_DISP.Checked := True;
      Objeto.PromAdmNew.Active := False;
      InterForma1.NextTab(edPROM_DISP_OLD);
   end;
end;
}
//      EASA > /

procedure TWCrPromAdm.CBPROM_DISP_OLDClick(Sender: TObject);
begin
   if not Objeto.Credito.Active then
   Begin
     if not(CBPROM_DISP_OLD.Checked) then
     Begin
//      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
//        Objeto.PromAdmOld.Active := False;
        edPROM_DISP_OLD.Text := '';
        edNOM_PROM_DISP_OLD.Text := '';
//        Objeto.PromAdmNew.Active := False;
        edPROM_DISP_NEW.Text := '';
        edNOM_PROM_DISP_NEW.Text := '';
//      EASA > /
        CBPROM_DISP_OLD.Checked := False;
        cbFECHA_DISP.Checked := False;
     end
     else
     Begin
        CBPROM_DISP_OLD.Checked := True;
        cbFECHA_DISP.Enabled := True;
        cbFECHA_DISP.Checked := True;
     end;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
     if not Objeto.PromAdmOld.Active then
}    IF edPROM_DISP_OLD.Text = '' THEN
     Begin
        CBPROM_DISP_OLD.Checked := False;
        cbFECHA_DISP.Checked := False;
     end;
   end
   else
   Begin
      CBPROM_DISP_OLD.Checked := False;
      cbFECHA_DISP.Checked := False;
   end;
end;

procedure TWCrPromAdm.cbFECHA_DISPClick(Sender: TObject);
begin
   if not Objeto.Credito.Active then
   Begin
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
     if Objeto.PromAdmOld.Active then
}    IF edPROM_DISP_OLD.Text = '' THEN
     Begin
       if not(cbFECHA_DISP.Checked) then
          cbFECHA_DISP.Checked := False
       else cbFECHA_DISP.Checked := True;
     end
     else dtFECHA_DISP.Checked := False;
   end
   else cbFECHA_DISP.Checked := False;
end;

procedure TWCrPromAdm.btPROM_DISP_NEWClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRPROMADM_PMAD2',True,True) then
   begin
      With Objeto Do
        Begin
          T := CreaBuscador('CRGPOPROM.IT','I');
          IF ( Objeto.Credito.Active ) THEN
          BEGIN
             T.WhereString := ' GPO_CONTRATO.ID_PERS_PROM_AUT = ' + Objeto.Credito.ContratoCre.Contrato.Id_Pers_Asociad.AsString;//+
    //                      ' AND ID_GRUPO = ' + Objeto.Credito.ContratoCre.Contrato.Id_Grupo.AsString ; easa4011 03.04.2008
          END;
          Try
            If T.Execute Then
               Begin
                  ID_PROM_ADM_NEW.AsString := T.DameCampo(2);
                  NOM_PROM_ADM_NEW.AsString := T.DameCampo(3);
                  InterForma1.NextTab(edPROM_DISP_NEW);
               End;
          Finally
            T.Free;
          End;
        End;
   end;
end;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
   Objeto.PromAdmNew.ShowAll := True;
   if Objeto.PromAdmNew.Busca then
   Begin
      InterForma1.NextTab(edPROM_DISP_NEW);
   end;
end;

procedure TWCrPromAdm.liPROM_DISP_NEWEjecuta(Sender: TObject);
begin
   if Objeto.PromAdmNew.FindKey([liPROM_DISP_NEW.Buffer]) then
   Begin
      InterForma1.NextTab(edPROM_DISP_NEW);
   end;
end;
EASA >
}
procedure TWCrPromAdm.btACTUALIZA_DISPClick(Sender: TObject);
var sDisposicion, sPromotor, sPromotorNew, sFecha :  String;
begin
   if Objeto.ValidaAccesoEsp('TCRPROMADM_ACTDT',True,True) then
   begin
       sDisposicion := CNULL;
       sPromotor := CNULL;
       sPromotorNew:= CNULL;
       sFecha := CNULL;

       if cbDISPOSICION.Checked then
          sDisposicion := edID_CREDITO.Text;
       //end if

       if CBPROM_DISP_OLD.Checked then
          sPromotor := edPROM_DISP_OLD.Text;
       //end if

       if cbFECHA_DISP.Checked then
          sFecha := edFECHA_DISP.Text;

       if (( sDisposicion <> CNULL ) OR ( sPromotor <> CNULL ) ) and ( edPROM_DISP_NEW.Text <> CNULL ) THEN
       Begin
         if MessageDlg('¿Está seguro de actualizar el promotor ',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
              if Objeto.ActualizaPromotor('CR',sDisposicion,sPromotor,
                                          edPROM_DISP_NEW.Text,sFecha) then
              Begin
                 ShowMessage('Se ha actualizado el promotor');
              end
         end;
       end
       else ShowMessage('Faltan datos para actualizar el promotor');
   end;
end;

procedure TWCrPromAdm.btCREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROMADM_DISP',True,True) then
   begin
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then
     Begin
        edPROM_DISP_OLD.Text := Objeto.Credito.ID_PROM_ADM.AsString;
        edNOM_PROM_DISP_OLD.Text := Objeto.Credito.PromotorAdm.Nombre.AsString;
        edFECHA_DISP.Enabled := False;
        cbFECHA_DISP.Checked := False;
        cbDISPOSICION.Checked := True;
        CBPROM_DISP_OLD.Checked := False;
        BTPROM_DISP_OLD.Enabled := False;
  //      Objeto.PromAdmNew.Active := False;
        edPROM_DISP_NEW.Text := '';
        edNOM_PROM_DISP_NEW.Text := '';
        InterForma1.NextTab(edID_CREDITO);
     end;
   end;
end;

end.
