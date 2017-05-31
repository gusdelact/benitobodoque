// Sistema         : Clase de EXCEPCION_APLI
// Fecha de Inicio : 30/05/2003
// Función forma   : Clase de EXCEPCION_APLI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntExcepApli;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//Unidades Adicionales
IntExpX,IntSecuAplic;

Type
 TExcepApli= class;

  TWExcepcionApli=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_EXCEPCION : TLabel;
    edCVE_EXCEPCION : TEdit;
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    rgSIT_EXCEP_APLI : TRadioGroup;
    lbF_ALTA : TLabel;
    edF_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel;
    edCVE_USU_ALTA : TEdit;
    lbF_MODIFICA : TLabel;
    edF_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel;
    edCVE_USU_MODIFICA : TEdit;
    btCVE_EXCEPCION: TBitBtn;
    edDESC_EXCEPCION: TEdit;
    btCVE_APLICACION: TBitBtn;
    edDESC_APLICACION: TEdit;
    ilCVE_EXCEPCION: TInterLinkit;
    ilCVE_APLICACION: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_EXCEPCIONClick(Sender: TObject);
    procedure btCVE_APLICACIONClick(Sender: TObject);
    procedure ilCVE_EXCEPCIONEjecuta(Sender: TObject);
    procedure ilCVE_APLICACIONEjecuta(Sender: TObject);
    procedure ilCVE_APLICACIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_EXCEPCIONCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_EXCEPCIONExit(Sender: TObject);
    procedure edCVE_APLICACIONExit(Sender: TObject);
    procedure rgSIT_EXCEP_APLIExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TExcepApli;
end;
 TExcepApli= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_EXCEPCION            : TInterCampo;
        CVE_APLICACION           : TInterCampo;
        SIT_EXCEP_APLI           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        TipoExcep                : TExpX;
        SecuAplic                : TSecuAplic;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation

{$R *.DFM}


