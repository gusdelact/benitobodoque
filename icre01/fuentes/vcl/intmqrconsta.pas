// Sistema         : Clase de MQRCONSTANCIAS
// Fecha de Inicio : 26/01/2005
// Función forma   : Clase de MQRCONSTANCIAS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo          
// Comentarios     :
Unit IntMqrconsta;

interface
                                                     
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, QRPrntr, Printers,

  IntCrCre,        // Disposición INTERCREDITOS
  IntPers,         // Persona
  IntEmpre,        // Empresa
  IntSatConst,     // Funciones Comúnes para las constancias
  IntQrSatCrlayo,  // Reporte de Constancia 1
  IntQrSatCrlayo2, // Reporte de Constancia 2
  IntQrSatHipAv,   // Reporte de Aviso Constancia 1
  IntGenCre,
  IntCrCredito     // Disposición ICRE
;

Type
 TMqrconsta= class; 

  TWMqrconstancias=Class(TForm)
    InterForma1             : TInterForma;
    Label3: TLabel;
    edID_CREDITO_INI: TEdit;
    btnCredito_Ini: TBitBtn;
    edNOM_CREDITO_INI: TEdit;
    chkCredito_Ini: TCheckBox;
    Label1: TLabel;
    edID_CREDITO_FIN: TEdit;
    btnCredito_Fin: TBitBtn;
    edNOM_CREDITO_FIN: TEdit;
    chkCredito_Fin: TCheckBox;
    rgConstancia: TRadioGroup;
    edNOM_RETENEDOR: TEdit;
    lblNOM_RETENEDOR: TLabel;
    lbID_EMPRESA: TLabel;
    edID_EMPRESA: TEdit;
    btnID_EMPRESA: TBitBtn;
    edNOM_RAZON_SOCIAL: TEdit;
    Label4: TLabel;
    edID_REPRESENTA: TEdit;
    btnID_REPRESENTANTE: TBitBtn;
    edNOM_REPRESENTANTE: TEdit;
    lbEJERCICIO: TLabel;
    edEJERCICIO: TEdit;
    chkIdREPRESENTANTE: TCheckBox;
    Label2: TLabel;
    ilID_EMPRESA: TInterLinkit;
    ilID_CREDITO_INI: TInterLinkit;
    ilID_CREDITO_FIN: TInterLinkit;
    ilID_REPRESENTA: TInterLinkit;
    chkAlimentacionHojas: TCheckBox;
    edCURPRepresentante: TEdit;
    Label5: TLabel;
    CBcopia: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btnCredito_IniClick(Sender: TObject);
    procedure btnID_EMPRESAClick(Sender: TObject);
    procedure btnCredito_FinClick(Sender: TObject);
    procedure btnID_REPRESENTANTEClick(Sender: TObject);
    procedure ilID_EMPRESACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_EMPRESAEjecuta(Sender: TObject);
    procedure ilID_CREDITO_INIEjecuta(Sender: TObject);
    procedure ilID_CREDITO_FINEjecuta(Sender: TObject);
    procedure ilID_REPRESENTAEjecuta(Sender: TObject);
    procedure chkCredito_IniClick(Sender: TObject);
    procedure chkCredito_FinClick(Sender: TObject);
    procedure chkIdREPRESENTANTEClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edEJERCICIOExit(Sender: TObject);
    private
    { Private declarations }
      procedure ImprimeConstancia(peB_PREVIEW : Boolean);
      function BuscaCreditoConstancia(var psID_CREDITO : Integer) : Boolean;
    public
    { Public declarations }
    Objeto : TMqrconsta;
