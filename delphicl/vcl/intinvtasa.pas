Unit IntInvTasa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls,InterFun, ComCtrls,
InterEdit, IntDtPk, InterApl,  UnConInv;

Type
  TWInvTasa=Class(TForm)
    bbCancelaElimina: TBitBtn;
    bbAceptaClave: TBitBtn;
    gbAnteriores: TGroupBox;
    iedTasaAnt: TInterEdit;
    Label1: TLabel;
    iedPlazoAnt: TInterEdit;
    Label2: TLabel;
    gbNuevos: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    iedPlazoCalc: TInterEdit;
    iedTasaCalc: TInterEdit;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure bbAceptaClaveClick(Sender: TObject);
    procedure bbCancelaEliminaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    TasaBruta    : Double;
    TasaOrigi    : Double;
    CveAsigTasa  : String;
    F_Hoy        : TDateTime;
    Objeto       : TInterFrame;
end;

function CapturaTasaBruta(pObjeto:TInterFrame;Var pCveAsigTasa:String;Var pTasaBruta : Double;pF_Hoy:TDateTime):Boolean;

implementation

{$R *.DFM}

function CapturaTasaBruta(pObjeto:TInterFrame;Var pCveAsigTasa:String;Var pTasaBruta : Double;pF_Hoy:TDateTime):Boolean;
Var WInvTasa : TWInvTasa;
begin CapturaTasaBruta:=False;
      WInvTasa := TWInvTasa.Create(Nil);
      try
        WInvTasa.Objeto:=pObjeto;
        WInvTasa.F_Hoy:=pF_Hoy;
        WInvTasa.ShowModal;
        pCveAsigTasa:=WInvTasa.CveAsigTasa;
        pTasaBruta:= WInvTasa.TasaBruta;
        CapturaTasaBruta:=(WInvTasa.ModalResult=mrOK);
      finally
         if WInvTasa <> Nil then WInvTasa.free;
      end;
end;

procedure TWInvTasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWInvTasa.bbAceptaClaveClick(Sender: TObject);
Var Valor : Double;
begin if iedTasaCalc.text = ''
      then MessageDlg('Debe asignar una tasa válida',mtError,[mbOK],0)
      else begin
             TasaBruta:=StrToFloat(iedTasaCalc.text);
             Valor:=StrToFloat(iedTasaCalc.text);
             if FloatToStr(Valor) = FloatToStr(TasaOrigi)
             then CveAsigTasa:='AU'
             else CveAsigTasa:='MN';
             ModalResult:=mrOK;
           end;
end;

procedure TWInvTasa.bbCancelaEliminaClick(Sender: TObject);
begin ModalResult:=mrCancel;
end;

procedure TWInvTasa.FormShow(Sender: TObject);
Var vlNuevaTasa : Double;
    vlNuevoPlazo: Integer;
begin iedPlazoAnt.text:=Objeto.FieldByName('DIAS_PLAZO').AsString;
      iedTasaAnt.Text :=Objeto.FieldByName('TASA_NETA').AsString;
      vlNuevoPlazo:=Trunc(F_Hoy - Objeto.FieldByName('F_APERTURA').AsDateTime);
      iedPlazoCalc.text:=FloatToStr(vlNuevoPlazo);

      //Busca la tasa curva Inicial
      BuscaTasaCurva(Objeto.Apli,
                     Objeto.FieldByName('DIAS_PLAZO').AsInteger,
                     Objeto.FieldByName('TASA_NETA').AsFloat,
                     vlNuevoPlazo,
                     vlNuevaTasa);

      iedTasaCalc.text:=FloatToStr(vlNuevaTasa);
      TasaOrigi:=vlNuevaTasa;
      iedTasaCalc.Setfocus;
end;

end.
