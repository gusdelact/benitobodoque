// Sistema         : Clase de DO_DOCUMENTO
// Fecha de Inicio : 20/04/2004
// Función forma   : Clase de DO_DOCUMENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMDoctos;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers, InterEdit;

Type
 TMDoctos= class;

  TWMDoctos=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_EXCEPCION : TLabel;
    edDESC_DOCUMENTO: TEdit;
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
    edCVE_DOCUMENTO: TEdit;
    Label1: TLabel;
    edINSTRUCCIONES: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    rgSIT_DOCUMENTO: TRadioGroup;
    cbxB_RENUEVA: TCheckBox;
    edDIAS_AVI_EXPIRA: TInterEdit;
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
    procedure rgSIT_DOCUMENTOExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure edDESC_DOCUMENTOExit(Sender: TObject);
    procedure edDIAS_AVI_EXPIRAExit(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edDIAS_AVI_EXPIRAKeyPress(Sender: TObject; var Key: Char);
    procedure edINSTRUCCIONESExit(Sender: TObject);
    procedure cbxB_RENUEVAExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMDoctos;
    end;

 TMDoctos= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;
        DESC_DOCUMENTO           : TInterCampo;
        INSTRUCCIONES            : TInterCampo;
        SIT_DOCUMENTO            : TInterCampo;
        DIAS_AVI_EXPIRA          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        B_RENUEVA                : TInterCampo;

        ParamCre                 : TParamCre;
        Empresa                  : TMPersona;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMDoctos.Create( AOwner : TComponent );
begin Inherited;
   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:= False;
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      CVE_DOCUMENTO.Caption:='Clave de Documento';
      CVE_DOCUMENTO.NoCompare:= False;
   DESC_DOCUMENTO :=CreaCampo('DESC_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      DESC_DOCUMENTO.Caption:='Descripción de Documento';
      DESC_DOCUMENTO.NoCompare:= True;
   INSTRUCCIONES :=CreaCampo('INSTRUCCIONES',ftString,tsNinguno,tsNinguno,True);
      INSTRUCCIONES.Caption:='Instrucciones';
      INSTRUCCIONES.NoCompare:= True;
   SIT_DOCUMENTO :=CreaCampo('SIT_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
   With SIT_DOCUMENTO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   end;
      SIT_DOCUMENTO.Caption:='Situación de Documento';
      SIT_DOCUMENTO.NoCompare:= True;

   DIAS_AVI_EXPIRA:=CreaCampo('DIAS_AVI_EXPIRA',ftFloat,tsNinguno,tsNinguno,True);
      DIAS_AVI_EXPIRA.Caption:='Dias de aviso';
      DIAS_AVI_EXPIRA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFICA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:= True;
   B_RENUEVA:=CreaCampo('B_RENUEVA',ftString,tsNinguno,tsNinguno,True);
      B_RENUEVA.Caption:='Indica si el documento se renueva';
      B_RENUEVA.NoCompare:= True;


   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DO_DOCUMENTO';
   UseQuery := True;
   HelpFile := 'IntMDoctos.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';
end;


Destructor TMDoctos.Destroy;
begin
   if Empresa <> nil then
      Empresa.Free;
   Inherited;
end;

function TMDoctos.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMDoctos;
begin
   W:=TWMDoctos.Create(Self);
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

Function TMDoctos.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMDoctos.it','F,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,CVE_DOCUMENTO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMDoctos.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA DO_DOCUMENTO********************)
(*                                                                              *)
(*  FORMA DE DO_DOCUMENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_DOCUMENTO********************)

procedure TWMDoctos.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_EMPRESA.Control       := edID_EMPRESA;
      CVE_DOCUMENTO.Control    := edCVE_DOCUMENTO;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      DESC_DOCUMENTO.Control   := edDESC_DOCUMENTO;
      DIAS_AVI_EXPIRA.Control  := edDIAS_AVI_EXPIRA;
      INSTRUCCIONES.Control    := edINSTRUCCIONES;
      SIT_DOCUMENTO.Control    := rgSIT_DOCUMENTO;
      B_RENUEVA.Control        := cbxB_RENUEVA;
      InterForma1.MsgPanel := PnlMsg;
   End;

   Objeto.Empresa.ID_Persona.Control :=edID_EMPRESA;
   Objeto.Empresa.Nombre.Control :=edNOM_EMPRESA;
   Objeto.Empresa.GetParams(Objeto);
   edNOM_EMPRESA.Hint := Objeto.Empresa.Nombre.AsString;
   edNOM_EMPRESA.ShowHint := True;
end;

procedure TWMDoctos.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := NIL;
      CVE_DOCUMENTO.Control    := NIL;
      CVE_USU_ALTA.Control     := NIL;
      CVE_USU_MODIFICA.Control := NIL;
      F_ALTA.Control           := NIL;
      F_MODIFICA.Control       := NIL;
      DESC_DOCUMENTO.Control   := NIL;
      DIAS_AVI_EXPIRA.Control  := NIL;
      InterForma1.MsgPanel     := NIL;
      SIT_DOCUMENTO.Control    := NIL;
      INSTRUCCIONES.Control    := NIL;
      B_RENUEVA.Control        := NIL;
      InterForma1.MsgPanel     := NIL;      
   End;
   Objeto.Empresa.Nombre.Control :=nil;
   Objeto.Empresa.ID_Persona.Control :=nil;
end;

procedure TWMDoctos.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMDoctos.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWMDoctos.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);      
   End;
end;

procedure TWMDoctos.edID_EMPRESAExit(Sender: TObject);
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

procedure TWMDoctos.btEMPRESAClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMDoctos.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMDoctos.ilEMPRESAEjecuta(Sender: TObject);
begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMDoctos.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_DOCUMENTO.ItemIndex:= 0;
   cbxB_RENUEVA.Checked:= False;
   edID_EMPRESA.SetFocus;
   If Objeto.Empresa.FindKey([Objeto.Apli.IdEmpresa]) Then Begin
      edCVE_DOCUMENTO.SetFocus;
   End;
end;

procedure TWMDoctos.rgSIT_DOCUMENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_DOCUMENTO,True,CNULL,True);
end;

