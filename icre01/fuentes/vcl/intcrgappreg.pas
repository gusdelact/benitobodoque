// Sistema         : Clase de CR_GA_PP_REGISTRO
// Fecha de Inicio : 10/03/2015
// Función forma   : Clase de CR_GA_PP_REGISTRO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntCrGaPpReg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//Unidades Adicionales
IntParamCre, InterEdit,
IntCrLinGPP, //Líneas Garantía Primeras Pérdidas
IntCRBitCGPP, //Bitácora de Cambios Garantía Primeras Pérdidas
IntCrGaPpRH //Histórico Registro Garantía Periodo de Carga
;

Type
 TCrGaPpReg= class; 

  TWCrGaPpRegistro=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_SOLICITUD : TLabel; 
    edID_SOLICITUD : TEdit;
    lbPCT_GARANTIA : TLabel;
    lbCVE_BCO_GTIA : TLabel; 
    edCVE_BCO_GTIA : TEdit;
    lbTX_DESC_PORTAF : TLabel; 
    edTX_DESC_PORTAF : TEdit;
    rgSIT_REG_GARANTIA: TRadioGroup;
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
    btnLigarLinea: TBitBtn;
    btnBitCambios: TBitBtn;
    btnHistoRegGPC: TBitBtn;
    btnCVE_BCO_GTIA: TBitBtn;
    edTX_DESC_BCO_GARANTIA: TEdit;
    edPCT_GARANTIA: TInterEdit;
    rgCVE_DET_MONTO: TRadioGroup;
    Label2: TLabel;
    edMONTO_GARANTIA: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnCVE_BCO_GTIAClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure rgCVE_DET_MONTOClick(Sender: TObject);
    procedure btnLigarLineaClick(Sender: TObject);
    procedure btnBitCambiosClick(Sender: TObject);
    procedure btnHistoRegGPCClick(Sender: TObject);
    private 
    { Private declarations }
      Function ObtFolio(pCveFolio : String; pMsg : String): Integer;
      Function ObtDesBcoGtia(vlCVE_ENT_CNBV: String): String;
    public
    { Public declarations } 
    Objeto : TCrGaPpReg;
end; 
 TCrGaPpReg= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ID_SOLICITUD             : TInterCampo;
        PCT_GARANTIA             : TInterCampo;
        CVE_BCO_GTIA             : TInterCampo;
        TX_DESC_PORTAF           : TInterCampo;
        SIT_REG_GARANTIA         : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        CVE_DET_MONTO            : TInterCampo;
        MONTO_GARANTIA           : TInterCampo;


        ParamCre            : TParamCre;
        LinGPP              : TCrLinGPP;
        BitCGPP             : TCRBitCGPP;
        GaPpRH              : TCrGaPpRH;

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


