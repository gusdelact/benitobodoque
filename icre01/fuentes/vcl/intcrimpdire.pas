// Sistema         : Clase de CR_IMP_DIRECCION
// Fecha de Inicio : 08/10/2009
// Función forma   : Clase de CR_IMP_DIRECCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : AARJ 08 Oct 2009.
// Comentarios     : Forma para el catalogo de Direcciones y Directores para el reporte de Cartera Impagada
Unit IntCrImpDire;

interface             

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,


// Unidades Adicionales  para la implementación de los controles de captura   #1
IntMPers,         //Director
IntEmple,         //Empleados
Intempre,         //Empresa
// Unidades Adicionales para implementar barra de estus y seguridad al pie de la forma
IntParamCre,
IntGenCre, IntLinkit;

Type
 TCrImpDire= class;

  TWCrImpDireccion=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_DIRECCION : TLabel; 
    edCVE_DIRECCION : TEdit;
    lbID_DIRECTOR : TLabel; 
    edID_DIRECTOR : TEdit;
    edDESC_DIRECCION : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    PnlMsg: TPanel;
    GroupBox4: TGroupBox;
    lbFH_ALTA: TLabel;
    lbFH_MODIF: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIF: TLabel;
    rgSIT_DIRECCION: TRadioGroup;
    edCVE_USU_ALTA: TEdit;
    edFH_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    edFH_MODIF: TEdit;
    bbDirector: TBitBtn;
    edNombreDirector: TEdit;
    ilDirector: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure rgSIT_DIRECCIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_DIRECCIONExit(Sender: TObject);
    procedure edID_DIRECTORExit(Sender: TObject);
    procedure edDESC_DIRECCIONExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1ErrorAceptar(Sender: TObject);
    procedure bbDirectorClick(Sender: TObject);
    procedure ilDirectorEjecuta(Sender: TObject);
    procedure bbDirectorExit(Sender: TObject);
    procedure ilDirectorCapture(Sender: TObject; var Show: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrImpDire;
end; 
 TCrImpDire= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        //Clases Adicionales    # 2
        ParamCre                 : TParamCre;
        //Empresa                  : TEmpresa;   //Empresa
        Director                 : TEmpleado;  //Director
        
        //ID_EMPRESA               : TInterCampo;
        CVE_DIRECCION            : TInterCampo;
        ID_DIRECTOR              : TInterCampo;
        DESC_DIRECCION           : TInterCampo;
        SIT_DIRECCION            : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIF            : TInterCampo;
        FH_MODIF                 : TInterCampo;
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


constructor TCrImpDire.Create( AOwner : TComponent ); 
begin Inherited; 

      // ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      // ID_EMPRESA.Caption:='Número de Empresa';
      // ID_EMPRESA.NoCompare:= True;
      
      CVE_DIRECCION :=CreaCampo('CVE_DIRECCION',ftString,tsNinguno,tsNinguno,True);
                CVE_DIRECCION.Caption:='Clave de Direccion';
               // CVE_DIRECCION.NoCompare:= True;
      ID_DIRECTOR :=CreaCampo('ID_DIRECTOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_DIRECTOR.Caption:='Número de Director';
               // ID_DIRECTOR.NoCompare:= True;
      DESC_DIRECCION :=CreaCampo('DESC_DIRECCION',ftString,tsNinguno,tsNinguno,True);
                DESC_DIRECCION.Caption:='Descripción de la Dirección';
               // DESC_DIRECCION.NoCompare:= True;

      SIT_DIRECCION :=CreaCampo('SIT_DIRECCION',ftString,tsNinguno,tsNinguno,True);
      With SIT_DIRECCION do Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('CA');
      End;
                SIT_DIRECCION.Caption:='Situación Direccion';
                // SIT_DIRECCION.NoCompare:= True;

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
                // CVE_USU_ALTA.NoCompare:= True;
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
                //FH_ALTA.NoCompare := True;
      CVE_USU_MODIF :=CreaCampo('CVE_USU_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIF.Caption:='Clave de Usu Modificación';
                //CVE_USU_MODIF.NoCompare := True;
      FH_MODIF :=CreaCampo('FH_MODIF',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIF.Caption:='Fecha y Hora Modificación';
                //FH_MODIF.NoCompare := True;

      // Empresa
      // Empresa := TEmpresa.Create(Self);

      // Director
      Director := TEmpleado.Create(Self);
      Director.FilterBy := fbTMPersonaEmpleado;
      Director.MasterSource := Self;
      Director.FieldByName('ID_PERSONA').MasterField := 'ID_DIRECTOR';
      Director.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';


      // FKeyFields.Add('ID_EMPRESA');
      FKeyFields.Add('CVE_DIRECCION');
      //FKeyFields.Add('ID_DIRECTOR');  se comento esta línea para permitir la busqueda en otras pantallas indicando sólamente la CVE_DIRECCION

      TableName := 'CR_IMP_DIRECCION'; 
      UseQuery := True; 
      HelpFile := 'IntCrImpDire.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrImpDire.Destroy;
begin
// if Empresa <> nil then  Empresa.free;
 if Director <> nil then
   Director.Free;

inherited;
end;


function TCrImpDire.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrImpDireccion;
begin
   W:=TWCrImpDireccion.Create(Self);
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


Function TCrImpDire.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ICrImDi.it','S,F');
   Try
     if Active then
     begin
       //T.Param(0,ID_EMPRESA.AsString);
       T.Param(0,CVE_DIRECCION.AsString);
       T.Param(1,ID_DIRECTOR.AsString);
     end;

     if T.Execute then
     InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]); //,T.DameCampo(2)

   finally
     T.Free;
   end;
end;


function TCrImpDire.Reporte:Boolean;
begin //Execute_Reporte();
    Result := False;
end;


(***********************************************FORMA CR_IMP_DIRECCION********************)
(*                                                                              *)
(*  FORMA DE CR_IMP_DIRECCION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_IMP_DIRECCION********************)

procedure TWCrImpDireccion.FormShow(Sender: TObject);
begin

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      With Objeto do
      begin
        //ID_EMPRESA.Control:=edID_EMPRESA;

        CVE_DIRECCION.Control:=edCVE_DIRECCION;
        ID_DIRECTOR.Control:=edID_DIRECTOR;
        DESC_DIRECCION.Control:=edDESC_DIRECCION;

        SIT_DIRECCION.Control:= rgSIT_DIRECCION; //edSIT_DIRECCION;
        CVE_USU_ALTA.Control := edCVE_USU_ALTA;
        FH_ALTA.Control      := edFH_ALTA;
        CVE_USU_MODIF.Control:= edCVE_USU_MODIF;
        FH_MODIF.Control     := edFH_MODIF;
      end;

      // Empresa
      // Objeto.Empresa.ID_Empresa.Control := edID_EMPRESA;
      // Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      // Objeto.Empresa.GetParams(Objeto);
      // edNombreEmpresa.Hint := Objeto.Empresa.PersonaMoral.Nombre.AsString;
      // edNombreEmpresa.ShowHint := True;

      // Director
      Objeto.Director.ID_Persona.Control :=edID_DIRECTOR;
      Objeto.Director.Persona.Nombre.Control :=edNombreDirector;
      Objeto.Director.GetParams(Objeto);

      edNombreDirector.Hint := Objeto.Director.Persona.Nombre.AsString;
      edNombreDirector.ShowHint := True;

end;

procedure TWCrImpDireccion.FormDestroy(Sender: TObject);
begin
      With Objeto do
      begin
        //  ID_EMPRESA.Control:=nil;
        CVE_DIRECCION.Control:=nil;
        ID_DIRECTOR.Control:=nil;
        DESC_DIRECCION.Control:=nil;

        SIT_DIRECCION.Control:=nil;
        CVE_USU_ALTA.Control:=nil;
        FH_ALTA.Control:=nil;
        CVE_USU_MODIF.Control:=nil;
        FH_MODIF.Control:=nil;
      end;

    // Empresa
    // Objeto.Empresa.ID_Empresa.Control := Nil;
    // Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;

    // Director
    Objeto.Director.Persona.Nombre.Control :=nil;
    Objeto.Director.Id_Persona.Control :=nil;

   //Objeto
end;

procedure TWCrImpDireccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrImpDireccion.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   Objeto.FH_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_DIRECCION.ItemIndex:= 0;
   // edID_EMPRESA.SetFocus;
   edCVE_DIRECCION.SetFocus;
   GroupBox4.Enabled := False;
end;

procedure TWCrImpDireccion.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
    Objeto.FH_MODIF.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
    Objeto.CVE_USU_MODIF.AsString := Objeto.Apli.Usuario;
    edDESC_DIRECCION.SetFocus;
    GroupBox4.Enabled := False;
end;


procedure TWCrImpDireccion.rgSIT_DIRECCIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_DIRECCION,True,CNULL,True);
end;


procedure TWCrImpDireccion.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  With Objeto Do
  Begin
      If IsNewData Then
      Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
         Begin
            CVE_USU_ALTA.AsString  := DameUsuario;
            FH_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End
         else
            Realizado := False;
      End
      else
      Begin
         If MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
         Begin
            CVE_USU_MODIF.AsString  := DameUsuario;
            FH_MODIF.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End
         else
            Realizado := False;
      End
  End;

end;

procedure TWCrImpDireccion.edCVE_DIRECCIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   vlMsg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_DIRECCION.GetFromControl;
      If Objeto.CVE_DIRECCION.AsString = CNULL Then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la Dirección';
      End;
      InterForma1.ValidaExit(edCVE_DIRECCION,vlSalida,vlMsg,True);
   end;

end;

procedure TWCrImpDireccion.edID_DIRECTORExit(Sender: TObject);
{var  vlSalida  :  boolean;
     vlMsg     :  String;}
Begin
{   vlMsg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.ID_DIRECTOR.GetFromControl;
      If Objeto.ID_DIRECTOR.AsString = CNULL Then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Director';
      End;
      InterForma1.ValidaExit(edID_DIRECTOR,vlSalida,vlMsg,True);
   end;}
    InterForma1.ValidaExit(edID_DIRECTOR,True,'',True);
end;

procedure TWCrImpDireccion.edDESC_DIRECCIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   vlMsg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.DESC_DIRECCION.GetFromControl;

      If Objeto.DESC_DIRECCION.AsString = CNULL Then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la descripción de la Dirección';
      End;
      InterForma1.ValidaExit(edDESC_DIRECCION,vlSalida,vlMsg,True);
   end;

end;

procedure TWCrImpDireccion.InterForma1Buscar(Sender: TObject);
begin
   Objeto.InternalBusca;
end;

procedure TWCrImpDireccion.InterForma1ErrorAceptar(Sender: TObject);
begin
 // ShowMessage('Falla Nuevo / Modificacion');
end;

procedure TWCrImpDireccion.bbDirectorClick(Sender: TObject);
begin
    Objeto.Director.ShowAll := True;
    If Objeto.Director.Busca Then Begin
       InterForma1.NextTab(edID_DIRECTOR);
    End;
end;

procedure TWCrImpDireccion.ilDirectorEjecuta(Sender: TObject);
begin
  if Objeto.Director.FindKey([ilDirector.Buffer]) then
    InterForma1.NextTab(edID_DIRECTOR);
end;

procedure TWCrImpDireccion.bbDirectorExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_DIRECTOR,True,'',True);
end;

procedure TWCrImpDireccion.ilDirectorCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

end.
