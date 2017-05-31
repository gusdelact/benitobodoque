// Sistema         : Clase de CR_REL_PROD_MON
// Fecha de Inicio : 06/06/2003
// Función forma   : Clase de CR_REL_PROD_MON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrRePrMn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre, IntCrProduct, IntMon, IntLinkit, InterEdit, IntTasIndFin, IntGenCre;

Const
  CTRIMCHAR = ':_'#32;

Type
 TCrRePrMn= class;

  TWCrRelProdMn=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_PRODUCTO_CRE : TLabel;
    edCVE_PRODUCTO_CRE : TEdit;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    edDESC_PRODUCTO_CRE: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPRODUCTO: TInterLinkit;
    ilMONEDA: TInterLinkit;
    lbCVE_TASA_REFER: TLabel;
    edCVE_TASA_REFER: TEdit;
    btCVE_TASA_REFER: TBitBtn;
    edDESC_TASA_REFER: TEdit;
    lbOPERADOR_STASA: TLabel;
    cbOPERADOR_STASA: TComboBox;
    lbSOBRETASA: TLabel;
    edSOBRETASA: TInterEdit;
    ilTASA_REFER: TInterLinkit;
    btPRODUCTO_CRE: TBitBtn;
    MsgPanel: TPanel;
    Label1: TLabel;
    edDIAS_AVIS_DISP: TInterEdit;
    grOperaciones: TGroupBox;
    Label8: TLabel;
    lbH_INI_DISPOS: TLabel;
    Label10: TLabel;
    lbH_FIN_DISPOS: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbH_INI_PAGOS: TLabel;
    Label15: TLabel;
    lbH_FIN_PAGOS: TLabel;
    Label17: TLabel;
    edH_INI_DISPOS: TMaskEdit;
    edH_INI_PAGOS: TMaskEdit;
    edH_FIN_DISPOS: TMaskEdit;
    edH_FIN_PAGOS: TMaskEdit;
    edMAX_DIA_AVIS_DIS: TInterEdit;
    Label2: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTO_CREDClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edCVE_TASA_REFERExit(Sender: TObject);
    procedure cbOPERADOR_STASAExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure btCVE_TASA_REFERClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure ilTASA_REFERCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edDIAS_AVIS_DISPExit(Sender: TObject);
    procedure edH_INI_DISPOSExit(Sender: TObject);
    procedure edH_FIN_DISPOSExit(Sender: TObject);
    procedure edH_INI_PAGOSExit(Sender: TObject);
    procedure edH_FIN_PAGOSExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edMAX_DIA_AVIS_DISExit(Sender: TObject);
//  procedure edTASA_BASEExit(Sender: TObject);
    private
    { Private declarations }
//       vgActualiza   : Boolean;
//     Procedure   VerificaPredeter;
       function    verPredeter(pProduto, pMoneda, pTasa : String): Boolean;
       procedure   HabilitaCtrlsOperacionesInternet; // SATV4766 el 04 Jul 2006
       procedure   CopiaDatosOriginales;
    public
    { Public declarations }
    Objeto : TCrRePrMn;
end;
 TCrRePrMn= class(TInterFrame)
      private
        vgH_INI_DISPOS_ORI : String;
        vgH_FIN_DISPOS_ORI : String;
        vgH_INI_PAGOS_ORI  : String;
        vgH_FIN_PAGOS_ORI  : String;
        vgNUM_REG_AFECT : Integer;
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SOBRETASA                : TInterCampo;
        B_TASA_PREDETER          : TInterCampo;
        TASA_BASE                : TInterCampo; //EASA 28052004
        DIAS_AVIS_DISP           : TInterCampo; //SATV 08062006
        H_INI_DISPOS             : TInterCampo; //SATV 08062006
        H_FIN_DISPOS             : TInterCampo; //SATV 08062006
        H_INI_PAGOS              : TInterCampo; //SATV 08062006
        H_FIN_PAGOS              : TInterCampo; //SATV 08062006
        MAX_DIA_AVIS_DIS         : TInterCampo; //LOLS 07082006 MAXIMO NUMERO DE DIAS AVISO DE DISP.

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        TasaRefer                : TTasIndFin;

        function   ValidacionHoras(peHoraIni, peHoraFin : TInterCampo; pestrCaption : String;
                                   pebControlFinal, pebObligatorio : Boolean;
                                    var psMensaje : String) : Boolean;
        function StpActualizaHorarioCredLinea( peCVE_PRODUCTO_CRE  ,
                                               peCVE_MONEDA        ,
                                               peCVE_TASA_IGNORAR  ,
                                               peH_INI_DISPOS      ,
                                               peH_FIN_DISPOS      ,
                                               peH_INI_PAGOS       ,
                                               peH_FIN_PAGOS       : String;
                                               var psNUM_REG_AFECT : Integer
                                              ) : Boolean;
        function    InternalPost : Boolean; override;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

