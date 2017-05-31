// Sistema         : Clase de CRCAMBLIN
// Fecha de Inicio : 28/06/2011
// Función forma   : Clase de CRCAMBLIN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrcamblin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

IntGenCre,
IntParamCre,
IntCrCredito,
IntCrCto;

Type
 TCrcamblin= class; 

  TWCrcamblin=Class(TForm)
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
    Label2: TLabel;
    btID_CESION: TBitBtn;
    edNombreAcreditado: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    iedID_CONTRATO: TInterEdit;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    lbF_AUT_COMITE: TLabel;
    edF_AUT_COMITE: TEdit;
    lbF_VENCIMIENTO: TLabel;
    edF_VENCIMIENTO: TEdit;
    GroupBox2: TGroupBox;
    lbIMP_AUTORIZADO: TLabel;
    edIMP_AUTORIZADO: TInterEdit;
    Label1: TLabel;
    edIMP_DISPUESTO: TInterEdit;
    lbIMP_DISPUESTO: TLabel;
    Label19: TLabel;
    edIMP_BLOQUEADO: TInterEdit;
    lbBloqueado: TLabel;
    Label13: TLabel;
    Bevel8: TBevel;
    iedDISPONIBLE_AUT: TInterEdit;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    lbIMP_TRANSITO: TLabel;
    edIMP_FINANC_ADIC: TInterEdit;
    Label3: TLabel;
    iedRIESGO_TOTAL: TInterEdit;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    iedDISPONIBLE_ACRED: TInterEdit;
    Label4: TLabel;
    edDISPONIBLE_GRUPO_ECO: TInterEdit;
    Label7: TLabel;
    Label5: TLabel;
    edCve_Moneda: TEdit;
    ilCesion: TInterLinkit;
    Label14: TLabel;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    iedID_CONTRATO_Dest: TInterEdit;
    edCVE_PRODUCTO_Dest: TEdit;
    edDESC_PRODUCTO_Dest: TEdit;
    edF_AUT_COMITE_Dest: TEdit;
    edF_VENCIMIENTO_Dest: TEdit;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel1: TBevel;
    Label23: TLabel;
    edIMP_AUTORIZADO_Dest: TInterEdit;
    edIMP_DISPUESTO_Dest: TInterEdit;
    edIMP_BLOQUEADO_Dest: TInterEdit;
    iedDISPONIBLE_AUT_Dest: TInterEdit;
    GroupBox7: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    GroupBox8: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    iedDISPONIBLE_ACRED_Dest: TInterEdit;
    edDISPONIBLE_GRUPO_ECO_Dest: TInterEdit;
    edIMP_FINANC_ADIC_Dest: TInterEdit;
    iedRIESGO_TOTAL_Dest: TInterEdit;
    edCve_Moneda_Dest: TEdit;
    btnLinea_Dest: TBitBtn;
    ilLinea_Dest: TInterLinkit;
    edID_CESION: TEdit;
    Label29: TLabel;
    edIMP_CREDITO: TInterEdit;
    pnMensaje: TPanel;
    Label30: TLabel;
    edFINICIO: TEdit;
    Label31: TLabel;
    edFVENCIMIENTO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure ilLinea_DestEjecuta(Sender: TObject);
    procedure iedID_CONTRATO_DestExit(Sender: TObject);
    procedure btnLinea_DestClick(Sender: TObject);
    Procedure FiltraLineaOrigen;
    Procedure FiltraLineaDestino;
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure LimpiaControles;
    private
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TCrcamblin;
end;
 TCrcamblin= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;//Disposición
        ContratoCre              : TCrCto; //Contrato Crédito
        ContratoDest             : TCrCto; //Contrato Destino

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    StpUpdCredito(pIdCredito, pIdContrato: Integer):Boolean;
      published
      end;
      
implementation
//Uses RepMon;

{$R *.DFM}

