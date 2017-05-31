// Sistema         : Clase de TASA_INDIC_FINAN
// Fecha de Inicio : 05/06/2006
// Función forma   : Clase de TASA_INDIC_FINAN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Laura Gabriela Quevedo Torres
// Comentarios     :
Unit IntTasIndFin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, intinter, IntSGCtrl, Grids,
Aligrid, IntLinkit, IntCrTaSiRe, IntParTasOp, Menus,
UnSegBtn;

Type
 TTasIndFin= class; 

  TWTasaIndicFinan=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TASA_INDICAD : TLabel;
    edCVE_TASA_INDICAD : TEdit; 
    chB_MUESTREO_FECHA : TCheckBox;
    lbCVE_TASA_BANXICO : TLabel; 
    edCVE_TASA_BANXICO : TEdit;
    lbDESC_TASA_INDIC : TLabel; 
    edDESC_TASA_INDIC : TEdit;
    lbDIAS_PUBLICACION : TLabel;
    lbID_AUTOR_PUBLICA : TLabel; 
    edID_AUTOR_PUBLICA : TEdit;
    lbTIPO_TASA_INDIC : TLabel;
    lbCVE_TPO_TASA_IND : TLabel;
    lbNUM_DIAS_TASA : TLabel;
    edNUM_DIAS_TASA : TEdit;
    lbSIT_TASA_INDIC : TLabel;
    lbCVE_TASA_SITI : TLabel;
    edCVE_TASA_SITI : TEdit;
    lbCVE_TASA_REFER : TLabel;
    edCVE_TASA_REFER : TEdit;
    SpeedButton1: TSpeedButton;
    edDESC_INTERM: TEdit;
    cbTIPO_TASA_INDIC: TComboBox;
    cbDIAS_PUBLICACION: TComboBox;
    cbCVE_TPO_TASA_IND: TComboBox;
    cbSIT_TASA_INDIC: TComboBox;
    UpDown2: TUpDown;
    qryDatos: TQuery;
    qryDatosCVE_TASA_INDICAD: TStringField;
    qryDatosDESC_TASA_INDIC: TStringField;
    SpeedButton2: TSpeedButton;
    SAG: TStringAlignGrid;
    InterLinkit1: TInterLinkit;
    btCVE_TASA_SITI: TSpeedButton;
    GroupBox1: TGroupBox;
    chB_TASA_CREDITO: TCheckBox;
    chB_TASA_FORWARD: TCheckBox;
    chB_TASA_BASE: TCheckBox;
    InterLinkit2: TInterLinkit;
    edID_TASA_REF_SITI: TEdit;
    edDESC_TASA_SITI: TEdit;
    ilCVE_TASA_SITI: TInterLinkit;
    PopupMenu1: TPopupMenu;
    CatlogoClaveSITI1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure btCVE_TASA_SITIClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure SAGDblClick(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure SAGClick(Sender: TObject);
    procedure ilCVE_TASA_SITIEjecuta(Sender: TObject);
    procedure CatlogoClaveSITI1Click(Sender: TObject);
    private
     procedure MuestraLista;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TTasIndFin;
end;
 TTasIndFin= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_TASA_INDICAD         : TInterCampo;
        B_MUESTREO_FECHA         : TInterCampo;
        CVE_TASA_BANXICO         : TInterCampo;
        DESC_TASA_INDIC          : TInterCampo;
        DIAS_PUBLICACION         : TInterCampo;
        ID_AUTOR_PUBLICA         : TInterCampo;
        TIPO_TASA_INDIC          : TInterCampo;
        B_TASA_CREDITO           : TInterCampo;
        B_TASA_FORWARD           : TInterCampo;
        CVE_TPO_TASA_IND         : TInterCampo;
        NUM_DIAS_TASA            : TInterCampo;
        SIT_TASA_INDIC           : TInterCampo;
        CVE_TASA_SITI            : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        B_TASA_BASE              : TInterCampo;

        Intermediario            : TIntermed;
        TasaSiti                 : TCrTaSiRe;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TTasIndFin.Create( AOwner : TComponent );
begin Inherited;
      CVE_TASA_INDICAD :=CreaCampo('CVE_TASA_INDICAD',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_INDICAD.Caption:='Clave de Tasa Indicad';
      B_MUESTREO_FECHA :=CreaCampo('B_MUESTREO_FECHA',ftString,tsNinguno,tsNinguno,True);
                B_MUESTREO_FECHA.Caption:='Muestreo Fecha';
      CVE_TASA_BANXICO :=CreaCampo('CVE_TASA_BANXICO',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_BANXICO.Caption:='Clave de Tasa Banxico';
      DESC_TASA_INDIC :=CreaCampo('DESC_TASA_INDIC',ftString,tsNinguno,tsNinguno,True);
                DESC_TASA_INDIC.Caption:='Descripción Tasa Indic';
      DIAS_PUBLICACION :=CreaCampo('DIAS_PUBLICACION',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PUBLICACION.Caption:='Dias Publicacion';
      With DIAS_PUBLICACION do
      begin
        UseCombo:=true;
        ComboDatos.Add('1'); ComboLista.Add('DIARIA');
        ComboDatos.Add('7'); ComboLista.Add('SEMANAL');
        ComboDatos.Add('15'); ComboLista.Add('QUINCENAL');
        ComboDatos.Add('30'); ComboLista.Add('MENSUAL');
        ComboDatos.Add('60'); ComboLista.Add('BIMESTRAL');
        ComboDatos.Add('90'); ComboLista.Add('TRIMESTRAL');

      end;

      ID_AUTOR_PUBLICA :=CreaCampo('ID_AUTOR_PUBLICA',ftFloat,tsNinguno,tsNinguno,True);
                ID_AUTOR_PUBLICA.Caption:='Número de Autor Publica';
      TIPO_TASA_INDIC :=CreaCampo('TIPO_TASA_INDIC',ftString,tsNinguno,tsNinguno,True);
                TIPO_TASA_INDIC.Caption:='Tipo Tasa Indic';
      With TIPO_TASA_INDIC do
      begin
        UseCombo:=true;
        ComboDatos.Add('MK'); ComboLista.Add('DE MERCADO');
        ComboDatos.Add('OP'); ComboLista.Add('OPERATIVO');
      end;
      B_TASA_CREDITO :=CreaCampo('B_TASA_CREDITO',ftString,tsNinguno,tsNinguno,True);
                B_TASA_CREDITO.Caption:='Tasa Credito';
      B_TASA_FORWARD :=CreaCampo('B_TASA_FORWARD',ftString,tsNinguno,tsNinguno,True);
                B_TASA_FORWARD.Caption:='Tasa Forward';
      CVE_TPO_TASA_IND :=CreaCampo('CVE_TPO_TASA_IND',ftString,tsNinguno,tsNinguno,True);
                CVE_TPO_TASA_IND.Caption:='Clave de Tpo Tasa Ind';
      With CVE_TPO_TASA_IND do
      begin
        UseCombo:=true;
        ComboDatos.Add('');   ComboLista.Add('NINGUNO');
        ComboDatos.Add('TS'); ComboLista.Add('TASA');
        ComboDatos.Add('IN'); ComboLista.Add('INDICADOR');
      end;
      NUM_DIAS_TASA :=CreaCampo('NUM_DIAS_TASA',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIAS_TASA.Caption:='Número Dias Tasa';
      SIT_TASA_INDIC :=CreaCampo('SIT_TASA_INDIC',ftString,tsNinguno,tsNinguno,True);
                SIT_TASA_INDIC.Caption:='Situación Tasa Indic';
      With SIT_TASA_INDIC do
      begin
        UseCombo:=true;
        ComboDatos.Add('AC'); ComboLista.Add('ACTIVO');
        ComboDatos.Add('IN'); ComboLista.Add('INACTIVO');
      end;
      CVE_TASA_SITI :=CreaCampo('CVE_TASA_SITI',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_SITI.Caption:='Clave de Tasa Siti';
      CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_REFER.Caption:='Clave de Tasa Refer';
      B_TASA_BASE :=CreaCampo('B_TASA_BASE',ftString,tsNinguno,tsNinguno,True);
                B_TASA_BASE.Caption:='Tasa Base';
      {$WARNINGS OFF}
      Intermediario := TIntermed.Create(self);
      {$WARNINGS ON}
      Intermediario.MasterSource:= self;
      Intermediario.Id_Intermediario.MasterField:='ID_AUTOR_PUBLICA';
      Intermediario.BuscaWhereString:=' CVE_TIPO_INTERM=''AF''';
      Intermediario.FilterString:=' CVE_TIPO_INTERM=''AF''';

      {$WARNINGS OFF}
      TasaSiti:= TCrTaSiRe.Create(self);
      {$WARNINGS ON}      
      TasaSiti.MasterSource:=self;
      TasaSiti.CVE_TASA_SITI.MasterField:='CVE_TASA_SITI';

      FKeyFields.Add('CVE_TASA_INDICAD');

      TableName := 'TASA_INDIC_FINAN';
      UseQuery := True;
      HelpFile := 'IntTasIndFin.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TTasIndFin.Destroy;
begin inherited;
end;


function TTasIndFin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTasaIndicFinan;
begin
   W:=TWTasaIndicFinan.Create(Self);
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


Function TTasIndFin.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ITaInFi.it','S');
      Try if Active then begin T.Param(0,CVE_TASA_INDICAD.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA TASA_INDIC_FINAN********************)
(*                                                                              *)
(*  FORMA DE TASA_INDIC_FINAN                                                            *)
(*                                                                              *)
(***********************************************FORMA TASA_INDIC_FINAN********************)

procedure TWTasaIndicFinan.MuestraLista;
var vlcont: integer;
begin
  try
    vlcont:=1;
    qryDatos.Close;
    qryDatos.DatabaseName:=Objeto.Apli.DataBaseName;
    qryDatos.SessionName:=Objeto.Apli.SessionName;
    qryDatos.Open;
    while not(qryDatos.Eof) do
    begin
       SAG.Cells[0,vlcont]:= qryDatos.fieldbyname('CVE_TASA_INDICAD').AsString ;
       SAG.Cells[1,vlcont]:= qryDatos.fieldbyname('DESC_TASA_INDIC').AsString ;
       vlcont:=vlcont+1;
       SAG.RowCount:= vlcont;
       qryDatos.Next;
    end;
    if vlcont>1 then Objeto.FindKey([SAG.Cells[0,1]]);
  finally
    qryDatos.Close;
  end;
end;

procedure TWTasaIndicFinan.FormShow(Sender: TObject);
begin
      Objeto.CVE_TASA_INDICAD.Control:=edCVE_TASA_INDICAD;
      Objeto.B_MUESTREO_FECHA.Control:=chB_MUESTREO_FECHA;
      Objeto.CVE_TASA_BANXICO.Control:=edCVE_TASA_BANXICO;
      Objeto.DESC_TASA_INDIC.Control:=edDESC_TASA_INDIC;
      Objeto.DIAS_PUBLICACION.Control:=cbDIAS_PUBLICACION;
      Objeto.ID_AUTOR_PUBLICA.Control:=edID_AUTOR_PUBLICA;
      Objeto.TIPO_TASA_INDIC.Control:=cbTIPO_TASA_INDIC;
      Objeto.B_TASA_CREDITO.Control:=chB_TASA_CREDITO;
      Objeto.B_TASA_FORWARD.Control:=chB_TASA_FORWARD;
      Objeto.CVE_TPO_TASA_IND.Control:=cbCVE_TPO_TASA_IND;
      Objeto.NUM_DIAS_TASA.Control:=edNUM_DIAS_TASA;
      Objeto.SIT_TASA_INDIC.Control:=cbSIT_TASA_INDIC;
      Objeto.CVE_TASA_SITI.Control:=edCVE_TASA_SITI;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;
      Objeto.B_TASA_BASE.Control:=chB_TASA_BASE;
      Objeto.Intermediario.Id_Intermediario.Control:= edID_AUTOR_PUBLICA;
      Objeto.Intermediario.Nom_INET.Control:= edDESC_INTERM;
      Objeto.TasaSiti.CVE_TASA_SITI.Control:= edCVE_TASA_SITI;
      // Inicia modificaciones SATV4766 07Mzo2007
      Objeto.TasaSiti.ID_TASA_REF_SITI.Control := edID_TASA_REF_SITI;
      Objeto.TasaSiti.DESC_TASA_SITI.Control   := edDESC_TASA_SITI;
      // Termina modificaciones SATV4766
      MuestraLista;
end;



procedure TWTasaIndicFinan.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TASA_INDICAD.Control:=nil;
      Objeto.B_MUESTREO_FECHA.Control:=nil;
      Objeto.CVE_TASA_BANXICO.Control:=nil;
      Objeto.DESC_TASA_INDIC.Control:=nil;
      Objeto.DIAS_PUBLICACION.Control:=nil;
      Objeto.ID_AUTOR_PUBLICA.Control:=nil;
      Objeto.TIPO_TASA_INDIC.Control:=nil;
      Objeto.B_TASA_CREDITO.Control:=nil;
      Objeto.B_TASA_FORWARD.Control:=nil;
      Objeto.CVE_TPO_TASA_IND.Control:=nil;
      Objeto.NUM_DIAS_TASA.Control:=nil;
      Objeto.SIT_TASA_INDIC.Control:=nil;
      Objeto.CVE_TASA_SITI.Control:=nil;
      Objeto.CVE_TASA_REFER.Control:=nil;
      Objeto.B_TASA_BASE.Control:=nil;
      Objeto.Intermediario.Id_Intermediario.Control:=nil;
      Objeto.Intermediario.Nom_INET.Control:=nil;
      Objeto.TasaSiti.CVE_TASA_SITI.Control:= NIL;
      // Inicia modificaciones SATV4766 07Mzo2007
      Objeto.TasaSiti.ID_TASA_REF_SITI.Control := NIL;
      Objeto.TasaSiti.DESC_TASA_SITI.Control   := NIL;
      // Termina modificaciones SATV4766
   //Objeto
end;

procedure TWTasaIndicFinan.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTasaIndicFinan.InterForma1DespuesNuevo(Sender: TObject);
begin
  Objeto.SIT_TASA_INDIC.AsString:='AC';
  SAG.Enabled:= FALSE;
  Objeto.TIPO_TASA_INDIC.AsString:='OP';
  Objeto.DIAS_PUBLICACION.AsString:='1';
  Objeto.CVE_TASA_BANXICO.AsString:='A';
end;

procedure TWTasaIndicFinan.SpeedButton1Click(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTASINDFIN_BTN0',true, true) THEN EXIT;
   Objeto.Intermediario.Busca;
end;

procedure TWTasaIndicFinan.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin show:=true;

end;

procedure TWTasaIndicFinan.InterLinkit1Ejecuta(Sender: TObject);
begin
Objeto.Intermediario.FindKey([InterLinkit1.Buffer]);

end;

procedure TWTasaIndicFinan.btCVE_TASA_SITIClick(Sender: TObject);
begin
// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTASINDFIN_BTN2',true, true) THEN EXIT;
   Objeto.TasaSiti.Busca;
end;

procedure TWTasaIndicFinan.SpeedButton2Click(Sender: TObject);
Var T:TInterFindit;
begin
// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTASINDFIN_BTN1',true, true) THEN EXIT;

      T := Objeto.CreaBuscador('ITaInFi.it','S');
      T.WhereString:=' NVL(B_TASA_BASE, ''F'')=''V''';
      Try if Objeto.Active then begin T.Param(0,Objeto.CVE_TASA_INDICAD.AsString);
                               end;
          if T.Execute then Objeto.CVE_TASA_REFER.AsString:=T.DameCampo(0);
      finally  T.Free;
      end;
end;

procedure TWTasaIndicFinan.InterForma1DespuesAceptar(Sender: TObject);
var ParTasOp: TParTasOp;
begin
  try
    if (Objeto.TIPO_TASA_INDIC.AsString='OP') then
    begin
      {$WARNINGS OFF}
        ParTasOp:= TParTasOp.Create(nil);
      {$WARNINGS ON}
      try
        ParTasOp.GetParams(Objeto);
        ParTasOp.CVE_TASA_INDICAD.AsString:= Objeto.CVE_TASA_INDICAD.AsString;
        IF (ParTasOp.FindKey([Objeto.CVE_TASA_INDICAD.AsString])) THEN
            ParTasOp.Catalogo
        else
            ParTasOp.Nuevo;
      finally
        ParTasOp.free;
      end;
    end;
    MuestraLista;
  finally
    SAG.Enabled:= TRUE;
  end;
end;

procedure TWTasaIndicFinan.SAGDblClick(Sender: TObject);
var ParTasOp: TParTasOp;
begin
    if (Objeto.TIPO_TASA_INDIC.AsString='OP') then
    begin
      {$WARNINGS OFF}
      ParTasOp:= TParTasOp.Create(nil);
      {$WARNINGS ON}
      try
        ParTasOp.GetParams(Objeto);
        IF (ParTasOp.FindKey([SAG.Cells[0,SAG.Row]])) THEN
            ParTasOp.Catalogo
        else
        begin
          ParTasOp.CVE_TASA_INDICAD.AsString:= Objeto.CVE_TASA_INDICAD.AsString;
          ParTasOp.Nuevo;
        END;
      finally
        ParTasOp.free;
      end;
    end;
end;

procedure TWTasaIndicFinan.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=TRUE;
end;

procedure TWTasaIndicFinan.InterLinkit2Ejecuta(Sender: TObject);
begin
  Objeto.TasaSiti.FindKey([InterLinkit2.Buffer]);
end;

procedure TWTasaIndicFinan.SAGClick(Sender: TObject);
begin
  Objeto.FindKey([SAG.Cells[0, SAG.ROW]]);
end;

procedure TWTasaIndicFinan.ilCVE_TASA_SITIEjecuta(Sender: TObject);
begin
  Objeto.TasaSiti.FindKey([ilCVE_TASA_SITI.Buffer]);
end;

procedure TWTasaIndicFinan.CatlogoClaveSITI1Click(Sender: TObject);
var CrTaSiRe : TCrTaSiRe;
begin
  {$WARNINGS OFF}
  CrTaSiRe := TCrTaSiRe.Create(Nil);
  {$WARNINGS ON}
  CrTaSiRe.Apli := Objeto.Apli;
  CrTaSiRe.FindKey([edCVE_TASA_SITI.Text]);
  CrTaSiRe.ShowWindow(ftConsulta);
end;

end.
