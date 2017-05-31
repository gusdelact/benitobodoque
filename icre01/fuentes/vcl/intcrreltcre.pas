// Sistema         : Clase de CrRelTCre
// Fecha de Inicio : 15/07/2013
// Función forma   : Clase de CrRelTCre
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrreltcre;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamcre, InterEdit
;

Type
 TCrreltcre= class; 

  TWCrreltcre=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edCLAVETIPO: TInterEdit;
    edDESC_CLAVE: TInterEdit;
    rgSITUACION: TRadioGroup;
    lbF_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_ALTA: TInterEdit;
    edF_MODIFICA: TInterEdit;
    edCVE_USU_ALTA: TInterEdit;
    edCVE_USU_MODIFICA: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrreltcre;
end; 
 TCrreltcre= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ParamCre           : TParamCre;

        CVE_TIPO_CREDITO   : TInterCampo;
        DESC_TIPO_CRED     : TInterCampo;
        SIT_TIPO_CRED      : TInterCampo;
        CVE_USU_ALTA       : TInterCampo;
        F_ALTA             : TInterCampo;
        CVE_USU_MODIFICA   : TInterCampo;
        F_MODIFICA         : TInterCampo;

        
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


constructor TCrreltcre.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIPO_CREDITO := CreaCampo('CVE_TIPO_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
                          CVE_TIPO_CREDITO.Caption := 'Clave Tipo de Crédito';

      DESC_TIPO_CRED := CreaCampo('DESC_TIPO_CRED',ftString,tsNinguno,tsNinguno,True);
                          DESC_TIPO_CRED.Caption := 'Desc. Tipo Crédito ';


      SIT_TIPO_CRED := CreaCampo('SIT_TIPO_CRED',ftString,tsNinguno,tsNinguno,True);
                          SIT_TIPO_CRED.Caption := 'Situación';
       With SIT_TIPO_CRED do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add('AC');
            ComboLista.Add('1'); ComboDatos.Add('CA');
      end;


      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_ALTA.Caption := 'Usuario Modifica ';


      F_ALTA := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_ALTA.Caption := 'F. Alta';


      CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_MODIFICA.Caption := 'Usuario Modifica';


      F_MODIFICA := CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_MODIFICA.Caption := 'F. Modifica';


      FKeyFields.Add('CVE_TIPO_CREDITO');
      TableName := 'CR_TIPO_CREDITO';
      StpName  := ' ';
      UseQuery := True;
      HelpFile := 'IntCrreltcre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrreltcre.Destroy;
begin inherited;
end;


function TCrreltcre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrreltcre;
begin
   W:=TWCrreltcre.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrreltcre.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRTIPCRED.IT','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrreltcre.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrRelTCre********************)
(*                                                                              *)
(*  FORMA DE CrRelTCre                                                            *)
(*                                                                              *)
(***********************************************FORMA CrRelTCre********************)

procedure TWCrreltcre.FormShow(Sender: TObject);
begin
    Objeto.CVE_TIPO_CREDITO.Control  :=  edCLAVETIPO;
    Objeto.DESC_TIPO_CRED.Control  := edDESC_CLAVE;
    Objeto.SIT_TIPO_CRED.Control  := rgSITUACION;
    Objeto.CVE_USU_ALTA.Control  := edCVE_USU_ALTA;
    Objeto.F_ALTA.Control  := edF_ALTA;
    Objeto.CVE_USU_MODIFICA.Control  := edCVE_USU_MODIFICA;
    Objeto.F_MODIFICA.Control  := edF_MODIFICA;
end;

procedure TWCrreltcre.FormDestroy(Sender: TObject);
begin
Objeto.CVE_TIPO_CREDITO.Control  := nil;
    Objeto.DESC_TIPO_CRED.Control  := nil;
    Objeto.SIT_TIPO_CRED.Control  := nil;
    Objeto.CVE_USU_ALTA.Control  := nil;
    Objeto.F_ALTA.Control  := nil;
    Objeto.CVE_USU_MODIFICA.Control  := nil;
    Objeto.F_MODIFICA.Control  := nil;
end;

procedure TWCrreltcre.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrreltcre.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql,vlsql1  : String;
      Query1,Query2 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_ALTA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      rgSITUACION.ItemIndex := 0;
      edDESC_CLAVE.SetFocus;

      vlsql1 := 'select max(cve_tipo_credito) cve_tipo_cred from cr_tipo_credito';
      Query2 := GetSQLQuery(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query2.FieldByName('cve_tipo_cred').AsString = ''  then
      edCLAVETIPO.text := IntToStr(1)
      else
      edCLAVETIPO.text := IntToStr(StrToinT(Query2.FieldByName('cve_tipo_cred').AsString) + 1);

end;

procedure TWCrreltcre.InterForma1DespuesModificar(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

//procedure TWCrreltcre.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrreltcre.InterForma1Buscar(Sender: TObject);
begin
    Objeto.Showall := True;
    Objeto.Busca
end;

procedure TWCrreltcre.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
end;

end.
