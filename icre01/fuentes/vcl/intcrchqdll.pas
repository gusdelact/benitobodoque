// Sistema         : Clase de CR_CHQRA_DLLS
// Fecha de Inicio : 07/04/2004
// Función forma   : Clase de CR_CHQRA_DLLS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrChqDll;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//Clases Adiciopnales

IntPers,//persona
IntInter, //intermediario
IntLinkit,
IntGenCre,
IntParamCre
;

Type
 TCrChqDll= class;

  TWCrChqraDlls=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA : TLabel;
    edID_PERSONA : TEdit;
    lbID_BANCO_CHQRA : TLabel;
    edID_BANCO_CHQRA : TEdit;
    lbCUENTA_BANCO : TLabel; 
    edCUENTA_BANCO : TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE: TEdit;
    edNombreIntermediario: TEdit;
    btBANCO: TBitBtn;
    gpDATOS_CHEQRA: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    edFFC: TMemo;
    edABA: TEdit;
    edPLAZA: TEdit;
    edTX_REFERENCIA: TMemo;
    edNombrePlaza: TEdit;
    rgSIT_CUENTA: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
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
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    Label6: TLabel;
    ilBANCO: TInterLinkit;
    ilPERSONA: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilPERSONAEjecuta(Sender: TObject);
    procedure ilPERSONACapture(Sender: TObject; var Show: Boolean);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure btBANCOClick(Sender: TObject);
    procedure ilBANCOEjecuta(Sender: TObject);
    procedure ilBANCOCapture(Sender: TObject; var Show: Boolean);
    procedure btBANCOExit(Sender: TObject);
    procedure edCUENTA_BANCOExit(Sender: TObject);
    procedure edABAExit(Sender: TObject);
    procedure edPLAZAExit(Sender: TObject);
    procedure edNombrePlazaExit(Sender: TObject);
    procedure edFFCExit(Sender: TObject);
    procedure edTX_REFERENCIAExit(Sender: TObject);
    procedure rgSIT_CUENTAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private 
    { Private declarations }
       Procedure MuestraHints; 
    public 
    { Public declarations } 
    Objeto : TCrChqDll;
end; 
 TCrChqDll= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ID_PERSONA               : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        ABA                      : TInterCampo;
        PLAZA                    : TInterCampo;
        FFC                      : TInterCampo;
        TX_REFERENCIA            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_CUENTA               : TInterCampo;
        NOMBRE_PLAZA             : TInterCampo;

        ParamCre                 : TParamCre;
        Persona                  : TPersona;
        Intermediario            : TIntermed;

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


constructor TCrChqDll.Create( AOwner : TComponent );
begin Inherited; 
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Cliente';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,True);
                ID_BANCO_CHQRA.Caption:='Banco';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
                CUENTA_BANCO.Caption:='Cuenta';
      ABA :=CreaCampo('ABA',ftString,tsNinguno,tsNinguno,True);
                ABA.Caption:='ABA';
      PLAZA :=CreaCampo('PLAZA',ftString,tsNinguno,tsNinguno,True);
                PLAZA.Caption:='Plaza';
      FFC :=CreaCampo('FFC',ftString,tsNinguno,tsNinguno,True);
                FFC.Caption:='FFC';
      TX_REFERENCIA :=CreaCampo('TX_REFERENCIA',ftString,tsNinguno,tsNinguno,True);
                TX_REFERENCIA.Caption:='Referencia';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      SIT_CUENTA :=CreaCampo('SIT_CUENTA',ftString,tsNinguno,tsNinguno,True);
      With SIT_CUENTA do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
      end;
                SIT_CUENTA.Caption:='Situación';
      NOMBRE_PLAZA :=CreaCampo('NOMBRE_PLAZA',ftString,tsNinguno,tsNinguno,True);
                SIT_CUENTA.Caption:='Nombre Plaza';
      FKeyFields.Add('ID_PERSONA');
      FKeyFields.Add('ID_BANCO_CHQRA');
      FKeyFields.Add('CUENTA_BANCO');

      TableName := 'CR_CHQRA_DLLS';
      UseQuery := True;
      HelpFile := 'IntCrChqDll.Hlp';
      ShowMenuReporte:=True;

      Persona:= TPersona.Create(Self);
      Persona.MasterSource := Self;
      Persona.ID_Persona.MasterField := 'ID_PERSONA';
      Persona.FilterBy := fbNinguno;

      Intermediario:= TIntermed.Create(Self);
      Intermediario.MasterSource := Self;
      Intermediario.Id_Intermediario.MasterField := 'ID_BANCO_CHQRA';
      Intermediario.BuscaWhereString:= 'Sit_Intermed = ''AC'' and cve_tipo_interm = ''BA'' and SIT_INTERMED = ''AC''';
      Intermediario.FilterString := Intermediario.BuscaWhereString;

end;

Destructor TCrChqDll.Destroy;
begin
   if Persona <> nil then
      Persona.Free;
   //end if
   if Intermediario <> nil then
     Intermediario.Free;
   //end if;

    inherited;
end;


function TCrChqDll.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrChqraDlls;
begin
   W:=TWCrChqraDlls.Create(Self);
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


Function TCrChqDll.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrChDl.it','F,F,S');
      Try if Active then begin T.Param(0,ID_PERSONA.AsString); 
                               T.Param(1,ID_BANCO_CHQRA.AsString);
                               T.Param(2,CUENTA_BANCO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrChqDll.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CHQRA_DLLS********************)
(*                                                                              *)
(*  FORMA DE CR_CHQRA_DLLS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CHQRA_DLLS********************)

