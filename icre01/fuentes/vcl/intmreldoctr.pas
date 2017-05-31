// Sistema         : Clase de DO_REL_TRAM_DOC
// Fecha de Inicio : 21/04/2004
// Función forma   : Clase de DO_REL_TRAM_DOC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRelDocTr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers, IntMDoctos,IntMTramite;

Type
 TMRelDocTr= class;

  TWMRelDocTr=Class(TForm)
    InterForma1             : TInterForma;
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
    edINSTRUC_ADIC: TMemo;
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
    rgSIT_REL_TRAM_DO: TRadioGroup;
    btTRAMITE: TBitBtn;
    edTRAMITE: TEdit;
    ilTramite: TInterLinkit;
    Label4: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btDOCUMENTO: TBitBtn;
    edNOM_DOCUMENTO: TEdit;
    ilDocumento: TInterLinkit;
    rgCVE_TIP_DOC: TRadioGroup;
    cbB_OBLIGATORIO: TCheckBox;
    cbB_REQ_ORIGINAL: TCheckBox;
    cbB_EXCEPTUAR: TCheckBox;
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
    procedure rgSIT_REL_TRAM_DOExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_TRAMITEExit(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure btTRAMITEExit(Sender: TObject);
    procedure rgCVE_TIP_DOCExit(Sender: TObject);
    procedure btTRAMITEClick(Sender: TObject);
    procedure btDOCUMENTOClick(Sender: TObject);
    procedure edINSTRUC_ADICExit(Sender: TObject);
    procedure ilTramiteCapture(Sender: TObject; var Show: Boolean);
    procedure ilDocumentoCapture(Sender: TObject; var Show: Boolean);
    procedure ilTramiteEjecuta(Sender: TObject);
    procedure ilDocumentoEjecuta(Sender: TObject);
    procedure cbB_OBLIGATORIOExit(Sender: TObject);
    procedure cbB_REQ_ORIGINALExit(Sender: TObject);
    procedure cbB_EXCEPTUARExit(Sender: TObject);
    procedure edID_EMPRESAChange(Sender: TObject);

    private
    { Private declarations }
    Function Verificar:Boolean;
    public
    { Public declarations }
      Objeto : TMRelDocTr;
    end;

 TMRelDocTr= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA       : TInterCampo;
        CVE_TRAMITE      : TInterCampo;
        CVE_DOCUMENTO    : TInterCampo;
        CVE_TIP_DOC      : TInterCampo;
        INSTRUC_ADIC     : TInterCampo;
        B_OBLIGATORIO    : TInterCampo;
        B_REQ_ORIGINAL   : TInterCampo;
        B_EXCEPTUAR      : TInterCampo;
        SIT_REL_TRAM_DO  : TInterCampo;
        CVE_USU_ALTA     : TInterCampo;
        F_ALTA           : TInterCampo;
        CVE_USU_MODIFICA : TInterCampo;
        F_MODIFICA       : TInterCampo;

        ParamCre         : TParamCre;
        Empresa          : TMPersona; //Empresa
        Doctos           : TMDoctos;  //Documento
        Tramite          : TMTramite; //Trámite


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TMRelDocTr.Create( AOwner : TComponent );
begin Inherited;
   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:=False;
   CVE_TRAMITE :=CreaCampo('CVE_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      CVE_TRAMITE.Caption:='Clave de Trámite';
      CVE_TRAMITE.NoCompare:=False;
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      CVE_DOCUMENTO.Caption:='Clave de Documento';
      CVE_DOCUMENTO.NoCompare:=False;
   CVE_TIP_DOC:=CreaCampo('CVE_TIP_DOC',ftString,tsNinguno,tsNinguno,True);
   With CVE_TIP_DOC do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('BA');
      ComboLista.Add('1'); ComboDatos.Add('CO');
   end;
      CVE_TIP_DOC.Caption:='Clave de Tipo del Documentación';
      CVE_TIP_DOC.NoCompare:=True;
   INSTRUC_ADIC :=CreaCampo('INSTRUC_ADIC',ftString,tsNinguno,tsNinguno,True);
      INSTRUC_ADIC.Caption:='Instrucciones adicionales';
      INSTRUC_ADIC.NoCompare:=True;
   B_OBLIGATORIO :=CreaCampo('B_OBLIGATORIO',ftString,tsNinguno,tsNinguno,True);
      B_OBLIGATORIO.Caption:='Indica si es obligatorio';
      B_OBLIGATORIO.NoCompare:=True;
   B_REQ_ORIGINAL :=CreaCampo('B_REQ_ORIGINAL',ftString,tsNinguno,tsNinguno,True);
      B_REQ_ORIGINAL.Caption:='Indica si es original';
      B_REQ_ORIGINAL.NoCompare:=True;
   B_EXCEPTUAR :=CreaCampo('B_EXCEPTUAR',ftString,tsNinguno,tsNinguno,True);
      B_EXCEPTUAR.Caption:='Indica si es exceptuado';
      B_EXCEPTUAR.NoCompare:=True;

   SIT_REL_TRAM_DO :=CreaCampo('SIT_REL_TRAM_DO',ftString,tsNinguno,tsNinguno,True);
   With SIT_REL_TRAM_DO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   end;
      SIT_REL_TRAM_DO.Caption:='Situación de la relación';
      SIT_REL_TRAM_DO.NoCompare:=True;
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
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DO_REL_TRAM_DOC';
   UseQuery := True;
   HelpFile := 'IntMRelDocTr.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';

   Doctos := TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';

   Tramite := TMTramite.Create(Self);
   Tramite.MasterSource := Self;
   Tramite.FieldByName('CVE_TRAMITE').MasterField := 'CVE_TRAMITE';
end;

Destructor TMRelDocTr.Destroy;
begin
   if Empresa <> nil then
      Empresa.Free;
   if Doctos <> nil then
      Doctos.Free;
   if Tramite <> nil then
      Tramite.Free;
   Inherited;
end;

function TMRelDocTr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRelDocTr;
begin
   W:=TWMRelDocTr.Create(Self);
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

Function TMRelDocTr.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMRelDocTr.it','F,S,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,CVE_TRAMITE.AsString);
         T.Param(2,CVE_DOCUMENTO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
   finally
      T.Free;
   end;
end;

function TMRelDocTr.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA DO_REL_TRAM_DOC********************)
(*                                                                              *)
(*  FORMA DE DO_REL_TRAM_DOC                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_REL_TRAM_DOC********************)

procedure TWMRelDocTr.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_EMPRESA.Control       := edID_EMPRESA;
      CVE_TRAMITE.Control      := edCVE_TRAMITE;
      CVE_DOCUMENTO.Control    := edCVE_DOCUMENTO;
      CVE_TIP_DOC.Control      := rgCVE_TIP_DOC;
      INSTRUC_ADIC.Control     := edINSTRUC_ADIC;
      B_OBLIGATORIO.Control    := cbB_OBLIGATORIO;
      B_REQ_ORIGINAL.Control   := cbB_REQ_ORIGINAL;
      B_EXCEPTUAR.Control      := cbB_EXCEPTUAR;
      SIT_REL_TRAM_DO.Control  := rgSIT_REL_TRAM_DO;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;

      InterForma1.MsgPanel := PnlMsg;

   End;

   Objeto.Empresa.ID_Persona.Control :=edID_EMPRESA;
   Objeto.Empresa.Nombre.Control :=edNOM_EMPRESA;
   Objeto.Empresa.GetParams(Objeto);
   edNOM_EMPRESA.Hint := Objeto.Empresa.Nombre.AsString;
   edNOM_EMPRESA.ShowHint := True;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.Doctos.CVE_DOCUMENTO.Control := edCVE_DOCUMENTO;
   Objeto.Doctos.DESC_DOCUMENTO.Control := edNOM_DOCUMENTO;
   Objeto.Doctos.GetParams(Objeto);

   Objeto.Tramite.CVE_TRAMITE.Control := edCVE_TRAMITE;
   Objeto.Tramite.DESC_C_TRAMITE.Control := edTRAMITE;
   Objeto.Tramite.GetParams(Objeto);
end;

procedure TWMRelDocTr.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := Nil;
      CVE_TRAMITE.Control      := Nil;
      CVE_DOCUMENTO.Control    := Nil;
      CVE_TIP_DOC.Control      := Nil;
      INSTRUC_ADIC.Control     := Nil;
      B_OBLIGATORIO.Control    := Nil;
      B_REQ_ORIGINAL.Control   := Nil;
      B_EXCEPTUAR.Control      := Nil;
      SIT_REL_TRAM_DO.Control  := Nil;
      CVE_USU_ALTA.Control     := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_ALTA.Control           := Nil;
      F_MODIFICA.Control       := Nil;
   End;
   Objeto.Empresa.Nombre.Control :=nil;
   Objeto.Empresa.ID_Persona.Control :=Nil;


   Objeto.Doctos.CVE_DOCUMENTO.Control := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control := Nil;

 
   Objeto.Tramite.CVE_TRAMITE.Control := Nil;
   Objeto.Tramite.DESC_C_TRAMITE.Control := Nil;

end;

procedure TWMRelDocTr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMRelDocTr.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
   //nuevo
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            If Verificar Then
               Realizado := True
            Else
               Realizado := False;
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

procedure TWMRelDocTr.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);
      Tramite.FindKey([ID_EMPRESA.AsString,CVE_TRAMITE.AsString]);
      Doctos.FindKey([ID_EMPRESA.AsString,CVE_DOCUMENTO.AsString]);
   End;
