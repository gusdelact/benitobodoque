// Sistema         : Sistema de Inversiones
// Fecha de Inicio : 29/01/1999
// Función forma   : Clase de
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zárate Castro
// Comentarios     :
Unit IntSdoXGpoInv;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, UnConDi;

Type
   TSdoXGpo= class;

   TNodo = class
       Id_Contrato : Double;
       Nombre      : String;
   end;

   TWSdoXGpo=Class(TForm)
   InterForma1             : TInterForma;
   TreeViewGrupo: TTreeView;
   ImageList1: TImageList;
   procedure FormShow(Sender : TObject);
   procedure FormClose(Sender : TObject; var Action : TCloseAction);
   private
     {Private declarations }
   public
     {Public declarations }
       Objeto : TSdoXGpo;
   end;

   TSdoXGpo = class(TInterFrame)
   private
       FGrupo: TInterFrame;
   protected
       Procedure SetGrupo(Grupo: TInterFrame);
   public
     { Public declarations }
     tvGrupo : TTreeView;
     qSaldos : TQuery;
     qPagares: TQuery;

     Constructor Create( AOwner : TComponent ); override;
     Destructor  Destroy; override;
     procedure   DatabaseChange; override;
     Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
     Procedure   EliminaNodos(Arbol: TTreeView);
     Function    AgregaNodo(Arbol: TTreeView; Query: TQuery; Tipo: Integer; NodoPadre: TTreeNode): TTreeNode;
     procedure   AbreQuery;
     procedure   AbreDetalle(pId_Contrato: String);
     Procedure   Refresca;
     Property    Grupo : TInterFrame Read FGrupo Write SetGrupo;
     published
     end;

Implementation

{$R *.DFM}

Constructor TSdoXGpo.Create( AOwner : TComponent );
begin Inherited;
      qSaldos := TQuery.Create(Nil);
      qPagares:= TQuery.Create(Nil);
end;

Destructor TSdoXGpo.Destroy;
begin if qSaldos <> Nil then qSaldos.Free;
      if qPagares<> nil then qPagares.Free;
      Inherited;
end;

procedure TSdoXGpo.DatabaseChange;
begin Inherited;
      qSaldos.Databasename:=Databasename;
      qSaldos.SessionName :=SessionName;
      qPagares.Databasename:=Databasename;
      qPagares.SessionName :=SessionName;
end;

Procedure TSdoXGpo.SetGrupo(Grupo: TInterFrame);
begin FGrupo:= Grupo;
end;

Procedure TSdoXGpo.Refresca;
Var Sql   : String;
    Grupo,
    Contrato: TTreeNode;
Begin EliminaNodos(tvGrupo);
      AbreQuery;
      Grupo:=AgregaNodo(tvGrupo, qSaldos,1,nil);
      while not qSaldos.Eof do
      begin
         Contrato:=AgregaNodo(tvGrupo, qSaldos, 2, Grupo);
         AbreDetalle(qSaldos.FieldByName('ID_CONTRATO').AsString);
         while not qPagares.eof do
         begin
           AgregaNodo(tvGrupo, qPagares, 3, Contrato);
           qPagares.Next;
         end;
         qSaldos.Next;
      end;
      tvGrupo.FullExpand;
end;

procedure TSdoXGpo.AbreDetalle(pId_Contrato: String);
Var vlSQL : String;
begin qPagares.Close;
      vlSQL:='Select * ' +
             '  from inv_pagare ' +
             ' where id_contrato = '  + pId_Contrato  + ' and ' +
             '       cve_sit_pagare=''AC''';
      qPagares.Sql.text:=vlSQL;
      qPagares.Open;
end;

