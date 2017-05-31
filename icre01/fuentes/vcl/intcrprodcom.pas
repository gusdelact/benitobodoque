// Sistema         : Clase de CR_PRODUCTO_COM
// Fecha de Inicio : 13/01/2005
// Función forma   : Clase de CR_PRODUCTO_COM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrProdCom;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, IntLinkit,
//unidades adicionales
IntParamCre,
IntGenCre,
IntCrProduct,
IntCrCatComi
;
Const
   C_CVEPR = 0; //Cve Producto
   C_DESPR = 1; //Descripción Producto
   C_CVECN = 2; //Cve Comisión
   C_DESCN = 3; //Descripcion Comisión
   C_SIT   = 4; //Situación
   
Type
 TCrProdCom= class;

  TWCrProductoCom=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_PRODUCTO_CRE : TLabel;
    edCVE_PRODUCTO_CRE : TEdit;
    lbCVE_COMISION : TLabel;
    edCVE_COMISION : TEdit;
    rgSIT_PRO_COMISION : TRadioGroup;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
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
    btCOMISION: TBitBtn;
    ilCOMISION: TInterLinkit;
    edDESC_COMISION: TEdit;
    Label16: TLabel;
    Label18: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    Label17: TLabel;
    Label19: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label23: TLabel;
    sgDATOS: TStringAlignGrid;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_COMISIONExit(Sender: TObject);
    procedure rgSIT_PRO_COMISIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure sgDATOSClick(Sender: TObject);
    private 
    { Private declarations }
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TCrProdCom;
end;
 TCrProdCom= class(TInterFrame)
      private
      protected

      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_COMISION             : TInterCampo;
        B_PREDETERMINADA         : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_PRO_COMISION         : TInterCampo;
        //clases adicionales
        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Comisiones               : TCrCatComi;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrProdCom.Create( AOwner : TComponent ); 
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Producto';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Cve. Comisión';
      B_PREDETERMINADA :=CreaCampo('B_PREDETERMINADA',ftString,tsNinguno,tsNinguno,True);
                B_PREDETERMINADA.Caption:='Predeterminada';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta Date';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      SIT_PRO_COMISION :=CreaCampo('SIT_PRO_COMISION',ftString,tsNinguno,tsNinguno,True);
      With SIT_PRO_COMISION do
         begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');           ComboDatos.Add(CSIT_AC);
                 ComboLista.Add('1');           ComboDatos.Add(CSIT_CA);
          end;
                SIT_PRO_COMISION.Caption:='Situación';
      FKeyFields.Add('CVE_PRODUCTO_CRE');
      FKeyFields.Add('CVE_COMISION');

      TableName := 'CR_PRODUCTO_COM';
      UseQuery := True;
      HelpFile := 'IntCrProdCom.Hlp';
      ShowMenuReporte:=True;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Comisiones := TCrCatComi.Create(Self);
      Comisiones.MasterSource := self;
      Comisiones.FieldByName('CVE_COMISION').MasterField := 'CVE_COMISION';
end;

Destructor TCrProdCom.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   //end if

   if Comisiones <> nil then
      Comisiones.Free;
   //end if

   inherited;
end;


function TCrProdCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProductoCom;
begin
   W:=TWCrProductoCom.Create(Self);
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


Function TCrProdCom.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPrCom.it','S,S');
      //T := CreaBuscador('ICrPrCn.it','S,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO_CRE.AsString);
                               T.Param(1,CVE_COMISION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_PRODUCTO_COM********************)
(*                                                                              *)
(*  FORMA DE CR_PRODUCTO_COM                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PRODUCTO_COM********************)
procedure TWCrProductoCom.MuestraDatos;
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

   vlsql := ' SELECT  CPC.CVE_PRODUCTO_CRE, ' + coCRLF +
            '         CP.DESC_C_PRODUCTO, ' + coCRLF +
            '         CPC.CVE_COMISION, ' + coCRLF +
            '         CC.DESC_COMISION, ' + coCRLF +
            '         CPC.SIT_PRO_COMISION ' + coCRLF +

            ' FROM CR_PRODUCTO_COM  CPC, ' + coCRLF +
            '      CR_PRODUCTO      CP, ' + coCRLF +
            '      CR_CAT_COMISION  CC ' + coCRLF +

            ' WHERE CPC.CVE_PRODUCTO_CRE  = CP.CVE_PRODUCTO_CRE ' + coCRLF +
            '   AND CPC.CVE_COMISION      = CC.CVE_COMISION ' + coCRLF ;

     if Objeto.CVE_PRODUCTO_CRE.AsString <> CNULL then
        vlsql := vlsql + ' AND CPC.CVE_PRODUCTO_CRE = ' + SQLStr(Objeto.CVE_PRODUCTO_CRE.AsString);
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
             Cells[C_CVECN,nRowCount] := Qry.FieldByName('CVE_COMISION').AsString;
             Cells[C_DESCN,nRowCount] := Qry.FieldByName('DESC_COMISION').AsString;
             Cells[C_SIT,nRowCount]   := Qry.FieldByName('SIT_PRO_COMISION').AsString;

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

