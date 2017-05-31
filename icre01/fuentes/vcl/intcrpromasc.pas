// Sistema         : Clase de CRAcProm
// Fecha de Inicio : 16/01/2004
// Función forma   : Clase de CRAcProm
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrPromAsc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,
//Unidades Adicionales
IntParamCre,

IntCrCto,     IntGcto,        //contrato / Promotor Asociado
//IntMPers,     //      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR >
IntGencre,
IntLinkit;


Type
 TCrPromAsc= class;

  TWCrPromAsc=Class(TForm)
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
    gbAUTORIZACION: TGroupBox;
    Label7: TLabel;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    lbID_PROMOTOR: TLabel;
    btPROM_AUT_OLD: TBitBtn;
    edNOM_PROM_AUT_OLD: TEdit;
    Label3: TLabel;
    btPROMOTOR_NEW: TBitBtn;
    edNOM_PROMOTOR_NEW: TEdit;
    cbAUTORIZACION: TCheckBox;
    CBPROM_AUT_OLD: TCheckBox;
    Label4: TLabel;
    lbLiqF_INICIO: TLabel;
    edAutF_INICIO: TEdit;
    dtpAutF_INICIO: TInterDateTimePicker;
    cbFECHA_AUT: TCheckBox;
    btACTUALIZA_AUTOR: TBitBtn;
    Bevel1: TBevel;
    Label5: TLabel;
    ilAUTORIZACION: TInterLinkit;
    iedID_CONTRATO: TEdit;
    edID_PROM_AUT_NEW: TEdit;
    edPERS_ASOC: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilAUTORIZACIONEjecuta(Sender: TObject);
    procedure cbAUTORIZACIONClick(Sender: TObject);
    procedure btPROM_AUT_OLDClick(Sender: TObject);
    procedure CBPROM_AUT_OLDClick(Sender: TObject);
    procedure cbFECHA_AUTClick(Sender: TObject);
    procedure btPROMOTOR_NEWClick(Sender: TObject);
//    procedure ilPROM_AUT_NEWEjecuta(Sender: TObject);
//    procedure ilPROM_AUT_OLDEjecuta(Sender: TObject);
    procedure btACTUALIZA_AUTORClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPromAsc;
end;
 TCrPromAsc= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public

        ID_PERS_ASOCIAD         : TInterCampo;
        NOM_PROM_ASO            : TInterCampo;
        ID_PERS_ASOC_NEW        : TInterCampo;
        NOM_PROM_ASO_NEW        : TInterCampo;

        ParamCre                 : TParamCre;

        CreCto                   : TCrCto;    //contrato
//      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
//        PromAsocOld              : TMPersona; //TGpoCto;   //Promotor Asociado Old
//        PromAsocNew              : TMPersona; //TGpoCto;   //Promotor Asociado New
//      EASA    > /
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


constructor TCrPromAsc.Create( AOwner : TComponent );
begin Inherited;

      ID_PERS_ASOCIAD :=CreaCampo('ID_PERS_ASOCIAD',ftFloat,tsNinguno,tsNinguno,False);
      NOM_PROM_ASO := CreaCampo('NOM_PROM_ASO', ftString, tsNinguno, tsNinguno, False );
      ID_PERS_ASOC_NEW :=CreaCampo('ID_PERS_ASOC_NEW',ftFloat,tsNinguno,tsNinguno,False);
      NOM_PROM_ASO_NEW := CreaCampo('NOM_PROM_ASO_NEW', ftString, tsNinguno, tsNinguno, False );

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrPromAsc.Hlp';
      ShowMenuReporte:=True;

      CreCto := TCrCto.Create(Self);
      CreCto.MasterSource:=Self;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
      PromAsocOld := TMPersona.Create(Self);
      PromAsocOld.FilterBy := fbTMPersonaEmpleado;
      PromAsocOld.MasterSource := Self;
      PromAsocOld.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromAsocNew := TMPersona.Create(Self);
      PromAsocNew.FilterBy := fbTMPersonaEmpleado;
      PromAsocNew.MasterSource := Self;
      PromAsocNew.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      EASA > /
}
 end;

