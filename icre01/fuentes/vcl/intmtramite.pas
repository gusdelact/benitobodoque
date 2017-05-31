// Sistema         : Clase de DO_TRAMITE
// Fecha de Inicio : 21/04/2004
// Función forma   : Clase de DO_TRAMITE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMTramite;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers, IntMDoMedio;

Type
 TMTramite= class;

  TWMTramite=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_EXCEPCION : TLabel;
    edDESC_C_TRAMITE: TEdit;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbID_PROMOTOR: TLabel;
    edID_EMPRESA: TEdit;
    btEMPRESA: TBitBtn;
    edNOM_EMPRESA: TEdit;
    ilEMPRESA: TInterLinkit;
    edCVE_TRAMITE: TEdit;
    Label1: TLabel;
    edDESC_L_TRAMITE: TMemo;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    rgSIT_TRAMITE: TRadioGroup;
    edCVE_MEDIO: TEdit;
    Label3: TLabel;
    btCVE_MEDIO: TBitBtn;
    ilCVE_MEDIO: TInterLinkit;
    edNOM_CVE_MEDIO: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edID_EMPRESAExit(Sender: TObject);
    procedure btEMPRESAClick(Sender: TObject);
    procedure ilEMPRESACapture(Sender: TObject; var Show: Boolean);
    procedure ilEMPRESAEjecuta(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_TRAMITEExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_TRAMITEExit(Sender: TObject);
    procedure edDESC_C_TRAMITEExit(Sender: TObject);
    procedure edDESC_L_TRAMITEExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edCVE_MEDIOExit(Sender: TObject);
    procedure btCVE_MEDIOClick(Sender: TObject);
    procedure ilCVE_MEDIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MEDIOEjecuta(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMTramite;
    end;

 TMTramite= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        CVE_TRAMITE              : TInterCampo;
        DESC_C_TRAMITE           : TInterCampo;
        DESC_L_TRAMITE           : TInterCampo;
        CVE_MEDIO                : TInterCampo;
        SIT_TRAMITE              : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;

        ParamCre                 : TParamCre;
        Empresa                  : TMPersona; //Empresa
        MDoMedio                 : TMDoMedio;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TMTramite.Create( AOwner : TComponent );
begin Inherited;

   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:=False;
   CVE_TRAMITE :=CreaCampo('CVE_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      CVE_TRAMITE.Caption:='Clave de Trámites';
      CVE_TRAMITE.NoCompare:=False;
   DESC_C_TRAMITE :=CreaCampo('DESC_C_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      DESC_C_TRAMITE.Caption:='Descripción corta del Trámite';
      DESC_C_TRAMITE.NoCompare:=True;
   DESC_L_TRAMITE :=CreaCampo('DESC_L_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      DESC_L_TRAMITE.Caption:='Descripción larga del trámite';
      DESC_L_TRAMITE.NoCompare:=True;
   CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
      CVE_MEDIO.Caption:='Clave del medio';
      CVE_MEDIO.NoCompare:=True;

   SIT_TRAMITE :=CreaCampo('SIT_TRAMITE',ftString,tsNinguno,tsNinguno,True);
   With SIT_TRAMITE do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   end;
      SIT_TRAMITE.Caption:='Situación del Trámite';
      SIT_TRAMITE.NoCompare:=True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:=True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:=True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFICA.NoCompare:=True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:=True;

   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('CVE_TRAMITE');
   TableName := 'DO_TRAMITE';
   UseQuery := True;
   HelpFile := 'IntMTramite.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';

   MDoMedio := TMDoMedio.Create(Self);
   MDoMedio.MasterSource := Self;
   MDoMedio.FieldByName('CVE_MEDIO').MasterField := 'CVE_MEDIO';
end;


Destructor TMTramite.Destroy;
begin
   If Empresa <> Nil Then
      Empresa.Free;
   If MDoMedio <> Nil Then
      MDoMedio.Free;
   Inherited;
end;

function TMTramite.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMTramite;
begin
   W:=TWMTramite.Create(Self);
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

Function TMTramite.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMTramite.it','F,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,CVE_TRAMITE.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMTramite.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA DO_TRAMITE********************)
(*                                                                              *)
(*  FORMA DE DO_TRAMITE                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_TRAMITE********************)

procedure TWMTramite.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_EMPRESA.Control       := edID_EMPRESA;
      CVE_TRAMITE.Control      := edCVE_TRAMITE;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      DESC_C_TRAMITE.Control   := edDESC_C_TRAMITE;
      DESC_L_TRAMITE.Control   := edDESC_L_TRAMITE;
      SIT_TRAMITE.Control      := rgSIT_TRAMITE;
      CVE_MEDIO.Control        := edCve_MEDIO;
      InterForma1.MsgPanel     := PnlMsg;
   End;

   Objeto.Empresa.ID_Persona.Control :=edID_EMPRESA;
   Objeto.Empresa.Nombre.Control :=edNOM_EMPRESA;
   Objeto.Empresa.GetParams(Objeto);
   edNOM_EMPRESA.Hint := Objeto.Empresa.Nombre.AsString;
   edNOM_EMPRESA.ShowHint := True;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.MDoMedio.CVE_MEDIO.Control:= edCVE_MEDIO;
   Objeto.MDoMedio.DESC_MEDIO.Control:= edNOM_CVE_MEDIO;
   Objeto.MDoMedio.GetParams(Objeto);

end;

procedure TWMTramite.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := Nil;
      CVE_TRAMITE.Control      := Nil;
      DESC_C_TRAMITE.Control   := Nil;
      DESC_L_TRAMITE.Control   := Nil;
      CVE_MEDIO.Control        := Nil;
      SIT_TRAMITE.Control      := Nil;
      CVE_USU_ALTA.Control     := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_ALTA.Control           := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
   Objeto.Empresa.Nombre.Control :=Nil;
   Objeto.Empresa.ID_Persona.Control :=Nil;

   Objeto.MDoMedio.CVE_MEDIO.Control:= Nil;
   Objeto.MDoMedio.DESC_MEDIO.Control:= Nil;   
end;

procedure TWMTramite.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMTramite.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
   //nuevo
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;

procedure TWMTramite.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);
      MDoMedio.FindKey([CVE_MEDIO.AsString]);
   End;
end;

procedure TWMTramite.edID_EMPRESAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_EMPRESA.GetFromControl;
      if Objeto.ID_EMPRESA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador de la empresa';
      end;
      InterForma1.ValidaExit(edID_EMPRESA,vlSalida,vlMsg,True);
   end;
end;

procedure TWMTramite.btEMPRESAClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMTramite.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMTramite.ilEMPRESAEjecuta(Sender: TObject);
begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMTramite.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_TRAMITE.ItemIndex:= 0;
   edID_EMPRESA.SetFocus;
   If Objeto.Empresa.FindKey([Objeto.Apli.IdEmpresa]) Then Begin
      edCVE_TRAMITE.SetFocus;
   End;
end;

procedure TWMTramite.rgSIT_TRAMITEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_TRAMITE,True,CNULL,True);
end;

procedure TWMTramite.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMTramite.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMTramite.edCVE_TRAMITEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveTra  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TRAMITE.GetFromControl;

      If Objeto.CVE_TRAMITE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Trámite';
      End Else Begin
         vlSql := ' SELECT * FROM DO_TRAMITE ' +
                  ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                  ' AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_TRAMITE',vlCveTra,False);
             If (vlCveTra <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del Trámite ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_TRAMITE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMTramite.edDESC_C_TRAMITEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.DESC_C_TRAMITE.GetFromControl;
      if Objeto.DESC_C_TRAMITE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la descripción corta del Trámite';
      end;
      InterForma1.ValidaExit(edDESC_C_TRAMITE,vlSalida,vlMsg,True);
   end;
end;

procedure TWMTramite.edDESC_L_TRAMITEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_TRAMITE,True,CNULL,True);
end;

procedure TWMTramite.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT DISTINCT CVE_TRAMITE FROM DO_REL_TRAM_DOC '+
         '  WHERE ID_EMPRESA = '+ Objeto.ID_EMPRESA.AsSQL+
         '    AND CVE_TRAMITE = '+ Objeto.CVE_TRAMITE.AsSQL;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
         If qyQuery.FieldByName('CVE_TRAMITE').AsString = Objeto.CVE_TRAMITE.AsString Then Begin
            ShowMessage('El Trámite '''+ Objeto.CVE_TRAMITE.AsString+
                        ''' tiene documentos asociados, No puede ser eliminado');
            Realizado:=False;
            Exit;
         End;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End Else
      Realizado:=True;
end;

procedure TWMTramite.edCVE_MEDIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MEDIO.GetFromControl;
      if Objeto.CVE_MEDIO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de Medio';
      end;
      InterForma1.ValidaExit(edCVE_MEDIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWMTramite.btCVE_MEDIOClick(Sender: TObject);
begin
   Objeto.MDoMedio.ShowAll := True;
   If Objeto.MDoMedio.Busca Then Begin
      InterForma1.NextTab(edCVE_MEDIO);
   End;
end;

procedure TWMTramite.ilCVE_MEDIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMTramite.ilCVE_MEDIOEjecuta(Sender: TObject);
begin
   If Objeto.MDoMedio.FindKey([ilCVE_MEDIO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_MEDIO);
   End;
end;

end.
