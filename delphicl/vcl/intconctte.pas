// Sistema         : Clase de Consulta de contratantes
// Fecha de Inicio : 1 de abril de 1998
// Función forma   : Clase
// Desarrollo por  : J. Alberto Ramírez Pacheco
// Comentarios     :
unit IntConCtte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, unfirma,
  IntFind, UnSQL2, InterFun, IntCtte, llo, lli, DBCtrls, ComCtrls;

Const WM_DESPUESSHOW=WM_USER+1;

type
  TConCtte = Class;
  TWConCtte = class(TForm)
    InterForma1: TInterForma;
    ImageFirma: TImageWindow;
    ImageFoto: TImageWindow;
    edIdPersona: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbCombinaciones: TLabel;
    edDescContratante: TEdit;
    edCombinaciones: TEdit;
    edNombre: TEdit;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    lbCveTipoFirma: TLabel;
    edCveTipoFirma: TEdit;
    Image2: TImage;
    Label6: TLabel;
    edRegimen: TEdit;
    stpVerificaCteAAA: TStoredProc;
    iCteAAA: TAnimate;
    btnEliminarFirma: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ImageFirmaDblClick(Sender: TObject);
    procedure btnEliminarFirmaClick(Sender: TObject);
  private
  public
    Objeto : TConCtte;
    Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
    Procedure ChangeCtte(Sender: TObject);
  end;


  TConCtte = class(TInterFrame)
  private
  		FContrato: TInterFrame;
      ImagenFoto: TImageWindow;
      ImagenFirma: TImageWindow;
      FOnChangeCtte: TNotifyEvent;

      Function ValidaAccesoEliminarFirma: Boolean;
      Procedure ElimiaFirma;
  protected
		Procedure SetContrato(Cto:TInterFrame);
  public
    { Public declarations }
    Ctte: TCtte;
    dsCtte   	: TDataSource;
    dsImagen	: TDataSource;
    dsFirma		: TDataSource;
    Imagen		: TTable;
    Firma		: TTable;

    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    procedure   DatabaseChange; override;
    procedure   dsCtteDataChange(Sender: TObject; Field: TField);
    Property    OnChangeCtte: TNotifyEvent Read FOnChangeCtte Write FOnChangeCtte;
  published
    property Contrato : TInterFrame Read FContrato Write SetContrato;
  end;

implementation

{$R *.DFM}

constructor TConCtte.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);

   ctte:= TCtte.Create(self);
   dsCtte:=TDataSource.Create(Self);
   dsCtte.OnDataChange := dsCtteDataChange;

   dsImagen:= TDataSource.Create(Self);
   dsFirma := TDataSource.Create(Self);

   Imagen          := TTable.Create(self);
   Imagen.TableName:= 'IMAGEN';
   Imagen.Filtered := True;
   Imagen.Filter   := 'ID_PERSONA = -1';
   dsImagen.DataSet:= Imagen;

   Firma          := TTable.Create(self);
   Firma.TableName:= 'FIRMA';
   Firma.Filtered := True;
   Firma.Filter   := 'ID_PERSONA = -1';
   dsFirma.DataSet:= Firma;

   ImagenFoto:= nil;
   ImagenFirma:= nil;
end;

destructor TConCtte.Destroy;
begin
  if ctte <> nil then ctte.Free;
    inherited;
end;

procedure   TConCtte.DatabaseChange;
begin
	inherited;
   Ctte.GetParams(self);

   Imagen.Active := False;
   Firma.Active := False;
   Imagen.DatabaseName := DataBaseName;
   Imagen.SessionName := SessionName;
   Firma.DatabaseName := DataBaseName;
   Firma.SessionName := SessionName;
   Imagen.Active := True;
   Firma.Active := True;
end;

Procedure TConCtte.SetContrato(Cto:TInterFrame);
begin
   FContrato:=Cto;
   Ctte.Contrato:=Cto;

   if Cto <> nil Then
      Begin
        dsCtte.DataSet := self.Ctte.QContratante;
      end
	else
		begin
			Active := False;
      end;
end;