constructor TExcepApli.Create( AOwner : TComponent );
begin Inherited;
      CVE_EXCEPCION :=CreaCampo('CVE_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
                CVE_EXCEPCION.Caption:='Clave de Excepción';
      CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
                CVE_APLICACION.Caption:='Clave de Aplicación';
      SIT_EXCEP_APLI :=CreaCampo('SIT_EXCEP_APLI',ftString,tsNinguno,tsNinguno,True);
                SIT_EXCEP_APLI.Caption:='Situación Excepción - Aplicación.';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha de Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Usuario Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Usuario Modifica';
      FKeyFields.Add('CVE_EXCEPCION');
      FKeyFields.Add('CVE_APLICACION');

      TableName := 'EXCEPCION_APLI';
      UseQuery := True;
      HelpFile := 'IntExcepApli.Hlp';
      ShowMenuReporte:=True;

      SecuAplic := TSecuAplic.Create(self);
      SecuAplic.MasterSource := self;
      SecuAplic.FieldByName('CVE_APLICACION').MasterField := 'CVE_APLICACION';

      TipoExcep := TExpX.Create(self);
      TipoExcep.MasterSource:=Self;
      TipoExcep.FieldByName('CVE_TIP_EXCEP').MasterField:='CVE_EXCEPCION';

end;

Destructor TExcepApli.Destroy;
begin
        if SecuAplic <> nil then
           SecuAplic.Free;
        //end if

        if TipoExcep <> nil then
           TipoExcep.Free;
        // end if
        
inherited;

end;


function TExcepApli.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWExcepcionApli;
begin
   W:=TWExcepcionApli.Create(Self);
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


Function TExcepApli.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IExcApl.it','S,S');
      Try if Active then begin T.Param(0,CVE_EXCEPCION.AsString);
                               T.Param(1,CVE_APLICACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA EXCEPCION_APLI********************)
(*                                                                              *)
(*  FORMA DE EXCEPCION_APLI                                                            *)
(*                                                                              *)
(***********************************************FORMA EXCEPCION_APLI********************)

procedure TWExcepcionApli.FormShow(Sender: TObject);
begin
      Objeto.CVE_EXCEPCION.Control:=edCVE_EXCEPCION;
      Objeto.CVE_APLICACION.Control:=edCVE_APLICACION;
      Objeto.SIT_EXCEP_APLI.Control:=rgSIT_EXCEP_APLI;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Objeto.TipoExcep.DESC_EXCEPCION.Control := edDESC_EXCEPCION;
      Objeto.TipoExcep.GetParams(Objeto);

      Objeto.SecuAplic.NOM_APLICACION.Control := edDESC_APLICACION;
      Objeto.SecuAplic.GetParams(Objeto);
end;

procedure TWExcepcionApli.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_EXCEPCION.Control:=nil;
      Objeto.CVE_APLICACION.Control:=nil;
      Objeto.SIT_EXCEP_APLI.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;

      Objeto.TipoExcep.DESC_EXCEPCION.Control := nil;
      Objeto.SecuAplic.NOM_APLICACION.Control := nil;
   //Objeto
end;

procedure TWExcepcionApli.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWExcepcionApli.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
    MuestraHints;
   edCVE_EXCEPCION.SetFocus;
end;

procedure TWExcepcionApli.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   rgSIT_EXCEP_APLI.SetFocus;
end;

procedure TWExcepcionApli.btCVE_EXCEPCIONClick(Sender: TObject);
begin
     Objeto.TipoExcep.ShowAll := true;
     if Objeto.TipoExcep.Busca then
         InterForma1.NextTab(edCVE_EXCEPCION);
end;

procedure TWExcepcionApli.btCVE_APLICACIONClick(Sender: TObject);
begin
     Objeto.SecuAplic.ShowAll := true;
     if Objeto.SecuAplic.Busca then
         InterForma1.NextTab(edCVE_APLICACION);
end;

procedure TWExcepcionApli.ilCVE_EXCEPCIONEjecuta(Sender: TObject);
begin
   if Objeto.TipoExcep.FindKey([ilCVE_EXCEPCION.Buffer]) then
       InterForma1.NextTab(edCVE_EXCEPCION);
end;

procedure TWExcepcionApli.ilCVE_APLICACIONEjecuta(Sender: TObject);
begin
   if Objeto.SecuAplic.FindKey([ilCVE_APLICACION.Buffer]) then
       InterForma1.NextTab(edCVE_APLICACION);
end;

procedure TWExcepcionApli.ilCVE_APLICACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWExcepcionApli.ilCVE_EXCEPCIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWExcepcionApli.edCVE_EXCEPCIONExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_EXCEPCION.GetFromControl;
         if Objeto.CVE_EXCEPCION.AsString = '' then
         Begin
            ShowMessage('Favor de Indicar la Clave de la Excepción');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_EXCEPCION,VLSalida,'',True);
      end;
end;

procedure TWExcepcionApli.edCVE_APLICACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_APLICACION.GetFromControl;
         if Objeto.CVE_APLICACION.AsString = '' then
         Begin
            ShowMessage('Favor de Indicar la Clave de la Aplicación');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_APLICACION,VLSalida,'',True);
      end;
end;

procedure TWExcepcionApli.rgSIT_EXCEP_APLIExit(Sender: TObject);
begin
        InterForma1.ValidaExit(rgSIT_EXCEP_APLI,True,'',True);
end;

procedure TWExcepcionApli.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           rgSIT_EXCEP_APLI.ItemIndex :=0;
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

Procedure TWExcepcionApli.MuestraHints;
Begin
      edDESC_EXCEPCION.Hint := Objeto.TipoExcep.DESC_EXCEPCION.AsString;
      edDESC_EXCEPCION.ShowHint := True;
      edDESC_APLICACION.Hint := Objeto.SecuAplic.NOM_APLICACION.AsString;
      edDESC_APLICACION.ShowHint := True;
End;

procedure TWExcepcionApli.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWExcepcionApli.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

end.
