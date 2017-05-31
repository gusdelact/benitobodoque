// Sistema         : Clase de CR_CAT_TIP_GAR
// Fecha de Inicio : 05/07/2010
// Función forma   : Clase de CR_CAT_TIP_GAR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCaTiGa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, InterEdit;

Type
 TCrCaTiGa= class; 

  TWCrCatTipGar=Class(TForm)
    InterForma1             : TInterForma;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Panel1: TPanel;
    lbDESC_GARANT: TLabel;
    edDESC_GARANT: TEdit;
    Panel2: TPanel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbFH_MODIFICACION: TLabel;
    edFH_MODIFICACION: TEdit;
    lbCVE_USUAR_MODIF: TLabel;
    edCVE_USUAR_MODIF: TEdit;
    Panel3: TPanel;
    lbCVE_GARANT: TLabel;
    edCVE_GARANT: TEdit;
    rgSIT_GARANT: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    private
    function ObtFolio(pCveFolio, pMsg: String): Integer;
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrCaTiGa;
end; 
 TCrCaTiGa= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_GARANT               : TInterCampo;
        DESC_GARANT              : TInterCampo;
        F_ALTA                   : TInterCampo;
        FH_MODIFICACION          : TInterCampo;
        CVE_USUAR_MODIF          : TInterCampo;
        SIT_GARANT               : TInterCampo;
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


constructor TCrCaTiGa.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_GARANT :=CreaCampo('CVE_GARANT',ftFloat,tsNinguno,tsNinguno,True);
                CVE_GARANT.Caption:='Clave de Garant';
      DESC_GARANT :=CreaCampo('DESC_GARANT',ftString,tsNinguno,tsNinguno,True);
                DESC_GARANT.Caption:='Descripción Garant';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      FH_MODIFICACION :=CreaCampo('FH_MODIFICACION',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICACION.Caption:='Fecha y Hora Modificacion';
      CVE_USUAR_MODIF :=CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USUAR_MODIF.Caption:='Clave de Usuario Modificación';
      SIT_GARANT :=CreaCampo('SIT_GARANT',ftString,tsNinguno,tsNinguno,True);
                SIT_GARANT.Caption:='Situación Garant';
      With SIT_GARANT Do Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('IN');
      End;
      SIT_GARANT.NoCompare:= True;
      FKeyFields.Add('CVE_GARANT');
      TableName := 'CR_CAT_TIP_GAR'; 
      UseQuery := True;
      HelpFile := 'IntCrCaTiGa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCaTiGa.Destroy;
begin inherited;
end;


function TCrCaTiGa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCatTipGar;
begin
   W:=TWCrCatTipGar.Create(Self);
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


Function TCrCaTiGa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaTG.it','S');
      Try if Active then begin T.Param(0,CVE_GARANT.AsString) end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrCaTiGa.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CAT_TIP_GAR********************)
(*                                                                                     *)
(*  FORMA DE CR_CAT_TIP_GAR                                                            *)
(*                                                                                     *)
(***********************************************FORMA CR_CAT_TIP_GAR********************)

procedure TWCrCatTipGar.FormShow(Sender: TObject);
begin
      Objeto.CVE_GARANT.Control         :=edCVE_GARANT;
      Objeto.DESC_GARANT.Control        :=edDESC_GARANT;
      Objeto.F_ALTA.Control             :=edF_ALTA;
      Objeto.FH_MODIFICACION.Control    :=edFH_MODIFICACION;
      Objeto.CVE_USUAR_MODIF.Control    :=edCVE_USUAR_MODIF;
      Objeto.SIT_GARANT.Control         :=rgSIT_GARANT;
end;

procedure TWCrCatTipGar.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GARANT.Control         := nil;
      Objeto.DESC_GARANT.Control        := nil;
      Objeto.F_ALTA.Control             := nil;
      Objeto.FH_MODIFICACION.Control    := nil;
      Objeto.CVE_USUAR_MODIF.Control    := nil;
      Objeto.SIT_GARANT.Control         := nil;
   //Objeto
end;

procedure TWCrCatTipGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCatTipGar.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCatTipGar.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCatTipGar.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCatTipGar.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //
  With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USUAR_MODIF.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            CVE_GARANT.AsInteger:= ObtFolio('CATIGA','CLAVE DE GARANTIA: ');
            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USUAR_MODIF.AsString := DameUsuario;
            FH_MODIFICACION.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;

Function TWCrCatTipGar.ObtFolio(pCveFolio : String; pMsg : String): Integer;
Var
   STPObtFolios : TStoredProc;
   vlFolio     : Integer;
Begin
   vlFolio := 0;
   STPObtFolios := TStoredProc.Create(Nil);
   Try
      With STPObtFolios Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTENFOLIO';

         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
         Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
         Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Params.CreateParam(ftFloat,'RESULT',ptResult);
         ParamByName('PEIDEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
         ParamByName('PECVEFolio').AsString := pCveFolio;
         ParamByName('PEBCommit').AsString := 'V';

         ExecProc;

         If (ParamByName('PSResultado').AsInteger = 0) Then Begin
            vlFolio := ParamByName('Result').AsInteger;
         End Else
            ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg +
            IntToStr(ParamByName('PSResultado').AsInteger));
      End;
   Finally
      STPObtFolios.Free;
   End;
   ObtFolio:= vlFolio;
End;


procedure TWCrCatTipGar.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  rgSIT_GARANT.ItemIndex := 0;  
end;

end.
