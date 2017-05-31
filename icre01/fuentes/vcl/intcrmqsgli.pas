// Sistema         : Clase de CrMQSGLI
// Fecha de Inicio : 23/10/2009
// Función forma   : Clase de CrMQSGLI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrMQSGLI;              

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,  IntLinkit,
// #1
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrProduct,     //Producto Credito
IntMon,           //Moneda
IntMProdGpo,      //Grupo Producto


// Unidad Adicional para invocar el quick report
IntMQrSegGarLiq,   // Reporte,

// Unidades Adicionales para implementar barra de estus y seguridad al pie de la forma
IntParamCre,
IntGenCre, CheckLst;

Type
 TCrMQSGLI= class;

  TWCrMQSGLI=Class(TForm)
    InterForma1             : TInterForma;
    gbControl: TGroupBox;
    Label6: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    dtpF_CIERRE: TInterDateTimePicker;
    edF_CIERRE: TEdit;
    lbF_CIERRE: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    chbxMoneda: TCheckBox;
    lbAplica: TLabel;
    rgSistema: TRadioGroup;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    edCVE_PRODUCTO_GPO: TEdit;
    lbCVE_PRODUCTO_GPO: TLabel;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edDESC_L_PROD_GPO: TEdit;
    ilGPO_PRODUCTO: TInterLinkit;
    chbxGrupo: TCheckBox;
    chbxF_CIERRE: TCheckBox;
    cbxArchivo: TCheckBox;
    cbCveProd: TCheckListBox;
    cbProducto: TCheckListBox;
    chbxGpoProducto: TCheckBox;
    cbCveGpoProd: TCheckListBox;
    cbGpoProducto: TCheckListBox;
    chbxCveProducto: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edF_CIERREChange(Sender: TObject);
    procedure chbxF_CIERREClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edF_CIERREExit(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilGPO_PRODUCTOEjecuta(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxGrupoClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure chbxCveProductoClick(Sender: TObject);
    procedure chbxGpoProductoClick(Sender: TObject);

    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
      Objeto : TCrMQSGLI;
      VlIndexProd, VlIndexGpoProd : Integer;
end;
 TCrMQSGLI= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
// #2
        ParamCre                 : TParamCre;

        Producto                 : TCrProduct; //Producto
        ProdGpo                  : TMProdGpo;  //Grupo del Producto
        Moneda                   : TMoneda;    //Moneda
        UnidadNegocio            : TUnNegocio; //Sucursal
        Empresa                  : TEmpresa;   //Empresa



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


constructor TCrMQSGLI.Create( AOwner : TComponent );
begin Inherited;
      {
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';
      }
      // #3

      // Moneda
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      // Grupo Producto
      ProdGpo := TMProdGpo.Create(Self);
      ProdGpo.MasterSource:=Self;
      ProdGpo.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      // Producto
      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField :='CVE_PRODUCTO_CRE';

      // Empresa
      Empresa := TEmpresa.Create(Self);

      // Sucursal
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMQSGLI.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMQSGLI.Destroy;
begin

   // #4
   if Producto <> nil then
      Producto.Free;

   if ProdGpo <> nil then
      ProdGpo.Free;

   if Moneda <> nil then
      Moneda.Free;

   if Empresa <> nil then
      Empresa.free;

   if UnidadNegocio <> nil then
      UnidadNegocio.Free;

  inherited;
end;


function TCrMQSGLI.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMQSGLI;
begin
   W:=TWCrMQSGLI.Create(Self);
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


Function TCrMQSGLI.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMQSGLI.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrMQSGLI.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrMQSGLI********************)
(*                                                                              *)
(*  FORMA DE CrMQSGLI                                                            *)
(*                                                                              *)
(***********************************************FORMA CrMQSGLI********************)

procedure TWCrMQSGLI.FormShow(Sender: TObject);
Var qyQuery : TQuery;
    sSQL    : String;
begin
      VlIndexProd := 0;
      // hegc se agrega variable de indice
      VlIndexGpoProd  := 0;

      //Objeto.CAMPO1.Control:=edCAMPO1;
      dtpF_CIERRE.DateTime := Objeto.Apli.DameFechaEmpresaDia('AYER');   //DameFechaEmpresa;
      edF_CIERRE.text := FormatDateTime('dd/mm/yyyy',dtpF_CIERRE.DateTime);

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      // #5

      // Producto
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      // Grupo Producto
      Objeto.ProdGpo.CVE_PRODUCTO_GPO.Control := edCVE_PRODUCTO_GPO;
      Objeto.ProdGpo.DESC_L_PROD_GPO.Control := edDESC_L_PROD_GPO;
      Objeto.ProdGpo.GetParams(Objeto);

      // Moneda
      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;


      // Empresa
      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      // Sucursal
      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      //
      AsignaEmpresaSuc;

      // para llenar el check box list de los productos
      sSQL := 'SELECT CVE_PRODUCTO_CRE, CVE_PRODUCTO_CRE || '' - '' || DESC_L_PRODUCTO AS CVE_PRODUCTO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = ''F'' AND SIT_PRODUCTO = ''AC'' AND ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +' ORDER BY CVE_PRODUCTO_CRE';
      qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
      try
        If qyQuery <> Nil Then
        Begin
             while not(qyQuery.Eof)  do
             begin
                  VlIndexProd := cbProducto.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO').AsString);
                  cbCveProd.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO_CRE').AsString);
                  qyQuery.Next;
             end;
        end;
      finally
           qyQuery.Free;
      end;

      // para llenar el check box del grupo de productos
      sSQL := ' SELECT CVE_PRODUCTO_GPO, CVE_PRODUCTO_GPO || '' - '' || DESC_L_PROD_GPO AS CVE_PRO_GPO_DES FROM CR_PRODUCTO_GPO '+
             ' WHERE CVE_PRODUCTO_GPO IN (SELECT CR_PRODUCTO.CVE_PRODUCTO_GPO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = ''F'' AND SIT_PRODUCTO = ''AC'' AND ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +') ORDER BY CVE_PRODUCTO_GPO ';
      qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
      try
        If qyQuery <> Nil Then
        Begin
             while not(qyQuery.Eof)  do
             begin
                  VlIndexGpoProd := cbGpoProducto.Items.Add(qyQuery.FieldByName('CVE_PRO_GPO_DES').AsString);
                  cbCveGpoProd.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO_GPO').AsString);
                  qyQuery.Next;
             end;
        end;
      finally
           qyQuery.Free;
      end;

