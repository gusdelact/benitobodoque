{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de SECU_GPO_ACCESO
// Fecha de Inicio : 24/08/1998
// Función forma   : Clase de SECU_GPO_ACCESO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alejandro Villalobos Bahena
// Comentarios     :
Unit IntSecGpAcc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntSecuAplic,IntSecuPerfi,
IntLinkit;

Type
 TSecGpAcc= class;

  TWSecuGpAcceso=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    lbID_GPO_ACCESO : TLabel;
    edID_GPO_ACCESO : TEdit;
    chB_BLOQUEADO : TCheckBox;
    sbIndicador: TSpeedButton;
    lkPerfil: TInterLinkit;
    ednomPerfil: TEdit;
    edNomAplicacion: TEdit;
    bbReport: TBitBtn;
    sbAplicacion: TSpeedButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbIndicadorClick(Sender: TObject);
    procedure lkPerfilEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure lkPerfilCapture(Sender: TObject; var Show: Boolean);
    procedure bbReportClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure sbAplicacionClick(Sender: TObject);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecGpAcc;
end;
 TSecGpAcc= class(TInterFrame)
      private
      	FSecuApli: TInterFrame;
      protected
      public
        { Public declarations }
        CVE_APLICACION           : TInterCampo;
        ID_GPO_ACCESO            : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        NOM_GPO_ACCESO           : TInterCampo;
        TX_DESC_GPO_AC           : TInterCampo;
        Aplicacion               : TSecuAplic;
        Perfil                   : TSecuPerfi;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Procedure   PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean); override;
        procedure   Preview(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
        procedure   Imprime(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
        Property SecuApli: TInterFrame Read FSecuApli Write FSecuApli;

      published
      end;



implementation

//Uses RepMon;
uses RepSecGpAcc, IntSelect;
{$R *.DFM}


constructor TSecGpAcc.Create( AOwner : TComponent );
begin Inherited;
      CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
        CVE_APLICACION .Size:=6;
                CVE_APLICACION.Caption:='Clave de Aplicacion';
      ID_GPO_ACCESO :=CreaCampo('ID_GPO_ACCESO',ftFloat,tsNinguno,tsNinguno,True);
                ID_GPO_ACCESO.Caption:='Número de Grupo Acceso';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEADO .Size:=1;
                B_BLOQUEADO.Caption:='Bloqueado';

      // SON INFORMACION NO UTILIZADA
      NOM_GPO_ACCESO :=CreaCampo('NOM_GPO_ACCESO',ftString,tsNinguno,tsNinguno,True);
                NOM_GPO_ACCESO.Caption:='Nombre Grupo Acceso';

      TX_DESC_GPO_AC :=CreaCampo('TX_DESC_GPO_AC',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_GPO_AC.Caption:='Descripción Grupo Acceso';
      // SON INFORMACION NO UTILIZADA

      FKeyFields.Add('CVE_APLICACION');
      FKeyFields.Add('ID_GPO_ACCESO');

      TableName := 'SECU_GPO_ACCESO';
      UseQuery := True;
      HelpFile := 'IntSecGpAcc.Hlp';
      ShowMenuReporte:=True;

      SecuApli:= nil; // InterFrame vacío

      Aplicacion:= TSecuAplic.Create(Self);
      Aplicacion.MasterSource:=Self;
      Aplicacion.CVE_APLICACION.MasterField:= 'CVE_APLICACION';

      //Solo es necesaria la llave
      Perfil:=TSecuPerfi.Create(Self);
      Perfil.MasterSource:=Self;
      Perfil.ID_GPO_ACCESO.MasterField:='ID_GPO_ACCESO';
end;

Destructor TSecGpAcc.Destroy;
begin if Aplicacion <> nil then Aplicacion.Free; Aplicacion:=nil;
      if Perfil<> nil then Perfil.Free; Perfil:=nil;
inherited;
end;


function TSecGpAcc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuGpAcceso;
begin
   W:=TWSecuGpAcceso.Create(Self);
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


Function TSecGpAcc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      if SecuApli <> nil then
         begin BuscaWhereString:='SECU_GPO_ACCESO.CVE_APLICACION='+SecuApli.FieldByName('CVE_APLICACION').AsSql;
         end;
      T := CreaBuscador('ISeGpAc.it','S,F');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString);
                               T.Param(1,ID_GPO_ACCESO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

procedure TSecGpAcc.Preview(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
begin Execute_RepSecGpAcc(ePreview, eObjeto, eTodosLosRegistros);
end;

procedure TSecGpAcc.Imprime(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
begin Execute_RepSecGpAcc(ePreview, eObjeto, eTodosLosRegistros);
end;


function TSecGpAcc.Reporte:Boolean;
var SecuAplic: TSecuAplic;
begin SecuAplic:= TSecuAplic.Create(Self);
      SecuAplic.Apli:=Apli;
      SecuAplic.FindKey([SecuApli.FieldByName('CVE_APLICACION').AsString]);
      Try
         Seleccionar(SecuAplic,'Imprimir Perfiles Para Aplicación',SecuAplic.CVE_APLICACION,SecuAplic.NOM_APLICACION,nil,
                    'Clave','Nombre','',nil,Imprime,Preview);
      finally
        SecuAplic.Free;
      end;
end;

Procedure   TSecGpAcc.PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean);
begin
    Execute_RepSecGpAcc(Preview, Self, TodosLosRegistros);
end;

(***********************************************FORMA SECU_GPO_ACCESO********************)
(*                                                                              *)
(*  FORMA DE SECU_GPO_ACCESO                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_GPO_ACCESO********************)

procedure TWSecuGpAcceso.FormShow(Sender: TObject);
begin
	Objeto.ID_GPO_ACCESO.Control:=edID_GPO_ACCESO;
   Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
   Objeto.Perfil.NOM_GPO_ACCESO.Control:=ednomPerfil;
   Objeto.Perfil.MasterSourceEditControl:=sbIndicador;
   Objeto.Aplicacion.CVE_APLICACION.Control := edCVE_APLICACION;
   Objeto.Aplicacion.NOM_APLICACION.Control := edNomAplicacion;

   edID_GPO_ACCESO.PopupMenu:= Objeto.Perfil.PopMenu;
   ednomPerfil.PopupMenu:=Objeto.Perfil.PopMenu;

   if objeto.SecuApli<> nil Then Objeto.Aplicacion.FindKey([Objeto.SecuApli.FieldByName('CVE_APLICACION').asString]);
end;

procedure TWSecuGpAcceso.FormDestroy(Sender: TObject);
begin
	Objeto.ID_GPO_ACCESO.Control:=nil;
   Objeto.B_BLOQUEADO.Control:=nil;
   Objeto.Perfil.NOM_GPO_ACCESO.Control:=nil;
   Objeto.Perfil.MasterSourceEditControl:=nil;
   Objeto.Aplicacion.CVE_APLICACION.Control := nil;
   Objeto.Aplicacion.NOM_APLICACION.Control := nil;

   edID_GPO_ACCESO.PopupMenu:= nil;
   ednomPerfil.PopupMenu:=nil;
end;

procedure TWSecuGpAcceso.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecuGpAcceso.InterForma1DespuesNuevo(Sender: TObject);
begin  edID_GPO_ACCESO.SetFocus;
       if objeto.SecuApli<> nil then
       Begin
       	Objeto.Aplicacion.FindKey([Objeto.SecuApli.FieldByName('CVE_APLICACION').AsString]);
       end;
       // INFORMACION NO UTILIZADA
       Objeto.NOM_GPO_ACCESO.AsString:=' ';
       Objeto.TX_DESC_GPO_AC.AsString:=' ';
end;

procedure TWSecuGpAcceso.InterForma1DespuesModificar(Sender: TObject);
begin chB_BLOQUEADO.SetFocus;
end;

procedure TWSecuGpAcceso.sbIndicadorClick(Sender: TObject);
begin Objeto.Perfil.Busca;
end;

procedure TWSecuGpAcceso.lkPerfilEjecuta(Sender: TObject);
begin
	if InterForma1.CanEdit then
   begin
   	Objeto.Perfil.FindKey([lkPerfil.Buffer]);
   end
   else
   begin
   	if Objeto.SecuApli<> nil then
      Begin
      	If Not Objeto.FindKey([Objeto.SecuApli.FieldByName('CVE_APLICACION').AsString, lkPerfil.Buffer]) then
         	Objeto.Aplicacion.FindKey([Objeto.SecuApli.FieldByName('CVE_APLICACION').AsString]);
      end;
   end;
end;


procedure TWSecuGpAcceso.InterForma1DespuesShow(Sender: TObject);
begin
     if InterForma1.FormaTipo=ftGrid then
        edID_GPO_ACCESO.SetFocus;

end;


procedure TWSecuGpAcceso.lkPerfilCapture(Sender: TObject;
  var Show: Boolean);
begin       Show:=(not InterForma1.CanEdit) or (  (InterForma1.CanEdit) and (InterForma1.IsNewData) )
end;


procedure TWSecuGpAcceso.bbReportClick(Sender: TObject);
begin objeto.Reporte;
end;

procedure TWSecuGpAcceso.InterForma1DespuesCancelar(Sender: TObject);
begin
   if Objeto.SecuApli<> nil then Objeto.Aplicacion.FindKey([Objeto.SecuApli.FieldByName('CVE_APLICACION').AsString]);
end;

procedure TWSecuGpAcceso.InterForma1DespuesEliminar(Sender: TObject);
begin
   if Objeto.SecuApli<> nil then Objeto.Aplicacion.FindKey([Objeto.SecuApli.FieldByName('CVE_APLICACION').AsString]);
end;


procedure TWSecuGpAcceso.sbAplicacionClick(Sender: TObject);
begin	Objeto.Aplicacion.Busca;
end;

procedure TWSecuGpAcceso.InterForma1CanEdit(Sender: TObject;
  CanEdit: Boolean);
begin
	If (Objeto <> nil) and (CanEdit) and (InterForma1.IsNewData) then sbAplicacion.Enabled := (Objeto.SecuApli = nil);
end;

end.

