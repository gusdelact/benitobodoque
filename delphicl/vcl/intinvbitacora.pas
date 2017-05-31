// Sistema         : SISTEMA DE INVERSIONES
// Fecha de Inicio : 30/06/1999
// Función forma   : Clase de INV_BITACO
// Diseñado por    : Marcos Zarate Castro

Unit IntInvBitacora;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, InterEdit, UnConInv,
Printers;

Type
 TInvBitaco= class;

  TWInvBitaco=Class(TForm)
    InterForma1             : TInterForma;
    SGCtrl1: TSGCtrl;
    lblRegistros: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1Imprimir(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TInvBitaco;
end;
 TInvBitaco= class(TInterFrame)
      private
         FPagare: TInterFrame;
      protected
         Procedure SetPagare(Pagare : TInterFrame);
      public
        { Public declarations }
        qTransacciones           : TQuery;
        SGCtrl                   : TSGCtrl;
        lblRegistros             : TLabel;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   databasechange;override;
        procedure   RefrescaGrid;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Property    Pagare : TInterFrame Read FPagare Write SetPagare;

      published
      end;

implementation

{$R *.DFM}

constructor TInvBitaco.Create( AOwner : TComponent );
begin Inherited;
      TableName := '';
      qTransacciones := TQuery.Create(Nil);
      FPagare:=Nil;
end;

procedure TInvBitaco.databasechange;
begin inherited;
      qTransacciones.databasename:=databasename;
      qTransacciones.SessionName :=SessionName;
end;

Destructor TInvBitaco.Destroy;
begin if qTransacciones <> nil then qTransacciones.free;
      inherited;
end;

function TInvBitaco.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWInvBitaco;
begin
   W:=TWInvBitaco.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowBtnImprimir:=True;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      SGCtrl      :=W.SGCtrl1;
      lblRegistros:=W.lblRegistros;
      W.InterForma1.ShowBtnAceptar:=False;
      W.InterForma1.ShowBtnEliminar:=False;
      W.InterForma1.ShowBtnNuevo:=False;
      W.InterForma1.ShowBtnCancelar:=False;
      W.InterForma1.ShowBtnAyuda:=False;
      W.InterForma1.ShowBtnBuscar:=False;
      W.InterForma1.ShowBtnModificar:=False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Procedure TInvBitaco.SetPagare(Pagare: TInterFrame);
Begin FPagare:= Pagare;
end;

procedure TInvBitaco.refrescagrid;
begin qTransacciones.disablecontrols;
      qTransacciones.Close;
      qTransacciones.SQL.Text:=
               ' SELECT ' +
               '  INV.ID_TRANS_INV,' +
               '  INV.ID_CONTRATO, ' +
               '  INV.ID_PAGARE, ' +
               '  OPE.DESC_L_ID_PRIM,' +
               '  INV.CVE_USUARIO,' +
               '  INV.FH_REGISTRO,' +
               '  INV.F_VENCIMIENTO,' +
               '  INV.DIAS_PLAZO,' +
               '  INV.IMP_CAPITAL,' +
               '  INV.IMP_INT_VTO,' +
               '  INV.IMP_ISR_VTO,' +
               '  INV.IMP_NETO_VTO,' +
               '  INV.TASA_NETA' +
               ' FROM ' +
               '  INV_TRANSACCION INV, ' +
               '  INV_OPERACION OPE ' +
               ' WHERE ' +
               '  INV.CVE_OPERACION = OPE.CVE_OPERACION AND ' +
               '  INV.ID_CONTRATO = ' + Pagare.FieldByName('ID_CONTRATO').AsString + ' AND ' +
               '  INV.ID_PAGARE   = ' + Pagare.FieldByName('ID_PAGARE').AsString +
               '  ORDER BY INV.ID_TRANS_INV ';

      qTransacciones.Open;

      qTransacciones.FieldByName('ID_TRANS_INV').DisplayLabel  := 'Transacción';
            qTransacciones.FieldByName('ID_TRANS_INV').DisplayWidth  := 8;
      qTransacciones.FieldByName('ID_CONTRATO').DisplayLabel  := 'Contrato';
            qTransacciones.FieldByName('ID_CONTRATO').DisplayWidth  := 10;
      qTransacciones.FieldByName('ID_PAGARE').DisplayLabel  := 'Pagaré';
            qTransacciones.FieldByName('ID_PAGARE').DisplayWidth  := 8;
      qTransacciones.FieldByName('DESC_L_ID_PRIM').DisplayLabel  := 'Operación';
            qTransacciones.FieldByName('DESC_L_ID_PRIM').DisplayWidth  := 30;
      qTransacciones.FieldByName('CVE_USUARIO').DisplayLabel  := 'Usuario';
            qTransacciones.FieldByName('CVE_USUARIO').DisplayWidth  := 10;
      qTransacciones.FieldByName('FH_REGISTRO').DisplayLabel:= 'F.H. Registro';
            qTransacciones.FieldByName('FH_REGISTRO').DisplayWidth:=20;
      qTransacciones.FieldByName('F_VENCIMIENTO').DisplayLabel:= 'F. Vencimiento';
            qTransacciones.FieldByName('F_VENCIMIENTO').DisplayWidth:=15;
      qTransacciones.FieldByName('DIAS_PLAZO').DisplayLabel:= 'Plazo';
            qTransacciones.FieldByName('DIAS_PLAZO').DisplayWidth:=6;
      qTransacciones.FieldByName('IMP_CAPITAL').DisplayLabel:= 'Capital';
            TFloatField(qTransacciones.FieldByName('IMP_CAPITAL')).DisplayFormat:= '$#,##0.00';
            qTransacciones.FieldByName('IMP_CAPITAL').DisplayWidth:=15;
      qTransacciones.FieldByName('IMP_INT_VTO').DisplayLabel:= 'Interés';
            TFloatField(qTransacciones.FieldByName('IMP_INT_VTO')).DisplayFormat:= '$#,##0.00';
            qTransacciones.FieldByName('IMP_INT_VTO').DisplayWidth:=15;
      qTransacciones.FieldByName('IMP_ISR_VTO').DisplayLabel:= 'I.S.R.';
            TFloatField(qTransacciones.FieldByName('IMP_ISR_VTO')).DisplayFormat:= '$#,##0.00';
            qTransacciones.FieldByName('IMP_ISR_VTO').DisplayWidth:=15;
      qTransacciones.FieldByName('IMP_NETO_VTO').DisplayLabel:= 'Neto';
            TFloatField(qTransacciones.FieldByName('IMP_NETO_VTO')).DisplayFormat:= '$#,##0.00';
            qTransacciones.FieldByName('IMP_NETO_VTO').DisplayWidth:=15;
      qTransacciones.FieldByName('TASA_NETA').DisplayLabel:= 'Tasa';
            TFloatField(qTransacciones.FieldByName('TASA_NETA')).DisplayFormat:= '0.000000';
            qTransacciones.FieldByName('TASA_NETA').DisplayWidth:=9;

      if SGCtrl <> nil then
      begin
         SGCtrl.AddQry(qTransacciones,True,True,-1,20,-1,True);
         SGCtrl.UpClick(Nil);
         lblRegistros.Caption:= IntToStr(qTransacciones.RecordCount) +  ' Registro(s)';
      end;
      qTransacciones.Enablecontrols;
end;

(***********************************************FORMA INV_PAGARE********************)
(*                                                                              *)
(*  FORMA DE INV_BITACO                                                           *)
(*                                                                              *)
(***********************************************FORMA INV_PAGARE********************)

procedure TWInvBitaco.FormShow(Sender: TObject);
begin Objeto.RefrescaGrid;
end;

procedure TWInvBitaco.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWInvBitaco.InterForma1Imprimir(Sender: TObject);
begin Objeto.SGCtrl.PageOrientation:= poLandScape;
      Objeto.SGCtrl.Print(True,True,Objeto.Apli);
end;

end.