procedure TWCrChqraDlls.FormShow(Sender: TObject);
begin
     //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_PERSONA.Control:=edID_PERSONA;
      Objeto.ID_BANCO_CHQRA.Control:=edID_BANCO_CHQRA;
      Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
      Objeto.ABA.Control:=edABA;
      Objeto.PLAZA.Control:=edPLAZA;
      Objeto.FFC.Control:=edFFC;
      Objeto.TX_REFERENCIA.Control:=edTX_REFERENCIA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.SIT_CUENTA.Control:=rgSIT_CUENTA;
      Objeto.NOMBRE_PLAZA.Control:=edNombrePlaza;

      Objeto.Persona.Nombre.Control := edNOMBRE;
      Objeto.Persona.GetParams(Objeto);

      Objeto.Intermediario.Persona.Nombre.Control := edNombreIntermediario;
      Objeto.Intermediario.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrChqraDlls.FormDestroy(Sender: TObject);
begin
      Objeto.ID_PERSONA.Control:=nil;
      Objeto.ID_BANCO_CHQRA.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
      Objeto.ABA.Control:=nil;
      Objeto.PLAZA.Control:=nil;
      Objeto.FFC.Control:=nil;
      Objeto.TX_REFERENCIA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SIT_CUENTA.Control:=nil;
      Objeto.NOMBRE_PLAZA.Control:=nil;

      Objeto.Persona.Nombre.Control := nil;
      Objeto.Persona.GetParams(Objeto);

      Objeto.Intermediario.Persona.Nombre.Control := nil;
      Objeto.Intermediario.GetParams(Objeto);
end;

procedure TWCrChqraDlls.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrChqraDlls.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.SIT_CUENTA.AsString := 'AC';
   MuestraHints;
   edID_PERSONA.SetFocus;
end;

procedure TWCrChqraDlls.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edID_BANCO_CHQRA.SetFocus;
end;

procedure TWCrChqraDlls.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCHQDLL_CTE',True,True) then
   begin
       Objeto.Persona.ShowAll := True;
       if Objeto.Persona.Busca then
       Begin
          MuestraHints;
          InterForma1.NextTab(edID_PERSONA);
       end;
   end;
end;

procedure TWCrChqraDlls.ilPERSONAEjecuta(Sender: TObject);
begin
   if Objeto.Persona.FindKey([ilPERSONA.Buffer]) then
   Begin
      MuestraHints;
      InterForma1.NextTab(edID_PERSONA);
   end;
end;

procedure TWCrChqraDlls.ilPERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrChqraDlls.edID_PERSONAExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.ID_PERSONA.GetFromControl;
      if Objeto.ID_PERSONA.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar el Cliente';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edID_PERSONA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrChqraDlls.btBANCOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCHQDLL_INTERM',True,True) then
   begin
       Objeto.Intermediario.ShowAll := True;
       if Objeto.Intermediario.Busca then
       Begin
          MuestraHints;
          InterForma1.NextTab(edID_BANCO_CHQRA);
       end;
   end;
end;

procedure TWCrChqraDlls.ilBANCOEjecuta(Sender: TObject);
begin
   if Objeto.Intermediario.FindKey([ilBANCO.Buffer]) then
   Begin
      MuestraHints;
      InterForma1.NextTab(edID_BANCO_CHQRA);
   end;
end;

procedure TWCrChqraDlls.ilBANCOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrChqraDlls.btBANCOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.ID_BANCO_CHQRA.GetFromControl;
      if Objeto.ID_BANCO_CHQRA.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar intermediario';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edID_BANCO_CHQRA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrChqraDlls.edCUENTA_BANCOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.CUENTA_BANCO.GetFromControl;
      if Objeto.CUENTA_BANCO.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar el Número de Cuenta';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edCUENTA_BANCO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrChqraDlls.edABAExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.ABA.GetFromControl;
      if Objeto.ABA.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar el ABA';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edABA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrChqraDlls.edPLAZAExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.PLAZA.GetFromControl;
      if Objeto.PLAZA.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar la plaza';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edPLAZA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrChqraDlls.edNombrePlazaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNombrePlaza,True,CNULL,True);
end;

procedure TWCrChqraDlls.edFFCExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.FFC.GetFromControl;
      if Objeto.FFC.AsString = CNULL then
      Begin
         VLMsg := 'Favor de Indicar el FFC';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edFFC,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrChqraDlls.edTX_REFERENCIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_REFERENCIA,True,CNULL,True);
end;

procedure TWCrChqraDlls.rgSIT_CUENTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CUENTA,True,CNULL,True);
end;

procedure TWCrChqraDlls.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   // end if
end;

procedure TWCrChqraDlls.MuestraHints;
begin
   edNOMBRE.Hint := Objeto.Persona.Nombre.AsString;
   edNOMBRE.ShowHint := True;
   edNombreIntermediario.Hint := Objeto.Intermediario.Persona.Nombre.AsString;
   edNombreIntermediario.ShowHint := True;
   edNombrePlaza.Hint := Objeto.NOMBRE_PLAZA.AsString;
   edNombrePlaza.ShowHint := True;
   edFFC.Hint := Objeto.FFC.AsString;
   edFFC.ShowHint := True;
   edTX_REFERENCIA.Hint := Objeto.TX_REFERENCIA.AsString;
   edTX_REFERENCIA.ShowHint := True;
end;

procedure TWCrChqraDlls.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
      MuestraHints;
   //end
end;

procedure TWCrChqraDlls.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

end.
