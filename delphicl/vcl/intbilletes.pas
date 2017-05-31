unit IntBilletes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Buttons, IntFrm, InterEdit, Mask;

type
  TWBillete = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Query1: TQuery;
    sbAceptaAdi: TBitBtn;
    Label9: TLabel;
    edImporte: TInterEdit;
    ed1: TMaskEdit;
    ed2: TMaskEdit;
    ed5: TMaskEdit;
    ed10: TMaskEdit;
    ed20: TMaskEdit;
    ed50: TMaskEdit;
    ed100: TMaskEdit;
    edM: TMaskEdit;
    procedure btSalirClick(Sender: TObject);
    procedure sbAceptaAdiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
        FImporte      : Double;
        FImp1         : TInterCampo;
        FImp2         : TInterCampo;
        FImp5         : TInterCampo;
        FImp10        : TInterCampo;
        FImp20        : TInterCampo;
        FImp50        : TInterCampo;
        FImp100       : TInterCampo;
        FImpM         : TInterCampo;
        FResult       : TInterCampo;

  end;

var
  WBillete: TWBillete;

procedure CapturaBillete(pImporte   : Double; 
                         PImp1         : TInterCampo;
                         pImp2         : TInterCampo;
                         pImp5         : TInterCampo;
                         pImp10        : TInterCampo;
                         pImp20        : TInterCampo;
                         pImp50        : TInterCampo;
                         pImp100       : TInterCampo;
                         pImpM         : TInterCampo;
                         pResult       : TInterCampo);
  
implementation

procedure CapturaBillete(pImporte   : Double; 
                         PImp1         : TInterCampo;
                         pImp2         : TInterCampo;
                         pImp5         : TInterCampo;
                         pImp10        : TInterCampo;
                         pImp20        : TInterCampo;
                         pImp50        : TInterCampo;
                         pImp100       : TInterCampo;
                         pImpM         : TInterCampo;
                         pResult       : TInterCampo);
Var WBillete : TWBillete;
begin 
      WBillete := TWBillete.Create(Nil);
      try
         WBillete.FImporte:=pImporte;
         WBillete.FImp1   :=pImp1;
         WBillete.FImp2   :=pImp2;
         WBillete.FImp5   :=pImp5;
         WBillete.FImp10  :=pImp10;
         WBillete.FImp20  :=pImp20;
         WBillete.FImp50  :=pImp50;
         WBillete.FImp100 :=pImp100;
         WBillete.FImpM   :=pImpM;
         WBillete.FResult :=pResult;
         WBillete.edImporte.Text:=FloatToStr(pImporte);
         WBillete.ShowModal;
      finally
         if WBillete <> Nil then WBillete.free;
      end;
END;                         

{$R *.DFM}

procedure TWBillete.btSalirClick(Sender: TObject);
begin
  FImp1.AsFloat  :=0;
  FImp2.AsFloat  :=0;
  FImp5.AsFloat  :=0;
  FImp10.AsFloat :=0;
  FImp20.AsFloat :=0;
  FImp50.AsFloat :=0;
  FImp100.AsFloat:=0;                                            
  FImpM.AsFloat  :=0;
  FResult.AsString:='F';
  Close;
end;

procedure TWBillete.sbAceptaAdiClick(Sender: TObject);
var bTermina:Boolean;
    vSuma:Double;
    V1,V2:String;
begin
  vSuma:=0;
  IF (ed1.Text)  <>'' then vSuma:=StrToFloat(ed1.Text);
  IF (ed2.Text)  <>'' then vSuma:=vSuma+StrToFloat(ed2.Text);
  IF (ed5.Text)  <>'' then vSuma:=vSuma+StrToFloat(ed5.Text);
  IF (ed10.Text) <>'' then vSuma:=vSuma+StrToFloat(ed10.Text);
  IF (ed20.Text) <>'' then vSuma:=vSuma+StrToFloat(ed20.Text);
  IF (ed50.Text) <>'' then vSuma:=vSuma+StrToFloat(ed50.Text);
  IF (ed100.Text)<>'' then vSuma:=vSuma+StrToFloat(ed100.Text);
  IF (edM.Text)  <>'' then vSuma:=vSuma+StrToFloat(edM.Text);
  
  v1:=FloatToStr(vSuma);
  v2:=FloatToStr(FImporte);
  //IF vSuma <> FImporte THEN
  IF v1 <> v2 THEN
  begin
      if MessageDlg('La suma de los billetes no coincide con la operación.'+chr(13)+
                    'La Operación Cambiaria se CANCELARÁ. ¿Desea cancelar la operación?',
                    mtInformation,[mbyes,mbno],0)=mrYes then
      begin
        FImp1.AsFloat  :=0;
        FImp2.AsFloat  :=0;
        FImp5.AsFloat  :=0;
        FImp10.AsFloat :=0;
        FImp20.AsFloat :=0;
        FImp50.AsFloat :=0;
        FImp100.AsFloat:=0;
        FImpM.AsFloat  :=0;
        FResult.AsString:='F';
        bTermina:=True;
      end
      else bTermina:=False;
  end
  else
  begin
      if ed1.Text  ='' then FImp1.AsFloat:=0   else FImp1.AsFloat  :=StrToFloat(ed1.Text);
      if ed2.Text  ='' then FImp2.AsFloat:=0   else FImp2.AsFloat  :=StrToFloat(ed2.Text);  
      if ed5.Text  ='' then FImp5.AsFloat:=0   else FImp5.AsFloat  :=StrToFloat(ed5.Text);
      if ed10.Text ='' then FImp10.AsFloat:=0  else FImp10.AsFloat :=StrToFloat(ed10.Text);  
      if ed20.Text ='' then FImp20.AsFloat:=0  else FImp20.AsFloat :=StrToFloat(ed20.Text);  
      if ed50.Text ='' then FImp50.AsFloat:=0  else FImp50.AsFloat :=StrToFloat(ed50.Text);  
      if ed100.Text='' then FImp100.AsFloat:=0 else FImp100.AsFloat:=StrToFloat(ed100.Text);  
      if edM.Text  ='' then FImpM.AsFloat:=0   else FImpM.AsFloat  :=StrToFloat(edM.Text);
      FResult.AsString:='V';
      bTermina:=True;
  end;
  if bTermina then Close;
end;

procedure TWBillete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

end.