end;

procedure TWMRelDocTr.edID_EMPRESAExit(Sender: TObject);
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

procedure TWMRelDocTr.btEMPRESAClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMRelDocTr.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRelDocTr.ilEMPRESAEjecuta(Sender: TObject);
begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMRelDocTr.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   cbB_OBLIGATORIO.Checked:= False;
   cbB_REQ_ORIGINAL.Checked:= False;
   cbB_EXCEPTUAR.Checked:= False;
   rgSIT_REL_TRAM_DO.ItemIndex:= 0;
   rgCVE_TIP_DOC.ItemIndex:= 0;
   edID_EMPRESA.SetFocus;   
   If Objeto.Empresa.FindKey([Objeto.Apli.IdEmpresa]) Then Begin
      edCVE_TRAMITE.SetFocus;
   End;
end;

procedure TWMRelDocTr.rgSIT_REL_TRAM_DOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_REL_TRAM_DO,True,CNULL,True);
end;

procedure TWMRelDocTr.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMRelDocTr.edCVE_TRAMITEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TRAMITE.GetFromControl;
      if Objeto.CVE_TRAMITE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Trámite';
      end;
      InterForma1.ValidaExit(edCVE_TRAMITE,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRelDocTr.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMRelDocTr.edCVE_DOCUMENTOExit(Sender: TObject);
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
         vlSql := ' SELECT * FROM DO_REL_TRAM_DOC ' +
                  ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
                  ' AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL +
                  ' AND CVE_DOCUMENTO ='+ Objeto.CVE_DOCUMENTO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_DOCUMENTO',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La Relación entre Trámite-Documento ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_DOCUMENTO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMRelDocTr.btTRAMITEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TRAMITE.GetFromControl;
      if Objeto.CVE_TRAMITE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de Trámite';
      end;
      InterForma1.ValidaExit(edCVE_TRAMITE,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRelDocTr.rgCVE_TIP_DOCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIP_DOC,True,CNULL,True);
end;

procedure TWMRelDocTr.btTRAMITEClick(Sender: TObject);
begin
   Objeto.ID_EMPRESA.GetFromControl;
   If Objeto.ID_EMPRESA.AsFloat <> 0 Then Begin
      Objeto.Tramite.BuscaWhereString :=' ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                                        ' AND SIT_TRAMITE=''AC''';
      Objeto.Tramite.FilterString := Objeto.Tramite.BuscaWhereString;
   End;
   Objeto.Tramite.ShowAll := True;   
   If Objeto.Tramite.Busca Then Begin
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

procedure TWMRelDocTr.btDOCUMENTOClick(Sender: TObject);
begin

   Objeto.ID_EMPRESA.GetFromControl;
   If Objeto.ID_EMPRESA.AsFloat <> 0 Then Begin
      Objeto.Doctos.BuscaWhereString :=' ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                                       ' AND SIT_DOCUMENTO = ''AC''';
      Objeto.Doctos.FilterString := Objeto.Doctos.BuscaWhereString;
   End;
   Objeto.Doctos.ShowAll := True;   
   If Objeto.Doctos.Busca Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMRelDocTr.edINSTRUC_ADICExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edINSTRUC_ADIC,True,CNULL,True);
