//-------------------------------------------------------------
// Sistema         :   FoGrid2
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Control de Clase
// Desarrollo por  :   Víctor Martínez Castro/ Leon Orózco
// Comentarios     :
// Modificacion    :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

unit InterGri;

interface

uses
  Classes, Graphics, Forms, DB{, RzCommon};

type
  TFormaTipo = (ftBotonChico,ftBotonGrande);
  TOnBotonEvent = Procedure (Sender : TObject) of Object;

//  TRzLookupDialog = class( TComponent )
  TInterGrid = class( TComponent )
  private
    FOnAlta : TOnBotonEvent;
    FOnModifica : TOnBotonEvent;
    FOnBorrar : TOnBotonEvent;
    FOnBuscar : TOnBotonEvent;
    FOnDetalle : TOnBotonEvent;
    FOnAyuda : TOnBotonEvent;
    FBorderStyle : TFormBorderStyle;
    FCaption : string;
    FDataset : TDataset;
    FHeight : Integer;
    FFont : TFont;
    FNumbersOnly : Boolean;
    FSearchField : string;
    FWidth : Integer;
    FForma : TFormaTipo;
    procedure SetFont( Value : TFont );
  protected
    procedure Notification( AComponent : TComponent;
                            Operation : TOperation ); override;
  public
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function Execute : Boolean;
    Procedure Alta;
    Procedure Modifica;
    Procedure Borrar;
    Procedure Buscar;
    Procedure Detalle;
    Procedure Ayuda;

  published

    Property OnAlta: TOnBotonEvent
      read FOnAlta
      write FOnAlta;

    Property OnModifica : TOnBotonEvent
      read FOnModifica
      write FOnModifica;

    Property OnBorrar : TOnBotonEvent
      read FOnBorrar
      write FOnBorrar;

    Property OnBuscar : TOnBotonEvent
      read FOnBuscar
      write FOnBuscar;

    Property OnDetalle : TOnBotonEvent
      read FOnDetalle
      write FOnDetalle;

    Property OnAyuda : TOnBotonEvent
      read FOnAyuda
      write FOnAyuda;

    property BorderStyle : TFormBorderStyle
      read FBorderStyle
      write FBorderStyle
      default bsSizeable;

    property Caption : string
      read FCaption
      write FCaption;

    property Dataset : TDataset
      read FDataset
      write FDataset;

    property Font : TFont
      read FFont
      write SetFont;

    property Height : Integer
      read FHeight
      write FHeight
      default 400;

    property NumbersOnly : Boolean
      read FNumbersOnly
      write FNumbersOnly;

    property SearchField : string
      read FSearchField
      write FSearchField;

    property Width : Integer
      read FWidth
      write FWidth
      default 500;

    property Forma : TFormatipo
      read FForma
      write FForma
      default ftBotonGrande;

  end;


procedure Register;

implementation

uses
  WinTypes, Controls, fogrid1,fogrid2,dialogs;

{$R *.DCR}

{=============================}
{== TRzLookupDialog Methods ==}
{=============================}

constructor TInterGrid.Create( AOwner : TComponent );
begin
  inherited Create( AOwner );
  FHeight := 400;
  FWidth := 500;
  FBorderStyle := bsSizeable;
  FFont := TFont.Create;
  if Owner is TForm then                               { If Owner is a form... }
    FFont.Assign( TForm( Owner ).Font );      { Use the form's font by default }
  FForma := ftBotonGrande;
end;

destructor TInterGrid.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TInterGrid.Alta;
begin
   if Assigned(FOnAlta) then
      FOnAlta(self);
end;

procedure TInterGrid.Modifica;
begin
   if Assigned(FOnModifica) then
      FOnModifica(self);
end;

procedure TInterGrid.Borrar;
begin
   if Assigned(FOnBorrar) then
      FOnBorrar(self) else Begin
  if MessageDlg('Desea Borrar el registro ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      FDataset.Delete;
   {end if}
   End;
end;

Procedure BuscaWWChico;
Begin
      FormaGrid1.wwLocateDialog1.SearchField :=FormaGrid1.SearchField;
      FormaGrid1.wwLocateDialog1.EXECUTE;
End;

Procedure BuscaWWGrande;
Begin
      FormaGrid2.wwLocateDialog1.SearchField :=FormaGrid2.SearchField;
      FormaGrid2.wwLocateDialog1.EXECUTE;
End;

procedure TInterGrid.Buscar;
begin
   if Assigned(FOnBuscar) then FOnBuscar(self)
      else begin
       Case FForma Of
         ftBotonChico  : BuscaWWChico;
         ftBotonGrande : BuscaWWGrande;
       End;
   End;
end;

procedure TInterGrid.detalle;
begin
   if Assigned(FOndetalle) then
      FOndetalle(self);
end;

procedure TInterGrid.Ayuda;
begin
   if Assigned(FOnAyuda) then
      FOnAyuda(self);
end;

procedure TInterGrid.Notification( AComponent : TComponent;
                                        Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );

  { If FDataset gets removed, clear the reference to avoid GPF! }
  if ( Operation = opRemove ) and ( AComponent = FDataset ) then
    FDataset := nil;
end;


procedure TInterGrid.SetFont( Value : TFont );
begin
  FFont.Assign( Value );
end;

function TInterGrid.Execute : Boolean;

function ExecuteChico : Boolean;
begin
   FormaGrid1 := TFormaGrid1.Create( Application );
   try
      FormaGrid1.Padre:=Self;
      FormaGrid1.BorderStyle := FBorderStyle;
      FormaGrid1.Width := FWidth;
      FormaGrid1.Height := FHeight;
      FormaGrid1.Font := FFont;
      FormaGrid1.Caption := FCaption;
      FormaGrid1.NumbersOnly := FNumbersOnly;
      FormaGrid1.SearchField := FSearchField;
      FormaGrid1.SrcLookup.Dataset := FDataset;
      Result := FormaGrid1.ShowModal = idOK;
   finally
      FormaGrid1.Free;
   End;
end;

function ExecuteGrande : Boolean;
begin
   FormaGrid2 := TFormaGrid2.Create( Application );
   try
      FormaGrid2.Padre:=Self;
      FormaGrid2.BorderStyle := FBorderStyle;
      FormaGrid2.Width := FWidth;
      FormaGrid2.Height := FHeight;
      FormaGrid2.Font := FFont;
      FormaGrid2.Caption := FCaption;
      FormaGrid2.NumbersOnly := FNumbersOnly;
      FormaGrid2.SearchField := FSearchField;
      FormaGrid2.SrcLookup.Dataset := FDataset;
      Result := FormaGrid2.ShowModal = idOK;
   finally
      FormaGrid2.Free;
   End;
end;

begin
   Case FForma Of
      ftBotonChico  : Result := ExecuteChico;
      ftBotonGrande : Result := ExecuteGrande;
   End;
End;



{========================}
{== Register Procedure ==}
{========================}

procedure Register;
begin
  RegisterComponents( 'Inter', [ TInterGrid ] );
end;

end.
