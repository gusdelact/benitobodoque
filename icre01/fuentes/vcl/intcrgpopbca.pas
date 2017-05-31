// Sistema         : Clase de CrGpoPBca
// Fecha de Inicio : 26/08/2013
// Función forma   : Clase de CrGpoPBca
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrgpopbca;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit
;

Type
 TCrgpopbca= class; 

  TWCrgpopbca=Class(TForm)
    Panel1: TPanel;
    lbCVE_GRUPO_ECO: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    lbF_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_ALTA: TInterEdit;
    edCVE_USU_MODIFICA: TInterEdit;
    edF_MODIFICA: TInterEdit;
    edCVE_USU_ALTA: TInterEdit;
    edCveGpoProd: TInterEdit;
    edDescCorta: TInterEdit;
    rgSITUACION: TRadioGroup;
    edDescLarga: TInterEdit;
    InterForma1: TInterForma;
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
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrgpopbca;
end; 
 TCrgpopbca= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        ParamCre                : TParamCre;

        CVE_GPO_PRODUCTO_BCA    : TInterCampo;
        DESC_C_PRODUCTO         : TInterCampo;
        DESC_L_PRODUCTO         : TInterCampo;
        SIT_GPO_PRODUCTO_BCA    : TInterCampo;
        CVE_USU_ALTA            : TInterCampo;
        F_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA        : TInterCampo;
        F_MODIFICA              : TInterCampo;
        VERSION_REGISTRO        : TInterCampo;


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


constructor TCrgpopbca.Create( AOwner : TComponent ); 
begin Inherited; 

      CVE_GPO_PRODUCTO_BCA := CreaCampo('CVE_GPO_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                          CVE_GPO_PRODUCTO_BCA.Caption := 'Cve. Gpo Prod Bca.';

      DESC_C_PRODUCTO := CreaCampo('DESC_C_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                          DESC_C_PRODUCTO.Caption := 'Descripción Corta';

      DESC_L_PRODUCTO := CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                          DESC_L_PRODUCTO.Caption := 'Descripción Larga';

      SIT_GPO_PRODUCTO_BCA := CreaCampo('SIT_GPO_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                          SIT_GPO_PRODUCTO_BCA.Caption := 'Situación';

       With SIT_GPO_PRODUCTO_BCA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('IN');
          end;                   

      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_ALTA.Caption := 'Clave Usu Alta';

      F_ALTA := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_ALTA.Caption := 'F. Alta';

      CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_MODIFICA.Caption := 'Clave Usu Modif';

      F_MODIFICA := CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_MODIFICA.Caption := 'F. Modifica';

      VERSION_REGISTRO := CreaCampo('VERSION_REGISTRO',ftString,tsNinguno,tsNinguno,False);
                          VERSION_REGISTRO.Caption := 'Versión Registro';


      FKeyFields.Add('CVE_GPO_PRODUCTO_BCA');
      TableName := 'CR_GPO_PRODUCTO_BCA';
      StpName  := ' ';
      UseQuery := True;
      HelpFile := 'IntCrgpopbca.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrgpopbca.Destroy;
begin inherited;
end;


function TCrgpopbca.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrgpopbca;
begin
   W:=TWCrgpopbca.Create(Self);
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


Function TCrgpopbca.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICRGPOPBCA.IT','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrgpopbca.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrGpoPBca********************)
(*                                                                              *)
(*  FORMA DE CrGpoPBca                                                            *)
(*                                                                              *)
(***********************************************FORMA CrGpoPBca********************)

procedure TWCrgpopbca.FormShow(Sender: TObject);
begin
        Objeto.CVE_GPO_PRODUCTO_BCA.Control := edCveGpoProd;
        Objeto.DESC_C_PRODUCTO.Control := edDescCorta;
        Objeto.DESC_L_PRODUCTO.Control := edDescLarga;
        Objeto.SIT_GPO_PRODUCTO_BCA.Control := rgSITUACION;
        Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
        Objeto.F_ALTA.Control := edF_ALTA;
        Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
        Objeto.F_MODIFICA.Control := edF_MODIFICA;

end;

procedure TWCrgpopbca.FormDestroy(Sender: TObject);
begin
        Objeto.CVE_GPO_PRODUCTO_BCA.Control := nil;
        Objeto.DESC_C_PRODUCTO.Control := nil;
        Objeto.DESC_L_PRODUCTO.Control := nil;
        Objeto.SIT_GPO_PRODUCTO_BCA.Control := nil;
        Objeto.CVE_USU_ALTA.Control := nil;
        Objeto.F_ALTA.Control := nil;
        Objeto.CVE_USU_MODIFICA.Control := nil;
        Objeto.F_MODIFICA.Control := nil;
end;

procedure TWCrgpopbca.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrgpopbca.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_ALTA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      rgSITUACION.ItemIndex := 0;
      edCveGpoProd.SetFocus;
end;

procedure TWCrgpopbca.InterForma1DespuesModificar(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

//procedure TWCrgpopbca.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrgpopbca.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrgpopbca.InterForma1Buscar(Sender: TObject);
begin
    Objeto.Showall := True;
    Objeto.Busca
end;

end.