Destructor TCrPromAsc.Destroy;
begin
   if CreCto <> nil then
      CreCto.free;
   //end if
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
   if PromAsocOld <> nil then
      PromAsocOld.free;
   //end if

   if PromAsocNew <> nil then
      PromAsocNew.free;
   //end if
      EASA > /
}
   inherited;
end;


function TCrPromAsc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPromAsc;
begin
   W:=TWCrPromAsc.Create(Self);
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


Function TCrPromAsc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRAcProm.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrPromAsc.ActualizaPromotor(pTipoCambio : String; pCredCtto,pPromOld,pPromNew : String;
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

procedure TWCrPromAsc.FormShow(Sender: TObject);
begin
     //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     dtpAutF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
     edAutF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpAutF_INICIO.DateTime);

     with objeto do
     Begin
        CreCto.ID_CONTRATO.Control := iedID_CONTRATO;
        CreCto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
        CreCto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
        CreCto.GetParams(Objeto);

//      EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
        Objeto.ID_PERS_ASOCIAD.Control := edPERS_ASOC;
        Objeto.NOM_PROM_ASO.Control := edNOM_PROM_AUT_OLD;
        ID_PERS_ASOC_NEW.Control := edID_PROM_AUT_NEW;
        NOM_PROM_ASO_NEW.Control := edNOM_PROMOTOR_NEW;
{
        PromAsocOld.ID_Persona.Control := edPERS_ASOC;
        PromAsocOld.Nombre.Control := edNOM_PROM_AUT_OLD;
        PromAsocOld.GetParams(Objeto);

        PromAsocNew.ID_Persona.Control := edID_PROM_AUT_NEW;
        PromAsocNew.Nombre.Control := edNOM_PROMOTOR_NEW;
        PromAsocNew.GetParams(Objeto);
      EASA > /
}
     end;
end;

procedure TWCrPromAsc.FormDestroy(Sender: TObject);
begin
     with objeto do
     Begin
        CreCto.ID_CONTRATO.Control := nil;
        CreCto.CVE_PRODUCTO_CRE.Control := nil;
        CreCto.Producto.DESC_C_PRODUCTO.Control := nil;
//      EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
        Objeto.ID_PERS_ASOCIAD.Control := nil;
        Objeto.NOM_PROM_ASO.Control := nil;
        ID_PERS_ASOC_NEW.Control := nil;
        NOM_PROM_ASO_NEW.Control := nil;
{
        PromAsocOld.ID_Persona.Control := nil;
        PromAsocOld.Nombre.Control := nil;
        PromAsocNew.ID_Persona.Control := nil;
        PromAsocNew.Nombre.Control := nil;
      EASA > /
}
     end;
end;

procedure TWCrPromAsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPromAsc.btCONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROMASC_AUTO',True,True) then
   begin
     Objeto.CreCto.ShowAll := True;
     if Objeto.CreCto.Busca then
     Begin
        edPERS_ASOC.Text := Objeto.CreCto.Contrato.Id_Pers_Asociad.AsString;
        edNOM_PROM_AUT_OLD.Text := Objeto.CreCto.Contrato.PROMNOMBRE.AsString;
        edAutF_INICIO.Enabled := False;
        CBPROM_AUT_OLD.Checked := False;
        cbFECHA_AUT.Checked := False;
        cbAUTORIZACION.Checked := True;
        btPROM_AUT_OLD.Enabled := False;
  //      Objeto.PromAsocNew.Active := False;
        InterForma1.NextTab(iedID_CONTRATO);
     end;
   end;
end;


procedure TWCrPromAsc.ilAUTORIZACIONEjecuta(Sender: TObject);
begin
   if Objeto.CreCto.FindKeyNear([ilAUTORIZACION.Buffer],['ID_CONTRATO']) then
   Begin
      edPERS_ASOC.Text := Objeto.CreCto.Contrato.Id_Pers_Asociad.AsString;
      edNOM_PROM_AUT_OLD.Text := Objeto.CreCto.Contrato.PROMNOMBRE.AsString;
      edAutF_INICIO.Enabled := False;
      cbFECHA_AUT.Checked := False;
      CBPROM_AUT_OLD.Checked := False;
      cbAUTORIZACION.Checked := True;
      btPROM_AUT_OLD.Enabled := False;
