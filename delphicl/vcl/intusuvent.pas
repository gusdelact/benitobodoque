// Sistema         : Clase de USUVENT
// Fecha de Inicio : 29/03/2007
// Función forma   : Clase de USUVENT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : ROUY4095 10abr07
// Comentarios     : Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo por 3000 USD


Unit IntUsuvent;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntPers, InterEdit // Clas ed e Persona
,IntDINoClien
;

Type
 TUsuvent= class;

  TWUsuvent=Class(TForm)
    InterForma1             : TInterForma;
    pCliente: TPanel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    edID_Persona: TEdit;
    edNombre: TEdit;
    BAceptar: TButton;
    bSalir: TButton;
    InterLinkit1: TInterLinkit;
    pUsuario: TPanel;
    Label16: TLabel;
    btUsu: TSpeedButton;
    edUsu: TEdit;
    edNomusu: TEdit;
    btNuevo: TButton;
    ilUsuario: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure bSalirClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btNuevoClick(Sender: TObject);
    procedure ilUsuarioCapture(Sender: TObject; var Show: Boolean);
    procedure ilUsuarioEjecuta(Sender: TObject);
    procedure btUsuClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TUsuvent;


  end;

 TUsuvent= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        rgUsuario    : Integer;
        IdTitular    : Integer;
        IdUsuario    : Integer;
        Persona      : TPersona; //FINDMANUAL
        Usuario      : TDiNoClien; //MARA4356 SEP 2007

        function    InternalBusca : Boolean; override;
        Procedure   DataBaseChange; override; //FINDMANUAL
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    ShowUsuEvent(var pInstruccion:String) : Integer; //FINDMANUAL
      published
      end;

      var
        vgInformacion : String;
        vgAccion      : Integer;


implementation
Uses UndmSuc1; //FINDMANUAL


{$R *.DFM}

constructor TUsuvent.Create( AOwner : TComponent ); //FINDMANUAL
begin Inherited;

      {$WARNINGS OFF}
      Persona := TPersona.Create(self);
//      Persona.Apli := dm1.ApCorp;
      {$WARNINGS ON}
      Persona.MasterSource:= self;

      Usuario := TDiNoClien.Create(nil);
//      Usuario.Apli := dm1.ApCorp;
      Usuario.MasterSource:= self;

      StpName  := ' ';
      UseQuery := True;//False;
      HelpFile := 'IntUsuvent.Hlp';
      ShowMenuReporte:=True;
end;


Destructor TUsuvent.Destroy; //FINDMANUAL
begin
  If Assigned(Persona) Then Persona.Free;
  if Assigned(Usuario) Then Usuario.Free;
  inherited;
end;


procedure TUsuvent.Databasechange; //FINDMANUAL
begin inherited;
      Persona.GetParams(Self);
      Usuario.GetParams(Self);
end;


function TUsuvent.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWUsuvent;
begin
   W:=TWUsuvent.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TUsuvent.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IUsuvent.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA USUVENT********************)
(*                                                                              *)
(*  FORMA DE USUVENT                                                            *)
(*                                                                              *)
(***********************************************FORMA USUVENT********************)

procedure TWUsuvent.FormShow(Sender: TObject);
begin
  with Objeto.Persona do //FINDMANUAL
  begin
    ID_Persona.Control  := edID_Persona;
    Nombre.Control      := edNombre;
    edID_Persona.Text   := IntToStr(Objeto.IdTitular);
    InterLinkit1.Buffer := IntToStr(Objeto.IdTitular);
    InterLinkit1.Ejecuta;
  end;

  ilUsuario.Buffer := IntToStr(Objeto.IdUsuario);
  ilUsuario.Ejecuta;
  
  vgInformacion := '';
  case Objeto.rgUsuario of
    0 : begin //si
          pUsuario.Visible := False;
          pCliente.Visible := True;
        end;
    1 : begin //no
          pUsuario.Visible := True;
          pCliente.Visible := False;
        end;
  end;
end;

procedure TWUsuvent.FormDestroy(Sender: TObject); //FINDMANUAL
begin
  With Objeto.Persona Do
    Begin
    ID_Persona.Control := nil;
    Nombre.Control := nil;
    End;
end;

procedure TWUsuvent.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWUsuvent.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWUsuvent.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWUsuvent.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWUsuvent.FormActivate(Sender: TObject);
begin
  //Identificamos que no se corrió el proceso
  vgAccion := 0;
end;

