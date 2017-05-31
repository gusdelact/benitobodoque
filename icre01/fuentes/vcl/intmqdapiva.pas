// Sistema         : Clase de MQDApIVA
// Fecha de Inicio : 28/06/2010
// Función forma   : Clase de MQDApIVA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : AARJ
// Comentarios     : Forma para implementar el Reporte de Detalle de Aplicación de IVA
Unit IntMQDApIVA;
                         
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
InterEdit,

// Unidades Adicionales  para la implementación de los controles de captura   #1
IntPers,          //Persona
IntCrAcredit,     //Acreditado  , en lugar de esta clase se emplea Persona, ya que recupera acreditados de Icre y de Intercreditos
IntCrCredito,     //Disposición , en lugar de esta clase se emplea el FINDIT  CONSDISP.IT, ya que recupera creditos de Icre y de Intercreditos
IntCrProduct,     //Producto de crédito
IntEmpre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc


// Unidad Adicional para invocar el quick report
IntMQRDetApliVA, // Reporte


// Unidades Adicionales para implementar barra de estus y seguridad al pie de la forma
IntParamCre,
IntGenCre, IntLinkit;

Type
 TMQDApIVA= class;

  TWMQDApIVA=Class(TForm)
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
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edID_CESION: TEdit;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    btID_CESION: TBitBtn;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    edCESION: TEdit;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    ilCesion: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    chbxCESION: TCheckBox;
    chbxAcreditado: TCheckBox;
    lbAplica: TLabel;
    rgTipoConsulta: TRadioGroup;
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
    Label1: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    rgSitPago: TRadioGroup;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edDESC_ID_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure dtpF_IniCloseUp(Sender: TObject);
    procedure dtpF_FinCloseUp(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    private 
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;
        Procedure MuestraFechas( vF_DTM :TDatetime ; Tipo:String);
    public 
    { Public declarations } 
    Objeto : TMQDApIVA;
end; 
 TMQDApIVA= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        // Clases Adicionales    # 2
        // Estas Clases se generan en funcion de los campos - parametros para el reporte
        // si estos son catalogos, entonces se requiere la referencia a la clase para estos
        // CAMPO1                   : TInterCampo;
        ParamCre                 : TParamCre;
        Persona                  : TPersona;
        Acreditado               : TCrAcredit;
        Credito                  : TCrCredito;
        Producto                 : TCrProduct;
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


constructor TMQDApIVA.Create( AOwner : TComponent ); 
begin Inherited;

      // #3 Aqui se crean las clases de los campos de captura para el reporte 
      {CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';
      }
      Persona := TPersona.Create(Self);
      Persona.MasterSource := Self;


      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMQDApIVA.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMQDApIVA.Destroy;
begin
  // #4 Liberacion de las clases que se instancian para los campos de captura
   {If Acreditado <> Nil Then
      Acreditado.Free;
    }
   If Persona <> Nil Then
      Persona.Free;

   If Credito <> Nil Then
      Credito.Free;
   if Producto <> nil then
      Producto.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;

    inherited;
end;


function TMQDApIVA.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMQDApIVA;
begin
   W:=TWMQDApIVA.Create(Self);
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


Function TMQDApIVA.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMQDApIVA.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMQDApIVA.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MQDApIVA********************)
(*                                                                              *)
(*  FORMA DE MQDApIVA                                                            *)
(*                                                                              *)
(***********************************************FORMA MQDApIVA********************)

procedure TWMQDApIVA.FormShow(Sender: TObject);
begin

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      // #5
      //Objeto.CAMPO1.Control:=edCAMPO1;
      {
      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.Acreditado.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;
      }
      
      Objeto.Persona.Id_Persona.Control := edACREDITADO;
      Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;




      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

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

      dtpF_Ini.DateTime := Objeto.Apli.DameFechaEmpresa;
      dtpF_Ini.DateTime := IncMonth(dtpF_Ini.DateTime,-1);
      dtpF_Fin.DateTime := dtpF_Ini.DateTime;

      MuestraFechas(dtpF_Ini.Datetime, 'Inicial');
      MuestraFechas(dtpF_Fin.Datetime, 'Final');

end;

procedure TWMQDApIVA.FormDestroy(Sender: TObject);
begin
// #6
   //Objeto.CAMPO1.Control:=nil;
   //Objeto
   {
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   }
   Objeto.Persona.Id_Persona.Control := nil;
   Objeto.Persona.Nombre.Control := nil;

   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;

   Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
   Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

   // Empresa
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   // Sucursal
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;


end;

procedure TWMQDApIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWMQDApIVA.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMQDApIVA.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMQDApIVA.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMQDApIVA.ImprimeReporte(bPreview: Boolean);
var
    sSitPago   :String;  // Todos   | Pagados | Sin Pagos
    sTipCons   :String;  // Detalle | Global
    iSitPag    :Integer; // para trabajar con el radio group
    iTipCon    :Integer; // para trabajar con el radio group
    vlValida   :Boolean;

