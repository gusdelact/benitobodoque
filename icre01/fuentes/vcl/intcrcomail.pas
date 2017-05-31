// Sistema         : Clase de CRCOMAIL
// Fecha de Inicio : 25/11/2003
// Función forma   : Clase de CRCOMAIL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrCoMail;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,
//Unidades adcionales
IntCrEmaEnv,IntCrCredito, IntParamCre,IntGenCre, IntLinkit;

Type
 TCrCoMail= class;

  TWCrCoMail=Class(TForm)
    InterForma1             : TInterForma;
    edDISPOSICION: TEdit;
    Label10: TLabel;
    btDISPOSICION: TBitBtn;
    edTIT_DISPOSICION: TEdit;
    btFOLIO: TBitBtn;
    edNUM_FOLIO: TEdit;
    Label6: TLabel;
    Label17: TLabel;
    edF_INICIAL: TEdit;
    dtF_INICIAL: TInterDateTimePicker;
    Label5: TLabel;
    edF_FINAL: TEdit;
    dtF_FINAL: TInterDateTimePicker;
    btBUSCA: TBitBtn;
    Edit7: TEdit;
    Edit3: TEdit;
    edTIT_MODO_PAGO: TEdit;
    edTIT_FECHA: TEdit;
    sgcDATOS: TSGCtrl;
    btREPORTE: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSITUACION: TRadioGroup;
    edTITULO: TEdit;
    Label19: TLabel;
    chB_APLICA_FOLIO: TCheckBox;
    chB_APLICA_DISP: TCheckBox;
    ilFOLIO: TInterLinkit;
    ilDISPOSICION: TInterLinkit;
    GroupBox1: TGroupBox;
    mTEXTO_FINAL: TMemo;
    cbB_SITUACION: TCheckBox;
    Edit1: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btFOLIOClick(Sender: TObject);
    procedure ilFOLIOEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btDISPOSICIONClick(Sender: TObject);
    procedure ilDISPOSICIONEjecuta(Sender: TObject);
    procedure chB_APLICA_FOLIOClick(Sender: TObject);
    procedure chB_APLICA_DISPClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure sgcDATOSMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure edNUM_FOLIOExit(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
    procedure dtF_INICIALExit(Sender: TObject);
    procedure btREPORTEClick(Sender: TObject);
    private
    { Private declarations }
    Function  CadenaSql : String;
    Procedure MuestraDatos;

    public
    { Public declarations }
    Objeto : TCrCoMail;
end;
 TCrCoMail= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        NUM_FOLIO                : TInterCampo;
        ID_CREDITO               : TInterCampo;
        SITUACION                : TInterCampo;
        F_INICIAL                : TInterCampo;
        F_FINAL                  : TInterCampo;
        B_APLICA_FOLIO           : TInterCampo;
        B_APLICA_CREDITO         : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        EmailEnv                 : TCrEmaEnv;
        Credito                  : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
Uses IntCrQREmail;//IntMCrMailEn;

{$R *.DFM}


constructor TCrCoMail.Create( AOwner : TComponent );
begin Inherited;
      NUM_FOLIO :=CreaCampo('NUM_FOLIO',ftFloat,tsNinguno,tsNinguno,False);
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
      With SITUACION do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_EN);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_ER);
      end;
      F_INICIAL :=CreaCampo('F_INICIAL',ftDate,tsNinguno,tsNinguno,False);
      F_FINAL :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
      B_APLICA_FOLIO :=CreaCampo('B_APLICA_FOLIO',ftString,tsNinguno,tsNinguno,False);
      B_APLICA_CREDITO :=CreaCampo('B_APLICA_CREDITO',ftString,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCoMail.Hlp';
      ShowMenuReporte:=True;

      EmailEnv := TCrEmaEnv.Create(Self);
      EmailEnv.MasterSource:=Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
end;

Destructor TCrCoMail.Destroy;
begin
   if EmailEnv <> nil then
      EmailEnv.free;
   //end if
   if Credito <> nil then
      Credito.free;
   //end if
   inherited;
end;


function TCrCoMail.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoMail;
begin
   W:=TWCrCoMail.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCoMail.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcomai.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CRCOMAIL********************)
(*                                                                              *)
(*  FORMA DE CRCOMAIL                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCOMAIL********************)

