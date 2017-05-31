// Sistema         : Clase de CR_REL_ACRE_CTO
// Fecha de Inicio : 07/05/2008
// Función forma   : Clase de CR_REL_ACRE_CTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrReAcCt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,


IntCrEmisor,   // Emisor
IntParamCre,   // Parametro
IntCrCto,      // Autorizacion
IntGenCre,     // Unidad Generica
IntLinkit
;

Type
 TCrReAcCt= class;

  TWCrRelAcreCto=Class(TForm)
    InterForma1             : TInterForma;
    lbID_EMISOR: TLabel;
    edID_EMISOR: TEdit;
    lbID_CONTRATO_REL : TLabel;
    edID_CONTRATO_REL : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btID_EMISOR: TBitBtn;
    edNOMBRE: TEdit;
    btID_CONTRATO_REL: TBitBtn;
    edNOM_AUTORIZACION: TEdit;
    rgSIT_REL_ACRE_CTO: TRadioGroup;
    lbF_ALTA: TLabel;
    lbF_CANCELA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_USU_CANCELA: TLabel;
    edF_ALTA: TEdit;
    edF_CANCELA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_CANCELA: TEdit;
    ilID_CONTRATO_REL: TInterLinkit;
    edCVE_FND_ENT_DES: TEdit;
    edCVE_EMISOR_EXT: TEdit;
    lbCVE_EMISOR_EXT: TLabel;
    lbCVE_FND_ENT_DES: TLabel;
    lbEmisor: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_EMISORClick(Sender: TObject);
    procedure btID_CONTRATO_RELClick(Sender: TObject);
    procedure ilID_EMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATO_RELEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrReAcCt;

    procedure   ActualizaDatos;
end;
 TCrReAcCt= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_REL_EMI_CTO           : TInterCampo;
        ID_EMISOR                : TInterCampo;
        CVE_FND_ENT_DES          : TInterCampo;
        CVE_EMISOR_EXT           : TInterCampo;
        ID_CONTRATO_REL          : TInterCampo;
        SIT_REL_EMI_CTO          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_CANCELA          : TInterCampo;
        F_CANCELA                : TInterCampo;
        NOM_AUTORIZACION         : TInterCampo;

        Emisor       : TCrEmisor;
        Autorizacion : TCrCto;
        ParamCre     : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   ActualizaDatosObjeto;
        procedure   ActualizaNomAutorizacion;
      published
      end;

implementation

{$R *.DFM}


constructor TCrReAcCt.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_REL_EMI_CTO :=CreaCampo('ID_REL_EMI_CTO',ftFloat,tsNinguno,tsNinguno,True);
                ID_REL_EMI_CTO.Caption:='Número de Relacion Emisor Contrato';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Número del Emisor';
      CVE_FND_ENT_DES := CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave Fondeo Entidad Descontadora';
      CVE_EMISOR_EXT := CreaCampo('CVE_EMISOR_EXT',ftString,tsNinguno,tsNinguno,True);
                CVE_EMISOR_EXT.Caption:='Clave Fondeo Entidad Descontadora';
      ID_CONTRATO_REL :=CreaCampo('ID_CONTRATO_REL',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO_REL.Caption:='Número de Contrato Relacionado';
      SIT_REL_EMI_CTO :=CreaCampo('SIT_REL_EMI_CTO',ftString,tsNinguno,tsNinguno,True);
      With SIT_REL_EMI_CTO Do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('CA');
        End;
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usuario Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_CANCELA :=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_CANCELA.Caption:='Clave de Usuario Cancela';
      F_CANCELA :=CreaCampo('F_CANCELA',ftDate,tsNinguno,tsNinguno,True);
                F_CANCELA.Caption:='Fecha Cancelación';
      NOM_AUTORIZACION := CreaCampo('NOM_AUTORIZACION',ftString,tsNinguno,tsNinguno,False);
                NOM_AUTORIZACION.Caption:='Titular de la Autorización';

      FKeyFields.Add('ID_REL_EMI_CTO');

      {$WARNINGS OFF} Emisor := TCrEmisor.Create(Self); {$WARNINGS ON}
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField := 'CVE_FND_ENT_DES';      
      Emisor.FieldByName('ID_ACREDITADO').MasterField := 'ID_EMISOR';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField := 'CVE_EMISOR_EXT';

      {$WARNINGS OFF} Autorizacion := TCrCto.Create(Self); {$WARNINGS ON}
      Autorizacion.MasterSource:=Self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO_REL';

      TableName := 'CR_REL_EMI_CTO';
      UseQuery := True;
      HelpFile := 'IntCrReAcCt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrReAcCt.Destroy;
begin
  If Assigned(Emisor) Then Emisor.free;
  If Assigned(Autorizacion) Then Autorizacion.Free;
  inherited;
end;


function TCrReAcCt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelAcreCto;
begin
   W:=TWCrRelAcreCto.Create(Self);
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

Function TCrReAcCt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrReAC.it','F');
      Try if Active then begin T.Param(0,ID_REL_EMI_CTO.AsString);
                               end;
          if T.Execute then Begin
                            InternalBusca := FindKey([T.DameCampo(0)]);
                            ActualizaDatosObjeto;
                            End;
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_REL_ACRE_CTO********************)
(*                                                                              *)
(*  FORMA DE CR_REL_ACRE_CTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_ACRE_CTO********************)