begin

    vlValida := True;

    sSitPago := 'T';  // Todos
    sTipCons := 'D';  // Detalle

    iSitPag:= rgSitPago.ItemIndex;
    iTipCon:= rgTipoConsulta.ItemIndex;

    case iSitPag of
        0: sSitPago:='T'; //Todos
        1: sSitPago:='P'; //Pagados
        2: sSitPago:='S'; //Sin Pagos
    end;

    case iTipCon of
        0: sTipCons:='D'; //Detalle
        1: sTipCons:='G'; //Global
    end;

    if (Trim(edF_INICIO.Text)='') or (Trim(edF_FINAL.Text)='')  then
    begin
       ShowMessage('Debe indicar rango de fechas ...');
       vlValida := False;
    end;

    if (dtpF_Ini.DateTime > dtpF_Fin.DateTime ) then
    begin
       ShowMessage('Verifique el rango de fechas... ' + #13#10 +
                   'Fecha incial no puede ser posterior a la fecha final ...');
       vlValida := False;
    end;


    if  vlValida then
    begin

         RepDetAplicIVA(edF_INICIO.Text    , edF_FINAL.Text    ,
                        edACREDITADO.Text  , edID_CREDITO.Text , edCVE_PRODUCTO_CRE.Text ,
                        sSitPago, sTipCons , EdIdEmpresa.Text  , EdIDSucursal.Text ,
                        edNbrArch.Text     , bPreview          , Objeto.Apli       );

         if Trim(edNbrArch.Text)<>'' then
         begin
            // bGenArch : variable que se encuentra en la unidad IntMQrConsImpa y ahi se
            // le asigna un valor booleano para desplegar el siguiente mensaje
            if  bGenArch then
              ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
            else
              ShowMessage('No se generó el Archivo')
         end;
    end;



end;

procedure TWMQDApIVA.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

procedure TWMQDApIVA.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TWMQDApIVA.AsignaEmpresaSuc;
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


procedure TWMQDApIVA.btACREDITADOClick(Sender: TObject);
begin
  // 1
  // Objeto.Acreditado.ShowAll := True;
  // If Objeto.Acreditado.Busca Then Begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;

end;

procedure TWMQDApIVA.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
// 2
   Show := True;
end;

procedure TWMQDApIVA.ilACREDITADOEjecuta(Sender: TObject);
begin
// 3
{
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
}

    If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMQDApIVA.chbxAcreditadoClick(Sender: TObject);
begin
// 4
    If not chbxAcreditado.Checked Then Begin
        Objeto.Persona.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;


procedure TWMQDApIVA.btID_CESIONClick(Sender: TObject);
begin
//1
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMQDApIVA.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
//2
   Show:=True;
end;

procedure TWMQDApIVA.ilCesionEjecuta(Sender: TObject);
begin
// 3
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMQDApIVA.chbxCESIONClick(Sender: TObject);
begin
//4
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TWMQDApIVA.btPRODUCTOClick(Sender: TObject);
begin
//1
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWMQDApIVA.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
// 2
    Show:=True;
end;

procedure TWMQDApIVA.ilPRODUCTOEjecuta(Sender: TObject);
begin
// 3
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWMQDApIVA.chbxProductoClick(Sender: TObject);
begin
//4
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;
end;

procedure TWMQDApIVA.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMQDApIVA.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMQDApIVA.ilEmpresaEjecuta(Sender: TObject);
begin
//
   Objeto.Empresa.FindKey([ilEmpresa.Buffer]);
end;

procedure TWMQDApIVA.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;

end;

procedure TWMQDApIVA.CBSucursalClick(Sender: TObject);
begin
    If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMQDApIVA.sbExcelClick(Sender: TObject);
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

procedure TWMQDApIVA.cbxArchivoClick(Sender: TObject);
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

procedure TWMQDApIVA.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TWMQDApIVA.dtpF_IniCloseUp(Sender: TObject);
begin
  MuestraFechas(dtpF_Ini.Datetime, 'Inicial');
end;



procedure TWMQDApIVA.dtpF_FinCloseUp(Sender: TObject);
begin
  MuestraFechas(dtpF_Fin.Datetime, 'Final');
end;


procedure TWMQDApIVA.MuestraFechas(vF_DTM: TDatetime; Tipo: String);
var vlMesAnio : TdateTime;
     Year, Month, Day :Word;
    vlNumDiasEnelMes : Word;
begin
   if Tipo = 'Inicial' then
     begin
       DecodeDate(dtpF_Ini.DateTime, Year, Month, Day);
       vlMesAnio := EncodeDate(Year, Month, 1);
       dtpF_Ini.DateTime := vlMesAnio;
       //edF_INICIO.Text := DateToStr(vlMesAnio);
       edF_INICIO.Text := FormatDateTime('dd/mm/yyyy',vlMesAnio);
     end
   else
     begin
       DecodeDate(dtpF_Fin.DateTime, Year, Month, Day);
       case Month  of
         1,3,5,7,8,10,12: vlNumDiasEnelMes:= 31;

         2 : begin
               if IsLeapYear(Year) then
                 vlNumDiasEnelMes := 29
               else
                 vlNumDiasEnelMes := 28;
            end;

         4,6,9,11: vlNumDiasEnelMes:= 30;
       end;
       vlMesAnio := EncodeDate(Year, Month, vlNumDiasEnelMes);
       dtpF_Fin.DateTime := vlMesAnio;
       //edF_FINAL.Text := DateToStr(vlMesAnio);
       edF_FINAL.Text := FormatDateTime('dd/mm/yyyy',vlMesAnio);
     end;

end;

procedure TWMQDApIVA.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

procedure TWMQDApIVA.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('CONSDISP.IT'{'ICRDIMCR.IT'},'I');
      Try
        If T.Execute Then
           Begin
             edID_CREDITO.Text := T.DameCampo(0);
             edDESC_ID_CREDITO.Text := T.DameCampo(3); // T.DameCampo(1);
             cbID_CREDITO.Enabled := True;
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;

end;

end.
