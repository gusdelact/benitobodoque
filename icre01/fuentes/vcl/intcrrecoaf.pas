// Sistema         : Clase de CR_REL_CON_AFEC
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_REL_CON_AFEC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrReCoAf;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, IntLinkit, IntCrReOpCo, IntCrAfectac;

Type
 TCrReCoAf= class;

  TWCrRelConAfec=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_OPERACION : TLabel; 
    edCVE_OPERACION : TEdit;
    lbCVE_CONCEPTO : TLabel; 
    edCVE_CONCEPTO : TEdit;
    lbCVE_TIPO_MOVTO : TLabel; 
    cbCVE_TIPO_MOVTO : TComboBox;
    lbCVE_AFECTACION : TLabel; 
    edCVE_AFECTACION : TEdit; 
    rgCVE_AFECTA_SDO : TRadioGroup; 
    chB_MULTIPERIODO : TCheckBox;
    lbID_SECUENCIA : TLabel; 
    edID_SECUENCIA : TEdit;
    chB_ASIGNA_FECHA : TCheckBox; 
    chB_ASIGNA_SIT : TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btOPERACION: TBitBtn;
    edDESC_OPER: TEdit;
    edDESC_CONCEPTO: TEdit;
    btAFECTACION: TBitBtn;
    ilAFECTACION: TInterLinkit;
    edDESC_AFECTACION: TEdit;
    ilOPERACION: TInterLinkit;
    Label32: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btOPERACIONClick(Sender: TObject);
    procedure ilOPERACIONEjecuta(Sender: TObject);
    procedure ilOPERACIONCapture(Sender: TObject; var Show: Boolean);
    procedure btAFECTACIONClick(Sender: TObject);
    procedure ilAFECTACIONEjecuta(Sender: TObject);
    procedure ilAFECTACIONCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPERACIONExit(Sender: TObject);
    procedure edCVE_AFECTACIONExit(Sender: TObject);
    procedure cbCVE_TIPO_MOVTOExit(Sender: TObject);
    procedure edID_SECUENCIAExit(Sender: TObject);
    procedure rgCVE_AFECTA_SDOExit(Sender: TObject);
    procedure chB_MULTIPERIODOExit(Sender: TObject);
    procedure chB_ASIGNA_FECHAExit(Sender: TObject);
    procedure chB_ASIGNA_SITExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrReCoAf;
end; 
 TCrReCoAf= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_OPERACION            : TInterCampo;
        CVE_CONCEPTO             : TInterCampo;
        CVE_TIPO_MOVTO           : TInterCampo;
        CVE_AFECTACION           : TInterCampo;
        CVE_AFECTA_SDO           : TInterCampo;
        B_MULTIPERIODO           : TInterCampo;
        ID_SECUENCIA             : TInterCampo;
        B_ASIGNA_FECHA           : TInterCampo;
        B_ASIGNA_SIT             : TInterCampo;

        ParamCre                 : TParamCre;
        RelOperConcept           : TCrReOpCo;
        Afectacion               : TCrAfectac;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrReCoAf.Create( AOwner : TComponent );
