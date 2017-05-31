// Sistema         : Clase de CRDatCoCr
// Fecha de Inicio : 28/12/2004
// Función forma   : Clase de CRDatCoCr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrdatcocr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntSGCtrl,

IntBasicCred;

Type
 TCrdatcocr= class;

  TWCrdatcocr=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SGCtrlDatoComCr: TSGCtrl;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SGCtrlDatoComCrCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure SGCtrlDatoComCrDblClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrdatcocr;
    CadenaSql   : String;

    Procedure   ArmaCadenaSQL;
    Procedure   ReQuery;
    Procedure   PintaRegistrados;    
    Procedure   Comisiones;

end;
 TCrdatcocr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        //variables internas
        vgIdCredito              : Integer;
        vgModComision            : Boolean;

        { Public declarations }


        //Clases Adicionales
        ParamCre                 : TParamCre;
        BasicCred                : TBasicCred;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
Uses IntCrComPro;        //Programación de Comisiones

{$R *.DFM}


constructor TCrdatcocr.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrdatcocr.Hlp';
      ShowMenuReporte:=True;

      BasicCred := TBasicCred.Create(Self);
      BasicCred.MasterSource := Self;

end;

Destructor TCrdatcocr.Destroy;
begin
   If BasicCred <> Nil Then
      BasicCred.Free;
   //end if
   inherited;
end;


function TCrdatcocr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrdatcocr;
begin
   W:=TWCrdatcocr.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrdatcocr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrdatco.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrdatcocr.Reporte:Boolean;
begin //Execute_Reporte();
end;




(***********************************************FORMA CRDatCoCr********************)
(*                                                                              *)
(*  FORMA DE CRDatCoCr                                                            *)
(*                                                                              *)
(***********************************************FORMA CRDatCoCr********************)

procedure TWCrdatcocr.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      ArmaCadenaSQL;
      ReQuery;
      PintaRegistrados;      

end;

procedure TWCrdatcocr.FormDestroy(Sender: TObject);
begin

   //Objeto
end;

procedure TWCrdatcocr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrdatcocr.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrdatcocr.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

Procedure  TWCrdatcocr.ArmaCadenaSQL;
begin
     CadenaSql :=
     //COMISIONES
     ' SELECT CCR.ID_CREDITO, ''COMDIS'' AS TIPO_DATO, NVL(CCO.B_REGISTRO,''F'') AS B_REGISTRO, (''(COMISION): '' || NVL(DESC_COMISION,''DISPOSICIÓN'')) AS DESC_DATOS, '' '' AS REGISTRADO ' +
     ' FROM (SELECT * FROM CR_CREDITO ' +
     '       WHERE ID_CREDITO = ' + IntToStr(Objeto.vgIdCredito) + ' ' +
     '       AND   B_APLICA_COM = ''V'') CCR, ' +
     '      (SELECT ''V'' AS B_REGISTRO, CCO.* ' +
     '       FROM CR_COMIS_PROG CCO ' +
     '       WHERE  ID_CREDITO = ' + IntToStr(Objeto.vgIdCredito) + ' ' +
     '       AND    CVE_COMISION = ''CODI'') CCO, ' +
     '       CR_CAT_COMISION CCC ' +
     ' WHERE CCO.ID_CREDITO   (+)= CCR.ID_CREDITO ' +
     ' AND   CCC.CVE_COMISION (+)= CCO.CVE_COMISION ' +
     //DOCUMENTOS
     ' UNION ALL ' +
     ' SELECT CCR.ID_CREDITO, ''DOCDIS'' AS TIPO_DATO, DECODE(DRT.SIT_RECEP_TRAM,''AU'',''V'',''F'') AS B_REGISTRO, (''(DOCUMENTACION): '' || NVL(DT.DESC_L_TRAMITE,''DISPOSICIÓN''))  AS DESC_DATOS, '' '' AS REGISTRADO ' +
     ' FROM (SELECT * FROM CR_CREDITO ' +
     '       WHERE ID_CREDITO = ' + IntToStr(Objeto.vgIdCredito) + ') CCR, ' +
     '      (SELECT * FROM DO_RECEP_TRAM ' +
     '       WHERE  CVE_MEDIO = ''ALTDIS'' ' +
     '       AND    ID_REFERENCIA = ' + IntToStr(Objeto.vgIdCredito) + ') DRT, ' +
     '       DO_TRAMITE DT ' +
     ' WHERE DRT.ID_REFERENCIA (+)= CCR.ID_CREDITO ' +
     ' AND   DT.CVE_TRAMITE    (+)= DRT.CVE_TRAMITE ';
