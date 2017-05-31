// Sistema         : Clase de Crcatarne
// Fecha de Inicio : 04/07/2013
// Función forma   : Clase de Crcatarne
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrcatarne;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit
;

Type
 TCrcatarne= class; 

  TWCrcatarne=Class(TForm)
    InterForma1             : TInterForma;
    lbF_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    rgSITUACION: TRadioGroup;
    edCLAVE: TInterEdit;
    edDESC_CLAVE: TInterEdit;
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
    Objeto : TCrcatarne;
end; 
 TCrcatarne= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ParamCre    : TParamCre;

        CVE_AREA_NEGOCIO      : TInterCampo;
        DESC_AREA_NEGOCIO     : TInterCampo;
        SIT_AREA_NEGOCIO      : TInterCampo;
        CVE_USU_ALTA          : TInterCampo;
        F_ALTA                : TInterCampo;
        CVE_USU_MODIFICA      : TInterCampo;
        F_MODIFICA            : TInterCampo;

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


constructor TCrcatarne.Create( AOwner : TComponent ); 
begin Inherited;


      CVE_AREA_NEGOCIO := CreaCampo('CVE_AREA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                          CVE_AREA_NEGOCIO.Caption := 'Clave Área Negocio';

      DESC_AREA_NEGOCIO := CreaCampo('DESC_AREA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                          DESC_AREA_NEGOCIO.Caption := 'Desc Cve Área Negocio';

      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_ALTA.Caption := 'Usuario Alta';

      F_ALTA := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_ALTA.Caption := 'F. Alta';

      CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_MODIFICA.Caption := 'Usuario Modifica';

      F_MODIFICA := CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_MODIFICA.Caption := 'F. Modifica';


      SIT_AREA_NEGOCIO :=CreaCampo('SIT_AREA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
      With SIT_AREA_NEGOCIO do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add('AC');
            ComboLista.Add('1'); ComboDatos.Add('IN');
      end;


      FKeyFields.Add('CVE_AREA_NEGOCIO');
      TableName := 'CR_O_AREA_NEGOCIO';
      UseQuery := True;
      HelpFile := 'IntCrcatarne.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrcatarne.Destroy;
begin inherited;
end;


function TCrcatarne.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcatarne;
begin
   W:=TWCrcatarne.Create(Self);
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


Function TCrcatarne.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRARNEG.IT','');
      Try if Active then begin
//                               T.Param(0,CVE_AREA_NEGOCIO.AsString);
                         end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrcatarne.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA Crcatarne********************)
(*                                                                              *)
(*  FORMA DE Crcatarne                                                            *)
(*                                                                              *)
(***********************************************FORMA Crcatarne********************)

procedure TWCrcatarne.FormShow(Sender: TObject);
begin
      Objeto.CVE_AREA_NEGOCIO.Control := edCLAVE;
      Objeto.DESC_AREA_NEGOCIO.Control := edDESC_CLAVE;
      Objeto.SIT_AREA_NEGOCIO.Control := rgSITUACION;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
end;

procedure TWCrcatarne.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AREA_NEGOCIO.Control := nil;
      Objeto.DESC_AREA_NEGOCIO.Control := nil;
      Objeto.SIT_AREA_NEGOCIO.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
end;

procedure TWCrcatarne.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcatarne.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_ALTA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      rgSITUACION.ItemIndex := 0;
      edCLAVE.SetFocus;
end;

procedure TWCrcatarne.InterForma1DespuesModificar(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

//procedure TWCrcatarne.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrcatarne.InterForma1Buscar(Sender: TObject);
begin
    Objeto.Showall := True;
    Objeto.Busca
end;

procedure TWCrcatarne.InterForma1AntesAceptar(Sender: TObject;
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
