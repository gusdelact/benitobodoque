// Sistema         : Clase de CR_PROCAMPO
// Fecha de Inicio : 02/08/2004
// Función forma   : Clase de CR_PROCAMPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrProcamp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
//UNIDADES ADICIONALES
IntParamCre,
IntCrSubPro,
IntGenCre,
IntBasicCred
;

Type
 TCrProcamp= class;

  TWCrProcampo=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbCVE_SUB_DIVISION : TLabel;
    edCVE_SUB_DIVISION : TEdit;
    lbNUM_HECTAREAS : TLabel;
    lbSUBSIDIO_HECTAR : TLabel;
    lbCUOTA_CREDITO : TLabel;
    lbFONDO_CONTINGEN : TLabel;
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
    ilSUBDIVISION: TInterLinkit;
    edNOMBRE_SUBDIVISION: TEdit;
    btSUBDIVISION: TBitBtn;
    edPRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    edCONTRATO: TEdit;
    Label1: TLabel;
    edF_INICIO: TEdit;
    edF_VTO: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edIMP_GSUBSIDIO: TInterEdit;
    edIMP_GCUOTA_CRED: TInterEdit;
    edIMP_GFONDO_CONT: TInterEdit;
    edPLAZO: TInterEdit;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    lbUSUA_AUTOR: TLabel;
    lbF_AUTOR: TLabel;
    edF_ALTA: TEdit;
    edF_MODIF: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    edCVE_USUA_AUTOR: TEdit;
    edF_AUTOR: TEdit;
    lbSITUACION: TLabel;
    lbSIT_PROCAMPO: TLabel;
    edFONDO_CONTINGEN: TInterEdit;
    edCUOTA_CREDITO: TInterEdit;
    edSUBSIDIO_HECTAR: TInterEdit;
    edNUM_HECTAREAS: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btSUBDIVISIONClick(Sender: TObject);
    procedure ilSUBDIVISIONEjecuta(Sender: TObject);
    procedure edCVE_SUB_DIVISIONExit(Sender: TObject);
    procedure edNUM_HECTAREASExit(Sender: TObject);
    procedure edSUBSIDIO_HECTARExit(Sender: TObject);
    procedure edCUOTA_CREDITOExit(Sender: TObject);
    procedure edFONDO_CONTINGENExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrProcamp;
