// Sistema         : Clase de CR_AGRUPO_ATRIB
// Fecha de Inicio : 20/05/2003
// Función forma   : Clase de CR_AGRUPO_ATRIB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrAgrAtr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk , IntLinkit,

//Unidades Adicionales
IntParamCre, IntCrAgrupac,IntCrAtribut
;

Type
 TCrAgrAtr= class;

  TWCrAgrupoAtrib=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_AGRUPACION : TLabel;
    edCVE_AGRUPACION : TEdit;
    lbCVE_ATRIBUTO : TLabel;
    edCVE_ATRIBUTO : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESC_ATRIBUTO: TEdit;
    btATRIBUTO: TBitBtn;
    btAGRUPACION: TBitBtn;
    edDESC_AGRUP: TEdit;
    ilAGRUPACION: TInterLinkit;
    ilATRIBUTO: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btAGRUPACIONClick(Sender: TObject);
    procedure ilAGRUPACIONEjecuta(Sender: TObject);
    procedure ilAGRUPACIONCapture(Sender: TObject; var Show: Boolean);
    procedure btATRIBUTOClick(Sender: TObject);
    procedure ilATRIBUTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilATRIBUTOEjecuta(Sender: TObject);
    procedure edCVE_AGRUPACIONExit(Sender: TObject);
    procedure edCVE_ATRIBUTOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
        
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrAgrAtr;
end;
 TCrAgrAtr= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_AGRUPACION           : TInterCampo;
        CVE_ATRIBUTO             : TInterCampo;
        ParamCre                 : TParamCre;
        Agrupacion               : TCrAgrupac;
        Atributo                 : TCrAtribut;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrAgrAtr.Create( AOwner : TComponent );
begin Inherited;
      CVE_AGRUPACION :=CreaCampo('CVE_AGRUPACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AGRUPACION.Caption:='Agrupación';
      CVE_ATRIBUTO :=CreaCampo('CVE_ATRIBUTO',ftString,tsNinguno,tsNinguno,True);
                CVE_ATRIBUTO.Caption:='Clave de Atributo';
      FKeyFields.Add('CVE_AGRUPACION');
      FKeyFields.Add('CVE_ATRIBUTO');

      TableName := 'CR_AGRUPO_ATRIB';
      UseQuery := True;
      HelpFile := 'IntCrAgrAtr.Hlp';
      ShowMenuReporte:=True;

      Agrupacion := TCrAgrupac.Create(Self);
      Agrupacion.MasterSource:=Self;
      Agrupacion.FieldByName('CVE_AGRUPACION').MasterField:='CVE_AGRUPACION';

      Atributo := TCrAtribut.Create(Self);
      Atributo.MasterSource:=Self;
      Atributo.FieldByName('CVE_ATRIBUTO').MasterField:='CVE_ATRIBUTO';
end;

Destructor TCrAgrAtr.Destroy;
begin
        If Agrupacion <> nil then
           Agrupacion.Free;
        //end if;

        If Atributo <> nil then
           Atributo.Free;
        //end if;
        inherited;
end;


function TCrAgrAtr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAgrupoAtrib;
begin
   W:=TWCrAgrupoAtrib.Create(Self);
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

Function TCrAgrAtr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAgAt.it','S,S');
      Try if Active then begin T.Param(0,CVE_AGRUPACION.AsString); 
                               T.Param(1,CVE_ATRIBUTO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_AGRUPO_ATRIB********************)
(*                                                                              *)
(*  FORMA DE CR_AGRUPO_ATRIB                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AGRUPO_ATRIB********************)

procedure TWCrAgrupoAtrib.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_AGRUPACION.Control:=edCVE_AGRUPACION;
      Objeto.CVE_ATRIBUTO.Control:=edCVE_ATRIBUTO;

      Objeto.Agrupacion.DESC_AGRUPACION.Control := edDESC_AGRUP;
      Objeto.Agrupacion.GetParams(Objeto);

      Objeto.Atributo.DESC_ATRIBUTO.Control := edDESC_ATRIBUTO;
      Objeto.Atributo.GetParams(Objeto);

end;

procedure TWCrAgrupoAtrib.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AGRUPACION.Control:=nil;
      Objeto.CVE_ATRIBUTO.Control:=nil;
   //Objeto

      Objeto.Agrupacion.DESC_AGRUPACION.Control := nil;
      Objeto.Atributo.DESC_ATRIBUTO.Control := nil;
end;

procedure TWCrAgrupoAtrib.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAgrupoAtrib.InterForma1DespuesNuevo(Sender: TObject);
begin           
   MuestraHints;
   edCVE_AGRUPACION.SetFocus;
end;

procedure TWCrAgrupoAtrib.InterForma1DespuesModificar(Sender: TObject);
begin //.SetFocus;
end;

procedure TWCrAgrupoAtrib.btAGRUPACIONClick(Sender: TObject);
begin
    Objeto.Agrupacion.ShowAll := True;
    if Objeto.Agrupacion.Busca then
       InterForma1.NextTab(edCVE_AGRUPACION);
end;

procedure TWCrAgrupoAtrib.ilAGRUPACIONEjecuta(Sender: TObject);
begin
   if Objeto.Agrupacion.FindKey([ilAgrupacion.Buffer]) then
      InterForma1.NextTab(edCVE_AGRUPACION);
   //end if;
end;

procedure TWCrAgrupoAtrib.ilAGRUPACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrAgrupoAtrib.btATRIBUTOClick(Sender: TObject);
begin
    Objeto.Atributo.ShowAll := True;
    if Objeto.Atributo.Busca then
       InterForma1.NextTab(edCVE_ATRIBUTO);
end;

procedure TWCrAgrupoAtrib.ilATRIBUTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrAgrupoAtrib.ilATRIBUTOEjecuta(Sender: TObject);
begin
   if Objeto.Atributo.FindKey([ilAtributo.Buffer]) then
      InterForma1.NextTab(btATRIBUTO);
   //end if;
end;

procedure TWCrAgrupoAtrib.edCVE_AGRUPACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMsg     := '';
         Objeto.CVE_AGRUPACION.GetFromControl;
         if Objeto.CVE_AGRUPACION.AsString = '' then
         Begin
            VLMsg:='Favor de Indicar la Clave de Agrupación';
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_AGRUPACION,VLSalida,VLMsg,True);
      end;
end;

procedure TWCrAgrupoAtrib.edCVE_ATRIBUTOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMsg     := '';
         Objeto.CVE_ATRIBUTO.GetFromControl;
         if Objeto.CVE_ATRIBUTO.AsString = '' then
         Begin
            VLMsg := 'Favor de Indicar la Clave del Atributo';
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_ATRIBUTO,VLSalida,VLMsg,True);
      end;
end;

Procedure TWCrAgrupoAtrib.MuestraHints;
Begin
      edDESC_AGRUP.Hint := Objeto.Agrupacion.DESC_AGRUPACION.AsString;
      edDESC_AGRUP.ShowHint := True;
      edDESC_ATRIBUTO.Hint := Objeto.Atributo.DESC_ATRIBUTO.AsString;
      edDESC_ATRIBUTO.ShowHint := True;
End;

procedure TWCrAgrupoAtrib.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if

end;

procedure TWCrAgrupoAtrib.InterForma1DespuesAceptar(Sender: TObject);
begin

   MuestraHints;
end;

procedure TWCrAgrupoAtrib.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   // end if
end;

end.