//      Objeto.PromAsocNew.Active := False;
      InterForma1.NextTab(iedID_CONTRATO);
   end;
end;

procedure TWCrPromAsc.cbAUTORIZACIONClick(Sender: TObject);
begin
   if not cbAUTORIZACION.Checked then
   Begin
        Objeto.CreCto.Active := False;
//        Objeto.PromAsocNew.Active := False;
        btPROM_AUT_OLD.Enabled := True;
        cbAUTORIZACION.Checked := False;
        if not(CBPROM_AUT_OLD.Checked) then begin
//      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
//        Objeto.PromAsocOld.Active := False;
          edPERS_ASOC.Text := '';
          edNOM_PROM_AUT_OLD.Text := '';
        end;
//      EASA > /

   end
   else
   Begin
        cbAUTORIZACION.Checked := True;
        cbAUTORIZACION.Enabled := True;
   end;
   if not Objeto.CreCto.Active then
      cbAUTORIZACION.Checked := False;
end;

procedure TWCrPromAsc.btPROM_AUT_OLDClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRPROMASC_PMAS1',True,True) then
   begin
      With Objeto Do
        Begin
          T := CreaBuscador('CRGPOPROM.IT','I');
          Try
            If T.Execute Then
               Begin
                  ID_PERS_ASOCIAD.AsString := T.DameCampo(0);
                  NOM_PROM_ASO.AsString := T.DameCampo(1);
                  Objeto.CreCto.Active := False;
                  cbAUTORIZACION.Checked := False;
                  CBPROM_AUT_OLD.Checked := True;
                  edAutF_INICIO.Enabled := True;
                  cbFECHA_AUT.Checked := True;
                  cbFECHA_AUT.Enabled := True;
                  dtpAutF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
                  edAutF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpAutF_INICIO.DateTime);
                  InterForma1.NextTab(edPERS_ASOC);
               End;
          Finally
            T.Free;
          End;
        End;
    {      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
       Objeto.PromAsocOld.ShowAll := True;
       if not Objeto.PromAsocOld.Busca then
       Begin
          Objeto.CreCto.Active := False;
          cbAUTORIZACION.Checked := False;
          CBPROM_AUT_OLD.Checked := True;
          edAutF_INICIO.Enabled := True;
          cbFECHA_AUT.Checked := True;
          cbFECHA_AUT.Enabled := True;
          dtpAutF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
          edAutF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpAutF_INICIO.DateTime);
          Objeto.PromAsocNew.Active := False;
          InterForma1.NextTab(edPERS_ASOC);
       end;
          EASA > /
    }
   end;
end;

procedure TWCrPromAsc.CBPROM_AUT_OLDClick(Sender: TObject);
begin
   if not Objeto.CreCto.Active then
   Begin
     if not(CBPROM_AUT_OLD.Checked) then
     Begin
     {      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
        Objeto.PromAsocOld.Active := False;
        Objeto.PromAsocNew.Active := False;
}
        edPERS_ASOC.Text := '';
        edNOM_PROM_AUT_OLD.Text := '';
//      EASA > /
        CBPROM_AUT_OLD.Checked := False;
        cbFECHA_AUT.Checked := False;
     end
     else
     Begin
        CBPROM_AUT_OLD.Checked := True;
        CBPROM_AUT_OLD.Enabled := True;
        cbFECHA_AUT.Checked := True;
     end;

     IF edPERS_ASOC.Text = '' THEN
     Begin
        CBPROM_AUT_OLD.Checked := False;
        cbFECHA_AUT.Checked := False;
     end;
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
     if not Objeto.PromAsocOld.Active then
     Begin
        CBPROM_AUT_OLD.Checked := False;
        cbFECHA_AUT.Checked := False;
     end;
      EASA > /
}
   end
   else
   Begin
      CBPROM_AUT_OLD.Checked := False;
      cbFECHA_AUT.Checked := False;
   end;
