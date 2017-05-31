// Sistema         : Clase de CRBITPROD
// Fecha de Inicio : 18/08/2014
// Función forma   : Clase de CRBITPROD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntCrbitprod;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntLinkit,
IntCrProduct,     //Producto de crédito
IntParamCre, IntSGCtrl, QuickRpt, InterMemo,
QRExport,
IntMQrBitPr
;


Type
 TCrbitprod= class;

  TWCrbitprod=Class(TForm)
    InterForma1             : TInterForma;
    lblCredito: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edDESC_C_PRODUCTO: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    lblFechaAlta: TLabel;
    Label3: TLabel;
    edFIniAlta: TEdit;
    stpInicioAlta: TInterDateTimePicker;
    Label4: TLabel;
    edFFinAlta: TEdit;
    stpFinAlta: TInterDateTimePicker;
    chkFechaAlta: TCheckBox;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btnProducto: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);

    procedure LimpiaDatosProd;
    procedure ConsultaBitProd;
    procedure ImprimeReporte(bPreview:Boolean);
    procedure btnProductoClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);

    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrbitprod;

    VGSQLGenCons         : String;
end;
 TCrbitprod= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre        : TParamCre;

        Producto        : TCrProduct;

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


constructor TCrbitprod.Create( AOwner : TComponent );
begin Inherited;
    Producto :=  TCrProduct.Create(Self);
    Producto.MasterSource:=Self;
    Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';

    StpName  := ' ';
    UseQuery := False;
    HelpFile := 'IntCrbitprod.Hlp';
    ShowMenuReporte:=True;
end;

Destructor TCrbitprod.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   //end if;

  inherited;
end;


function TCrbitprod.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrbitprod;
begin
   W:=TWCrbitprod.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrbitprod.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrbitpr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrbitprod.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRBITPROD********************)
(*                                                                              *)
(*  FORMA DE CRBITPROD                                                            *)
(*                                                                              *)
(***********************************************FORMA CRBITPROD********************)

procedure TWCrbitprod.FormShow(Sender: TObject);
begin
      //Objeto
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    //InterForma1.BtnImprimir.Visible := False;
    //InterForma1.BtnPreview.Visible  := False;

    Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_C_PRODUCTO;
    Objeto.Producto.GetParams(Objeto);
end;

procedure TWCrbitprod.FormDestroy(Sender: TObject);
begin
   //Objeto
    Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
end;

procedure TWCrbitprod.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrbitprod.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrbitprod.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrbitprod.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrbitprod.LimpiaDatosProd;
begin
  edCVE_PRODUCTO_CRE.Text := '';
  edDESC_C_PRODUCTO.Text     := '';
  Objeto.Producto.CVE_PRODUCTO_CRE.IsNull;
  Objeto.Producto.DESC_C_PRODUCTO.IsNull;
end;



procedure TWCrbitprod.btnProductoClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRBITPROD_BPRO',True,True) then
   Begin
        with objeto do
        begin
            Producto.ShowAll := True;

            If Producto.Busca Then Begin
                chbxProducto.Checked := True;
                chbxProducto.Enabled := True;
                InterForma1.NextTab(edCVE_PRODUCTO_CRE);
            End
            else
            begin
                LimpiaDatosProd;
            end;
        end;
   end;
end;

procedure TWCrbitprod.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWCrbitprod.ilPRODUCTOEjecuta(Sender: TObject);
begin
    with objeto do
    begin
        If Producto.FindKey([ilPRODUCTO.Buffer]) Then Begin
            chbxProducto.Checked:=True;
            chbxProducto.Enabled:=True;
            Producto.GetParams(Objeto);
            InterForma1.NextTab(edCVE_PRODUCTO_CRE);
        End
        else
        begin
            LimpiaDatosProd;
        end;
    end;
end;

procedure TWCrbitprod.ConsultaBitProd;
var
    Q            : TQuery;
