// Sistema         : Clase de CR_FE_USUARIO_INET
// Fecha de Inicio : 19/09/2007
// Función forma   : Clase de CR_FE_USUARIO_INET
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrFeUsIn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrFeUsIn= class; 

  TWCrFeUsuarioInet=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_USUARIO_INET : TLabel; 
    edCVE_USUARIO_INET : TEdit;
    lbCVE_USUARIO_CORP : TLabel; 
    edCVE_USUARIO_CORP : TEdit;
    lbSIT_USUARIO : TLabel;
    lbF_ALTA : TLabel; 
    edF_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel; 
    edCVE_USU_ALTA : TEdit;
    lbF_MODIFICA : TLabel; 
    edF_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel; 
    edCVE_USU_MODIFICA : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSIT_USUARIO: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrFeUsIn;
    Function SugiereUSRINET(PPPersona: String): String;

end;
 TCrFeUsIn= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_USUARIO_INET         : TInterCampo;
        CVE_USUARIO_CORP         : TInterCampo;
        SIT_USUARIO              : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        //Clases Adicionales
        ParamCre                 : TParamCre;
        //Variable Adicionales
        VLUsuarioCorpo: String;
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


constructor TCrFeUsIn.Create( AOwner : TComponent ); 
begin Inherited;
      CVE_USUARIO_INET :=CreaCampo('CVE_USUARIO_INET',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_INET.Caption:='Clave de Usuario Inet';
      CVE_USUARIO_CORP :=CreaCampo('CVE_USUARIO_CORP',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_CORP.Caption:='Clave de Usuario Corp';
      SIT_USUARIO :=CreaCampo('SIT_USUARIO',ftString,tsNinguno,tsNinguno,True);

         With SIT_USUARIO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
          end;
                SIT_USUARIO.Caption:='Situación USUARIO';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('CVE_USUARIO_INET');
      FKeyFields.Add('CVE_USUARIO_CORP');

      TableName := 'CR_FE_USUARIO_INET'; 
      UseQuery := True; 
      HelpFile := 'IntCrFeUsIn.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFeUsIn.Destroy;
begin inherited;
end;


function TCrFeUsIn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFeUsuarioInet;
begin
   W:=TWCrFeUsuarioInet.Create(Self);
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


Function TCrFeUsIn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFeUI.it','S,S');
      Try if Active then begin T.Param(0,CVE_USUARIO_INET.AsString);
                               T.Param(1,CVE_USUARIO_CORP.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrFeUsIn.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_FE_USUARIO_INET********************)
(*                                                                              *)
(*  FORMA DE CR_FE_USUARIO_INET                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FE_USUARIO_INET********************)

Function TWCrFeUsuarioInet.SugiereUSRINET(PPPersona: String): String;
var Q        : TQuery;
    VLSalida : String;
begin
     VLSalida := '';
     Q :=  GetSQLQuery(' select CVE_USUARIO_GEN from net_usuario where id_persona = ' + PPPersona
                        ,Objeto.DataBaseName,Objeto.SessionName,True);
     try
        if Q <> nil then
        begin
             VLSalida := Q.FieldByName('CVE_USUARIO_GEN').AsString;
        end
        else
            ShowMessage('No Existe un usuario de Internet ligado al proveedor. ID Pesona: ' + PPPersona);
        //end if
     finally
         if Q <> nil then Q.free;
     end;
     SugiereUSRINET := VLSalida;
end;


procedure TWCrFeUsuarioInet.FormShow(Sender: TObject);
var Q   : TQuery;
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


      Objeto.CVE_USUARIO_INET.Control:=edCVE_USUARIO_INET;
      Objeto.CVE_USUARIO_CORP.Control:=edCVE_USUARIO_CORP;
      Objeto.SIT_USUARIO.Control:=rgSIT_USUARIO;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      if trim('<'+Objeto.VLUsuarioCorpo+'>') <> trim('<>') then
      begin
            Objeto.FilterString := '(CVE_USUARIO_CORP =  ' + #39 + Objeto.VLUsuarioCorpo + #39 + ')';
            Objeto.BuscaWhereString := Objeto.FilterString;
            Q :=  GetSQLQuery(' SELECT CFUI.CVE_USUARIO_INET ' +
                              ' FROM   CR_FE_USUARIO_INET CFUI ' +
                              ' WHERE  CFUI.CVE_USUARIO_CORP =  ' + #39 + Objeto.VLUsuarioCorpo + #39
                              ,Objeto.DataBaseName,Objeto.SessionName,True);
            try
               if Q <> nil then
               begin
                    Objeto.FindKey([Q.FieldByName('CVE_USUARIO_INET').AsString,Objeto.VLUsuarioCorpo])
               end;
            finally
                if Q <> nil then Q.free;
            end;
      end;
end;

procedure TWCrFeUsuarioInet.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_USUARIO_INET.Control:=nil;
      Objeto.CVE_USUARIO_CORP.Control:=nil;
      Objeto.SIT_USUARIO.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
   //Objeto
end;

procedure TWCrFeUsuarioInet.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFeUsuarioInet.InterForma1DespuesNuevo(Sender: TObject);
begin
     edCVE_USUARIO_INET.SetFocus;
     Objeto.CVE_USUARIO_CORP.AsString := Objeto.VLUsuarioCorpo;
     Objeto.CVE_USUARIO_CORP.DrawControl;
     Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
     Objeto.CVE_USU_ALTA.DrawControl;
     Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
     Objeto.F_ALTA.DrawControl;
     rgSIT_USUARIO.ItemIndex := 0;
     Objeto.SIT_USUARIO.GetFromControl;
     Objeto.CVE_USUARIO_INET.AsString := SugiereUSRINET(trim(copy(Objeto.VLUsuarioCorpo,2,10)));
     Objeto.CVE_USUARIO_INET.DrawControl;
end;

procedure TWCrFeUsuarioInet.InterForma1DespuesModificar(Sender: TObject);
begin
     rgSIT_USUARIO.SetFocus;
     Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
     Objeto.CVE_USU_MODIFICA.DrawControl;
     Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
     Objeto.CVE_USU_MODIFICA.DrawControl;
end;

//procedure TWCrFeUsuarioInet.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


end.
