// Sistema         : Clase de CR_PROD_SEC_CONT
// Fecha de Inicio : 04/01/2007
// Función forma   : Clase de CR_PROD_SEC_CONT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrPrSeCo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//UNIDADES ADICONALES
IntParamCre,      //PARAMETRO
IntCrProduct,
IntGenCre,
IntLinkit, Grids, Aligrid            //PRODUCTO

;

Const
   C_CVEPR = 0; //Cve Producto
   C_DESPR = 1; //Descripción Producto
   C_CVECN = 2; //Cve Comisión
   C_DESCN = 3; //Descripcion Comisión
   C_SIT   = 4; //Situación
   
Type
 TCrPrSeCo= class; 

  TWCrProdSecCont=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_PRODUCTO_CRE : TLabel;
    edDESC_L_PROD_CRE: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPRODUCTO: TInterLinkit;
    Label16: TLabel;
    Label1: TLabel;
    Label23: TLabel;
    Label4: TLabel;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    sgDATOS: TStringAlignGrid;
    cbCVE_SECTOR_CONTAB: TComboBox;
    Label2: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure cbCVE_SECTOR_CONTABExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations }
       Function ListaSector: String;
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TCrPrSeCo;
end;
 TCrPrSeCo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_SECTOR_CONTAB        : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPrSeCo.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Clave de Producto Cre';
      CVE_SECTOR_CONTAB :=CreaCampo('CVE_SECTOR_CONTAB',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_CONTAB.Caption:='Clave de Sector Contab';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta Date';

      FKeyFields.Add('CVE_PRODUCTO_CRE');
      FKeyFields.Add('CVE_SECTOR_CONTAB');

      TableName := 'CR_PROD_SEC_CONT';
      UseQuery := True;
      HelpFile := 'IntCrPrSeCo.Hlp';
      ShowMenuReporte:=True;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='CVE_PRODUCTO_CRE';

end;

Destructor TCrPrSeCo.Destroy;
begin
      if Producto <> nil then
         Producto.Free;
      //end if
   inherited;
end;


function TCrPrSeCo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProdSecCont;
begin
   W:=TWCrProdSecCont.Create(Self);
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


Function TCrPrSeCo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPrSC.it','S,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO_CRE.AsString);
                               T.Param(1,CVE_SECTOR_CONTAB.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_PROD_SEC_CONT********************)
(*                                                                              *)
(*  FORMA DE CR_PROD_SEC_CONT                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PROD_SEC_CONT********************)

procedure TWCrProdSecCont.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.CVE_SECTOR_CONTAB.Control:=cbCVE_SECTOR_CONTAB;
      Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_L_PROD_CRE;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;

      Objeto.Producto.GetParams(Objeto);

      ListaSector;
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrProdSecCont.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.CVE_SECTOR_CONTAB.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
   //Objeto
end;

procedure TWCrProdSecCont.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProdSecCont.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edCVE_PRODUCTO_CRE.SetFocus;

end;

procedure TWCrProdSecCont.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;



procedure TWCrProdSecCont.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRSECO_PRDCRE',True,True) then
   begin
       Objeto.Producto.ShowAll := True;
       If Objeto.Producto.Busca then
          InterForma1.NextTab(edCVE_PRODUCTO_CRE);
       //end if
   end;
end;

procedure TWCrProdSecCont.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   //end if
end;

procedure TWCrProdSecCont.edCVE_PRODUCTO_CREExit(Sender: TObject);
Var     VLValida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     VLMsg := '';
     VLValida := True;
     Objeto.CVE_PRODUCTO_CRE.GetFromControl;
     If Objeto.CVE_PRODUCTO_CRE.AsString = '' then
     Begin
           VLMsg := 'Favor de introducir el producto a configurar ';
           VLValida := False;
      end;
      MuestraDatos;
     InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLValida,VLMsg,True);
   end;
end;

