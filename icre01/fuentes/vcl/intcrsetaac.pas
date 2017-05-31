// Sistema         : Clase de CR_SEC_TAM_ACRED
// Fecha de Inicio : 11/07/2003
// Función forma   : Clase de CR_SEC_TAM_ACRED
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrSeTaAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

//Unidades Adiconales
IntCrTamAcre, //Tamaño del acreditado
IntParamCre,
IntGenCre
;

Type
 TCrSeTaAc= class;

  TWCrSecTamAcred=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TAM_ACRED : TLabel;
    edCVE_TAM_ACRED : TEdit;
    lbCVE_TIPO_SECTOR : TLabel;
    lbNUM_EMPLEADOS : TLabel;
    rgCVE_RANGO : TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNUM_EMPLEADOS: TInterEdit;
    btTAMACRED: TBitBtn;
    edDESC_TAMACRED: TEdit;
    MsgPanel: TPanel;
    ilTAMACRED: TInterLinkit;
    cbCVE_TIPO_SECTOR: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btTAMACREDClick(Sender: TObject);
    procedure ilTAMACREDCapture(Sender: TObject; var Show: Boolean);
    procedure ilTAMACREDEjecuta(Sender: TObject);
    procedure edCVE_TAM_ACREDExit(Sender: TObject);
    procedure cbCVE_TIPO_SECTORExit(Sender: TObject);
    procedure edNUM_EMPLEADOSExit(Sender: TObject);
    procedure rgCVE_RANGOExit(Sender: TObject);
    Function    ListaTipoSector : String;
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrSeTaAc;
end;
 TCrSeTaAc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TAM_ACRED            : TInterCampo;
        CVE_TIPO_SECTOR          : TInterCampo;
        NUM_EMPLEADOS            : TInterCampo;
        CVE_RANGO                : TInterCampo;
        //Clases Adiconales
        TamAcred                 : TCrTamAcre;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrSeTaAc.Create( AOwner : TComponent );
begin Inherited;
      CVE_TAM_ACRED :=CreaCampo('CVE_TAM_ACRED',ftString,tsNinguno,tsNinguno,True);
                CVE_TAM_ACRED.Caption:='Tamaño Acreditado';
      CVE_TIPO_SECTOR :=CreaCampo('CVE_TIPO_SECTOR',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_SECTOR.Caption:='Tipo Sector';
      NUM_EMPLEADOS :=CreaCampo('NUM_EMPLEADOS',ftFloat,tsNinguno,tsNinguno,True);
                NUM_EMPLEADOS.Caption:='Número Empleados';
      CVE_RANGO :=CreaCampo('CVE_RANGO',ftString,tsNinguno,tsNinguno,True);
      With CVE_RANGO do
       begin Size:=2;
             UseCombo:=True;
             ComboLista.Add('0'); ComboDatos.Add('HA');
             ComboLista.Add('1'); ComboDatos.Add('MA');
             ComboLista.Add('2'); ComboDatos.Add('NA');
       end;
                CVE_RANGO.Caption:='Rango';
      FKeyFields.Add('CVE_TAM_ACRED');
      FKeyFields.Add('CVE_TIPO_SECTOR');

      TableName := 'CR_SEC_TAM_ACRED';
      UseQuery := True;
      HelpFile := 'IntCrSeTaAc.Hlp';
      ShowMenuReporte:=True;

      TamAcred := TCrTamAcre.Create(Self);
      TamAcred.MasterSource:=Self;
      TamAcred.FieldByName('CVE_TAM_ACRED').MasterField:='CVE_TAM_ACRED';

end;

Destructor TCrSeTaAc.Destroy;
begin
   if TamAcred <> nil then
      TamAcred.Free;
   //end if
   
   inherited;
end;


function TCrSeTaAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSecTamAcred;
begin
   W:=TWCrSecTamAcred.Create(Self);
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


Function TCrSeTaAc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSeTA.it','S,S');
      Try if Active then begin T.Param(0,CVE_TAM_ACRED.AsString);
                               T.Param(1,CVE_TIPO_SECTOR.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_SEC_TAM_ACRED********************)
(*                                                                              *)
(*  FORMA DE CR_SEC_TAM_ACRED                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SEC_TAM_ACRED********************)

procedure TWCrSecTamAcred.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TAM_ACRED.Control:=edCVE_TAM_ACRED;
      Objeto.CVE_TIPO_SECTOR.Control:=cbCVE_TIPO_SECTOR;
      Objeto.NUM_EMPLEADOS.Control:=edNUM_EMPLEADOS;
      Objeto.CVE_RANGO.Control:=rgCVE_RANGO;

      Objeto.TamAcred.DESC_TAM_ACRED.Control := edDESC_TAMACRED;

      ListaTipoSector;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrSecTamAcred.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TAM_ACRED.Control:=nil;
      Objeto.CVE_TIPO_SECTOR.Control:=nil;
      Objeto.NUM_EMPLEADOS.Control:=nil;
      Objeto.CVE_RANGO.Control:=nil;

      Objeto.TamAcred.DESC_TAM_ACRED.Control := nil;
   //Objeto
end;

procedure TWCrSecTamAcred.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSecTamAcred.InterForma1DespuesNuevo(Sender: TObject);
begin
   cbCVE_TIPO_SECTOR.Text := 'AGROPE';
   rgCVE_RANGO.ItemIndex := 0;
   Objeto.NUM_EMPLEADOS.AsInteger := 0;
   MuestraHints;
   edCVE_TAM_ACRED.SetFocus;
end;

procedure TWCrSecTamAcred.InterForma1DespuesModificar(Sender: TObject);
begin edNUM_EMPLEADOS.SetFocus;
end;

procedure TWCrSecTamAcred.btTAMACREDClick(Sender: TObject);
begin
   Objeto.TamAcred.ShowAll := True;
   if Objeto.TamAcred.Busca then
      InterForma1.NextTab(edCVE_TAM_ACRED);
   //end if
end;

procedure TWCrSecTamAcred.ilTAMACREDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrSecTamAcred.ilTAMACREDEjecuta(Sender: TObject);
begin
   if Objeto.TamAcred.FindKey([ilTAMACRED.Buffer]) then
      InterForma1.NextTab(edCVE_TAM_ACRED);
   //end if
end;

procedure TWCrSecTamAcred.edCVE_TAM_ACREDExit(Sender: TObject);
Var     VLMsg    : String;
        VLSalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg    := '';
      VLSalida := True;
      Objeto.CVE_TAM_ACRED.GetFromControl;
      if Objeto.CVE_TAM_ACRED.AsString = '' then
      Begin
         VLMsg := 'Favor de Indicar la Clave del Tamaño del Acreditado';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edCVE_TAM_ACRED,VLSalida,VLMsg,True);
   end