procedure TWCrRelAcreCto.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_EMISOR.Control:=edID_EMISOR;
    CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
    CVE_EMISOR_EXT.Control:=edCVE_EMISOR_EXT;
    ID_CONTRATO_REL.Control:=edID_CONTRATO_REL;
    SIT_REL_EMI_CTO.Control:=rgSIT_REL_ACRE_CTO;
    CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
    F_ALTA.Control:=edF_ALTA;
    CVE_USU_CANCELA.Control:=edCVE_USU_CANCELA;
    F_CANCELA.Control:=edF_CANCELA;

    Emisor.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
    Emisor.ID_ACREDITADO.Control := edID_EMISOR;
    Emisor.CVE_EMISOR_EXT.Control := edCVE_EMISOR_EXT;
    Emisor.Acreditado.Persona.Nombre.Control := edNOMBRE;

    Autorizacion.ID_CONTRATO.Control := edID_CONTRATO_REL;
    NOM_AUTORIZACION.Control := edNOM_AUTORIZACION;
    End;
end;

procedure TWCrRelAcreCto.FormDestroy(Sender: TObject);
begin
  With Objeto  Do
    Begin
    ID_EMISOR.Control:=Nil;
    CVE_FND_ENT_DES.Control:=Nil;
    CVE_EMISOR_EXT.Control:=Nil;
    ID_CONTRATO_REL.Control:=Nil;
    SIT_REL_EMI_CTO.Control:=Nil;
    CVE_USU_ALTA.Control:=Nil;
    F_ALTA.Control:=Nil;
    CVE_USU_CANCELA.Control:=Nil;
    F_CANCELA.Control:=Nil;

    Emisor.CVE_FND_ENT_DES.Control := Nil;
    Emisor.ID_ACREDITADO.Control := Nil;
    Emisor.CVE_EMISOR_EXT.Control := Nil;
    Emisor.Acreditado.Persona.Nombre.Control := Nil;


    Autorizacion.ID_CONTRATO.Control := Nil;
    NOM_AUTORIZACION.Control := Nil;
    End;
end;

procedure TWCrRelAcreCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelAcreCto.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_EMISOR.CanFocus Then edID_EMISOR.SetFocus;
      Objeto.SIT_REL_EMI_CTO.AsString := 'AC';
      rgSIT_REL_ACRE_CTO.Enabled := True;
      rgSIT_REL_ACRE_CTO.Tag := 18;
end;

procedure TWCrRelAcreCto.InterForma1DespuesModificar(Sender: TObject);
begin If edID_EMISOR.CanFocus Then edID_EMISOR.SetFocus;
      If (Objeto.SIT_REL_EMI_CTO.AsString = 'CA') Then
        Begin
        rgSIT_REL_ACRE_CTO.Enabled := False;
        rgSIT_REL_ACRE_CTO.Tag := 0;
        End;
end;

procedure TWCrRelAcreCto.btID_EMISORClick(Sender: TObject);
begin
  Objeto.Emisor.Busca;
end;

