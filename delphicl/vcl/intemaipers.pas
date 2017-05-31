// Sistema         : Clase de EMAIL_PERSONA
// Fecha de Inicio : 12/07/1999
// Función forma   : Clase de EMAIL_PERSONA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Martinez Castro
// Comentarios     :
Unit IntEmaiPers;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMPers, IntPers;

Type
 TEmaiPers= class; 

  TWEmailPersona=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_PERSONA : TLabel;
    edID_PERSONA : TEdit;
    lbE_MAIL : TLabel;
    edE_MAIL : TEdit;
    GroupBox1: TGroupBox;
    lbPAGER_PIN: TLabel;
    edPAGER_PIN: TEdit;
    lbPAGER_PROV: TLabel;
    cbPAGER_PROV: TComboBox;
    edNombrePersona: TEdit;
    Label1: TLabel;
    bContrato: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bContratoClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TEmaiPers;
end;
 TEmaiPers= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_PERSONA               : TInterCampo;
        E_MAIL                   : TInterCampo;
        PAGER_PIN                : TInterCampo;
        PAGER_PROV               : TInterCampo;
        Contrato                 : TInterFrame;
        Persona                  : TMPersona;
        PersonaBusca             : String;
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


constructor TEmaiPers.Create( AOwner : TComponent );
begin Inherited;
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Número de Persona';
      E_MAIL :=CreaCampo('E_MAIL',ftString,tsNinguno,tsNinguno,True);
        E_MAIL .Size:=60;
                E_MAIL.Caption:='E Mail';
      PAGER_PIN :=CreaCampo('PAGER_PIN',ftString,tsNinguno,tsNinguno,True);
        PAGER_PIN .Size:=16;
                PAGER_PIN.Caption:='Pager Pin';
      PAGER_PROV :=CreaCampo('PAGER_PROV',ftString,tsNinguno,tsNinguno,True);
        PAGER_PROV .Size:=16;
        PAGER_PROV.Caption:='Pager Prov';
        With PAGER_PROV do
        begin UseCombo:=True;
              ComboDatos.Add('');  ComboLista.Add('');
              ComboDatos.Add('1'); ComboLista.Add('Digitel');
              ComboDatos.Add('2'); ComboLista.Add('SkyTel');
              ComboDatos.Add('3'); ComboLista.Add('IUSABeep');
              ComboDatos.Add('4'); ComboLista.Add('TelBeep');
              ComboDatos.Add('5'); ComboLista.Add('TechTel');
        end;
      FKeyFields.Add('ID_PERSONA');

      TableName := 'EMAIL_PERSONA';
      UseQuery := True;
      HelpFile := 'IntEmaiPers.Hlp';
      ShowMenuReporte:=True;
      Contrato:=nil;

      Persona                  :=TMPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.ID_PERSONA.MasterField:='ID_PERSONA';

      PersonaBusca:='';
      IsCorp:=True;
end;

Destructor TEmaiPers.Destroy;
begin if Persona<>nil then Persona.Free; Persona:=nil;
      inherited;

end;


function TEmaiPers.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWEmailPersona;
begin
   W:=TWEmailPersona.Create(Self);
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


Function TEmaiPers.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IEmaPer.it','F');
      Try if Active then begin T.Param(0,ID_PERSONA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TEmaiPers.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA EMAIL_PERSONA********************)
(*                                                                              *)
(*  FORMA DE EMAIL_PERSONA                                                            *)
(*                                                                              *)
(***********************************************FORMA EMAIL_PERSONA********************)

procedure TWEmailPersona.FormShow(Sender: TObject);
begin //Objeto.ID_PERSONA.Control:=edID_PERSONA;
      Objeto.Persona.ID_PERSONA.Control:=edID_PERSONA;
      Objeto.Persona.Nombre.Control:=edNombrePersona;
      Objeto.E_MAIL.Control:=edE_MAIL;
      Objeto.PAGER_PIN.Control:=edPAGER_PIN;
      Objeto.PAGER_PROV.Control:=cbPAGER_PROV;
      if (Objeto.Contrato<>nil) and (Objeto.Contrato.Active)
      then begin Objeto.FindKey([Objeto.Contrato.FieldByName('ID_TITULAR').AsString]);
                 if Not Objeto.Active
                 then begin Objeto.Persona.FindKey([Objeto.Contrato.FieldByName('ID_TITULAR').AsString]);
                            Objeto.PersonaBusca:=Objeto.Contrato.FieldByName('ID_TITULAR').AsString;
                      end;
           end;

end;

procedure TWEmailPersona.FormDestroy(Sender: TObject);
begin
     Objeto.Persona.ID_PERSONA.Control:=nil;
     Objeto.Persona.Nombre.Control:=nil;

     Objeto.E_MAIL.Control:=nil;
     Objeto.PAGER_PIN.Control:=nil;
     Objeto.PAGER_PROV.Control:=nil;
   //Objeto
end;

procedure TWEmailPersona.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWEmailPersona.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
      if Objeto.PersonaBusca<>''
      then Objeto.Persona.FindKey([Objeto.PersonaBusca]);
end;

procedure TWEmailPersona.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWEmailPersona.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;




procedure TWEmailPersona.bContratoClick(Sender: TObject);
var Per:TPErsona;
begin Per:=TPersona.Create(Self);
      Try Per.Apli:=Objeto.Apli;
          if Objeto.Active then Per.FindKey([Objeto.ID_PERSONA.AsString]);
          Per.Busca;
          Objeto.PersonaBusca:='';
          if Per.Active
          then begin if Not Objeto.FindKey([Per.ID_PERSONA.AsString])
                     then Objeto.PersonaBusca:=Per.ID_PERSONA.AsString;
               end;
      Finally Per.Free;
      end;
end;

end.