function TWCrProdSecCont.ListaSector: String;
Var Q       : TQuery;
    vlSql   : String;
Begin
   cbCVE_SECTOR_CONTAB.Items.Clear;
   Q := TQuery.Create(Self);
   Try
       Q.SessionName := Objeto.SessionName;
       Q.DataBaseName := Objeto.DataBaseName;
       Q.SQL.Clear;
       Q.SQL.Add(' SELECT CVE_SECTOR, DESC_SECTOR ' +
                 ' FROM SECTOR ' +
                 ' WHERE CVE_TIPO_SECTOR = ''SS''' +
                 ' ORDER BY CVE_TIPO_SECTOR ');
       Q.Open;

       While Not Q.Eof Do
         Begin
            cbCVE_SECTOR_CONTAB.Items.Add(Q.FieldByName('CVE_SECTOR').AsString);
            Q.Next;
         End;
   Finally
     If Assigned(Q) Then
      Begin
         Q.Close;
         Q.Free;
      End;
   End;

end;

procedure TWCrProdSecCont.cbCVE_SECTOR_CONTABExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbCVE_SECTOR_CONTAB,True,'',True);
end;

procedure TWCrProdSecCont.MuestraDatos;
Var Qry         : TQuery;
    i,nRowCount : Integer;
    vlSql       : String;
begin
   with sgDATOS do
   begin
      ClearGrid(sgDATOS);
      Application.ProcessMessages;
      for i:= 0 to RowCount-1 do
         RemoveRow(Row);
      //end for
   end;
   Application.ProcessMessages;

   vlsql := ' SELECT  CPS.CVE_PRODUCTO_CRE, ' + coCRLF +
            '         CP.DESC_C_PRODUCTO, ' + coCRLF +
            '         CPS.CVE_SECTOR_CONTAB, ' + coCRLF +
            '         SE.DESC_SECTOR ' + coCRLF +

            ' FROM CR_PROD_SEC_CONT CPS, ' + coCRLF +
            '      CR_PRODUCTO      CP, ' + coCRLF +
            '      SECTOR  SE ' + coCRLF +

            ' WHERE CPS.CVE_PRODUCTO_CRE  = CP.CVE_PRODUCTO_CRE ' + coCRLF +
            '   AND CPS.CVE_SECTOR_CONTAB = SE.CVE_SECTOR ' + coCRLF ;

     if Objeto.CVE_PRODUCTO_CRE.AsString <> CNULL then
        vlsql := vlsql + ' AND CPS.CVE_PRODUCTO_CRE = ' + SQLStr(Objeto.CVE_PRODUCTO_CRE.AsString);
     //end if;

  nRowCount := 0;
  with Objeto do
  Begin
    Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    begin
       while Not Qry.Eof Do
       begin
          with sgDATOS do
          begin
             //LLENA EL RENGLON
             Cells[C_CVEPR,nRowCount] := Qry.FieldByName('CVE_PRODUCTO_CRE').AsString;
             Cells[C_DESPR,nRowCount] := Qry.FieldByName('DESC_C_PRODUCTO').AsString;
             Cells[C_CVECN,nRowCount] := Qry.FieldByName('CVE_SECTOR_CONTAB').AsString;
             Cells[C_DESCN,nRowCount] := Qry.FieldByName('DESC_SECTOR').AsString;
//             Cells[C_SIT,nRowCount]   := Qry.FieldByName('SIT_PRO_COMISION').AsString;

             nRowCount := nRowCount + 1;     //Incrementa un reglon
          end;
          Qry.Next;
          sgDATOS.RowCount := nRowCount + 1;
          Application.ProcessMessages;
       end; //end While
    end;
  end;
  if Assigned(Qry) then
  begin
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TWCrProdSecCont.InterForma1DespuesAceptar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrProdSecCont.InterForma1DespuesCancelar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrProdSecCont.InterForma1Buscar(Sender: TObject);
begin
  if objeto.Busca then
     MuestraDatos;
end;

end.