constructor TCrGaPpReg.Create( AOwner : TComponent ); 
begin Inherited;
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      PCT_GARANTIA :=CreaCampo('PCT_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                PCT_GARANTIA.Caption:='Pct Garantia';
      CVE_BCO_GTIA :=CreaCampo('CVE_BCO_GTIA',ftString,tsNinguno,tsNinguno,True);
                CVE_BCO_GTIA.Caption:='Clave de Bco Gtia';
      TX_DESC_PORTAF :=CreaCampo('TX_DESC_PORTAF',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_PORTAF.Caption:='Descripción Portaf';
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

      MONTO_GARANTIA :=CreaCampo('MONTO_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                MONTO_GARANTIA.Caption:='Monto Garantia';

      FKeyFields.Add('ID_SOLICITUD');

      TableName := 'CR_GA_PP_REGISTRO';
      UseQuery := True;
      HelpFile := 'IntCrGaPpReg.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGaPpReg.Destroy;
begin inherited;
end;


function TCrGaPpReg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGaPpRegistro;
begin
   W:=TWCrGaPpRegistro.Create(Self);
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


Function TCrGaPpReg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRGAPR.IT','F');
      Try if Active then begin T.Param(0,ID_SOLICITUD.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);

      finally  T.Free;
      end;
end;

function TCrGaPpReg.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_GA_PP_REGISTRO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_PP_REGISTRO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_PP_REGISTRO********************)

procedure TWCrGaPpRegistro.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_SOLICITUD.Control:=edID_SOLICITUD;
      Objeto.PCT_GARANTIA.Control:=edPCT_GARANTIA;
      Objeto.CVE_BCO_GTIA.Control:=edCVE_BCO_GTIA;
      Objeto.TX_DESC_PORTAF.Control:=edTX_DESC_PORTAF;
      Objeto.SIT_REG_GARANTIA.Control:=rgSIT_REG_GARANTIA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Objeto.CVE_DET_MONTO.Control:=rgCVE_DET_MONTO;
      Objeto.MONTO_GARANTIA.Control:=edMONTO_GARANTIA;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrGaPpRegistro.FormDestroy(Sender: TObject);
begin
      Objeto.ID_SOLICITUD.Control:=nil;
      Objeto.PCT_GARANTIA.Control:=nil;
      Objeto.CVE_BCO_GTIA.Control:=nil;
      Objeto.TX_DESC_PORTAF.Control:=nil;
      Objeto.SIT_REG_GARANTIA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;

      Objeto.CVE_DET_MONTO.Control:=nil;
      Objeto.MONTO_GARANTIA.Control:=nil;
   //Objeto
end;

procedure TWCrGaPpRegistro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGaPpRegistro.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
    rgSIT_REG_GARANTIA.ItemIndex := 0;
    rgCVE_DET_MONTO.ItemIndex    := 0;
    edTX_DESC_BCO_GARANTIA.Text  := '';
end;

procedure TWCrGaPpRegistro.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrGaPpRegistro.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrGaPpRegistro.btnCVE_BCO_GTIAClick(Sender: TObject);
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


Function TWCrGaPpRegistro.ObtFolio(pCveFolio : String; pMsg : String): Integer;
Var
   STPObtFolios : TStoredProc;
   vlFolio     : Integer;
Begin
   vlFolio := 0;
   STPObtFolios := TStoredProc.Create(Nil);
   Try
      With STPObtFolios Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTENFOLIO';

         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
         Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
         Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Params.CreateParam(ftFloat,'RESULT',ptResult);
         ParamByName('PEIDEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
         ParamByName('PECVEFolio').AsString := pCveFolio;
         ParamByName('PEBCommit').AsString := 'V';

         ExecProc;

         If (ParamByName('PSResultado').AsInteger = 0) Then Begin
            vlFolio := ParamByName('Result').AsInteger;
         End Else
            ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg +
            IntToStr(ParamByName('PSResultado').AsInteger));
      End;
   Finally
      STPObtFolios.Free;
   End;
   ObtFolio:= vlFolio;
End;

procedure TWCrGaPpRegistro.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if IsNewData then
  begin
      Objeto.ID_SOLICITUD.AsInteger:= ObtFolio('CRGAR','ID SOLICITUD: ');
      Objeto.CVE_USU_ALTA.AsString:=Objeto.Apli.Usuario;
      Objeto.F_ALTA.AsDateTime:= Objeto.Apli.SysDateTime;
  end
  else
  begin
      Objeto.CVE_USU_MODIFICA.AsString:=Objeto.Apli.Usuario;
      Objeto.F_MODIFICA.AsDateTime:= Objeto.Apli.SysDateTime;
  end;

end;

function TWCrGaPpRegistro.ObtDesBcoGtia(vlCVE_ENT_CNBV: String): String;
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


procedure TWCrGaPpRegistro.InterForma1Buscar(Sender: TObject);
begin
    Objeto.InternalBusca;
    edTX_DESC_BCO_GARANTIA.Text := ObtDesBcoGtia(edCVE_BCO_GTIA.Text);
end;

procedure TWCrGaPpRegistro.rgCVE_DET_MONTOClick(Sender: TObject);
begin
    case rgCVE_DET_MONTO.ItemIndex of
        0: begin
             //MO
             edMONTO_GARANTIA.Enabled := True;
             edPCT_GARANTIA.Enabled   := False;
             edPCT_GARANTIA.Text      := '';
           end;
        1: begin
             //PO
             edPCT_GARANTIA.Enabled   := True;
             edMONTO_GARANTIA.Enabled := False;
             edMONTO_GARANTIA.Text    := '';
           end;
    end;
end;

procedure TWCrGaPpRegistro.btnLigarLineaClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRGAPPREG_LIGLI',True,True) then
   Begin
       if Objeto.Active then
       Begin
           {$WARNINGS OFF}
           Objeto.LinGPP := TCrLinGPP.Create(Self);
           {$WARNINGS ON}
           try
              Objeto.LinGPP.Apli:=Objeto.Apli;
              Objeto.LinGPP.ParamCre:=Objeto.ParamCre;
              Objeto.LinGPP.vgIdSolicitud:= Objeto.ID_SOLICITUD.AsString;
              Objeto.LinGPP.Catalogo;
           finally
                 if Objeto.LinGPP <> nil then
                    Objeto.LinGPP.Free;
                 //end if
           end;
       end
       else ShowMessage('No existe registro Activo');
   end;
end;

procedure TWCrGaPpRegistro.btnBitCambiosClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRGAPPREG_BITCA',True,True) then
   Begin
     if Objeto.Active then
     Begin
         {$WARNINGS OFF}
         Objeto.BitCGPP := TCRBitCGPP.Create(Self);
         {$WARNINGS ON}
         try
            Objeto.BitCGPP.Apli:=Objeto.Apli;
            Objeto.BitCGPP.ParamCre:=Objeto.ParamCre;
            Objeto.BitCGPP.vgIdSolicitud:= Objeto.ID_SOLICITUD.AsString;
            Objeto.BitCGPP.Catalogo;
         finally
               if Objeto.BitCGPP <> nil then
                  Objeto.BitCGPP.Free;
               //end if
         end;
     end
     else ShowMessage('No existe registro Activo');
   end;
end;

procedure TWCrGaPpRegistro.btnHistoRegGPCClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRGAPPREG_HIGPP',True,True) then
   Begin
     if Objeto.Active then
     Begin
         {$WARNINGS OFF}
         Objeto.GaPpRH := TCrGaPpRH.Create(Self);
         {$WARNINGS ON}
         try
            Objeto.GaPpRH.Apli:=Objeto.Apli;
            Objeto.GaPpRH.ParamCre:=Objeto.ParamCre;
            Objeto.GaPpRH.vgIdSolicitud:= Objeto.ID_SOLICITUD.AsString;
            Objeto.GaPpRH.Catalogo;
         finally
               if Objeto.GaPpRH <> nil then
                  Objeto.GaPpRH.Free;
               //end if
         end;
     end
     else ShowMessage('No existe registro Activo');
   end;
end;

end.
