// Sistema         : Clase de DO_NVL_RIESGO
// Fecha de Inicio : 22/04/2004
// Función forma   : Clase de DO_NVL_RIESGO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMNRiesgo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers;

Type
 TMNRiesgo= class;

  TWMNRiesgo=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_EXCEPCION : TLabel;
    edDESC_NVL_RIESGO: TEdit;
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
    edCVE_NVL_RIESGO: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    rgSIT_NVL_RIESGO: TRadioGroup;
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
    procedure rgSIT_NVL_RIESGOExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_NVL_RIESGOExit(Sender: TObject);
    procedure edDESC_NVL_RIESGOExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMNRiesgo;
    end;

 TMNRiesgo= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        CVE_NVL_RIESGO           : TInterCampo;
        DESC_NVL_RIESGO          : TInterCampo;
        SIT_NVL_RIESGO           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;

        ParamCre                 : TParamCre;
        Empresa                  : TMPersona; //Empresa

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TMNRiesgo.Create( AOwner : TComponent );
begin Inherited;

   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:=False;
   CVE_NVL_RIESGO :=CreaCampo('CVE_NVL_RIESGO',ftString,tsNinguno,tsNinguno,True);
      CVE_NVL_RIESGO.Caption:='Clave de Nivel de Riesgo';
      CVE_NVL_RIESGO.NoCompare:=False;
   DESC_NVL_RIESGO :=CreaCampo('DESC_NVL_RIESGO',ftString,tsNinguno,tsNinguno,True);
      DESC_NVL_RIESGO.Caption:='Descripción de Nivel de Riesgo';
      DESC_NVL_RIESGO.NoCompare:=True;
   SIT_NVL_RIESGO :=CreaCampo('SIT_NVL_RIESGO',ftString,tsNinguno,tsNinguno,True);
   With SIT_NVL_RIESGO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   end;
      SIT_NVL_RIESGO.Caption:='Situación del Nivel de Riesgo';
      SIT_NVL_RIESGO.NoCompare:=True;
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
   FKeyFields.Add('CVE_NVL_RIESGO');
   TableName := 'DO_NVL_RIESGO';
   UseQuery := True;
   HelpFile := 'IntMNRiesgo.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';
end;

Destructor TMNRiesgo.Destroy;
Begin
   if Empresa <> nil then
      Empresa.Free;
   Inherited;
End;

Function TMNRiesgo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMNRiesgo;
begin
   W:=TWMNRiesgo.Create(Self);
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

Function TMNRiesgo.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMNRiesgo.it','F,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,CVE_NVL_RIESGO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMNRiesgo.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA DO_NVL_RIESGO********************)
(*                                                                              *)
(*  FORMA DE DO_NVL_RIESGO                                                             *)
(*                                                                              *)
(***********************************************FORMA DO_NVL_RIESGO********************)

procedure TWMNRiesgo.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_EMPRESA.Control       := edID_EMPRESA;
      CVE_NVL_RIESGO.Control   := edCVE_NVL_RIESGO;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      DESC_NVL_RIESGO.Control  := edDESC_NVL_RIESGO;
      SIT_NVL_RIESGO.Control   := rgSIT_NVL_RIESGO;
      InterForma1.MsgPanel     := PnlMsg;
   End;

   Objeto.Empresa.ID_Persona.Control :=edID_EMPRESA;
   Objeto.Empresa.Nombre.Control :=edNOM_EMPRESA;
   Objeto.Empresa.GetParams(Objeto);
   edNOM_EMPRESA.Hint := Objeto.Empresa.Nombre.AsString;
   edNOM_EMPRESA.ShowHint := True;
   Objeto.Empresa.GetParams(Objeto);
end;

procedure TWMNRiesgo.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := NIL;
      CVE_NVL_RIESGO.Control   := NIL;
      DESC_NVL_RIESGO.Control  := NIL;
      SIT_NVL_RIESGO.Control   := NIL;
      CVE_USU_ALTA.Control     := NIL;
      CVE_USU_MODIFICA.Control := NIL;
      F_ALTA.Control           := NIL;
      F_MODIFICA.Control       := NIL;
      InterForma1.MsgPanel     := NIL;
   End;
   Objeto.Empresa.Nombre.Control :=nil;
   Objeto.Empresa.ID_Persona.Control :=nil;
end;

procedure TWMNRiesgo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMNRiesgo.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWMNRiesgo.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);      
   End;
end;

procedure TWMNRiesgo.edID_EMPRESAExit(Sender: TObject);
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

procedure TWMNRiesgo.btEMPRESAClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMNRiesgo.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMNRiesgo.ilEMPRESAEjecuta(Sender: TObject);
begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMNRiesgo.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_NVL_RIESGO.ItemIndex:= 0;
   If Objeto.Empresa.FindKey([Objeto.Apli.IdEmpresa]) Then Begin
      Objeto.ID_EMPRESA.AsInteger := Objeto.Empresa.ID_Persona.AsInteger;
      edNOM_EMPRESA.Text:= Objeto.Empresa.Nombre.AsString;
   End;
   edID_EMPRESA.SetFocus;
end;

procedure TWMNRiesgo.rgSIT_NVL_RIESGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_NVL_RIESGO,True,CNULL,True);
end;

procedure TWMNRiesgo.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMNRiesgo.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMNRiesgo.edCVE_NVL_RIESGOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveTra  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_NVL_RIESGO.GetFromControl;

      If Objeto.CVE_NVL_RIESGO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Nivel de Riesgo';
      End Else Begin
         vlSql := ' SELECT * FROM DO_NVL_RIESGO ' +
                  ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                  ' AND CVE_NVL_RIESGO ='+ Objeto.CVE_NVL_RIESGO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_NVL_RIESGO',vlCveTra,False);
             If (vlCveTra <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del Nivel de Riesgo ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_NVL_RIESGO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMNRiesgo.edDESC_NVL_RIESGOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.DESC_NVL_RIESGO.GetFromControl;
      if Objeto.DESC_NVL_RIESGO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la descripción del Nivel de Riesgo';
      end;
      InterForma1.ValidaExit(edDESC_NVL_RIESGO,vlSalida,vlMsg,True);
   end;
end;

procedure TWMNRiesgo.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT DISTINCT CVE_NVL_RIESGO FROM DO_RECEP_EXC EXC, DO_NVL_RIESGO NVL '+
         '  WHERE NVL.ID_EMPRESA = '+ Objeto.ID_EMPRESA.AsSQL+
         '    AND NVL.CVE_NVL_RIESGO = '+ Objeto.CVE_NVL_RIESGO.AsSQL+
         '    AND EXC.ID_EMPRESA = NVL.ID_EMPRESA '+
         '    AND EXC.CVE_NVL_RIESGO = NVL.CVE_NVL_RIESGO ';
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
         If qyQuery.FieldByName('CVE_NVL_RIESGO').AsString = Objeto.CVE_NVL_RIESGO.AsString Then Begin
            ShowMessage('El Nivel de Riesgo '''+ Objeto.CVE_NVL_RIESGO.AsString+
                        ''' tiene registros asociados, No puede ser eliminado');
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
