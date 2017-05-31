// Sistema         : Clase de CrCtaCont
// Fecha de Inicio : 29/10/2013
// Función forma   : Clase de CrCtaCont
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrctacont;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit;

Type
 TCrctacont= class; 

  TWCrctacont=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    CBXCveDesc: TComboBox;
    edDesc: TInterEdit;
    dtpFECHA: TInterDateTimePicker;
    Label1: TLabel;
    Label25: TLabel;
    edF_INICIO: TEdit;
    Label27: TLabel;
    edUsuAlta: TInterEdit;
    Label4: TLabel;
    edCuenta: TInterEdit;
    edFECHAINI: TInterEdit;
    edF_ALTA: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure CBXCveDescChange(Sender: TObject);
    procedure edF_InicioChange(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edF_InicioExit(Sender: TObject);
    procedure dtpFECHAExit(Sender: TObject);
    procedure dtpFECHAEnter(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrctacont;
end; 
 TCrctacont= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        ParamCre     : TParamCre;

        CUENTA       : TInterCampo;
        CVE_CUENTA   : TInterCampo;
        F_INICIO     : TInterCampo;
        CVE_USU_ALTA : TInterCampo;
        FH_REGISTRO  : TInterCampo;

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


constructor TCrctacont.Create( AOwner : TComponent ); 
begin Inherited; 

      CUENTA := CreaCampo('CUENTA',ftInteger,tsNinguno,tsNinguno,True);
                           CUENTA.Caption := 'Cuenta Cont.';

      CVE_CUENTA := CreaCampo('CVE_CUENTA',ftString,tsNinguno,tsNinguno,True);
                                CVE_CUENTA.Caption := 'Cve. Cuenta';

       With CVE_CUENTA do
      begin Size := 4;
            UseCombo:=True;
            ComboLista.Add('PROV'); ComboDatos.Add('PROV');
            ComboLista.Add('CNEJ'); ComboDatos.Add('CNEJ');
            ComboLista.Add('GSTO'); ComboDatos.Add('GSTO');
      end;


      F_INICIO := CreaCampo('F_INICIO',ftDateTime,tsNinguno,tsNinguno,True);
                            F_INICIO.Caption := 'F. Inicio';

      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                            CVE_USU_ALTA.Caption := 'Usuario Alta';

      FH_REGISTRO := CreaCampo('FH_REGISTRO',ftDateTime,tsNinguno,tsNinguno,True);
                            FH_REGISTRO.Caption := 'F. Registro';



      FKeyFields.Add('CUENTA');
      FKeyFields.Add('CVE_CUENTA');
      TableName := 'CR_PPO_CAT_CTAS_CONT';
      StpName  := ' ';
      UseQuery := True;
      HelpFile := 'IntCrctacont.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCrctacont.Destroy;
begin inherited;
end;


function TCrctacont.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrctacont;
begin
   W:=TWCrctacont.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnEliminar := False;      
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrctacont.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
     T := CreaBuscador('ICRCTAPPO.IT','');
      Try if Active then begin
        T.Param(0,CUENTA.AsString);
//        T.Param(1,CVE_CUENTA.AsString);
        end;
          if T.Execute then InternalBusca := FindKey
          ([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrctacont.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrCtaCont********************)
(*                                                                              *)
(*  FORMA DE CrCtaCont                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCtaCont********************)

procedure TWCrctacont.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CUENTA.Control := edCuenta;
      Objeto.CVE_CUENTA.Control := CBXCveDesc;
      Objeto.F_INICIO.Control := edFECHAINI;
      Objeto.CVE_USU_ALTA.Control := edUsuAlta;
      Objeto.FH_REGISTRO.Control := edF_Alta;

end;

procedure TWCrctacont.FormDestroy(Sender: TObject);
begin
      Objeto.CUENTA.Control := nil;
      Objeto.CVE_CUENTA.Control := nil;
      Objeto.F_INICIO.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.FH_REGISTRO.Control := nil;
end;

procedure TWCrctacont.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrctacont.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.FH_REGISTRO.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      edDesc.Text := '';
      edCuenta.SetFocus;
end;

procedure TWCrctacont.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrctacont.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrctacont.CBXCveDescChange(Sender: TObject);
begin
  if CBXCveDesc.ItemIndex = 0 then
     edDesc.Text := 'Provisión Premio';
  if CBXCveDesc.ItemIndex = 1 then
     edDesc.Text := 'Provisión de Ejercicios Anteriores';
  if CBXCveDesc.ItemIndex = 2 then
     edDesc.Text := 'Gasto de Premio';

end;

procedure TWCrctacont.edF_InicioChange(Sender: TObject);
begin
  edFECHAINI.Text := edF_Inicio.Text;
end;

procedure TWCrctacont.InterForma1DespuesCancelar(Sender: TObject);
begin
  edDesc.Text := '';
end;

procedure TWCrctacont.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
end;


procedure TWCrctacont.edF_InicioExit(Sender: TObject);
begin
  edFECHAINI.Text := edF_Inicio.Text;
end;

procedure TWCrctacont.dtpFECHAExit(Sender: TObject);
begin
  edFECHAINI.Text := edF_Inicio.Text;
end;

procedure TWCrctacont.dtpFECHAEnter(Sender: TObject);
begin
  edFECHAINI.Text := edF_Inicio.Text;
end;

procedure TWCrctacont.InterForma1Buscar(Sender: TObject);
begin
     Objeto.ShowAll := True;
  if objeto.InternalBusca then
  begin
    objeto.FindKey([Objeto.CUENTA.AsString]);
  end;

end;

end.
