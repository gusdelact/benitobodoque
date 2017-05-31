// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 24/01/2012
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrBitCheq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
//UNIDADES ADICIONALES
IntParamCre,
IntGenCre,
IntCrAcredit,           // Acreditado
IntCrEmisor,            // Emisor
IntCrCredito,           // Clase Crédito
IntMQrBitCh             // Reporte   
;

Type
 TCrBitCheq= class;

  TWNinguno=Class(TForm)
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
    lbAplica: TLabel;
    cbDisposicion: TCheckBox;
    chCUENTABANCO: TCheckBox;
    rgCVE_TIP_ACRED: TRadioGroup;
    rgCVE_TIP_CHEQ: TRadioGroup;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    ilCREDITO: TInterLinkit;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    btCtaBanco: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);

    procedure btCREDITOClick(Sender: TObject);
    procedure cbDisposicionClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure chCUENTABANCOClick(Sender: TObject);
    procedure edCUENTA_BANCOExit(Sender: TObject);
    private 
    { Private declarations }
      Procedure ImprimeReporte(bPreview:Boolean);     
    public 
    { Public declarations } 
    Objeto : TCrBitCheq;
end; 
 TCrBitCheq= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        VG_ACREDITADO            : String;
        VG_MONEDA                : String;
        VG_DISPOSICION           : String;
        VG_B_DISP_CHQ            : Boolean;
        VG_TIPO_ACRED            : String;
        VG_SUB_DIV               : String;
        VG_TIP_CHEQ              : String;
        VG_CHEQRA                : String;
        VG_BCO_CHQ               : String;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;
        Acreditado               : TCrAcredit;
        Emisor                   : TCrEmisor;


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


constructor TCrBitCheq.Create( AOwner : TComponent ); 
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrBitCheq.Hlp';
      ShowMenuReporte:=True;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource := Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
end;

Destructor TCrBitCheq.Destroy;
begin
   if Acreditado <> nil then
      Acreditado.Free;
   if Emisor <> nil then
      Emisor.Free;
   inherited;
end;


function TCrBitCheq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWNinguno;
begin
   W:=TWNinguno.Create(Self);
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


Function TCrBitCheq.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrBitCheq.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWNinguno.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

//   dtpF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa-30;
//   dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
//   edF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpF_INICIO.DateTime);
//   edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_FINAL.DateTime);

   With Objeto do
   Begin
      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Acreditado.GetParams(Objeto);

      If (VG_ACREDITADO <> '') Then
      begin
        Acreditado.FindKey([VG_ACREDITADO]);
        //Objeto.Persona.BuscaWhereString
//        Acreditado.Persona.BuscaWhereString := 'ID_ACREDITADO = ' + VG_ACREDITADO;
//        Acreditado.Persona.FilterString := Acreditado.Persona.BuscaWhereString;
        edACREDITADO.Text := VG_ACREDITADO;
      end;

      Credito.ID_CREDITO.Control := edID_CREDITO;
      Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_CREDITO;
      Credito.GetParams(Objeto);

      edID_CREDITO.Text := VG_DISPOSICION;
      If Credito.FindKey([VG_DISPOSICION]) then
      begin
        cbDisposicion.Checked := True;
        cbDisposicion.Enabled := True;
      end;

      edCUENTA_BANCO.Text := VG_CHEQRA;
      if VG_CHEQRA <> '' then
      Begin
         chCUENTABANCO.Checked := True;
         chCUENTABANCO.Enabled := True;
      End;

      If VG_TIPO_ACRED = 'AC' Then
         rgCVE_TIP_ACRED.ItemIndex := 0
      Else
         if VG_TIPO_ACRED = 'AP' then
            rgCVE_TIP_ACRED.ItemIndex := 1
         else
            If VG_TIPO_ACRED = 'PR' then
               rgCVE_TIP_ACRED.ItemIndex := 2
            else
               rgCVE_TIP_ACRED.ItemIndex := 3;
      If VG_TIP_CHEQ = 'AD' Then
         rgCVE_TIP_CHEQ.ItemIndex := 0
      else
         If VG_TIP_CHEQ = 'LQ' then
            rgCVE_TIP_CHEQ.ItemIndex := 1
         else
            rgCVE_TIP_CHEQ.ItemIndex := 2;
   end;
end;

procedure TWNinguno.FormDestroy(Sender: TObject);
begin
   With Objeto do
   Begin
      Acreditado.ID_ACREDITADO.Control := nil;
      Acreditado.Persona.Nombre.Control := nil;

      Credito.ID_CREDITO.Control := nil;
      Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
   end;
end;

procedure TWNinguno.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWNinguno.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWNinguno.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWNinguno.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   if Objeto.Acreditado.Busca then
   Begin
     InterForma1.NextTab(edACREDITADO);
   end
   Else
     Objeto.Acreditado.Active := False;
end;

procedure TWNinguno.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   Begin
      cbDisposicion.Checked := True;
      cbDisposicion.Enabled := True;
   end
   Else
   Begin
     edID_CREDITO.Text := '0';
     cbDisposicion.Checked := True;
     cbDisposicion.Enabled := True;
   End;
end;

procedure TWNinguno.cbDisposicionClick(Sender: TObject);
begin
   if not (cbDisposicion.Checked) then
   Begin
      Objeto.Credito.Active := False;
      cbDisposicion.Enabled := False;
      cbDisposicion.Checked := False;
   end;
end;

procedure TWNinguno.ImprimeReporte(bPreview: Boolean);
Var
    sTipoAcred,sTipoCheqra :String;
    iSit :Integer;
Begin
  If (Objeto.Acreditado.Active) and  (Objeto.Acreditado.ID_ACREDITADO.AsString = edACREDITADO.text) then
  begin
    iSit:=rgCVE_TIP_ACRED.ItemIndex;
    case iSit of
        0: sTipoAcred:='AC'; //Acreditado
        1: sTipoAcred:='AP'; //Procampo
        2: sTipoAcred:='PR'; //Proveedor
        3: sTipoAcred:='';   //Indistinto
    end;

    iSit:=rgCVE_TIP_CHEQ.ItemIndex;
    case iSit of
        0: sTipoCheqra:='AD';  //Administrativa
        1: sTipoCheqra:='LQ';  //Liquidacion
        2: sTipoCheqra:='';    //Indistinto
    end;

    RepBitacoraCheq(edACREDITADO.Text, edNOMBRE_ACRED.Text, edId_Credito.Text, edCuenta_Banco.Text,
                          sTipoAcred, sTipoCheqra, Objeto.Apli, bPreview);
  end
  Else
  Begin
    ShowMessage('Debe especificar un Acreditado');
    edACREDITADO.SetFocus;
  End;
end;

procedure TWNinguno.InterForma1BtnPreviewClick(Sender: TObject);
begin
  ImprimeReporte(True);
end;

procedure TWNinguno.chCUENTABANCOClick(Sender: TObject);
begin
   if not ( chCUENTABANCO.Checked ) then
   Begin
      edCUENTA_BANCO.Text  := '';
      chCUENTABANCO.Enabled := False;
      chCUENTABANCO.Checked := False;
   end;
end;

procedure TWNinguno.edCUENTA_BANCOExit(Sender: TObject);
begin
  If edCUENTA_BANCO.Text <> '' then
  begin
    chCUENTABANCO.Checked := True;
    chCUENTABANCO.Enabled := True;
  end;
end;

end.