begin
    VGSQLGenCons := '';
    VGSQLGenCons := ' SELECT ' + #13 +
                    ' ID_BITACORA, ' + #13 +
                    ' CVE_USUARIO, ' + #13 +
                    ' FH_REGISTRO, ' + #13 +
                    ' NOM_TABLA, ' + #13 +
                    ' CAMPOSLLAVE, ' + #13 +
                    ' SUBSTR(DESC_MODIF, 1, 2000) AS DESC_MODIF ' + #13 +
                    ' FROM ' + #13 +
                    ' CR_BITACORA_UPD ' + #13 +
                    ' WHERE ' + #13 +
                    '       NOM_TABLA = ''CR_PRODUCTO'' ' + #13;

    //FILTROS
    if chbxProducto.checked then
    begin
        VGSQLGenCons := VGSQLGenCons + '   AND CAMPOSLLAVE LIKE ''%'' || ' + #39 + edCVE_PRODUCTO_CRE.Text + #39 + ' || ''%'' ' + #13;
    end;

    if chkFechaAlta.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons +
                        '   AND TRUNC(FH_REGISTRO)        BETWEEN TO_DATE(' + #39 + edFIniAlta.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' +
                        '   AND TO_DATE(' + #39 + edFFinAlta.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13;
    end;

    //ORDEN
    VGSQLGenCons := VGSQLGenCons + ' ORDER BY CAMPOSLLAVE, FH_REGISTRO';

{
     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     //Q.SQL.SaveToFile('c:\VGSQLGenCons.txt');
     try
          if Q <> nil then
          begin
               //TNumericField( Q.FieldByName('Importe Bruto') ).DisplayFormat:= '0,00.00';
               //TNumericField( Q.FieldByName('IVA') ).DisplayFormat:= '0,00.00';
               //TWideStringField( Q.FieldByName('DESC_MODIF') ).DisplayText;
               sgcData.addQry(Q,True,True,-1,-1,-1,True);
          end
          else
          begin
               sgcData.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;
}     
end;

procedure TWCrbitprod.InterForma1BtnPreviewClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRBITPROD_BPREV',True,True) then
   Begin
       //Validaciones
       if  ( chbxProducto.checked     )
       and ( edCVE_PRODUCTO_CRE.Text = '' ) then
       begin
               ShowMessage('Para buscar por Producto debe seleccionar uno, rectifique.');
               Exit;
       end;

       if ( chkFechaAlta.checked ) then
       begin
           try
               if (StrToDate(edFIniAlta.Text) > StrToDate(edFFinAlta.Text)) then
               begin
                   ShowMessage('La "Fecha de Registro" inicial no debe ser mayor a la final, rectifique.');
                   Exit;
               end;
           except
               On E: Exception Do Begin
                   ShowMessage('El dato capturado para Fecha Registro es incorrecto, rectifique.');
                   abort;
               end;
           end;
       end;

       //Consulta
       ConsultaBitProd;
       ImprimeReporte(True);
   end;
end;

Procedure TWCrbitprod.ImprimeReporte(bPreview:Boolean);
begin

    RepBitacora(VGSQLGenCons, edFIniAlta.Text, edFFinAlta.Text, '', Objeto.Apli, bPreview);

{   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente.')
      Else
        ShowMessage('No se generó el Archivo.')
   End;}
End;


procedure TWCrbitprod.InterForma1BtnImprimirClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRBITPROD_BIMP',True,True) then
   Begin
       //Validaciones
       if  ( chbxProducto.checked     )
       and ( edCVE_PRODUCTO_CRE.Text = '' ) then
       begin
               ShowMessage('Para buscar por Producto debe seleccionar uno, rectifique.');
               Exit;
       end;

       if ( chkFechaAlta.checked ) then
       begin
           try
               if (StrToDate(edFIniAlta.Text) > StrToDate(edFFinAlta.Text)) then
               begin
                   ShowMessage('La "Fecha de Registro" inicial no debe ser mayor a la final, rectifique.');
                   Exit;
               end;
           except
               On E: Exception Do Begin
                   ShowMessage('El dato capturado para Fecha Registro es incorrecto, rectifique.');
                   abort;
               end;
           end;
       end;

       //Consulta
       ConsultaBitProd;
       ImprimeReporte(False);
   end;
end;

end.