end;

procedure TWCrMQSGLI.FormDestroy(Sender: TObject);
begin
    // Objeto.CAMPO1.Control:=nil;
    // Objeto

    // Moneda
    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;

    // Producto
    Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
    Objeto.Producto.DESC_C_PRODUCTO.Control := Nil;

    // Grupo del Producto
    Objeto.ProdGpo.CVE_PRODUCTO_GPO.Control := Nil;
    Objeto.ProdGpo.DESC_L_PROD_GPO.Control := Nil;

    // Empresa
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;

    // Sucursal
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

end;

procedure TWCrMQSGLI.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMQSGLI.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrMQSGLI.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMQSGLI.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrMQSGLI.edF_CIERREChange(Sender: TObject);
begin
    If Trim(edF_CIERRE.Text)<>'' Then Begin
        chbxF_CIERRE.Checked:=True;
        chbxF_CIERRE.Enabled:=True;
    End Else Begin
        chbxF_CIERRE.Checked:=False;
        chbxF_CIERRE.Enabled:=False;
    End;

end;

procedure TWCrMQSGLI.chbxF_CIERREClick(Sender: TObject);
begin
    If not chbxF_CIERRE.Checked Then Begin
        edF_CIERRE.Text:='';
        chbxF_CIERRE.Checked:=False;
        chbxF_CIERRE.Enabled:=False;
    End;
end;

procedure TWCrMQSGLI.InterForma1BtnPreviewClick(Sender: TObject);
begin
       ImprimeReporte(True);
end;

procedure TWCrMQSGLI.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

procedure TWCrMQSGLI.edF_CIERREExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edF_CIERRE,True,'',True);
end;


procedure TWCrMQSGLI.edCVE_MONEDAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TWCrMQSGLI.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TWCrMQSGLI.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TWCrMQSGLI.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
   if Objeto.Producto.Busca then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWCrMQSGLI.btCVE_MONEDAClick(Sender: TObject);
begin
    Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWCrMQSGLI.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.ProdGpo.ShowAll := True;
   if Objeto.ProdGpo.Busca then Begin
        chbxGrupo.Checked:= True;
        chbxGrupo.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWCrMQSGLI.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrMQSGLI.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;

end;

procedure TWCrMQSGLI.ilGPO_PRODUCTOEjecuta(Sender: TObject);
begin

    If Objeto.ProdGpo.FindKey([ilGPO_PRODUCTO.Buffer]) Then Begin
        chbxGrupo.Checked:=True;
        chbxGrupo.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_GPO);
    End;
end;

procedure TWCrMQSGLI.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWCrMQSGLI.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:= False;
        chbxMoneda.Enabled:= False;
    End Else Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
    End;
end;

procedure TWCrMQSGLI.chbxGrupoClick(Sender: TObject);
begin
    If not chbxGrupo.Checked Then Begin
        Objeto.ProdGpo.Active:=False;
        chbxGrupo.Checked:= False;
        chbxGrupo.Enabled:= False;
    End Else Begin
        chbxGrupo.Checked:= True;
        chbxGrupo.Enabled:= True;
    End;
end;

procedure TWCrMQSGLI.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:= False;
        chbxProducto.Enabled:= False;
    End Else Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
    End;
end;

