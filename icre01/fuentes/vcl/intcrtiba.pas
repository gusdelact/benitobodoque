// Sistema         : Clase de CrTiBa
// Fecha de Inicio : 27/07/2009
// Función forma   : Clase de CrTiBa
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrtiba;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type                                                                       
 TCrtiba= class; 

  TWCrtiba=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_PER_JUR_REG: TLabel;
    edCVE_TIPO_BAJA: TEdit;
    btCVE_TIPO_BAJA: TBitBtn;
    edDESC_TIPO_BAJA: TEdit;
    btAUTORIZA: TBitBtn;
    btCANCELA: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_TIPO_BAJAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations }
    Objeto : TCrtiba;
end; 
 TCrtiba= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        VLIDCredito : Integer;
        VLTipoBaja  : String;

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


constructor TCrtiba.Create( AOwner : TComponent ); 
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrtiba.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrtiba.Destroy;
begin inherited;
end;


function TCrtiba.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrtiba;
begin
   W:=TWCrtiba.Create(Self);
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


Function TCrtiba.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrtiba.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrtiba.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrTiBa********************)
(*                                                                              *)
(*  FORMA DE CrTiBa                                                            *)
(*                                                                              *)
(***********************************************FORMA CrTiBa********************)

procedure TWCrtiba.FormShow(Sender: TObject);
Var qyQuery : TQuery;
    sSQL    : String;
begin
     if Length(Objeto.VLTipoBaja) > 0 then
     begin
          edCVE_TIPO_BAJA.Text := Objeto.VLTipoBaja;
          with Objeto do
          begin
              sSQL := 'SELECT DESC_CLAVE FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_TIPO_LIQUIDA'' AND CVE_CLAVE = ' + SQLStr(edCVE_TIPO_BAJA.Text) ;
              qyQuery:= GetSQLQuery(sSQL, DataBaseName, SessionName, False);
              try
                 If qyQuery <> Nil Then
                 Begin
                      edDESC_TIPO_BAJA.Text := qyQuery.FieldByName('DESC_CLAVE').AsString;
                 end;
              finally
                 qyQuery.Free;
              end;
          end;
     end;
end;

procedure TWCrtiba.FormDestroy(Sender: TObject);
begin
//Objeto
end;

procedure TWCrtiba.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrtiba.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrtiba.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrtiba.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrtiba.btCVE_TIPO_BAJAClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    begin
      T := CreaBuscador('ICrCoCD.it','I');
      T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_TIPO_LIQUIDA''' ;
      T.ShowAll := True;
      Try
        If T.Execute Then
           Begin
             edCVE_TIPO_BAJA.Text := T.DameCampo(0);
             edDESC_TIPO_BAJA.Text := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;
    end;
end;

procedure TWCrtiba.btCANCELAClick(Sender: TObject);
begin
     InterForma1.Salir;
end;

procedure TWCrtiba.btAUTORIZAClick(Sender: TObject);
Var  vlsql : String;
begin

     vlsql := ' UPDATE CR_CREDITO ' +
              ' SET CVE_TIPO_BAJA = ' + SQLStr(edCVE_TIPO_BAJA.Text) +
              ' WHERE ID_CREDITO  = '+ IntToStr(Objeto.VLIDCredito);
     RunSQL(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);

     InterForma1.Salir;
end;

end.
