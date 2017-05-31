// Sistema         : Clase de CR_INF_ADIC_TASA
// Fecha de Inicio : 24/11/2004
// Función forma   : Clase de CR_INF_ADIC_TASA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
//                   27 OCT 2005. SE AGREGAN PARAMETROS PARA TASAS DE GARANTIAS
Unit IntCrInAdTa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,
//UNIDADES ADICONALES
IntParamCre,
IntGenCre,
IntCrTRedond,
IntLinkit,
IntTasIndFin,
IntBasicCred;

CONST
   C_SUP = 'VS';
   C_INF = 'VI';
   C_CER = 'VC';
   C_MSG = '¿Desea actualizar la tasa de acuerdo a los datos adicionales de tasas?' +
           coCRLF + coCRLF + 'Presione "NO" si configuró únicamente los datos de tasa de garantía';
type
  TCrInAdTa = class;

  TWCrInfAdicTasa = class(TForm)
    InterForma1  : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    chB_REDONDEO : TCheckBox;
    chB_TASA_MAX_MIN : TCheckBox;
    chB_TIPO_MES : TCheckBox;
    lbTASA_MIXIMA : TLabel;
    IedTASA_MAXIMA: TInterEdit;
    lbTASA_MINIMA : TLabel;
    IedTASA_MINIMA : TInterEdit;
    rgCVE_TIPO_ANUAL : TRadioGroup;
    rgCVE_TIPO_MES : TRadioGroup;
    edID_CONTRATO : TEdit;
    edDESC_PRODUCTO: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_TIPO_RED: TEdit;
    lbCVE_TIPO_RED: TLabel;
    rgNIVEL_REDONDEO: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btTIPO_REDONDEO: TBitBtn;
    edDESC_TIPO_REDONDEO: TEdit;
    edCVE_PRODUCTO: TEdit;
    GroupBox3: TGroupBox;
    ilTIPO_REDONDEO: TInterLinkit;
    MsgPanel: TPanel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    rgCVE_TASA_GTIA: TGroupBox;
    lbOPERADOR_STASA: TLabel;
    lbCVE_TASA_GTIA: TLabel;
    edOPE_STASA_GTIA: TEdit;
    edSOBRETASA_GTIA: TInterEdit;
    edDESC_TASA_REFER: TEdit;
    btTASA_REFER: TBitBtn;
    Label9: TLabel;
    ilCVE_TASA_GTIA: TInterLinkit;
    edCVE_TASA_GTIA: TEdit;
    lbDENOMINADOR: TLabel;
    IedDigitosTasa: TInterEdit;
    chB_ANIO_BIS: TCheckBox;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label32: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure chB_REDONDEOClick(Sender: TObject);
    procedure btTIPO_REDONDEOClick(Sender: TObject);
    procedure ilTIPO_REDONDEOEjecuta(Sender: TObject);
    procedure edCVE_TIPO_REDExit(Sender: TObject);
    procedure rgNIVEL_REDONDEOExit(Sender: TObject);
    procedure chB_TASA_MAX_MINClick(Sender: TObject);
    procedure IedTASA_MAXIMAExit(Sender: TObject);
    procedure IedTASA_MINIMAExit(Sender: TObject);
    procedure chB_TASA_MAX_MINExit(Sender: TObject);
    procedure chB_REDONDEOExit(Sender: TObject);
    procedure chB_TIPO_MESClick(Sender: TObject);
    procedure rgCVE_TIPO_ANUALExit(Sender: TObject);
    procedure rgCVE_TIPO_MESExit(Sender: TObject);
    procedure chB_TIPO_MESExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilCVE_TASA_GTIAEjecuta(Sender: TObject);
    procedure edOPE_STASA_GTIAExit(Sender: TObject);
    procedure edSOBRETASA_GTIAExit(Sender: TObject);
    procedure edCVE_TASA_GTIAExit(Sender: TObject);
    procedure IedDigitosTasaExit(Sender: TObject);
    procedure chB_ANIO_BISExit(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrInAdTa;

end;
 TCrInAdTa= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        vgCredito                : String;
        vgContrato               : String;
        vgproducto               : String;
        vgDescProducto           : String;
        vgTasaCredito            : Double;

        ID_CREDITO               : TInterCampo;
        B_REDONDEO               : TInterCampo;
        B_TASA_MAX_MIN           : TInterCampo;
        B_TIPO_MES               : TInterCampo;
        CVE_TIPO_RED             : TInterCampo;
        DENOMINADOR              : TInterCampo;


        NIVEL_REDONDEO           : TInterCampo;
        TASA_MIXIMA              : TInterCampo;
        TASA_MINIMA              : TInterCampo;
        CVE_TIPO_ANUAL           : TInterCampo;
        CVE_TIPO_MES             : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        //
        CVE_TASA_GTIA            : TInterCampo;
        OPE_STASA_GTIA           : TInterCampo;
        SOBRETASA_GTIA           : TInterCampo;

        DIGITOS_TASA             : TInterCampo;   //RABA NOV 2015 FACTORAJE PURO. Para indicar los dijitos a redondear la tasa
        B_ANIO_BIS               : TInterCampo;   //ASOR FEB 2016 FACTORAJE PURO. Para calcular el año bisiesto.
        //
        //CLASES ADICIONALES
        ParamCre                 : TParamCre;
        BasicCred                : TBasicCred;
        TipoRedondeo             : TCrTRedond;
        TasaRefer                : TTasIndFin;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    StpActualizaTasa(pIdCredito: Integer; pTasa: Double): Boolean;
      published
      end;



implementation

{$R *.DFM}


constructor TCrInAdTa.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Id Disposición';
      B_REDONDEO :=CreaCampo('B_REDONDEO',ftString,tsNinguno,tsNinguno,True);
                B_REDONDEO.Caption:='Redondeo';
      B_TASA_MAX_MIN :=CreaCampo('B_TASA_MAX_MIN',ftString,tsNinguno,tsNinguno,True);
                B_TASA_MAX_MIN.Caption:='Aplica Tasas Maximas y/o Mínimas';
      B_TIPO_MES :=CreaCampo('B_TIPO_MES',ftString,tsNinguno,tsNinguno,True);
                B_TIPO_MES.Caption:='Aplica Tipo Año / Mes';
      CVE_TIPO_RED :=CreaCampo('CVE_TIPO_RED',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_RED.Caption:='Tipo Redondeo';

      NIVEL_REDONDEO :=CreaCampo('NIVEL_REDONDEO',ftString,tsNinguno,tsNinguno,True);
      with NIVEL_REDONDEO do
      Begin  Size := 2;
             UseCombo := True;
             ComboLista.Add('0');       ComboDatos.Add(C_SUP);
             ComboLista.Add('1');       ComboDatos.Add(C_INF);
             ComboLista.Add('2');       ComboDatos.Add(C_CER);
      end;
                NIVEL_REDONDEO.Caption:='Nivel Redondeo';
      TASA_MIXIMA :=CreaCampo('TASA_MIXIMA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_MIXIMA.Caption:='Tasa Maxima';
      TASA_MINIMA :=CreaCampo('TASA_MINIMA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_MINIMA.Caption:='Tasa Minima';
      CVE_TIPO_ANUAL :=CreaCampo('CVE_TIPO_ANUAL',ftString,tsNinguno,tsNinguno,True);
      with CVE_TIPO_ANUAL do
      Begin  Size := 2;
             UseCombo := True;
             ComboLista.Add('0');       ComboDatos.Add('CO');
             ComboLista.Add('1');       ComboDatos.Add('CA');
      end;
                CVE_TIPO_ANUAL.Caption:='Tipo Año';
      CVE_TIPO_MES :=CreaCampo('CVE_TIPO_MES',ftString,tsNinguno,tsNinguno,True);
      with CVE_TIPO_MES do
      Begin  Size := 2;
             UseCombo := True;
             ComboLista.Add('0');       ComboDatos.Add('CO');
             ComboLista.Add('1');       ComboDatos.Add('CA');
      end;
      CVE_TIPO_MES.Caption:='Tipo Mes';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      //
      CVE_TASA_GTIA  := CreaCampo('CVE_TASA_GTIA',  ftString,  tsNinguno, tsNinguno, True );
      OPE_STASA_GTIA := CreaCampo('OPE_STASA_GTIA', ftString,  tsNinguno, tsNinguno, True );
      SOBRETASA_GTIA := CreaCampo('SOBRETASA_GTIA', ftString,  tsNinguno, tsNinguno, True );
      //
      CVE_TASA_GTIA.Caption  := 'Cve Tasa Gtia';
      OPE_STASA_GTIA.Caption := 'Ope STasa Gtia';
      SOBRETASA_GTIA.Caption := 'SobreTasa Gtia';
      //
      DIGITOS_TASA := CreaCampo('DIGITOS_TASA', ftInteger, tsNinguno, tsNinguno, True);
      DIGITOS_TASA.Caption := 'Digitos redondeo tasa de crédito';

      // ASOR FEB 2016 FACTORAJE PURO.  Para calcular el año bisiesto.
      B_ANIO_BIS :=CreaCampo('B_ANIO_BIS',ftString,tsNinguno,tsNinguno,True);
      B_ANIO_BIS.Caption:='Aplica año bisiesto';


      //
      FKeyFields.Add('ID_CREDITO');
      TableName := 'CR_INF_ADIC_TASA';
      UseQuery := True;
      HelpFile := 'IntCrInAdTa.Hlp';
      ShowMenuReporte:=True;

      TipoRedondeo := TCrTRedond.Create(Self);
      TipoRedondeo.MasterSource := Self;
      TipoRedondeo.FieldByName('CVE_TIPO_RED').MasterField := 'CVE_TIPO_RED';


      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_GTIA';
      TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer.FilterString := TasaRefer.BuscaWhereString;


end;

Destructor TCrInAdTa.Destroy;
begin
   if TipoRedondeo <> nil then
      TipoRedondeo.Free;
   //end if;
    if TasaRefer <> nil then
       TasaRefer.Free;
   //end if
   inherited;
end;


function TCrInAdTa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrInfAdicTasa;
begin
   W:=TWCrInfAdicTasa.Create(Self);
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


Function TCrInAdTa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRINFAT.IT','F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

{--------------------------  ACTUALIZA TASA CREDITO  ----------------------------}
function TCrInAdTa.StpActualizaTasa(pIdCredito: Integer; pTasa: Double): Boolean;
var   sptActualizaTasa : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptActualizaTasa := TStoredProc.Create(Self);
     with sptActualizaTasa do
     begin
        //Inicia el SPT
        sptActualizaTasa.DatabaseName:= Apli.DatabaseName;
        sptActualizaTasa.SessionName:= Apli.SessionName;
        sptActualizaTasa.StoredProcName:= 'PKGCRCOMUN.STPACTUALIZATASACRED';
        Params.Clear;
        Params.CreateParam(ftInteger,'PECREDITO',ptInput);
        Params.CreateParam(ftFloat,'PETASA',ptInput);
        Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peCredito').AsInteger  := pIdCredito;
        ParamByName('peTasa').AsFloat  := pTasa;
        ParamByName('peCveUsuMod').AsString := Apli.Usuario;
        ParamByName('peBCommit').AsString   := CVERDAD;
        ExecProc;

        if (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
        end;
        //end if;
     end;
   finally
      sptActualizaTasa.Free;
   end;
   StpActualizaTasa := vlResultado;
end;


(*********************************************** FORMA CR_INF_ADIC_TASA********************)
(*                                                                              *)
(*  FORMA DE CR_INF_ADIC_TASA                                                            *)
(*                                                                              *)
(*********************************************** FORMA CR_INF_ADIC_TASA********************)

procedure TWCrInfAdicTasa.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.B_REDONDEO.Control:=chB_REDONDEO;
      Objeto.B_TASA_MAX_MIN.Control:=chB_TASA_MAX_MIN;
      Objeto.B_TIPO_MES.Control:=chB_TIPO_MES;
      Objeto.CVE_TIPO_RED.Control:=edCVE_TIPO_RED;

      // RABA NOV 2015 FACTORAJE PURO. Para guardar los dígitos a redondear
      Objeto.DIGITOS_TASA.Control := IedDigitosTasa;

      // ASOR FEB 2016 FACTORAJE PURO. Para calcular año bisiesto.
      Objeto.B_ANIO_BIS.Control:=chB_ANIO_BIS;

      Objeto.NIVEL_REDONDEO.Control:=rgNIVEL_REDONDEO;
      Objeto.TASA_MIXIMA.Control:=IedTASA_MAXIMA;
      Objeto.TASA_MINIMA.Control:=IedTASA_MINIMA;
      Objeto.CVE_TIPO_ANUAL.Control:=rgCVE_TIPO_ANUAL;
      Objeto.CVE_TIPO_MES.Control:=rgCVE_TIPO_MES;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      //
      Objeto.CVE_TASA_GTIA.Control  := edCVE_TASA_GTIA;
      Objeto.OPE_STASA_GTIA.Control := edOPE_STASA_GTIA;
      Objeto.SOBRETASA_GTIA.Control := edSOBRETASA_GTIA;
      //
      Objeto.TipoRedondeo.CVE_TIPO_RED.Control  := edCVE_TIPO_RED;
      Objeto.TipoRedondeo.DESC_TIPO_RED.Control := edDESC_TIPO_REDONDEO;
      Objeto.TipoRedondeo.GetParams(Objeto);


      Objeto.TasaRefer.CVE_TASA_INDICAD.Control:= edCVE_TASA_GTIA;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);

      edID_CREDITO.Text := Objeto.BasicCred.ID_CREDITO.AsString;
      edID_CONTRATO.Text := Objeto.BasicCred.ID_CONTRATO.AsString;
      edCVE_PRODUCTO.Text := Objeto.BasicCred.CVE_PRODUCTO.AsString;
      edDESC_PRODUCTO.Text := Objeto.BasicCred.DESC_L_PRODUCTO.AsString;
      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrInfAdicTasa.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.B_REDONDEO.Control:=nil;
      Objeto.B_TASA_MAX_MIN.Control:=nil;
      Objeto.B_TIPO_MES.Control:=nil;
      Objeto.CVE_TIPO_RED.Control:=nil;
      Objeto.DIGITOS_TASA.Control := nil;  //RABA NOV 2015 FACTORAJE PURO
      Objeto.B_ANIO_BIS.Control := nil;    //ASOR FEB 2016 FACTORAJE PURO
      Objeto.NIVEL_REDONDEO.Control:=nil;
      Objeto.TASA_MIXIMA.Control:=nil;
      Objeto.TASA_MINIMA.Control:=nil;
      Objeto.CVE_TIPO_ANUAL.Control:=nil;
      Objeto.CVE_TIPO_MES.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.CVE_TASA_GTIA.Control  := nil;
      Objeto.OPE_STASA_GTIA.Control := nil;
      Objeto.SOBRETASA_GTIA.Control := nil;

      Objeto.TipoRedondeo.DESC_TIPO_RED.Control := nil;
end;

procedure TWCrInfAdicTasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrInfAdicTasa.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.ID_CREDITO.AsString := Objeto.vgCredito;
   chB_REDONDEO.Checked := True;
   rgNIVEL_REDONDEO.ItemIndex := 0;
   chB_TASA_MAX_MIN.Checked := True;
   IedTASA_MAXIMA.Text := '0';
   IedTASA_MINIMA.Text := '0';
   chB_TIPO_MES.Checked := True;
   rgCVE_TIPO_ANUAL.ItemIndex := 0;
   rgCVE_TIPO_MES.ItemIndex := 1;   
   chB_REDONDEO.SetFocus;
   chB_ANIO_BIS.Checked:= True;
   chB_REDONDEOClick(Sender);
   chB_TASA_MAX_MINClick(Sender);

end;

procedure TWCrInfAdicTasa.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   chB_REDONDEO.SetFocus;
   chB_REDONDEOClick(Sender);
   chB_TASA_MAX_MINClick(Sender);
end;

procedure TWCrInfAdicTasa.chB_REDONDEOClick(Sender: TObject);
begin
   if chB_REDONDEO.Checked then
   Begin
      edCVE_TIPO_RED.Enabled := True;
      edCVE_TIPO_RED.Color := clWindow;
      btTIPO_REDONDEO.Enabled := True;
      rgNIVEL_REDONDEO.Enabled := True;
   end
   else
   Begin
      edCVE_TIPO_RED.Enabled := False;
      edCVE_TIPO_RED.Color := clBtnFace;
      btTIPO_REDONDEO.Enabled := False;
      rgNIVEL_REDONDEO.Enabled := False;
   end;
end;

procedure TWCrInfAdicTasa.btTIPO_REDONDEOClick(Sender: TObject);
begin
   Objeto.TipoRedondeo.ShowAll := True;
   if Objeto.TipoRedondeo.Busca then
       InterForma1.NextTab(edCVE_TIPO_RED);
end;

procedure TWCrInfAdicTasa.ilTIPO_REDONDEOEjecuta(Sender: TObject);
begin
   if Objeto.TipoRedondeo.FindKey([ilTIPO_REDONDEO.Buffer]) then
      InterForma1.NextTab(edCVE_TIPO_RED);
end;

procedure TWCrInfAdicTasa.edCVE_TIPO_REDExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   if chB_REDONDEO.Checked then
   Begin
     vlSalida := True;
     vlMsg    := '';
     if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
     Begin
        Objeto.CVE_TIPO_RED.GetFromControl;
        if Objeto.CVE_TIPO_RED.AsString = '' then
        Begin
            vlSalida := False;
            vlmsg := 'Favor de indicar el tipo de redondeo';
        end;
        InterForma1.ValidaExit(edCVE_TIPO_RED,vlSalida,vlMsg,True);
     end;
   end;
end;

procedure TWCrInfAdicTasa.rgNIVEL_REDONDEOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgNIVEL_REDONDEO,True,'',True);
end;

procedure TWCrInfAdicTasa.chB_TASA_MAX_MINClick(Sender: TObject);
begin
   if chB_TASA_MAX_MIN.Checked then
   Begin
      IedTASA_MAXIMA.Enabled := True;
      IedTASA_MAXIMA.Color := clWindow;
      IedTASA_MINIMA.Enabled := True;
      IedTASA_MINIMA.Color := clWindow;
   end
   else
   Begin
      IedTASA_MAXIMA.Enabled := False;
      IedTASA_MAXIMA.Color := clBtnFace;
      IedTASA_MINIMA.Enabled := False;
      IedTASA_MINIMA.Color := clBtnFace;
   end;
end;

procedure TWCrInfAdicTasa.IedTASA_MAXIMAExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.TASA_MIXIMA.GetFromControl;
      if Objeto.TASA_MIXIMA.AsFloat < 0 then
      Begin
          vlSalida := False;
          vlmsg := 'El valor de la tasa no puede ser negativo';
      end;
      InterForma1.ValidaExit(IedTASA_MAXIMA,vlSalida,vlMsg,True);
      
   end;
end;

procedure TWCrInfAdicTasa.IedTASA_MINIMAExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.TASA_MINIMA.GetFromControl;
      if Objeto.TASA_MINIMA.AsFloat < 0 then
      Begin
          vlSalida := False;
          vlmsg := 'El valor de la tasa no puede ser negativo';
      end;

      if ( Objeto.TASA_MIXIMA.AsFloat = 0) AND ( Objeto.TASA_MINIMA.AsFloat = 0 ) then
      Begin
          vlSalida := False;
          vlmsg := 'Se debe de indicar la tasa máxima o la mínima';
      end;
      InterForma1.ValidaExit(IedTASA_MINIMA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrInfAdicTasa.chB_TASA_MAX_MINExit(Sender: TObject);
begin
   if chB_TASA_MAX_MIN.Checked then
   Begin
      IedTASA_MAXIMA.Enabled := True;
      IedTASA_MAXIMA.Color := clWindow;
      IedTASA_MINIMA.Enabled := True;
      IedTASA_MINIMA.Color := clWindow;
   end
   else
   Begin
      IedTASA_MAXIMA.Enabled := False;
      IedTASA_MAXIMA.Color := clBtnFace;
      IedTASA_MINIMA.Enabled := False;
      IedTASA_MINIMA.Color := clBtnFace;
   end;
   InterForma1.ValidaExit(chB_TASA_MAX_MIN,True,'',True);
end;

procedure TWCrInfAdicTasa.chB_REDONDEOExit(Sender: TObject);
begin
   if chB_REDONDEO.Checked then
   Begin
      edCVE_TIPO_RED.Enabled := True;
      edCVE_TIPO_RED.Color := clWindow;
      btTIPO_REDONDEO.Enabled := True;
      rgNIVEL_REDONDEO.Enabled := True;
   end
   else
   Begin
      edCVE_TIPO_RED.Enabled := False;
      edCVE_TIPO_RED.Color := clBtnFace;
      btTIPO_REDONDEO.Enabled := False;
      rgNIVEL_REDONDEO.Enabled := False;
   end;
   InterForma1.ValidaExit(chB_REDONDEO,True,'',True);
end;

procedure TWCrInfAdicTasa.chB_TIPO_MESClick(Sender: TObject);
begin
   if chB_TIPO_MES.Checked then
   Begin
      rgCVE_TIPO_ANUAL.Enabled := True;
      rgCVE_TIPO_MES.Enabled := True;
   end
   else
   Begin
      rgCVE_TIPO_ANUAL.Enabled := False;
      rgCVE_TIPO_MES.Enabled := False;
   end;
end;

procedure TWCrInfAdicTasa.rgCVE_TIPO_ANUALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_ANUAL,True,'',True);
end;

procedure TWCrInfAdicTasa.rgCVE_TIPO_MESExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_MES,True,'',True);
end;

procedure TWCrInfAdicTasa.chB_TIPO_MESExit(Sender: TObject);
begin
   if chB_TIPO_MES.Checked then
   Begin
      rgCVE_TIPO_ANUAL.Enabled := True;
      rgCVE_TIPO_MES.Enabled := True;
   end
   else
   Begin
      rgCVE_TIPO_ANUAL.Enabled := False;
      rgCVE_TIPO_MES.Enabled := False;
   end;
   InterForma1.ValidaExit(chB_TIPO_MES,True,'',True);
end;

procedure TWCrInfAdicTasa.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else if InterForma1.CanEdit then
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrInfAdicTasa.InterForma1DespuesAceptar(Sender: TObject);
begin
      if MessageDlg(C_MSG, mtInformation, [mbOk, mbNo, mbIgnore], 0) = mrOK then
      BEGIN
         if Objeto.StpActualizaTasa(Objeto.ID_CREDITO.AsInteger, Objeto.vgTasaCredito) then
            ShowMessage('Se ha actualizado la tasa Actualiza Tasa')
         else ShowMessage('Verifica Actualización de Tasa');
      END;
end;


procedure TWCrInfAdicTasa.edCVE_TASA_GTIAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_TASA_GTIA,True,'',True);
end;

procedure TWCrInfAdicTasa.btTASA_REFERClick(Sender: TObject);
begin
  Objeto.TasaRefer.ShowAll := True;
  if Objeto.TasaRefer.Busca then
     InterForma1.ValidaExit(btTASA_REFER,True,'',True);
  //end if
end;

procedure TWCrInfAdicTasa.ilCVE_TASA_GTIAEjecuta(Sender: TObject);
begin
  if Objeto.TasaRefer.FindKey([ilCVE_TASA_GTIA.Buffer]) then
     InterForma1.ValidaExit(btTASA_REFER,True,'',True);
  //end if
end;

procedure TWCrInfAdicTasa.edOPE_STASA_GTIAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edOPE_STASA_GTIA,True,'',True);
end;

procedure TWCrInfAdicTasa.edSOBRETASA_GTIAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edSOBRETASA_GTIA,True,'',True);
end;


procedure TWCrInfAdicTasa.IedDigitosTasaExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
    vlIvalor : integer;
begin
   vlSalida := True;
   vlMsg    := '';
   if IedDigitosTasa.Text <> '' then
     begin
          if (StrToInt(IedDigitosTasa.Text) < 0) or (StrToInt(IedDigitosTasa.Text) > 10) then
            begin
                 vlSalida:= False;
                 vlMsg:= 'El número de digitos no puede ser menor a 0 ni mayor a 10';
                 InterForma1.ValidaExit(IedDigitosTasa,vlSalida,vlMsg,True);
            end
          else
              InterForma1.ValidaExit(IedDigitosTasa,True,'',True);
     end
   else
     InterForma1.ValidaExit(IedDigitosTasa,True,'',True);
end;

procedure TWCrInfAdicTasa.chB_ANIO_BISExit(Sender: TObject);
begin
     InterForma1.ValidaExit(chB_ANIO_BIS,True,'',True);
end;

end.
