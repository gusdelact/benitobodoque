// Sistema         : Clase de CR_BIT_SEGUIMIENTO
// Fecha de Inicio : 30/07/2003
// Función forma   : Clase de CR_BIT_SEGUIMIENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrBitSgui;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

//Unidades Adicionales
IntParamCre, IntGenCre,
IntCrSeguimi,
IntCrCredito
;

Type
 TCrBitSgui= class;

  TWCrBitSeguimient=Class(TForm)
    InterForma1             : TInterForma;
    lbF_COBRANZA : TLabel; 
    dtpF_COBRANZA : TInterDateTimePicker; 
    edF_COBRANZA : TEdit;
    lbID_SEGUIMIENTO : TLabel; 
    edID_SEGUIMIENTO : TEdit;
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit; 
    rgCVE_TIPO_PAGO : TRadioGroup;
    lbCVE_SEGUIMIENTO : TLabel; 
    edCVE_SEGUIMIENTO : TEdit;
    lbID_GRUPO_PAGO : TLabel; 
    edID_GRUPO_PAGO : TEdit;
    lbIMP_TOTAL : TLabel; 
    IedIMP_TOTAL : TInterEdit;
    lbID_FOLIO_TESO : TLabel; 
    edID_FOLIO_TESO : TEdit;
    lbID_FOLIO_DV : TLabel;
    edID_FOLIO_DV : TEdit;
    lbREF_EXTERNA : TLabel; 
    edREF_EXTERNA : TEdit;
    lbTX_DESC_INSTRUC : TLabel; 
    edTX_DESC_INSTRUC : TEdit;
    lbID_COD_RESP : TLabel; 
    edID_COD_RESP : TEdit; 
    rgSIT_SEGUIMIENTO : TRadioGroup;
    btCREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    btCVE_SEGUIMIENTO: TBitBtn;
    edDESC_SEGUIMIENTO: TEdit;
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
    ilCREDITO: TInterLinkit;
    ilSEGUIMIENTO: TInterLinkit;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    lbUSUA_AUTOR: TLabel;
    lbF_AUTOR: TLabel;
    edF_ALTA: TEdit;
    edF_MODIF: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    edCVE_USUA_AUTOR: TEdit;
    edF_AUTOR: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure btCVE_SEGUIMIENTOClick(Sender: TObject);
    procedure ilSEGUIMIENTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilSEGUIMIENTOEjecuta(Sender: TObject);
    procedure edF_COBRANZAExit(Sender: TObject);
    procedure edID_SEGUIMIENTOExit(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edCVE_SEGUIMIENTOExit(Sender: TObject);
    procedure edID_GRUPO_PAGOExit(Sender: TObject);
    procedure IedIMP_TOTALExit(Sender: TObject);
    procedure rgCVE_TIPO_PAGOExit(Sender: TObject);
    procedure edID_FOLIO_TESOExit(Sender: TObject);
    procedure edREF_EXTERNAExit(Sender: TObject);
    procedure edTX_DESC_INSTRUCExit(Sender: TObject);
    procedure edID_COD_RESPExit(Sender: TObject);
    procedure rgSIT_SEGUIMIENTOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TCrBitSgui;
end; 
 TCrBitSgui= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        F_COBRANZA               : TInterCampo;
        ID_SEGUIMIENTO           : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CVE_TIPO_PAGO            : TInterCampo;
        CVE_SEGUIMIENTO          : TInterCampo;
        ID_GRUPO_PAGO            : TInterCampo;
        IMP_TOTAL                : TInterCampo;
        ID_FOLIO_TESO            : TInterCampo;
        ID_FOLIO_DV              : TInterCampo;
        REF_EXTERNA              : TInterCampo;
        TX_DESC_INSTRUC          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_AUTORIZA               : TInterCampo;
        CVE_USU_AUTO             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        ID_COD_RESP              : TInterCampo;
        SIT_SEGUIMIENTO          : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;
        Seguimiento              : TCrSeguimi;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrBitSgui.Create( AOwner : TComponent );
begin Inherited;
      F_COBRANZA :=CreaCampo('F_COBRANZA',ftDate,tsNinguno,tsNinguno,True);
                F_COBRANZA.Caption:='Fecha Cobranza';
      ID_SEGUIMIENTO :=CreaCampo('ID_SEGUIMIENTO',ftFloat,tsNinguno,tsNinguno,True);
                ID_SEGUIMIENTO.Caption:='Id Seguimiento';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Disposición';
      CVE_TIPO_PAGO :=CreaCampo('CVE_TIPO_PAGO',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIPO_PAGO do
      begin Size:=2;
            UseCombo:=True;                       //Constantes en IntGenCre
            ComboLista.Add('0');      ComboDatos.Add(CPROGRAMADO);
            ComboLista.Add('1');      ComboDatos.Add(CANTICIPADO);
            ComboLista.Add('2');      ComboDatos.Add(CIMPAGADO);
      end;
                CVE_TIPO_PAGO.Caption:='Tipo Pago';
      CVE_SEGUIMIENTO :=CreaCampo('CVE_SEGUIMIENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_SEGUIMIENTO.Caption:='Cve Seguimiento';
      ID_GRUPO_PAGO :=CreaCampo('ID_GRUPO_PAGO',ftFloat,tsNinguno,tsNinguno,True);
                ID_GRUPO_PAGO.Caption:='Grupo Pago';
      IMP_TOTAL :=CreaCampo('IMP_TOTAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_TOTAL.Caption:='Importe Total';
      ID_FOLIO_TESO :=CreaCampo('ID_FOLIO_TESO',ftFloat,tsNinguno,tsNinguno,True);
                ID_FOLIO_TESO.Caption:='Folio Teso';
      ID_FOLIO_DV :=CreaCampo('ID_FOLIO_DV',ftFloat,tsNinguno,tsNinguno,True);
                ID_FOLIO_DV.Caption:='Folio DV';
      REF_EXTERNA :=CreaCampo('REF_EXTERNA',ftString,tsNinguno,tsNinguno,True);
                REF_EXTERNA.Caption:='Ref. Externa';
      TX_DESC_INSTRUC :=CreaCampo('TX_DESC_INSTRUC',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_INSTRUC.Caption:='Descripción';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_AUTORIZA :=CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,True);
                F_AUTORIZA.Caption:='Fecha Autoriza';
      CVE_USU_AUTO :=CreaCampo('CVE_USU_AUTO',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTO.Caption:='Clave de Usu Auto';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      ID_COD_RESP :=CreaCampo('ID_COD_RESP',ftFloat,tsNinguno,tsNinguno,True);
                ID_COD_RESP.Caption:='Código Resp.';
      SIT_SEGUIMIENTO :=CreaCampo('SIT_SEGUIMIENTO',ftString,tsNinguno,tsNinguno,True);
      With SIT_SEGUIMIENTO do
      begin Size:=2;
            UseCombo:=True;                       //Constantes en IntGenCre
            ComboLista.Add('0');      ComboDatos.Add(CSIT_ID);
            ComboLista.Add('1');      ComboDatos.Add(CSIT_NI);
            ComboLista.Add('2');      ComboDatos.Add(CSIT_CA);
      end;
                SIT_SEGUIMIENTO.Caption:='Situación Seguimiento';
      FKeyFields.Add('F_COBRANZA');
      FKeyFields.Add('ID_SEGUIMIENTO');

      TableName := 'CR_BIT_SEGUIMIENTO';
      UseQuery := True;
      HelpFile := 'IntCrBitSgui.Hlp';
      ShowMenuReporte:=True;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Seguimiento := TCrSeguimi.Create(Self);
      Seguimiento.MasterSource:=Self;
      Seguimiento.FieldByName('CVE_SEGUIMIENTO').MasterField:='CVE_SEGUIMIENTO';
end;

Destructor TCrBitSgui.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
   //end if

   if Seguimiento <> nil then
      Seguimiento.Free;
   //end if

   inherited;
end;


function TCrBitSgui.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBitSeguimient;
begin
   W:=TWCrBitSeguimient.Create(Self);
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

Function TCrBitSgui.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrBiSe.it','D,F');
      Try if Active then begin T.Param(0,F_COBRANZA.AsString);
                               T.Param(1,ID_SEGUIMIENTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_BIT_SEGUIMIENTO********************)
(*                                                                              *)
(*  FORMA DE CR_BIT_SEGUIMIENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_BIT_SEGUIMIENTO********************)

procedure TWCrBitSeguimient.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.F_COBRANZA.Control:=edF_COBRANZA;
      Objeto.ID_SEGUIMIENTO.Control:=edID_SEGUIMIENTO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CVE_TIPO_PAGO.Control:=rgCVE_TIPO_PAGO;
      Objeto.CVE_SEGUIMIENTO.Control:=edCVE_SEGUIMIENTO;
      Objeto.ID_GRUPO_PAGO.Control:=edID_GRUPO_PAGO;
      Objeto.IMP_TOTAL.Control:=IedIMP_TOTAL;
      Objeto.ID_FOLIO_TESO.Control:=edID_FOLIO_TESO;
      Objeto.ID_FOLIO_DV.Control:=edID_FOLIO_DV;
      Objeto.REF_EXTERNA.Control:=edREF_EXTERNA;
      Objeto.TX_DESC_INSTRUC.Control:=edTX_DESC_INSTRUC;
      Objeto.ID_COD_RESP.Control:=edID_COD_RESP;
      Objeto.SIT_SEGUIMIENTO.Control:=rgSIT_SEGUIMIENTO;
      Objeto.F_ALTA.Control :=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control :=edCVE_USUA_ALTA;
      Objeto.F_AUTORIZA.Control :=edF_AUTOR;
      Objeto.CVE_USU_AUTO.Control :=edCVE_USUA_AUTOR;
      Objeto.F_MODIFICA.Control :=edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;

      Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.ID_CREDITO.AsString := Objeto.Credito.ID_CREDITO.AsString;
      Objeto.Credito.ContratoCre.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Objeto.Credito.GetParams(Objeto);

      Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := edDESC_SEGUIMIENTO;
      Objeto.Seguimiento.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrBitSeguimient.FormDestroy(Sender: TObject);
begin
      Objeto.F_COBRANZA.Control:=nil;
      Objeto.ID_SEGUIMIENTO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CVE_TIPO_PAGO.Control:=nil;
      Objeto.CVE_SEGUIMIENTO.Control:=nil;
      Objeto.ID_GRUPO_PAGO.Control:=nil;
      Objeto.IMP_TOTAL.Control:=nil;
      Objeto.ID_FOLIO_TESO.Control:=nil;
      Objeto.ID_FOLIO_DV.Control:=nil;
      Objeto.REF_EXTERNA.Control:=nil;
      Objeto.TX_DESC_INSTRUC.Control:=nil;
      Objeto.ID_COD_RESP.Control:=nil;
      Objeto.SIT_SEGUIMIENTO.Control:=nil;
      Objeto.F_ALTA.Control :=nil;
      Objeto.CVE_USU_ALTA.Control :=nil;
      Objeto.F_AUTORIZA.Control :=nil;
      Objeto.CVE_USU_AUTO.Control :=nil;
      Objeto.F_MODIFICA.Control :=nil;
      Objeto.CVE_USU_MODIFICA.Control :=nil;

      Objeto.Credito.ID_CREDITO.Control := nil;
      Objeto.Credito.ContratoCre.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Seguimiento.DESC_SEGUIMIENTO.Control :=nil;
   //Objeto
end;

procedure TWCrBitSeguimient.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrBitSeguimient.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_COBRANZA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   rgCVE_TIPO_PAGO.ItemIndex := 0;
   rgSIT_SEGUIMIENTO.ItemIndex := 0;
   Objeto.IMP_TOTAL.AsFloat := 0;
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   MuestraHints;
   edF_COBRANZA.SetFocus;
end;

procedure TWCrBitSeguimient.InterForma1DespuesModificar(Sender: TObject);
begin edID_CREDITO.SetFocus;
end;

procedure TWCrBitSeguimient.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   Begin
      Objeto.ID_CREDITO.AsString := Objeto.Credito.ID_CREDITO.AsString;
      InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TWCrBitSeguimient.ilCREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
//   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrBitSeguimient.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
      InterForma1.NextTab(edID_CREDITO);
   //end if
end;

procedure TWCrBitSeguimient.btCVE_SEGUIMIENTOClick(Sender: TObject);
begin
   Objeto.Seguimiento.ShowAll := True;
   if Objeto.Seguimiento.Busca then
      InterForma1.NextTab(edCVE_SEGUIMIENTO);
   //end if
end;

procedure TWCrBitSeguimient.ilSEGUIMIENTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrBitSeguimient.ilSEGUIMIENTOEjecuta(Sender: TObject);
begin
   if Objeto.Seguimiento.FindKey([ilSEGUIMIENTO.Buffer]) then
      InterForma1.NextTab(edCVE_SEGUIMIENTO);
   //end if
end;

procedure TWCrBitSeguimient.edF_COBRANZAExit(Sender: TObject);
var vlSalida    : Boolean;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
       vlSalida := True;
       vlMsg:= '';
       Objeto.F_COBRANZA.GetFromControl;
       if Objeto.F_COBRANZA.AsString = '' then
       Begin
          vlSalida:= False;
          vlMsg:= 'Indique por favor la fecha de cobro';
       end;
       InterForma1.ValidaExit(edF_COBRANZA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBitSeguimient.edID_SEGUIMIENTOExit(Sender: TObject);
var vlSalida    : Boolean;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
       vlSalida := True;
       vlMsg:= '';
       Objeto.ID_SEGUIMIENTO.GetFromControl;
       if Objeto.ID_SEGUIMIENTO.AsString = '' then
       Begin
          vlSalida:= False;
          vlMsg:= 'Indique por el Número de Seguimiento';
       end;
       InterForma1.ValidaExit(edID_SEGUIMIENTO,vlSalida,vlMsg,True);
   end;
end;
procedure TWCrBitSeguimient.edID_CREDITOExit(Sender: TObject);
var vlSalida    : Boolean;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
       vlSalida := True;
       vlMsg:= '';
       Objeto.ID_CREDITO.GetFromControl;
       if Objeto.ID_CREDITO.AsString = '' then
       Begin
          vlSalida:= False;
          vlMsg:= 'Indique por favor la disposición';
       end;
       InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBitSeguimient.edCVE_SEGUIMIENTOExit(Sender: TObject);
var vlSalida    : Boolean;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
       vlSalida := True;
       vlMsg:= '';
       Objeto.CVE_SEGUIMIENTO.GetFromControl;
       if Objeto.CVE_SEGUIMIENTO.AsString = '' then
       Begin
          vlSalida:= False;
          vlMsg:= 'Indique por favor la clave del seguimiento';
       end;
       InterForma1.ValidaExit(edCVE_SEGUIMIENTO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBitSeguimient.edID_GRUPO_PAGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_GRUPO_PAGO,True,'',True);
end;

procedure TWCrBitSeguimient.IedIMP_TOTALExit(Sender: TObject);
var vlSalida    : Boolean;
    vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
       vlSalida := True;
       vlMsg:= '';
       Objeto.IMP_TOTAL.GetFromControl;
       if Objeto.IMP_TOTAL.AsString = '' then
       Begin
          vlSalida:= False;
          vlMsg:= 'Indique por favor el Importe Total';
       end;
       InterForma1.ValidaExit(IedIMP_TOTAL,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBitSeguimient.rgCVE_TIPO_PAGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_PAGO,True,'',True);
end;

procedure TWCrBitSeguimient.edID_FOLIO_TESOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_FOLIO_TESO,True,'',True);
end;

procedure TWCrBitSeguimient.edREF_EXTERNAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edREF_EXTERNA,True,'',True);
end;

procedure TWCrBitSeguimient.edTX_DESC_INSTRUCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_DESC_INSTRUC,True,'',True);
end;

procedure TWCrBitSeguimient.edID_COD_RESPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_COD_RESP,True,'',True);
end;

procedure TWCrBitSeguimient.rgSIT_SEGUIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_SEGUIMIENTO,True,'',True);
end;

procedure TWCrBitSeguimient.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Objeto.ID_SEGUIMIENTO.AsInteger := ObtenFolio(CCRIDSEG,'ID SEGUIMIENTO: ', Objeto.Apli);
           Objeto.ID_GRUPO_PAGO.AsInteger := ObtenFolio(CCRGPSEG,'GRUPO PAGO: ', Objeto.Apli);
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

Procedure TWCrBitSeguimient.MuestraHints;
Begin
      edNOM_ACREDITADO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edNOM_ACREDITADO.ShowHint := True;
      edDESC_SEGUIMIENTO.Hint := Objeto.Seguimiento.DESC_SEGUIMIENTO.AsString;
      edDESC_SEGUIMIENTO.ShowHint := True;
      edREF_EXTERNA.Hint := Objeto.REF_EXTERNA.AsString;
      edREF_EXTERNA.ShowHint := True;
      edTX_DESC_INSTRUC.Hint := Objeto.TX_DESC_INSTRUC.AsString;
      edTX_DESC_INSTRUC.ShowHint := True;
End;

procedure TWCrBitSeguimient.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrBitSeguimient.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

end.