end;

procedure TWCrPromAsc.cbFECHA_AUTClick(Sender: TObject);
begin
   if not Objeto.CreCto.Active then
   Begin
{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
     if Objeto.PromAsocOld.Active then
     Begin
       if not(cbFECHA_AUT.Checked) then
          cbFECHA_AUT.Checked := False
       else cbFECHA_AUT.Checked := True;
     end
     else cbFECHA_AUT.Checked := False;
      EASA > /
}
   end
   else cbFECHA_AUT.Checked := False;
end;

procedure TWCrPromAsc.btPROMOTOR_NEWClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRPROMASC_PMAS2',True,True) then
   begin
      With Objeto Do
        Begin
          T := CreaBuscador('CRGPOPROM.IT','I');
          Try
            If T.Execute Then
               Begin
                  ID_PERS_ASOC_NEW.AsString := T.DameCampo(0);
                  NOM_PROM_ASO_NEW.AsString := T.DameCampo(1);
                  InterForma1.NextTab(edID_PROM_AUT_NEW);
               End;
          Finally
            T.Free;
          End;
        End;
    {      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
       Objeto.PromAsocNew.ShowAll := True;
       if Objeto.PromAsocNew.Busca then
       Begin
          InterForma1.NextTab(edID_PROM_AUT_NEW);
       end;
          EASA > /
    }
   end;
end;

{      < EASA    20.MAR.2007 REQ. ASIGNACION PROMOTOR
procedure TWCrPromAsc.ilPROM_AUT_NEWEjecuta(Sender: TObject);
begin
   if Objeto.PromAsocNew.FindKey([ilPROM_AUT_NEW.Buffer]) then
   Begin
      InterForma1.NextTab(edID_PROM_AUT_NEW);
   end;
end;

procedure TWCrPromAsc.ilPROM_AUT_OLDEjecuta(Sender: TObject);
begin
   if Objeto.PromAsocOld.FindKey([ilPROM_AUT_OLD.Buffer]) then
   Begin
      Objeto.CreCto.Active := False;
      cbAUTORIZACION.Checked := False;
      CBPROM_AUT_OLD.Checked := True;
      edAutF_INICIO.Enabled := True;
      cbFECHA_AUT.Checked := True;
      cbFECHA_AUT.Enabled := True;
      dtpAutF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edAutF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpAutF_INICIO.DateTime);
      Objeto.PromAsocNew.Active := False;
      InterForma1.NextTab(edPERS_ASOC);
   end;
end;
      EASA > /
}
procedure TWCrPromAsc.btACTUALIZA_AUTORClick(Sender: TObject);
var sContrato, sPromotor, sPromotorNew, sFecha :  String;
begin
   if Objeto.ValidaAccesoEsp('TCRPROMASC_ACTDT',True,True) then
   begin
       sContrato := CNULL;
       sPromotor := CNULL;
       sPromotorNew:= CNULL;
       sFecha := CNULL;

       if cbAUTORIZACION.Checked then
          sContrato := iedID_CONTRATO.Text;
       //end if

       if CBPROM_AUT_OLD.Checked then
          sPromotor := edPERS_ASOC.Text;
       //end if

       if cbFECHA_AUT.Checked then
          sFecha := edAutF_INICIO.Text;

       if (( sContrato <> CNULL ) OR ( sPromotor <> CNULL ) ) and ( edID_PROM_AUT_NEW.Text <> CNULL ) THEN
       Begin
           if MessageDlg('¿Está seguro de actualizar el promotor ',
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
                if Objeto.ActualizaPromotor('CC',sContrato,sPromotor,
                                            edID_PROM_AUT_NEW.Text,sFecha) then
                Begin
                    ShowMessage('Se ha actualizado el promotor');
                end;
             //end if
           end;
       end
       else  ShowMessage('Faltan datos para actualizar el promotor');
   end;    
end;

end.
