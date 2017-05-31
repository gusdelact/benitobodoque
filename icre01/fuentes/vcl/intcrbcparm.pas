// Sistema         : Clase de BC_PARAM_BURO
// Fecha de Inicio : 03/12/2012
// Función forma   : Clase de BC_PARAM_BURO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Comentarios     : Para administrar parametros de calculos para BNC. 
Unit IntCrBCParm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, IntParamCre, ComCtrls, IntDtPk, IntLinkit, IntEmpre;

Type
 tCrBCParm= class; 

  TWCrBCParm=Class(TForm)
    InterForma1             : TInterForma;
    edCVE_PARAMETRO: TEdit;
    Label1: TLabel;
    edVALOR_PARAMETRO: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESCRIPCION: TEdit;
    Label25: TLabel;
    edID_EMPRESA: TEdit;
    edNOM_EMPRESA: TEdit;
    ilEMPRESA: TInterLinkit;
    btEMPRESA: TBitBtn;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_PARAMETROExit(Sender: TObject);
    procedure edVALOR_PARAMETROExit(Sender: TObject);
    procedure edDESCRIPCIONExit(Sender: TObject);
    procedure btEMPRESAClick(Sender: TObject);
    procedure ilEMPRESACapture(Sender: TObject; var Show: Boolean);
    procedure ilEMPRESAEjecuta(Sender: TObject);
    procedure btEMPRESAExit(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations }
    Objeto : tCrBCParm;
end;
 tCrBCParm= class(TInterFrame)
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        ID_EMPRESA        :TInterCampo ;
        CVE_PARAMETRO     :TInterCampo ;
        VALOR_PARAMETRO   :TInterCampo ;
        DESCRIPCION       :TInterCampo ;

        Empresa           :TEmpresa;
        ParamCre          :TParamCre ;

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


constructor tCrBCParm.Create( AOwner : TComponent ); 
begin Inherited;

      ID_EMPRESA:=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='Clave de empresa';
      CVE_PARAMETRO:=CreaCampo('CVE_PARAMETRO', ftString, tsNinguno, tsNinguno, True) ;
                CVE_PARAMETRO.Caption:= 'Clave de parametro';
      VALOR_PARAMETRO:=CreaCampo('VALOR_PARAMETRO',ftString,tsNinguno,tsNinguno,True);
                VALOR_PARAMETRO.Caption:='Valor del parametro';
      DESCRIPCION:=CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
                DESCRIPCION.Caption:='Descripcion';

      FKeyFields.Add('ID_EMPRESA');
      FKeyFields.Add('CVE_PARAMETRO');

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      {$WARNINGS ON}      
      Empresa.MasterSource:=Self;
      Empresa.FieldByName('ID_EMPRESA').MasterField:='ID_EMPRESA';

      TableName := 'BC_PARAM_BURO';
      UseQuery := True;
      HelpFile := 'ICrCoCtDt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor tCrBCParm.Destroy;
begin
    if Empresa <> nil then
       Empresa.Free;
     inherited;
end;


function tCrBCParm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBCParm;
begin
   W:=TWCrBCParm.Create(Self);
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

Function tCrBCParm.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrBCParm.it','S,S');
      Try
       if Active then
          BEGIN
          T.Param(0,ID_EMPRESA.AsString);
          T.Param(1,CVE_PARAMETRO.AsString);
          END;
       if T.Execute then
          InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function tCrBCParm.Reporte:Boolean;
begin //Execute_Reporte();
end;


(**********************************************FORMA CrBCParm********************)
(*                                                                              *)
(*  FORMA DE CrBCParm                                                           *)
(*                                                                              *)
(**********************************************FORMA CrBCParm********************)

procedure TWCrBCParm.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Interforma1.MsgPanel := MsgPanel;

    Objeto.ID_EMPRESA.Control     := edID_EMPRESA;
    Objeto.CVE_PARAMETRO.Control  := edCVE_PARAMETRO;
    Objeto.VALOR_PARAMETRO.Control:= edVALOR_PARAMETRO;
    Objeto.DESCRIPCION.Control    := edDESCRIPCION;

    Objeto.Empresa.ID_Empresa.Control          := edID_EMPRESA;
    Objeto.Empresa.PersonaMoral.Nombre.Control := edNOM_EMPRESA;
    Objeto.Empresa.GetParams(Objeto);
