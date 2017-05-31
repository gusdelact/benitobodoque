// Sistema         : Clase de CR_CCI_COMIS
// Fecha de Inicio : 05/11/2009
// Función forma   : Clase de CR_CCI_COMIS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCciComi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

IntGenCre,
IntParamCre,
IntCrUniTie,
IntCrCatComi,
//UNIDAD DE CALCULO DEL IVA
UnTasaimp
;

const
 CFAVOR = 'Favor de indicar el/la ';

Type
 TCrCciComi= class;

  TWCrCciComis=Class(TForm)
    InterForma1             : TInterForma;
    lbFH_ALTA : TLabel;
    edFH_ALTA : TEdit;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbCVE_COMISION : TLabel; 
    edCVE_COMISION : TEdit;
    lbF_VENCIMIENTO : TLabel; 
    dtpF_VENCIMIENTO : TInterDateTimePicker; 
    edF_VENCIMIENTO : TEdit;
    lbF_APLICACION : TLabel; 
    dtpF_APLICACION : TInterDateTimePicker; 
    edF_APLICACION : TEdit;
    lbIMP_COMISION : TLabel;
    lbIMP_IVA : TLabel;
    lbIMP_COMIS_PAG : TLabel;
    lbIMP_IVA_PAG : TLabel;
    lbCVE_USU_MODIFICA : TLabel;
    edCVE_USU_MODIFICA : TEdit;
    edIMP_COMISION: TInterEdit;
    edIMP_IVA: TInterEdit;
    rgSIT_COMISION: TRadioGroup;
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
    btCVE_COMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    ilCVE_COMISION: TInterLinkit;
    edIMP_COMIS_PAG: TInterEdit;
    edIMP_IVA_PAG: TInterEdit;
    lbPCT_COMISION: TLabel;
    rgCVE_TIPO_COBRO: TRadioGroup;
    lbCVE_UNIDAD_TIEMP: TLabel;
    edCVE_UNIDAD_TIEMP: TEdit;
    btCVE_UNIDAD_TIEMP: TBitBtn;
    edDESC_UNIDAD_TIEMP: TEdit;
    edPCT_COMISION: TInterEdit;
    ilCVE_UNIDAD_TIEMP: TInterLinkit;
    btnIVA: TButton;
    lbIMP_TOTAL_V: TLabel;
    lbIMP_TOTAL_PAG_V: TLabel;
    edIMP_TOTAL_V: TInterEdit;
    edIMP_TOTAL_PAG_V: TInterEdit;
    lbNUM_FACTURA: TLabel;
    edNUM_FACTURA: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilCVE_COMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_COMISIONEjecuta(Sender: TObject);
    procedure btCVE_COMISIONClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edCVE_COMISIONExit(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure edIMP_IVAExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edIMP_COMIS_PAGExit(Sender: TObject);
    procedure rgSIT_COMISIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_UNIDAD_TIEMPExit(Sender: TObject);
    procedure btCVE_UNIDAD_TIEMPClick(Sender: TObject);
    procedure ilCVE_UNIDAD_TIEMPEjecuta(Sender: TObject);
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure rgCVE_TIPO_COBROExit(Sender: TObject);
    procedure btnIVAClick(Sender: TObject);
    procedure btnIVAExit(Sender: TObject);
    procedure edNUM_FACTURAExit(Sender: TObject);
    procedure rgCVE_TIPO_COBROClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCciComi;

end;
 TCrCciComi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgID_CREDITO : Integer;
        vgIMP_CREDITO : Double;

        ID_CCI_COMIS             : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CVE_COMISION             : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        F_APLICACION             : TInterCampo;
        IMP_COMISION             : TInterCampo;
        IMP_IVA                  : TInterCampo;
        IMP_COMIS_PAG            : TInterCampo;
        IMP_IVA_PAG              : TInterCampo;
        SIT_COMISION             : TInterCampo;
        CVE_TIPO_COBRO           : TInterCampo;
        PCT_COMISION             : TInterCampo;
        CVE_UNIDAD_TIEMP         : TInterCampo;

        FH_ALTA                  : TInterCampo;
        FH_CANCELA               : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        CVE_USU_CANCELA          : TInterCampo;

        IMP_TOTAL_V              : TInterCampo;
        IMP_TOTAL_PAG_V          : TInterCampo;
        NUM_FACTURA              : TInterCampo;

        vgF_DISPOSICION_CCI      : TDateTime;

        Comisiones               : TCrCatComi;
        ParamCre                 : TParamCre;
        UnidadTiempo             : TCrUniTie;

        procedure CalculaTodo;
        procedure CalculaIVA;
        procedure CalculaComision;
        procedure CalculaTotal;
        procedure CalculaFVto;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;


// ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
var
  kTasaIVA : double;
//Fin HERJA IVA

implementation

{$R *.DFM}


constructor TCrCciComi.Create( AOwner : TComponent );
begin Inherited;
      ID_CCI_COMIS :=CreaCampo('ID_CCI_COMIS',ftInteger,tsNinguno,tsNinguno,True);

      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Clave de Comision';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      F_APLICACION :=CreaCampo('F_APLICACION',ftDate,tsNinguno,tsNinguno,True);
                F_APLICACION.Caption:='Fecha Aplicacion';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Imp Comision';
      IMP_IVA :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA.Caption:='Imp Iva';
      IMP_COMIS_PAG :=CreaCampo('IMP_COMIS_PAG',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMIS_PAG.Caption:='Imp Comis Pag';
      IMP_IVA_PAG :=CreaCampo('IMP_IVA_PAG',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA_PAG.Caption:='Imp Iva Pag';
      SIT_COMISION :=CreaCampo('SIT_COMISION',ftString,tsNinguno,tsNinguno,True);
                SIT_COMISION.Caption:='Situación Comision';
      NUM_FACTURA :=CreaCampo('NUM_FACTURA',ftString,tsNinguno,tsNinguno,True);
                NUM_FACTURA.Caption:='Número Factura';                
      CVE_TIPO_COBRO   :=CreaCampo('CVE_TIPO_COBRO',ftString,tsNinguno,tsNinguno,True);
      PCT_COMISION     :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
      CVE_UNIDAD_TIEMP :=CreaCampo('CVE_UNIDAD_TIEMP',ftString,tsNinguno,tsNinguno,True);

      FH_ALTA          :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_CANCELA       :=CreaCampo('FH_CANCELA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_MODIFICA      :=CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA     :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_CANCELA  :=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);

      IMP_TOTAL_V      :=CreaCampo('IMP_TOTAL_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOTAL_PAG_V  :=CreaCampo('IMP_TOTAL_PAG_V',ftFloat,tsNinguno,tsNinguno,False);

      FKeyFields.Add('ID_CCI_COMIS');

      With SIT_COMISION do
      Begin Size:=2;
           UseCombo:=True;
           ComboLista.Add('0'); ComboDatos.Add('PA');
           ComboLista.Add('1'); ComboDatos.Add('LQ');
           ComboLista.Add('2'); ComboDatos.Add('CA');
      End;

      With CVE_TIPO_COBRO do
      Begin Size:=2;
           UseCombo:=True;
           ComboLista.Add('0'); ComboDatos.Add('IN');
           ComboLista.Add('1'); ComboDatos.Add('VE');
      End;

      {$WARNINGS OFF}
      Comisiones := TCrCatComi.Create(Self);
      {$WARNINGS ON}
      Comisiones.MasterSource := self;

      {$WARNINGS OFF}
      UnidadTiempo := TCrUniTie.Create(Self);
      {$WARNINGS ON}
      UnidadTiempo.MasterSource := self;

      TableName := 'CR_CCI_COMIS';
      UseQuery := True;
      HelpFile := 'IntCrCciComi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCciComi.Destroy;
begin
  If Assigned(Comisiones) Then Comisiones.Free;
  If Assigned(UnidadTiempo) Then UnidadTiempo.Free;
  inherited;
end;


function TCrCciComi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCciComis;
begin
   W:=TWCrCciComis.Create(Self);
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

Function TCrCciComi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCcCo.it','F');
      Try if Active then begin T.Param(0,ID_CCI_COMIS.AsString);
                               end;
          if T.Execute then
             Begin
             InternalBusca := FindKey([T.DameCampo(0)]);
             End;
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CCI_COMIS********************)
(*                                                                              *)
(*  FORMA DE CR_CCI_COMIS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CCI_COMIS********************)

procedure TWCrCciComis.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
    kTasaIVA :=  StrtoFloat(fDameIVA(Apli))/100;
    //Fin HERJA IVA

    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    Comisiones.CVE_COMISION.Control := edCVE_COMISION;
    Comisiones.DESC_COMISION.Control := edDESC_COMISION;

    UnidadTiempo.CVE_UNIDAD_TIEMP.Control := edCVE_UNIDAD_TIEMP;
    UnidadTiempo.DESCRIPCION.Control := edDESC_UNIDAD_TIEMP;

    FH_ALTA.Control:=edFH_ALTA;
    ID_CREDITO.Control:=edID_CREDITO;
    CVE_COMISION.Control:=edCVE_COMISION;
    F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
    F_APLICACION.Control:=edF_APLICACION;
    IMP_COMISION.Control:=edIMP_COMISION;
    IMP_IVA.Control:=edIMP_IVA;
    IMP_COMIS_PAG.Control:=edIMP_COMIS_PAG;
    IMP_IVA_PAG.Control:=edIMP_IVA_PAG;
    SIT_COMISION.Control:=rgSIT_COMISION;
    CVE_TIPO_COBRO.Control:=rgCVE_TIPO_COBRO;
    PCT_COMISION.Control:=edPCT_COMISION;
    NUM_FACTURA.Control:=edNUM_FACTURA;    
    IMP_TOTAL_V.Control:=edIMP_TOTAL_V;
    IMP_TOTAL_PAG_V.Control:=edIMP_TOTAL_PAG_V;

    CVE_UNIDAD_TIEMP.Control:=edCVE_UNIDAD_TIEMP;
    CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

    Comisiones.FindKey([CVE_COMISION.AsString]);
    UnidadTiempo.FindKey([CVE_UNIDAD_TIEMP.AsString]);
    CalculaTodo;

    Interforma1.MsgPanel := MsgPanel;
    End;
end;

procedure TWCrCciComis.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    Comisiones.CVE_COMISION.Control := Nil;
    Comisiones.DESC_COMISION.Control := Nil;

    UnidadTiempo.CVE_UNIDAD_TIEMP.Control := Nil;
    UnidadTiempo.DESCRIPCION.Control := Nil;

    FH_ALTA.Control:=Nil;
    ID_CREDITO.Control:=Nil;
    CVE_COMISION.Control:=Nil;
    F_VENCIMIENTO.Control:=Nil;
    F_APLICACION.Control:=Nil;
    IMP_COMISION.Control:=Nil;
    IMP_IVA.Control:=Nil;
    IMP_COMIS_PAG.Control:=Nil;
    IMP_IVA_PAG.Control:=Nil;
    SIT_COMISION.Control:=Nil;
    CVE_TIPO_COBRO.Control:=Nil;
    PCT_COMISION.Control:=Nil;
    NUM_FACTURA.Control:=Nil;
    IMP_TOTAL_V.Control:=Nil;
    IMP_TOTAL_PAG_V.Control:=Nil;

    CVE_UNIDAD_TIEMP.Control:=Nil;
    CVE_USU_MODIFICA.Control:=Nil;

    Interforma1.MsgPanel := MsgPanel;    
    End;
end;

procedure TWCrCciComis.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCciComis.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_COMISION.CanFocus Then edCVE_COMISION.SetFocus;
      Objeto.ID_CREDITO.AsInteger := Objeto.vgID_CREDITO;
      Objeto.SIT_COMISION.AsString := 'PA';
      Objeto.CVE_TIPO_COBRO.AsString := 'IN';
end;

procedure TWCrCciComis.InterForma1DespuesModificar(Sender: TObject);
begin If edCVE_COMISION.CanFocus Then edCVE_COMISION.SetFocus;
      Objeto.ID_CREDITO.AsInteger := Objeto.vgID_CREDITO;
end;

procedure TWCrCciComis.ilCVE_COMISIONCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrCciComis.ilCVE_COMISIONEjecuta(Sender: TObject);
begin
  Objeto.Comisiones.FindKey([ilCVE_COMISION.Buffer]);
end;

procedure TWCrCciComis.btCVE_COMISIONClick(Sender: TObject);
begin
  Objeto.Comisiones.ShowAll := true;
  Objeto.Comisiones.Busca;
end;

procedure TWCrCciComis.InterForma1DespuesAceptar(Sender: TObject);
begin
  With Objeto Do
    Begin
      If Modo = moAppend Then
        Begin
        FH_ALTA.AsDateTime := Now;
        CVE_USU_MODIFICA.AsString := Objeto.DameUsuario;
        End;
    End;
end;

procedure TWCrCciComis.edCVE_COMISIONExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     sText : String;
     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
  Begin
    sText := edCVE_COMISION.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbCVE_COMISION.Caption;
    End
    Else
    Begin
      Try
         CVE_COMISION.GetFromControl;
         bfind := Comisiones.FindKey([sText]);
         If not bFind Then
         Begin
            vlbSalida := False;
            vlStrMesg := 'El campo '+lbCVE_COMISION.Caption+' no es válido. Favor de verificar';
         End;
      Except
        On EInterFrame Do
        Begin
          vlbSalida := False;
          vlStrMesg := 'El '+lbCVE_COMISION.Caption+' no es válido. Favor de verificar';
        End;
      End;
    End;
  End;
  InterForma1.ValidaExit(edCVE_COMISION, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciComis.edIMP_COMISIONExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    IMP_COMISION.GetFromControl;
    If (IMP_COMISION.AsFloat = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbIMP_COMISION.Caption;
       End
    Else If (IMP_COMISION.AsFloat < 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'El ' +lbIMP_COMISION.Caption + ' no puede ser negativo.';
       End
    Else
       Objeto.CalculaTodo;
    End;
  InterForma1.ValidaExit(edIMP_COMISION, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciComis.edIMP_IVAExit(Sender: TObject);
Begin
  InterForma1.ValidaExit(edIMP_IVA, True, '', True);
end;

procedure TWCrCciComis.edF_VENCIMIENTOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    F_VENCIMIENTO.GetFromControl;
    If (F_VENCIMIENTO.AsDateTime = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbF_VENCIMIENTO.Caption;
       End;
    End;
  InterForma1.ValidaExit(edF_VENCIMIENTO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciComis.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
   Begin
   Comisiones.FindKey([CVE_COMISION.AsString]);
   UnidadTiempo.FindKey([CVE_UNIDAD_TIEMP.AsString]);
   End;
end;

procedure TWCrCciComis.edIMP_COMIS_PAGExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg  :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    IMP_COMISION.GetFromControl;
    IMP_COMIS_PAG.GetFromControl;
    IMP_IVA.GetFromControl;
    IMP_IVA_PAG.GetFromControl;
    F_APLICACION.GetFromControl;

    If ((IMP_COMIS_PAG.AsFloat + IMP_IVA_PAG.AsFloat) > 0) And (Trim(edF_APLICACION.Text) = '') Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbF_APLICACION.Caption;
       End
    Else If (IMP_COMIS_PAG.AsFloat = 0) And (Trim(edF_APLICACION.Text) <> '') Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbIMP_COMIS_PAG.Caption;
       End
    Else If ((IMP_COMISION.AsFloat - IMP_COMIS_PAG.AsFloat) < 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'El ' + lbIMP_COMIS_PAG.Caption + ' no puede ser mayor que el importe de comisión.';
       If (MessageDlg(vlStrMesg+coCRLF+'¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         Begin
         vlbSalida := True;
         vlStrMesg := '';
         End;
       End
    Else If ((IMP_IVA.AsFloat - IMP_IVA_PAG.AsFloat) < 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'El ' + lbIMP_IVA_PAG.Caption + ' no puede ser mayor que el importe de comisión.';
       End
    Else If ((IMP_COMISION.AsFloat - IMP_COMIS_PAG.AsFloat) = 0) Then
       Begin
       SIT_COMISION.AsString := 'LQ';
       End
    Else If (SIT_COMISION.AsString = 'LQ') And ((IMP_COMISION.AsFloat - IMP_COMIS_PAG.AsFloat) <> 0) Then
       Begin
       SIT_COMISION.AsString := 'PA';
       End;
    CalculaTotal;
    End;
  InterForma1.ValidaExit(Sender As TWinControl, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciComis.rgSIT_COMISIONExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgSIT_COMISION, True, '', True);
end;

procedure TWCrCciComis.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlStrMsg : String;
begin
  With Objeto Do
    Begin
      If Modo = moAppend Then
        Begin
        ID_CCI_COMIS.AsInteger := ObtenFolio('CRCCICOM', vlStrMsg, Apli);
        FH_ALTA.AsDateTime := Now;
        CVE_USU_ALTA.AsString := Objeto.DameUsuario;
        End
       Else If Modo = moEdit Then
        Begin
         SIT_COMISION.GetFromControl;
         If (SIT_COMISION.AsString = 'CA') Then
            Begin
            FH_CANCELA.AsDateTime := Now;
            CVE_USU_CANCELA.AsString := Objeto.DameUsuario;
            End
          Else
            Begin
            FH_MODIFICA.AsDateTime := Now;
            CVE_USU_MODIFICA.AsString := Objeto.DameUsuario;
            End;
        End;
    End;
end;

procedure TWCrCciComis.edCVE_UNIDAD_TIEMPExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
//     sText : String;
//     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
 { With Objeto Do
  Begin
    sText := edCVE_UNIDAD_TIEMP.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbCVE_UNIDAD_TIEMP.Caption;
    End
    Else
    Begin
      Try
         CVE_UNIDAD_TIEMP.GetFromControl;
         bfind := UnidadTiempo.FindKey([sText]);
         If not bFind Then
           Begin
           vlbSalida := False;
           vlStrMesg := 'El campo '+lbCVE_UNIDAD_TIEMP.Caption+' no es válido. Favor de verificar';
           End
         Else
           CalculaFVto;
      Except
        On EInterFrame Do
        Begin
          vlbSalida := False;
          vlStrMesg := 'El '+lbCVE_UNIDAD_TIEMP.Caption+' no es válido. Favor de verificar';
        End;
      End;
    End;
  End;
  }
  Objeto.CalculaComision;
  InterForma1.ValidaExit(edCVE_UNIDAD_TIEMP, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciComis.btCVE_UNIDAD_TIEMPClick(Sender: TObject);
begin
 With Objeto Do
   If UnidadTiempo.Busca Then
     CalculaFVto;
end;

procedure TWCrCciComis.ilCVE_UNIDAD_TIEMPEjecuta(Sender: TObject);
begin
  Objeto.UnidadTiempo.FindKey([ilCVE_UNIDAD_TIEMP.Buffer]);
end;

procedure TWCrCciComis.edPCT_COMISIONExit(Sender: TObject);
begin
  With Objeto Do
    Begin
    CalculaComision;
    InterForma1.ValidaExit(edPCT_COMISION, True, '', True);
    End;
end;

procedure TWCrCciComis.rgCVE_TIPO_COBROExit(Sender: TObject);
begin
  With Objeto Do
    Begin
    CalculaFVto;
    End;
  InterForma1.ValidaExit(rgCVE_TIPO_COBRO, True, '', True);
end;

procedure TWCrCciComis.btnIVAClick(Sender: TObject);
begin
  Objeto.CalculaIVA;
end;

procedure TWCrCciComis.btnIVAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(btnIVA, True, '', True);
end;

procedure TCrCciComi.CalculaIVA;
begin
  If ((Modo = moAppend) Or (Modo = moEdit)) Then
    Begin
       //CORRECCION DE IVA DE 15 A 16
       //ASTECI HERJA 16/12/2009
       //IMP_IVA.AsFloat := IMP_COMISION.AsFloat * 0.15;
         IMP_IVA.AsFloat := IMP_COMISION.AsFloat * kTasaIVA;
       //FIN DE CORRECCION
    End;
end;

procedure TCrCciComi.CalculaComision;
var vlIMP_COMISION : Real;
begin
  PCT_COMISION.GetFromControl;

  If (PCT_COMISION.AsFloat <> 0) Then
    Begin
    vlIMP_COMISION := vgIMP_CREDITO * PCT_COMISION.AsFloat / 100;

    If (Trim(UnidadTiempo.CVE_UNIDAD_TIEMP.AsString) <> '')  Then
      Begin
      vlIMP_COMISION := (vlIMP_COMISION / (12 / (UnidadTiempo.NUM_DIAS.AsInteger / 30)));
      End;

    IMP_COMISION.AsFloat := vlIMP_COMISION;
    CalculaTodo;
    End;
end;

procedure TWCrCciComis.edNUM_FACTURAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_FACTURA, True, '', True);
end;

procedure TCrCciComi.CalculaTotal;
begin
  IMP_TOTAL_V.AsFloat := IMP_COMISION.AsFloat + IMP_IVA.AsFloat;
  IMP_TOTAL_PAG_V.AsFloat := IMP_COMIS_PAG.AsFloat + IMP_IVA_PAG.AsFloat;
end;

procedure TCrCciComi.CalculaTodo;
begin
  CalculaIVA;
  CalculaTotal;
end;

procedure TCrCciComi.CalculaFVto;
begin
  If ((Modo = moAppend) Or (Modo = moEdit)) Then
    Begin
    CVE_TIPO_COBRO.GetFromControl;
    If (F_VENCIMIENTO.AsDateTime = 0)Then
      If (CVE_TIPO_COBRO.AsString = 'IN') Then
         Begin
         F_VENCIMIENTO.AsDateTime := vgF_DISPOSICION_CCI;
         End
      Else
         Begin
         F_VENCIMIENTO.AsDateTime := vgF_DISPOSICION_CCI + UnidadTiempo.NUM_DIAS.AsInteger;
         End;
      End;
end;

procedure TWCrCciComis.rgCVE_TIPO_COBROClick(Sender: TObject);
begin
  Objeto.CalculaFVto;
end;

end.
