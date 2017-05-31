// Sistema         : Clase de CR_GA_PP_REG_HISTO
// Fecha de Inicio : 16/04/2015
// Función forma   : Clase de CR_GA_PP_REG_HISTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntCrGaPpRH;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit,
IntCrLiGPPH, //Histórico Líneas Garantía Periodo de Carga
IntCRBCGPPHi //Bitácora de Cambios Histórico Garantía Primeras Pérdidas
;

Type
 TCrGaPpRH= class;

  TWCrGaPpRegHisto=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_SOLICITUD : TLabel;
    edID_SOLICITUD : TEdit;
    lbPERIODO : TLabel;
    lbTX_DESC_PORTAF : TLabel; 
    edTX_DESC_PORTAF : TEdit;
    lbMONTO_GARANTIA : TLabel;
    lbPCT_GARANTIA : TLabel;
    lbF_ULT_CARGA_R04 : TLabel; 
    edF_ULT_CARGA_R04 : TEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
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
    btnLigarLineaHist: TBitBtn;
    btnBitCambiosHist: TBitBtn;

    rgSIT_REG_GARANTIA: TRadioGroup;
    rgCVE_DET_MONTO: TRadioGroup;
    edCVE_BCO_GTIA: TEdit;
    btnCVE_BCO_GTIA: TBitBtn;
    edTX_DESC_BCO_GARANTIA: TEdit;
    lbCVE_BCO_GTIA: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    lbIMP_RESP_TOT: TLabel;
    edIMP_RESP_TOT: TEdit;
    lbIMP_VAL_GTIA: TLabel;
    edIMP_VAL_GTIA: TEdit;
    edMONTO_GARANTIA: TInterEdit;
    edPCT_GARANTIA: TInterEdit;
    btnID_SOLICITUD: TBitBtn;
    edTX_DESC_PORTAF_PADRE: TEdit;
    edPERIODO: TMaskEdit;    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnCVE_BCO_GTIAClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure rgCVE_DET_MONTOClick(Sender: TObject);
    procedure btnID_SOLICITUDClick(Sender: TObject);
    procedure btnLigarLineaHistClick(Sender: TObject);
    procedure btnBitCambiosHistClick(Sender: TObject);
    private 
    { Private declarations }

      Function ObtDesBcoGtia(vlCVE_ENT_CNBV: String): String;
      Function ObtDesSolGPP(IdSolicitud: String): String;

    public
    { Public declarations } 
    Objeto : TCrGaPpRH;
end;
 TCrGaPpRH= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }

        vgIdSolicitud            : String;
        ParamCre                 : TParamCre;
        LiGPPH                   : TCrLiGPPH;
        BCGPPHi                  : TCRBCGPPHi;
        vgrgCVE_DET_MONTO        : Integer;
        vgedMONTO_GARANTIA       : String;
        vgedPCT_GARANTIA         : String;

        ID_SOLICITUD             : TInterCampo;
        PERIODO                  : TInterCampo;
        CVE_BCO_GTIA             : TInterCampo;
        TX_DESC_PORTAF           : TInterCampo;
        CVE_DET_MONTO            : TInterCampo;
        MONTO_GARANTIA           : TInterCampo;
        PCT_GARANTIA             : TInterCampo;
        F_ULT_CARGA_R04          : TInterCampo;
        SIT_REG_GARANTIA         : TInterCampo;
        IMP_RESP_TOT             : TInterCampo;
        IMP_VAL_GTIA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

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