procedure TConCtte.dsCtteDataChange(Sender: TObject; Field: TField);
begin
  if (Field = nil) then
  Begin
   	if Not dsCtte.DataSet.IsEmpty Then
    Begin
        Imagen.Filter := 'ID_PERSONA = ' + dsCtte.DataSet.FieldByName('ID_PERSONA').asString;
        Firma.Filter  := 'ID_PERSONA = ' + dsCtte.DataSet.FieldByName('ID_PERSONA').asString;

        if Imagen.IsEmpty Then
           begin
              if ImagenFoto <> nil then ImagenFoto.Visible := false;
           end
        else
           begin
              if ImagenFoto <> nil then ImagenFoto.Visible := True;
           end;


        if Firma.IsEmpty Then
           begin
              if ImagenFirma <> nil then ImagenFirma.Visible := false;
           end
        else
           begin
              if ImagenFirma <> nil then ImagenFirma.Visible := True;
           end;

        If Assigned(OnChangeCtte) Then OnChangeCtte(Sender);
    end
    else Active := False;
  end;
end;


function TConCtte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWConCtte;
begin
   W:=TWConCtte.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TConCtte.ValidaAccesoEliminarFirma: Boolean;
Begin
  Try
    Result:= GetSQL(' SELECT CVE_OPER_ACC FROM SECU_OPER_ACC ' +
                    ' WHERE CVE_FUNCION = ''CLASE_' + UpperCase(ClassName) + '''' +
                    '   AND CVE_USUARIO = ''' + DameUsuario + '''' +
                    '   AND CVE_OPER_ACC= ''EF''',
                    SeguDataBaseName,SeguSessionName,True);
  Except
    Result:= False;
  end;
end;


Procedure TConCtte.ElimiaFirma;
var IdPersona, Nombre: String;
Begin
  IdPersona:= dsCtte.DataSet.FieldByName('ID_PERSONA').asString;
  Nombre:= dsCtte.DataSet.FieldByName('CONTRATANTE').asString;
  If MessageDlg('Esta seguro de eliminar la firma de ' + Nombre + ' con Id [' + IdPersona + ']' +
                Chr(VK_RETURN) + Chr(VK_RETURN) +
               'La firma se eliminará en todos los contratos a los cuales esté asociado.',
    mtConfirmation, [mbYES, mbNO], 0) = mrYes Then
  Begin
    Try
      RunSQL('Delete Firma Where Id_Persona = ' + IdPersona,
             DatabaseName, SessionName, True);
      Firma.Refresh;
      dsCtteDataChange(nil, nil);
    except
      On e: Exception do
        MessageDlg('Error al eliminar la firma de ' + Nombre + Chr(VK_RETURN) + e.Message,
          mtError, [mbOK], 0);
    end;
  end;
end;


(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)
Procedure TWConCtte.DespuesShow(Var Msg:TMessage);
var
  q: Tquery;
  s: String;
begin
  objeto.dsCtteDataChange(nil, nil);
{
   if Objeto.dsImagen.DataSet.IsEmpty Then
   	ImageFoto.Visible := false
   else
   	ImageFoto.Visible := True;

   ImageFirma.Visible := (Not Objeto.dsFirma.DataSet.IsEmpty);

   if Objeto.dsFirma.DataSet.IsEmpty Then
   	ImageFirma.Visible := false
   else
   	ImageFirma.Visible := True;
}

