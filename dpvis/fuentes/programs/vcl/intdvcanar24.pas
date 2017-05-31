// Sistema         : Clase de DV_CANAL_R24
// Fecha de Inicio : 25/03/2013
// Función forma   : Clase del Catálogo de DV_CANAL_R24
// Desarrollo por  : FELIX REYES PIÑA 
// Diseñado por    :                                 
// Comentarios     :
Unit IntDvCanaR24;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, //Grids, DBGrids, DBGridCapt,
  Wwdatsrc,Wwquery,InterApl;

const
  sql_grid = ' SELECT CVE_CANAL, DESC_CANAL, DESC_L_CANAL, SIT_CANAL, ' +
             ' CVE_USUARIO_ALTA, FH_REGISTRO, CVE_USUARIO_MODIF, FH_MODIFICA ' +
             ' FROM DV_CANAL_R24 ' +
             ' ORDER BY CVE_CANAL ';


Type
 TDvCanaR24= class; 

  TWDvCanalR24=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_CANAL : TLabel; 
    edCVE_CANAL : TEdit;
    lbDESC_CANAL : TLabel; 
    edDESC_CANAL : TEdit;
    lbDESC_L_CANAL : TLabel; 
    edDESC_L_CANAL : TEdit;
    lbSIT_CANAL : TLabel;
    lbCVE_USUARIO_ALTA : TLabel; 
    edCVE_USUARIO_ALTA : TEdit;
    lbFH_REGISTRO : TLabel; 
    edFH_REGISTRO : TEdit;
    lbCVE_USUARIO_MODIF : TLabel; 
    edCVE_USUARIO_MODIF : TEdit;
    lbFH_MODIFICA : TLabel; 
    edFH_MODIFICA : TEdit;
    cbSIT_CANAL: TComboBox;
    wwDataSource1: TwwDataSource;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_CANALKeyPress(Sender: TObject; var Key: Char);
    procedure wwDataSource1DataChange(Sender: TObject; Field: TField);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TDvCanaR24;
end; 
 TDvCanaR24= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_CANAL                : TInterCampo;
        DESC_CANAL               : TInterCampo;
        DESC_L_CANAL             : TInterCampo;
        SIT_CANAL                : TInterCampo;
        CVE_USUARIO_ALTA         : TInterCampo;
        FH_REGISTRO              : TInterCampo;
        CVE_USUARIO_MODIF        : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        vQuery                   : TwwQuery;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override;
//        constructor Create( AOwner : TComponent; aApli : TInterApli  ); overload;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override;
        procedure   RefrescaQuery;
      published 
      end;



implementation

//uses dMain;
//Uses RepMon;

{$R *.DFM}