(*********************************************************************************)
(*   Bloque para implementar funcionalidad en los controles de entrada:          *)
(*                                                                               *)
(*                           EMPRESA Y SUCURSAL                                  *)
(*********************************************************************************)
procedure TWCrMQSGLI.AsignaEmpresaSuc;
begin
    Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);

    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';

end;

procedure TWCrMQSGLI.ImprimeReporte(bPreview: Boolean);
Var
    sSistema  :String;  // Sistema : ICRE o CRED
    iSist     :Integer; // para trabajar con el radio group
    //bGenArch  :Boolean;
   VlIndex       : Integer;
   VLPrimero     : Boolean;
   VlProducto    : String;
   VlGpoProducto : String;
begin

    // indica el ordenamiento de los registros presentados en el reporte
    iSist:=rgSistema.ItemIndex;
    case iSist of
        0: sSistema:='ICRE'; //Disposicion
        1: sSistema:='CRED'; //InterCreditos
        2: sSistema:=''; //Ambos
    end;

    // Para la selección de multiples grupos
    VLPrimero := True;
    for VlIndex := 0 to VlIndexGpoProd do
    begin
        cbCveGpoProd.Checked[VlIndex] := cbGpoProducto.Checked[VlIndex];
    end;

    VlGpoProducto := '';
    for VlIndex := 0 to VlIndexGpoProd do
    begin
      if cbCveGpoProd.Checked[VlIndex] then
      begin
           if not(VLPrimero) then
              VlGpoProducto := VlGpoProducto + ','+''''+cbCveGpoProd.Items.Strings[VlIndex]+''''
           else
           begin
              VlGpoProducto := ''''+cbCveGpoProd.Items.Strings[VlIndex]+'''';
              VLPrimero := False;
           end;
      end;
    end;

    // para la selección de multiples productos
    VLPrimero := True;
    for VlIndex := 0 to VlIndexProd do
    begin
      cbCveProd.Checked[VlIndex] := cbProducto.Checked[VlIndex];
    end;

    VlProducto := '';
    for VlIndex := 0 to VlIndexProd do
    begin
      if cbCveProd.Checked[VlIndex] then
      begin
           if not(VLPrimero) then
              VlProducto := VlProducto + ','+''''+cbCveProd.Items.Strings[VlIndex]+''''
            else
            begin
                 VlProducto := ''''+cbCveProd.Items.Strings[VlIndex]+'''';
                 VLPrimero := False;
            end;
      end;
    end;

    
    if (Trim(edF_CIERRE.Text)='')  then
       ShowMessage('Debe indicar la fecha de cierre ...')
    else
    begin

      if Trim(edNbrArch.Text)<>'' then
      begin
        If FileExists(edNbrArch.Text) Then
        Begin
          If (MessageDlg('El archivo indicado ya existe. ¿Desea sobreescribirlo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
            DeleteFile(edNbrArch.Text)
          Else
          Begin
            MessageDlg('Favor de indicar otro archivo Excel ú otra ruta.', mtWarning, [mbOk], 0);
            If edNbrArch.CanFocus Then edNbrArch.SetFocus;
            Exit;
          End;
        End;
      end;

      RepSegGtiaLiq(edF_CIERRE.Text,
                       edCVE_PRODUCTO_CRE.Text  , edCVE_PRODUCTO_GPO.Text   ,
                       edCVE_MONEDA.Text        , sSistema                  ,
                       EdIdEmpresa.Text         , EdIDSucursal.Text         ,
                       edNbrArch.Text           , bPreview                  ,
                       Objeto.Apli              ,
                       VlGpoProducto            , VlProducto                );

      if Trim(edNbrArch.Text)<>'' then
      begin
        // bGenArch : variable que se encuentra en la unidad IntMQrSegGarLiq y ahi se
        // le asigna un valor booleano para desplegar el siguiente mensaje
        if  bGenArch then
           ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
        else
           ShowMessage('No se generó el Archivo')
      end;

    end;
end;

procedure TWCrMQSGLI.cbxArchivoClick(Sender: TObject);
begin
    If not cbxArchivo.Checked Then Begin
        edNbrArch.Text:= '';
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End Else Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End;
end;

procedure TWCrMQSGLI.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.XLS';
  End Else
    edNbrArch.Text := '';

end;

procedure TWCrMQSGLI.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TWCrMQSGLI.chbxCveProductoClick(Sender: TObject);
var VlIndex: Integer;
begin
     for VlIndex := 0 to VlIndexProd do
     begin
          cbProducto.Checked[VlIndex] :=  chbxCveProducto.Checked;
     end;
end;

procedure TWCrMQSGLI.chbxGpoProductoClick(Sender: TObject);
var VlIndex: Integer;
begin
     for VlIndex := 0 to VlIndexGpoProd do
     begin
          cbGpoProducto.Checked[VlIndex] :=  chbxGpoProducto.Checked;
     end;

end;

end.