{   if Objeto.Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PF' then}
   GetSqlStr(
   	' select Cve_Per_Jur_Prod'+
      ' from   Producto'+
      ' Where  Cve_Producto = '''+ Objeto.Contrato.FieldByName('CVE_PRODUCTO').asString +'''',
   	Objeto.DataBaseName, Objeto.SessionName, 'CVE_PER_JUR_PROD',s,False);
   if s = 'PF' then
   begin
      lbCombinaciones.visible := False;
      edCombinaciones.visible := False;
      lbCveTipoFirma.Top := lbCombinaciones.Top;
      edCveTipoFirma.Top := edCombinaciones.Top;
   end;
   {edRegimen.text := Objeto.Contrato.FieldByName('CVE_REGIMEN').AsCombo;}
   //q:= Tquery.create(self);
   	q:= GetSqlQuery(
      		' Select Cve_regimen, comb_firmas'+
            ' From   Dv_Contrato'+
            ' Where  Id_Contrato = '+ objeto.Contrato.FieldByName('ID_CONTRATO').asString,
      		Objeto.DataBaseName, Objeto.SessionName, False);
    try
      if q <> nil then begin
         if q.FieldByName('CVE_REGIMEN').asString = 'IN' Then edRegimen.Text := 'INDIVIDUAL'
         else if q.FieldByName('CVE_REGIMEN').asString = 'MA' Then edRegimen.Text := 'MANCOMUNADA'
         else if q.FieldByName('CVE_REGIMEN').asString = 'ID' Then edRegimen.Text := 'INDISTINTA';
         edCombinaciones.Text := q.FieldByName('COMB_FIRMAS').asString;
      end;
   finally
   	q.free;
   end;

  { Activa la opción para eliminar firma de Contratantes }
  If objeto.ValidaAccesoEliminarFirma Then
    btnEliminarFirma.visible:= True;
end;


Procedure TWConCtte.ChangeCtte(Sender: TObject);
Begin btnEliminarFirma.Enabled:= (not objeto.Firma.IsEmpty);
end;

procedure TWConCtte.FormShow(Sender: TObject);
begin
  if Objeto.Ctte.Persona.EsClienteAAA then begin
     iCteAAA.Visible := TRUE;
     iCteAAA.Active := TRUE;
  end//if
  else
     iCteAAA.Destroy;
  Objeto.Ctte.Id_Persona.Control := edIdPersona;
  Objeto.Ctte.Persona.Nombre.Control := edNombre;
  Objeto.Ctte.Cve_Tipo_Firma.Control := edCveTipoFirma;
  Objeto.Ctte.Ctte.Desc_Contratante.Control := edDescContratante;
//Objeto.Contrato.FieldByName('COMB_FIRMAS').Control := edCombinaciones;
  DBNavigator1.DataSource := Objeto.dsCtte;
  ImageFirma.DataSource := Objeto.dsFirma;
  ImageFoto.DataSource := Objeto.dsImagen;
  Objeto.ImagenFirma := ImageFirma;
  Objeto.ImagenFoto  := ImageFoto;

  objeto.OnChangeCtte:= ChangeCtte;

  PostMessage(Handle,WM_DESPUESSHOW,0,0);

  (****  Seguridad -> Permisos sobre los botones fuera de interforma ****)
  BitBtn1.Enabled          := Objeto.ValidaAccesoEsp('CONCTTE_TBTN1',False, False);
  btnEliminarFirma.Enabled := Objeto.ValidaAccesoEsp('CONCTTE_NELIMINA', False, False);

end;

procedure TWConCtte.FormDestroy(Sender: TObject);
begin
   Objeto.Ctte.Id_Persona.Control := nil;
   Objeto.Ctte.Persona.Nombre.Control := nil;
   Objeto.Ctte.Cve_Tipo_Firma.Control := nil;
   Objeto.Ctte.Ctte.Desc_Contratante.Control := nil;
{   Objeto.Contrato.FieldByName('COMB_FIRMAS').Control := edCombinaciones;}
   Objeto.ImagenFirma := nil;
   Objeto.ImagenFoto  := nil;
end;

procedure TWConCtte.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWConCtte.BitBtn1Click(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('CONCTTE_TBTN1',True, True) then
  Begin
      if Objeto.Ctte.Busca then begin
         Objeto.Ctte.QContratante.Locate('ID_PERSONA;CVE_CONTRATANTE',VarArrayOf([Objeto.Ctte.Id_Persona.AsString, Objeto.Ctte.Cve_Contratante.AsString]),
        [loCaseInsensitive]);
      end;
  end;
end;

procedure TWConCtte.ImageFirmaDblClick(Sender: TObject);
var	w: TFirmaCtte;
begin
  w:= TFirmaCtte.Create(self);
  try
    w.Table1.Filter := objeto.Firma.Filter;
    w.Table1.DatabaseName := objeto.Firma.DataBaseName;
    w.Table1.SessionName := objeto.Firma.SessionName;
    w.table1.Active := True;
    if objeto.contrato <> nil then
       w.lbNombre.Caption := Objeto.Contrato.FieldByName('ID_CONTRATO').AsString + '   ' + edNombre.text;
    w.ShowModal;
  finally
    w.free;
  end;
end;

procedure TWConCtte.btnEliminarFirmaClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('CONCTTE_NELIMINA', True, True) then
  Begin
     objeto.ElimiaFirma;
  End;
end;

end.