constructor TDvCanaR24.Create( AOwner : TComponent);// ; aApli : TInterApli  );
begin Inherited;// Create (AOwner);
      CVE_CANAL :=CreaCampo('CVE_CANAL',ftFloat,tsNinguno,tsNinguno,True);
                CVE_CANAL.Caption:='Clave de Canal';
      DESC_CANAL :=CreaCampo('DESC_CANAL',ftString,tsNinguno,tsNinguno,True);
                DESC_CANAL.Caption:='Descripción Canal';
      DESC_L_CANAL :=CreaCampo('DESC_L_CANAL',ftString,tsNinguno,tsNinguno,True);
                DESC_L_CANAL.Caption:='Descripción L Canal';

      SIT_CANAL := CreaCampo('SIT_CANAL',ftString,tsNinguno,tsNinguno,True);
               SIT_CANAL.Caption:='Situación Canal';
               WITH SIT_CANAL DO
               BEGIN
                 Size := 3;
                 Caption := 'Situación';
                 UseCombo := True;
                 ComboLista.Add('Activo');    ComboDatos.Add('AC');
                 ComboLista.Add('Inactivo');  ComboDatos.Add('IN');
                 ComboLista.Add('Bloqueado'); ComboDatos.Add('BL');
               END;
      CVE_USUARIO_ALTA :=CreaCampo('CVE_USUARIO_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_ALTA.Caption:='Clave de Usuario Alta';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDate,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      CVE_USUARIO_MODIF :=CreaCampo('CVE_USUARIO_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_MODIF.Caption:='Clave de Usuario Modificación';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha y Hora Modifica';


      FKeyFields.Add('CVE_CANAL');

      vQuery                := TwwQuery.Create(nil);
//      vQuery.DatabaseName   := aApli.DataBaseName;//DataBaseName;
//      vQuery.SessionName    := aApli.SessionName;//SessionName;

      TableName := 'DV_CANAL_R24';
      UseQuery := True;
      HelpFile := 'IntDvCanaR24.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TDvCanaR24.Destroy;
begin inherited;
end;


function TDvCanaR24.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDvCanalR24;
begin
   W:=TWDvCanalR24.Create(Self);
   try
      vQuery.DatabaseName   := Apli.DataBaseName;//DataBaseName;
      vQuery.SessionName    := Apli.SessionName;//SessionName;
      W.Objeto:= Self;
      W.wwDataSource1.DataSet       := vQuery;
      W.InterForma1.GridDataSet     := W.wwDataSource1;
      W.InterForma1.InterFrame      := Self;
      W.InterForma1.FormaTipo       := FormaTipo;
      W.InterForma1.ShowGrid        := True;
      W.InterForma1.ShowNavigator   := True;
      W.InterForma1.Funcion         := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TDvCanaR24.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IDvCaR2.it','F');
      Try if Active then begin T.Param(0,CVE_CANAL.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TDvCanaR24.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA DV_CANAL_R24********************)
(*                                                                              *)
(*  FORMA DE DV_CANAL_R24                                                            *)
(*                                                                              *)
(***********************************************FORMA DV_CANAL_R24********************)

procedure TWDvCanalR24.FormShow(Sender: TObject);
begin
      Objeto.CVE_CANAL.Control:=edCVE_CANAL;
      Objeto.DESC_CANAL.Control:=edDESC_CANAL;
      Objeto.DESC_L_CANAL.Control:=edDESC_L_CANAL;
      Objeto.SIT_CANAL.Control:=cbSIT_CANAL;
      Objeto.CVE_USUARIO_ALTA.Control:=edCVE_USUARIO_ALTA;
      Objeto.FH_REGISTRO.Control:=edFH_REGISTRO;
      Objeto.CVE_USUARIO_MODIF.Control:=edCVE_USUARIO_MODIF;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
      Objeto.RefrescaQuery;
end;

procedure TWDvCanalR24.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CANAL.Control:=nil;
      Objeto.DESC_CANAL.Control:=nil;
      Objeto.DESC_L_CANAL.Control:=nil;
      Objeto.SIT_CANAL.Control:=nil;
      Objeto.CVE_USUARIO_ALTA.Control:=nil;
      Objeto.FH_REGISTRO.Control:=nil;
      Objeto.CVE_USUARIO_MODIF.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWDvCanalR24.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDvCanalR24.InterForma1DespuesNuevo(Sender: TObject);
begin
  edCVE_USUARIO_ALTA.Text := Objeto.DameUsuario;
  edFH_REGISTRO.Text := FormatDateTime('DD/MM/YYYY HH:MM:SS',Objeto.Apli.Fecha.GetSysDate);

  {edCVE_USUARIO_ALTA.Enabled := False;
  edFH_REGISTRO.Enabled := False;
  edCVE_USUARIO_MODIF.Enabled := False;
  edFH_MODIFICA.Enabled := False;}
  cbSIT_CANAL.ItemIndex := 0;
end;

procedure TWDvCanalR24.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
  edCVE_USUARIO_MODIF.Text := Objeto.DameUsuario;
  edFH_MODIFICA.Text :=  FormatDateTime('DD/MM/YYYY HH:MM:SS',Objeto.Apli.Fecha.GetSysDate);

  {edCVE_USUARIO_ALTA.Enabled := False;
  edFH_REGISTRO.Enabled := False;
  edCVE_USUARIO_ALTA.Enabled := False;
  edFH_REGISTRO.Enabled := False;      }
end;

//procedure TWDvCanalR24.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWDvCanalR24.edCVE_CANALKeyPress(Sender: TObject; var Key: Char);
begin
  if NOT((pos(Key,'0123456789') <> 0) OR (Key = #8)) then
   abort;
end;

procedure TWDvCanalR24.wwDataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  if Objeto.State = 0 then
  if Field = nil then
  begin
      Objeto.FindKey([Objeto.vQuery.FieldByName('CVE_CANAL').AsString]);
  end;
end;

(* *****************************************************************************
***************************************************************************** *)
procedure TDvCanaR24.RefrescaQuery;
begin
  vQuery.DisableControls;
  vQuery.Close;
  vQuery.SQL.Text := sql_grid;
  vQuery.Open;

  If Not vQuery.IsEmpty then
  begin
      vQuery.FieldByName('CVE_CANAL').DisplayLabel         := 'Clave de Canal';
      vQuery.FieldByName('DESC_CANAL').DisplayLabel        := 'Descripción Canal';
      vQuery.FieldByName('DESC_L_CANAL').DisplayLabel      := 'Descripción Larga Canal ';
      vQuery.FieldByName('SIT_CANAL').DisplayLabel         := 'Situación Canal';
      vQuery.FieldByName('CVE_USUARIO_ALTA').DisplayLabel  := 'Usuario Alta';
      vQuery.FieldByName('FH_REGISTRO').DisplayLabel       := 'Fecha Registro';
      vQuery.FieldByName('CVE_USUARIO_MODIF').DisplayLabel := 'Usuario Modifica';
      vQuery.FieldByName('FH_MODIFICA').DisplayLabel       := 'Fecha Modificación';
  end;
  vQuery.EnableControls;

end;

procedure TWDvCanalR24.InterForma1DespuesAceptar(Sender: TObject);
begin
  Objeto.RefrescaQuery;
end;

procedure TWDvCanalR24.InterForma1DespuesEliminar(Sender: TObject);
begin
  Objeto.RefrescaQuery;
end;

end.
