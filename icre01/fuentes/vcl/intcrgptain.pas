// Sistema         : Clase de CR_GPO_TASA_IND
// Fecha de Inicio : 11/07/2003
// Función forma   : Clase de CR_GPO_TASA_IND
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrGpTaIn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntParamCre, IntTasIndFin, IntGenCre
;

Type
 TCrGpTaIn= class; 

  TWCrGpTasaInd=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_TASA : TLabel; 
    edCVE_TASA : TEdit;
    lbPLAZO : TLabel; 
    IedPLAZO : TInterEdit;
    lbCVE_TASA_REFER : TLabel; 
    edCVE_TASA_REFER : TEdit;
    btTASA_REFER: TBitBtn;
    ilTASA_REFER: TInterLinkit;
    edDESC_TASA_REFER: TEdit;
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
    btCVE_TASA: TBitBtn;
    edDESC_TASA: TEdit;
    ilTASA: TInterLinkit;
    btPLAZO: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure ilTASA_REFERCapture(Sender: TObject; var Show: Boolean);
    procedure btTASA_REFERExit(Sender: TObject);
    procedure edCVE_TASAExit(Sender: TObject);
    procedure IedPLAZOExit(Sender: TObject);
    procedure btCVE_TASAClick(Sender: TObject);
    procedure ilTASACapture(Sender: TObject; var Show: Boolean);
    procedure ilTASAEjecuta(Sender: TObject);
    procedure btPLAZOClick(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrGpTaIn;
end;
 TCrGpTaIn= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TASA                 : TInterCampo;
        PLAZO                    : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;

        //Clases Adiconales
        Tasa                     : TTasIndFin;
        TasaRefer                : TTasIndFin;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
Uses IntCrCalDia;

{$R *.DFM}


constructor TCrGpTaIn.Create( AOwner : TComponent );
begin Inherited;
      CVE_TASA :=CreaCampo('CVE_TASA',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA.Caption:='Clave Tasa';
      PLAZO :=CreaCampo('PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO.Caption:='Plazo';
      CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_REFER.Caption:='Clave de Tasa Refer';
      FKeyFields.Add('CVE_TASA');
      FKeyFields.Add('PLAZO');

      TableName := 'CR_GPO_TASA_IND';
      UseQuery := True;
      HelpFile := 'IntCrGpTaIn.Hlp';
      ShowMenuReporte:=True;

      Tasa := TTasIndFin.Create(Self);
      Tasa.MasterSource:=Self;
      Tasa.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA';
      Tasa.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      Tasa.FilterString := Tasa.BuscaWhereString;

      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER';
      TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer.FilterString := TasaRefer.BuscaWhereString;
end;

Destructor TCrGpTaIn.Destroy;
begin
   if Tasa <> nil then
      Tasa.Free;
   //end if

   if TasaRefer <> nil then
      TasaRefer.Free;
   //end if

   inherited;
end;


function TCrGpTaIn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGpTasaInd;
begin
   W:=TWCrGpTasaInd.Create(Self);
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


Function TCrGpTaIn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrGpTI.it','S,F');
      Try if Active then begin T.Param(0,CVE_TASA.AsString); 
                               T.Param(1,PLAZO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_GPO_TASA_IND********************)
(*                                                                              *)
(*  FORMA DE CR_GPO_TASA_IND                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GPO_TASA_IND********************)

procedure TWCrGpTasaInd.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TASA.Control:=edCVE_TASA;
      Objeto.PLAZO.Control:=IedPLAZO;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;

      Objeto.Tasa.DESC_TASA_INDIC.Control := edDESC_TASA;
      Objeto.Tasa.GetParams(Objeto);

      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrGpTasaInd.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TASA.Control:=nil;
      Objeto.PLAZO.Control:=nil;
      Objeto.CVE_TASA_REFER.Control:=nil;
      Objeto.Tasa.DESC_TASA_INDIC.Control := nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;
   //Objeto
end;

procedure TWCrGpTasaInd.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGpTasaInd.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_TASA.SetFocus;
end;

procedure TWCrGpTasaInd.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_TASA.SetFocus;
end;

procedure TWCrGpTasaInd.btTASA_REFERClick(Sender: TObject);
begin
   Objeto.TasaRefer.ShowAll := True;
   if Objeto.TasaRefer.Busca then
      InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;

procedure TWCrGpTasaInd.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;

procedure TWCrGpTasaInd.ilTASA_REFERCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrGpTasaInd.btTASA_REFERExit(Sender: TObject);
var     VLBandera :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      VLMsg:= '';
      Objeto.CVE_TASA_REFER.GetFromControl;
      If Objeto.CVE_TASA_REFER.AsString = '' then
      Begin
          VLBandera := False;
          VLMsg := 'Favor de Indicar la Tasa de Referencia';
      end;
      InterForma1.ValidaExit(edCVE_TASA_REFER,VLBandera,VLMsg,True);
   end;
end;

procedure TWCrGpTasaInd.edCVE_TASAExit(Sender: TObject);
var     VLBandera :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      VLMsg:= '';
      Objeto.CVE_TASA.GetFromControl;
      If Objeto.CVE_TASA.AsString = '' then
      Begin
          VLBandera := False;
          VLMsg := 'Favor de Indicar la Clave de la Tasa';
      end;
      InterForma1.ValidaExit(edCVE_TASA,VLBandera,VLMsg,True);
   end;
end;

procedure TWCrGpTasaInd.IedPLAZOExit(Sender: TObject);
var     VLBandera :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      VLMsg:= '';
      Objeto.PLAZO.GetFromControl;
      If Objeto.PLAZO.AsString = '' then
      Begin
          VLBandera := False;
          VLMsg := 'Favor de Indicar el Plazo de la Tasa';
      end
      else if not ValNumPositivo(VLMsg,Objeto.PLAZO.AsInteger) then
      Begin
          VLBandera := False;
          VLMsg := 'El plazo de la tasa no puede ser negativa';
      end;
      InterForma1.ValidaExit(IedPLAZO,VLBandera,VLMsg,True);
   end;
end;

procedure TWCrGpTasaInd.btCVE_TASAClick(Sender: TObject);
begin
   Objeto.Tasa.ShowAll := True;
   if Objeto.Tasa.Busca then
      InterForma1.NextTab(edCVE_TASA);
   //end if
end;

procedure TWCrGpTasaInd.ilTASACapture(Sender: TObject; var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrGpTasaInd.ilTASAEjecuta(Sender: TObject);
begin
   if Objeto.Tasa.FindKey([ilTASA.Buffer]) then
      InterForma1.NextTab(edCVE_TASA);
   //end if
end;

//Llama la ventana para convertir meses o años a Dias
Function TWCrGpTasaInd.VentanaCalculo(pDato : String): string;
var   CalDia : TCrCalDia;
      vlDias : String;
begin
   vlDias := pDato;
   CalDia := TCrCalDia.Create(Self);
   Try
      if CalDia.ShowModal = mrOk then
         if CalDia.edDIAS.Text <>'' then vlDias := CalDia.edDIAS.Text;
      //end if
   finally
      CalDia.Free;
   end;
   VentanaCalculo := vlDias;
end;

procedure TWCrGpTasaInd.btPLAZOClick(Sender: TObject);
begin
   if Objeto.Active then
      IedPLAZO.Text:= VentanaCalculo(Objeto.PLAZO.AsString);
   //end if
end;

Procedure TWCrGpTasaInd.MuestraHints;
Begin
      edDESC_TASA.Hint := Objeto.Tasa.DESC_TASA_INDIC.AsString;
      edDESC_TASA.ShowHint := True;
      edDESC_TASA_REFER.Hint := Objeto.TasaRefer.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER.ShowHint := True;
End;

procedure TWCrGpTasaInd.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrGpTasaInd.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrGpTasaInd.InterForma1AntesAceptar(Sender: TObject;
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
