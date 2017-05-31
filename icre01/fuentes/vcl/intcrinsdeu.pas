// Sistema         : Clase de CR_INSCR_DEUD
// Fecha de Inicio : 15/06/2005
// Función forma   : Clase de CR_INSCR_DEUD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrInsDeu;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntGenCre;

Type
 TCrInsDeu= class; 

  TWCrInscrDeud=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_TIP_INSCR_D : TLabel; 
    edCVE_TIP_INSCR_D : TEdit;
    lbDESCRIPCION : TLabel; 
    edDESCRIPCION : TEdit;
    MsgPanel: TPanel;
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
    procedure edCVE_TIP_INSCR_DExit(Sender: TObject);
    procedure edDESCRIPCIONExit(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TCrInsDeu;
end; 
 TCrInsDeu= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_TIP_INSCR_D          : TInterCampo;
        DESCRIPCION              : TInterCampo;
        ParamCre                 : TParamCre;

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


constructor TCrInsDeu.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIP_INSCR_D :=CreaCampo('CVE_TIP_INSCR_D',ftString,tsNinguno,tsNinguno,True);
                CVE_TIP_INSCR_D.Caption:='Clave de Tipo de Inscripción';
      DESCRIPCION :=CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
                DESCRIPCION.Caption:='Descripción';
      FKeyFields.Add('CVE_TIP_INSCR_D');

      TableName := 'CR_INSCR_DEUD';
      UseQuery := True; 
      HelpFile := 'IntCrInsDeu.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrInsDeu.Destroy;
begin inherited;
end;


function TCrInsDeu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrInscrDeud;
begin
   W:=TWCrInscrDeud.Create(Self);
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


Function TCrInsDeu.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrInDe.it','S');
      Try if Active then begin T.Param(0,CVE_TIP_INSCR_D.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrInsDeu.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_INSCR_DEUD********************)
(*                                                                              *)
(*  FORMA DE CR_INSCR_DEUD                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_INSCR_DEUD********************)

procedure TWCrInscrDeud.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TIP_INSCR_D.Control:=edCVE_TIP_INSCR_D;
      Objeto.DESCRIPCION.Control:=edDESCRIPCION;
      InterForma1.MsgPanel := MsgPanel;
End;

procedure TWCrInscrDeud.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIP_INSCR_D.Control:=nil;
      Objeto.DESCRIPCION.Control:=nil;
   //Objeto
end;

procedure TWCrInscrDeud.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrInscrDeud.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_TIP_INSCR_D.SetFocus;
end;

procedure TWCrInscrDeud.InterForma1DespuesModificar(Sender: TObject);
begin edDESCRIPCION.SetFocus;
end;

//procedure TWCrInscrDeud.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrInscrDeud.edCVE_TIP_INSCR_DExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL : String; qyQuery :TQuery;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlSalida := True;
      vlMsg := CNULL;
      Objeto.CVE_TIP_INSCR_D.GetFromControl;
      If Objeto.CVE_TIP_INSCR_D.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg      :='Debe proporcionar la Clave de Tipo de Inscripción';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQL:='SELECT * FROM CR_INSCR_DEUD WHERE CVE_TIP_INSCR_D ='+
                   Objeto.CVE_TIP_INSCR_D.AsSQL;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               vlSalida   := False;
               vlMsg      :='La Clave ya existe';
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_TIP_INSCR_D,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrInscrDeud.edDESCRIPCIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESCRIPCION,True,'',True);
end;

end.