end;

procedure TWCrBCParm.FormDestroy(Sender: TObject);
begin
//Objeto
    Objeto.ID_EMPRESA.Control     := nil;
    Objeto.CVE_PARAMETRO.Control  := nil;
    Objeto.VALOR_PARAMETRO.Control:= nil;
    Objeto.DESCRIPCION.Control    := nil;

    Interforma1.MsgPanel := Nil;

    Objeto.Empresa.ID_Empresa.Control := nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := nil;
end;

procedure TWCrBCParm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrBCParm.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.ID_EMPRESA.AsInteger:=  Objeto.Apli.IdEmpresa;
   edNOM_EMPRESA.Text:= objeto.ParamCre.EMPRESA.AsString;
   edID_EMPRESA.SetFocus;
end;

procedure TWCrBCParm.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrBCParm.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;

procedure TWCrBCParm.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
           //DefinePredeterminado;
           Realizado := True;
      end
      else
           Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else
           Realizado := False;
   end

end;

procedure TWCrBCParm.edCVE_PARAMETROExit(Sender: TObject);
var   VLSalida  :  Boolean;
      VLMsg, sSQL :  String;
      qy : TQuery;
begin
   If Objeto.Modo=moAppend Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.ID_EMPRESA.GetFromControl;
      Objeto.CVE_PARAMETRO.GetFromControl;
      If Objeto.CVE_PARAMETRO.AsString = '' Then Begin
         VlSalida := False;
         VLMsg := 'Indique la clave.';
      End
      Else Begin
            sSQL:= 'SELECT CVE_PARAMETRO FROM BC_PARAM_BURO WHERE ID_EMPRESA = '+ Objeto.ID_EMPRESA.AsString+' '+
                   'AND CVE_PARAMETRO = '+ SQLStr(Objeto.CVE_PARAMETRO.AsString)+'  ';
            qy:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qy <> Nil Then Begin
               If qy.RecordCount > 0 Then Begin
                  VlSalida   := False;
                  VLMsg := 'La clave '+Objeto.CVE_PARAMETRO.AsString+' YA existe para esta empresa. ';
               End;
               qy.Free;
            End;
      End;
      InterForma1.ValidaExit(edCVE_PARAMETRO,vlSalida,vlMsg,True);
   end ;
end;

procedure TWCrBCParm.edVALOR_PARAMETROExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edVALOR_PARAMETRO,True,'',True);
end;

procedure TWCrBCParm.edDESCRIPCIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESCRIPCION,True,'',True);
end;

procedure TWCrBCParm.btEMPRESAClick(Sender: TObject);
begin
   With Objeto Do
      Begin
      Empresa.ShowAll := True;
      if Empresa.Busca then
         InterForma1.NextTab(edID_EMPRESA);
     End;
end;

procedure TWCrBCParm.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin Show := True;
end;

procedure TWCrBCParm.ilEMPRESAEjecuta(Sender: TObject);
begin
    if  Objeto.Empresa.FindKey([ilEmpresa.Buffer]) then
    begin
          Objeto.ID_EMPRESA.AsInteger := Objeto.Empresa.ID_Empresa.AsInteger;
          edNOM_EMPRESA.Text:= Objeto.Empresa.PersonaMoral.Nombre.AsString;
         InterForma1.NextTab(edID_EMPRESA);
    end;
end;

procedure TWCrBCParm.btEMPRESAExit(Sender: TObject);
var     VLBandera : Boolean;
        vlMsg     : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      vlMsg := '';
      Objeto.ID_EMPRESA.GetFromControl;
      If Objeto.ID_EMPRESA.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la Empresa';
         VLBandera := False;
      end;
      InterForma1.ValidaExit(edID_EMPRESA,VLBandera,vlMsg,True);
   End;
end;

end.
