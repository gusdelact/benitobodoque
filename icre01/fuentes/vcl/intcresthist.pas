// Sistema         : Clase de TCrEstHist
// Fecha de Inicio : 01/07/2004
// Función forma   : Clase de TCrEstHist
// Desarrollo por  : Intercase Javier Martínez
// Diseñado por    :
// Comentarios     :
Unit IntCrEstHist;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrEstHist= class;

  TwCrEstHist=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    edF_Consulta: TEdit;
    dtpF_Consulta: TInterDateTimePicker;
    Label1: TLabel;
    edArchivo: TEdit;
    btGuardar: TBitBtn;
    sdArchivo: TSaveDialog;
    qyConsulta: TQuery;
    qyConsultaF_ESTADISTICA: TStringField;
    qyConsultaANIO_MES: TStringField;
    qyConsultaID_ACREDITADO: TFloatField;
    qyConsultaACREDITADO: TStringField;
    qyConsultaID_PROM_ASOC: TFloatField;
    qyConsultaPROM_ASOC: TStringField;
    qyConsultaID_PROM_ADM: TFloatField;
    qyConsultaPROM_ADMIN: TStringField;
    qyConsultaCVE_MERCADO: TStringField;
    qyConsultaDESC_MERCADO: TStringField;
    qyConsultaCVE_SUBMERCADO: TStringField;
    qyConsultaDESC_SUBMERCADO: TStringField;
    qyConsultaSIT_CARTERA: TStringField;
    qyConsultaIMP_COLOC_DOC: TFloatField;
    qyConsultaIMP_COLOC_OTROS: TFloatField;
    qyConsultaIMP_VENC_DOC: TFloatField;
    qyConsultaIMP_VENC_OTROS: TFloatField;
    qyConsultaIMP_SDO: TFloatField;
    qyConsultaIMP_SDO_PROM: TFloatField;
    qyConsultaIMP_MORATORIO: TFloatField;
    qyConsultaIMP_MARGEN: TFloatField;
    qyConsultaIMP_COMISION: TFloatField;
    qyConsultaIMP_UTILIDAD: TFloatField;
    qyConsultaIMP_COL_DOC_DIA: TFloatField;
    qyConsultaIMP_COL_OTR_DIA: TFloatField;
    qyConsultaIMP_VNC_AC_DOC: TFloatField;
    qyConsultaIMP_VNC_AC_OTR: TFloatField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btGuardarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    private
    { Private declarations }
        procedure GeneraArchivo;
    public
    { Public declarations }
    Objeto : TCrEstHist;
end;
 TCrEstHist= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        ParamCre                 : TParamCre;
        F_CONSULTA               : TInterCampo;


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


constructor TCrEstHist.Create( AOwner : TComponent );
begin Inherited;
      UseQuery := False;
      HelpFile := 'InTCrEstHist.Hlp';
      ShowMenuReporte:=True;

      F_CONSULTA :=CreaCampo('F_CONSULTA',ftDate,tsNinguno,tsNinguno,False);
      F_CONSULTA.Caption:='Fecha de Consulta';


end;

Destructor TCrEstHist.Destroy;
begin
   inherited;
end;


function TCrEstHist.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwCrEstHist;
begin
   W:=TwCrEstHist.Create(Self);
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


Function TCrEstHist.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TCrEstHist.Reporte:Boolean;
begin //Execute_Reporte();
end;

