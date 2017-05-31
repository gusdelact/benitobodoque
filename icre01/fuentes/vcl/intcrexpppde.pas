// Sistema         : Clase de CrExpPPDe
// Fecha de Inicio : 12/10/2005
// Función forma   : Clase de CrExpPPDe
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrExpPPDe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntParamCre,
IntCrCredito, IntCrSoGtNa, IntCrCbPrPr, IntCrCbDesti,IntCrAcredit;

Type
 TCrExpPPDe= class; 

  TWCrExpPPDe=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit; 
    edDESC_CREDITO : TEdit;
    lbID_SOLICITUD : TLabel; 
    edID_SOLICITUD : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Shape9: TShape;
    Label22: TLabel;
    Shape1: TShape;
    Label18: TLabel;
    sgcDATA: TSGCtrl;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    sgcDatos: TSGCtrl;
    Shape5: TShape;
    Label4: TLabel;
    btnEliminaProp: TBitBtn;
    btnAgregaProp: TBitBtn;
    btnEliminaDes: TBitBtn;
    btnAgregaDes: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btnAgregaPropClick(Sender: TObject);
    procedure btnEliminaPropClick(Sender: TObject);
    procedure btnAgregaDesClick(Sender: TObject);
    procedure btnEliminaDesClick(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure sgcDatosDblClick(Sender: TObject);
    private
    { Private declarations }
       Procedure MuestraDatosProp;
       Procedure MuestraDatosDes;
    public
    { Public declarations }
    Objeto : TCrExpPPDe;
end;
 TCrExpPPDe= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        DESC_CREDITO             : TInterCampo;
        ID_SOLICITUD             : TInterCampo;
        DESC_SOLICITUD           : TInterCampo;

        CrCredito  : TCrCredito;
        CrSoGtNa   : TCrSoGtNa;
        ParamCre   : TParamCre;
        CrCbPrPr   : TCrCbPrPr;
        CrCbDesti  : TCrCbDesti;
        Acreditado : TCrAcredit;

        iIdCredito, iIdSolicitud : Integer;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrExpPPDe.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption:='No. Crédito';
      DESC_CREDITO :=CreaCampo('DESC_CREDITO',ftString,tsNinguno,tsNinguno,False);
                DESC_CREDITO.Caption:='Descripción de Crédito';
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftInteger,tsNinguno,tsNinguno,False);
                ID_SOLICITUD.Caption:='No. Solicitud';
      DESC_SOLICITUD :=CreaCampo('DESC_SOLICITUD',ftString,tsNinguno,tsNinguno,False);
                DESC_SOLICITUD.Caption:='Descripción de Solicitud';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrExpPPDe.Hlp';
      ShowMenuReporte:=True;

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      CrSoGtNa:=  TCrSoGtNa.Create(Self);
      CrSoGtNa.MasterSource:=Self;
      CrSoGtNa.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      CrSoGtNa.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

      CrCbPrPr:= TCrCbPrPr.Create(Self);
      CrCbPrPr.MasterSource:=Self;;

      CrCbDesti:= TCrCbDesti.Create(Self);
      CrCbDesti.MasterSource:=Self;;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
end;

Destructor TCrExpPPDe.Destroy;
begin
   If CrCredito <> Nil Then
      CrCredito.Free;
   If CrSoGtNa <> Nil Then
      CrSoGtNa.Free;
   If CrCbPrPr <> Nil Then
      CrCbPrPr.Free;
   If CrCbDesti<> Nil Then
      CrCbDesti.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
inherited;
end;


function TCrExpPPDe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrExpPPDe;
begin
   W:=TWCrExpPPDe.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir;//ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrExpPPDe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrexppp.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrExpPPDe.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrExpPPDe********************)
(*                                                                              *)
(*  FORMA DE CrExpPPDe                                                            *)
(*                                                                              *)
(***********************************************FORMA CrExpPPDe********************)

procedure TWCrExpPPDe.FormShow(Sender: TObject);
begin
   lbDEmpresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDFecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   InterForma1.BtnImprimir.Visible:=False;
   InterForma1.BtnPreview.Visible:=False;
   InterForma1.BtnAceptar.Visible:=False;

   Objeto.ID_CREDITO.Control:=edID_CREDITO;
   Objeto.DESC_CREDITO.Control:=edDESC_CREDITO;
   Objeto.ID_SOLICITUD.Control:=edID_SOLICITUD;

   Objeto.CrCredito.ID_CREDITO.Control:= edID_CREDITO;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= edDESC_CREDITO;
   Objeto.CrSoGtNa.ID_SOLICITUD.Control:= edID_SOLICITUD;
end;

procedure TWCrExpPPDe.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.DESC_CREDITO.Control:=nil;
   Objeto.ID_SOLICITUD.Control:=nil;
   Objeto.CrCredito.ID_CREDITO.Control:= nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= nil;
   Objeto.CrSoGtNa.ID_SOLICITUD.Control:= nil;
