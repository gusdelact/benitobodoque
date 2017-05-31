unit IntDtPk;
//-------------------------------------------------------------
// Sistema         :   InterDateTimePicker
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   InterDateTimePicker
// Desarrollo por  :   Víctor Martínez Castro MACV.
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type

  TdfFormato=(dfDate,dfDateTime);

  MacvDatePicker = class(TDateTimePicker)
  private
    { Private declarations }
    FEdit:TEdit;
    FFormato:TDFFormato;
  protected
    { Protected declarations }
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    procedure   InCloseUp(Sender: TObject);
    procedure   InEnter(Sender: TObject);
  published
    Property Edit:TEdit Read FEdit Write FEdit;
    Property Formato:TdfFormato Read FFormato Write FFormato;
    Property TabOrder;
    Property TabStop;
    { Published declarations }
  end;
  TInterDateTimePicker=Class(MacvDatePicker)
  end;

procedure Register;

implementation
Uses UnSubGen;

procedure Register;
begin //RegisterComponents('QReport', [MacvDatePicker]);
      RegisterComponents('Inter', [TInterDateTimePicker]);
end;

procedure   MacvDatePicker.Notification( AComponent : TComponent; Operation : TOperation);
begin if (Operation=OpRemove) and (AComponent=FEdit) then FEdit:=nil;
end;

constructor MacvDatePicker.Create( AOwner : TComponent );
begin Inherited;
      FEdit:=nil;
      FFormato:=dfDate;
      OnCloseUp:=InCloseUp;
      OnEnter:=InEnter;
      SetBounds(Left,Top,21,21);
end;

destructor  MacvDatePicker.Destroy;
begin Inherited;
end;

procedure MacvDatePicker.InCloseUp(Sender: TObject);
begin if Edit<>nil then
      begin if formato=dfDate
               then Edit.Text:=FormatDateTime(ToFecha,Self.Date)
               else Edit.Text:=FormatDateTime(ToFechaHora,Self.Date);
      end;
end;

procedure MacvDatePicker.InEnter(Sender: TObject);
begin Try if Edit<>nil then
          begin if Formato=dfDate
                then begin if Trim(Edit.Text)=''
                           then Self.Date:=Now
                           else Self.Date:=StrToDate(Edit.Text);
                     end
                else begin if Trim(Edit.Text)=''
                           then Self.Date:=Now
                           else Self.Date:=StrToDateTime(Edit.Text);
                     end
          end else Self.Date:=Now;
      Except  Self.Date:=Now;
      end;
end;



end.
