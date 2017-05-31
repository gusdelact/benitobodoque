// Sistema         : Clase de CG_CUENTA_EQUIV
// Fecha de Inicio : 24/04/2008
// Función forma   : Clase de CG_CUENTA_EQUIV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCgCueEqu;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

Intempre,         // Empresa
IntMon,           // Moneda
IntParamCre       // Parametros Crédito
;

Const
  coSOCIEDAD_BANCO = 'B000';

Type
 TCgCueEqu= class; 

  TWCgCuentaEquiv=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMPRESA : TLabel; 
    edID_EMPRESA : TEdit;
    lbCVE_CTA_CONTABLE : TLabel; 
    edCVE_CTA_CONTABLE : TEdit;
    lbCVE_MONEDA : TLabel; 
    edCVE_MONEDA : TEdit;
    lbCVE_MONEDA_EXT : TLabel; 
    edCVE_MONEDA_EXT : TEdit;
    lbSOCIEDAD : TLabel; 
    edSOCIEDAD : TEdit;
    btEMPRESA: TSpeedButton;
    edDESC_EMPRESA: TEdit;
    btCVE_MONEDA: TSpeedButton;
    btCVE_MONEDA_EXT: TSpeedButton;
    edDESC_MONEDA: TEdit;
    edDESC_MONEDA_EXT: TEdit;
    ilCVE_MONEDA_EXT: TInterLinkit;
    ilCVE_MONEDA: TInterLinkit;
    ilID_EMPRESA: TInterLinkit;
    PnDatos: TPanel;
    Label3: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    lbCUENTA: TLabel;
    edCUENTA: TEdit;
    lbSUBCUENTA: TLabel;
    edSUBCUENTA: TEdit;
    lbAUXILIAR: TLabel;
    edAUXILIAR: TEdit;
    lbSECTOR: TLabel;
    edSECTOR: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilCVE_MONEDA_EXTCapture(Sender: TObject; var Show: Boolean);
    procedure btEMPRESAClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btCVE_MONEDA_EXTClick(Sender: TObject);
    procedure ilID_EMPRESAEjecuta(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure ilCVE_MONEDA_EXTEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }

    Objeto : TCgCueEqu;
end;
 TCgCueEqu= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        CVE_CTA_CONTABLE         : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_MONEDA_EXT           : TInterCampo;
        SOCIEDAD                 : TInterCampo;
        CVE_CUENTA_SAP           : TInterCampo;
        CVE_SUBCUENTA_SAP        : TInterCampo;
        CVE_AUXILIAR_SAP         : TInterCampo;
        CVE_SECTOR_SAP           : TInterCampo;
        CVE_MONEDA_SAP           : TInterCampo;

        ParamCre   : TParamCre;
        Empresa    : TEmpresa;
        Moneda     : TMoneda;
        MonedaExt  : TMoneda;

        vgID_EMPRESA             : Integer;
        vgCVE_MONEDA             : Integer;
        vgCVE_MONEDA_EXT         : Integer;
        vgCVE_CTA_CONTABLE       : String;
        vgCVE_SECTOR             : String;        

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    InternalPost : Boolean; override;
        procedure   RefrescaFind;

        function InsertaRegistro : Boolean;
        function ActualizaRegistro : Boolean;
      published
      end;

function NVLStr(peStrValue : String; peStrChange : String) : String;

implementation

{$R *.DFM}

function NVLStr(peStrValue : String; peStrChange : String) : String;
begin
  If (Trim(peStrValue) = '') Then Result := peStrChange
  Else Result := peStrValue;
end;