Function TWCrCoMail.CadenaSql : String;
var vlSql     : String;
Begin
   Objeto.F_INICIAL.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
   Objeto.NUM_FOLIO.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.SITUACION.GetFromControl;

   vlSql  := ' SELECT NUM_FOLIO, ' +
             '        FH_ENVIO, ' +
             '        ID_CREDITO, ' +
             '        F_ENVIO, ' +
             '        SUBSTR(TITULO_FINAL  ,    1 ,  255 ) TITULO_FINAL, ' +
             '        SUBSTR(TEXTO_FINAL ,      1 ,  255 ) TEXTO_FINAL, ' +
             '        SUBSTR( DESTINATARIO ,    1 ,  255 ) DESTINATARIO, ' +
             '        SIT_ENVIO_EMAIL ' +
             ' FROM   CR_EMAIL_ENVIO ' +
             ' WHERE  F_ENVIO BETWEEN TO_DATE(' + #39 + edF_INICIAL.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +
                                  ') AND TO_DATE('+ #39 + edF_FINAL.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')';

   if chB_APLICA_FOLIO.Checked then
      vlSql := vlSql + ' AND NUM_FOLIO = ' + Objeto.NUM_FOLIO.AsString;
   //end if

   if chB_APLICA_DISP.Checked then
   Begin
      vlSql := vlSql + ' AND ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
   end;

   IF cbB_SITUACION.Checked THEN
   BEGIN
     if Objeto.SITUACION.AsString = CSIT_EN then
        vlsql := vlsql + 'AND SIT_ENVIO_EMAIL = ' + #39 + CSIT_EN + #39
     else if Objeto.SITUACION.AsString = CSIT_ER then
        vlsql := vlsql + 'AND SIT_ENVIO_EMAIL = ' + #39 + CSIT_ER + #39;
   END;

   CadenaSql := vlSql + ' ORDER BY NUM_FOLIO, ID_CREDITO ';
end;

Procedure TWCrCoMail.MuestraDatos;
var vlQry : TQuery;
begin
  vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('NUM_FOLIO').Visible := False;
            vlQry.FieldByName('F_ENVIO').Visible := False;
            vlQry.FieldByName('TEXTO_FINAL').Visible := False;

            vlQry.FieldByName('FH_ENVIO').DisplayLabel := 'FECHA ENVIO' + #30 +'>C';
            vlQry.FieldByName('ID_CREDITO').DisplayLabel := 'DISPOSICION' + #30 +'>C';
            vlQry.FieldByName('TITULO_FINAL').DisplayLabel := 'TITULO' + #30 +'>C';
            vlQry.FieldByName('DESTINATARIO').DisplayLabel := 'DESTINATARIO' + #30 +'>C';
            vlQry.FieldByName('SIT_ENVIO_EMAIL').DisplayLabel := 'SITUACION' + #30 +'>C';

            vlQry.FieldByName('FH_ENVIO').DisplayWidth := 22;
            vlQry.FieldByName('ID_CREDITO').DisplayWidth := 10;
            vlQry.FieldByName('TITULO_FINAL').DisplayWidth := 32;
            vlQry.FieldByName('DESTINATARIO').DisplayWidth := 40;
            vlQry.FieldByName('SIT_ENVIO_EMAIL').DisplayWidth := 4;

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
           sgcDATOS.Clear('NO SE ENCONTRARON DATOS'#30'>C');
        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCrCoMail.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.NUM_FOLIO.Control := edNUM_FOLIO;
      Objeto.EmailEnv.NUM_FOLIO.Control := edNUM_FOLIO;
      Objeto.EmailEnv.TITULO_FINAL.Control := edTITULO;
      Objeto.ID_CREDITO.Control := edDISPOSICION;
      Objeto.Credito.ID_CREDITO.Control := edDISPOSICION;
      Objeto.Credito.ContratoCre.Acreditado.Persona.Nombre.Control :=  edTIT_DISPOSICION;
      Objeto.B_APLICA_FOLIO.Control := chB_APLICA_FOLIO;
      Objeto.B_APLICA_CREDITO.Control := chB_APLICA_DISP;
      Objeto.F_INICIAL.Control :=  edF_INICIAL;
      Objeto.F_FINAL.Control :=  edF_FINAL;
      Objeto.SITUACION.Control := rgSITUACION;

end;

procedure TWCrCoMail.FormDestroy(Sender: TObject);
begin
      Objeto.NUM_FOLIO.Control := nil;
      Objeto.EmailEnv.NUM_FOLIO.Control := nil;
      Objeto.EmailEnv.TITULO_FINAL.Control := nil;
      Objeto.ID_CREDITO.Control := nil;
      Objeto.Credito.ID_CREDITO.Control := nil;
      Objeto.Credito.ContratoCre.Acreditado.Persona.Nombre.Control :=  nil;
      Objeto.B_APLICA_FOLIO.Control := nil;
      Objeto.B_APLICA_CREDITO.Control := nil;
      Objeto.F_INICIAL.Control :=  nil;
      Objeto.F_FINAL.Control :=  nil;
      Objeto.SITUACION.Control := nil;
end;

procedure TWCrCoMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCoMail.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCoMail.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


procedure TWCrCoMail.btFOLIOClick(Sender: TObject);
begin
   Objeto.EmailEnv.ShowAll := True;
   if Objeto.EmailEnv.Busca then
   Begin
      chB_APLICA_FOLIO.Checked := True;
      chB_APLICA_FOLIO.Enabled := True;
      InterForma1.NextTab(edNUM_FOLIO);
   end;
end;

procedure TWCrCoMail.ilFOLIOEjecuta(Sender: TObject);
begin
   if objeto.EmailEnv.FindKey([ilFOLIO.Buffer]) then
   Begin
      chB_APLICA_FOLIO.Checked := True;
      chB_APLICA_FOLIO.Enabled := True;
      InterForma1.NextTab(edNUM_FOLIO);
   end;
end;

procedure TWCrCoMail.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.F_INICIAL.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   rgSITUACION.ItemIndex := 0;
end;

procedure TWCrCoMail.btDISPOSICIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   Begin
      chB_APLICA_DISP.Checked := True;
      chB_APLICA_DISP.Enabled := True;
      InterForma1.NextTab(edDISPOSICION);
   end;
end;

procedure TWCrCoMail.ilDISPOSICIONEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilDISPOSICION.Buffer]) then
   Begin
      chB_APLICA_DISP.Checked := True;
      chB_APLICA_DISP.Enabled := True;
      InterForma1.NextTab(edDISPOSICION);
   end;
