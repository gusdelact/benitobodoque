// Sistema         : Clase de CR_GP_FINAN_MAX
// Fecha de Inicio : 21/03/2012
// Función forma   : Clase de CR_GP_FINAN_MAX
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntMCrGpFiMa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TMCrGpFiMa= class;

  TWMCrGpFiMa=Class(TForm)
    InterForma1             : TInterForma; 
    lbTIPO_ENTIDAD : TLabel;
    lbTIPO_LIMITE : TLabel;
    lbNIVEL_FINAN_MAX : TLabel; 
    edNIVEL_FINAN_MAX : TEdit;
    lbF_VIGENTE_DESDE : TLabel; 
    dtpF_VIGENTE_DESDE : TInterDateTimePicker; 
    edF_VIGENTE_DESDE : TEdit;
    lbPCT_PI_SUP : TLabel; 
    edPCT_PI_SUP : TEdit;
    lbPCT_SP : TLabel; 
    edPCT_SP : TEdit;
    lbPCT_RES_SUP : TLabel; 
    edPCT_RES_SUP : TEdit;
    lbPCT_COL_1 : TLabel; 
    edPCT_COL_1 : TEdit;
    lbPCT_COL_2 : TLabel; 
    edPCT_COL_2 : TEdit;
    lbPCT_COL_3 : TLabel; 
    edPCT_COL_3 : TEdit;
    lbUSUARIO_CREACION : TLabel; 
    edUSUARIO_CREACION : TEdit;
    lbFH_CREACION : TLabel; 
    dtpFH_CREACION : TInterDateTimePicker; 
    edFH_CREACION : TEdit;
    lbUSUARIO_MODIFICA : TLabel; 
    edUSUARIO_MODIFICA : TEdit;
    lbFH_MODIFICA : TLabel; 
    dtpFH_MODIFICA : TInterDateTimePicker; 
    edFH_MODIFICA : TEdit;
    cbxTIPO_ENTIDAD: TComboBox;
    cbxTIPO_LIMITE : TComboBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TMCrGpFiMa;
end;


 TMCrGpFiMa= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;

        TIPO_ENTIDAD             : TInterCampo;
        TIPO_LIMITE              : TInterCampo;
        NIVEL_FINAN_MAX          : TInterCampo;
        F_VIGENTE_DESDE          : TInterCampo;
        PCT_PI_SUP               : TInterCampo;
        PCT_SP                   : TInterCampo;
        PCT_RES_SUP              : TInterCampo;
        PCT_COL_1                : TInterCampo;
        PCT_COL_2                : TInterCampo;
        PCT_COL_3                : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        FH_MODIFICA              : TInterCampo;

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