constructor TCgCueEqu.Create( AOwner : TComponent ); 
begin Inherited;
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='Número de Empresa';
      CVE_CTA_CONTABLE :=CreaCampo('CVE_CTA_CONTABLE',ftString,tsNinguno,tsNinguno,True);
                CVE_CTA_CONTABLE.Caption:='Clave de Cta Contable';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      CVE_MONEDA_EXT :=CreaCampo('CVE_MONEDA_EXT',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA_EXT.Caption:='Clave de Moneda Ext';
      SOCIEDAD :=CreaCampo('SOCIEDAD',ftString,tsNinguno,tsNinguno,True);
                SOCIEDAD.Caption:='Sociedad';
      CVE_CUENTA_SAP :=CreaCampo('CUENTA',ftString,tsNinguno,tsNinguno,True);
                CVE_CUENTA_SAP.Caption:='Cuenta';
      CVE_SUBCUENTA_SAP :=CreaCampo('SUBCUENTA',ftString,tsNinguno,tsNinguno,True);
                CVE_SUBCUENTA_SAP.Caption:='Subcuenta';
      CVE_AUXILIAR_SAP :=CreaCampo('AUXILIAR',ftString,tsNinguno,tsNinguno,True);
                CVE_AUXILIAR_SAP.Caption:='Auxiliar';
      CVE_SECTOR_SAP :=CreaCampo('SECTOR',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_SAP.Caption:='Sector';
      CVE_MONEDA_SAP :=CreaCampo('MONEDA',ftString,tsNinguno,tsNinguno,True);
                CVE_MONEDA_SAP.Caption:='Moneda';

      FKeyFields.Add('ID_EMPRESA');
      FKeyFields.Add('CVE_CTA_CONTABLE');
      FKeyFields.Add('CVE_MONEDA');      

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      Empresa.MasterSource:=Self;
      {$WARNINGS ON}

      {$WARNINGS OFF} Moneda := TMoneda.Create(Self); {$WARNINGS ON}
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

      {$WARNINGS OFF} MonedaExt := TMoneda.Create(Self); {$WARNINGS ON}
      MonedaExt.MasterSource:=Self;
      MonedaExt.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

      TableName := 'ADMIPROD.CG_CUENTA_EQUIV@CONT';
      UseQuery := True;
      HelpFile := 'IntCgCueEqu.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCgCueEqu.Destroy;
begin
  Try
    If Assigned(Empresa) Then Empresa.Free;
    If Assigned(Moneda) Then Moneda.Free;
    If Assigned(MonedaExt) Then MonedaExt.Free;
  Finally
    Inherited;
  End;
end;

function TCgCueEqu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCgCuentaEquiv;
begin
   W:=TWCgCuentaEquiv.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;

      W.Objeto.ID_EMPRESA.AsInteger := vgID_EMPRESA;
      W.Objeto.Empresa.FindKey([vgID_EMPRESA]);

      W.Objeto.CVE_MONEDA.AsInteger := vgCVE_MONEDA;
      W.Objeto.Moneda.FindKey([vgCVE_MONEDA]);

      W.Objeto.CVE_MONEDA_EXT.AsInteger   := vgCVE_MONEDA_EXT;
      W.Objeto.MonedaExt.FindKey([vgCVE_MONEDA_EXT]);

      W.Objeto.SOCIEDAD.AsString := coSOCIEDAD_BANCO;
      W.Objeto.CVE_CTA_CONTABLE.AsString := vgCVE_CTA_CONTABLE;
      W.Objeto.CVE_SECTOR_SAP.AsString  := vgCVE_SECTOR;

      W.InterForma1.ShowModal;      
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCgCueEqu.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICgCuEq.it','F,S,F');
      Try if Active then
          begin
          T.Param(0,ID_EMPRESA.AsString);
          T.Param(1,CVE_CTA_CONTABLE.AsString);
          T.Param(2,CVE_MONEDA.AsString);
          end;
          if T.Execute then
             Begin
             InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
             RefrescaFind;
             End;
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CG_CUENTA_EQUIV********************)
(*                                                                              *)
(*  FORMA DE CG_CUENTA_EQUIV                                                            *)
(*                                                                              *)
(***********************************************FORMA CG_CUENTA_EQUIV********************)

procedure TWCgCuentaEquiv.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    //PINTA DATOS DEL PANEL INFERIOR
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    ID_EMPRESA.Control:=edID_EMPRESA;
    CVE_CTA_CONTABLE.Control:=edCVE_CTA_CONTABLE;
    CVE_MONEDA.Control:=edCVE_MONEDA;
    CVE_MONEDA_EXT.Control:=edCVE_MONEDA_EXT;
    SOCIEDAD.Control:=edSOCIEDAD;
    CVE_CUENTA_SAP.Control:=edCUENTA;
    CVE_SUBCUENTA_SAP.Control:=edSUBCUENTA;
    CVE_AUXILIAR_SAP.Control:=edAUXILIAR;
    CVE_SECTOR_SAP.Control :=edSECTOR;

    Empresa.ID_EMPRESA.Control := edID_EMPRESA;
    Empresa.PersonaMoral.Nombre.Control := edDESC_EMPRESA;

    Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
    Moneda.DESC_MONEDA.Control := edDESC_MONEDA;

    MonedaExt.CVE_MONEDA.Control := edCVE_MONEDA_EXT;
    MonedaExt.DESC_MONEDA.Control := edDESC_MONEDA_EXT;
    End;
end;

procedure TWCgCuentaEquiv.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_EMPRESA.Control:=Nil;
    CVE_CTA_CONTABLE.Control:=Nil;
    CVE_MONEDA.Control:=Nil;
    CVE_MONEDA_EXT.Control:=Nil;
    SOCIEDAD.Control:=Nil;
    CVE_CUENTA_SAP.Control:=Nil;
    CVE_SUBCUENTA_SAP.Control:=Nil;
    CVE_AUXILIAR_SAP.Control:=Nil;
    CVE_SECTOR_SAP.Control :=Nil;

    Empresa.ID_EMPRESA.Control := Nil;
    Empresa.PersonaMoral.Nombre.Control := Nil;

    Moneda.CVE_MONEDA.Control := Nil;
    Moneda.DESC_MONEDA.Control := Nil;

    MonedaExt.CVE_MONEDA.Control := Nil;
    MonedaExt.DESC_MONEDA.Control := Nil;
    End;
end;

procedure TWCgCuentaEquiv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCgCuentaEquiv.InterForma1DespuesNuevo(Sender: TObject);
begin
  If edID_EMPRESA.CanFocus Then edID_EMPRESA.SetFocus;
  With Objeto Do
    Begin
    Objeto.Empresa.FindKey([2]);
    Objeto.Moneda.FindKey([484]);
    Objeto.MonedaExt.FindKey([484]);

    SOCIEDAD.AsString := coSOCIEDAD_BANCO;
    CVE_CTA_CONTABLE.AsString := vgCVE_CTA_CONTABLE;
    CVE_SECTOR_SAP.AsString  := vgCVE_SECTOR;
    End;
end;

procedure TWCgCuentaEquiv.InterForma1DespuesModificar(Sender: TObject);
begin If edCVE_CTA_CONTABLE.CanFocus Then edCVE_CTA_CONTABLE.SetFocus;
      Objeto.Empresa.FindKey([2]);
      Objeto.Moneda.FindKey([484]);
      Objeto.MonedaExt.FindKey([484]);
end;

procedure TWCgCuentaEquiv.ilCVE_MONEDA_EXTCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCgCuentaEquiv.btEMPRESAClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Empresa.ShowAll := True;
    Empresa.Busca;
    End;
end;

procedure TWCgCuentaEquiv.btCVE_MONEDAClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Moneda.ShowAll := True;
    Moneda.Busca;
    End;
end;

procedure TWCgCuentaEquiv.btCVE_MONEDA_EXTClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    MonedaExt.ShowAll := True;
    MonedaExt.Busca;
    End;
end;

procedure TWCgCuentaEquiv.ilID_EMPRESAEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    Empresa.FindKey([ilID_EMPRESA.Buffer]);
    End;
end;

procedure TWCgCuentaEquiv.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    Moneda.FindKey([ilCVE_MONEDA.Buffer]);
    End;
end;

procedure TWCgCuentaEquiv.ilCVE_MONEDA_EXTEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    MonedaExt.FindKey([ilCVE_MONEDA_EXT.Buffer]);
    End;
end;

procedure TCgCueEqu.RefrescaFind;
begin
  Empresa.FindKey([ID_EMPRESA.AsInteger]);
  Moneda.FindKey([CVE_MONEDA.AsString]);
  MonedaExt.FindKey([CVE_MONEDA_EXT.AsString]);
end;

function TCgCueEqu.ActualizaRegistro: Boolean;
var vlSTP : TStoredProc;
begin
  Result := False;
  vlSTP := TStoredProc.Create(Nil);
  If Assigned(vlSTP) Then
   With vlSTP Do
    Try
     StoredProcName := 'PKGCRSAP.STP_ACT_CG_CUENTA_EQUIV';
     DatabaseName   := Apli.DatabaseName;
     SessionName    := Apli.SessionName;

     Params.CreateParam(ftInteger, 'peID_EMPRESA',ptInput);
     Params.CreateParam(ftString,  'peCVE_CTA_CONTABLE',ptInput);
     Params.CreateParam(ftString,  'peCVE_MONEDA',ptInput);
     Params.CreateParam(ftString,  'peCVE_MONEDA_EXT',ptInput);
     Params.CreateParam(ftString,  'peCUENTA',ptInput);
     Params.CreateParam(ftString,  'peSUBCUENTA',ptInput);
     Params.CreateParam(ftString,  'peAUXILIAR',ptInput);
     Params.CreateParam(ftString,  'peSECTOR',ptInput);
     Params.CreateParam(ftString,  'peB_COMMIT',ptInput);
     Params.CreateParam(ftInteger, 'psRESULTADO',ptOutput);
     Params.CreateParam(ftString,  'psTX_RESULTADO',ptOutput);

     ParamByName('peID_EMPRESA').AsInteger      := ID_EMPRESA.AsInteger;
     ParamByName('peCVE_CTA_CONTABLE').AsString := CVE_CTA_CONTABLE.AsString;
     ParamByName('peCVE_MONEDA').AsString       := CVE_MONEDA.AsString;
     ParamByName('peCVE_MONEDA_EXT').AsString   := CVE_MONEDA_EXT.AsString;
     ParamByName('peCUENTA').AsString           := CVE_CUENTA_SAP.AsString;
     ParamByName('peSUBCUENTA').AsString        := NVLStr(CVE_SUBCUENTA_SAP.AsString,' ');
     ParamByName('peAUXILIAR').AsString         := NVLStr(CVE_AUXILIAR_SAP.AsString, ' ');
     ParamByName('peSECTOR').AsString           := CVE_SECTOR_SAP.AsString;
     ParamByName('peB_COMMIT').AsString         := 'V';
     ExecProc;

     If (ParamByName('psRESULTADO').AsInteger = 0) Then
       Result := True
     Else
       MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);

    Finally
     vlSTP.Free;
    End;