end;

procedure TWCrSecTamAcred.cbCVE_TIPO_SECTORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbCVE_TIPO_SECTOR,True,'',True);
end;

procedure TWCrSecTamAcred.edNUM_EMPLEADOSExit(Sender: TObject);
Var     VLMsg    : String;
        VLSalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg    := '';
      VLSalida := True;
      Objeto.NUM_EMPLEADOS.GetFromControl;
      if Objeto.NUM_EMPLEADOS.AsString = '' then
         Objeto.NUM_EMPLEADOS.AsInteger := 0
      else if Objeto.NUM_EMPLEADOS.AsInteger < 0 then
      Begin
         VLMsg := 'El número de empleados no puee ser negativo';
         VLSalida := False;
      end;
      InterForma1.ValidaExit(edNUM_EMPLEADOS,VLSalida,VLMsg,True);
   end
end;

procedure TWCrSecTamAcred.rgCVE_RANGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_RANGO,True,'',True);
end;

Function TWCrSecTamAcred.ListaTipoSector : String;
Var Q       : TQuery;
    vlSql   : String;
Begin
   cbCVE_TIPO_SECTOR.Items.Clear;
   Q := TQuery.Create(Self);
   Try
       Q.SessionName := Objeto.SessionName;
       Q.DataBaseName := Objeto.DataBaseName;
       Q.SQL.Clear;
       Q.SQL.Add(' SELECT DISTINCT CVE_TIPO_SECTOR ' +
                 ' FROM CR_SECTOR_ECO ' +
                 ' ORDER BY CVE_TIPO_SECTOR ');
       Q.Open;

       While Not Q.Eof Do
         Begin
            cbCVE_TIPO_SECTOR.Items.Add(Q.FieldByName('CVE_TIPO_SECTOR').AsString);
            Q.Next;
         End;
   Finally
     If Assigned(Q) Then
      Begin
         Q.Close;
         Q.Free;
      End;
   End;
end;

Procedure TWCrSecTamAcred.MuestraHints;
Begin
      edDESC_TAMACRED.Hint := Objeto.TamAcred.DESC_TAM_ACRED.AsString;
      edDESC_TAMACRED.ShowHint := True;
End;

procedure TWCrSecTamAcred.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrSecTamAcred.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrSecTamAcred.InterForma1AntesAceptar(Sender: TObject;
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