function ValidaFmtHora(peStrHora : String; var psDate : TDateTime) : Boolean;
function ValidaHoraIniFin(peHoraIni, peHoraFin, strCaption : String; var psMensaje : String) : Boolean;

implementation
{$R *.DFM}

function ValidaFmtHora(peStrHora : String; var psDate : TDateTime) : Boolean;
begin
 psDate := 0;
 Try
  If (Length(peStrHora) = 8) Then
    Begin
    psDate := StrToDateTime('01/01/01 '+peStrHora);
    Result := True;
    End
  Else
    Result := False;
 Except
  Result := False;
 End;
end;

function ValidaHoraIniFin(peHoraIni, peHoraFin, strCaption : String; var psMensaje : String) : Boolean;
var vlHoraIni, vlHoraFin : TDateTime;
begin
  psMensaje := ''; vlHoraIni := 0; vlHoraFin := 0;
  If (TrimChar(peHoraIni, CTRIMCHAR) <> '') Or (TrimChar(peHoraFin, CTRIMCHAR) <> '') Then
    Begin
    If Not ValidaFmtHora(peHoraIni, vlHoraIni) Then
       psMensaje := 'La Hora Inicial de '+strCaption+' no es válida. Favor de verificar.'
    Else If Not ValidaFmtHora(peHoraFin, vlHoraFin) Then
       psMensaje := 'La Hora Final de '+strCaption+' no es válida. Favor de verificar.'
    Else If (vlHoraFin = vlHoraIni ) Then
       psMensaje := 'La Hora Inicial y Final no pueden ser iguales. Favor de verificar.'
    Else If (vlHoraFin < vlHoraIni ) Then
       psMensaje := 'La Hora Inicial no puede ser mayor que la Final . Favor de verificar.'
    End;
  Result := psMensaje = '';
end;

constructor TCrRePrMn.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Producto de la disposición';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Moneda';
      CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_REFER.Caption:='Tasa de Referencia';
      OPERADOR_STASA :=CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,True);
                OPERADOR_STASA.Caption:='Operador de Sobretasa';
      // Inicio de Modficación de SATV4766 el 08Jun2006
      H_INI_DISPOS := CreaCampo('H_INI_DISPOS',ftString,tsNinguno,tsNinguno,True);
             H_INI_DISPOS.Caption:='Hora inicio de disposición';
      H_FIN_DISPOS := CreaCampo('H_FIN_DISPOS',ftString,tsNinguno,tsNinguno,True);
             H_FIN_DISPOS.Caption:='Hora final de disposición';
      H_INI_PAGOS := CreaCampo('H_INI_PAGOS',ftString,tsNinguno,tsNinguno,True);
             H_INI_PAGOS.Caption:='Hora inicio de pagos y de prepagos';
      H_FIN_PAGOS := CreaCampo('H_FIN_PAGOS',ftString,tsNinguno,tsNinguno,True);
             H_FIN_PAGOS.Caption:='Hora final de pagos y de prepagos';
      DIAS_AVIS_DISP :=CreaCampo('DIAS_AVIS_DISP',ftInteger,tsNinguno,tsNinguno,True);
                DIAS_AVIS_DISP.Caption:='Días Aviso Disposición';

      //<LOLS 07 AGO 2006. MAXIMO NUMERO DE DIAS AVISO DE DISPOSICION>
      MAX_DIA_AVIS_DIS:=CreaCampo('MAX_DIA_AVIS_DIS',ftFloat,tsNinguno,tsNinguno,True);
                MAX_DIA_AVIS_DIS.Caption:='Máximo número de días aviso disposición';
      //</LOLS>

      // Termina de Modficación de SATV4766
         With OPERADOR_STASA do
         Begin  Size := 1;
                UseCombo := True;
                ComboLista.Add('+'); ComboDatos.Add('+');
                ComboLista.Add('-'); ComboDatos.Add('-');
                ComboLista.Add('*'); ComboDatos.Add('*');
                ComboLista.Add('/'); ComboDatos.Add('/');
                ComboLista.Add('%'); ComboDatos.Add('%');
         end;
                OPERADOR_STASA.Caption:='Operador Sobre - Tasa';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';
      B_TASA_PREDETER :=CreaCampo('B_TASA_PREDETER',ftString,tsNinguno,tsNinguno,True);
                B_TASA_PREDETER.Caption:='Tasa Predeterminada';
      TASA_BASE :=CreaCampo('TASA_BASE',ftFloat,tsNinguno,tsNinguno,True);
                TASA_BASE.Caption:='Tasa Base';
      FKeyFields.Add('CVE_MONEDA');
      FKeyFields.Add('CVE_PRODUCTO_CRE');
      FKeyFields.Add('CVE_TASA_REFER');

      TableName := 'CR_REL_PROD_MON';
      UseQuery := True;
      HelpFile := 'IntCrRePrMn.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Producto := TCrProduct.Create(Self);
      {$WARNINGS ON}
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='CVE_PRODUCTO_CRE';

      {$WARNINGS OFF}
      Moneda := TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      {$WARNINGS OFF}
      TasaRefer := TTasIndFin.Create(Self);
      {$WARNINGS ON}      
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER';
      TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer.FilterString := TasaRefer.BuscaWhereString;

      vgNUM_REG_AFECT := 0; //SATV4766