end;
 TMqrconsta= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA       : TInterCampo;
        ID_REPRESENTA    : TInterCampo;
        EJERCICIO        : TInterCampo;
        ID_CREDITO_INI   : TInterCampo;
        ID_CREDITO_FIN   : TInterCampo;

        Credito_Ini : TCrCre;     // Disposición de Intercréditos
        Credito_Fin : TCrCre;     // Disposición de Intercréditos

        Credito_Ini2 : TCrCredito;     // Disposición de ICRE
        Credito_Fin2 : TCrCredito;     // Disposición de ICRE

        Empresa     : TEmpresa;   // Empresa
        Persona     : TPersona;   // Persona

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TMqrconsta.Create( AOwner : TComponent );
begin Inherited;
      ID_EMPRESA     := CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
      ID_REPRESENTA  := CreaCampo('ID_REPRESENTA',ftInteger,tsNinguno,tsNinguno,False);
      EJERCICIO      := CreaCampo('EJERCICIO',ftInteger,tsNinguno,tsNinguno,False);
      ID_CREDITO_INI := CreaCampo('ID_CREDITO_INI',ftInteger,tsNinguno,tsNinguno,False);
      ID_CREDITO_FIN := CreaCampo('ID_CREDITO_FIN',ftInteger,tsNinguno,tsNinguno,False);

      Empresa := TEmpresa.Create(Self);
      Empresa.MasterSource:=Self;
      Empresa.FieldByName('ID_EMPRESA').MasterField:='ID_EMPRESA';

      Credito_Ini := TCrCre.Create(Self);
      Credito_Ini.MasterSource:=Self;
      Credito_Ini.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Credito_Fin := TCrCre.Create(Self);
      Credito_Fin.MasterSource:=Self;
      Credito_Fin.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';


      Credito_Ini2 := TCrCredito.Create(Self);
      Credito_Ini2.MasterSource:=Self;
      Credito_Ini2.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Credito_Fin2 := TCrCredito.Create(Self);
      Credito_Fin2.MasterSource:=Self;
      Credito_Fin2.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';      

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMqrconsta.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMqrconsta.Destroy;
begin
 If Assigned(Credito_Ini)  Then Credito_Ini.Free;
 If Assigned(Credito_Fin)  Then Credito_Fin.Free;
 If Assigned(Credito_Ini2)  Then Credito_Ini2.Free;
 If Assigned(Credito_Fin2)  Then Credito_Fin2.Free;
 If Assigned(Empresa)      Then Empresa.Free;
 If Assigned(Persona)      Then Persona.Free;
 inherited;
end;


function TMqrconsta.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMqrconstancias;
begin
   W:=TWMqrconstancias.Create(Self);
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