procedure TWMDoctos.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMDoctos.edCVE_DOCUMENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveDoc  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_DOCUMENTO.GetFromControl;

      If Objeto.CVE_DOCUMENTO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Documento';
      End Else Begin
         vlSql := ' SELECT * FROM DO_DOCUMENTO ' +
                  ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                  ' AND CVE_DOCUMENTO ='+ Objeto.CVE_DOCUMENTO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_DOCUMENTO',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del Documento ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_DOCUMENTO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMDoctos.edDESC_DOCUMENTOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.DESC_DOCUMENTO.GetFromControl;
      if Objeto.DESC_DOCUMENTO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la descripción del documento';
      end;
      InterForma1.ValidaExit(edDESC_DOCUMENTO,vlSalida,vlMsg,True);
   end;
end;

procedure TWMDoctos.edDIAS_AVI_EXPIRAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.DIAS_AVI_EXPIRA.GetFromControl;
      if Objeto.DIAS_AVI_EXPIRA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el número de días para aviso antes de que el documento expire';
      end;
      InterForma1.ValidaExit(edDIAS_AVI_EXPIRA,vlSalida,vlMsg,True);
   end;
end;

procedure TWMDoctos.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMDoctos.edDIAS_AVI_EXPIRAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMDoctos.edINSTRUCCIONESExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edINSTRUCCIONES,True,CNULL,True);
end;

procedure TWMDoctos.cbxB_RENUEVAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_RENUEVA,True,CNULL,True);
end;

procedure TWMDoctos.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT DISTINCT CVE_DOCUMENTO FROM DO_REL_TRAM_DOC '+
         '  WHERE ID_EMPRESA = '+ Objeto.ID_EMPRESA.AsSQL+
         '    AND CVE_DOCUMENTO = '+ Objeto.CVE_DOCUMENTO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
         If qyQuery.FieldByName('CVE_DOCUMENTO').AsString = Objeto.CVE_DOCUMENTO.AsString Then Begin
            ShowMessage('El Documento '''+ Objeto.CVE_DOCUMENTO.AsString+
                        ''' esta relacionado con un trámite , No puede ser eliminado');
            Realizado:=False;
            Exit;
         End;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End Else
      Realizado:=True;
end;

end.
