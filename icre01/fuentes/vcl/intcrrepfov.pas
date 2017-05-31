// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 04/03/2011
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Gerardo Sandoval Suarez
// Comentarios     :
Unit IntCrRepFov;

interface                                     

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
IntParamCre,
IntCrCredito,
IntCrCre,
IntQRRepFov
;

Type
 TCrRepFov= class; 

  TWCrRepFov=Class(TForm)
    InterForma1             : TInterForma;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    ilCesion: TInterLinkit;
    chbxCESION: TCheckBox;
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
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    chbxFechas: TCheckBox;
    GroupBox2: TGroupBox;
    chbxColocacion: TCheckBox;
    chbxTraspasos: TCheckBox;
    chbxCobranza: TCheckBox;
    chbxProvision: TCheckBox;
    chbxCapitalizacion: TCheckBox;
    Label1: TLabel;
    edBuscar1: TSpeedButton;
    Label4: TLabel;
    RadioGroupTran: TRadioGroup;
    RBTranAC: TRadioButton;
    RBTranCA: TRadioButton;
    RBTranIN: TRadioButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxFechasClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    private 
    { Private declarations }
     Procedure ImprimeReporte(bPreview:Boolean);
    public 
    { Public declarations } 
    Objeto : TCrRepFov;
end; 
 TCrRepFov= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre    : TParamCre;
        Credito     : TCrCre; //: TCrCredito;//Disposición
        VGID_CREDITO     : Integer;
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


constructor TCrRepFov.Create( AOwner : TComponent ); 
begin Inherited;
      Credito := TCrCre.Create(Self);//TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      VGID_CREDITO := 0;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrRepFov.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrRepFov.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
inherited;
end;


function TCrRepFov.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRepFov;
begin
   W:=TWCrRepFov.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrRepFov.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRepFov.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrRepFov.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrRepFov.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
        lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
        lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
        lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
        lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

        dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
        dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
        edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
        edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);
        chbxFechas.Checked:=True;
        RBTranIN.Checked:=True;
        chbxColocacion.Checked:=True;
        chbxCapitalizacion.Checked:=True;
        chbxProvision.Checked:=True;
        chbxTraspasos.Checked:=True;
        chbxCobranza.Checked:=True;
        Objeto.Credito.ID_CREDITO.Control := edID_CESION;
        Objeto.Credito.GetParams(Objeto);
        edCESION.ShowHint := True;
        if Objeto.VGID_CREDITO <> 0 then
        begin
                if Objeto.Credito.FindKey([IntToStr(Objeto.VGID_CREDITO)]) then
                begin
                chbxCESION.Checked:=True;
                chbxCESION.Enabled:=True;
                end;
        end;
end;

procedure TWCrRepFov.FormDestroy(Sender: TObject);
begin
      //Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCrRepFov.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWCrRepFov.btID_CESIONClick(Sender: TObject);
   var
      Q : Tquery;
      SQL: string;
begin
   //Objeto.Credito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
        SQL:= 'SELECT cre_credito.id_credito, contrato.id_contrato, persona.nombre, '+
         '      cre_credito.imp_credito,                                       '+
         '      cre_credito.f_valor_cred + cre_credito.dias_plazo,             '+
         '      cre_credito.sit_credito                                        '+
         ' FROM cre_credito, persona, contrato, cre_contrato, cre_sub_tip_bco  '+
         ' WHERE (cre_credito.id_credito = '+ Objeto.CREDITO.ID_CREDITO.AsSQL+' )'+
         '  AND contrato.id_contrato = cre_credito.id_contrato                 '+
         '  AND persona.id_persona = contrato.id_titular                       '+
         '  AND cre_contrato.id_contrato = contrato.id_contrato                '+
         '  AND cre_contrato.cve_sub_tip_bco = cre_sub_tip_bco.cve_sub_tip_bco ';
        Q := GetSqlQuery(SQL,Objeto.DataBaseName,Objeto.SessionName,True);
        if Q<>nil then
        begin
            try
                    edCESION.Text := Q.FieldByName('NOMBRE').AsString;
            Finally
                    Q.Free;
            end;
        end;
   End;
   
end;

procedure TWCrRepFov.chbxFechasClick(Sender: TObject);
begin
    If not chbxFechas.Checked Then Begin
        edF_Inicio.Text:= '';
        edF_FIN.Text:= '';
        chbxFechas.Checked:=False;
        chbxFechas.Enabled:=False;
    End Else Begin
        chbxFechas.Checked:=True;
        chbxFechas.Enabled:=True;
    End;
end;


procedure TWCrRepFov.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrRepFov.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWCrRepFov.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.PRN' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End Else
    edNbrArch.Text := '';
end;

procedure TWCrRepFov.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TWCrRepFov.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRREPFOV_PREVI',True,True) then
     ImprimeReporte(True);
end;

Procedure TWCrRepFov.ImprimeReporte(bPreview:Boolean);
begin
   if (NOT chbxColocacion.Checked) and (NOT chbxTraspasos.Checked)  and (NOT chbxCobranza.Checked)
        and (NOT chbxProvision.Checked) and (NOT chbxCapitalizacion.Checked)  then
        ShowMessage('Debe seleccionar al menos un Tipo de Evento(s)')
   else
   begin
        //ShowMessage('Aqui debe se ir el llamado al reporte');
        ReporteFovis(chbxFechas.Checked,
                     RBTranAC.Checked,
                     RBTranCA.Checked,
                     RBTranIN.Checked,
                     chbxColocacion.Checked,
                     chbxTraspasos.Checked,
                     chbxCobranza.Checked,
                     chbxProvision.Checked,
                     chbxCapitalizacion.Checked,
                     chbxCESION.Checked,
                     edID_CESION.Text,
                     edF_Inicio.Text,
                     edF_Fin.Text,
                     EdNbrArch.Text, objeto.Apli, bPreview);
   end;
   

end;

procedure TWCrRepFov.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRREPFOV_IMPRI',True,True) then
      ImprimeReporte(False);
end;


end.
