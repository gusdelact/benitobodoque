// Sistema         : Clase de CrDispLiq
// Fecha de Inicio : 03/09/2013
// Función forma   : Clase de CrDispLiq
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrdispliq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre,
IntMQrDispLiq  //Reporte
;

Type
 TCrdispliq= class; 

  TWCrdispliq=Class(TForm)
    InterForma1             : TInterForma;
    Label6: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edF_Inicial: TEdit;
    Label8: TLabel;
    edF_Final: TEdit;
    dtpFECHAIni: TInterDateTimePicker;
    dtpFECHAFin: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private 
    Procedure ImprimeReporte(bPreview:Boolean);
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrdispliq;
end; 
 TCrdispliq= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        ParamCre          : TParamCre;

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


constructor TCrdispliq.Create( AOwner : TComponent ); 
begin Inherited; 


      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrdispliq.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrdispliq.Destroy;
begin inherited;
end;


function TCrdispliq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrdispliq;
begin
   W:=TWCrdispliq.Create(Self);
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


Function TCrdispliq.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrdispl.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrdispliq.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrDispLiq********************)
(*                                                                              *)
(*  FORMA DE CrDispLiq                                                            *)
(*                                                                              *)
(***********************************************FORMA CrDispLiq********************)

procedure TWCrdispliq.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

procedure TWCrdispliq.FormDestroy(Sender: TObject);
begin
//      Objeto.CAMPO1.Control:=nil;
end;

procedure TWCrdispliq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrdispliq.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrdispliq.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


procedure TWCrdispliq.ImprimeReporte(bPreview: Boolean);
var vlsalida : Boolean;
begin
     //valida rango de Fechas
     if (Trim(edF_Inicial.Text)= '') or (Trim(edF_Final.Text)= '') then
     begin
      ShowMessage('   ¡ Validar Rango de Fechas !');
      vlsalida := False;
     end
     else if (Trim(edF_Inicial.Text) > Trim(edF_Final.Text)) then
     begin
      ShowMessage('   ¡ La Fecha Inicial no puede ser mayor a la Fecha Final !');
      vlsalida := False;
     end
     else if (Trim(edF_Final.Text) < Trim(edF_Inicial.Text)) then
     begin
      ShowMessage('   ¡ La Fecha Final no puede ser menor a la Fecha Inicial !');
      vlsalida := False;
     end;


    if vlsalida then
      begin
      RepLiqDispo( edF_Inicial.Text,
                     edF_Final.Text,
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

procedure TWCrdispliq.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRDISPLIQ_IMPR',True,True) then
   ImprimeReporte(False);
end;

procedure TWCrdispliq.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRDISPLIQ_PREV',True,True) then
   ImprimeReporte(True);
end;

procedure TWCrdispliq.sbExcelClick(Sender: TObject);
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

procedure TWCrdispliq.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWCrdispliq.cbxArchivoClick(Sender: TObject);
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

procedure TWCrdispliq.InterForma1DespuesShow(Sender: TObject);
var
  vlsql, vlsql1, vlfini,vlffin : String;
begin
      dtpFECHAIni.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpFECHAFin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      //obtiene primer día de mes anterior menos 1
      vlsql := 'select trunc(to_date('''+DateToStr(IncMonth(dtpFECHAIni.Date,-1))+''',''dd/mm/yyyy''),''MON'') -1 as fecha from dual';
      GetSqlStr(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfini, False);
      edF_Inicial.text:= vlfini;
      //obtiene último día de mes anterior mas 1
      vlsql1 := 'select last_day(to_date('''+DateToStr(IncMonth(dtpFECHAIni.Date,-1))+''',''dd/mm/yyyy'')) + 1 as fecha  from dual';
      GetSqlStr(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlffin, False);
      edF_Final.text:= vlffin;
end;

end.
