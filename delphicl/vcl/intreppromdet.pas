Unit intRepPromDet;
// Sistema CORPORATIVO
// Selecciona documento para filtrar en Consulta de Documentación faltante
// Marcos Zárate Castro  Agosto de 1999
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls,InterFun, ComCtrls,
InterEdit, IntDocto, InterApl, IntLinkit, InterFor;

Type
  TWRepPromDet=Class(TForm)
    pnComision: TPanel;
    rgOpcion: TRadioGroup;
    edCveDocumento: TEdit;
    sbCveDocumento: TSpeedButton;
    edDescDocumento: TEdit;
    lbCveProducto: TLabel;
    InterLinkit1: TInterLinkit;
    InterForma1: TInterForma;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbCveDocumentoClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure rgOpcionExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
    private

    { Private declarations }
    public
    { Public declarations }
    CveDocumento : TInterCampo;
    DocCumplido  : TInterCampo;
    Documento    : TDocumento;
    Apli         : TInterApli;
    TipoCto,
    Filtro       : String;

end;

function SeleccionaDoc(pApli : TInterApli;
                       pTipoCto      : String;
                       pCveDocumento : TInterCampo;
                       pDocCumplido  : TInterCampo):Boolean;

implementation

{$R *.DFM}

function SeleccionaDoc(pApli : TInterApli;
                       pTipoCto      : String;
                       pCveDocumento : TInterCampo;
                       pDocCumplido  : TInterCampo):Boolean;

Var WRepPromDet : TWRepPromDet;
begin SeleccionaDoc:=False;
      WRepPromDet  := TWRepPromDet.Create(Nil);
      try
         WRepPromDet.CveDocumento:= pCveDocumento;
         WRepPromDet.Apli:=pApli;
         WRepPromDet.DocCumplido:=pDocCumplido;
         WRepPromDet.InterForma1.ShowModal;
         SeleccionaDoc:=(WRepPromDet.ModalResult = mrOK);
      finally
         if WRepPromDet <> Nil then WRepPromDet.free;
      end;
end;

procedure TWRepPromDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWRepPromDet.FormShow(Sender: TObject);
begin Documento:=TDocumento.Create(Nil);
      Documento.Apli:=Apli;
      Documento.Cve_Documento.Control:=edCveDocumento;
      Documento.Desc_documento.Control:=edDescDocumento;
      CveDocumento.Control:=edCveDocumento;
      DocCumplido.AsString:='V';
      Filtro:='';

      if TipoCto = 'IFSM'
      then Filtro:=' CVE_CODUMENTO IN(''D151'',''D150'',''D155'',''D154'',''D083'')'
      else if TipoCto = 'IFON'
           then Filtro:=' CVE_DOCUMENTO IN(''D056'',''D055'',''D068'',''D066'',''D083'')'
           else Filtro:=' CVE_DOCUMENTO IN(''D064'',''D062'',''D065'',''D066'',''D067'',''D068'',''D078'',''D083'')';

      Documento.BuscaWhereString:=Filtro;
      Documento.FilterString:=Filtro;
end;

procedure TWRepPromDet.sbCveDocumentoClick(Sender: TObject);
begin Documento.Busca;
end;

procedure TWRepPromDet.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=True;
end;

procedure TWRepPromDet.InterLinkit1Ejecuta(Sender: TObject);
begin Documento.FindKey([InterLinkit1.Buffer]);
end;

procedure TWRepPromDet.rgOpcionExit(Sender: TObject);
begin if rgOpcion.ItemIndex =0
      then DocCumplido.AsString:='V'
      else DocCumplido.AsString:='F';
end;

procedure TWRepPromDet.FormDestroy(Sender: TObject);
begin Documento.Cve_Documento.Control:=nil;
      Documento.Desc_documento.Control:=nil;
      CveDocumento.Control:=nil;
      if Documento <> Nil then Documento.free;
end;

procedure TWRepPromDet.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      if Documento.Active
      then begin
             CveDocumento.GetFromControl;
             ModalResult:=mrOK;
           end
      else ModalResult:=mrCancel;
      Realizado:=True;
      Close;
end;

procedure TWRepPromDet.InterForma1Cancelar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      CveDocumento.AsString:='';
      ModalResult:=mrCancel;
      Realizado:=True;
      Close;
end;

end.





