unit IntCrCalDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,

  //Unidades adiconales
  IntCrProduct, InterEdit, IntGenCre;

type
  TCrCalDia = class(TForm)
    lbPeriodo: TLabel;
    edDIAS: TEdit;
    Label3: TLabel;
    rgPeriodo: TRadioGroup;
    btCalcular: TSpeedButton;
    btAceptar: TBitBtn;
    btCancelar: TBitBtn;
    iedPERIODO: TInterEdit;
    procedure rgPeriodoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     Producto   : TCrProduct;
    { Public declarations }
  end;

var
  CrCalDia: TCrCalDia;

implementation

{$R *.DFM}

procedure TCrCalDia.rgPeriodoClick(Sender: TObject);
begin
   if rgPeriodo.ItemIndex = 0 then
      lbPeriodo.Caption := 'Meses'
   else lbPeriodo.Caption := 'Años';

end;

procedure TCrCalDia.btCancelarClick(Sender: TObject);
begin
   Exit;
end;

procedure TCrCalDia.btCalcularClick(Sender: TObject);
begin
   if iedPERIODO.Text <> '' then
      Begin
         if rgPeriodo.ItemIndex = 0 then
            edDIAS.Text := IntToStr(ConvierteADias(CMES,StrToInt(iedPERIODO.Text)))
         else edDIAS.Text := IntToStr(ConvierteADias(CANO,StrToInt(iedPERIODO.Text)));
         //Eend if
      end
   else ShowMessage('Introduzca un número para realizar el Calculo');
end;

procedure TCrCalDia.FormShow(Sender: TObject);
begin
   iedPERIODO.Text := '0';
end;

end.
