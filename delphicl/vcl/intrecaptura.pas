unit IntRecaptura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, InterApl, IntPromedio, UnRecaptura, dbctrls,
  InterEdit;

type
  TwRecaptura = class(TForm)
    Panel1: TPanel;
    lbMensaje: TLabel;
    edImporte: TEdit;
    Image1: TImage;
    Panel2: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    procedure bAceptarClick(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
		Aprox: TPromedio;
		FImporte: Real;
   	FMensaje: String;
		FTipoAprox: TTipoAprox;
   	FResultado: Boolean;

      procedure CambiaColor(Control: TControl; Habilitar: Boolean);
      procedure AsignaFoco(Control: TControl);
  end;

var
  wRecaptura: TwRecaptura;

implementation

{$R *.DFM}

procedure TwRecaptura.FormCreate(Sender: TObject);
begin
	FMensaje:= 'Importe a verificar';
   FResultado:= False;

   Aprox:= TPromedio.Create(nil);
end;

procedure TwRecaptura.FormDestroy(Sender: TObject);
begin If Aprox <> nil then Aprox.Free;
end;


procedure TwRecaptura.FormShow(Sender: TObject);
begin
	edImporte.Text:= ' ';
   edImporte.SetFocus;
   edImporte.CutToClipboard;
   edImporte.Text:= '';
   lbMensaje.Caption:= FMensaje;
end;



procedure TwRecaptura.bAceptarClick(Sender: TObject);
Var
	Importe, LimInf, LimSup: Real;
   EnRango: Boolean;
   Mensaje: String;

begin
	Try Importe:= StrToFloat(edImporte.Text);
	Except
   	MessageDlg('El '''+ FMensaje + ''' no es un numero', mtError, [mbOK], 0);
   	edImporte.SetFocus;
      Exit;
   end;

                 //Height := 220  169

   If Importe = FImporte Then
   Begin
   	FResultado:= True;

      If (FTipoAprox <> taNinguno) and (Aprox.CalculaAprox) Then
		Begin
      	LimInf:= Aprox.Imp_Base.AsFloat - (Aprox.Variacion.AsFloat * (Aprox.Datos.PorMenos / 100));
         LimSup:= Aprox.Imp_Base.AsFloat + (Aprox.Variacion.AsFloat * (Aprox.Datos.PorMas / 100));

         EnRango:= False;
         Mensaje:= '';

         If (Aprox.Datos.PorMenos = -1) and (Aprox.Datos.PorMas = -1) then EnRango:= True
         else
         If (Aprox.Datos.PorMenos = -1) then
         Begin
            If (Importe <= LimSup) Then EnRango:= True;
            Mensaje:= ' maximo es de ' + FormatFloat('###,###,###.00', LimSup);
         end
         else
         If (Aprox.Datos.PorMas = -1) then
         Begin
            If (Importe >= LimInf) Then EnRango:= True;
            Mensaje:= ' minimo es de ' + FormatFloat('###,###,###.00', LimInf);
         end
         else
         Begin
         	If (Importe >= LimInf) and (Importe <= LimSup) Then EnRango:= True;
            Mensaje:= ' es desde ' + FormatFloat('###,###,###.00', LimInf) + ' hasta ' + FormatFloat('###,###,###.00', LimSup);
         end;

         If EnRango Then Close
         else
         Begin
            If MessageDlg('El rango del importe manejado en este contrato para '''+ FMensaje +''''+ Mensaje, mtConfirmation, [mbYES, mbNO], 0) = mrYES Then
               Close;
         end;
      end
      else Close;
   end
   else
   Begin
      MessageDlg('El ' + FMensaje + ' es incorrecto', mtError, [mbOK], 0);
      edImporte.Text:= '';
      edImporte.SetFocus;
   	FResultado:= False;
   end;
end;

procedure TwRecaptura.bCancelarClick(Sender: TObject);
begin
	FResultado:= False;
   Close;
end;

procedure TwRecaptura.CambiaColor(Control: TControl; Habilitar: Boolean);
Var ControlColor, FontColor: TColor;
begin
     If Habilitar Then
   Begin
   	ControlColor:= clWhite;
      FontColor:= clWindowText;
   end
   else
   Begin
   	ControlColor:= clBtnFace;
      FontColor:= clBtnFace;
   end;

	If (Control is TEdit) Then
   Begin
   	With TEdit(Control) do
      Begin
      	Color:= ControlColor;
   	   Font.Color:= FontColor;
      end;
   end
   else
	If (Control is TDBEdit) Then
   Begin
   	With TDBEdit(Control) do
      Begin
      	Color:= ControlColor;
   	   Font.Color:= FontColor;
      end;
   end
   else
	If (Control is TInterEdit) Then
   Begin
   	With TDBEdit(Control) do
      Begin
      	Color:= ControlColor;
   	   Font.Color:= FontColor;
      end;
   end;
end;

procedure TwRecaptura.AsignaFoco(Control: TControl);
Begin
   If (Control is TEdit) Then TEdit(Control).SetFocus
   else If (Control is TDBEdit) Then TDBEdit(Control).SetFocus
   else If (Control is TInterEdit) Then TDBEdit(Control).SetFocus;
end;

end.