end; 
 TCrProcamp= class(TInterFrame) 
      private
         procedure CambioSituacion(Sender: TObject);
         Procedure CalculaImpGlobal(peIdCredito : Integer);
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        CVE_SUB_DIVISION         : TInterCampo;
        NUM_HECTAREAS            : TInterCampo;
        SUBSIDIO_HECTAR          : TInterCampo;
        CUOTA_CREDITO            : TInterCampo;
        FONDO_CONTINGEN          : TInterCampo;
        SIT_PROCAMPO             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_AUTORIZA               : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        G_SUBSIDIO_HECTAR        : TInterCampo;
        G_CUOTA_CREDITO          : TInterCampo;
        G_FONDO_CONTINGEN        : TInterCampo;

        ParamCre                 : TParamCre;
        SubDivision              : TCrSubPro;
        BasicCred                : TBasicCred;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrProcamp.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      CVE_SUB_DIVISION :=CreaCampo('CVE_SUB_DIVISION',ftString,tsNinguno,tsNinguno,True);
                CVE_SUB_DIVISION.Caption:='Clave de Sub Division';
      NUM_HECTAREAS :=CreaCampo('NUM_HECTAREAS',ftFloat,tsNinguno,tsNinguno,True);
                NUM_HECTAREAS.Caption:='Número Hectareas';
      SUBSIDIO_HECTAR :=CreaCampo('SUBSIDIO_HECTAR',ftFloat,tsNinguno,tsNinguno,True);
                SUBSIDIO_HECTAR.Caption:='Subsidio Hectar';
      CUOTA_CREDITO :=CreaCampo('CUOTA_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                CUOTA_CREDITO.Caption:='Cuota Credito';
      FONDO_CONTINGEN :=CreaCampo('FONDO_CONTINGEN',ftFloat,tsNinguno,tsNinguno,True);
                FONDO_CONTINGEN.Caption:='Fondo Contingen';
      SIT_PROCAMPO :=CreaCampo('SIT_PROCAMPO',ftString,tsNinguno,tsNinguno,True);
      With SIT_PROCAMPO do
      begin Size:=2;
            UseCombo:=True;
//            ComboLista.Add('NO AUTORIZADA');      ComboDatos.Add(CSIT_NA);
            ComboLista.Add('ACTIVO');             ComboDatos.Add(CSIT_AC);
            ComboLista.Add('CANCELADA');          ComboDatos.Add(CSIT_CA);
            ComboLista.Add('LIQUIDADA');          ComboDatos.Add(CSIT_LQ);
            ComboLista.Add('RECHAZADA');          ComboDatos.Add(CSIT_RE);
            ComboLista.Add('AUTORIZADA');         ComboDatos.Add(CSIT_AU);
            ComboLista.Add('NO PROCESADO');       ComboDatos.Add(CSIT_NP);
      end;
                SIT_PROCAMPO.Caption:='Situación Procampo';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_AUTORIZA :=CreaCampo('F_AUTORIZA',ftDateTime,tsNinguno,tsNinguno,True);
                F_AUTORIZA.Caption:='Fecha Autoriza';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      G_SUBSIDIO_HECTAR :=CreaCampo('G_SUBSIDIO_HECTAR',ftFloat,tsNinguno,tsNinguno,False);
      G_CUOTA_CREDITO :=CreaCampo('G_CUOTA_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      G_FONDO_CONTINGEN :=CreaCampo('G_FONDO_CONTINGEN',ftFloat,tsNinguno,tsNinguno,False);

      FKeyFields.Add('ID_CREDITO');

      TableName := 'CR_PROCAMPO';
      UseQuery := True;
      HelpFile := 'IntCrProcamp.Hlp';
      ShowMenuReporte:=True;

      SubDivision := TCrSubPro.Create(Self);
      SubDivision.MasterSource:= Self;
      SubDivision.FieldByName('CVE_SUB_DIVISION').MasterField := 'CVE_SUB_DIVISION';
      SubDivision.BuscaWhereString := 'SIT_SUBDIVISION = ''AC''';
      SubDivision.FilterString := SubDivision.BuscaWhereString;

      BasicCred := TBasicCred.Create(Self);
      BasicCred.MasterSource := Self;

      SIT_PROCAMPO.OnChange := CambioSituacion;
end;

Destructor TCrProcamp.Destroy;
begin
   if SubDivision <> nil then
      SubDivision.Free;
   //end if
   inherited;
end;


function TCrProcamp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProcampo;
begin
   W:=TWCrProcampo.Create(Self);
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


Function TCrProcamp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrProca.it','F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

procedure TCrProcamp.CambioSituacion(Sender: TObject);
begin
   //CAMBIA LA SITUACION DEL CREDITO
   If (SIT_PROCAMPO.Control<>nil) and (SIT_PROCAMPO.Control is TLabel) then
      TLabel(SIT_PROCAMPO.Control).Caption:=SIT_PROCAMPO.AsCombo;
   //end if
end;

procedure TCrProcamp.CalculaImpGlobal(peIdCredito: Integer);
var   sptImpGlob : TStoredProc;
Begin
   try
     sptImpGlob := TStoredProc.Create(Self);
     with sptImpGlob do
     begin
        //Inicia el SPT
        sptImpGlob.DatabaseName:= Apli.DatabaseName;
        sptImpGlob.SessionName:= Apli.SessionName;
        sptImpGlob.StoredProcName:= 'PKGCRPERIODO.STPOBTENCUOTASPROCAM';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftFloat,'PSGLOBSUBSIDIO',ptOutput);
        Params.CreateParam(ftFloat,'PSGLOBCUOTACRE',ptOutput);
        Params.CreateParam(ftFloat,'PSGLOBFONDOCONT',ptOutput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := peIdCredito;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger = 0) then
        Begin
           G_SUBSIDIO_HECTAR.AsFloat := ParamByName('psGlobSubsidio').AsFloat;
           G_CUOTA_CREDITO.AsFloat :=ParamByName('psGlobCuotaCre').AsFloat;
           G_FONDO_CONTINGEN.AsFloat :=ParamByName('psGlobFondoCont').AsFloat;
        end
        else
        Begin
           ShowMessage('Problemas al obtener los importe globales: ' +
                       IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end;
     end;
   finally
      sptImpGlob.Free;
   end;
end;

(***********************************************FORMA CR_PROCAMPO********************)
(*                                                                              *)
(*  FORMA DE CR_PROCAMPO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PROCAMPO********************)

procedure TWCrProcampo.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CVE_SUB_DIVISION.Control:=edCVE_SUB_DIVISION;
      Objeto.NUM_HECTAREAS.Control:=edNUM_HECTAREAS;
      Objeto.SUBSIDIO_HECTAR.Control:=edSUBSIDIO_HECTAR;
      Objeto.CUOTA_CREDITO.Control:=edCUOTA_CREDITO;
      Objeto.FONDO_CONTINGEN.Control:=edFONDO_CONTINGEN;
      Objeto.CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
      Objeto.SIT_PROCAMPO.Control:= lbSIT_PROCAMPO;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.F_AUTORIZA.Control := edF_AUTOR;
      Objeto.CVE_USU_AUTORIZA.Control := edCVE_USUA_AUTOR;
      Objeto.F_MODIFICA.Control := edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;

      Objeto.G_SUBSIDIO_HECTAR.Control := edIMP_GSUBSIDIO;
      Objeto.G_CUOTA_CREDITO.Control := edIMP_GCUOTA_CRED;
      Objeto.G_FONDO_CONTINGEN.Control := edIMP_GFONDO_CONT;

      Objeto.SubDivision.NOMBRE_SUB_DIV.Control := edNOMBRE_SUBDIVISION;
      Objeto.SubDivision.GetParams(Objeto);

      edID_CREDITO.Text := Objeto.BasicCred.ID_CREDITO.AsString;
      edCONTRATO.Text := Objeto.BasicCred.ID_CONTRATO.AsString;
      edPRODUCTO.Text := Objeto.BasicCred.CVE_PRODUCTO.AsString;
      edPRODUCTO.Hint := Objeto.BasicCred.CVE_PRODUCTO.AsString;
      edPRODUCTO.ShowHint := True;
      edDESC_PRODUCTO.Text := Objeto.BasicCred.DESC_L_PRODUCTO.AsString;
      edF_INICIO.Text := Objeto.BasicCred.F_INICIO.AsString;
      edF_VTO.Text := Objeto.BasicCred.F_VENCIMIENTO.AsString;
      edPLAZO.Text := Objeto.BasicCred.DIAS_PLAZO.AsString;

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrProcampo.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CVE_SUB_DIVISION.Control:=nil;
      Objeto.NUM_HECTAREAS.Control:=nil;
      Objeto.SUBSIDIO_HECTAR.Control:=nil;
      Objeto.CUOTA_CREDITO.Control:=nil;
      Objeto.FONDO_CONTINGEN.Control:=nil;
      Objeto.SIT_PROCAMPO.Control:= nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.F_AUTORIZA.Control := nil;
      Objeto.CVE_USU_AUTORIZA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.G_SUBSIDIO_HECTAR.Control := nil;
      Objeto.G_CUOTA_CREDITO.Control := nil;
      Objeto.G_FONDO_CONTINGEN.Control := nil;

      Objeto.SubDivision.NOMBRE_SUB_DIV.Control := nil;
end;

procedure TWCrProcampo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProcampo.InterForma1DespuesNuevo(Sender: TObject);
Var
   qyQuery : TQuery;
   sSQL : String;
   vlFechaMax : String;
begin

   sSQL := ' SELECT MAX(F_APLICACION) AS F_APLICACION ' +
           ' FROM CR_CICLOS_PROCAM ' +
           ' WHERE SIT_CICLO = ''AC'' ';
   GetSQLStr(sSQL,Objeto.Apli.DataBaseName,Objeto.SessionName,'F_APLICACION',vlFechaMax, False);
   IF vlFechaMax <> '' THEN
   Begin
     sSQL := ' SELECT SUBSIDIO_HECT, FONDO_CONTINGEN ' +
             ' FROM CR_CICLOS_PROCAM ' +
             ' WHERE F_APLICACION = '+ SQLFecha(StrToDateTime(vlFechaMax));

     qyQuery := GetSQLQuery(sSQL,Objeto.DataBaseName,Objeto.SessionName,True);
     If (qyQuery <> nil) Then Begin
         Objeto.SUBSIDIO_HECTAR.AsFloat := qyQuery.FieldbyName('SUBSIDIO_HECT').AsFloat;
         Objeto.FONDO_CONTINGEN.AsFloat := qyQuery.FieldbyName('FONDO_CONTINGEN').AsFloat;
         edSUBSIDIO_HECTAR.Enabled := False;
         edSUBSIDIO_HECTAR.Color := clBtnFace;
         edFONDO_CONTINGEN.Enabled := False;
         edFONDO_CONTINGEN.Color := clBtnFace;
     End
     Else Begin
       Objeto.SUBSIDIO_HECTAR.AsFloat := 0;
       Objeto.FONDO_CONTINGEN.AsFloat := 0;
       edSUBSIDIO_HECTAR.Enabled := True;
       edSUBSIDIO_HECTAR.Color := clWindow;
       edFONDO_CONTINGEN.Enabled := True;
       edFONDO_CONTINGEN.Color := clWindow;
     End;
   end
   Else Begin
       Objeto.SUBSIDIO_HECTAR.AsFloat := 0;
       Objeto.FONDO_CONTINGEN.AsFloat := 0;
       edSUBSIDIO_HECTAR.Enabled := True;
       edSUBSIDIO_HECTAR.Color := clWindow;
       edFONDO_CONTINGEN.Enabled := True;
       edFONDO_CONTINGEN.Color := clWindow;
   End;

   Objeto.NUM_HECTAREAS.AsFloat := 0;
   Objeto.CUOTA_CREDITO.AsFloat := 0;
   Objeto.G_SUBSIDIO_HECTAR.AsFloat := 0;
   Objeto.G_CUOTA_CREDITO.AsFloat := 0;
   Objeto.G_FONDO_CONTINGEN.AsFloat := 0;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.ID_CREDITO.AsString := Objeto.BasicCred.ID_CREDITO.AsString;
   Objeto.SIT_PROCAMPO.AsString := CSIT_AC;
   edCVE_SUB_DIVISION.SetFocus;
end;

procedure TWCrProcampo.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   Objeto.F_MODIFICA.AsDateTime := Now;
   edCVE_SUB_DIVISION.SetFocus;
end;

procedure TWCrProcampo.btSUBDIVISIONClick(Sender: TObject);
begin
   Objeto.SubDivision.ShowAll := True;
   if Objeto.SubDivision.Busca then
   BEGIN
      Objeto.CVE_SUB_DIVISION.AsString := Objeto.SubDivision.CVE_SUB_DIVISION.AsString;
      InterForma1.NextTab(edCVE_SUB_DIVISION);
   END;
end;

procedure TWCrProcampo.ilSUBDIVISIONEjecuta(Sender: TObject);
begin
   if Objeto.SubDivision.FindKey([Objeto.BasicCred.ID_ACREDITADO.AsString,ilSUBDIVISION.Buffer]) then
   BEGIN
      Objeto.CVE_SUB_DIVISION.AsString := Objeto.SubDivision.CVE_SUB_DIVISION.AsString;
      InterForma1.NextTab(edCVE_SUB_DIVISION);
   END;
end;

procedure TWCrProcampo.edCVE_SUB_DIVISIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        vlMsg     := '';
        vlSalida := True;
        Objeto.CVE_SUB_DIVISION.GetFromControl;
        if Objeto.CVE_SUB_DIVISION.AsString = '' then
        Begin
           vlMsg := 'Favor de Indicar la Clave de la Subdivisión';
           vlSalida   := False;
        end; //end if
        InterForma1.ValidaExit(edCVE_SUB_DIVISION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProcampo.edNUM_HECTAREASExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        vlMsg     := '';
        vlSalida := True;
        Objeto.NUM_HECTAREAS.GetFromControl;
        Objeto.SUBSIDIO_HECTAR.GetFromControl;
        Objeto.FONDO_CONTINGEN.GetFromControl;
        if Objeto.NUM_HECTAREAS.AsFloat <= 0 then
        Begin
           vlMsg := 'Favor de indicar el número de hectáreas ';
           vlSalida   := False;
        end; //end if
        Objeto.G_SUBSIDIO_HECTAR.AsFloat := Objeto.SUBSIDIO_HECTAR.AsFloat * Objeto.NUM_HECTAREAS.AsFloat  ;
        Objeto.G_FONDO_CONTINGEN.AsFloat := Objeto.FONDO_CONTINGEN.AsFloat * Objeto.NUM_HECTAREAS.AsFloat  ;
        InterForma1.ValidaExit(edNUM_HECTAREAS,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProcampo.edSUBSIDIO_HECTARExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        vlMsg     := '';
        vlSalida := True;
        Objeto.SUBSIDIO_HECTAR.GetFromControl;
        Objeto.NUM_HECTAREAS.GetFromControl;
        if Objeto.SUBSIDIO_HECTAR.AsFloat <= 0 then
        Begin
           vlMsg := 'Favor de indicar el subsidio por hectárea';
           vlSalida   := False;
        end; //end if
        Objeto.G_SUBSIDIO_HECTAR.AsFloat := Objeto.SUBSIDIO_HECTAR.AsFloat * Objeto.NUM_HECTAREAS.AsFloat  ;
        InterForma1.ValidaExit(edSUBSIDIO_HECTAR,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProcampo.edCUOTA_CREDITOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        vlMsg     := '';
        vlSalida := True;
        Objeto.CUOTA_CREDITO.GetFromControl;
        Objeto.NUM_HECTAREAS.GetFromControl;
        if Objeto.CUOTA_CREDITO.AsFloat <= 0 then
        Begin
           vlMsg := 'Favor de indicar la cuota de Crédito por hectárea';
           vlSalida   := False;
        end; //end if
        Objeto.G_CUOTA_CREDITO.AsFloat := Round(Objeto.CUOTA_CREDITO.AsFloat * Objeto.NUM_HECTAREAS.AsFloat)  ;
        InterForma1.ValidaExit(edCUOTA_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProcampo.edFONDO_CONTINGENExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        vlMsg     := '';
        vlSalida := True;
        Objeto.FONDO_CONTINGEN.GetFromControl;
        Objeto.NUM_HECTAREAS.GetFromControl;
        if Objeto.FONDO_CONTINGEN.AsFloat <= 0 then
        Begin
           vlMsg := 'Favor de indicar el fondo de contingencia';
           vlSalida   := False;
        end; //end if
        Objeto.G_FONDO_CONTINGEN.AsFloat := Objeto.FONDO_CONTINGEN.AsFloat * Objeto.NUM_HECTAREAS.AsFloat  ;
        InterForma1.ValidaExit(edFONDO_CONTINGEN,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProcampo.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrProcampo.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
   Begin
      Objeto.CalculaImpGlobal(Objeto.ID_CREDITO.AsInteger);
      Objeto.G_CUOTA_CREDITO.AsFloat := Round(Objeto.CUOTA_CREDITO.AsFloat * Objeto.NUM_HECTAREAS.AsFloat)  ;
   end
   //end if
end;

procedure TWCrProcampo.InterForma1DespuesShow(Sender: TObject);
begin
      Objeto.SubDivision.BuscaWhereString := 'CR_SUBDIV_PROCAM.ID_ACREDITADO = ' +
                                             Objeto.BasicCred.ID_ACREDITADO.AsString;
      Objeto.SubDivision.FilterString := Objeto.SubDivision.BuscaWhereString;
      if Objeto.FindKey([Objeto.ID_CREDITO.AsString]) then
      Begin
         if ( Objeto.BasicCred.SIT_CREDITO.AsString = CSIT_NA ) or ( Objeto.BasicCred.SIT_CREDITO.AsString = CSIT_RE ) THEN
         Begin
            InterForma1.ShowBtnNuevo := False;
         end;
         Objeto.CalculaImpGlobal(Objeto.ID_CREDITO.AsInteger);
      end;
      Objeto.SubDivision.FindKey([Objeto.BasicCred.ID_ACREDITADO.AsString,
                                  Objeto.CVE_SUB_DIVISION.AsString]);
end;

end.
