// Sistema         : Clase de CR_SEGUIMIENTO
// Fecha de Inicio : 30/07/2003
// Función forma   : Clase de CR_SEGUIMIENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSeguimi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//Unidades Adicionales
IntParamCre,
IntTesInsOp,            //Instrumento
IntTesoOpera,           //Opera TO
IntTesoChequ,           //chequera
IntMon,                //Moneda
IntDvOperaci            //Opera DV
;

Type
 TCrSeguimi= class;

  TWCrSeguimiento=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_SEGUIMIENTO : TLabel; 
    edCVE_SEGUIMIENTO : TEdit; 
    edDESC_SEGUIMIENTO : TEdit;
    lbCVE_INSTRUMENTO : TLabel; 
    edCVE_INSTRUMENTO : TEdit;
    lbCVE_OPERACION_TO : TLabel; 
    edCVE_OPERACION_TO : TEdit;
    lbCVE_CHEQRA : TLabel; 
    edCVE_CHEQRA : TEdit;
    lbID_TESORERIA : TLabel;
    edID_TESORERIA : TEdit;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edCVE_OPERACION_DV : TEdit;
    Label1: TLabel;
    btCVE_INSTRUMENTO: TBitBtn;
    edDESC_INSTRUMENTO: TEdit;
    btCVE_OPERACION_TO: TBitBtn;
    edDESC_OPER_TO: TEdit;
    btCVE_CHQRA: TBitBtn;
    edDESC_CHQRA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    btCVE_OPERACION_DV: TBitBtn;
    edDESC_OPER_DV: TEdit;
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
    ilINSTRUMENTO: TInterLinkit;
    ilOPERTO: TInterLinkit;
    ilCHQRA: TInterLinkit;
    ilMONEDA: TInterLinkit;
    ilOPERDV: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure btCVE_INSTRUMENTOClick(Sender: TObject);
    procedure ilINSTRUMENTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilINSTRUMENTOEjecuta(Sender: TObject);
    procedure btCVE_OPERACION_TOClick(Sender: TObject);
    procedure ilOPERTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilOPERTOEjecuta(Sender: TObject);
    procedure btCVE_CHQRAClick(Sender: TObject);
    procedure ilCHQRACapture(Sender: TObject; var Show: Boolean);
    procedure ilCHQRAEjecuta(Sender: TObject);
    procedure btCVE_OPERACION_DVClick(Sender: TObject);
    procedure ilOPERDVCapture(Sender: TObject; var Show: Boolean);
    procedure ilOPERDVEjecuta(Sender: TObject);
    procedure edCVE_SEGUIMIENTOExit(Sender: TObject);
    procedure edDESC_SEGUIMIENTOExit(Sender: TObject);
    procedure edCVE_INSTRUMENTOExit(Sender: TObject);
    procedure edCVE_OPERACION_TOExit(Sender: TObject);
    procedure edCVE_CHEQRAExit(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edCVE_OPERACION_DVExit(Sender: TObject);
    procedure edID_TESORERIAExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrSeguimi;
end;
 TCrSeguimi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_SEGUIMIENTO          : TInterCampo;
        DESC_SEGUIMIENTO         : TInterCampo;
        CVE_INSTRUMENTO          : TInterCampo;
        CVE_OPERACION_TO         : TInterCampo;
        CVE_CHEQRA               : TInterCampo;
        ID_TESORERIA             : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_OPERACION_DV         : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Instrumento              : TTesInsOp;
        TesoOpera                : TTesoOpera;
        TesoCheq                 : TTesoChequ;
        Moneda                   : TMoneda;
        OperaDV                  : TDvOperaci;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrSeguimi.Create( AOwner : TComponent );
begin Inherited;
      CVE_SEGUIMIENTO :=CreaCampo('CVE_SEGUIMIENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_SEGUIMIENTO.Caption:='Seguimiento';
      DESC_SEGUIMIENTO :=CreaCampo('DESC_SEGUIMIENTO',ftString,tsNinguno,tsNinguno,True);
                DESC_SEGUIMIENTO.Caption:='Descripción';
      CVE_INSTRUMENTO :=CreaCampo('CVE_INSTRUMENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_INSTRUMENTO.Caption:='Instrumento';
      CVE_OPERACION_TO :=CreaCampo('CVE_OPERACION_TO',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION_TO.Caption:='Operación Tes. Oper.';
      CVE_CHEQRA :=CreaCampo('CVE_CHEQRA',ftString,tsNinguno,tsNinguno,True);
                CVE_CHEQRA.Caption:='Chequera';
      ID_TESORERIA :=CreaCampo('ID_TESORERIA',ftFloat,tsNinguno,tsNinguno,True);
                ID_TESORERIA.Caption:='Tesoreria';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Moneda';
      CVE_OPERACION_DV :=CreaCampo('CVE_OPERACION_DV',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION_DV.Caption:='Operación Divisas';
      FKeyFields.Add('CVE_SEGUIMIENTO');

      TableName := 'CR_SEGUIMIENTO';
      UseQuery := True;
      HelpFile := 'IntCrSeguimi.Hlp';
      ShowMenuReporte:=True;


      Instrumento := TTesInsOp.Create(Self);
      Instrumento.MasterSource:=Self;
      Instrumento.FieldByName('CVE_INSTRUMENTO').MasterField:='CVE_INSTRUMENTO';

      TesoOpera := TTesoOpera.Create(Self);
      TesoOpera.MasterSource:=Self;
      TesoOpera.FieldByName('CVE_OPERACION').MasterField:='CVE_OPERACION_TO';

      TesoCheq := TTesoChequ.Create(Self);
      TesoCheq.MasterSource:=Self;
      TesoCheq.FieldByName('CVE_CHEQRA').MasterField:='CVE_CHEQRA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      OperaDV := TDvOperaci.Create(Self);
      OperaDV.MasterSource:=Self;
      OperaDV.FieldByName('CVE_OPERACION').MasterField:='CVE_OPERACION_DV';

end;

Destructor TCrSeguimi.Destroy;
begin
   if Instrumento <> nil then
      Instrumento.Free;
   //end if

   if TesoOpera <> nil then
      TesoOpera.Free;
   //end if

   if TesoCheq <> nil then
      TesoCheq.Free;
   //end if

   if Moneda <> nil then
      Moneda.Free;
   //end if

   if OperaDV <> nil then
      OperaDV.Free;
   //end if


   inherited;
end;


function TCrSeguimi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSeguimiento;
begin
   W:=TWCrSeguimiento.Create(Self);
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


Function TCrSeguimi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSegui.it','S');
      Try if Active then begin T.Param(0,CVE_SEGUIMIENTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_SEGUIMIENTO********************)
(*                                                                              *)
(*  FORMA DE CR_SEGUIMIENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SEGUIMIENTO********************)

procedure TWCrSeguimiento.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      
      Objeto.CVE_SEGUIMIENTO.Control:=edCVE_SEGUIMIENTO;
      Objeto.DESC_SEGUIMIENTO.Control:=edDESC_SEGUIMIENTO;
      Objeto.CVE_INSTRUMENTO.Control:=edCVE_INSTRUMENTO;
      Objeto.CVE_OPERACION_TO.Control:=edCVE_OPERACION_TO;
      Objeto.CVE_CHEQRA.Control:=edCVE_CHEQRA;
      Objeto.ID_TESORERIA.Control:=edID_TESORERIA;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_OPERACION_DV.Control:=edCVE_OPERACION_DV;

      Objeto.Instrumento.DESC_L_ID_PRIM.Control := edDESC_INSTRUMENTO;
      Objeto.Instrumento.GetParams(Objeto);

      Objeto.TesoOpera.DESC_L_ID_PRIM.Control := edDESC_OPER_TO;
      Objeto.TesoOpera.GetParams(Objeto);

      Objeto.TesoCheq.DESC_CHEQUERA.Control := edDESC_CHQRA;
      Objeto.TesoCheq.GetParams(Objeto);

      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.OperaDV.DESC_L_ID_PRIM.Control := edDESC_OPER_DV;
      Objeto.OperaDV.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;

end;

procedure TWCrSeguimiento.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SEGUIMIENTO.Control:=nil;
      Objeto.DESC_SEGUIMIENTO.Control:=nil;
      Objeto.CVE_INSTRUMENTO.Control:=nil;
      Objeto.CVE_OPERACION_TO.Control:=nil;
      Objeto.CVE_CHEQRA.Control:=nil;
      Objeto.ID_TESORERIA.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_OPERACION_DV.Control:=nil;

      Objeto.Instrumento.DESC_L_ID_PRIM.Control := nil;
      Objeto.TesoOpera.DESC_L_ID_PRIM.Control := nil;
      Objeto.TesoCheq.DESC_CHEQUERA.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.OperaDV.DESC_L_ID_PRIM.Control := nil;


   //Objeto
end;

procedure TWCrSeguimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSeguimiento.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_SEGUIMIENTO.SetFocus;
end;

procedure TWCrSeguimiento.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_SEGUIMIENTO.SetFocus;
end;


procedure TWCrSeguimiento.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then
      InterForma1.NextTab(edCVE_MONEDA);
   //end if
end;

procedure TWCrSeguimiento.ilMONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrSeguimiento.ilMONEDAEjecuta(Sender: TObject);
begin
   if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
      InterForma1.NextTab(edCVE_MONEDA);
   //end if
end;

procedure TWCrSeguimiento.btCVE_INSTRUMENTOClick(Sender: TObject);
begin
   Objeto.Instrumento.ShowAll := True;
   if Objeto.Instrumento.Busca then
      InterForma1.NextTab(edCVE_INSTRUMENTO);
   //end if
end;

procedure TWCrSeguimiento.ilINSTRUMENTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrSeguimiento.ilINSTRUMENTOEjecuta(Sender: TObject);
begin
   if Objeto.Instrumento.FindKey([ilINSTRUMENTO.Buffer]) then
      InterForma1.NextTab(edCVE_INSTRUMENTO);
   //end if;
end;

procedure TWCrSeguimiento.btCVE_OPERACION_TOClick(Sender: TObject);
begin
   Objeto.TesoOpera.ShowAll := True;
   if Objeto.TesoOpera.Busca then
      InterForma1.NextTab(edCVE_OPERACION_TO);
   //end if
end;

procedure TWCrSeguimiento.ilOPERTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrSeguimiento.ilOPERTOEjecuta(Sender: TObject);
begin
   if Objeto.TesoOpera.FindKey([ilOPERTO.Buffer]) then
      InterForma1.NextTab(edCVE_OPERACION_TO);
   //end if
end;

procedure TWCrSeguimiento.btCVE_CHQRAClick(Sender: TObject);
begin
   Objeto.TesoCheq.ShowAll:= True;
   if Objeto.TesoCheq.Busca then
      InterForma1.NextTab(edCVE_CHEQRA);
   //end if
end;

procedure TWCrSeguimiento.ilCHQRACapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrSeguimiento.ilCHQRAEjecuta(Sender: TObject);
begin
   if Objeto.TesoCheq.FindKey([ilCHQRA.Buffer]) then
      InterForma1.NextTab(edCVE_CHEQRA);
   //end if
end;

procedure TWCrSeguimiento.btCVE_OPERACION_DVClick(Sender: TObject);
begin
    Objeto.OperaDV.ShowAll := True;
    if Objeto.OperaDV.Busca then
       InterForma1.NextTab(edCVE_OPERACION_DV);
    //end if
end;

procedure TWCrSeguimiento.ilOPERDVCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrSeguimiento.ilOPERDVEjecuta(Sender: TObject);
begin
   if Objeto.OperaDV.FindKey([ilOPERDV.Buffer]) then
      InterForma1.NextTab(edCVE_OPERACION_DV);
   //end if
end;

procedure TWCrSeguimiento.edCVE_SEGUIMIENTOExit(Sender: TObject);
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
          vlMsg:= 'Indique por favor la clave de Seguimiento';
       end;
       InterForma1.ValidaExit(edCVE_SEGUIMIENTO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSeguimiento.edDESC_SEGUIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_SEGUIMIENTO,True,'',True);
end;

procedure TWCrSeguimiento.edCVE_INSTRUMENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_INSTRUMENTO,True,'',True);
end;

procedure TWCrSeguimiento.edCVE_OPERACION_TOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_OPERACION_TO,True,'',True);
end;

procedure TWCrSeguimiento.edCVE_CHEQRAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_CHEQRA,True,'',True);
end;

procedure TWCrSeguimiento.edCVE_MONEDAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TWCrSeguimiento.edCVE_OPERACION_DVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_OPERACION_DV,True,'',True);
end;

procedure TWCrSeguimiento.edID_TESORERIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_TESORERIA,True,'',True);
end;

Procedure TWCrSeguimiento.MuestraHints;
Begin
      edDESC_SEGUIMIENTO.Hint := Objeto.DESC_SEGUIMIENTO.AsString;
      edDESC_SEGUIMIENTO.ShowHint := True;
      edDESC_INSTRUMENTO.Hint := Objeto.Instrumento.DESC_L_ID_PRIM.AsString;
      edDESC_INSTRUMENTO.ShowHint := True;
      edDESC_OPER_TO.Hint := Objeto.TesoOpera.DESC_L_ID_PRIM.AsString;
      edDESC_OPER_TO.ShowHint := True;
      edDESC_CHQRA.Hint := Objeto.TesoCheq.DESC_CHEQUERA.AsString;
      edDESC_CHQRA.ShowHint := True;
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;
      edDESC_OPER_DV.Hint := Objeto.OperaDV.DESC_L_ID_PRIM.AsString;
      edDESC_OPER_DV.ShowHint := True;
End;

procedure TWCrSeguimiento.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrSeguimiento.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrSeguimiento.InterForma1AntesAceptar(Sender: TObject;
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
