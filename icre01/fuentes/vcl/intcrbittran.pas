// Sistema         : Clase de CrBitTrans
// Fecha de Inicio : 30/07/2013
// Función forma   : Clase de CrBitTrans
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrbittran;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntParamCre,
IntUsuario,    //USUARIO
IntCrAcredit,  //ACREDITADO
IntCrCredito,  //CREDITO
IntMQrBitTran, //REPORTE
InterEdit
;

Type
 TCrbittran= class;

  TWCrbittrans=Class(TForm)
    InterForma1             : TInterForma;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    edF_Inicial: TEdit;
    dtpFECHAIni: TInterDateTimePicker;
    edF_Final: TEdit;
    dtpFECHAFin: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    chbxUsuario: TCheckBox;
    Label3: TLabel;
    edCVE_USUARIO: TEdit;
    btUSUARIO: TBitBtn;
    edNOM_USUARIO: TEdit;
    ilUSUARIO: TInterLinkit;
    CBxOperador: TComboBox;
    Label2: TLabel;
    edImporte: TInterEdit;
    ChBImporte: TCheckBox;
    lbAplica: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    ilCesion: TInterLinkit;
    Label5: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    ilACREDITADO: TInterLinkit;
    ChBIcre: TCheckBox;
    ChBInter: TCheckBox;
    ChBLiqcre: TCheckBox;
    ChBCambtas: TCheckBox;
    ChBCoin: TCheckBox;
    Label7: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btUSUARIOClick(Sender: TObject);
    procedure ilUSUARIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilUSUARIOEjecuta(Sender: TObject);
    procedure chbxUsuarioClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure CBxOperadorChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure ChBImporteClick(Sender: TObject);
    procedure edImporteExit(Sender: TObject);
    procedure edImporteEnter(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);

    private
    Procedure ImprimeReporte(bPreview:Boolean);
    { Private declarations }
    public
    { Public declarations } 
    Objeto : TCrbittran;
end; 
 TCrbittran= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ParamCre          : TParamCre;
        Usuario           : TUsuario;
        Acreditado        : TCrAcredit;        
        Credito           : TCrCredito;

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


constructor TCrbittran.Create( AOwner : TComponent ); 
begin Inherited;

      Usuario := TUsuario.Create(Self);
      Usuario.MasterSource := Self;
      Usuario.FieldByName('CVE_USUARIO').MasterField := 'CVE_USUARIO';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrbittran.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrbittran.Destroy;
begin
   if Usuario <> nil then
      Usuario.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;      
   If Credito <> Nil Then
      Credito.Free;      
inherited;
end;


function TCrbittran.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrbittrans;
begin
   W:=TWCrbittrans.Create(Self);
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


Function TCrbittran.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrbittr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrbittran.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrBitTrans********************)
(*                                                                              *)
(*  FORMA DE CrBitTrans                                                            *)
(*                                                                              *)
(***********************************************FORMA CrBitTrans********************)

procedure TWCrbittrans.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpFECHAIni.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Inicial.text:=FormatDateTime('dd/mm/yyyy',dtpFECHAIni.DateTime);
      dtpFECHAFin.DateTime:= Objeto.Apli.DameFechaEmpresa;      
      edF_Final.text:=FormatDateTime('dd/mm/yyyy',dtpFECHAFin.DateTime);

      Objeto.Usuario.CVE_USUARIO.Control := edCVE_USUARIO;
      Objeto.Usuario.EMPLEADO.Persona.Nombre.Control := edNOM_USUARIO;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      oBJETO.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;
      

      CBxOperador.ItemIndex := 0;

end;

procedure TWCrbittrans.FormDestroy(Sender: TObject);
begin
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;

    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
end;

procedure TWCrbittrans.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrbittrans.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrbittrans.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrbittrans.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrbittrans.btUSUARIOClick(Sender: TObject);
begin
      Objeto.Usuario.ShowAll := True;
   If Objeto.Usuario.Busca Then Begin
      chbxUsuario.Checked:=True;
      chbxUsuario.Enabled:=True;
      InterForma1.NextTab(edCVE_USUARIO);
   End;
end;

procedure TWCrbittrans.ilUSUARIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrbittrans.ilUSUARIOEjecuta(Sender: TObject);
begin
     If Objeto.Usuario.FindKey([ilUSUARIO.Buffer]) Then  Begin
        chbxUsuario.Checked:=True;
        chbxUsuario.Enabled:=True;
        InterForma1.NextTab(edCVE_USUARIO);
     end;
end;

procedure TWCrbittrans.chbxUsuarioClick(Sender: TObject);
begin
    If not chbxUsuario.Checked Then Begin
        Objeto.Usuario.Active:=False;
        chbxUsuario.Checked:=False;
        chbxUsuario.Enabled:=False;
    End Else Begin
        chbxUsuario.Checked:=True;
        chbxUsuario.Enabled:=True;
    End;
end;