end;

function TCgCueEqu.InsertaRegistro: Boolean;
var vlSTP : TStoredProc;
begin
  Result := False;
  vlSTP := TStoredProc.Create(Nil);
  If Assigned(vlSTP) Then
   With vlSTP Do
    Try
     StoredProcName := 'PKGCRSAP.STP_INS_CG_CUENTA_EQUIV';
     DatabaseName   := Apli.DatabaseName;
     SessionName    := Apli.SessionName;

     Params.CreateParam(ftInteger, 'peID_EMPRESA',ptInput);
     Params.CreateParam(ftString,  'peCVE_CTA_CONTABLE',ptInput);
     Params.CreateParam(ftString,  'peCVE_MONEDA',ptInput);
     Params.CreateParam(ftString,  'peCVE_MONEDA_EXT',ptInput);
     Params.CreateParam(ftString,  'peCUENTA',ptInput);
     Params.CreateParam(ftString,  'peSUBCUENTA',ptInput);
     Params.CreateParam(ftString,  'peAUXILIAR',ptInput);
     Params.CreateParam(ftString,  'peSECTOR',ptInput);
     Params.CreateParam(ftString,  'peB_COMMIT',ptInput);
     Params.CreateParam(ftInteger, 'psRESULTADO',ptOutput);
     Params.CreateParam(ftString,  'psTX_RESULTADO',ptOutput);

     ParamByName('peID_EMPRESA').AsInteger      := ID_EMPRESA.AsInteger;
     ParamByName('peCVE_CTA_CONTABLE').AsString := CVE_CTA_CONTABLE.AsString;
     ParamByName('peCVE_MONEDA').AsString       := CVE_MONEDA.AsString;
     ParamByName('peCVE_MONEDA_EXT').AsString   := CVE_MONEDA_EXT.AsString;
     ParamByName('peCUENTA').AsString           := CVE_CUENTA_SAP.AsString;
     ParamByName('peSUBCUENTA').AsString        := NVLStr(CVE_SUBCUENTA_SAP.AsString, ' ');
     ParamByName('peAUXILIAR').AsString         := NVLStr(CVE_AUXILIAR_SAP.AsString, ' ');
     ParamByName('peSECTOR').AsString           := CVE_SECTOR_SAP.AsString;
     ParamByName('peB_COMMIT').AsString         := 'V';
     ExecProc;

     If (ParamByName('psRESULTADO').AsInteger = 0) Then
       Result := True
     Else
       MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);

    Finally
     vlSTP.Free;
    End;
end;

function TCgCueEqu.InternalPost: Boolean;
begin
  AutoRefresh := True;
  ID_EMPRESA.GetFromControl;
  CVE_CTA_CONTABLE.GetFromControl;
  CVE_MONEDA.GetFromControl;
  CVE_MONEDA_EXT.GetFromControl;
  SOCIEDAD.GetFromControl;
  CVE_CUENTA_SAP.GetFromControl;
  CVE_SUBCUENTA_SAP.GetFromControl;
  CVE_AUXILIAR_SAP.GetFromControl;
  CVE_SECTOR_SAP.GetFromControl;

  If (Modo = moAppend) Then
    Begin
    AutoRefresh := False;
    Result := InsertaRegistro;
    End
  Else If (Modo = moEdit) Then
    Begin
    Result := ActualizaRegistro;
    End
  Else
    Begin
    InternalPost := Inherited InternalPost;
    End;
end;

end.