procedure TWCrProductoCom.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.CVE_COMISION.Control:=edCVE_COMISION;
      Objeto.SIT_PRO_COMISION.Control:=rgSIT_PRO_COMISION;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      Objeto.Comisiones.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comisiones.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrProductoCom.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.SIT_PRO_COMISION.Control:=nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
      Objeto.Comisiones.DESC_COMISION.Control :=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
end;

procedure TWCrProductoCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProductoCom.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;

   Objeto.Producto.BuscaWhereString := 'CR_PRODUCTO.SIT_PRODUCTO = ' + SQLStr(CSIT_AC);
   Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;

   Objeto.Comisiones.BuscaWhereString := 'CR_CAT_COMISION.SIT_CAT_COMISION = '+ SQLStr(CSIT_AC);
   Objeto.Comisiones.FilterString := Objeto.Comisiones.BuscaWhereString;
   Objeto.B_PREDETERMINADA.AsString := 'F';

   edCVE_PRODUCTO_CRE.SetFocus;
end;

procedure TWCrProductoCom.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODCOM_PROD',True,True) then
   begin
       Objeto.Producto.ShowAll := True;
       if Objeto.Producto.Busca then
          InterForma1.NextTab(edCVE_PRODUCTO_CRE);
       //end if
   end;
end;

procedure TWCrProductoCom.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer])then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   //end if
end;

procedure TWCrProductoCom.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrProductoCom.edCVE_PRODUCTO_CREExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.CVE_PRODUCTO_CRE.GetFromControl;
      If Objeto.CVE_PRODUCTO_CRE.AsString = '' then
      begin
         VLMsg := 'Favor de Indicar la Clave del Producto';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLValida,VLMsg,True);
   end;
end;

procedure TWCrProductoCom.btCOMISIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODCOM_COMIS',True,True) then
   begin
       Objeto.Comisiones.ShowAll := True;
       if Objeto.Comisiones.Busca then
          InterForma1.NextTab(edCVE_COMISION);
       //end if
   end;
end;

procedure TWCrProductoCom.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comisiones.FindKey([ilCOMISION.Buffer]) then
      InterForma1.NextTab(edCVE_COMISION);
   //end if
end;

procedure TWCrProductoCom.ilCOMISIONCapture(Sender: TObject;
  var Show: Boolean);
begin   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrProductoCom.edCVE_COMISIONExit(Sender: TObject);
var     VLSalida : Boolean;
        VlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLSalida := True;
      VLMsg := '';
      Objeto.CVE_COMISION.GetFromControl;
      if Objeto.CVE_COMISION.AsString = '' then
      Begin
         VLSalida := False;
         VLMsg := 'Favor de Indicar la Comisión';
      end;
      InterForma1.ValidaExit(edCVE_COMISION,VlSalida,VlMsg,True);
   end;
end;

procedure TWCrProductoCom.rgSIT_PRO_COMISIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_PRO_COMISION,True,CNULL,True);
end;

procedure TWCrProductoCom.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end;
end;

procedure TWCrProductoCom.InterForma1DespuesAceptar(Sender: TObject);
begin   MuestraDatos;
end;

procedure TWCrProductoCom.InterForma1DespuesShow(Sender: TObject);
begin   MuestraDatos;
end;

procedure TWCrProductoCom.InterForma1DespuesEliminar(Sender: TObject);
begin   MuestraDatos;
end;

procedure TWCrProductoCom.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
      MuestraDatos;
end;

procedure TWCrProductoCom.sgDATOSClick(Sender: TObject);
begin
   Objeto.FindKey([sgDATOS.Cells[C_CVEPR,sgDATOS.Row],sgDATOS.Cells[C_CVECN,sgDATOS.Row]]);
   MuestraDatos;
end;

end.
