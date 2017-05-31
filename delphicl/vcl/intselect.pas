unit IntSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, StdCtrls, ExtCtrls, IntFrm;

type TOnSelectEvent=Procedure(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean) of Object;

type
  TWSelect = class(TForm)
    RadioGroup1: TRadioGroup;
    InterForma1: TInterForma;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OnBusca  :TNotifyEvent;
    OnImprime:TOnSelectEvent;
    OnPreview:TOnSelectEvent;
    Objeto:TInterFrame;
    TodosLosRegistro:Boolean;
    Procedure Busca(Sender:TObject);
    Procedure Imprime(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
    Procedure Preview(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
  end;

var
  WSelect: TWSelect;

Procedure Seleccionar(Objeto:TInterFrame; Titulo:String; Campo1,Campo2,Campo3:TInterCampo; Lab1,Lab2,Lab3:String; EventoBusca:TNotifyEvent;  EventoImprime, EventoPreview:TOnSelectEvent);

implementation

{$R *.DFM}

Procedure Seleccionar(Objeto:TInterFrame; Titulo:String; Campo1,Campo2,Campo3:TInterCampo; Lab1,Lab2,Lab3:String; EventoBusca:TNotifyEvent;  EventoImprime, EventoPreview:TOnSelectEvent);

var Form1:TWSelect;
begin Form1:=TWSelect.Create(nil);
      Try
         if Assigned(EventoBusca)    then Form1.OnBusca:=EventoBusca;
         if Assigned(EventoImprime)  then Form1.OnImprime:=EventoImprime;
         if Assigned(EventoPreview) then Form1.OnPreview:=EventoPreview;
         Form1.Caption:=Titulo;
         Form1.Objeto:=Objeto;
         Form1.TodosLosRegistro:=True;
         if Campo1<>nil
            then begin Campo1.Control:=Form1.Edit1;
                       Form1.Label1.Caption:=Lab1;
                 end
            else begin Form1.Edit1.Visible:=False;
                       Form1.Label1.Visible:=False;
                 end;
         if Campo2<>nil
            then begin Campo2.Control:=Form1.Edit2;
                       Form1.Label2.Caption:=Lab2;
                 end
            else begin Form1.Edit2.Visible:=False;
                       Form1.Label2.Visible:=False;
                 end;
         if Campo3<>nil
            then begin Campo3.Control:=Form1.Edit3;
                       Form1.Label3.Caption:=Lab3;
                 end
            else begin Form1.Edit3.Visible:=False;
                       Form1.Label3.Visible:=False;
                 end;
         Form1.InterForma1.ShowModal;
         if Campo1<>nil
            then Campo1.Control:=nil;
         if Campo2<>nil
            then Campo2.Control:=nil;
         if Campo3<>nil
            then Campo3.Control:=nil;
      Finally Form1.Free;
      end;
end;

procedure TWSelect.InterForma1Imprimir(Sender: TObject);
begin Imprime(Sender,Objeto,TodosLosRegistro,False);
end;

procedure TWSelect.InterForma1Preview(Sender: TObject);
begin Preview(Sender,Objeto,TodosLosRegistro,True);
end;

Procedure TWSelect.Busca(Sender:TObject);
begin if Assigned(OnBusca)
         then OnBusca(Sender)
         else Objeto.Busca;
end;

Procedure TWSelect.Imprime(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
begin if Assigned(OnImprime)
         then OnImprime(Self,eObjeto,eTodosLosRegistros,ePreview)
         else Objeto.PrintReporte(False,TodosLosRegistro);
end;

Procedure TWSelect.Preview(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
begin if Assigned(OnPreview)
       then OnPreview(Self,eObjeto,eTodosLosRegistros,ePreview)
       else Objeto.PrintReporte(True,TodosLosRegistro);
end;


procedure TWSelect.Button1Click(Sender: TObject);
begin Busca(Sender);
end;

procedure TWSelect.RadioGroup1Click(Sender: TObject);
begin Case RadioGroup1.ItemIndex of
      0:begin Edit1.Enabled:=False;
              Edit2.Enabled:=False;
              Edit3.Enabled:=False;
              Label1.Enabled:=False;
              Label2.Enabled:=False;
              Label3.Enabled:=False;
              Button1.Enabled:=False;
              GroupBox1.Enabled:=False;
              TodosLosRegistro:=True;
        end;
      1:begin Edit1.Enabled:=True;
              Edit2.Enabled:=True;
              Edit3.Enabled:=True;
              Label1.Enabled:=True;
              Label2.Enabled:=True;
              Label3.Enabled:=True;
              Button1.Enabled:=True;
              GroupBox1.Enabled:=True;
              TodosLosRegistro:=False;
        end;
      end;
end;

end.
