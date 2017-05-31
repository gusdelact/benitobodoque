// Sistema         : Clase de crCoBita
// Fecha de Inicio : 18/03/2010
// Función forma   : Clase de crCoBita
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrcobita;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,  IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl;

Type
 TCrcobita= class; 

  TWCrcobita=Class(TForm)
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
    sgcDATOS: TSGCtrl;
    Label6: TLabel;
    edF_OPER_INIC: TEdit;
    dtF_OPER_INIC: TInterDateTimePicker;
    Label5: TLabel;
    edF_OPER_FIN: TEdit;
    dtF_OPER_FIN: TInterDateTimePicker;
    btBUSCA: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btBUSCAClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TCrcobita;
end;
 TCrcobita= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public

        ParamCre                 : TParamCre;

        { Public declarations }
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


constructor TCrcobita.Create( AOwner : TComponent ); 
begin Inherited; 


      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrcobita.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrcobita.Destroy;
begin inherited;
end;


function TCrcobita.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcobita;
begin
   W:=TWCrcobita.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrcobita.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrcobit.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrcobita.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA crCoBita********************)
(*                                                                              *)
(*  FORMA DE crCoBita                                                            *)
(*                                                                              *)
(***********************************************FORMA crCoBita********************)

procedure TWCrcobita.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     dtF_OPER_INIC.Date := Objeto.Apli.DameFechaEmpresa;
     dtF_OPER_FIN.Date := Objeto.Apli.DameFechaEmpresa;

     edF_OPER_INIC.text := FormatDateTime('dd/mm/yyyy',dtF_OPER_INIC.DateTime);
     edF_OPER_FIN.text  := FormatDateTime('dd/mm/yyyy',dtF_OPER_FIN.DateTime);

end;

procedure TWCrcobita.FormDestroy(Sender: TObject);
begin
     //Objeto
end;

procedure TWCrcobita.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcobita.btBUSCAClick(Sender: TObject);
Var vlQry : TQuery;
    CadenaSql : String;
begin
     CadenaSql := ' SELECT ID_CREDITO, F_EVENTO, F_PROX_EVENTO, TIPO_EVENTO, ID_DESPACHO, NOMBRE_SPVISOR, ' +
                  ' SUBSTR(TXT_COMENTARIO, 1,100) AS TXT_COMENTARIO, B_RES_DICTAMEN, F_LIM_ACLARA, ID_PROMOTOR, TIPO_SUPERVISOR ' +
                  ' FROM  ADMIPROD.CR_AM_BITACORA ' +
                  ' WHERE 1 = 1 ' +
                  ' AND   TRUNC(F_EVENTO) >= ' + SQLFecha(dtF_OPER_INIC.Date) +
                  ' AND   TRUNC(F_EVENTO) <= ' + SQLFecha(dtF_OPER_FIN.Date);
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
            sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

end.
