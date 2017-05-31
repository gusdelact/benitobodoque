// Sistema         : Clase de CTO_VISITA_DOMI
// Fecha de Inicio : 14/03/2008
// Función forma   : Clase de CTO_VISITA_DOMI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Yadira Sofia Roque Urbina
// Comentarios     :
Unit IntCtoVisDom;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCtoVisDom= class;

  TWCtoVisitaDomi=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CONTRATO : TLabel;
    edID_CONTRATO : TEdit;
    lbF_VIS_DOMI : TLabel;
    dtpF_VIS_DOMI : TInterDateTimePicker;
    edF_VIS_DOMI : TEdit;
    chB_VIS_REALIZADA : TCheckBox;
    lbTX_COMENTARIO : TLabel;
    lbCVE_USUAR_ALTA : TLabel;
    edCVE_USUAR_ALTA : TEdit;
    lbFH_ALTA : TLabel;
    edFH_ALTA : TEdit;
    lbCVE_USUAR_MODIF : TLabel;
    edCVE_USUAR_MODIF : TEdit;
    lbFH_MODIFICACION : TLabel;
    edFH_MODIFICACION : TEdit;
    IedTX_COMENTARIO: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCtoVisDom;
end;
 TCtoVisDom= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vpIdContrato             : Integer;
        ID_CONTRATO              : TInterCampo;
        F_VIS_DOMI               : TInterCampo;
        B_VIS_REALIZADA          : TInterCampo;
        TX_COMENTARIO            : TInterCampo;
        CVE_USUAR_ALTA           : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USUAR_MODIF          : TInterCampo;
        FH_MODIFICACION          : TInterCampo;
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


