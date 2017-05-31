// Sistema         : Clase de CR_EXCEPCION
// Fecha de Inicio : 26/05/2003
// Función forma   : Clase de CR_EXCEPCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrExcepci;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntGenCre, IntExpX, IntParamCre, IntCrCredito;

Type
 TCrExcepci= class;

  TWCrExcepcion=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbCVE_EXCEPCION : TLabel;
    edCVE_EXCEPCION : TEdit;
    lbF_INI_EXCEPCION : TLabel; 
    dtpF_INI_EXCEPCION : TInterDateTimePicker; 
    edF_INI_EXCEPCION : TEdit;
    lbF_FIN_EXCEPCION : TLabel; 
    dtpF_FIN_EXCEPCION : TInterDateTimePicker; 
    edF_FIN_EXCEPCION : TEdit;
    lbDESC_EXCEPCION : TLabel; 
    edDESC_EXCEPCION : TEdit;
    edDesc_Credito: TEdit;
    edEXC_DESC_EXCEPCION: TEdit;
    gbxSituacion: TGroupBox;
    opSit_Activa: TRadioButton;
    opSit_Cancelada: TRadioButton;
    btnId_Credito: TBitBtn;
    btnCve_Excepcion: TBitBtn;
    ILId_Credito: TInterLinkit;
    ILCve_Excepcion: TInterLinkit;
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
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnCve_ExcepcionClick(Sender: TObject);
    procedure ILCve_ExcepcionCapture(Sender: TObject; var Show: Boolean);
    procedure ILCve_ExcepcionEjecuta(Sender: TObject);
    procedure edID_CREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_EXCEPCIONExit(Sender: TObject);
    procedure edF_INI_EXCEPCIONExit(Sender: TObject);
    procedure edF_FIN_EXCEPCIONExit(Sender: TObject);
    procedure edDESC_EXCEPCIONExit(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure btnId_CreditoClick(Sender: TObject);
    procedure ILId_CreditoEjecuta(Sender: TObject);
    private
    { Private declarations }
      function Get_Situacion : String;
      procedure Set_Situacion(strValue : String);
    public
    { Public declarations }
      Objeto : TCrExcepci;
      property Situacion : String Read Get_Situacion Write Set_Situacion;
    end;
    
 TCrExcepci= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        CVE_EXCEPCION            : TInterCampo;
        F_INI_EXCEPCION          : TInterCampo;
        F_FIN_EXCEPCION          : TInterCampo;
        DESC_EXCEPCION           : TInterCampo;
        SIT_EXCEPCION            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        Excepcion                : TExpX;
        ParamCre                 : TParamCre;
        CrCredito                : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrExcepci.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      CVE_EXCEPCION :=CreaCampo('CVE_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
                CVE_EXCEPCION.Caption:='Clave de Excepcion';
      F_INI_EXCEPCION :=CreaCampo('F_INI_EXCEPCION',ftDate,tsNinguno,tsNinguno,True);
                F_INI_EXCEPCION.Caption:='Fecha Ini Excepcion';
      F_FIN_EXCEPCION :=CreaCampo('F_FIN_EXCEPCION',ftDate,tsNinguno,tsNinguno,True);
                F_FIN_EXCEPCION.Caption:='Fecha Fin Excepcion';
      DESC_EXCEPCION :=CreaCampo('DESC_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
                DESC_EXCEPCION.Caption:='Descripción Excepcion';
      SIT_EXCEPCION :=CreaCampo('SIT_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
                SIT_EXCEPCION.Caption:='Situación Excepcion';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('CVE_EXCEPCION');


      TableName := 'CR_EXCEPCION';
      UseQuery := True;
      HelpFile := 'IntCrExcepci.Hlp';
      ShowMenuReporte:=True;

      Excepcion := TExpX.Create(Self);
      Excepcion.MasterSource := Self;
      Excepcion.FieldByName('CVE_TIP_EXCEP').MasterField := 'CVE_EXCEPCION';

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      CrCredito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
end;

Destructor TCrExcepci.Destroy;
begin
   if Excepcion <> nil then
      Excepcion.Free;
   //end if

   if CrCredito <> nil then
      CrCredito.Free;
   //end if
 Inherited;
end;

function TCrExcepci.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrExcepcion;
begin
   W:=TWCrExcepcion.Create(Self);
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

Function TCrExcepci.InternalBusca:Boolean;
Var T : TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrExcep.it','F,S');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,CVE_EXCEPCION.AsString);
                               end;
          if T.Execute then
           InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrExcepci.Reporte:Boolean;
begin
  Result := False;
end;


(***********************************************FORMA CR_EXCEPCION********************)
(*                                                                              *)
(*  FORMA DE CR_EXCEPCION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EXCEPCION********************)

function TWCrExcepcion.Get_Situacion : String;
begin
  If (opSit_Activa.Checked) Then Result := CSIT_AC
  Else Result := CSIT_CA;
end;

procedure TWCrExcepcion.Set_Situacion(strValue : String);
begin
  opSit_Activa.Checked  := strValue = CSIT_AC;
  opSit_Cancelada.Checked := Not opSit_Activa.Checked;
end;

procedure TWCrExcepcion.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

 With Objeto Do
   Begin
     ID_CREDITO.Control       := edID_CREDITO;
     CVE_EXCEPCION.Control    := edCVE_EXCEPCION;
     F_INI_EXCEPCION.Control  := edF_INI_EXCEPCION;
     F_FIN_EXCEPCION.Control  := edF_FIN_EXCEPCION;
     DESC_EXCEPCION.Control   := edDESC_EXCEPCION;

     CrCredito.ContratoCre.Contrato.TITNombre.Control := edDesc_Credito;
     CrCredito.GetParams(Objeto);

     InterForma1.MsgPanel := PnlMsg;

     Excepcion.DESC_EXCEPCION.Control := edEXC_DESC_EXCEPCION;
     Excepcion.GetParams(Objeto);
   End;
end;

procedure TWCrExcepcion.FormDestroy(Sender: TObject);
begin
 With Objeto Do
   Begin
     ID_CREDITO.Control       :=  NIL;
     CVE_EXCEPCION.Control    :=  NIL;
     F_INI_EXCEPCION.Control  :=  NIL;
     F_FIN_EXCEPCION.Control  :=  NIL;
     DESC_EXCEPCION.Control   :=  NIL;

     CrCredito.ContratoCre.Contrato.TITNombre.Control := nil;
     InterForma1.MsgPanel     :=  NIL;
     Excepcion.DESC_EXCEPCION.Control := NIL;
   End;
end;

procedure TWCrExcepcion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrExcepcion.InterForma1DespuesNuevo(Sender: TObject);
begin edID_CREDITO.SetFocus;
end;

procedure TWCrExcepcion.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  Begin
    SIT_EXCEPCION.AsString := Situacion;
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           CVE_USU_ALTA.AsString := DameUsuario;
           F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           CVE_USU_MODIFICA.AsString := DameUsuario;
           F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
      end
      else Realizado := False;
   end

  End;
end;

procedure TWCrExcepcion.btnCve_ExcepcionClick(Sender: TObject);
begin
   Objeto.Excepcion.ShowAll := True;
   if Objeto.Excepcion.Busca then
      InterForma1.NextTab(edCVE_EXCEPCION);
   //end if
end;

procedure TWCrExcepcion.ILCve_ExcepcionCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrExcepcion.ILCve_ExcepcionEjecuta(Sender: TObject);
begin
  if Objeto.Excepcion.FindKey([ILCve_Excepcion.Buffer]) then
      InterForma1.NextTab(edCVE_EXCEPCION);
   //end if
end;

procedure TWCrExcepcion.edID_CREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWCrExcepcion.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
 opSit_Activa.Checked := True;
end;

procedure TWCrExcepcion.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  Begin
  InternalBusca;
  Situacion := SIT_EXCEPCION.AsString;
  Excepcion.FindKey([CVE_EXCEPCION.AsString]);
  End;
end;

procedure TWCrExcepcion.edID_CREDITOExit(Sender: TObject);
begin
 Objeto.ID_CREDITO.GetFromControl;
 InterForma1.ValidaExit(edID_CREDITO,Trim(Objeto.ID_CREDITO.AsString) <> '',
                       'Favor de indicar la disposición',True);
end;

procedure TWCrExcepcion.edCVE_EXCEPCIONExit(Sender: TObject);
begin
 Objeto.CVE_EXCEPCION.GetFromControl;
 InterForma1.ValidaExit(edCVE_EXCEPCION,Trim(Objeto.CVE_EXCEPCION.AsString) <> '',
                       'Favor de Indicar la Clave de Excepción',True);
end;

procedure TWCrExcepcion.edF_INI_EXCEPCIONExit(Sender: TObject);
begin
 Objeto.F_INI_EXCEPCION.GetFromControl;
 InterForma1.ValidaExit(edF_INI_EXCEPCION,Trim(Objeto.F_INI_EXCEPCION.AsString) <> '',
                        'Favor de Indicar la Fecha Inicio de Vigencia ',True);
end;

procedure TWCrExcepcion.edF_FIN_EXCEPCIONExit(Sender: TObject);
var bOk : Boolean;
begin
 With Objeto Do
  Begin
  F_FIN_EXCEPCION.GetFromControl;
  bOk := Trim(F_FIN_EXCEPCION.AsString) <> '';
  InterForma1.ValidaExit(edF_FIN_EXCEPCION,bOk,'Favor de Indicar la Fecha Fin de Vigencia ',True);
  If (bOk) Then
   InterForma1.ValidaExit(edF_FIN_EXCEPCION,StrToDate(F_FIN_EXCEPCION.AsString) > StrToDate(F_INI_EXCEPCION.AsString),
                         'La Fecha Fin de Vigencia debe ser Mayor a la Fecha de Inicio de Vigencia',True);
  End;
end;

procedure TWCrExcepcion.edDESC_EXCEPCIONExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edDESC_EXCEPCION,True,'',True);
end;

procedure TWCrExcepcion.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
 If gbxSituacion.CanFocus Then gbxSituacion.SetFocus;
end;

procedure TWCrExcepcion.InterForma1DespuesCancelar(Sender: TObject);
begin
 Situacion := Objeto.SIT_EXCEPCION.AsString;
end;

procedure TWCrExcepcion.btnId_CreditoClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   if Objeto.CrCredito.Busca then
      InterForma1.NextTab(edID_CREDITO);
   //end if
end;

procedure TWCrExcepcion.ILId_CreditoEjecuta(Sender: TObject);
begin
    if Objeto.CrCredito.FindKey([ILId_Credito.Buffer]) then
       InterForma1.NextTab(edID_CREDITO);
    //end if
end;

end.
