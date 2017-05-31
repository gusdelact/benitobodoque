unit IntRFCIVA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, InterEdit, Buttons, IntFrm;

type
  TWRFCIVA = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    idIVA: TInterEdit;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    edRFC: TInterEdit;
    procedure bbCancelarClick(Sender: TObject);
    procedure bbAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    VLRFC : STring;
    VLIVA : Double;
    VLRFCIVA : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var  WRFCIVA: TWRFCIVA;

Procedure Execute_RFCIVA(var PPRFC : STring; var PPIVA : Double; var PPRFCIVA : String; Padre: TInterFrame);

implementation

{$R *.DFM}

Procedure Execute_RFCIVA(var PPRFC : STring; var PPIVA : Double; var PPRFCIVA : String; Padre: TInterFrame);
begin
     WRFCIVA := TWRFCIVA.Create(Padre);
     try
        if PPRFC <> '' then WRFCIVA.edRFC.Text   := PPRFC;
        if PPIVA <> 0  then WRFCIVA.idIVA.Text   := FloatToStr(PPIVA);
        WRFCIVA.ShowModal;
        PPRFC :=  WRFCIVA.VLRFC;
        PPIVA := WRFCIVA.VLIVA;
        PPRFCIVA := WRFCIVA.VLRFCIVA;
     finally
            Application.ProcessMessages;
            WRFCIVA.Free;
            Application.ProcessMessages;
     end;
end;

procedure TWRFCIVA.bbCancelarClick(Sender: TObject);
begin
     close;
end;

procedure TWRFCIVA.bbAceptarClick(Sender: TObject);
begin
     if idIVA.Text = '' then idIVA.Text := '0';
     VLRFC := edRFC.Text;
     VLIVA := StrToFloat(idIVA.Text);
     VLRFCIVA := 'RFC: ' + VLRFC + '   IVA: ' + FormatFloat('###,###,###,###,###,###,###,##0.00',VLIVA);
     close;
end;

procedure TWRFCIVA.FormShow(Sender: TObject);
begin
     edRFC.SetFocus;
end;

end.
