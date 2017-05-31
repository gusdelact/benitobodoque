// Sistema         : Clase de CR_CON_CAT_DATA
// Fecha de Inicio : 01/08/2012
// Función forma   : Clase de CR_CON_CAT_DATA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Comentarios     : Para administrar claves de baja maestro-detalle sobre la relacion CR_CON_CAT_DATA
Unit IntCrCoCtDt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, IntParamCre, ComCtrls, IntDtPk;

Type
 TCrCoCtDt= class; 

  TWCrCoCtDt=Class(TForm)
    InterForma1             : TInterForma;
    edCVE_CON_GPO_CAT: TEdit;
    edCVE_CLAVE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edDESC_CLAVE: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    RGGpoCat: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_VALOR_ADIC: TEdit;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure RGGpoCatClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_CON_GPO_CATExit(Sender: TObject);
    procedure edDESC_CLAVEExit(Sender: TObject);
    procedure edCVE_VALOR_ADICExit(Sender: TObject);
    procedure RGGpoCatExit(Sender: TObject);
    procedure edCVE_CLAVEExit(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations }
    Objeto : TCrCoCtDt;
end;
 TCrCoCtDt= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        CVE_CON_GPO_CAT   :TInterCampo ;
        CVE_CLAVE         :TInterCampo ;
        DESC_CLAVE        :TInterCampo ;
        CVE_VALOR_ADIC    :TInterCampo ;

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


constructor TCrCoCtDt.Create( AOwner : TComponent ); 
begin Inherited;

      CVE_CON_GPO_CAT:=CreaCampo('CVE_CON_GPO_CAT',ftString,tsNinguno,tsNinguno,True);
                CVE_CON_GPO_CAT.Caption:='Clave de Grupo de Catalogo';
      CVE_CLAVE:=CreaCampo('CVE_CLAVE', ftString, tsNinguno, tsNinguno, True) ;
                CVE_CLAVE.Caption:= 'Clave';
      DESC_CLAVE:=CreaCampo('DESC_CLAVE',ftString,tsNinguno,tsNinguno,True);
                DESC_CLAVE.Caption:='Descripción';
      CVE_VALOR_ADIC:=CreaCampo('CVE_VALOR_ADIC',ftString,tsNinguno,tsNinguno,True);
                CVE_VALOR_ADIC.Caption:='Clave Adicional';

      FKeyFields.Add('CVE_CON_GPO_CAT');
      FKeyFields.Add('CVE_CLAVE');


      TableName := 'CR_CON_CAT_DATA';
      UseQuery := True;
      HelpFile := 'ICrCoCtDt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoCtDt.Destroy;
begin inherited;
end;


function TCrCoCtDt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoCtDt;
begin
   W:=TWCrCoCtDt.Create(Self);
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

Function TCrCoCtDt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCoCtDt.it','S,S');
      Try
       if Active then
          BEGIN
          T.Param(0,CVE_CON_GPO_CAT.AsString);
          T.Param(1,CVE_CLAVE.AsString);
          END;
       if T.Execute then
          InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrCoCtDt.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrCoCtDt********************)
(*                                                                              *)
(*  FORMA DE CrCoCtDt                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCoCtDt********************)

procedure TWCrCoCtDt.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Objeto.CVE_CON_GPO_CAT.Control  := edCVE_CON_GPO_CAT;
    Objeto.CVE_CLAVE.Control        := edCVE_CLAVE;
    Objeto.DESC_CLAVE.Control       := edDESC_CLAVE;
    Objeto.CVE_VALOR_ADIC.Control   := edCVE_VALOR_ADIC;

    InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrCoCtDt.FormDestroy(Sender: TObject);
begin
//Objeto
    Objeto.CVE_CON_GPO_CAT.Control  := nil;
    Objeto.CVE_CLAVE.Control        := nil;
    Objeto.DESC_CLAVE.Control       := nil;
    Objeto.CVE_VALOR_ADIC.Control   := nil;
end;

procedure TWCrCoCtDt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCoCtDt.InterForma1DespuesNuevo(Sender: TObject);
begin
   RGGpoCat.ItemIndex := 0 ;
   edCVE_CLAVE.SetFocus ;
end;

procedure TWCrCoCtDt.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCoCtDt.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

procedure TWCrCoCtDt.RGGpoCatClick(Sender: TObject);
var vlGpoCat: String ;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Case RGGpoCat.ItemIndex of
             0: begin
                  vlGpoCat := 'CAT_TIPO_LIQUIDA';
                end ;
             1: begin
                  vlGpoCat := 'CAT_TIPO_LQ_DET';
                end ;
         End ;

         Objeto.CVE_CON_GPO_CAT.AsString:= vlGpoCat ;
      end ;
end;

procedure TWCrCoCtDt.InterForma1AntesAceptar(Sender: TObject;
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
//         if vgActualiza then
          // DefinePredeterminado;
         //end if
           Realizado := True;
      end
      else
           Realizado := False;
   end

end;

procedure TWCrCoCtDt.edCVE_CLAVEExit(Sender: TObject);
var   VLSalida  :  Boolean;
      VLMsg, sSQL :  String;
      qy : TQuery;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.CVE_CLAVE.GetFromControl;
      If Objeto.CVE_CLAVE.AsString = '' Then Begin
         VlSalida := False;
         VLMsg := 'Indique la clave.';
      End
      Else Begin
            sSQL:= 'SELECT CVE_CLAVE FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT IN (''CAT_TIPO_LIQUIDA'', ''CAT_TIPO_LQ_DET'') '+
                   'AND CVE_CLAVE = '+ SQLStr(Objeto.CVE_CLAVE.AsString)+'  ';
            qy:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qy <> Nil Then Begin
               If qy.RecordCount > 0 Then Begin
                  VlSalida   := False;
                  VLMsg := 'La clave '+Objeto.CVE_CLAVE.AsString+' YA existe. ';
               End;
               qy.Free;
            End;
      End;
      InterForma1.ValidaExit(edCVE_CLAVE,vlSalida,vlMsg,True);
   end ;
end;

procedure TWCrCoCtDt.edCVE_CON_GPO_CATExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_CON_GPO_CAT,True,'',True);
end;

procedure TWCrCoCtDt.edDESC_CLAVEExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_CLAVE,True,'',True);
end;

procedure TWCrCoCtDt.edCVE_VALOR_ADICExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_VALOR_ADIC,True,'',True);
end;

procedure TWCrCoCtDt.RGGpoCatExit(Sender: TObject);
begin
    InterForma1.ValidaExit(RGGpoCat,True,'',True);
end;


end.