constructor TCrcamblin.Create( AOwner : TComponent ); 
begin Inherited;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;

      ContratoDest := TCrCto.Create(Self);
      ContratoDest.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntCrcamblin.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrcamblin.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
   if ContratoCre <> nil then
      ContratoCre.Free;
   if ContratoDest <> nil then
      ContratoDest.Free;
  inherited;
end;


function TCrcamblin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcamblin;
begin
   W:=TWCrcamblin.Create(Self);
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


Function TCrcamblin.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcambl.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrcamblin.StpUpdCredito(pIdCredito, pIdContrato: Integer):Boolean;
var
   sptUpdCredito : TStoredProc;
Begin
   Result := True;
   try
     sptUpdCredito := TStoredProc.Create(Self);
     with sptUpdCredito do
     begin
        //Inicia el SPT
        DatabaseName:= Apli.DatabaseName;
        SessionName:= Apli.SessionName;
        StoredProcName:= 'PKGCRCREDITO.STPCAMBIALINEA';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftInteger,'PENUEVOIDCONTRATO',ptInput);
        Params.CreateParam(ftString, 'PECVEUSUMODIFICA',ptInput);
        Params.CreateParam(ftString, 'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,  'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString, 'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
        ParamByName('PENUEVOIDCONTRATO').AsInteger := pIdContrato;
        ParamByName('PECVEUSUMODIFICA').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        begin
           ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' + ParamByName('PSTXRESULTADO').AsString );
           Result := False;
        end;
     end;
   finally
      sptUpdCredito.Free;
   end;
end;

(***********************************************FORMA CRCAMBLIN********************)
(*                                                                                *)
(*  FORMA DE CRCAMBLIN                                                            *)
(*                                                                                *)
(***********************************************FORMA CRCAMBLIN********************)

procedure TWCrcamblin.FormShow(Sender: TObject);
begin
   With Objeto Do
   Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      InterForma1.BtnAceptar.Visible:=True;
      InterForma1.BtnAyuda.Visible:=False;
      InterForma1.BtnCancelar.Visible:=False;
      InterForma1.BtnModificar.Visible:=False;
      InterForma1.BtnEliminar.Visible:=False;

      InterForma1.BtnAceptar.Enabled:=true;

      Credito.ID_CREDITO.Control := edID_CESION;
      Credito.IMP_CREDITO.Control := edIMP_CREDITO;
      Credito.F_INICIO.Control := edFINICIO;
      Credito.F_VENCIMIENTO.Control := edFVENCIMIENTO;

      ContratoCre.Contrato.TITNombre.Control := edNombreAcreditado;
      ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
      ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      ContratoCre.F_AUT_COMITE.Control:= edF_AUT_COMITE;
      ContratoCre.F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
      ContratoCre.CVE_MONEDA.Control:=edCVE_MONEDA;
      ContratoCre.IMP_AUTORIZADO.Control:=edIMP_AUTORIZADO;
      ContratoCre.IMP_DISPUESTO.Control:=edIMP_DISPUESTO;
      ContratoCre.IMP_BLOQUEADO.Control := edIMP_BLOQUEADO;
      ContratoCre.DISPONIBLE_AUT.Control:=iedDISPONIBLE_AUT;
      ContratoCre.DISPONIBLE_ACRED.Control:=iedDISPONIBLE_ACRED;
      ContratoCre.DISPONIBLE_GRUPO_ECO.Control := edDISPONIBLE_GRUPO_ECO;
      ContratoCre.TOTAL_FINANC_ADIC.Control:=edIMP_FINANC_ADIC;
      ContratoCre.RIESGO_TOTAL.Control:=iedRIESGO_TOTAL;

      ContratoDest.ID_CONTRATO.Control := iedID_CONTRATO_Dest;
      ContratoDest.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_Dest;
      ContratoDest.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO_Dest;
      ContratoDest.F_AUT_COMITE.Control:= edF_AUT_COMITE_Dest;
      ContratoDest.F_VENCIMIENTO.Control:=edF_VENCIMIENTO_Dest;
      ContratoDest.CVE_MONEDA.Control:=edCVE_MONEDA_Dest;
      ContratoDest.IMP_AUTORIZADO.Control:=edIMP_AUTORIZADO_Dest;
      ContratoDest.IMP_DISPUESTO.Control:=edIMP_DISPUESTO_Dest;
      ContratoDest.IMP_BLOQUEADO.Control := edIMP_BLOQUEADO_Dest;
      ContratoDest.DISPONIBLE_AUT.Control:=iedDISPONIBLE_AUT_Dest;
      ContratoDest.DISPONIBLE_ACRED.Control:=iedDISPONIBLE_ACRED_Dest;
      ContratoDest.DISPONIBLE_GRUPO_ECO.Control := edDISPONIBLE_GRUPO_ECO_Dest;
      ContratoDest.TOTAL_FINANC_ADIC.Control:=edIMP_FINANC_ADIC_Dest;
      ContratoDest.RIESGO_TOTAL.Control:=iedRIESGO_TOTAL_Dest;

      Objeto.Credito.FilterString := '(CR_CREDITO.SIT_CREDITO = ''AC'')';
      Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString;
   end;      
end;

procedure TWCrcamblin.FormDestroy(Sender: TObject);
begin
   With Objeto Do
   Begin
      Credito.ID_CREDITO.Control := nil;
      Credito.IMP_CREDITO.Control := nil;
      Credito.F_INICIO.Control := nil;
      Credito.F_VENCIMIENTO.Control := nil;

      ContratoCre.Contrato.TITNombre.Control := nil;
      ContratoCre.ID_CONTRATO.Control := nil;
      ContratoCre.CVE_PRODUCTO_CRE.Control := nil;
      ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
      ContratoCre.F_AUT_COMITE.Control := nil;
      ContratoCre.F_VENCIMIENTO.Control := nil;
      ContratoCre.CVE_MONEDA.Control := nil;
      ContratoCre.IMP_AUTORIZADO.Control := nil;
      ContratoCre.IMP_DISPUESTO.Control := nil;
      ContratoCre.IMP_BLOQUEADO.Control := nil;
      ContratoCre.DISPONIBLE_AUT.Control := nil;
      ContratoCre.DISPONIBLE_ACRED.Control := nil;
      ContratoCre.DISPONIBLE_GRUPO_ECO.Control := nil;
      ContratoCre.TOTAL_FINANC_ADIC.Control := nil;
      ContratoCre.RIESGO_TOTAL.Control := nil;

      ContratoDest.ID_CONTRATO.Control := nil;
      ContratoDest.CVE_PRODUCTO_CRE.Control := nil;
      ContratoDest.Producto.DESC_C_PRODUCTO.Control := nil;
      ContratoDest.F_AUT_COMITE.Control := nil;
      ContratoDest.F_VENCIMIENTO.Control := nil;
      ContratoDest.CVE_MONEDA.Control := nil;
      ContratoDest.IMP_AUTORIZADO.Control := nil;
      ContratoDest.IMP_DISPUESTO.Control := nil;
      ContratoDest.IMP_BLOQUEADO.Control := nil;
      ContratoDest.DISPONIBLE_AUT.Control := nil;
      ContratoDest.DISPONIBLE_ACRED.Control := nil;
      ContratoDest.DISPONIBLE_GRUPO_ECO.Control := nil;
      ContratoDest.TOTAL_FINANC_ADIC.Control := nil;
      ContratoDest.RIESGO_TOTAL.Control := nil;
   end;
end;

procedure TWCrcamblin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcamblin.btID_CESIONClick(Sender: TObject);
var vlclave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
//   vlclave := '11';
//if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCAMBLIN_CESIN',True,True) then
   begin
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then
     begin
        Objeto.ContratoCre.FindKey([Objeto.Credito.ID_CONTRATO.AsString,'1']);
        if Objeto.ContratoCre.Active then
           FiltraLineaOrigen;
        InterForma1.NextTab(edID_CESION);
     end;
  end;
  //else begin
  //ShowMessage('    No tiene suficientes permisos para esta Acción');
  //end;
end;

procedure TWCrcamblin.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then
    Begin
        Objeto.ContratoCre.FindKey([Objeto.Credito.ID_CONTRATO.AsString,'1']);
        InterForma1.NextTab(edID_CESION);
    End;

end;

procedure TWCrcamblin.edID_CESIONExit(Sender: TObject);
begin
  If edID_CESION.Text <> '' then
  begin
    if Objeto.ContratoCre.Active then
       FiltraLineaOrigen;
  end;

end;

procedure TWCrcamblin.ilLinea_DestEjecuta(Sender: TObject);
begin
   if Objeto.ContratoDest.FindKey([ilLinea_Dest.Buffer,'1']) then begin
      InterForma1.NextTab(iedID_CONTRATO_Dest);
   End;
end;

procedure TWCrcamblin.iedID_CONTRATO_DestExit(Sender: TObject);
begin
  If iedID_CONTRATO_Dest.Text <> '' then
     FiltraLineaDestino;
end;

procedure TWCrcamblin.btnLinea_DestClick(Sender: TObject);
var vlclave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlclave := '12';
// if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCAMBLIN_NVALN',True,True) then
   begin
      Objeto.ContratoDest.ShowAll := True;
   if Objeto.ContratoDest.Busca then
    begin
      FiltraLineaDestino;
      InterForma1.NextTab(iedID_CONTRATO_Dest);
    end;
   end;
//   else begin
//   ShowMessage('    No tiene suficientes permisos para esta Acción');
//   end;
end;

procedure TWCrcamblin.FiltraLineaOrigen;
begin
  Objeto.ContratoCre.ObtenDisponibleAut(
              objeto.ContratoCre.ID_CONTRATO.AsString,
              objeto.ContratoCre.FOL_CONTRATO.AsString);
  Objeto.ContratoCre.Acreditado.FindKey([Objeto.ContratoCre.Contrato.ID_Titular.AsString]);
  Objeto.ContratoCre.ObtenDisponibleAcred(Objeto.ContratoCre.Acreditado.ID_ACREDITADO.AsString);
  Objeto.ContratoCre.ObtenDisponibleGpo(Objeto.ContratoCre.Acreditado.CVE_GRUPO_ECO.AsString);
  Objeto.ContratoCre.RefinanAut(objeto.ContratoCre.ID_CONTRATO.AsString,
              objeto.ContratoCre.FOL_CONTRATO.AsString);

  Objeto.ContratoDest.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')' +
                                      ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                      ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                        Objeto.ContratoCre.Contrato.ID_Titular.AsString + ' ) ) ' +
                                      ' AND (CR_CONTRATO.ID_CONTRATO <> ' + objeto.ContratoCre.ID_CONTRATO.AsString + ') ' +
                                      ' AND (CR_CONTRATO.CVE_MONEDA = '+ Objeto.ContratoCre.Contrato.Cve_Moneda.AsString + ' )';
  Objeto.ContratoDest.BuscaWhereString := Objeto.ContratoDest.FilterString;

  If Objeto.ContratoDest.FOL_CONTRATO.AsInteger <> 0 then
  begin
    Objeto.ContratoDest.FindKey([0,'1']);
    FiltraLineaDestino;
  end;
end;

procedure
 TWCrcamblin.FiltraLineaDestino;
begin
  Objeto.ContratoDest.ObtenDisponibleAut(
                  objeto.ContratoDest.ID_CONTRATO.AsString,
                  objeto.ContratoDest.FOL_CONTRATO.AsString);
  Objeto.ContratoDest.Acreditado.FindKey([Objeto.ContratoDest.Contrato.ID_Titular.AsString]);
  Objeto.ContratoDest.ObtenDisponibleAcred(Objeto.ContratoDest.Acreditado.ID_ACREDITADO.AsString);
  Objeto.ContratoDest.ObtenDisponibleGpo(Objeto.ContratoDest.Acreditado.CVE_GRUPO_ECO.AsString);
  Objeto.ContratoDest.RefinanAut(objeto.ContratoDest.ID_CONTRATO.AsString,
                  objeto.ContratoDest.FOL_CONTRATO.AsString);
  if Objeto.ContratoDest.F_VENCIMIENTO.AsDateTime < Objeto.Apli.DameFechaEmpresa then
     pnMensaje.Caption := 'El plazo de la línea destino venció el día: ' + Objeto.ContratoDest.F_VENCIMIENTO.AsString
  else if Objeto.ContratoDest.DISPONIBLE_AUT.AsFloat < objeto.Credito.IMP_CREDITO.AsFloat then
     pnMensaje.Caption := 'La línea destino no cuenta con disponible suficiente.'
  else
     pnMensaje.Caption := '';
end;

procedure TWCrcamblin.InterForma1BtnAceptar(Sender: TObject);
begin
   if edID_CESION.Text = '' then
   begin
     ShowMessage('No se ha seleccionado ningún crédito para cambiar Línea.');
     exit;
   end;

   if (iedID_CONTRATO_Dest.Text = '') then
   begin
     ShowMessage('No se ha seleccionado Nueva Línea.');
     exit;
   end;

   If Objeto.ContratoDest.F_VENCIMIENTO.AsDateTime < Objeto.Apli.DameFechaEmpresa then
   begin
     ShowMessage('El plazo de la línea destino venció el día: ' + Objeto.ContratoDest.F_VENCIMIENTO.AsString);
     exit;
   end;

   If Objeto.ContratoDest.DISPONIBLE_AUT.AsFloat < objeto.Credito.IMP_CREDITO.AsFloat then
   begin
     ShowMessage('La línea destino no cuenta con disponible suficiente.');
     exit;
   end;

   if not (MessageDlg('¿Confirma cambiar Línea?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then exit;

   If (edID_CESION.Text <> '') and (iedID_CONTRATO_Dest.Text <> '') then
      if objeto.StpUpdCredito(objeto.Credito.ID_CREDITO.AsInteger, objeto.ContratoDest.ID_CONTRATO.AsInteger) then
      begin
         ShowMessage('Se realizó el cambio de línea.');
         objeto.Credito.FindKey([0,'1']);
         objeto.ContratoCre.FindKey([0,'1']);
         Objeto.ContratoDest.FindKey([0,'1']);
         FiltraLineaDestino;
         LimpiaControles;
      end;
end;

procedure TWCrcamblin.LimpiaControles;
begin
  edID_CESION.Text := '';
  edNombreAcreditado.Text := '';
  edIMP_CREDITO.Text := '';
  iedID_CONTRATO.Text := '';
  edCVE_PRODUCTO.Text := '';
  edDESC_PRODUCTO.Text := '';
  edF_AUT_COMITE.Text := '';
  edF_VENCIMIENTO.Text := '';
  edCve_Moneda.Text := '';
  edIMP_AUTORIZADO.Text := '';
  edIMP_DISPUESTO.Text := '';
  edIMP_BLOQUEADO.Text := '';
  iedDISPONIBLE_AUT.Text := '';
  iedDISPONIBLE_ACRED.Text := '';
  edDISPONIBLE_GRUPO_ECO.Text := '';
  edIMP_FINANC_ADIC.Text := '';
  iedRIESGO_TOTAL.Text := '';

  iedID_CONTRATO_Dest.Text := '';
  edCVE_PRODUCTO_Dest.Text := '';
  edDESC_PRODUCTO_Dest.Text := '';
  edF_AUT_COMITE_Dest.Text := '';
  edF_VENCIMIENTO_Dest.Text := '';
  edCve_Moneda_Dest.Text := '';
  edIMP_AUTORIZADO_Dest.Text := '';
  edIMP_DISPUESTO_Dest.Text := '';
  edIMP_BLOQUEADO_Dest.Text := '';
  iedDISPONIBLE_AUT_Dest.Text := '';
  iedDISPONIBLE_ACRED_Dest.Text := '';
  edDISPONIBLE_GRUPO_ECO_Dest.Text := '';
  edIMP_FINANC_ADIC_Dest.Text := '';
  iedRIESGO_TOTAL_Dest.Text := '';

  edID_CESION.SetFocus;
end;

end.