procedure TWCrbittrans.ImprimeReporte(bPreview: Boolean);
Var  vloperador : String;
     vlsalida : Boolean;
     vlsisticre, vlsistint, vlsistliq,
     vlsistcoi, vlsisttasa : String;

begin
     vlsisticre := '';
     vlsistint  := '';
     vlsistliq  := '';
     vlsistcoi  := '';
     vlsisttasa := '';

    //Asigna operador lógico
     if CBxOperador.ItemIndex = 0 then
     vloperador := '=';

     if CBxOperador.ItemIndex = 1 then
     vloperador := '<=';

     if CBxOperador.ItemIndex = 2 then
     vloperador := '>=';

     //Valida Sistema Origen
  {   if rbCred.Checked = True then
     vlsistorig := 'CRE';

     if rbLiq.Checked = True then
     vlsistorig := 'LIQ';

     if rbAmbos.Checked = True then
     vlsistorig := 'AMB';   }

     //Valida Sistema Origen checks
     if ChBIcre.Checked = True then
     vlsisticre := 'CRE';

     if ChBInter.Checked = True then
     vlsistint := 'INT';

     if ChBLiqcre.Checked = True then
     vlsistliq := 'LIQ';

     if ChBCoin.Checked = True then
     vlsistcoi := 'COI';

     if ChBCambtas.Checked = True then
     vlsisttasa := 'TAS';


     //valida rango de Fechas
     if (Trim(edF_Inicial.Text)= '') or (Trim(edF_Final.Text)= '') then
     begin
      ShowMessage('   ¡ Validar Rango de Fechas !');
      vlsalida := False;
     end;
     if (StrToDate(edF_Final.Text) < StrToDate(edF_Inicial.Text)) then
     begin
      ShowMessage('   ¡ La Fecha Inicial no puede ser mayor a la Fecha Final !');
      vlsalida := False;
     end;

     if (ChBIcre.Checked = False) and (ChBInter.Checked = False) and
        (ChBLiqcre.Checked = False) and  (ChBCoin.Checked = False) and
        (ChBCambtas.Checked = False) then
     begin
      ShowMessage('   ¡ Debes seleccionar al menos un Sist. Origen !');
      vlsalida := False;
     end;


    if vlsalida then
      begin
      BitTransac( edF_Inicial.Text,
                  edF_Final.Text,
                  edCVE_USUARIO.Text,
                  edACREDITADO.Text,
                  edID_CESION.Text,
                  vloperador,
                  edImporte.Text,
                  vlsisticre,
                  vlsistint,
                  vlsistliq,
                  vlsistcoi,
                  vlsisttasa,
                  edNbrArch.Text,
                  Objeto.Apli,
                  bPreview);  

          If Trim(edNbrArch.Text)<>'' Then
            begin
              if  bGenArch then
                 ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
              else
                 ShowMessage('    No se generó el Archivo')
            end;
      end;
end;

procedure TWCrbittrans.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
     sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
     If UpperCase(sExt)= '.XLS' Then
        edNbrArch.Text := SaveDialog1.FileName
     Else
        edNbrArch.Text := SaveDialog1.FileName + '.XLS';
  End
  Else
     edNbrArch.Text := '';
end;

procedure TWCrbittrans.cbxArchivoClick(Sender: TObject);
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

procedure TWCrbittrans.CBxOperadorChange(Sender: TObject);
begin
   edImporte.SetFocus;
   edImporte.Color := clWindow;
end;

procedure TWCrbittrans.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRBITTRAN_IMPR',True,True) then
   ImprimeReporte(False);
end;

procedure TWCrbittrans.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRBITTRAN_PREV',True,True) then
   ImprimeReporte(True);
end;

procedure TWCrbittrans.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWCrbittrans.ChBImporteClick(Sender: TObject);
begin
  If not ChBImporte.Checked Then Begin
         ChBImporte.Checked:=False;
         ChBImporte.Enabled:=False;
         edImporte.Text := '';
         edImporte.Color := clBtnFace;
     End Else Begin
         ChBImporte.Checked:=True;
         ChBImporte.Enabled:=True;
         edImporte.Color := clWindow;
     End;
end;

procedure TWCrbittrans.edImporteExit(Sender: TObject);
begin
  if edImporte.Text <> '' then
    begin
     ChBImporte.Enabled:=True;
     ChBImporte.Checked:=True;
    end
    else
    edImporte.Color := clBtnFace; 

end;

procedure TWCrbittrans.edImporteEnter(Sender: TObject);
begin
    edImporte.Color := clWindow;
end;

procedure TWCrbittrans.btID_CESIONClick(Sender: TObject);
begin
      Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWCrbittrans.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrbittrans.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWCrbittrans.chbxCESIONClick(Sender: TObject);
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

procedure TWCrbittrans.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWCrbittrans.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrbittrans.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWCrbittrans.chbxAcreditadoClick(Sender: TObject);
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

end.

