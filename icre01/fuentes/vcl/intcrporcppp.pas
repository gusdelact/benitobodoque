// Sistema         : Clase de CR_PPO_PORCENTAJE
// Fecha de Inicio : 22/02/2012
// Función forma   : Clase de CR_PPO_PORCENTAJE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera.
// Fecha           : Febrero 2012
// Comentarios     : FJR Febrero 2013 Pantalla de captura para dos tiempos: Mensual y Diario...
Unit IntCrPorcPPP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, ComObj,

IntParamCre, InterEdit, IntLinkit, IntGenCre,

// clases adicionales
//IntCrCto;
IntCrCredito, IntCrMovPPP, Grids;

Const
  CoACTIVO = 'AC';
  CoCANCELADO = 'CA';
  CoVERDAD ='V';
  coFALSO = 'F' ;
  coDIARIO = 'DI';
  coMENSUAL = 'ME';

Type
 TCrPorcPPP= class;

  TWCrPorcPPP=Class(TForm)
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
    ilID_CREDITO: TInterLinkit;
    PageControl1: TPageControl;
    tbsAlta: TTabSheet;
    lblID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    bbCredito: TBitBtn;
    edTITNombre: TEdit;
    lblPORC_CLIENTE: TLabel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbUSUA_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    lbF_MODIF: TLabel;
    edF_MODIF: TEdit;
    lbUSUA_MODIF: TLabel;
    edCVE_USUA_MODIF: TEdit;
    tbsMasiva: TTabSheet;
    bbMasivo: TBitBtn;
    Label6: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    BtnImportar: TButton;
    sgDatos: TStringGrid;
    Memo1: TMemo;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    iedPORC_EST_PREV_RGO_CRED: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure bbCreditoClick(Sender: TObject);
    procedure edF_ALTAExit(Sender: TObject);
    procedure edCVE_USUA_ALTAExit(Sender: TObject);
    procedure edF_MODIFExit(Sender: TObject);
    procedure edCVE_USUA_MODIFExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure bbMasivoClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    function ImportaPorcPPP(Accion, Cred: integer; Porc: Real; Fecha: TDateTime): Boolean ;
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure iedPORC_EST_PREV_RGO_CREDExit(Sender: TObject);
    private
    { Private declarations }
       procedure CalculaPorcentaje ;
       procedure NuevoIdPorcentaje(Credito, TipoPorc: String);
    public
    { Public declarations }
    Objeto : TCrPorcPPP;
end;
 TCrPorcPPP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO                    : TInterCampo;
        ID_PORCENTAJE                 : TInterCampo;
        PORC_EST_PREV_RGO_CR          : TInterCampo;
        CVE_TIPO_PORCENTAJE           : TInterCampo;
        SIT_PORCENTAJE                : TInterCampo;
        CVE_USU_ALTA                  : TInterCampo;
        F_ALTA                        : TInterCampo;
        CVE_USU_MODIFICA              : TInterCampo;
        F_MODIFICA                    : TInterCampo;
        //Clases Adiconales

        ParamCre                      : TParamCre;
        Credito                       : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