end;

procedure TWMRelDocTr.ilTramiteCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRelDocTr.ilDocumentoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRelDocTr.ilTramiteEjecuta(Sender: TObject);
begin
   If Objeto.Tramite.FindKey([Objeto.ID_EMPRESA.AsString,ilTramite.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

procedure TWMRelDocTr.ilDocumentoEjecuta(Sender: TObject);
begin
   If Objeto.Doctos.FindKey([Objeto.ID_EMPRESA.AsString,ilDocumento.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMRelDocTr.cbB_OBLIGATORIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_OBLIGATORIO,True,CNULL,True);
end;

procedure TWMRelDocTr.cbB_REQ_ORIGINALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_REQ_ORIGINAL,True,CNULL,True);
end;

procedure TWMRelDocTr.cbB_EXCEPTUARExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_EXCEPTUAR,True,CNULL,True);
end;

procedure TWMRelDocTr.edID_EMPRESAChange(Sender: TObject);
begin
   If Objeto.Empresa.Active Then
      Objeto.Empresa.Active:=False;
   If Objeto.Doctos.Active Then
      Objeto.Doctos.Active:=False;
   If Objeto.Tramite.Active Then
      Objeto.Tramite.Active:=False;
End;

Function TWMRelDocTr.Verificar:Boolean;
Var
   sSQL:String;
   qyQuery:TQuery;
Begin
   Verificar:= True;
   sSQL :=' SELECT * FROM DO_REL_TRAM_DOC ' +
          '  WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
          '    AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL +
          '    AND CVE_DOCUMENTO ='+ Objeto.CVE_DOCUMENTO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      ShowMessage('El registro ya existe');
      Verificar:= False;
      qyQuery.Free;
   End Else
      Verificar:=True;
End;
end.