end;

procedure TWCrExpPPDe.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrExpPPDe.InterForma1DespuesShow(Sender: TObject);
begin
   If (Objeto.iIdCredito <> 0)Then Begin
      Objeto.CrCredito.FindKey([Objeto.iIdCredito]);
      If (Objeto.iIdSolicitud<>0)Then
         Objeto.CrSoGtNa.FindKey([Objeto.iIdCredito,Objeto.iIdSolicitud]);
      sgcDATA.SetFocus;
      MuestraDatosProp;
      MuestraDatosDes;
   End;
end;

Procedure TWCrExpPPDe.MuestraDatosProp;
var
   vlQry : TQuery;
   sSQL :String;
begin
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.ID_SOLICITUD.GetFromControl;
   sSQL:='SELECT PP.CVE_PROPOSITO, GPO.VALOR '+
         '  FROM CR_CB_PRO_PROY PP, CR_GRUPO_CLAVE GPO '+
         ' WHERE PP.ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
         '   AND PP.ID_SOLICITUD = '+ Objeto.ID_SOLICITUD.AsSQL +
         '   AND GPO.CVE_GRUPO_CLAVE = ''CVPROP'''+
         '   AND GPO.CVE_REFERENCIA = PP.CVE_PROPOSITO';

   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('CVE_PROPOSITO').DisplayLabel := 'CVE_PROPOSITO' + #30 +'>C';
            vlQry.FieldByName('VALOR').DisplayLabel := 'VALOR' + #30 +'>C';
            vlQry.FieldByName('CVE_PROPOSITO').DisplayWidth := 23;
            vlQry.FieldByName('VALOR').DisplayWidth := 50;
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
End;

Procedure TWCrExpPPDe.MuestraDatosDes;
var vlQry : TQuery; sSQL :String;
begin
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.ID_SOLICITUD.GetFromControl;
   sSQL:='SELECT DES.CVE_DESTINO, GPO.VALOR '+
         '  FROM CR_CB_DESTINO DES, CR_GRUPO_CLAVE GPO '+
         ' WHERE DES.ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
         '   AND DES.ID_SOLICITUD = '+ Objeto.ID_SOLICITUD.AsSQL +
         '   AND GPO.CVE_GRUPO_CLAVE = ''CVEREC'''+
         '   AND GPO.CVE_REFERENCIA = DES.CVE_DESTINO';

   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('CVE_DESTINO').DisplayLabel := 'CVE_DESTINO' + #30 +'>C';
            vlQry.FieldByName('VALOR').DisplayLabel := 'VALOR' + #30 +'>C';
            vlQry.FieldByName('CVE_DESTINO').DisplayWidth := 23;
            vlQry.FieldByName('VALOR').DisplayWidth := 50;
            sgcDatos.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDatos.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
End;

procedure TWCrExpPPDe.btnAgregaPropClick(Sender: TObject);
var sSQL, sClave: String; qyQuery: TQuery;
   Proposito: TCrCbPrPr;
