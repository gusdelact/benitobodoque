// Sistema         : Clase de DO_PERFIL_USUAR
// Fecha de Inicio : 29/04/2004
// Función forma   : Clase de DO_PERFIL_USUAR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMPerfUsu;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers, IntMTramite,IntSecGpAcc,
IntMDoctos;

Type
 TMPerfUsu= class;

  TWMPerfUsu=Class(TForm)
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
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    Label5: TLabel;
    edCVE_TRAMITE: TEdit;
    btTRAMITE: TBitBtn;
    edTRAMITE: TEdit;
    ilTramite: TInterLinkit;
    lbCVE_GPO_ACCESO: TLabel;
    edCVE_GPO_ACCESO: TEdit;
    btnCVE_GPO_ACCESO: TBitBtn;
    edNOM_GPO_ACCESO: TEdit;
    ILCVE_GPO_ACCESO: TInterLinkit;
    Label1: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btDOCUMENTO: TBitBtn;
    edDOCUMENTO: TEdit;
    ilDocumento: TInterLinkit;
    cbxB_AUTORIZA: TCheckBox;
    cbxB_EXCEPTUA: TCheckBox;
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
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_TRAMITEExit(Sender: TObject);
    procedure btTRAMITEClick(Sender: TObject);
    procedure ilTramiteCapture(Sender: TObject; var Show: Boolean);
    procedure ilTramiteEjecuta(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edCVE_GPO_ACCESOExit(Sender: TObject);
    procedure btnCVE_GPO_ACCESOClick(Sender: TObject);
    procedure ILCVE_GPO_ACCESOCapture(Sender: TObject; var Show: Boolean);
    procedure ILCVE_GPO_ACCESOEjecuta(Sender: TObject);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure btDOCUMENTOClick(Sender: TObject);
    procedure ilDocumentoCapture(Sender: TObject; var Show: Boolean);
    procedure ilDocumentoEjecuta(Sender: TObject);
    procedure cbxB_AUTORIZAExit(Sender: TObject);
    procedure cbxB_EXCEPTUAExit(Sender: TObject);

    private
    { Private declarations }
      Function Verificar:Boolean;
    public
    { Public declarations }
      Objeto : TMPerfUsu;
    end;

 TMPerfUsu= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA       : TInterCampo;
        CVE_GPO_ACCESO   : TInterCampo;
        CVE_TRAMITE      : TInterCampo;
        CVE_DOCUMENTO    : TInterCampo;
        B_AUTORIZA       : TInterCampo;
        B_EXCEPTUA       : TInterCampo;
        CVE_USU_ALTA     : TInterCampo;
        F_ALTA           : TInterCampo;
        CVE_USU_MODIFICA : TInterCampo;
        F_MODIFICA       : TInterCampo;

        ParamCre         : TParamCre;
        Empresa          : TMPersona;
        Tramite          : TMTramite;
        Perfil           : TSecGpAcc;
        Doctos           : TMDoctos;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TMPerfUsu.Create( AOwner : TComponent );
begin Inherited;

   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:= False;
   CVE_GPO_ACCESO :=CreaCampo('CVE_GPO_ACCESO',ftString,tsNinguno,tsNinguno,True);
      CVE_GPO_ACCESO.Caption:='Clave de Grupo de Acceso';
      CVE_GPO_ACCESO.NoCompare:= False;
   CVE_TRAMITE :=CreaCampo('CVE_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      CVE_TRAMITE.Caption:='Clave de Trámites';
      CVE_TRAMITE.NoCompare:= False;
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      CVE_DOCUMENTO.Caption:='Clave de Documento';
      CVE_DOCUMENTO.NoCompare:= False;
   B_AUTORIZA :=CreaCampo('B_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
      B_AUTORIZA.Caption:='Indica si puede Autorizar';
      B_AUTORIZA.NoCompare:= True;
   B_EXCEPTUA :=CreaCampo('B_EXCEPTUA',ftString,tsNinguno,tsNinguno,True);
      B_EXCEPTUA.Caption:='Indica si puede Exceptuar';
      B_EXCEPTUA.NoCompare:= True;
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

   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('CVE_GPO_ACCESO');
   FKeyFields.Add('CVE_TRAMITE');
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DO_PERFIL_USUAR';
   UseQuery := True;
   HelpFile := 'IntMPerfUsu.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';

   Tramite:= TMTramite.Create(Self);
   Tramite.MasterSource := Self;
   Tramite.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';
   Tramite.FieldByName('CVE_TRAMITE').MasterField := 'CVE_TRAMITE';

   Perfil := TSecGpAcc.Create(Self);
   Perfil.MasterSource := Self;

   Doctos:= TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';
   
end;


Destructor TMPerfUsu.Destroy;
begin
   If Empresa <> Nil Then
      Empresa.Free;
   If Tramite <> Nil Then
      Tramite.Free;
   If Perfil <> Nil Then
      Perfil.Free;
   If Doctos <> Nil Then
      Doctos.Free;
   Inherited;
end;

function TMPerfUsu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMPerfUsu;
begin
   W:=TWMPerfUsu.Create(Self);
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

Function TMPerfUsu.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMPerfUsu.it','F,S,S,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,CVE_GPO_ACCESO.AsString);
         T.Param(2,CVE_TRAMITE.AsString);
         T.Param(3,CVE_DOCUMENTO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
   finally
      T.Free;
   end;
end;

function TMPerfUsu.Reporte:Boolean;
begin
   Result := False;
end;
(***********************************************FORMA DO_PERFIL_USUAR********************)
(*                                                                              *)
(*  FORMA DE DO_PERFIL_USUAR                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_PERFIL_USUAR********************)

procedure TWMPerfUsu.FormShow(Sender: TObject);
begin

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_EMPRESA.Control       := edID_EMPRESA;
      CVE_GPO_ACCESO.Control   := edCVE_GPO_ACCESO;
      CVE_TRAMITE.Control      := edCVE_TRAMITE;
      CVE_DOCUMENTO.Control    := edCVE_DOCUMENTO;
      B_AUTORIZA.Control       := cbxB_AUTORIZA;
      B_EXCEPTUA.Control       := cbxB_EXCEPTUA;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      InterForma1.MsgPanel     := PnlMsg;

      Perfil.CVE_APLICACION.AsString := Apli.Apli;
      Perfil.NOM_GPO_ACCESO.Control := edNOM_GPO_ACCESO;
//      Perfil.Perfil.NOM_GPO_ACCESO.Control := edNOM_GPO_ACCESO;
      Perfil.BuscaWhereString := 'SECU_GPO_ACCESO.CVE_APLICACION = '#39+Apli.Apli+#39;
   End;

   Objeto.Empresa.ID_Persona.Control :=edID_EMPRESA;
   Objeto.Empresa.Nombre.Control :=edNOM_EMPRESA;
   Objeto.Empresa.GetParams(Objeto);
   edNOM_EMPRESA.Hint := Objeto.Empresa.Nombre.AsString;
   edNOM_EMPRESA.ShowHint := True;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.Tramite.CVE_TRAMITE.Control := edCVE_TRAMITE;
   Objeto.Tramite.DESC_C_TRAMITE.Control := edTRAMITE;
   Objeto.Tramite.GetParams(Objeto);

   Objeto.Doctos.CVE_DOCUMENTO.Control := edCVE_DOCUMENTO;
   Objeto.Doctos.DESC_DOCUMENTO.Control := edDOCUMENTO;
   Objeto.Doctos.GetParams(Objeto);
end;

procedure TWMPerfUsu.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := Nil;
      CVE_GPO_ACCESO.Control   := Nil;
      CVE_TRAMITE.Control      := Nil;
      CVE_DOCUMENTO.Control    := Nil;
      B_AUTORIZA.Control       := Nil;
      B_EXCEPTUA.Control       := Nil;
      CVE_USU_ALTA.Control     := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_ALTA.Control           := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;

      Perfil.NOM_GPO_ACCESO.Control := nil;
      //Perfil.Perfil.NOM_GPO_ACCESO.Control:=nil;
   End;
   Objeto.Empresa.Nombre.Control :=nil;
   Objeto.Empresa.ID_Persona.Control :=nil;

   Objeto.Tramite.CVE_TRAMITE.Control := Nil;
   Objeto.Tramite.DESC_C_TRAMITE.Control := Nil;

   Objeto.Doctos.CVE_DOCUMENTO.Control  := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control := Nil;

end;

procedure TWMPerfUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMPerfUsu.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWMPerfUsu.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);
      Tramite.FindKey([ID_EMPRESA.AsString,CVE_TRAMITE.AsString]);
      Doctos.FindKey([ID_EMPRESA.AsString,CVE_DOCUMENTO.AsString]);
   End;
end;

procedure TWMPerfUsu.edID_EMPRESAExit(Sender: TObject);
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

procedure TWMPerfUsu.btEMPRESAClick(Sender: TObject);
begin
   With Objeto Do Begin
      Empresa.ShowAll := True;
      If Empresa.Busca Then Begin
         InterForma1.NextTab(edID_EMPRESA);
      End;
   End;
end;

procedure TWMPerfUsu.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMPerfUsu.ilEMPRESAEjecuta(Sender: TObject);
begin
   With Objeto Do Begin
      If Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
         InterForma1.NextTab(edID_EMPRESA);
      End;
   End;
end;

procedure TWMPerfUsu.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   If Objeto.Empresa.FindKey([Objeto.Apli.IdEmpresa]) Then Begin
      Objeto.ID_EMPRESA.AsInteger := Objeto.Empresa.ID_Persona.AsInteger;
      edNOM_EMPRESA.Text:= Objeto.Empresa.Nombre.AsString;
   End;
   edID_EMPRESA.SetFocus;
end;

procedure TWMPerfUsu.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMPerfUsu.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMPerfUsu.edCVE_TRAMITEExit(Sender: TObject);
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
      End;
      InterForma1.ValidaExit(edCVE_TRAMITE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMPerfUsu.btTRAMITEClick(Sender: TObject);
begin
   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.Tramite.BuscaWhereString :='ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                     ' AND CVE_TRAMITE IN (SELECT CVE_TRAMITE '+
                     '                       FROM DO_REL_TRAM_DOC '+
                     '                      WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
                     '                        AND SIT_REL_TRAM_DO =''AC'')'+
                     ' AND SIT_TRAMITE = ''AC''';
   Objeto.Tramite.FilterString := Objeto.Tramite.BuscaWhereString;
   Objeto.Tramite.ShowAll := True;
   If Objeto.Tramite.Busca Then Begin
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

procedure TWMPerfUsu.ilTramiteCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMPerfUsu.ilTramiteEjecuta(Sender: TObject);
begin
   With Objeto Do Begin
      If Tramite.FindKey([ID_EMPRESA.AsInteger,ilTramite.Buffer]) Then Begin
         InterForma1.NextTab(edCVE_TRAMITE);
      End;
   End;
end;

procedure TWMPerfUsu.InterForma1DespuesAceptar(Sender: TObject);
begin
   edNOM_GPO_ACCESO.Hint := Objeto.Perfil.NOM_GPO_ACCESO.AsString;
   edNOM_GPO_ACCESO.ShowHint := True;
end;

procedure TWMPerfUsu.edCVE_GPO_ACCESOExit(Sender: TObject);
var  VLSalida  :  boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_GPO_ACCESO.GetFromControl;
         if Objeto.CVE_GPO_ACCESO.AsString = '' then
         Begin
//            ShowMessage('Favor de Indicar la Clave del Atributo');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_GPO_ACCESO,VLSalida,'',True);
      end;
end;

procedure TWMPerfUsu.btnCVE_GPO_ACCESOClick(Sender: TObject);
begin
   With Objeto Do Begin
      Perfil.ShowAll := True;
      If Perfil.Busca Then Begin
         CVE_GPO_ACCESO.AsInteger := Perfil.ID_GPO_ACCESO.AsInteger;

         InterForma1.NextTab(edCVE_GPO_ACCESO);
      end;
   end;
end;

procedure TWMPerfUsu.ILCVE_GPO_ACCESOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWMPerfUsu.ILCVE_GPO_ACCESOEjecuta(Sender: TObject);
begin
   With Objeto Do Begin
      If Perfil.FindKey([Apli.Apli,ILCVE_GPO_ACCESO.Buffer]) Then Begin
         CVE_GPO_ACCESO.AsInteger := Perfil.ID_GPO_ACCESO.AsInteger;
         InterForma1.NextTab(edCVE_GPO_ACCESO);
      end;
   end;
end;

procedure TWMPerfUsu.edCVE_DOCUMENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveTra  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_DOCUMENTO.GetFromControl;

      If Objeto.CVE_DOCUMENTO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la Clave del Documento';
      End;
      InterForma1.ValidaExit(edCVE_DOCUMENTO,vlSalida,vlMsg,True);
   End;

end;

procedure TWMPerfUsu.btDOCUMENTOClick(Sender: TObject);
begin
   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.CVE_TRAMITE.GetFromControl;
   Objeto.Doctos.BuscaWhereString :='ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                     ' AND CVE_DOCUMENTO IN (SELECT CVE_DOCUMENTO '+
                     '                       FROM DO_REL_TRAM_DOC '+
                     '                      WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
                     '                        AND CVE_TRAMITE = '+ Objeto.CVE_TRAMITE.AsSQL+
                     '                        AND SIT_REL_TRAM_DO =''AC'')'+
                     ' AND SIT_DOCUMENTO = ''AC''';
   Objeto.Doctos.FilterString := Objeto.Doctos.BuscaWhereString;
   Objeto.Doctos.ShowAll := True;
   If Objeto.Doctos.Busca Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMPerfUsu.ilDocumentoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMPerfUsu.ilDocumentoEjecuta(Sender: TObject);
begin
   With Objeto Do Begin
      If Doctos.FindKey([ID_EMPRESA.AsString,ilDocumento.Buffer]) Then Begin
         InterForma1.NextTab(edCVE_DOCUMENTO);
      End;
   End;
end;

procedure TWMPerfUsu.cbxB_AUTORIZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_AUTORIZA,True,CNULL,True);
end;

procedure TWMPerfUsu.cbxB_EXCEPTUAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_EXCEPTUA,True,CNULL,True);
end;

Function TWMPerfUsu.Verificar:Boolean;
Var
   sSQL:String;
   qyQuery:TQuery;
Begin
   Verificar:= True;
   sSQL:= ' SELECT * FROM DO_PERFIL_USUAR '+
          '  WHERE ID_EMPRESA='+ Objeto.ID_EMPRESA.AsSQL+
          '    AND CVE_GPO_ACCESO ='+ Objeto.CVE_GPO_ACCESO.AsSQL+
          '    AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL+
          '    AND CVE_DOCUMENTO='+ Objeto.CVE_DOCUMENTO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      ShowMessage('El registro ya existe');
      Verificar:= False;
      qyQuery.Free;
   End Else
      Verificar:=True;
End;
end.
