// Sistema         : Clase de CR_CT_FIRMA
// Fecha de Inicio : 21/05/2004
// Función forma   : Clase de CR_CT_FIRMA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCatFirma;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre;

Type
 TMCatFirma= class;

  TWMCatFirma=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_EXCEPCION : TLabel;
    edDESC_L_BLOQUE: TEdit;
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
    edCVE_FIRMA: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSIT_FIRMA: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_FIRMAExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_FIRMAExit(Sender: TObject);
    procedure edDESC_L_BLOQUEExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edCVE_FIRMAKeyPress(Sender: TObject; var Key: Char);
    procedure edDESC_L_BLOQUEKeyPress(Sender: TObject; var Key: Char);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMCatFirma;
    end;

 TMCatFirma= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_FIRMA           : TInterCampo;
        DESC_L_BLOQUE       : TInterCampo;
        SIT_FIRMA           : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        F_MODIFICA          : TInterCampo;

        ParamCre                 : TParamCre;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMCatFirma.Create( AOwner : TComponent );
begin Inherited;
   CVE_FIRMA :=CreaCampo('CVE_FIRMA',ftString,tsNinguno,tsNinguno,True);
      CVE_FIRMA.Caption:='Clave de Firma';
      CVE_FIRMA.NoCompare:= False;
   DESC_L_BLOQUE :=CreaCampo('DESC_L_BLOQUE',ftString,tsNinguno,tsNinguno,True);
      DESC_L_BLOQUE.Caption:='Descripción de Firma';
      DESC_L_BLOQUE.NoCompare:= True;
   SIT_FIRMA :=CreaCampo('SIT_FIRMA',ftString,tsNinguno,tsNinguno,True);
   With SIT_FIRMA do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_FIRMA.Caption:='Situación de Firma';
      SIT_FIRMA.NoCompare:= True;
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

   FKeyFields.Add('CVE_FIRMA');
   TableName := 'CR_CT_FIRMA';
   UseQuery := True;
   HelpFile := 'IntMCatFirma.Hlp';
   ShowMenuReporte:=True;

end;


Destructor TMCatFirma.Destroy;
begin
   Inherited;
end;

function TMCatFirma.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCatFirma;
begin
   W:=TWMCatFirma.Create(Self);
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

Function TMCatFirma.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMCatFirma.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_FIRMA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMCatFirma.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_CT_FIRMA********************)
(*                                                                              *)
(*  FORMA DE CR_CT_FIRMA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CT_FIRMA********************)

procedure TWMCatFirma.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_FIRMA.Control        := edCVE_FIRMA;
      DESC_L_BLOQUE.Control    := edDESC_L_BLOQUE;
      SIT_FIRMA.Control        := rgSIT_FIRMA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      F_MODIFICA.Control       := edF_MODIFICA;
      InterForma1.MsgPanel     := PnlMsg;
   End;

end;

procedure TWMCatFirma.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_FIRMA.Control        := Nil;
      DESC_L_BLOQUE.Control    := Nil;
      SIT_FIRMA.Control        := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
end;

procedure TWMCatFirma.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMCatFirma.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
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

procedure TWMCatFirma.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TWMCatFirma.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_FIRMA.ItemIndex:= 0;
   edCVE_FIRMA.SetFocus;
end;

procedure TWMCatFirma.rgSIT_FIRMAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_FIRMA,True,CNULL,True);
end;

procedure TWMCatFirma.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMCatFirma.edCVE_FIRMAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveDoc  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_FIRMA.GetFromControl;

      If Objeto.CVE_FIRMA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la Firma';
      End Else Begin
         vlSql := ' SELECT * FROM CR_CT_FIRMA ' +
                  ' WHERE CVE_FIRMA='+ Objeto.CVE_FIRMA.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_FIRMA',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave de la Firma ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_FIRMA,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCatFirma.edDESC_L_BLOQUEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_BLOQUE,True,CNULL,True);
end;

procedure TWMCatFirma.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT * FROM CR_CT_CONTRATO_C '+
         '  WHERE CVE_FIRMA ='+ Objeto.CVE_FIRMA.AsSQL ;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      ShowMessage('La Firma '''+ Objeto.CVE_FIRMA.AsString+
                  ''' tiene registros asociados, No puede ser eliminado');
      qyQuery.Free;
      Realizado:=False;
   End Else
      Realizado:=True;
end;
procedure TWMCatFirma.edCVE_FIRMAKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TWMCatFirma.edDESC_L_BLOQUEKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

end.