var vgSumaPorc: Currency ;
    vgSalida, CambioPred : Boolean ;
    vgMensaje, vgCveTipoPorc: String ;
    Cont: integer ;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPorcPPP.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO:=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Id de credito';
      ID_PORCENTAJE:=CreaCampo('ID_PORCENTAJE', ftInteger, tsNinguno, tsNinguno, True) ;
                ID_PORCENTAJE.Caption:= 'Id Porcentaje';
      CVE_TIPO_PORCENTAJE:=CreaCampo('CVE_TIPO_PORCENTAJE', ftString, tsNinguno, tsNinguno, True);
      With CVE_TIPO_PORCENTAJE do
      Begin
         Size := 2;
         UseCombo := True;
         ComboLista.Add('DIARIO'); ComboDatos.Add(CoDIARIO);
         ComboLista.Add('MENSUAL'); ComboDatos.Add(CoMENSUAL);
      end;
      CVE_TIPO_PORCENTAJE.Caption:= 'Cve Tipo Porcentaje';
      PORC_EST_PREV_RGO_CR:=CreaCampo('PORC_EST_PREV_RGO_CR', ftFloat, tsNinguno, tsNinguno, True);
                PORC_EST_PREV_RGO_CR.Caption:= 'Porcentaje correspondiente al cliente' ;
      SIT_PORCENTAJE := CreaCampo('SIT_PORCENTAJE', ftString, tsNinguno, tsNinguno, True) ;
      SIT_PORCENTAJE.Caption:='Situacion del Porcentaje';

      F_ALTA:= CreaCampo('F_ALTA', ftDateTime, tsNinguno, tsNinguno, True);
      F_ALTA.Caption:= 'Fecha Alta';
      CVE_USU_ALTA:= CreaCampo('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
      CVE_USU_ALTA.Caption:= 'Clave de Usu Alta';
      F_MODIFICA:= CreaCampo('F_MODIFICA', ftDateTime, tsNinguno, tsNinguno, True);
      F_MODIFICA.Caption:= 'Fecha Modifica';
      CVE_USU_MODIFICA:= CreaCampo('CVE_USU_MODIFICA', ftString, tsNinguno, tsNinguno, True);
      CVE_USU_MODIFICA.Caption:= 'Clave de Usu Modifica';

      Credito:= TCrCredito.Create(Self);
      Credito.MasterSource:= Self;

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_PORCENTAJE');
      FKeyFields.Add('CVE_TIPO_PORCENTAJE');

      TableName := 'CR_PPO_PORCENTAJE';
      UseQuery := True;
      HelpFile := 'IntPorcPPP.Hlp';
end;

Destructor TCrPorcPPP.Destroy;
begin
   if Credito <> nil then
      Credito.Free;

   inherited;
end;


function TCrPorcPPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPorcPPP;
begin
   W:=TWCrPorcPPP.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowBtnModificar:= False;
      W.InterForma1.ShowBtnEliminar:= False;
      // FJR 12.02.2013 Cambio visual para distinguir ambos momentos de la misma pantalla...
      If CVE_TIPO_PORCENTAJE.AsString = coDIARIO then
         begin
           W.Caption:= 'Porcentajes DIARIOS de Estimación Preventiva por Riesgo Crediticio';
           W.tbsAlta.Caption:= 'Alta de porcentajes DIARIOS';
           W.tbsMasiva.Caption:= 'Alta masiva % DIARIOS';
         end;
      If CVE_TIPO_PORCENTAJE.AsString = coMENSUAL then
         begin
           W.Caption:= 'Porcentajes MENSUALES de Estimación Preventiva por Riesgo Crediticio';
           W.tbsAlta.Caption:= 'Alta de porcentajes MENSUALES';
           W.tbsMasiva.Caption:= 'Alta masiva % MENSUALES';

         end;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrPorcPPP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPorcPPP.it','F,F,S');
      T.WhereString:= ' CR_PPO_PORCENTAJE.CVE_TIPO_PORCENTAJE = '''+CVE_TIPO_PORCENTAJE.AsString+''' ';
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,ID_PORCENTAJE.AsString);
                               T.Param(2,CVE_TIPO_PORCENTAJE.AsString);
                               end;
          if T.Execute then begin
            InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
            Credito.FindKey([T.DameCampo(0)]);
            end;
      finally  T.Free;
      end;
end;

(**********************************FORMA CR_PPO_PORCENTAJE********************************)
(*                                                                                       *)
(*  FORMA DE CR_PPO_PORCENTAJE                                                           *)
(*                                                                                       *)
(*********************************FORMA CR_PPO_PORCENTAJE*********************************)
Function TWCrPorcPPP.ImportaPorcPPP(Accion, Cred: integer; Porc: Real; Fecha: TDateTime): Boolean ;
var STPCargaMasiva: TStoredProc ;
begin
   try
     STPCargaMasiva := TStoredProc.Create(Self);
     with STPCargaMasiva do
     begin
        //Inicia el SPT
        STPCargaMasiva.DatabaseName:= Objeto.Apli.DatabaseName;
        STPCargaMasiva.SessionName:= Objeto.Apli.SessionName;
        STPCargaMasiva.StoredProcName:= 'PKGCRPPO.STPCARGAMASIVAPPO';
        Params.Clear;
        Params.CreateParam(ftFloat,    'peAccion', ptInput);
        Params.CreateParam(ftFloat,    'peIdCredito', ptInput);
        Params.CreateParam(ftDate,     'peFecha', ptInput);
        Params.CreateParam(ftString,   'peTipoPorc', ptInput);
        Params.CreateParam(ftFloat,    'peImpBruto', ptInput);
        Params.CreateParam(ftFloat,    'peImpIva', ptInput);
        Params.CreateParam(ftFloat,    'peImpComisArr', ptInput);
        Params.CreateParam(ftString,    'peBCommit', ptInput);
        Params.CreateParam(ftString,    'peCveUsuAlta', ptInput);
        Params.CreateParam(ftFloat,   'PSResultado',  ptOutput);
        Params.CreateParam(ftString,  'PSTxResultado',ptOutput);
        Prepare;
        ParamByName('peAccion').AsFloat := Accion;
        ParamByName('peIdCredito').AsFloat := Cred;
        ParamByName('peFecha').AsDate := Objeto.Apli.DameFechaEmpresa ;
        parambyName('peTipoPorc').AsString:= Objeto.CVE_TIPO_PORCENTAJE.AsString;
        ParamByName('peImpBruto').AsFloat := Porc;
        ParamByName('peImpIva').AsFloat := 0;
        ParamByName('peImpComisArr').AsFloat := 0;
        ParamByName('peBCommit').AsString := 'V';
        ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
        ExecProc;

        if (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           ImportaPorcPPP:=false;
           {ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString ); }
        end
        else
           ImportaPorcPPP:=true;
     end;
   finally
      STPCargaMasiva.Free;
   end;
end ;

procedure TWCrPorcPPP.FormShow(Sender: TObject);
begin
      //Datos del panel de la parte inferior de la forma
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.PORC_EST_PREV_RGO_CR.Control:=iedPORC_EST_PREV_RGO_CRED;
      Objeto.F_ALTA.Control:= edF_ALTA ;
      Objeto.CVE_USU_ALTA.Control:= edCVE_USUA_ALTA ;
      Objeto.F_MODIFICA.Control:= edF_MODIF ;
      Objeto.CVE_USU_MODIFICA.Control:= edCVE_USUA_MODIF ;

      Objeto.Credito.ID_CREDITO.Control:= edID_CREDITO;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= edTITNombre;

end;

procedure TWCrPorcPPP.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;

      Objeto.PORC_EST_PREV_RGO_CR.Control:=nil;
      Objeto.F_ALTA.Control:= nil ;
      Objeto.CVE_USU_ALTA.Control:= nil ;
      Objeto.F_MODIFICA.Control:= nil ;
      Objeto.CVE_USU_MODIFICA.Control:= nil ;

      Objeto.Credito.ID_CREDITO.Control:= nil;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
end;

procedure TWCrPorcPPP.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrPorcPPP.edID_CREDITOExit(Sender: TObject);
begin
  If ((Objeto.Modo=moAppend)or (Objeto.Modo=moEdit)) then
     begin
    Objeto.ID_CREDITO.GetFromControl;
    Objeto.CVE_TIPO_PORCENTAJE.GetFromControl;
    If (Objeto.ID_CREDITO.AsString <> '') and (Objeto.CVE_TIPO_PORCENTAJE.AsString <> '') then
      NuevoIdPorcentaje(Objeto.ID_CREDITO.AsString, Objeto.CVE_TIPO_PORCENTAJE.AsString);
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
    end;
end;

procedure TWCrPorcPPP.CalculaPorcentaje ;
begin
   Objeto.PORC_EST_PREV_RGO_CR.GetFromControl ;
   vgSumaPorc:= Objeto.PORC_EST_PREV_RGO_CR.AsFloat;
   vgSalida:=  (not (vgSumaPorc >100)) and (not(vgSumaPorc <0)) ;
   If not vgSalida then
      begin
        ShowMessage('Porcentaje no debe ser mayor a 100% ni menor a 0%.') ;
        {posible colocar porcentajes en ceros}
      end ;
end ;

procedure TWCrPorcPPP.NuevoIdPorcentaje(Credito, TipoPorc: String) ;
var SQLText: String;
    id: Integer;
begin
   SQLText:= 'SELECT NVL(MAX(ID_PORCENTAJE), 0) + 1 AS NUEVO FROM CR_PPO_PORCENTAJE '+
             ' WHERE ID_CREDITO = '+Credito+' AND CVE_TIPO_PORCENTAJE = '''+TipoPorc+''' ';
   GetSQLInt(SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'NUEVO', id, False) ;
   Objeto.ID_PORCENTAJE.AsInteger:= id;
end;

procedure TWCrPorcPPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPorcPPP.InterForma1DespuesNuevo(Sender: TObject);
begin
   Cont := 0 ;
   Objeto.F_ALTA.AsDateTime:= Now; //Objeto.Apli.DameFechaEmpresaDia('D000') ; ;
   Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario ;

   Objeto.CVE_TIPO_PORCENTAJE.AsString:= vgCveTipoPorc;
   Objeto.SIT_PORCENTAJE.AsString:= 'AC';

   Objeto.PORC_EST_PREV_RGO_CR.AsFloat:= 0 ;
   CambioPred:= False ;
   edID_CREDITO.Setfocus ;
end;

procedure TWCrPorcPPP.InterForma1DespuesModificar(Sender: TObject);
begin
  Cont:= 0 ;
  Objeto.Credito.FindKey([Objeto.ID_CREDITO.AsInteger]);

  Objeto.F_MODIFICA.AsDateTime:= Date;
  Objeto.CVE_USU_MODIFICA.AsString:= Objeto.Apli.Usuario;
  CambioPred:= False ;
end;

procedure TWCrPorcPPP.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var Msg, sSQL: String ;
begin
   Msg:= '' ;

   Objeto.SIT_PORCENTAJE.GetFromControl;
   Objeto.CVE_TIPO_PORCENTAJE.GetFromControl;
   If ((Objeto.Modo=moAppend) or (Objeto.Modo=moEdit)) and (Objeto.SIT_PORCENTAJE.AsString= 'AC') then
      begin
         Objeto.ID_CREDITO.GetFromControl;
         Objeto.ID_PORCENTAJE.GetFromControl ;
          sSQL:= 'SELECT COUNT(*) AS VALOR FROM CR_PPO_PORCENTAJE  '+
         'WHERE ID_CREDITO = '+Objeto.ID_CREDITO.AsString+' '+
         'AND CVE_TIPO_PORCENTAJE = '''+Objeto.CVE_TIPO_PORCENTAJE.AsString+''' AND SIT_PORCENTAJE = ''AC''  '+
         'AND ID_PORCENTAJE <> '+Objeto.ID_PORCENTAJE.AsString+' ' ;
         GetSQLInt(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'VALOR', Cont, True) ;
         If (Cont>0) then
            Msg:= 'Existe(n) '+IntToStr(Cont)+' porcentaje(s) activo(s) para este credito.'+#13+
                  'Si continua, dicho(s) porcentaje(s) se inactivara(n).'+#13+#13 ;

      end ;

   //nuevo
   If IsNewData then
   begin
      if MessageDlg(Msg+'¿Desea aceptar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
           Realizado := True
      end
      else
           Realizado := False;
   end
   else
   begin
      if MessageDlg(Msg+'¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
           Realizado := True
      end
      else
           Realizado := False;
   end ;

   CambioPred:= Realizado ;
end;

procedure TWCrPorcPPP.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   vgCveTipoPorc:=Objeto.CVE_TIPO_PORCENTAJE.AsString;
end;

procedure TWCrPorcPPP.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
    If Objeto.CVE_TIPO_PORCENTAJE.AsString = coDIARIO then
       begin
         Control.Canvas.TextOut(Rect.left+5,Rect.top+3,PageControl1.Pages[tabindex].Caption);
       end;

    If Objeto.CVE_TIPO_PORCENTAJE.AsString = coMENSUAL then
       begin
         Control.Canvas.TextOut(Rect.left+5,Rect.top+3,PageControl1.Pages[tabindex].Caption);
       end;
end;

procedure TWCrPorcPPP.ilID_CREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilID_CREDITO.Buffer]) then
      InterForma1.NextTab(edID_CREDITO);
end;

procedure TWCrPorcPPP.bbCreditoClick(Sender: TObject);
var Cadena : String;
begin
   Cadena:= ' SELECT DISTINCT CR_CREDITO.ID_CREDITO  '+
            ' FROM CR_CREDITO , CR_PPO_PREMIO  '+
            ' WHERE CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
   Objeto.Credito.BuscaWhereString:= ' CR_CREDITO.ID_CREDITO IN ( '+Cadena+')  ' ;
   Objeto.Credito.FilterString:= Objeto.Credito.BuscaWhereString ;
   Objeto.Credito.ShowAll := True;
   If Objeto.Credito.Busca Then Begin
      if ((Objeto.Modo=moAppend)) then
         NuevoIdPorcentaje(Objeto.Credito.ID_CREDITO.AsString, Objeto.CVE_TIPO_PORCENTAJE.AsString);
      InterForma1.NextTab(bbCREDITO);
   End;
end;

procedure TWCrPorcPPP.edF_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_ALTA,True,'',True);
end;

procedure TWCrPorcPPP.edCVE_USUA_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_USUA_ALTA,True,'',True);
end;

procedure TWCrPorcPPP.edF_MODIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_MODIF,True,'',True);
end;

procedure TWCrPorcPPP.edCVE_USUA_MODIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_USUA_MODIF,True,'',True);
end;

procedure TWCrPorcPPP.InterForma1DespuesAceptar(Sender: TObject);
var t: String ;
begin
  If CambioPred then
     begin
       t:= ' UPDATE CR_PPO_PORCENTAJE SET SIT_PORCENTAJE = '''+CoCANCELADO+''', '+
           '                           CVE_USU_MODIFICA = '''+Objeto.Apli.Usuario+''', '+
           '                           F_MODIFICA = SYSDATE '+
           ' WHERE ID_CREDITO = '+Objeto.ID_CREDITO.AsString+
           ' AND CVE_TIPO_PORCENTAJE = '''+Objeto.CVE_TIPO_PORCENTAJE.AsString+''' '+
           ' AND ID_PORCENTAJE <> '+Objeto.ID_PORCENTAJE.AsString+' AND SIT_PORCENTAJE = ''AC''  ' ;

       If Cont > 0 then
          begin
             RunSQL(t, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False ) ;
          end ;
     end ;
end;

procedure TWCrPorcPPP.sbExcelClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRPORCPPP_PROC',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     If OpenDialog1.Execute then
        begin
           edNbrArch.Text:= OpenDialog1.FileName ;
           Memo1.lines.Clear;
           Memo1.Lines.Add('Paso 1: Archivo asignado correctamente: '+Trim(edNbrArch.Text)) ;
           Memo1.Lines.Add('');
           BtnImportar.Visible := true ;
        end ;
  end;
end;

procedure TWCrPorcPPP.BtnImportarClick(Sender: TObject);
var Excel: Variant ;
    i, s, n: Integer ;
    Cred, Porc, Fecha: String ;
begin
if Objeto.ValidaAccesoEsp('TCRPORCPPP_IMPT',True,True) then  // JFOF 14/03/2013 FUNCION DE SEGURIDADES
  begin
      Excel:= CreateOleObject('Excel.Application') ;
      Excel.WorkBooks.Open(edNbrArch.Text) ;

      Memo1.Lines.Clear ;
      sgDatos.RowCount:= 1;
      sgDatos.Cells[0, 0]:= 'Credito';
      sgDatos.Cells[1, 0]:= 'Porcentaje';
      //sgDatos.Cells[2, 0]:= 'FECHA';

      Cred := ''; Porc:= ''; Fecha:= '';

      Try
        i:= 0 ; s:=0; n:=0;
        Memo1.Lines.Add('Paso 2: Validación de importación: ');
        Memo1.Lines.Add('');
        Repeat
           Inc(i) ;
           sgDatos.RowCount:= i+n;
           Cred:= Trim(Excel.Cells[i+1, 1].Value) ;
           If Cred = '' then
              Break ;
           Porc:= Trim(Excel.Cells[i+1, 2].Value) ;
           Fecha:= Trim(Excel.Cells[i+1, 3].Value) ;
           If (StrToFloat(Porc) <0) or (StrToFloat(Porc) >100) then
              begin
                Memo1.Lines.Add('');
                Memo1.Lines.Add(Cred+', '+Porc+', '''+Fecha+''' no incluido! ') ;
                Inc(n);
                Continue;
              end
           else
              begin
                sgDatos.Cells[0, i+n]:= Cred;
                sgDatos.Cells[1, i+n]:= Porc;
                //sgDatos.Cells[2, i+n]:= Fecha;
                Inc(s);
              end ;
        Until Cred = '' ;

        sgDatos.FixedRows:=1;
        Excel.WorkBooks.Close ;
        Excel.Quit;
        Memo1.Lines.Add('');
        Memo1.Lines.Add(' Lectura y carga desde plantilla realizada.');
        Memo1.Lines.Add(' Total de lecturas : '+IntToStr(s+n)+' , Correctas : '+IntToStr(s)+ ' , Incorrectas : '+IntToStr(n));
//        ShowMessage('Lectura y carga desde plantilla realizada.') ;
        bbMasivo.Visible:= true ;
      Except
        Excel.WorkBooks.Close ;
        Excel.Quit;
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Problema de lectura de plantilla!. Ninguna lectura hecha.');
//        ShowMessage('Problema de lectura de plantilla.') ;
      end ;
  end;
end;

procedure TWCrPorcPPP.bbMasivoClick(Sender: TObject);
var       j, s, n: Integer;
begin
if Objeto.ValidaAccesoEsp('TCRPORCPPP_PROC',True,True) then // JFOF 14/03/2013 FUNCION DE SEGURIDADES
  begin
    s:=0; n:=0;
    Try
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Paso 3: Validación de procesamiento: ');
        For j:= 1 to sgDatos.RowCount-1 do
            begin
               if not ImportaPorcPPP(1, StrToInt(sgDatos.Cells[0, j]), StrToFloat(TrimChar(sgDatos.Cells[1, j], '$%,')), StrToDate(FormatDateTime('dd/mm/yyyy',StrToDate('11/12/2012'))) ) then //StrToDate(FormatDateTime('dd/mm/yyyy',StrToDate(sgDatos.Cells[2, j]))) ) then
                  begin
                      Memo1.Lines.Add(sgDatos.Cells[0, j]+', '+sgDatos.Cells[1, j]+', '''+sgDatos.Cells[2, j]+''' no procesado! ') ;
                      Inc(n);
                  end
               else
                  Inc(s);
            end ;
        Memo1.Lines.Add('');
        Memo1.Lines.Add('');
        Memo1.Lines.Add(' PROCESAMIENTO COMPLETADO. Ver incidencias para más información. ');
        Memo1.Lines.Add(' Total de porcentajes a importar : '+IntToStr(s+n)+' , Correctos : '+IntToStr(s)+ ' , Incorrectos : '+IntToStr(n));
        ShowMessage('Procesamiento completado. ');
    Except
        Memo1.Lines.Add('');
        Memo1.Lines.Add('');
        Memo1.Lines.Add(' Problema de procesamiento!. Ninguna importacion hecha.');
        ShowMessage('Problema de procesamiento!. Ninguna importacion hecha.');
    End;

    bbMasivo.Visible := false;
    BtnImportar.visible := false;
  end;
end;


procedure TWCrPorcPPP.iedPORC_EST_PREV_RGO_CREDExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg, sSQL    : String;
    Cont : Integer;
begin
   vlSalida := True ;
   vlMsg := '' ;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend))
       and ((Objeto.ID_CREDITO.AsString <> '') and (Objeto.CVE_TIPO_PORCENTAJE.AsString <> ''))  then
   begin
      CalculaPorcentaje;
   end ;   

   vlMsg:= vgMensaje ;
   vlSalida:= vgSalida ;
   InterForma1.ValidaExit(iedPORC_EST_PREV_RGO_CRED,vlSalida,vlMsg,True);
end;

end.