procedure TWCrRelAcreCto.btID_CONTRATO_RELClick(Sender: TObject);
begin
  If Objeto.Autorizacion.Busca Then
    Objeto.ActualizaNomAutorizacion;
end;

procedure TWCrRelAcreCto.ilID_EMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrRelAcreCto.ilID_CONTRATO_RELEjecuta(Sender: TObject);
begin
 With Objeto Do
   Begin
   If (Autorizacion.FindKey([ilID_CONTRATO_REL.Buffer])) Then
      ActualizaNomAutorizacion;
   End;
end;

procedure TWCrRelAcreCto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMsg : String;
    vlFOLIO : Integer;
begin
   Objeto.ID_EMISOR.GetFromControl;
   If (Objeto.ID_EMISOR.AsInteger = 0) Then
     Begin
     MessageDlg('Debe de indicar el EMISOR', mtWarning, [mbOk], 0);
     If edID_EMISOR.CanFocus Then edID_EMISOR.SetFocus;
     Exit;
     End;

   Objeto.ID_CONTRATO_REL.GetFromControl;
   If (Objeto.ID_CONTRATO_REL.AsInteger = 0) Then
     Begin
     MessageDlg('Debe de indicar el No. Autorización', mtWarning, [mbOk], 0);
     If edID_EMISOR.CanFocus Then edID_EMISOR.SetFocus;
     Exit;
     End;

   If IsNewData Then
      Begin
          If (MessageDlg('¿Desea almacenar los datos capturados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes) then
             Begin
             vlFOLIO := ObtenFolio('CRREMCT', vlstrMsg, Objeto.Apli);
             If (vlFOLIO <= 0) Then
               Begin
               MessageDlg(vlstrMsg, mtError, [mbOk], 0);
               Exit;
               End;
             Objeto.ID_REL_EMI_CTO.AsInteger := vlFOLIO;
             Objeto.CVE_USU_ALTA.AsString := Objeto.DameUsuario;
             Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
             Realizado := True;
             End
          Else
             Realizado := False;
      End
   Else
   Begin
      If MessageDlg('¿Desea guardar los datos modificados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
      Begin
         Objeto.SIT_REL_EMI_CTO.GetFromControl;
         If (Objeto.SIT_REL_EMI_CTO.AsString = 'CA') Then
         Begin
            If MessageDlg('Al cancelar la relación Emisor-Autorización, ya no se podrá activar. Tendrá que capturarlo nuevamente.'+
                          '¿Desea continuar?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
            Begin
               Objeto.CVE_USU_CANCELA.AsString := Objeto.DameUsuario;
               Objeto.F_CANCELA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
               Realizado := True;
            End
            Else
            Begin
               Realizado := False;
            End;
         End
            Else Realizado := True;
      End
      Else Realizado := False;
   End;
end;

procedure TWCrRelAcreCto.ActualizaDatos;
begin
  Objeto.ActualizaDatosObjeto;
  rgSIT_REL_ACRE_CTO.Enabled := (Objeto.SIT_REL_EMI_CTO.AsString <> 'CA');
end;

procedure TCrReAcCt.ActualizaDatosObjeto;
begin
  Emisor.FindKey([CVE_FND_ENT_DES.AsString, ID_EMISOR.AsInteger, CVE_FND_ENT_DES.AsString]);
  Autorizacion.FindKey([ID_CONTRATO_REL.AsInteger]);
  ActualizaNomAutorizacion;
end;

procedure TCrReAcCt.ActualizaNomAutorizacion;
var vlStrNombre : String;
begin
    If Not GetSQLStr('  SELECT P.NOMBRE'+coCRLF+
                     '  FROM ( SELECT ID_TITULAR'+coCRLF+
                     '         FROM CONTRATO'+coCRLF+
                     '         WHERE ID_CONTRATO = '+ID_CONTRATO_REL.AsString+coCRLF+
                     '       ) CTO,'+coCRLF+
                     '       PERSONA P'+coCRLF+
                     '  WHERE P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF,
                     Apli.DataBaseName, Apli.SessionName,
                     'NOMBRE', vlStrNombre, True
                     ) Then
       vlStrNombre := '';
    NOM_AUTORIZACION.AsString := vlStrNombre;
end;

end.
