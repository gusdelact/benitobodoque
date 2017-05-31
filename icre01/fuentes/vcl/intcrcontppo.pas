// Sistema         : Clase de CrContPpo
// Fecha de Inicio : 21/10/2013
// Función forma   : Clase de CrContPpo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrcontppo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, IntLinkit,
IntCrCredito,    //Disposición
IntCrAcredit,    //Acreditado
IntQrCntPPO      //REPORTE
;

Type
 TCrcontppo= class; 

  TWCrcontppo=Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    GroupBox2: TGroupBox;
    edFECHAINI: TEdit;
    Label4: TLabel;
    dtpFECHA: TInterDateTimePicker;
    Label3: TLabel;
    edFECHAFIN: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    lbAplica: TLabel;
    ilACREDITADO: TInterLinkit;
    ilCesion: TInterLinkit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    private
      Procedure ImprimeReporte(bPreview:Boolean); 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrcontppo;
end; 
 TCrcontppo= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        ParamCre       : TParamCre;
        Credito        : TCrCredito;
        Acreditado     : TCrAcredit;

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


constructor TCrcontppo.Create( AOwner : TComponent ); 
begin Inherited; 

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrcontppo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrcontppo.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Credito <> Nil Then
      Credito.Free;
inherited;
end;


function TCrcontppo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcontppo;
begin
   W:=TWCrcontppo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrcontppo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrcontp.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrcontppo.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrContPpo********************)
(*                                                                              *)
(*  FORMA DE CrContPpo                                                            *)
(*                                                                              *)
(***********************************************FORMA CrContPpo********************)

procedure TWCrcontppo.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;
end;

procedure TWCrcontppo.FormDestroy(Sender: TObject);
begin
//Objeto
end;

procedure TWCrcontppo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcontppo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrcontppo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrcontppo.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrcontppo.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrcontppo.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWCrcontppo.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrcontppo.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWCrcontppo.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWCrcontppo.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TWCrcontppo.cbxArchivoClick(Sender: TObject);
begin
    If not cbxArchivo.Checked Then Begin
        edNbrArch.Text:= '';
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End Else Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End;
end;

procedure TWCrcontppo.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWCrcontppo.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
     sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
     If UpperCase(sExt)= '.PRN' Then
        edNbrArch.Text := SaveDialog1.FileName
     Else
        edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End
  Else
     edNbrArch.Text := '';
end;

procedure TWCrcontppo.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWCrcontppo.btID_CESIONClick(Sender: TObject);
var Cadena: String ;
begin
   Cadena:= ' SELECT DISTINCT CR_CREDITO.ID_CONTRATO  '+
            ' FROM CONTRATO , CR_CREDITO '+
            ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO ';
   If chbxACREDITADO.Checked then
      begin
         Cadena := Cadena + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
      end ;

      Objeto.Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+Cadena+') ' ;
      Objeto.Credito.FilterString:= Objeto.Credito.BuscaWhereString ;
      Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWCrcontppo.ImprimeReporte(bPreview: Boolean);
Var
    sTipRep : String;
    VlIndex : Integer;
    vlsalida : Boolean;
begin

 if (Trim(edFECHAINI.Text) > Trim(edFECHAFIN.Text)) then
     begin
     ShowMessage('   ¡ La fecha Final no puede ser menor a la fecha Inicial !');
     vlsalida := False;
     end;

    if vlsalida then
    begin

    RepContPPO( edFECHAINI.Text,
                edFECHAFIN.Text,
                edACREDITADO.Text,
                edID_CESION.text,
                sTipRep,
                edNbrArch.Text,
                bPreview,
                Objeto.Apli
                );


      If Trim(edNbrArch.Text)<>'' Then
           ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente');
    end;
end;

procedure TWCrcontppo.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRCONTPPO_IMPR',True,True) then // FUNCION DE SEGURDIADES 30/10/2012 JFOF
   ImprimeReporte(False);
end;

procedure TWCrcontppo.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRCONTPPO_PREV',True,True) then // FUNCION DE SEGURDIADES 30/10/2012 JFOF
   ImprimeReporte(True);
end;

end.