procedure TSdoXGpo.AbreQuery;
Var vlSQL : String;
begin qSaldos.Close;
      vlSQL:='Select gpo.folio_grupo, ' +
             '       gpo.desc_grupo,  ' +
             '       gpo.imp_grupo,   ' +
             '       gpo.imp_promgpo_virt, ' +
             '       sdo.id_contrato, ' +
             '       sdo.imp_capital_virt, ' +
             '       sdo.imp_int_virt,  ' +
             '       sdo.imp_isr_virt,  ' +
             '       sdo.val_prom_virt, ' +
             '       sdo.id_contrato, ' +
             '       per.nombre ' +
             '  from inv_grupo gpo, ' +
             '       inv_saldo sdo, ' +
             '       contrato cto,  ' +
             '       persona per ' +
             ' where sdo.folio_grupo = gpo.folio_grupo and ' +
             '       gpo.folio_grupo = '  + Grupo.fieldByName('FOLIO_GRUPO').AsString + ' and ' +
             '       cto.id_contrato = sdo.id_contrato and ' +
             '       per.id_persona  = cto.id_titular';
      qSaldos.Sql.text:=vlSQL;
      qSaldos.Open;

end;

Function TSdoXGpo.ShowWindow(FormaTipo: TFormaTipo):Integer;
var W : TWSdoXGpo;
begin W:=TWSdoXGpo.Create(Self);
      try
      	W.Objeto:= Self;
      	tvGrupo:= W.TreeViewGrupo;
      	W.InterForma1.InterFrame:= Self;
      	W.InterForma1.ShowGrid := False;
      	W.InterForma1.ShowNavigator := False;
      	W.InterForma1.Funcion := FInterFun;
      	W.InterForma1.CentrarForma:= True;
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

Procedure TSdoXGpo.EliminaNodos(Arbol: TTreeView);
Var Indice: Integer;
Begin For Indice:= 0 To Arbol.Items.Count - 1 do
       TNodo(Arbol.Items.Item[Indice].Data).Free;
      Arbol.Items.Clear;
end;

Function TSdoXGpo.AgregaNodo(Arbol: TTreeView; Query: TQuery; Tipo: Integer; NodoPadre: TTreeNode): TTreeNode;
Var  Data: TNodo;
     Nodo: TTreeNode;
Begin Result:= nil;
      Data:= TNodo.Create;
      if Tipo = 2
      then begin
             Data.Nombre := LlenaEspDer('[' + Query.FieldByName('ID_CONTRATO').AsString + ']',13) +
                            LlenaEspDer(Query.FieldByName('NOMBRE').asString,50) +
                            LlenaEspIzq(FormatFloat('$##,##0.00',Query.FieldByName('IMP_CAPITAL_VIRT').AsFloat),20);
             Data.Id_Contrato:= 0;
           end
      else if Tipo = 1
           then begin
                  Data.Nombre := LlenaEspDer('GRUPO: [' + Query.FieldByName('FOLIO_GRUPO').asString  + ']',15) +
                                 LlenaEspDer(Query.FieldByName('DESC_GRUPO').asString,40)  +
                                 LlenaEspIzq(FormatFloat('$##,##0.00',Query.FieldByName('IMP_GRUPO').asfloat),18);
                  Data.Id_Contrato:= Query.FieldByName('ID_CONTRATO').asFloat;
                end
           else begin
                  Data.Nombre := LlenaEspDer('PAGARE: [' + Query.FieldByName('ID_PAGARE').asString  + ']',15) +
                                 LlenaEspIzq(FormatFloat('$##,##0.00',Query.FieldByName('IMP_CAPITAL').asfloat),18);
                  Data.Id_Contrato:= Query.FieldByName('ID_CONTRATO').asFloat;
                end;
      Nodo:= Arbol.Items.AddChildObject(NodoPadre, Data.Nombre, Data);
      case Tipo of
        1: Nodo.ImageIndex:= 0;
        2: Nodo.ImageIndex:= 1;
        3: Nodo.ImageIndex:= 2;
      end;
      Nodo.SelectedIndex:= Nodo.ImageIndex;
      Result:= Nodo;
end;

(***********************************************FORMA ********************)
(***********************************************FORMA ********************)

procedure TWSdoXGpo.FormShow(Sender: TObject);
begin Objeto.Refresca;
end;

procedure TWSdoXGpo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

end.