procedure TWUsuvent.BAceptarClick(Sender: TObject);
begin
  //Preparamos la Info para su inserción
  case Objeto.rgUsuario of
    0 : vgInformacion :=  edID_Persona.Text;

    1 : begin
          
          {vgInformacion :=  IntToStr(rgTipoPersona.ItemIndex) + #9 +
                            eNombre.Text + #9 +
                            eFNacimiento.Text + #9 +
                            eCalle.Text + #9 +
                            eNumExterior.Text + #9 +
                            eNumInterior.Text + #9 +
                            eColonia.Text + #9 +
                            eCP.Text + #9 +
                            eDelegacion.Text + #9 +
                            eNacionalidad.Text + #9 +
                            eTipo.Text + #9 +
                            eIdentificacion.Text + #9 +
                            eCURP.Text + #9 +
                            eRFC.Text + #9 +
                            eFEA.Text;}
          if Objeto.Usuario.CVE_PER_JURIDICA.AsString='0' then
             vgInformacion:='PF';
          if Objeto.Usuario.CVE_PER_JURIDICA.AsString='1' then
             vgInformacion:='PM';
          vgInformacion :=  vgInformacion+ #9+
                            Objeto.Usuario.NOMBRE.AsString + #9+
                            Objeto.Usuario.F_NACIMIENTO.AsString + #9+
                            Objeto.Usuario.TX_CALLE.AsString + #9+
                            Objeto.Usuario.TX_NO_EXT.AsString + #9+
                            Objeto.Usuario.TX_NO_INT.AsString + #9+
                            Objeto.Usuario.TX_COLONIA.AsString + #9+
                            Objeto.Usuario.TX_COD_POSTAL.AsString + #9+
                            Objeto.Usuario.TX_DELEGACION.AsString + #9+
                            Objeto.Usuario.TX_NACIONALIDAD.AsString + #9;
          case Objeto.Usuario.TIPO_IDENTIFIC.AsInteger of
          1: vgInformacion :=  vgInformacion+ 'RFC'+#9;
          2: vgInformacion :=  vgInformacion+ 'CURP'+#9;
          3: vgInformacion :=  vgInformacion+ 'F. Nac. o Const.'+#9;
          4: vgInformacion :=  vgInformacion+ 'IFE'+#9;
          5: vgInformacion :=  vgInformacion+ 'Pasaporte'+#9;
          6: vgInformacion :=  vgInformacion+ 'Otra'+#9;
          end;
          vgInformacion :=  vgInformacion+ 
                            Objeto.Usuario.NUM_IDENTIFIC.AsString + #9+
                            Objeto.Usuario.TX_CURP.AsString + #9+
                            Objeto.Usuario.TX_RFC.AsString + #9+
                            Objeto.Usuario.TX_FEA.AsString + #9+
                            Objeto.Usuario.ID_NO_CLIENTE.AsString ;
        end;
  end;

  //Hacemos obligatoria la captura
  if ( trim(vgInformacion) = '' ) then
  begin
    ShowMessage('Es obligatorio capturar la información solicitada, rectifique.');
    Abort;
  end
  else
  begin
    //Identificamos que se corrió el proceso
    vgAccion := 1;
    Close;
  end;
end;

procedure TWUsuvent.bSalirClick(Sender: TObject);
begin
  Close;
end;


procedure TWUsuvent.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWUsuvent.InterLinkit1Ejecuta(Sender: TObject);  //FINDMANUAL
begin
  Objeto.Persona.FindKey([InterLinkit1.Buffer]);
end;

procedure TWUsuvent.SpeedButton2Click(Sender: TObject); //FINDMANUAL
begin
   Objeto.Persona.Busca;
end;

Function  TUsuvent.ShowUsuEvent(var pInstruccion:String) : Integer; //FINDMANUAL
var WUsuvent : TWUsuvent;
Begin
  Result := 0;
  try
    WUsuvent:=TWUsuvent.Create(nil);
    try
      WUsuvent.Objeto := self;
      WUsuvent.ShowModal;
      pInstruccion := vgInformacion;
      Result := vgAccion;
    finally
     WUsuvent.Free;
   end;
  except
    WUsuvent.Free;
    Result := 0;
  End;
End;


procedure TWUsuvent.btNuevoClick(Sender: TObject);
begin
//abre usuario
Objeto.Usuario.Catalogo;
edUsu.Text:=Objeto.Usuario.ID_NO_CLIENTE.AsString;
edNomusu.Text:=Objeto.Usuario.Nombre.AsString;
end;

procedure TWUsuvent.ilUsuarioCapture(Sender: TObject; var Show: Boolean);
begin
Show:=True;
end;

procedure TWUsuvent.ilUsuarioEjecuta(Sender: TObject);
begin
  if objeto.usuario.FindKey([ilUsuario.Buffer]) then
  begin edUsu.Text:=Objeto.Usuario.ID_NO_CLIENTE.AsString;
        edNomusu.Text:=Objeto.Usuario.Nombre.AsString;
  end;
end;

procedure TWUsuvent.btUsuClick(Sender: TObject);
begin
  if Objeto.Usuario.Busca then
  begin edUsu.Text:=Objeto.Usuario.ID_NO_CLIENTE.AsString;
        edNomusu.Text:=Objeto.Usuario.Nombre.AsString;
  end;
end;

end.
