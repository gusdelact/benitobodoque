// Sistema         : Clase de CR_GPO_CHEQ
// Fecha de Inicio : 13/02/2004
// Función forma   : Clase de CR_GPO_CHEQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrGpCheq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrGpCheq= class; 

  TWCrGpCheq=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GPO_CHEQ : TLabel; 
    edCVE_GPO_CHEQ : TEdit;
    lbDESC_GPO_CHEQ : TLabel; 
    edDESC_GPO_CHEQ : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrGpCheq;
end; 
 TCrGpCheq= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_GPO_CHEQ             : TInterCampo;
        DESC_GPO_CHEQ            : TInterCampo;
        ParamCre                 : TParamCre;
                
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrGpCheq.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_GPO_CHEQ :=CreaCampo('CVE_GPO_CHEQ',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_CHEQ.Caption:='Clave de Grupo Cheq';
      DESC_GPO_CHEQ :=CreaCampo('DESC_GPO_CHEQ',ftString,tsNinguno,tsNinguno,True);
                DESC_GPO_CHEQ.Caption:='Descripción Grupo Cheq';
      FKeyFields.Add('CVE_GPO_CHEQ');

      TableName := 'CR_GPO_CHEQ'; 
      UseQuery := True; 
      HelpFile := 'IntCrGpCheq.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGpCheq.Destroy;
begin inherited;
end;


function TCrGpCheq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGpCheq;
begin
   W:=TWCrGpCheq.Create(Self);
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


Function TCrGpCheq.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrGpChe.it','S');
      Try if Active then begin T.Param(0,CVE_GPO_CHEQ.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_GPO_CHEQ********************)
(*                                                                              *)
(*  FORMA DE CR_GPO_CHEQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GPO_CHEQ********************)

procedure TWCrGpCheq.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_GPO_CHEQ.Control := edCVE_GPO_CHEQ;
   Objeto.DESC_GPO_CHEQ.Control := edDESC_GPO_CHEQ;
end;

procedure TWCrGpCheq.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GPO_CHEQ.Control:=nil;
      Objeto.DESC_GPO_CHEQ.Control:=nil;
   //Objeto
end;

procedure TWCrGpCheq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGpCheq.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_GPO_CHEQ.CanFocus Then edCVE_GPO_CHEQ.SetFocus;
end;

procedure TWCrGpCheq.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_GPO_CHEQ.CanFocus Then edDESC_GPO_CHEQ.SetFocus;
end;

procedure TWCrGpCheq.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);

  function TieneRegistros(pCVE_GPO_CHEQ : String) : Integer;
  var vlSQL : String;
      vlTotal : Integer;
  begin
     vlSQL := 'SELECT COUNT(*) AS TOTAL FROM CR_AGRUPA_CHEQ WHERE CVE_GPO_CHEQ = '#39+pCVE_GPO_CHEQ+#39;
     GetSQLInt(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TOTAL', vlTotal, False);
     Result := vlTotal;
  end;

  function EliminaRegistros(pCVE_GPO_CHEQ : String) : Boolean;
  var vlSQL : String;
      bOk : Boolean; 
  Begin
     vlsql := 'DELETE CR_AGRUPA_CHEQ WHERE CVE_GPO_CHEQ = '#39+pCVE_GPO_CHEQ+#39;
     bOk := RunSQL(vlSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
     If Not bOk Then ShowMessage(' Error al eliminar los registros.'#13#10+
                                 ' Intentélo de nuevo o favor de comunicarse a Sistemas.');
     Result := bOk;
  end;

var nCount : Integer;
begin
 With Objeto Do
  Begin
  nCount := TieneRegistros(CVE_GPO_CHEQ.AsString);
  If (nCount > 0) Then
   Case MessageDlg(' El grupo que está a punto de borrar tiene '+IntToStr(nCount)+' contrato(s) vinculado(s).'#13#10+
                   ' los cuales también serán eliminados. ¿Desea continuar?', mtConfirmation,[mbYes, mbNo], 0) Of
    mrYes : Realizado := EliminaRegistros(CVE_GPO_CHEQ.AsString);
    mrNo  : Begin ShowMessage('Operación cancelada por el usuario.'); Realizado := False; End;
   End;
  End;
end;

end.