(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwCrEstHist.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.F_CONSULTA.Control := edF_Consulta;
      Objeto.F_CONSULTA.AsDateTime := Objeto.Apli.DameFechaEmpresa-1;
      Objeto.F_CONSULTA.DrawControl;

      InterForma1.ShowBtnPreview:= False;
      InterForma1.BtnImprimir.Caption:= 'Generar';

      qyConsulta.DatabaseName:=Objeto.Apli.DataBaseName;
      qyConsulta.SessionName:=Objeto.Apli.SessionName;

end;

procedure TwCrEstHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;



procedure TwCrEstHist.InterForma1BtnImprimirClick(Sender: TObject);
begin
  If Trim(edArchivo.Text)<>'' Then GeneraArchivo;
end;

procedure TwCrEstHist.btGuardarClick(Sender: TObject);
begin
  Objeto.F_CONSULTA.GetFromControl;
  sdArchivo.FileName:= 'Estad_Hist_'+FormatDateTime('yymmdd', Objeto.F_CONSULTA.AsDateTime)+'.txt' ;
  If sdArchivo.Execute Then Begin
    edArchivo.Text:= sdArchivo.FileName;
  End;
end;


Procedure TwCrEstHist.GeneraArchivo;
Var
  F: TextFile;
Begin
  Objeto.F_CONSULTA.GetFromControl;

  qyConsulta.Active:= False;
  qyConsulta.ParamByName('pFecha').AsDateTime:=  Objeto.F_CONSULTA.AsDateTime;
  qyConsulta.Active:= True;

  AssignFile(F, edArchivo.Text);
  Rewrite(F);
  Writeln(F, 'FECHA CONSULTA@' +
             'AÑO MES@' +
             'ID. PROM. ADMIN.@' +
             'NOMBRE PROMOTOR ADMINISTRADOR@' +
             'ID. PROM. ASOC.@' +
             'NOMBRE PROMOTOR ASOCIADO@' +
             'ID. ACREDITADO@' +
             'NOMBRE ACREDITADO@' +
             'CVE. MERC. OBJETIVO@' +
             'DESCRIPCION MERCADO OBJETIVO@' +
             'CVE. SUBMERC. OBJETIVO@' +
             'DESCRIPCION SUBMERCADO OBJETIVO@' +
             'SITUACION CARTERA@' +
             'COLOC. DESCUENTO DOCTOS.@' +
             'COLOC. OTROS MERC.@' +
             'VENC. DESCUENTO DOCTOS.@' +
             'VENC. OTROS MERC.@' +
             'SALDO AL CORTE@' +
             'SALDO PROMEDIO@' +
             'MORATORIOS@' +
             'MARGEN FINANCIERO@' +
             'COMISIONES@' +
             'UTILIDAD@' +
             'IMP. COLOC. DIARIA DESCUENTO DOCTOS.@' +
             'IMP. COLOC. DIARIA OTROS MERC.@' +
             'VENC. ACUM. DESCUENTO DOCTOS.@' +
             'VENC. ACUM. OTROS MERC.');

  While Not qyConsulta.Eof Do Begin
    Writeln(F,
      qyConsulta.FieldByName('F_ESTADISTICA').AsString  + '@' +
      qyConsulta.FieldByName('ANIO_MES').AsString    + '@' +
      qyConsulta.FieldByName('ID_PROM_ADM').AsString + '@' +
      qyConsulta.FieldByName('PROM_ADMIN').AsString     + '@' +
      qyConsulta.FieldByName('ID_PROM_ASOC').AsString     + '@' +
      qyConsulta.FieldByName('PROM_ASOC').AsString     + '@' +
      qyConsulta.FieldByName('ID_ACREDITADO').AsString     + '@' +
      qyConsulta.FieldByName('ACREDITADO').AsString     + '@' +
      qyConsulta.FieldByName('CVE_MERCADO').AsString     + '@' +
      qyConsulta.FieldByName('DESC_MERCADO').AsString     + '@' +
      qyConsulta.FieldByName('CVE_SUBMERCADO').AsString     + '@' +
      qyConsulta.FieldByName('DESC_SUBMERCADO').AsString     + '@' +
      qyConsulta.FieldByName('SIT_CARTERA').AsString     + '@' +
      qyConsultaIMP_COLOC_DOC.AsString     + '@' +
      qyConsultaIMP_COLOC_OTROS.AsString     + '@' +
      qyConsultaIMP_VENC_DOC.AsString     + '@' +
      qyConsultaIMP_VENC_OTROS.AsString     + '@' +
      qyConsultaIMP_SDO.AsString     + '@' +
      qyConsultaIMP_SDO_PROM.AsString     + '@' +
      qyConsultaIMP_MORATORIO.AsString     + '@' +
      qyConsultaIMP_MARGEN.AsString     + '@' +
      qyConsultaIMP_COMISION.AsString     + '@' +
      qyConsultaIMP_UTILIDAD.AsString     + '@' +
      qyConsultaIMP_COL_DOC_DIA.AsString     + '@' +
      qyConsultaIMP_COL_OTR_DIA.AsString  + '@' +
      qyConsultaIMP_VNC_AC_DOC.AsString     + '@' +
      qyConsultaIMP_VNC_AC_OTR.AsString  );
    qyConsulta.Next;
  End;
  qyConsulta.Active:= False;
  CloseFile(F);
  MessageDlg('Archivo Generado:'+edArchivo.Text, mtInformation, [mbOK], 0);

End;


procedure TwCrEstHist.FormDestroy(Sender: TObject);
begin
   Objeto.F_CONSULTA.Control := nil;
end;

end.

