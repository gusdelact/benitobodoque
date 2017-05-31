// Sistema         : Clase de CR_CAT_TIP_AVAL
// Fecha de Inicio : 13/07/2010
// Función forma   : Clase de CR_CAT_TIP_AVAL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCaTiAv;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//Clases Adicionales
IntParamCre;        //Catálogo Tipo de Garantías;

Type
 TCrCaTiAv= class; 

  TWCrCatTipAval=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    edDESC_TIPO_AVAL: TEdit;
    lbDESC_TIPO_AVAL: TLabel;
    edCVE_AVAL: TEdit;
    lbCVE_AVAL: TLabel;
    rgSIT_GARANT: TRadioGroup;
    Panel2: TPanel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbFH_MODIFICACION: TLabel;
    edFH_MODIFICACION: TEdit;
    lbCVE_USUAR_MODIF: TLabel;
    edCVE_USUAR_MODIF: TEdit;
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
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edDESC_TIPO_AVALExit(Sender: TObject);
    private
      function ObtFolio(pCveFolio, pMsg: String): Integer;
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCaTiAv;
end; 
 TCrCaTiAv= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_AVAL                 : TInterCampo;
        DESC_TIPO_AVAL           : TInterCampo;
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


constructor TCrCaTiAv.Create( AOwner : TComponent );
begin Inherited;
      CVE_AVAL :=CreaCampo('CVE_AVAL',ftFloat,tsNinguno,tsNinguno,True);
                CVE_AVAL.Caption:='Clave de Aval';
      DESC_TIPO_AVAL :=CreaCampo('DESC_TIPO_AVAL',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_AVAL.Caption:='Descripción Tipo Aval';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      FH_MODIFICACION :=CreaCampo('FH_MODIFICACION',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICACION.Caption:='Fecha y Hora Modificacion';
      CVE_USUAR_MODIF :=CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USUAR_MODIF.Caption:='Clave de Usuario Modificación';
      SIT_GARANT :=CreaCampo('SIT_GARANT',ftString,tsNinguno,tsNinguno,True);
                SIT_GARANT.Caption:='Situación Garant';
      FKeyFields.Add('CVE_AVAL');
      With SIT_GARANT Do Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('IN');
      End;
      SIT_GARANT.NoCompare:= True;

      TableName := 'CR_CAT_TIP_AVAL'; 
      UseQuery := True; 
      HelpFile := 'IntCrCaTiAv.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCaTiAv.Destroy;
begin inherited;
end;


function TCrCaTiAv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCatTipAval;
begin
   W:=TWCrCatTipAval.Create(Self);
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


Function TCrCaTiAv.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaTA.it','F');
      Try if Active then begin T.Param(0,CVE_AVAL.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrCaTiAv.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CAT_TIP_AVAL********************)
(*                                                                              *)
(*  FORMA DE CR_CAT_TIP_AVAL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAT_TIP_AVAL********************)

procedure TWCrCatTipAval.FormShow(Sender: TObject);
begin
      Objeto.CVE_AVAL.Control:=edCVE_AVAL;
      Objeto.DESC_TIPO_AVAL.Control:=edDESC_TIPO_AVAL;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.FH_MODIFICACION.Control:=edFH_MODIFICACION;
      Objeto.CVE_USUAR_MODIF.Control:=edCVE_USUAR_MODIF;
      Objeto.SIT_GARANT.Control:=rgSIT_GARANT;
end;

procedure TWCrCatTipAval.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AVAL.Control:=nil;
      Objeto.DESC_TIPO_AVAL.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.FH_MODIFICACION.Control:=nil;
      Objeto.CVE_USUAR_MODIF.Control:=nil;
      Objeto.SIT_GARANT.Control:=nil;
   //Objeto
end;

procedure TWCrCatTipAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCatTipAval.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   rgSIT_GARANT.ItemIndex := 0;
end;

procedure TWCrCatTipAval.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCatTipAval.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

Function TWCrCatTipAval.ObtFolio(pCveFolio : String; pMsg : String): Integer;
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
end;

procedure TWCrCatTipAval.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  rgSIT_GARANT.ItemIndex := 0;
end;


procedure TWCrCatTipAval.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //
  With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USUAR_MODIF.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            CVE_AVAL.AsInteger:= ObtFolio('TIP_AVAL','CLAVE AVAL: ');
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
      end;
  end;
end;

procedure TWCrCatTipAval.edDESC_TIPO_AVALExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.DESC_TIPO_AVAL.GetFromControl;


      if (Objeto.DESC_TIPO_AVAL.AsString <> '')   then
        VLMsg := 'Se requiere que ingrese la descripcion del Aval';
        VLValida := False;
      end;
         InterForma1.ValidaExit(edDESC_TIPO_AVAL,VLValida,VLMsg,True);
end;

End.