constructor TCtoVisDom.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      F_VIS_DOMI :=CreaCampo('F_VIS_DOMI',ftDate,tsNinguno,tsNinguno,True);
                F_VIS_DOMI.Caption:='Fecha Vis Domi';
      B_VIS_REALIZADA :=CreaCampo('B_VIS_REALIZADA',ftString,tsNinguno,tsNinguno,True);
                B_VIS_REALIZADA.Caption:='Vis Realizada';
      TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIO.Caption:='Comentario';
      CVE_USUAR_ALTA :=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USUAR_ALTA.Caption:='Clave de Usuario Alta';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      CVE_USUAR_MODIF :=CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USUAR_MODIF.Caption:='Clave de Usuario Modificación';
      FH_MODIFICACION :=CreaCampo('FH_MODIFICACION',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICACION.Caption:='Fecha y Hora Modificacion';

      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('F_VIS_DOMI');

      TableName := 'CTO_VISITA_DOMI';
      UseQuery := True;
      HelpFile := 'IntCtoVisDom.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCtoVisDom.Destroy;
begin
  inherited;
end;


function TCtoVisDom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCtoVisitaDomi;
    qryNuevo     : TQuery;
    qryModificar : TQuery;
    qryEliminar  : TQuery;
begin
   W:=TWCtoVisitaDomi.Create(Self);

   qryNuevo     := TQuery.Create(Nil);
   qryModificar := TQuery.Create(Nil);
   qryEliminar  := TQuery.Create(Nil);

   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;

      //Valida los privilegios del Usuario, en tabla SECU_OPER_ACC

      //Verifica si tiene permiso para dar Nuevo
      qryNuevo.DatabaseName   := W.Objeto.DataBaseName;
      qryNuevo.SessionName    := W.Objeto.SessionName;
      qryNuevo.Sql.Text       :=
                                ' SELECT ' +
                                ' COUNT(CVE_FUNCION) AS EXISTEREG ' +
                                ' FROM SECU_OPER_ACC ' +
                                ' WHERE ' +
                                '       CVE_FUNCION  = ' + #39 + 'CLASE_TCTOVISDOM' + #39 +
                                '   AND CVE_OPER_ACC = ' + #39 + 'N' + #39 +
                                '   AND CVE_USUARIO  = ' + #39 + W.Objeto.DameUsuario + #39;
      qryNuevo.Open;

      if ( qryNuevo.FieldByName('EXISTEREG').AsInteger = 0 ) then
        W.InterForma1.ShowBtnNuevo     := False;

      //Verifica si tiene permiso para dar Modificar
      qryModificar.DatabaseName   := W.Objeto.DataBaseName;
      qryModificar.SessionName    := W.Objeto.SessionName;
      qryModificar.Sql.Text       :=
                                ' SELECT ' +
                                ' COUNT(CVE_FUNCION) AS EXISTEREG ' +
                                ' FROM SECU_OPER_ACC ' +
                                ' WHERE ' +
                                '       CVE_FUNCION  = ' + #39 + 'CLASE_TCTOVISDOM' + #39 +
                                '   AND CVE_OPER_ACC = ' + #39 + 'M' + #39 +
                                '   AND CVE_USUARIO  = ' + #39 + W.Objeto.DameUsuario + #39;
      qryModificar.Open;

      if ( qryModificar.FieldByName('EXISTEREG').AsInteger = 0 ) then
        W.InterForma1.ShowBtnModificar     := False;

      //Verifica si tiene permiso para dar Eliminar
      qryEliminar.DatabaseName   := W.Objeto.DataBaseName;
      qryEliminar.SessionName    := W.Objeto.SessionName;
      qryEliminar.Sql.Text       :=
                                ' SELECT ' +
                                ' COUNT(CVE_FUNCION) AS EXISTEREG ' +
                                ' FROM SECU_OPER_ACC ' +
                                ' WHERE ' +
                                '       CVE_FUNCION  = ' + #39 + 'CLASE_TCTOVISDOM' + #39 +
                                '   AND CVE_OPER_ACC = ' + #39 + 'E' + #39 +
                                '   AND CVE_USUARIO  = ' + #39 + W.Objeto.DameUsuario + #39;
      qryEliminar.Open;

      if ( qryEliminar.FieldByName('EXISTEREG').AsInteger = 0 ) then
        W.InterForma1.ShowBtnEliminar     := False;

      //Continua código original
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
      If Assigned(qryNuevo) Then qryNuevo.Destroy;
      If Assigned(qryModificar) Then qryModificar.Destroy;
      If Assigned(qryEliminar) Then qryEliminar.Destroy;
   end;
end;


Function TCtoVisDom.InternalBusca:Boolean;
Var T:TInterFindit;
begin
      InternalBusca := False;
      T := CreaBuscador('ICtViDo.it','F,D');

      T.WhereString:= 'Id_Contrato = ' + intToStr(vpIdContrato);

      Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                               T.Param(1,F_VIS_DOMI.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCtoVisDom.Reporte:Boolean; 
begin //Execute_Reporte();
end;


(***********************************************FORMA CTO_VISITA_DOMI********************)
(*                                                                              *)
(*  FORMA DE CTO_VISITA_DOMI                                                            *)
(*                                                                              *)
(***********************************************FORMA CTO_VISITA_DOMI********************)

procedure TWCtoVisitaDomi.FormShow(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.F_VIS_DOMI.Control:=edF_VIS_DOMI;
      Objeto.B_VIS_REALIZADA.Control:=chB_VIS_REALIZADA;
      Objeto.TX_COMENTARIO.Control:=IedTX_COMENTARIO;
      Objeto.CVE_USUAR_ALTA.Control:=edCVE_USUAR_ALTA;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USUAR_MODIF.Control:=edCVE_USUAR_MODIF;
      Objeto.FH_MODIFICACION.Control:=edFH_MODIFICACION;
end;

procedure TWCtoVisitaDomi.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.F_VIS_DOMI.Control:=nil;
      Objeto.B_VIS_REALIZADA.Control:=nil;
      Objeto.TX_COMENTARIO.Control:=nil;
      Objeto.CVE_USUAR_ALTA.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USUAR_MODIF.Control:=nil;
      Objeto.FH_MODIFICACION.Control:=nil;
end;

procedure TWCtoVisitaDomi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCtoVisitaDomi.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if IsNewData Then
  begin
      edCVE_USUAR_ALTA.Text    := Objeto.DameUsuario;
      edFH_ALTA.Text           := DateTimeToStr(Objeto.Apli.SysDateTime);
  end
  else
  begin
      edCVE_USUAR_MODIF.Text    := Objeto.DameUsuario;
      edFH_MODIFICACION.Text    := DateTimeToStr(Objeto.Apli.SysDateTime);
  end;
end;

procedure TWCtoVisitaDomi.InterForma1DespuesNuevo(Sender: TObject);
begin
  edID_CONTRATO.Text := IntToStr(Objeto.vpIdContrato);
end;

end.