constructor TCrGaPpRH.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      PERIODO :=CreaCampo('PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                PERIODO.Caption:='Periodo';
      CVE_BCO_GTIA :=CreaCampo('CVE_BCO_GTIA',ftString,tsNinguno,tsNinguno,True);
                CVE_BCO_GTIA.Caption:='Clave de Bco Gtia';
      TX_DESC_PORTAF :=CreaCampo('TX_DESC_PORTAF',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_PORTAF.Caption:='Descripción Portaf';
      MONTO_GARANTIA :=CreaCampo('MONTO_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                MONTO_GARANTIA.Caption:='Monto Garantia';
      PCT_GARANTIA :=CreaCampo('PCT_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                PCT_GARANTIA.Caption:='Pct Garantia';
      F_ULT_CARGA_R04 :=CreaCampo('F_ULT_CARGA_R04',ftDateTime,tsNinguno,tsNinguno,True);
                F_ULT_CARGA_R04.Caption:='Fecha Última Carga R04';
      IMP_RESP_TOT :=CreaCampo('IMP_RESP_TOT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_RESP_TOT.Caption:='Imp Resp Tot';
      IMP_VAL_GTIA :=CreaCampo('IMP_VAL_GTIA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_VAL_GTIA.Caption:='Imp Val Gtia';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      SIT_REG_GARANTIA :=CreaCampo('SIT_REG_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      With SIT_REG_GARANTIA do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('IN');
      end;
      SIT_REG_GARANTIA.Caption:='Situación';

      CVE_DET_MONTO :=CreaCampo('CVE_DET_MONTO',ftString,tsNinguno,tsNinguno,True);
      With CVE_DET_MONTO do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('MO');
        ComboLista.Add('1'); ComboDatos.Add('PO');
      end;
      CVE_DET_MONTO.Caption:='Forma determina Monto';

      FKeyFields.Add('ID_SOLICITUD');
      FKeyFields.Add('PERIODO');

      TableName := 'CR_GA_PP_REG_HISTO'; 
      UseQuery := True; 
      HelpFile := 'IntCrGaPpRH.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGaPpRH.Destroy;
begin inherited;
end;


function TCrGaPpRH.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGaPpRegHisto;
begin
   W:=TWCrGaPpRegHisto.Create(Self);
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


Function TCrGaPpRH.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICRGPRH.IT','F,F');
      T.WhereString := 'ID_SOLICITUD = ' + vgIdSolicitud;
      Try if Active then begin T.Param(0,ID_SOLICITUD.AsString); 
                               T.Param(1,PERIODO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrGaPpRH.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_GA_PP_REG_HISTO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_PP_REG_HISTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_PP_REG_HISTO********************)

procedure TWCrGaPpRegHisto.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_SOLICITUD.Control:=edID_SOLICITUD;
      Objeto.PERIODO.Control:=edPERIODO;
      Objeto.CVE_BCO_GTIA.Control:=edCVE_BCO_GTIA;
      Objeto.TX_DESC_PORTAF.Control:=edTX_DESC_PORTAF;
      Objeto.CVE_DET_MONTO.Control:=rgCVE_DET_MONTO;
      Objeto.MONTO_GARANTIA.Control:=edMONTO_GARANTIA;
      Objeto.PCT_GARANTIA.Control:=edPCT_GARANTIA;
      Objeto.F_ULT_CARGA_R04.Control:=edF_ULT_CARGA_R04;
      Objeto.SIT_REG_GARANTIA.Control:=rgSIT_REG_GARANTIA;
      Objeto.IMP_RESP_TOT.Control:=edIMP_RESP_TOT;
      Objeto.IMP_VAL_GTIA.Control:=edIMP_VAL_GTIA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrGaPpRegHisto.FormDestroy(Sender: TObject);
begin
      Objeto.ID_SOLICITUD.Control:=nil;
      Objeto.PERIODO.Control:=nil;
      Objeto.CVE_BCO_GTIA.Control:=nil;
      Objeto.TX_DESC_PORTAF.Control:=nil;
      Objeto.CVE_DET_MONTO.Control:=nil;
      Objeto.MONTO_GARANTIA.Control:=nil;
      Objeto.PCT_GARANTIA.Control:=nil;
      Objeto.F_ULT_CARGA_R04.Control:=nil;
      Objeto.SIT_REG_GARANTIA.Control:=nil;
      Objeto.IMP_RESP_TOT.Control:=nil;
      Objeto.IMP_VAL_GTIA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWCrGaPpRegHisto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGaPpRegHisto.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
    rgSIT_REG_GARANTIA.ItemIndex := 0;
    rgCVE_DET_MONTO.ItemIndex    := 0;
    edTX_DESC_BCO_GARANTIA.Text  := '';
end;

procedure TWCrGaPpRegHisto.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
    //guarda valores previos
    objeto.vgrgCVE_DET_MONTO        := rgCVE_DET_MONTO.ItemIndex;
    objeto.vgedMONTO_GARANTIA       := edMONTO_GARANTIA.Text;
    objeto.vgedPCT_GARANTIA         := edPCT_GARANTIA.Text;
//    Inherited;
end;

//procedure TWCrGaPpRegHisto.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrGaPpRegHisto.btnCVE_BCO_GTIAClick(Sender: TObject);
var
  T: TInterFindit;
begin
    T := Objeto.CreaBuscador('BCOGTIAPP.IT','F');
    try
      //T.WhereString := 'ID_Acreditado = ' + Objeto.ID_ACREDITADO.AsString;
      T.ShowAll     := True;
      if T.Execute then
      begin
        edCVE_BCO_GTIA.Text  := T.DameCampo (0);
        edTX_DESC_BCO_GARANTIA.Text := ObtDesBcoGtia(edCVE_BCO_GTIA.Text);
      end;
    finally
      T.Free;
    end;
end;

procedure TWCrGaPpRegHisto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if IsNewData then
  begin
      //No calcula Folio, lo asigna de los que se crean en IntCrGaPpReg
      Objeto.CVE_USU_ALTA.AsString:=Objeto.Apli.Usuario;
      Objeto.F_ALTA.AsDateTime:= Objeto.Apli.SysDateTime;
  end
  else
  begin
      Objeto.CVE_USU_MODIFICA.AsString:=Objeto.Apli.Usuario;
      Objeto.F_MODIFICA.AsDateTime:= Objeto.Apli.SysDateTime;

      //Blanquea campos cuando cambia valor Monto o Porcentaje
      //Monto Fijo
      if ( objeto.vgrgCVE_DET_MONTO = rgCVE_DET_MONTO.ItemIndex )
      and ( rgCVE_DET_MONTO.ItemIndex = 0 )then
      begin
          if ( objeto.vgedMONTO_GARANTIA <> edMONTO_GARANTIA.Text ) then
          begin
                  edIMP_RESP_TOT.Text      := '';
                  edIMP_VAL_GTIA.Text      := '';
          end;
      end;

      //Porcentaje Gtia
      if ( objeto.vgrgCVE_DET_MONTO = rgCVE_DET_MONTO.ItemIndex )
      and ( rgCVE_DET_MONTO.ItemIndex = 1 )then
      begin
          if ( objeto.vgedPCT_GARANTIA <> edPCT_GARANTIA.Text ) then
          begin
                  edIMP_RESP_TOT.Text      := '';
                  edIMP_VAL_GTIA.Text      := '';
          end;
      end;
  end;
end;

procedure TWCrGaPpRegHisto.InterForma1Buscar(Sender: TObject);
begin
    Objeto.InternalBusca;
    edTX_DESC_BCO_GARANTIA.Text := ObtDesBcoGtia(edCVE_BCO_GTIA.Text);
    edTX_DESC_PORTAF_PADRE.Text := ObtDesSolGPP(edID_SOLICITUD.Text);
end;

procedure TWCrGaPpRegHisto.rgCVE_DET_MONTOClick(Sender: TObject);
begin
    case rgCVE_DET_MONTO.ItemIndex of
        0: begin
             //MO
             edMONTO_GARANTIA.Enabled := True;
             edPCT_GARANTIA.Enabled   := False;
             edPCT_GARANTIA.Text      := '';
             edIMP_RESP_TOT.Text      := '';
             edIMP_VAL_GTIA.Text      := '';
           end;
        1: begin
             //PO
             edPCT_GARANTIA.Enabled   := True;
             edMONTO_GARANTIA.Enabled := False;
             edMONTO_GARANTIA.Text    := '';
           end;
    end;
end;

function TWCrGaPpRegHisto.ObtDesBcoGtia(vlCVE_ENT_CNBV: String): String;
var
    strsql        : String;
    vlDescBcoGtia : String;
begin
    strsql :=

             ' SELECT ' + #13 +
             ' CVE_VALOR_ADIC AS CVE_ENT_CNBV, ' + #13 +
             ' SUBSTR(DESC_CLAVE,0,62) AS DESC_ENT_BI, ' + #13 +
             ' CVE_CLAVE AS CVE_ENT_BI ' + #13 +
             ' FROM ' + #13 +
             ' CR_CON_CAT_DATA ' + #13 +
             ' WHERE ' + #13 +
             '       CVE_CON_GPO_CAT = ''CAT_INS_FND_CNBV'' ' + #13 +
             '   AND CVE_VALOR_ADIC  = ' + #39 + vlCVE_ENT_CNBV + #39;


    GetSQLStr(strsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'DESC_ENT_BI', vlDescBcoGtia, False);

    ObtDesBcoGtia := vlDescBcoGtia;
end;


procedure TWCrGaPpRegHisto.btnID_SOLICITUDClick(Sender: TObject);
var
  T: TInterFindit;
begin
    T := Objeto.CreaBuscador('ICRGAPR.IT','F');
    try
      T.WhereString := 'ID_SOLICITUD = ' + Objeto.vgIdSolicitud;
      T.ShowAll     := True;
      if T.Execute then
      begin
        edID_SOLICITUD.Text         := T.DameCampo (0);
        edTX_DESC_PORTAF_PADRE.Text := ObtDesSolGPP(edID_SOLICITUD.Text);
      end;
    finally
      T.Free;
    end;
end;

function TWCrGaPpRegHisto.ObtDesSolGPP(IdSolicitud: String): String;
var
    strsql                 : String;
    vlTX_DESC_PORTAF_PADRE : String;
begin
    strsql :=

             ' SELECT ' + #13 +
             ' TX_DESC_PORTAF ' + #13 +
             ' FROM ' + #13 +
             ' CR_GA_PP_REGISTRO ' + #13 +
             ' WHERE ' + #13 +
             '       ID_SOLICITUD = ' + Objeto.vgIdSolicitud + #13;

    GetSQLStr(strsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TX_DESC_PORTAF', vlTX_DESC_PORTAF_PADRE, False);

    ObtDesSolGPP := vlTX_DESC_PORTAF_PADRE;
end;


procedure TWCrGaPpRegHisto.btnLigarLineaHistClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRGAPPRH_LIGLI',True,True) then
   Begin
       if Objeto.Active then
       Begin
           {$WARNINGS OFF}
           Objeto.LiGPPH := TCrLiGPPH.Create(Self);
           {$WARNINGS ON}
           try
              Objeto.LiGPPH.Apli:=Objeto.Apli;
              Objeto.LiGPPH.ParamCre:=Objeto.ParamCre;
              Objeto.LiGPPH.vgIdSolicitud:= Objeto.ID_SOLICITUD.AsString;
              Objeto.LiGPPH.vgPeriodo:= Objeto.PERIODO.AsString;
  //            Objeto.LinGPP.BuscaWhereString := ' ID_SOLICITUD = ' + Objeto.ID_SOLICITUD.AsString;
  //            Objeto.LinGPP.FilterString := Objeto.LinGPP.BuscaWhereString;
              Objeto.LiGPPH.Catalogo;
           finally
                 if Objeto.LiGPPH <> nil then
                    Objeto.LiGPPH.Free;
                 //end if
           end;
       end
       else ShowMessage('No existe registro Activo');
   end;
end;

procedure TWCrGaPpRegHisto.btnBitCambiosHistClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRGAPPRH_BITCA',True,True) then
   Begin
     if Objeto.Active then
     Begin
         {$WARNINGS OFF}
         Objeto.BCGPPHi := TCRBCGPPHi.Create(Self);
         {$WARNINGS ON}
         try
            Objeto.BCGPPHi.Apli:=Objeto.Apli;
            Objeto.BCGPPHi.ParamCre:=Objeto.ParamCre;
            Objeto.BCGPPHi.vgIdSolicitud:= Objeto.ID_SOLICITUD.AsString;
            Objeto.BCGPPHi.vgPeriodo:= Objeto.PERIODO.AsString;
            Objeto.BCGPPHi.Catalogo;
         finally
               if Objeto.BCGPPHi <> nil then
                  Objeto.BCGPPHi.Free;
               //end if
         end;
     end
     else ShowMessage('No existe registro Activo');
   end;
end;

end.
