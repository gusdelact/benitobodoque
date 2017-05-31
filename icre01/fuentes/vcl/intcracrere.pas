// Sistema         : Clase de CR_ACRE_RE
// Fecha de Inicio : 21/01/2011
// Función forma   : Clase de CR_ACRE_RE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :  
Unit IntCrAcreRe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
        IntParamCre,  //Parametros
        IntPers, IntLinkit
//        IntCrAcredit  // Acreditado
;

Type
 TCrAcreRe= class;

  TWCrAcreRe=Class(TForm)
    InterForma1             : TInterForma;
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    lbF_ALTA_RECU: TLabel;
    dtpF_ALTA_RECU: TInterDateTimePicker;
    edF_ALTA_RECU: TEdit;
    lbF_BAJA_RECU: TLabel;
    dtpF_BAJA_RECU: TInterDateTimePicker;
    edF_BAJA_RECU: TEdit;
    lbID_REC : TLabel;
    edID_REC : TEdit;
    Panel1: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDfecha: TLabel;
    lbDempresa: TLabel;
    edDESC_ACREDITADO: TEdit;
    GroupBox1: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_BAJA: TLabel;
    lbCVE_USU_BAJA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    edF_ALTA: TEdit;
    edF_BAJA: TEdit;
    edCVE_USU_BAJA: TEdit;
    edCVE_USU_ALTA: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edF_ALTA_RECUExit(Sender: TObject);
    procedure edF_BAJA_RECUExit(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);


    private
    { Private declarations }
    public

    { Public declarations }
    Objeto : TCrAcreRe;


end;
 TCrAcreRe= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        ID_ACREDITADO            : TInterCampo;
        F_ALTA_RECU              : TInterCampo;
        F_BAJA_RECU              : TInterCampo;
        ID_REC                   : TInterCampo;

        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_BAJA                   : TInterCampo;
        CVE_USU_BAJA             : TInterCampo;

        ParamCre                 : TParamCre;

        vldescripcion_Acre : string;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published 
      end;


var vlid_acreditado, vlid_rec_nvo : string;
    vlSql : String;
    vlTQuery    : TQuery;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAcreRe.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Número de Acreditado';
      F_ALTA_RECU :=CreaCampo('F_ALTA_RECU',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA_RECU.Caption:='Fecha Alta de Recuperacion';
      F_BAJA_RECU :=CreaCampo('F_BAJA_RECU',ftDate,tsNinguno,tsNinguno,True);
                F_BAJA_RECU.Caption:='Fecha Baja de Recuperacion';
      ID_REC :=CreaCampo('ID_REC',ftFloat,tsNinguno,tsNinguno,True);
                ID_REC.Caption:='Consecutivo';

      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha de Captura de Alta';

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usuario de Alta';

      F_BAJA :=CreaCampo('F_BAJA',ftDate,tsNinguno,tsNinguno,True);
                F_BAJA.Caption:='Fecha de Captura de Baja';

      CVE_USU_BAJA :=CreaCampo('CVE_USU_BAJA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_BAJA.Caption:='Clave de Usuario de Baja';
 //-->     Acreditado := TCrAcredit.Create(Self);

      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('ID_REC');

      TableName := 'CR_ACRE_RE'; 
      UseQuery := True; 
      HelpFile := 'IntCrAcreRe.Hlp';
      ShowMenuReporte:=True;

End;

Destructor TCrAcreRe.Destroy;
begin inherited;
end;


function TCrAcreRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAcreRe;
begin
   W:=TWCrAcreRe.Create(Self);
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


Function TCrAcreRe.InternalBusca:Boolean;
Var T:TInterFindit;

begin InternalBusca := False; 
      T := CreaBuscador('ICrAcrRe.it','F');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString); 
                               end;
          if T.Execute then
          begin
             InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
          end;
      finally  T.Free;
      end;
end;

function TCrAcreRe.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_ACRE_RE********************)
(*                                                                              *)
(*  FORMA DE CR_ACRE_RE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACRE_RE********************)