end;

Destructor TCrRePrMn.Destroy;
begin
    if Moneda <> nil then
       Moneda.Free;
    //end if
    if TasaRefer <> nil then
       TasaRefer.Free;
    //end if
    inherited;
end;


function TCrRePrMn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelProdMn;
begin
   W:=TWCrRelProdMn.Create(Self);
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

function TCrRePrMn.StpActualizaHorarioCredLinea( peCVE_PRODUCTO_CRE  ,
                                                 peCVE_MONEDA        ,
                                                 peCVE_TASA_IGNORAR  ,
                                                 peH_INI_DISPOS      ,
                                                 peH_FIN_DISPOS      ,
                                                 peH_INI_PAGOS       ,
                                                 peH_FIN_PAGOS       : String;
                                                 var psNUM_REG_AFECT : Integer
                                                ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := True; psNUM_REG_AFECT := 0; 
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRINET.STPACTUALIZAHORARIOCREDLINEA';
       DataBaseName   := Apli.DataBaseName;
       SessionName    := Apli.SessionName;
       Params.CreateParam(ftString  ,'peCVE_PRODUCTO_CRE', ptInput);
       Params.CreateParam(ftString  ,'peCVE_MONEDA'      , ptInput);
       Params.CreateParam(ftString  ,'peCVE_TASA_IGNORAR', ptInput);
       Params.CreateParam(ftString  ,'peH_INI_DISPOS'    , ptInput);
       Params.CreateParam(ftString  ,'peH_FIN_DISPOS'    , ptInput);
       Params.CreateParam(ftString  ,'peH_INI_PAGOS'     , ptInput);
       Params.CreateParam(ftString  ,'peH_FIN_PAGOS'     , ptInput);
       Params.CreateParam(ftInteger ,'psNUM_REG_AFECT'   , ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'      , ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'   , ptOutput);
       // Asigna Valores
       ParamByName('peCVE_PRODUCTO_CRE').AsString := peCVE_PRODUCTO_CRE;
       ParamByName('peCVE_MONEDA'      ).AsString := peCVE_MONEDA;
       ParamByName('peCVE_TASA_IGNORAR').AsString := peCVE_TASA_IGNORAR;
       ParamByName('peH_INI_DISPOS'    ).AsString := peH_INI_DISPOS;
       ParamByName('peH_FIN_DISPOS'    ).AsString := peH_FIN_DISPOS;
       ParamByName('peH_INI_PAGOS'     ).AsString := peH_INI_PAGOS;
       ParamByName('peH_FIN_PAGOS'     ).AsString := peH_FIN_PAGOS;
       ExecProc;

       vlbResult := (ParamByName('psRESULTADO').AsInteger = 0);
       If vlbResult Then
         psNUM_REG_AFECT := ParamByName('psNUM_REG_AFECT').AsInteger
       Else
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

Function TCrRePrMn.InternalPost : Boolean;
var vlNUM_REG_AFECT : Integer;
begin
     If (Modo = moEdit) Or (Modo = moAppend) Then
        Begin
        If (TrimChar(H_INI_DISPOS.AsString, CTRIMCHAR) = '') Then H_INI_DISPOS.AsString := '';
        If (TrimChar(H_FIN_DISPOS.AsString, CTRIMCHAR) = '') Then H_FIN_DISPOS.AsString := '';
        If (TrimChar(H_INI_PAGOS.AsString,  CTRIMCHAR) = '') Then H_INI_PAGOS.AsString  := '';
        If (TrimChar(H_FIN_PAGOS.AsString,  CTRIMCHAR) = '') Then H_FIN_PAGOS.AsString  := '';

        // Si se modifico el horario de Internet, entonces...
        If ((vgH_INI_DISPOS_ORI <> H_INI_DISPOS.AsString) Or
            (vgH_FIN_DISPOS_ORI <> H_FIN_DISPOS.AsString) Or
            (vgH_INI_PAGOS_ORI  <> H_INI_PAGOS.AsString) Or
            (vgH_FIN_PAGOS_ORI  <> H_FIN_PAGOS.AsString)) Then
           Begin
           If StpActualizaHorarioCredLinea(CVE_PRODUCTO_CRE.AsString,
                                           CVE_MONEDA.AsString,
                                           CVE_TASA_REFER.AsString, // No se debe de actualizar la tasa que se esta modificando
                                           H_INI_DISPOS.AsString,
                                           H_FIN_DISPOS.AsString,
                                           H_INI_PAGOS.AsString,
                                           H_FIN_PAGOS.AsString,
                                           vlNUM_REG_AFECT
                                          ) Then
               Begin
               vgNUM_REG_AFECT := vlNUM_REG_AFECT;
               End
            Else
               Begin
               Result := False;
               Exit;
               End;
            End;
        End;
     Result := Inherited InternalPost;
end;

Function TCrRePrMn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRPMn.it','F,S,S');
      Try if Active then begin T.Param(0,CVE_MONEDA.AsString);
                               T.Param(1,CVE_PRODUCTO_CRE.AsString);
                               T.Param(2,CVE_TASA_REFER.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_REL_PROD_MON********************)
(*                                                                              *)
(*  FORMA DE CR_REL_PROD_MON                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_PROD_MON********************)

procedure TWCrRelProdMn.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;
      Objeto.OPERADOR_STASA.Control:=cbOPERADOR_STASA;
      Objeto.SOBRETASA.Control:=edSOBRETASA;
      Objeto.DIAS_AVIS_DISP.Control := edDIAS_AVIS_DISP; // SATV4766 el 08Jun2006
      Objeto.H_INI_DISPOS.Control   := edH_INI_DISPOS;   // SATV4766 el 08Jun2006
      Objeto.H_FIN_DISPOS.Control   := edH_FIN_DISPOS;   // SATV4766 el 08Jun2006
      Objeto.H_INI_PAGOS.Control    := edH_INI_PAGOS;    // SATV4766 el 08Jun2006
      Objeto.H_FIN_PAGOS.Control    := edH_FIN_PAGOS;    // SATV4766 el 08Jun2006

      Objeto.MAX_DIA_AVIS_DIS.Control := edMAX_DIA_AVIS_DIS; // LOLS 07 AGO 2006

      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO_CRE;
      Objeto.Producto.GetParams(Objeto);

      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrRelProdMn.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_TASA_REFER.Control:=nil;
      Objeto.OPERADOR_STASA.Control:=nil;
      Objeto.SOBRETASA.Control:=nil;
      Objeto.DIAS_AVIS_DISP.Control := nil;  // SATV4766 el 08Jun2006
      Objeto.H_INI_DISPOS.Control   := nil;  // SATV4766 el 08Jun2006
      Objeto.H_FIN_DISPOS.Control   := nil;  // SATV4766 el 08Jun2006
      Objeto.H_INI_PAGOS.Control    := nil;  // SATV4766 el 08Jun2006
      Objeto.H_FIN_PAGOS.Control    := nil;  // SATV4766 el 08Jun2006
      Objeto.MAX_DIA_AVIS_DIS.Control := nil;  // LOLS 07 AGO 2006

      Objeto.Producto.DESC_C_PRODUCTO.Control :=nil;
      Objeto.Moneda.Desc_Moneda.Control :=nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;

   //Objeto
end;

procedure TWCrRelProdMn.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelProdMn.InterForma1DespuesNuevo(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.AsString := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;
      edDESC_PRODUCTO_CRE.Text := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      Objeto.SOBRETASA.AsFloat := 0;
      Objeto.TASA_BASE.AsFloat := 0;
      Objeto.OPERADOR_STASA.AsString := '+';
//    edTASA_BASE.Enabled := True;
      Objeto.B_TASA_PREDETER.AsString := 'F';
      edCVE_PRODUCTO_CRE.SetFocus;
      Objeto.DIAS_AVIS_DISP.AsInteger := 0; // SATV4766 el 25 Jul 2006
      Objeto.MAX_DIA_AVIS_DIS.AsInteger := 0; // LOLS 07 AGO 2006
      HabilitaCtrlsOperacionesInternet; // SATV4766 el 04 Jul 2006
end;

procedure TWCrRelProdMn.InterForma1DespuesModificar(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.AsString := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;
//    validaTasaFija(Objeto.CVE_TASA_REFER.AsString,edTASA_BASE);
      edCVE_PRODUCTO_CRE.SetFocus;
      HabilitaCtrlsOperacionesInternet; // SATV4766 el 04 Jul 2006
end;

procedure TWCrRelProdMn.btPRODUCTO_CREDClick(Sender: TObject);
begin
      Objeto.Producto.ShowAll := True;
      if Objeto.Producto.Busca then
      Begin
         Objeto.CVE_PRODUCTO_CRE.AsString := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;
         InterForma1.NextTab(edCVE_PRODUCTO_CRE);
      end;
end;

procedure TWCrRelProdMn.ilPRODUCTOEjecuta(Sender: TObject);
begin
        if Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
           InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;

procedure TWCrRelProdMn.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
        Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelProdMn.btMONEDAClick(Sender: TObject);
begin
        Objeto.Moneda.ShowAll := True;
        if Objeto.Moneda.Busca then
           InterForma1.NextTab(edCVE_MONEDA);
end;

procedure TWCrRelProdMn.ilMONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
        Show := (InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TWCrRelProdMn.ilMONEDAEjecuta(Sender: TObject);
begin
        if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
           InterForma1.NextTab(edCVE_MONEDA);
        //end if
end;

procedure TWCrRelProdMn.InterForma1DespuesCancelar(Sender: TObject);
begin
   edCVE_PRODUCTO_CRE.Text := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;
   edCVE_PRODUCTO_CRE.SetFocus;
end;

procedure TWCrRelProdMn.edCVE_PRODUCTO_CREExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMsg := '';
         vlSalida:= True;
         Objeto.CVE_PRODUCTO_CRE.GetFromControl;
         if Objeto.CVE_PRODUCTO_CRE.AsString = '' then
         Begin
            vlMsg:='Favor de Indicar el Producto de la disposición';
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLSalida,VLMsg,True);
      end;
end;

procedure TWCrRelProdMn.edCVE_MONEDAExit(Sender: TObject);
var  VLSalida   : Boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_MONEDA.GetFromControl;
         vlMsg:= '';
         vlSalida := True;
         if Objeto.CVE_MONEDA.AsString = '' then
         Begin
            vlMsg := 'Favor de Indicar la Moneda';
            VlSalida := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
      end;
end;

procedure TWCrRelProdMn.edCVE_TASA_REFERExit(Sender: TObject);
var     vlSalida :     Boolean;
        vlMsg   :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlSalida := True;
      vlMsg:= '';
      Objeto.CVE_TASA_REFER.GetFromControl;
      If Objeto.CVE_TASA_REFER.AsString = '' then
      Begin
          vlSalida := False;
          vlMsg := 'Favor de indicar la tasa de referencia';
      end;
      InterForma1.ValidaExit(edCVE_TASA_REFER,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrRelProdMn.cbOPERADOR_STASAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbOPERADOR_STASA,True,'',True);
end;

procedure TWCrRelProdMn.edSOBRETASAExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   VLBandera  := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.SOBRETASA.GetFromControl;
      if Objeto.SOBRETASA.AsFloat < 0 then
      Begin
         vlBandera := False;
         vlMesg := 'La sobretasa no debe de ser negativa';
      end;
      InterForma1.ValidaExit(edSOBRETASA,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrRelProdMn.btCVE_TASA_REFERClick(Sender: TObject);
begin
   Objeto.TasaRefer.ShowAll := True;
   if Objeto.TasaRefer.Busca then
      InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;

procedure TWCrRelProdMn.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;

procedure TWCrRelProdMn.ilTASA_REFERCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelProdMn.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end;
end;

// Inicia Modificaciones por SATV4766 el 25Jul2006
procedure TWCrRelProdMn.CopiaDatosOriginales;
begin
  With Objeto Do
    Begin
    vgNUM_REG_AFECT := 0;    
    vgH_INI_DISPOS_ORI := Objeto.H_INI_DISPOS.AsString;
    vgH_FIN_DISPOS_ORI := Objeto.H_FIN_DISPOS.AsString;
    vgH_INI_PAGOS_ORI  := Objeto.H_INI_PAGOS.AsString;
    vgH_FIN_PAGOS_ORI  := Objeto.H_FIN_PAGOS.AsString;
    End;
end;

procedure TWCrRelProdMn.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
   Begin
   BuscaWhereString := 'CR_REL_PROD_MON.CVE_PRODUCTO_CRE =' + SQLStr(Producto.CVE_PRODUCTO_CRE.AsString);
   FilterString := BuscaWhereString;
   If Busca Then
      Begin
      Moneda.FindKey([CVE_MONEDA.AsString]);
      TasaRefer.FindKey([CVE_TASA_REFER.AsString]);
      CopiaDatosOriginales;
      End;
   End;   
end;
// Inicia Modificaciones por SATV4766 el 25Jul2006

procedure TWCrRelProdMn.InterForma1DespuesShow(Sender: TObject);
begin
   if Objeto.CVE_PRODUCTO_CRE.AsString = CNULL then
   Begin
      edCVE_PRODUCTO_CRE.Text := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;
   end;
end;

procedure TWCrRelProdMn.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
  //Verifica que no esistan autorizaciones con la realción Moneda, producto, tasa
  function verfAutorizaciones(pProduto, pMoneda, pTasa : String): Boolean;
  var vlSql   : String;
      vlCount : Integer;
  Begin
      vlsql:= ' select count(*) from cr_contrato ' +
              ' where CVE_PRODUCTO_CRE = ' + SQLStr(pProduto) +
              ' and CVE_MONEDA = ' + pMoneda +
              ' and CVE_TASA_REFER = '+ SQLStr(pTasa);
      GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'count(*)',vlCount,False);
      if vlCount = 0 then  Begin
         Result := True;
      end
      else Begin
         ShowMessage('No se puede eliminar el registro, existen Autorizaciones con esta relación');
         Result:= False;
      end;
  end;
begin
  if verfAutorizaciones(Objeto.CVE_PRODUCTO_CRE.AsString,
                        Objeto.CVE_MONEDA.AsString,
                        Objeto.CVE_TASA_REFER.AsString) then
  Begin
     if verPredeter(Objeto.CVE_PRODUCTO_CRE.AsString,
                        Objeto.CVE_MONEDA.AsString,
                        Objeto.CVE_TASA_REFER.AsString) then
     Begin
        edDESC_PRODUCTO_CRE.Text := CNULL;
        Realizado :=  True;
     end
     else Begin
              ShowMessage('No se puede eliminar el registro, se encuentra como predeterminada');
              Realizado := False;
     end;
  end
  else Realizado := False;

end;

//Verifica Predeterminada
function TWCrRelProdMn.verPredeter(pProduto, pMoneda, pTasa : String): Boolean;
var vlSql   : String;
    vlCount : Integer;
Begin
      vlsql:= ' SELECT COUNT(*) COUNT FROM CR_REL_PROD_MON ' +
              ' where CVE_PRODUCTO_CRE = ' + SQLStr(pProduto) +
              ' and CVE_MONEDA = ' + pMoneda +
              ' and CVE_TASA_REFER = '+ SQLStr(pTasa)+
              ' and B_TASA_PREDETER = ' +SQLStr(CVERDAD);
      GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
      if vlCount = 0 then  Begin
         Result := True;
      end
      else Begin
         Result:= False;
      end;
end;

procedure TWCrRelProdMn.HabilitaCtrlsOperacionesInternet; // SATV4766 el 04 Jul 2006
var vlbHabilita : Boolean;
begin
  vlbHabilita := Objeto.Producto.B_DISP_EN_LINEA.AsString = CVERDAD;
  If vlbHabilita Then edH_INI_DISPOS.Color := clWindow
  Else edH_INI_DISPOS.Color := clBtnFace;
  edH_FIN_DISPOS.Color := edH_INI_DISPOS.Color;
  edH_INI_PAGOS.Color  := edH_INI_DISPOS.Color;
  edH_FIN_PAGOS.Color  := edH_INI_DISPOS.Color;

  edH_INI_DISPOS.TabStop := vlbHabilita;
  edH_FIN_DISPOS.TabStop := edH_INI_DISPOS.TabStop;
  edH_INI_PAGOS.TabStop  := edH_INI_DISPOS.TabStop;
  edH_FIN_PAGOS.TabStop  := edH_INI_DISPOS.TabStop;

  edH_INI_DISPOS.Enabled := vlbHabilita;
  edH_FIN_DISPOS.Enabled := edH_INI_DISPOS.Enabled;
  edH_INI_PAGOS.Enabled  := edH_INI_DISPOS.Enabled;
  edH_FIN_PAGOS.Enabled  := edH_INI_DISPOS.Enabled;

  edH_INI_DISPOS.ReadOnly := Not vlbHabilita;
  edH_FIN_DISPOS.ReadOnly := edH_INI_DISPOS.ReadOnly;
  edH_INI_PAGOS.ReadOnly  := edH_INI_DISPOS.ReadOnly;
  edH_FIN_PAGOS.ReadOnly  := edH_INI_DISPOS.ReadOnly;
end;

procedure TWCrRelProdMn.edDIAS_AVIS_DISPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDIAS_AVIS_DISP,True, '', True);
end;

// VALIDACIÓN DE HORAS
// Inicia Modificación SATV4766 el 15May2006 Credito en Línea
function TCrRePrMn.ValidacionHoras(peHoraIni, peHoraFin : TInterCampo; pestrCaption : String;
                                   pebControlFinal, pebObligatorio : Boolean;
                                   var psMensaje : String) : Boolean;
var VLMesg     :  String;
    VLOut1     :  TDateTime;
begin
  VLMesg     := '';
  peHoraIni.GetFromControl;
  peHoraFin.GetFromControl;
  If (TrimChar(peHoraIni.AsString, CTRIMCHAR) <> '') Then
    Begin
    If Not ValidaFmtHora(peHoraIni.AsString, VLOut1) Then
       VLMesg := 'No es válida la Hora Inicial de  '+pestrCaption+'. Favor de Verificar';
    End;

  If (VLMesg = '') And (pebControlFinal) And (TrimChar(peHoraFin.AsString,CTRIMCHAR) <> '') Then
    Begin
    If Not ValidaFmtHora(peHoraFin.AsString, VLOut1) Then
       VLMesg := 'No es válida la Hora Final de '+pestrCaption+'. Favor de Verificar';
    End;

  If (VLMesg = '') And (pebControlFinal) And
       (((TrimChar(peHoraIni.AsString, CTRIMCHAR) <> '') And (TrimChar(peHoraFin.AsString, CTRIMCHAR) = '') Or
         (TrimChar(peHoraIni.AsString, CTRIMCHAR) = '') And (TrimChar(peHoraFin.AsString, CTRIMCHAR) <> ''))) Then
    Begin
       VLMesg := 'Se deben de indicar la Hora Inicial y Final de '+pestrCaption+'. Favor de Verificar';
    End;

  If ( (VLMesg = '') And (pebControlFinal) And (pebObligatorio) And
       ( (TrimChar(peHoraIni.AsString, CTRIMCHAR) = '') And (TrimChar(peHoraFin.AsString, CTRIMCHAR) = '') )
     ) Then
    Begin
       VLMesg := 'La Hora Inicial y Final de '+pestrCaption+' son indispensables para las operaciones en Línea. Favor de Verificar';
    End

  Else If (pebControlFinal) And
           ((TrimChar(peHoraIni.AsString, CTRIMCHAR) <> '') And (TrimChar(peHoraFin.AsString, CTRIMCHAR) <> '')) Then
    ValidaHoraIniFin(peHoraIni.AsString, peHoraFin.AsString, pestrCaption, VLMesg);
  psMensaje := VLMesg;
  Result := VLMesg = '';
end;

procedure TWCrRelProdMn.edH_INI_DISPOSExit(Sender: TObject);
var VLBandera  :  boolean;
    VLMesg     :  String;
begin
 With Objeto Do
  Begin
  VLMesg    := ''; VLBandera := True;
  If (Modo = moEdit) Or (Modo = moAppend) Then
   VLBandera := ValidacionHoras(H_INI_DISPOS, H_FIN_DISPOS, 'Disposición', False,
                                Producto.B_DISP_EN_LINEA.AsString = CVERDAD, VLMesg);
  InterForma1.ValidaExit(edH_INI_DISPOS, VLBandera, VLMesg, True);
  End;
end;

procedure TWCrRelProdMn.edH_FIN_DISPOSExit(Sender: TObject);
var VLBandera  :  boolean;
    VLMesg     :  String;
begin
 With Objeto Do
  Begin
  VLMesg    := ''; VLBandera := True;
  If (Modo = moEdit) Or (Modo = moAppend) Then
   VLBandera := ValidacionHoras(H_INI_DISPOS, H_FIN_DISPOS, 'Disposición', True,
                                Producto.B_DISP_EN_LINEA.AsString = CVERDAD, VLMesg);
  InterForma1.ValidaExit(edH_FIN_DISPOS, VLBandera, VLMesg, True);
  End;
end;

procedure TWCrRelProdMn.edH_INI_PAGOSExit(Sender: TObject);
var VLBandera  :  boolean;
    VLMesg     :  String;
begin
 With Objeto Do
  Begin
  VLMesg    := ''; VLBandera := True;
  If (Modo = moEdit) Or (Modo = moAppend) Then
   VLBandera := ValidacionHoras(H_INI_PAGOS, H_FIN_PAGOS, 'Pagos y Prepagos', False,
                                Producto.B_DISP_EN_LINEA.AsString  = CVERDAD, VLMesg);
  InterForma1.ValidaExit(edH_INI_PAGOS, VLBandera, VLMesg, True);
  End;
end;

procedure TWCrRelProdMn.edH_FIN_PAGOSExit(Sender: TObject);
var VLBandera  :  boolean;
    VLMesg     :  String;
begin
 With Objeto Do
  Begin
  VLMesg    := ''; VLBandera := True;
  If (Modo = moEdit) Or (Modo = moAppend) Then
   VLBandera := ValidacionHoras(H_INI_PAGOS, H_FIN_PAGOS, 'Pagos y Prepagos', True,
                                Producto.B_DISP_EN_LINEA.AsString = CVERDAD, VLMesg);
  InterForma1.ValidaExit(edH_FIN_PAGOS, VLBandera, VLMesg, True);
  End;
end;

// Termina Modificación SATV4766

procedure TWCrRelProdMn.InterForma1DespuesAceptar(Sender: TObject);
begin
   // Si se actualizo el Horario a más de un registro, entonces...
   With Objeto Do
     Begin
     If (vgNUM_REG_AFECT > 0) Then
       MessageDlg('El horario especificado en las "'+grOperaciones.Caption+'" , fue actualizado en las '+
                  IntToStr(vgNUM_REG_AFECT + 1) + // Se adiciona la TASA que esta siendo modifcada
                  ' Tasas de Referencia '+
                  'que tienen producto "'+CVE_PRODUCTO_CRE.AsString+'" y moneda "'+CVE_MONEDA.AsString+'"' ,
                  mtInformation, [mbOk], 0);
     CopiaDatosOriginales;
     End;
end;

//<LOLS 07 AGO 2006. VALIDA MAXIMO NUMERO DE DIAS AVISO DE DISPOSICION>
procedure TWCrRelProdMn.edMAX_DIA_AVIS_DISExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edMAX_DIA_AVIS_DIS,True, '', True);
end;
//</LOLS>


end.