begin
   sSQL:='';
   Objeto.CrCbPrPr.CrGruCla.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''CVPROP''';
   If Objeto.CrCbPrPr.CrGruCla.Busca Then Begin
      sClave:= Objeto.CrCbPrPr.CrGruCla.CVE_REFERENCIA.AsString;
      sSQL:= 'SELECT CVE_PROPOSITO FROM CR_CB_PRO_PROY '+
             ' WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
             '   AND ID_SOLICITUD = '+ Objeto.ID_SOLICITUD.AsSQL+
             '   AND CVE_PROPOSITO ='+ Objeto.CrCbPrPr.CrGruCla.CVE_REFERENCIA.AsSQL;
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> nil Then Begin
         If qyQuery.FieldByName('CVE_PROPOSITO').AsString ='' Then Begin
            Try
               Proposito:= TCrCbPrPr.Create(Nil);
               Proposito.IsCheckSecu := False;
               Proposito.Apli := Objeto.Apli;
               Proposito.Append;
               Proposito.ID_CREDITO.AsInteger:= Objeto.ID_CREDITO.AsInteger;
               Proposito.ID_SOLICITUD.AsInteger:= Objeto.ID_SOLICITUD.AsInteger;
               Proposito.CVE_PROPOSITO.AsString:= sClave;
               Proposito.InternalPost;
            Finally
               Proposito.Free;
            End;
            MuestraDatosProp;
         End Else
            ShowMessage('Ya existe el Propósito para la Solicitud');
         qyQuery.Free;
      End;
   End;
end;

procedure TWCrExpPPDe.btnEliminaPropClick(Sender: TObject);
var CrCbPrPr: TCrCbPrPr;
begin
   If Trim(sgcDATA.CellStr['CVE_PROPOSITO',sgcDATA.SG.Row])<>'' Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      Objeto.ID_SOLICITUD.GetFromControl;      
      Try
         CrCbPrPr:= TCrCbPrPr.Create(Nil);
         CrCbPrPr.IsCheckSecu := False;
         CrCbPrPr.Apli := Objeto.Apli;
         CrCbPrPr.FindKey([Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                          sgcDATA.CellStr['CVE_PROPOSITO',sgcDATA.SG.Row]]);
         CrCbPrPr.Elimina;
      Finally
         CrCbPrPr.Free;
      End;
      MuestraDatosProp;
   End;
end;

procedure TWCrExpPPDe.btnAgregaDesClick(Sender: TObject);
var sSQL, sClave: String; qyQuery: TQuery;
   Destino: TCrCbDesti;
begin
   If Objeto.ID_CREDITO.AsInteger<>0 Then Begin
      Try
         Destino:= TCrCbDesti.Create(Nil);
         Destino.IsCheckSecu := False;
         Destino.Apli := Objeto.Apli;
         Destino.ParamCre:= Objeto.ParamCre;
         Destino.iIdCredito:= Objeto.ID_CREDITO.AsInteger;
         Destino.iIdSolicitud:= Objeto.ID_SOLICITUD.AsInteger;
         Destino.Nuevo;
      Finally
         Destino.Free;
      End;
      MuestraDatosDes;
   End;
   {sSQL:='';
   Objeto.CrCbDesti.CrGruCla.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''CVEREC''';
   If Objeto.CrCbDesti.CrGruCla.Busca Then Begin
      sClave:= Objeto.CrCbDesti.CrGruCla.CVE_REFERENCIA.AsString;
      sSQL:= 'SELECT CVE_DESTINO FROM CR_CB_DESTINO '+
             ' WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
             '   AND ID_SOLICITUD = '+ Objeto.ID_SOLICITUD.AsSQL+
             '   AND CVE_DESTINO ='+ Objeto.CrCbDesti.CrGruCla.CVE_REFERENCIA.AsSQL;
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> nil Then Begin
         If qyQuery.FieldByName('CVE_DESTINO').AsString ='' Then Begin
            Try
               Destino:= TCrCbDesti.Create(Nil);
               Destino.IsCheckSecu := False;
               Destino.Apli := Objeto.Apli;
               Destino.Append;
               Destino.ID_CREDITO.AsInteger:= Objeto.ID_CREDITO.AsInteger;
               Destino.ID_SOLICITUD.AsInteger:= Objeto.ID_SOLICITUD.AsInteger;
               Destino.CVE_DESTINO.AsString:= sClave;
               Destino.InternalPost;
            Finally
               Destino.Free;
            End;
            MuestraDatosDes;
         End Else
            ShowMessage('Ya existe el Propósito para la Solicitud');
         qyQuery.Free;
      End;
   End;}

end;

procedure TWCrExpPPDe.btnEliminaDesClick(Sender: TObject);
var Destino: TCrCbDesti;
begin
   If Trim(sgcDatos.CellStr['CVE_DESTINO',sgcDatos.SG.Row])<>'' Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      Objeto.ID_SOLICITUD.GetFromControl;
      Try
         Destino:= TCrCbDesti.Create(Nil);
         Destino.IsCheckSecu := False;
         Destino.Apli := Objeto.Apli;
         Destino.FindKey([Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                          sgcDatos.CellStr['CVE_DESTINO',sgcDatos.SG.Row]]);
         Destino.Elimina;
      Finally
         Destino.Free;
      End;
      MuestraDatosDes;
   End;
end;

procedure TWCrExpPPDe.sgcDATADblClick(Sender: TObject);
var Proposito: TCrCbPrPr;
begin
   If Trim(sgcDATA.CellStr['CVE_PROPOSITO',sgcDATA.SG.Row])<>'' Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      Objeto.ID_SOLICITUD.GetFromControl;
      Try
         Proposito:= TCrCbPrPr.Create(Nil);
         Proposito.IsCheckSecu := False;
         Proposito.Apli := Objeto.Apli;
         Proposito.ParamCre:= Objeto.ParamCre;
         Proposito.FindKey([Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                          sgcDATA.CellStr['CVE_PROPOSITO',sgcDATA.SG.Row]]);
         Proposito.Consulta;
      Finally
         Proposito.Free;
      End;
   End;
end;

procedure TWCrExpPPDe.sgcDatosDblClick(Sender: TObject);
var Destino: TCrCbDesti;
begin
   If Trim(sgcDatos.CellStr['CVE_PROPOSITO',sgcDatos.SG.Row])<>'' Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      Objeto.ID_SOLICITUD.GetFromControl;
      Try
         Destino:= TCrCbDesti.Create(Nil);
         Destino.IsCheckSecu := False;
         Destino.Apli := Objeto.Apli;
         Destino.ParamCre:= Objeto.ParamCre;
         Destino.FindKey([Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                          sgcDatos.CellStr['CVE_PROPOSITO',sgcDatos.SG.Row]]);
         Destino.Consulta;
      Finally
         Destino.Free;
      End;
   End;
end;

end.