constructor TMCrGpFiMa.Create( AOwner : TComponent );
begin Inherited;
      TIPO_ENTIDAD             := CreaCampo ('TIPO_ENTIDAD', ftString, tsNinguno, tsNinguno, True);
      TIPO_ENTIDAD.Caption     := 'Tipo Entidad';
        With TIPO_ENTIDAD do
          Begin Size := 9;
            UseCombo := True;
            ComboLista.Add('Estatal');      ComboDatos.Add('ESTATAL');
            ComboLista.Add('Municipal');    ComboDatos.Add('MUNICIPAL');
        End;

      TIPO_LIMITE              := CreaCampo ('TIPO_LIMITE', ftString, tsNinguno, tsNinguno, True);
      TIPO_LIMITE.Caption      := 'Tipo Limite';
        With TIPO_LIMITE do
          Begin Size := 14;
            UseCombo := True;
            ComboLista.Add('Fideicomiso');      ComboDatos.Add('FID');
            ComboLista.Add('Mandato');          ComboDatos.Add('MAN');
            ComboLista.Add('Sin Estructura');   ComboDatos.Add('SNE');
        End;

      NIVEL_FINAN_MAX          := CreaCampo('NIVEL_FINAN_MAX', ftFloat, tsNinguno, tsNinguno, True);
      NIVEL_FINAN_MAX.Caption  := 'Nivel Finan Max';
      F_VIGENTE_DESDE          := CreaCampo ('F_VIGENTE_DESDE', ftDate, tsNinguno, tsNinguno, True);
      F_VIGENTE_DESDE.Caption  := 'Fecha de Vigencia';
      PCT_PI_SUP               := CreaCampo ('PCT_PI_SUP', ftFloat, tsNinguno, tsNinguno, True);
      PCT_PI_SUP.Caption       := '% PI Superior';
      PCT_SP                   := CreaCampo ('PCT_SP', ftFloat, tsNinguno, tsNinguno, True);
      PCT_SP.Caption           := '% Sev. Perdida';
      PCT_RES_SUP              := CreaCampo ('PCT_RES_SUP', ftFloat, tsNinguno, tsNinguno, True);
      PCT_RES_SUP.Caption      := '% Reserva Sup.';
      PCT_COL_1                := CreaCampo ('PCT_COL_1', ftFloat, tsNinguno, tsNinguno, True);
      PCT_COL_1.Caption        := '% Capital Basico 1';
      PCT_COL_2                := CreaCampo('PCT_COL_2', ftFloat, tsNinguno, tsNinguno, True);
      PCT_COL_2.Caption        := '% Capital Basico 2';
      PCT_COL_3                := CreaCampo ('PCT_COL_3', ftFloat, tsNinguno, tsNinguno, True);
      PCT_COL_3.Caption        := '% Capital Basico 3';
      CVE_USU_ALTA             := CreaCampo ('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
      CVE_USU_ALTA.Caption     := 'Usuario Alta';
      FH_ALTA                  := CreaCampo ('FH_ALTA', ftDate, tsNinguno, tsNinguno, True);
      FH_ALTA.Caption          := 'Fecha Alta';
      CVE_USU_MODIFICA         := CreaCampo ('CVE_USU_MODIFICA', ftString, tsNinguno, tsNinguno, True);
      CVE_USU_MODIFICA.Caption :='Usuario Modifica';
      FH_MODIFICA              := CreaCampo ('FH_MODIFICA', ftDate, tsNinguno, tsNinguno, True);
      FH_MODIFICA.Caption      := 'Fecha Modifica';
      FKeyFields.Add('TIPO_ENTIDAD');
      FKeyFields.Add('TIPO_LIMITE');
      FKeyFields.Add('NIVEL_FINAN_MAX');

      TableName := 'CR_GP_FINAN_MAX';
      UseQuery := True; 
      HelpFile := 'IntMCrGpFiMa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMCrGpFiMa.Destroy;
begin inherited;
end;


function TMCrGpFiMa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCrGpFiMa;
begin
   W:=TWMCrGpFiMa.Create(Self);
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


Function TMCrGpFiMa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrGpFM.it','S,S,F');
      Try if Active then begin T.Param(0,TIPO_ENTIDAD.AsString); 
                               T.Param(1,TIPO_LIMITE.AsString);
                               T.Param(2,NIVEL_FINAN_MAX.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TMCrGpFiMa.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_GP_FINAN_MAX********************)
(*                                                                              *)
(*  FORMA DE CR_GP_FINAN_MAX                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GP_FINAN_MAX********************)

procedure TWMCrGpFiMa.FormShow(Sender: TObject);
begin
      Objeto.TIPO_ENTIDAD.Control     := cbxTIPO_ENTIDAD;
      Objeto.TIPO_LIMITE.Control      := cbxTIPO_LIMITE;
      Objeto.NIVEL_FINAN_MAX.Control  := edNIVEL_FINAN_MAX;
      Objeto.F_VIGENTE_DESDE.Control  := edF_VIGENTE_DESDE;
      Objeto.PCT_PI_SUP.Control       := edPCT_PI_SUP;
      Objeto.PCT_SP.Control           := edPCT_SP;
      Objeto.PCT_RES_SUP.Control      := edPCT_RES_SUP;
      Objeto.PCT_COL_1.Control        := edPCT_COL_1;
      Objeto.PCT_COL_2.Control        := edPCT_COL_2;
      Objeto.PCT_COL_3.Control        := edPCT_COL_3;
      Objeto.CVE_USU_ALTA.Control     := edUSUARIO_CREACION;
      Objeto.FH_ALTA.Control          := edFH_CREACION;
      Objeto.CVE_USU_MODIFICA.Control := edUSUARIO_MODIFICA;
      Objeto.FH_MODIFICA.Control      := edFH_MODIFICA;
end;

procedure TWMCrGpFiMa.FormDestroy(Sender: TObject);
begin
      Objeto.TIPO_ENTIDAD.Control:=nil;
      Objeto.TIPO_LIMITE.Control:=nil;
      Objeto.NIVEL_FINAN_MAX.Control:=nil;
      Objeto.F_VIGENTE_DESDE.Control:=nil;
      Objeto.PCT_PI_SUP.Control:=nil;
      Objeto.PCT_SP.Control:=nil;
      Objeto.PCT_RES_SUP.Control:=nil;
      Objeto.PCT_COL_1.Control:=nil;
      Objeto.PCT_COL_2.Control:=nil;
      Objeto.PCT_COL_3.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWMCrGpFiMa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMCrGpFiMa.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMCrGpFiMa.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMCrGpFinanMax.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMCrGpFiMa.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
   begin
      if IsNewData then
      begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            CVE_USU_ALTA.AsString := DameUsuario;
            FH_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end else
      begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            FH_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   end;

end;

end.