begin Inherited;
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave Operación';
      CVE_CONCEPTO :=CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_CONCEPTO.Caption:='Clave Concepto';
      CVE_TIPO_MOVTO :=CreaCampo('CVE_TIPO_MOVTO',ftString,tsNinguno,tsNinguno,True);
          With CVE_TIPO_MOVTO do
          Begin Size := 2;
                UseCombo := True;
                ComboLista.Add('MISMO DIA');  ComboDatos.Add('MD');
                ComboLista.Add('ANTICIPADA'); ComboDatos.Add('AN');
                ComboLista.Add('IMPAGADA');   ComboDatos.Add('IM');
                //RABA JUN 2015
                ComboLista.Add('MISMO DIA VENCIDA');   ComboDatos.Add('MV');
                ComboLista.Add('ANTICIPADA VENCIDA');   ComboDatos.Add('AV');
                ComboLista.Add('IMPAGADA VENCIDA');   ComboDatos.Add('IV');
                //RABA JUN 2015
          End;
                CVE_TIPO_MOVTO.Caption:='Tipo Movimiento';
      CVE_AFECTACION :=CreaCampo('CVE_AFECTACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AFECTACION.Caption:='Clave Afectación';
      CVE_AFECTA_SDO :=CreaCampo('CVE_AFECTA_SDO',ftString,tsNinguno,tsNinguno,True);
          With CVE_AFECTA_SDO do
          Begin Size := 1;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add('I');
                ComboLista.Add('1'); ComboDatos.Add('D');
          End;
                CVE_AFECTA_SDO.Caption:='Clave Afecta Saldo';
      B_MULTIPERIODO :=CreaCampo('B_MULTIPERIODO',ftString,tsNinguno,tsNinguno,True);
                B_MULTIPERIODO.Caption:='Multiperiodo';
      ID_SECUENCIA :=CreaCampo('ID_SECUENCIA',ftFloat,tsNinguno,tsNinguno,True);
                ID_SECUENCIA.Caption:='No.Secuencia';
      B_ASIGNA_FECHA :=CreaCampo('B_ASIGNA_FECHA',ftString,tsNinguno,tsNinguno,True);
                B_ASIGNA_FECHA.Caption:='Asigna Fecha';
      B_ASIGNA_SIT :=CreaCampo('B_ASIGNA_SIT',ftString,tsNinguno,tsNinguno,True);
                B_ASIGNA_SIT.Caption:='Asigna Situación';
      FKeyFields.Add('CVE_OPERACION');
      FKeyFields.Add('CVE_CONCEPTO');
      FKeyFields.Add('CVE_TIPO_MOVTO');
      FKeyFields.Add('CVE_AFECTACION');

      TableName := 'CR_REL_CON_AFEC';
      UseQuery := True;
      HelpFile := 'IntCrReCoAf.Hlp';
      ShowMenuReporte:=True;

      RelOperConcept := TCrReOpCo.Create(self);
      RelOperConcept.MasterSource := self;
      RelOperConcept.FieldByName('CVE_OPERACION').MasterField := 'CVE_OPERACION';
      RelOperConcept.FieldByName('CVE_CONCEPTO').MasterField := 'CVE_CONCEPTO';

      Afectacion := TCrAfectac.Create(self);
      Afectacion.MasterSource := self;
      Afectacion.FieldByName('CVE_AFECTACION').MasterField := 'CVE_AFECTACION';
end;

Destructor TCrReCoAf.Destroy;
begin
      if RelOperConcept <> nil then
         RelOperConcept.Free;
      //en if

      if Afectacion <> nil then
         Afectacion.Free;
      //en if

      inherited;
end;


function TCrReCoAf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelConAfec;
begin
   W:=TWCrRelConAfec.Create(Self);
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


Function TCrReCoAf.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrReCA.it','S,S,S,S');
      Try if Active then begin T.Param(0,CVE_OPERACION.AsString); 
                               T.Param(1,CVE_CONCEPTO.AsString); 
                               T.Param(2,CVE_TIPO_MOVTO.AsString); 
                               T.Param(3,CVE_AFECTACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_REL_CON_AFEC********************)
(*                                                                              *)
(*  FORMA DE CR_REL_CON_AFEC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_CON_AFEC********************)

procedure TWCrRelConAfec.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.CVE_TIPO_MOVTO.Control:=cbCVE_TIPO_MOVTO;
      Objeto.CVE_AFECTACION.Control:=edCVE_AFECTACION;
      Objeto.CVE_AFECTA_SDO.Control:=rgCVE_AFECTA_SDO;
      Objeto.B_MULTIPERIODO.Control:=chB_MULTIPERIODO;
      Objeto.ID_SECUENCIA.Control:=edID_SECUENCIA;
      Objeto.B_ASIGNA_FECHA.Control:=chB_ASIGNA_FECHA;
      Objeto.B_ASIGNA_SIT.Control:=chB_ASIGNA_SIT;

      Objeto.RelOperConcept.Operacion.DESC_C_OPERACION.Control := edDESC_OPER;
      Objeto.RelOperConcept.CVE_CONCEPTO.Control := edCVE_CONCEPTO;
      Objeto.RelOperConcept.Concepto.DESC_C_CONCEPTO.Control := edDESC_CONCEPTO;
      Objeto.RelOperConcept.GetParams(Objeto);

      Objeto.Afectacion.DESC_AFECTACION.Control := edDESC_AFECTACION;
      Objeto.Afectacion.GetParams(Objeto);
end;

procedure TWCrRelConAfec.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.CVE_TIPO_MOVTO.Control:=nil;
      Objeto.CVE_AFECTACION.Control:=nil;
      Objeto.CVE_AFECTA_SDO.Control:=nil;
      Objeto.B_MULTIPERIODO.Control:=nil;
      Objeto.ID_SECUENCIA.Control:=nil;
      Objeto.B_ASIGNA_FECHA.Control:=nil;
      Objeto.B_ASIGNA_SIT.Control:=nil;

      Objeto.RelOperConcept.Operacion.DESC_C_OPERACION.Control := nil;
      Objeto.RelOperConcept.CVE_CONCEPTO.Control := nil;
      Objeto.RelOperConcept.Concepto.DESC_C_CONCEPTO.Control := nil;

      Objeto.Afectacion.DESC_AFECTACION.Control := nil;
   //Objeto
end;

procedure TWCrRelConAfec.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelConAfec.InterForma1DespuesNuevo(Sender: TObject);
begin   rgCVE_AFECTA_SDO.ItemIndex := 0;
        MuestraHints;
        edCVE_OPERACION.SetFocus;
end;

procedure TWCrRelConAfec.InterForma1DespuesModificar(Sender: TObject);
begin cbCVE_TIPO_MOVTO.SetFocus;
end;


procedure TWCrRelConAfec.btOPERACIONClick(Sender: TObject);
begin
   Objeto.RelOperConcept.ShowAll := True;
   if Objeto.RelOperConcept.Busca then
      InterForma1.NextTab(edCVE_OPERACION);
   //end if
end;

procedure TWCrRelConAfec.ilOPERACIONEjecuta(Sender: TObject);
begin
   if Objeto.RelOperConcept.FindKey([ilOPERACION.Buffer]) then
      InterForma1.NextTab(edCVE_OPERACION);
   //end if
end;

procedure TWCrRelConAfec.ilOPERACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelConAfec.btAFECTACIONClick(Sender: TObject);
begin
   Objeto.Afectacion.ShowAll := True;
   if Objeto.Afectacion.Busca then
      InterForma1.NextTab(edCVE_AFECTACION);
   //end if
end;

procedure TWCrRelConAfec.ilAFECTACIONEjecuta(Sender: TObject);
begin
   if Objeto.Afectacion.FindKey([ilAFECTACION.Buffer]) then
       InterForma1.NextTab(edCVE_AFECTACION);
   //end if
end;

procedure TWCrRelConAfec.ilAFECTACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelConAfec.edCVE_OPERACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg     := '';
      Objeto.CVE_OPERACION.GetFromControl;
      if Objeto.CVE_OPERACION.AsString = '' then
      Begin
         ShowMessage('Favor de Indicar la Clave de Operación');
         VlSalida   := False;
      end; //end if
      InterForma1.ValidaExit(edCVE_OPERACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrRelConAfec.edCVE_AFECTACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      Objeto.CVE_AFECTACION.GetFromControl;
      if Objeto.CVE_AFECTACION.AsString = '' then
      Begin
         ShowMessage('Favor de Indicar la Clave de Afectación');
         VlSalida   := False;
      end; //end if
      InterForma1.ValidaExit(edCVE_AFECTACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrRelConAfec.cbCVE_TIPO_MOVTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbCVE_TIPO_MOVTO,True,'',True);
end;

procedure TWCrRelConAfec.edID_SECUENCIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_SECUENCIA,True,'',True);
end;

procedure TWCrRelConAfec.rgCVE_AFECTA_SDOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_AFECTA_SDO,True,'',True);
end;

procedure TWCrRelConAfec.chB_MULTIPERIODOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_MULTIPERIODO,True,'',True);
end;

procedure TWCrRelConAfec.chB_ASIGNA_FECHAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ASIGNA_FECHA,True,'',True);
end;

procedure TWCrRelConAfec.chB_ASIGNA_SITExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ASIGNA_SIT,True,'',True);
end;

Procedure TWCrRelConAfec.MuestraHints;
Begin
      edDESC_OPER.Hint := Objeto.RelOperConcept.Operacion.DESC_C_OPERACION.AsString;
      edDESC_OPER.ShowHint := True;
      edDESC_CONCEPTO.Hint := Objeto.RelOperConcept.Concepto.DESC_C_CONCEPTO.AsString;
      edDESC_CONCEPTO.ShowHint := True;
      edCVE_AFECTACION.Hint := Objeto.Afectacion.DESC_AFECTACION.AsString;
      edCVE_AFECTACION.ShowHint := True;
End;

procedure TWCrRelConAfec.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrRelConAfec.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrRelConAfec.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
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
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

end.