procedure TWCrAcreRe.FormShow(Sender: TObject);
var vlid_cre : string;
begin
   With Objeto Do
   Begin
     lbDempresa.Caption := ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := ParamCre.FECHA.AsString;
     lbDUsuario.Caption := ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      ID_ACREDITADO.Control:=edID_ACREDITADO;
      F_ALTA_RECU.Control:=edF_ALTA_RECU;
      F_BAJA_RECU.Control:=edF_BAJA_RECU;
      ID_REC.Control:=edID_REC;

      F_ALTA.Control:=edF_ALTA;
      CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      F_BAJA.Control:=edF_BAJA;
      CVE_USU_BAJA.Control:=edCVE_USU_BAJA;
      //Objeto.
    End;
   vlid_acreditado:= IntToStr(Objeto.ID_ACREDITADO.AsInteger);
   edDESC_ACREDITADO.Text:= Objeto.vldescripcion_Acre;

   if Objeto.ID_ACREDITADO.AsInteger > 0 then
   begin
      vlSql := 'SELECT ID_REC FROM CR_ACRE_RE WHERE ID_ACREDITADO = '+ IntToStr(Objeto.ID_ACREDITADO.AsInteger)+
               ' AND F_ALTA_RECU IS NOT NULL AND F_BAJA_RECU IS NULL';
      vlTQuery := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
        if vlTQuery <> nil then
        begin
           vlid_cre := IntToStr(vlTQuery.FieldByName('ID_REC').AsInteger);
           Objeto.FindKey([vlid_acreditado, vlid_cre]);
        end;
      finally
          if vlTQuery <> nil then vlTQuery.free;
      end;    
   end;
   InterForma1.BtnEliminar.Visible:=false;
end;

procedure TWCrAcreRe.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.F_ALTA_RECU.Control:=nil;
      Objeto.F_BAJA_RECU.Control:=nil;
      Objeto.ID_REC.Control:=nil;

      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_BAJA.Control:=nil;
      Objeto.CVE_USU_BAJA.Control:=nil;
end;

procedure TWCrAcreRe.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAcreRe.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
   edF_ALTA_RECU.Enabled:=false;
   dtpF_ALTA_RECU.Enabled:=false;
end;

procedure TWCrAcreRe.edF_BAJA_RECUExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
    vlSalida := True;
    InterForma1.ValidaExit(edF_BAJA_RECU,VLSalida,VlMsg,True);
end;


procedure TWCrAcreRe.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);

begin
   if Objeto.ID_ACREDITADO.AsInteger > 0 then
   begin
      vlSql := 'SELECT NVL(MAX(ID_REC),0) AS NCOUNT FROM CR_ACRE_RE WHERE ID_ACREDITADO = '+ IntToStr(Objeto.ID_ACREDITADO.AsInteger);
      vlTQuery := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      if vlTQuery.IsEmpty = False then
         vlid_rec_nvo := IntToStr(vlTQuery.FieldByName('NCOUNT').AsInteger + 1)
      else
         vlid_rec_nvo := '1';
      vlTQuery.Close;
      vlTQuery.Free;
   end;
   edF_ALTA_RECU.Enabled:=true;
   dtpF_ALTA_RECU.Enabled:=true;
end;

procedure TWCrAcreRe.InterForma1DespuesNuevo(Sender: TObject);
begin
   with Objeto do
   begin
      edID_ACREDITADO.Text:=vlid_acreditado;
      Objeto.ID_ACREDITADO.GetFromControl;

      edID_REC.Text := vlid_rec_nvo;
      Objeto.ID_REC.GetFromControl;
   end;
end;

procedure TWCrAcreRe.InterForma1Buscar(Sender: TObject);
begin
   //JRG LatBC    Asignación de filtros para ID_ACREDITADO y fechas pendientes de baja
   //******************************************************************************************
   Objeto.BuscaWhereString := ' CR_ACRE_RE.ID_ACREDITADO = ' + edID_ACREDITADO.Text;
//                          +   ' AND F_BAJA_RECU IS NULL ';
   Objeto.FilterString := Objeto.BuscaWhereString;
   //******************************************************************************************
   Objeto.Busca;
end;

procedure TWCrAcreRe.edF_ALTA_RECUExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
    vlSalida := True;
    InterForma1.ValidaExit(edF_ALTA_RECU,VLSalida,VlMsg,True);
end;


procedure TWCrAcreRe.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);

var vlCount: Integer;

begin
  With Objeto Do
  Begin
     if IsNewData then    //nuevo
     Begin
        vlsql:= ' SELECT COUNT(*) COUNT FROM CR_ACRE_RE WHERE ID_ACREDITADO = ' + edID_ACREDITADO.Text +
                '  AND F_ALTA_RECU IS NOT NULL ' +
                '  AND F_BAJA_RECU IS NULL ';
        GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
        if vlCount > 0 then
        begin
           ShowMessage('Ya existe un periodo de Recuperacion capturado para el Acreditado');
           Realizado := False;
        end
        else
        begin
           Realizado := True;

           F_ALTA.AsDateTime:=Apli.DameFechaEmpresaDia('D000');
           CVE_USU_ALTA.AsString:=Apli.Usuario;

           if Trim(edF_BAJA_RECU.Text)<>'' then
           begin
              Objeto.F_BAJA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
              Objeto.CVE_USU_BAJA.AsString := Objeto.Apli.Usuario;
           end;
        end;
     end
     else
     begin
        Objeto.F_BAJA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
        Objeto.CVE_USU_BAJA.AsString := Objeto.Apli.Usuario;
     end;
  end;
end;





end.