end;

Procedure  TWCrdatcocr.ReQuery;
var Q : TQuery;
begin
     Q :=  GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
          begin
               //COLUMNAS OCULTAS
               Q.FieldByName('TIPO_DATO').Visible := False;
               Q.FieldByName('B_REGISTRO').Visible := False;
               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('ID_CREDITO').DisplayLabel      := 'Crédito' + #30+'>C';
               Q.FieldByName('DESC_DATOS').DisplayLabel := 'Datos adicionales Asociados a la Disposición' + #30 +'>C';
               Q.FieldByName('REGISTRADO').DisplayLabel      := 'REGISTRADO' + #30+'>C';
               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('ID_CREDITO').DisplayWidth := 8;
               Q.FieldByName('DESC_DATOS').DisplayWidth := 70;
               Q.FieldByName('REGISTRADO').DisplayWidth := 16;
               // LOLS   17/05/2002
               SGCtrlDatoComCr.Titulo1 := 'Resultado de Busqueda';
               SGCtrlDatoComCr.addQry(Q,True,True,-1,-1,-1,True);
               SGCtrlDatoComCr.ColumnByName('REGISTRADO').IsCheck := True;
          end
          else
          begin
               SGCtrlDatoComCr.Clear('NO EXISTEN DATOS ADICIONALES A LA DISPOSICIÓN'#30'>C');
          end;
     finally
          if Q <> nil then
             Q.free;
          //end if
     end;
end;

Procedure   TWCrdatcocr.PintaRegistrados;
var
     MAX,VLCont : Integer;
begin
     MAX := SGCtrlDatoComCr.SG.RowCount;

     for VLCont := 1 to MAX do
     begin
          if SGCtrlDatoComCr.CellStr['B_REGISTRO',VLCont] = 'F' then
          begin
               SGCtrlDatoComCr.CellStr['REGISTRADO',VLCont]:='';
          end
          else
          begin
               SGCtrlDatoComCr.CellStr['REGISTRADO',VLCont]:='SI'+#30+'>C';
          end;
     end;

end;

procedure TWCrdatcocr.SGCtrlDatoComCrCalcRow(Sendet: TObject;  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;  var ShowRow: Boolean);
begin
     Case RoWCaso of
     rcRowBegin : begin if DataSet.FieldByName('B_REGISTRO').AsString='F' then
                        begin
                             SGCtrlDatoComCr.SetFontColor(clRed);
                        end
                        else
                        begin
                             SGCtrlDatoComCr.SetFontColor(-1);
                        end;
                  end;
     end;
end;

procedure TWCrdatcocr.SGCtrlDatoComCrDblClick(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGCtrlDatoComCr.SG.Selection.Left;
     Y:=SGCtrlDatoComCr.SG.Selection.Top;

     //COMISIONES
     if SGCtrlDatoComCr.CellStr['TIPO_DATO',    Y] = 'COMDIS' then
     begin
          Comisiones;
     end;
     //DOCUMENTOS
     if SGCtrlDatoComCr.CellStr['TIPO_DATO',    Y] = 'DOCDIS' then
     begin
          ShowMessage('documentos');
     end;
      ArmaCadenaSQL;
      ReQuery;
      PintaRegistrados;
end;


procedure TWCrdatcocr.Comisiones;
var
    Compro     : TCrComPro;
begin
   Compro := TCrComPro.Create(self);
   try
      Compro.Apli:=Objeto.Apli;     Compro.ParamCre:=Objeto.ParamCre;
      Objeto.BasicCred.LlenaDatos(Objeto.vgIdCredito);
      Compro.BasicCred := Objeto.BasicCred;
      Compro.vgModifica := Objeto.vgModComision;
      Compro.Catalogo;
   finally
          Compro.Free;
   end;
end;

end.