end;

procedure TWCrCoMail.chB_APLICA_FOLIOClick(Sender: TObject);
begin
   if not(chB_APLICA_FOLIO.Checked) then
   Begin
      Objeto.EmailEnv.Active := False;
      chB_APLICA_FOLIO.Checked := False;
      chB_APLICA_FOLIO.Enabled := False;
      Objeto.Credito.BuscaWhereString := '';
      Objeto.Credito.FilterString := Objeto.Credito.BuscaWhereString;
   end
   else
   Begin
      chB_APLICA_FOLIO.Checked := True;
      chB_APLICA_FOLIO.Enabled := True;
   end;
end;

procedure TWCrCoMail.chB_APLICA_DISPClick(Sender: TObject);
begin
   if not(chB_APLICA_DISP.Checked) then
   Begin
      Objeto.Credito.Active := False;
      chB_APLICA_DISP.Checked := False;
      chB_APLICA_DISP.Enabled := False;
   end
   else
   Begin
      chB_APLICA_DISP.Checked := True;
      chB_APLICA_DISP.Enabled := True;
   end;
end;

procedure TWCrCoMail.btBUSCAClick(Sender: TObject);
VAR FECHATIME: TDateTime;
begin
   MuestraDatos;
end;

procedure TWCrCoMail.sgcDATOSMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
var vlTexto    : string;
    DataSet    : TDataSet;
begin
   mTEXTO_FINAL.Clear;
   vlTexto:= textcorre(sgcDATOS.CellStr['TEXTO_FINAL',ToIndex]);
   mTEXTO_FINAL.Lines.Add(vlTexto);
end;

procedure TWCrCoMail.edNUM_FOLIOExit(Sender: TObject);
begin
   Objeto.Credito.BuscaWhereString := ' CR_CREDITO.ID_CREDITO IN (SELECT ID_CREDITO FROM CR_EMAIL_ENVIO ' +
                                      ' WHERE NUM_FOLIO = ' +  edNUM_FOLIO.Text + ' )';
   Objeto.Credito.FilterString := Objeto.Credito.BuscaWhereString
end;

procedure TWCrCoMail.edF_FINALExit(Sender: TObject);
begin
   Objeto.F_INICIAL.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
      if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime) then
      Begin
         ShowMessage('La fecha inicial no debe de ser mayor a la fecha final');
         edF_FINAL.SetFocus;
      end;
end;

procedure TWCrCoMail.dtF_INICIALExit(Sender: TObject);
begin
   Objeto.F_INICIAL.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
      if (Objeto.F_INICIAL.AsDateTime > Objeto.F_FINAL.AsDateTime) then
      Begin
         ShowMessage('La fecha inicial no debe de ser mayor a la fecha final');
         edF_INICIAL.SetFocus;
      end
end;

procedure TWCrCoMail.btREPORTEClick(Sender: TObject);
begin
   Objeto.NUM_FOLIO.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.SITUACION.GetFromControl;
   Objeto.F_INICIAL.AsString := edF_INICIAL.Text;
   Objeto.F_FINAL.AsString := edF_FINAL.Text;
   Objeto.B_APLICA_FOLIO.GetFromControl;
   Objeto.B_APLICA_CREDITO.GetFromControl;
   Execute_RepEmail(True, Objeto);
end;


end.