Function TMqrconsta.InternalBusca:Boolean;
Var T:TInterFindit;
begin
      InternalBusca := False;
      T := CreaBuscador('IMqrcons.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA MQRCONSTANCIAS********************)
(*                                                                              *)
(*  FORMA DE MQRCONSTANCIAS                                                            *)
(*                                                                              *)
(***********************************************FORMA MQRCONSTANCIAS********************)

procedure TWMqrconstancias.FormShow(Sender: TObject);
var vlYear, vlMonth, vlDay : Word;
begin
 With Objeto Do
  Begin
  ID_EMPRESA.Control     := edID_EMPRESA;
  ID_REPRESENTA.Control  := edID_REPRESENTA;
  EJERCICIO.Control      := edEJERCICIO;
  ID_CREDITO_INI.Control := edID_CREDITO_INI;
  ID_CREDITO_FIN.Control := edID_CREDITO_FIN;

  Credito_Ini.ID_CREDITO.Control    := edID_CREDITO_INI;
  Credito_Ini.Autorizacion.Contrato.TITNombre.Control := edNOM_CREDITO_INI;
  Credito_Ini.GetParams(Objeto);

  Credito_Fin.ID_CREDITO.Control    := edID_CREDITO_FIN;
  Credito_Fin.Autorizacion.Contrato.TITNombre.Control := edNOM_CREDITO_FIN;
  Credito_Fin.GetParams(Objeto);


  Credito_Ini2.ID_CREDITO.Control := edID_CREDITO_INI;
  Credito_Ini2.ContratoCre.Contrato.TITNombre.Control := edNOM_CREDITO_INI;
  Credito_Ini2.GetParams(Objeto);

  Credito_Fin2.ID_CREDITO.Control := edID_CREDITO_FIN;
  Credito_Fin2.ContratoCre.Contrato.TITNombre.Control := edNOM_CREDITO_INI;
  Credito_Fin2.GetParams(Objeto);


  Empresa.ID_EMPRESA.Control    := edID_EMPRESA;
  Empresa.PersonaMoral.Nombre.Control := edNOM_RAZON_SOCIAL;
  Empresa.GetParams(Objeto);

  Persona.ID_PERSONA.Control    := edID_REPRESENTA;
  Persona.Nombre.Control        := edNOM_REPRESENTANTE;
  Persona.GetParams(Objeto);

  // Inicializa Valores del Reporte
  DecodeDate(Objeto.Apli.DameFechaEmpresa, vlYear, vlMonth, vlDay);
  EJERCICIO.AsInteger := vlYear - 1;
  If Empresa.FindKey([2]) Then
   ID_EMPRESA.AsInteger := Empresa.ID_EMPRESA.AsInteger;

  If Persona.FindKey([107]) Then
   Begin
   ID_REPRESENTA.AsInteger := Persona.ID_PERSONA.AsInteger;
   chkIdREPRESENTANTE.Enabled := True;
   chkIdREPRESENTANTE.Checked := True;
   End;
  End;

end;

procedure TWMqrconstancias.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_EMPRESA.Control     := Nil;
  ID_REPRESENTA.Control  := Nil;
  EJERCICIO.Control      := Nil;
  ID_CREDITO_INI.Control := Nil;
  ID_CREDITO_FIN.Control := Nil;

  Credito_Ini.ID_CREDITO.Control    := Nil;
  Credito_Ini.Autorizacion.Contrato.TITNombre.Control := Nil;

  Credito_Fin.ID_CREDITO.Control    := Nil;
  Credito_Fin.Autorizacion.Contrato.TITNombre.Control := Nil;

  Empresa.ID_EMPRESA.Control    := Nil;
  Empresa.PersonaMoral.Nombre.Control := Nil;

  Persona.ID_PERSONA.Control    := Nil;
  Persona.Nombre.Control        := Nil;
  End;
end;

procedure TWMqrconstancias.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMqrconstancias.ImprimeConstancia(peB_PREVIEW : Boolean);

  function Total_x_Imprimir(peEJERCICIO, peID_EMPRESA, peID_CREDITO_INI, peID_CREDITO_FIN : Integer) : Integer;
  var vlTOTAL_X_IMPRIMIR : Integer;
  begin
     vlTOTAL_X_IMPRIMIR := 0;
     GetSQLInt('SELECT COUNT(*) AS TOTAL_X_IMPRIMIR FROM SAT_CRE_LAYOUT'+coCRLF+
               'WHERE ID_EMPRESA = '+IntToStr(peID_EMPRESA)+coCRLF+
               '  AND EJERCICIO = '+IntToStr(peEJERCICIO)+coCRLF+
               '  AND ID_CREDITO BETWEEN '+IntToStr(peID_CREDITO_INI)+' AND '+IntToStr(peID_CREDITO_FIN)+coCRLF+
               '  AND F_IMPRESION IS NULL', Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,
               'TOTAL_X_IMPRIMIR', vlTOTAL_X_IMPRIMIR, False
               );
    Result := vlTOTAL_X_IMPRIMIR;
  end;

var vlSQL : String;
    vlImprimePapel : Boolean;
    vlCopias : Integer;    
begin
 With Objeto Do
  Begin
    // Obtiene los valores de los Controles
    ID_EMPRESA.GetFromControl;
    ID_REPRESENTA.GetFromControl;
    EJERCICIO.GetFromControl;
    ID_CREDITO_INI.GetFromControl;
    ID_CREDITO_FIN.GetFromControl;

    // Validaciones
    If (EJERCICIO.AsInteger < 0) Then
     Begin
     MessageDlg('ERROR: Debe de indicar el Ejercicio para poder continuar. Favor de Indicarlo.',
                mtError, [mbOk], 0);
     If edEJERCICIO.CanFocus Then edEJERCICIO.SetFocus;
     Exit;
     End;

    If (ID_CREDITO_FIN.AsInteger < ID_CREDITO_INI.AsInteger) Then
     Begin
     MessageDlg('ERROR: El Crédito Final no puede ser menor que el Crédito Inicial. Favor de Verificar.',
                mtError, [mbOk], 0);
     If edID_CREDITO_FIN.CanFocus Then edID_CREDITO_FIN.SetFocus;
     Exit;
     End;

    If (ID_REPRESENTA.AsInteger < 0) Then
     Begin
     MessageDlg('ERROR: Debe de indicar un representante para poder continuar. Favor de Indicarlo.',
                mtError, [mbOk], 0);
     If edID_REPRESENTA.CanFocus Then edID_REPRESENTA.SetFocus;
     Exit;
     End;



    // Envía el proceso
    vlSQL := ArmaQryConstanciaSAT(ID_EMPRESA.AsInteger, Persona.ID_PERSONA.AsInteger, EJERCICIO.AsInteger,
                                  ID_CREDITO_INI.AsInteger, ID_CREDITO_FIN.AsInteger );
    Case rgConstancia.ItemIndex Of
      0 : Begin
             vlImprimePapel := False;
             RepSatHipAv(EJERCICIO.AsInteger, ID_CREDITO_INI.AsInteger, ID_CREDITO_FIN.AsInteger, Apli, peB_PREVIEW);
          End;
      1 : Begin
             if CBcopia.Checked then vgLeyenda_COPIA_1:=True
             else vgLeyenda_COPIA_1:=False;

             vlImprimePapel := RepConstancias(vlSQL, edNOM_RETENEDOR.Text, Apli, peB_PREVIEW, vlCopias );
          End;
      2 : Begin
             if CBcopia.Checked then vgLeyenda_COPIA_2:=True
             else vgLeyenda_COPIA_2:=False;

             vlImprimePapel := RepConstancias2(vlSQL, edNOM_RETENEDOR.Text, edCURPRepresentante.Text, Apli, peB_PREVIEW, vlCopias, chkAlimentacionHojas.Checked);
          End;
    Else
      vlImprimePapel := False;
    End;

    // Si se mando a la Impresora...
    If vlImprimePapel Then
     // Confirma si existén créditos por colocar Fecha de Impresión
     If Total_x_Imprimir(EJERCICIO.AsInteger, ID_EMPRESA.AsInteger,
                          ID_CREDITO_INI.AsInteger, ID_CREDITO_FIN.AsInteger ) > 0 Then
        CambiaBanderaImprConst(EJERCICIO.AsInteger, ID_EMPRESA.AsInteger,
                               ID_CREDITO_INI.AsInteger, ID_CREDITO_FIN.AsInteger,
                               vlCopias, True, Objeto.Apli);
  End;
end;

procedure TWMqrconstancias.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TSATCRELAY_PREVI',True,True) then
      ImprimeConstancia(True);
end;

procedure TWMqrconstancias.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TSATCRELAY_IMPRI',True,True) then
      ImprimeConstancia(False);
end;

procedure TWMqrconstancias.btnID_EMPRESAClick(Sender: TObject);
begin
 With Objeto Do
   If Empresa.Busca Then
     ID_EMPRESA.AsInteger := Empresa.ID_EMPRESA.AsInteger;
end;


function TWMqrconstancias.BuscaCreditoConstancia(var psID_CREDITO : Integer) : Boolean;
var T : TInterFindit;
begin
      psID_CREDITO := 0; Result := False;
      T := Objeto.CreaBuscador('ISaCrLa.it','F,F,F,F');
      Try
       If T.Execute then
         Begin
         psID_CREDITO := StrToInt(T.DameCampo(3));
         Result := True;
         End;
      Finally
       T.Free;
      End;
end;

procedure TWMqrconstancias.btnCredito_IniClick(Sender: TObject);
var vlID_CREDITO : Integer;
begin
 With Objeto Do
   If BuscaCreditoConstancia(vlID_CREDITO) Then
     Begin
     Credito_Ini.FindKey([vlID_CREDITO]);

     if Credito_Ini.ID_CREDITO.AsInteger = 0 then
     begin
        Credito_Ini2.FindKey([IntToStr(vlID_CREDITO)]);
        ID_CREDITO_INI.AsInteger := Credito_Ini2.ID_CREDITO.AsInteger;
     end
     else
        ID_CREDITO_INI.AsInteger := Credito_Ini.ID_CREDITO.AsInteger;

     chkCredito_Ini.Enabled := True;
     chkCredito_Ini.Checked := True;

     Credito_Fin.FindKey([Credito_Ini.ID_CREDITO.AsInteger]);

     if Credito_Fin.ID_CREDITO.AsInteger = 0 then
        Credito_Fin2.FindKey([IntToStr(vlID_CREDITO)]);

     ID_CREDITO_FIN.AsInteger := ID_CREDITO_INI.AsInteger;
     chkCredito_Fin.Enabled := True;
     chkCredito_Fin.Checked := True;     
     End;
end;

procedure TWMqrconstancias.btnCredito_FinClick(Sender: TObject);
var vlID_CREDITO : Integer;
begin
 With Objeto Do
   If BuscaCreditoConstancia(vlID_CREDITO) Then
     Begin
     Credito_Fin.FindKey([vlID_CREDITO]);

     if Credito_Fin.ID_CREDITO.AsInteger = 0 then
     begin
        Credito_Fin2.FindKey([IntToStr(vlID_CREDITO)]);
        ID_CREDITO_FIN.AsInteger := Credito_Fin2.ID_CREDITO.AsInteger;
     end
     else
        ID_CREDITO_FIN.AsInteger := Credito_Fin.ID_CREDITO.AsInteger;
     chkCredito_Fin.Enabled := True;
     chkCredito_Fin.Checked := True;
     End;
end;

procedure TWMqrconstancias.btnID_REPRESENTANTEClick(Sender: TObject);
begin
 With Objeto Do
   If Persona.Busca Then
     Begin
     ID_REPRESENTA.AsInteger := Persona.ID_PERSONA.AsInteger;
     chkIdREPRESENTANTE.Enabled := True;
     chkIdREPRESENTANTE.Checked := True;
     End;
end;

procedure TWMqrconstancias.ilID_EMPRESACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWMqrconstancias.ilID_EMPRESAEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Empresa.FindKey([ilID_EMPRESA.Buffer]) Then
     ID_EMPRESA.AsInteger := Empresa.ID_EMPRESA.AsInteger;
end;

procedure TWMqrconstancias.ilID_CREDITO_INIEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Credito_Ini.FindKey([ilID_CREDITO_INI.Buffer]) Then
     Begin
     ID_CREDITO_INI.AsInteger := Credito_Ini.ID_CREDITO.AsInteger;
     chkCredito_Ini.Enabled := True;
     chkCredito_Ini.Checked := True;

     Credito_Fin.FindKey([ID_CREDITO_INI.AsInteger]);
     ID_CREDITO_FIN.AsInteger := ID_CREDITO_INI.AsInteger;
     chkCredito_Fin.Enabled := True;
     chkCredito_Fin.Checked := True;
     End;
end;

procedure TWMqrconstancias.ilID_CREDITO_FINEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Credito_Fin.FindKey([ilID_CREDITO_FIN.Buffer]) Then
     Begin
     ID_CREDITO_FIN.AsInteger := Credito_Fin.ID_CREDITO.AsInteger;
     chkCredito_Fin.Enabled := True;
     chkCredito_Fin.Checked := True;
     End;
end;

procedure TWMqrconstancias.ilID_REPRESENTAEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Persona.FindKey([ilID_REPRESENTA.Buffer]) Then
     Begin
     ID_REPRESENTA.AsInteger := Persona.ID_PERSONA.AsInteger;
     chkIdREPRESENTANTE.Enabled := True;
     chkIdREPRESENTANTE.Checked := True;
     End;
end;

procedure TWMqrconstancias.chkCredito_IniClick(Sender: TObject);
begin
   If not chkCredito_Ini.Checked Then Begin
      Objeto.Credito_Ini.Active:=False;
      chkCredito_Ini.Checked:=False;
      chkCredito_Ini.Enabled:=False;
   End Else Begin
      chkCredito_Ini.Checked:=True;
      chkCredito_Ini.Enabled:=True;
   End;
end;

procedure TWMqrconstancias.chkCredito_FinClick(Sender: TObject);
begin
   If not chkCredito_Fin.Checked Then Begin
      Objeto.Credito_Fin.Active:=False;
      chkCredito_Fin.Checked:=False;
      chkCredito_Fin.Enabled:=False;
   End Else Begin
      chkCredito_Fin.Checked:=True;
      chkCredito_Fin.Enabled:=True;
   End;
end;

procedure TWMqrconstancias.chkIdREPRESENTANTEClick(Sender: TObject);
begin
   If not chkIdREPRESENTANTE.Checked Then Begin
      Objeto.Persona.Active:=False;
      chkIdREPRESENTANTE.Checked:=False;
      chkIdREPRESENTANTE.Enabled:=False;
   End Else Begin
      chkIdREPRESENTANTE.Checked:=True;
      chkIdREPRESENTANTE.Enabled:=True;
   End;
end;

procedure TWMqrconstancias.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.BuscaWhereString := ' EJERCICIO = '+edEJERCICIO.Text;
   Objeto.FilterString := Objeto.BuscaWhereString ;
end;

procedure TWMqrconstancias.edEJERCICIOExit(Sender: TObject);
begin
   Objeto.BuscaWhereString := ' EJERCICIO = '+edEJERCICIO.Text;
   Objeto.FilterString := Objeto.BuscaWhereString ;
end;

end.
