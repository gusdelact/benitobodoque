// Sistema         : Clase de CrGenVto
// Fecha de Inicio : 05/04/2008
// Función forma   : Clase de CrGenVto
// Desarrollo por  : DEINTEC.DF.
// Diseñado por    : Ana Lilia Escalona Sosa
Unit IntCrGenVto;

interface  

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,IntSGCtrl,Menus,
//unidades adicionales
IntParamCre, IntGenCre, IntCrCesion;

Type
 TCrGenVto= class;

  TWCrGenVto=Class(TForm)
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
    SGClBusMovNoAut: TSGCtrl;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    lbID_CONTRATO: TLabel;
    iedID_CONTRATO: TInterEdit;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    PopupMenu1: TPopupMenu;
    AgregarPeriodo1: TMenuItem;
    BorrarPeriodo1: TMenuItem;
    ModificarMonto1: TMenuItem;
    Label22: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    lbIMP_CREDITO: TLabel;
    btAGREGA_CUOTA: TBitBtn;
    btREINICIA_TABLA: TBitBtn;
    btVALIDA_TABLA: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    lbTOT_PER_INT: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    lbTOT_PER_CAP: TLabel;
    lbTOT_PER_COM: TLabel;
    Label11: TLabel;
    edIMP_CREDITO: TInterEdit;
    Label2: TLabel;
    lbTOT_IMP_CAP: TLabel;
    lbIMP_DISP: TLabel;
    Label10: TLabel;
    lbIMP_FALTANTE: TLabel;
    OpenDialog1: TOpenDialog;
    textIMPORTE_CESION: TLabel;
    text_AJ_ULTIMO_PER: TLabel;
    BitBtn1: TBitBtn;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    textFVencimiento: TLabel;
    edIMPORTE_CESION: TInterEdit;
    edAJU_ULTIMO_PER: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure SGClBusMovNoAutCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure AgregarPeriodo1Click(Sender: TObject);
    procedure AgregarPeriododeInters1Click(Sender: TObject);
    procedure btAGREGA_CUOTAClick(Sender: TObject);
    procedure BorrarPeriodo1Click(Sender: TObject);
    procedure btREINICIA_TABLAClick(Sender: TObject);
    procedure BorrarPeriododeInters1Click(Sender: TObject);
    procedure ModificarMonto1Click(Sender: TObject);
    procedure btVALIDA_TABLAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure edIMP_CREDITOExit(Sender: TObject);
    procedure edIMP_CREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edIMPORTE_CESIONExit(Sender: TObject);
    procedure edAJU_ULTIMO_PERExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    private
    { Private declarations }
       vgCountCap               : Integer;
       vgImpCap                 : Double;
       vgCountIn                : Integer;
       vgCountCo                : Integer;

    public
    { Public declarations }
    Objeto : TCrGenVto;

    Procedure   ValidaTabla(PPIDCredito : Integer);
    Procedure   AgregaCuota(PPAccesorio : String);
    Procedure   EliminaCuota(PPNumCuota : Integer;PPAccesorio : String);
    Procedure   ModImpCuota(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
    Procedure   ArmaTabla;
    Procedure   LimpiaTabla;
    Procedure   ArmaCadenaSQLCuotas;
    Procedure   ReQueryCuotas;
    Function    ValidaDato(pDato: String): Boolean;
    Procedure   ValidaSitCred;
    Procedure   RestauraTabla;
    Function    FindCredOrigen : Boolean;
    Function    CargaTablaPYME( sFileName : TFileName ): Integer;
    Procedure   RecalcPlazos;

end;
 TCrGenVto= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        vgCesion                 : String;
        ID_CESION                : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        DESC_L_PRODUCTO          : TInterCampo;

        IMP_CUOTA                : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        SIT_CREDITO              : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        AJU_ULTIMO_PER           : TInterCampo;


        ParamCre                 : TParamCre;
        VGCredito                : Integer;
        VGCredRenuev             : Integer;
        CadenaSql                : String;
        VGFolioTabla             : Integer;
        VGCveAccesorioAdd        : String;
        VGCveAccion              : String;
        Cesion                   : TCrCesion;
        ObjectForm               : TWCrGenVto;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

const 
  C_SEPARATOR = ',';
  C_TOKEN_TEXTO = '"';

  C_NUM_AMORT    = 'Numero de Amortización';
  C_FECHA_AMORT  = 'Fecha de Amortización';
  C_TIPO_CUOTA   = 'Tipo de Cuota';
  C_MONTO_AMORT  = 'Monto de Amortización';

  C_TBPYME_CP    = 'CP';
  C_TBPYME_IN    = 'IN';
  C_TBPYME_CPIN  = 'CPIN';
   C_AMORT0 = '0';     //NO APLICA  OPERACIONES FUERA DE BALANCE
   C_AMORT1 = '1';     //AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
   C_AMORT2 = '2';     //AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
   C_AMORT3 = '3';	   //AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
   C_AMORT4 = '4';	   //AMORTIZACIÓN  ÚNICA AL VENCIMIENTO


implementation

{$R *.DFM}


constructor TCrGenVto.Create( AOwner : TComponent );
begin Inherited;
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Cesión';

      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
                ID_CONTRATO.Caption:='Contrato / Producto';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Clave de Producto';
      DESC_L_PRODUCTO :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_L_PRODUCTO.Caption:='Descripción Larga';
      IMP_CUOTA :=CreaCampo('IMP_CUOTA',ftFloat,tsNinguno,tsNinguno,False);
                IMP_CUOTA.Caption:='IMP_CUOTA';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      SIT_CREDITO :=CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,False);
                SIT_CREDITO.Caption:='Situación Credito';
      IMP_CREDITO :=CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_CREDITO.Caption:='IMP_CREDITO';
      AJU_ULTIMO_PER:=CreaCampo('AJU_ULTIMO_PER',ftFloat,tsNinguno,tsNinguno,False);
                AJU_ULTIMO_PER.Caption:='Ajuste Ultimo Periodo';
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrgencuot.Hlp';
      ShowMenuReporte:=True;

      FKeyFields.Add('ID_CESION');

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource:=Self;
      Cesion.FieldByName('ID_CESION').MasterField:='ID_CESION';
end;

Destructor TCrGenVto.Destroy;
begin inherited;
end;


function TCrGenVto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGenVto;
begin
   W:=TWCrGenVto.Create(Self);
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


Function TCrGenVto.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrgencu.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CrGenCuota********************)
(*                                                                              *)
(*  FORMA DE CrGenCuota                                                            *)
(*                                                                              *)
(***********************************************FORMA CrGenCuota********************)

Procedure  TWCrGenVto.RecalcPlazos;
var STPRecalPlazo  : TStoredProc;
begin
     try
          STPRecalPlazo:=TStoredProc.Create(Nil);
          STPRecalPlazo.DatabaseName:=Objeto.Apli.DatabaseName;
          STPRecalPlazo.SessionName:=Objeto.Apli.SessionName;
          STPRecalPlazo.StoredProcName:='PKGCRCREDITO.STPRECALCPLAZO_VPN';
          STPRecalPlazo.Params.CreateParam(ftInteger,'peIdCesion',ptInput);
          STPRecalPlazo.Params.CreateParam(ftString ,'peB_Aut',ptInput);
          STPRecalPlazo.Params.CreateParam(ftString ,'peBCommit',ptInput);
          STPRecalPlazo.Params.CreateParam(ftFloat,'psResultado',ptOutput);
          STPRecalPlazo.Params.CreateParam(ftString,'psTxResultado',ptOutput);

          STPRecalPlazo.Prepare;
          STPRecalPlazo.ParamByName('peIdCesion').AsInteger := Objeto.VGCredito;
          STPRecalPlazo.ParamByName('peB_Aut').AsString := 'F';
          STPRecalPlazo.ParamByName('peBCommit').AsString := 'V';
          STPRecalPlazo.ExecProc;
          if (STPRecalPlazo.ParamByName('psResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL RECALCULAR PLAZOS: ' + IntToStr(STPRecalPlazo.ParamByName('psResultado').AsInteger) + STPRecalPlazo.ParamByName('psTxResultado').AsString);
     finally
            STPRecalPlazo.Free;
     end;
end;

Procedure TWCrGenVto.ValidaSitCred;
begin
   if ( Objeto.SIT_CREDITO.AsString = 'AC' ) or
      ( Objeto.SIT_CREDITO.AsString = 'CA' ) then
   Begin
      AgregarPeriodo1.Enabled := False;
      BorrarPeriodo1.Enabled := False;
      ModificarMonto1.Enabled := False;

      btAGREGA_CUOTA.Enabled := False;
      btREINICIA_TABLA.Enabled:= False;
      btVALIDA_TABLA.Enabled := False;
   end
   else
   Begin
      AgregarPeriodo1.Enabled := Objeto.Cesion.Credito.CVE_AMORTIZACION.AsInteger = 3;
      BorrarPeriodo1.Enabled := Objeto.Cesion.Credito.CVE_AMORTIZACION.AsInteger = 3;
      IF ( Objeto.Cesion.Credito.CVE_AMORTIZACION.AsInteger = 3 ) or
         ( Objeto.Cesion.Credito.CVE_AMORTIZACION.AsInteger = 2 ) then
         ModificarMonto1.Enabled := True;

      btAGREGA_CUOTA.Enabled := false;
      btREINICIA_TABLA.Enabled:= True;
      btVALIDA_TABLA.Enabled := True;
   end;
end;

Function TWCrGenVto.ValidaDato(pDato: String): Boolean;
var vlResult : Boolean;
begin
   vlResult := True;
   if pDato = '' then
   Begin
      ShowMessage('Favor de Indicar el número de Periodo');
      vlResult := False;
   end;
   ValidaDato := vlResult;
end;

Procedure   TWCrGenVto.ValidaTabla(PPIDCredito : Integer);
var STPObtSuc  : TStoredProc;
begin
     lbIMP_FALTANTE.Font.Color := clActiveCaption;
     lbIMP_FALTANTE.Caption := '0';
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPVALIDAAMORTMER';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSDiferencia',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := PPIDCredito;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
          begin
               if (STPObtSuc.ParamByName('PSResultado').AsInteger = 2) then
               Begin
                  ShowMessage(STPObtSuc.ParamByName('PSTXResultado').AsString + ' (' +  FormatFloat('###,###,###,###,##.00',STPObtSuc.ParamByName('PSDiferencia').AsFloat) + ') ');
                  lbIMP_FALTANTE.Caption := FormatFloat('###,###,###,###,##.00',STPObtSuc.ParamByName('PSDiferencia').AsFloat);
                  lbIMP_FALTANTE.Font.Color := clRed;
               end
               else
                  ShowMessage(STPObtSuc.ParamByName('PSTXResultado').AsString);
          end
          else
          Begin
              ShowMessage('La tabla de amortización está OK');
              lbIMP_FALTANTE.Font.Color := clActiveCaption;
              lbIMP_FALTANTE.Caption := '0';
          end;

     finally
            STPObtSuc.Free;
     end;
end;

Procedure   TWCrGenVto.ModImpCuota(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
var STPObtSuc  : TStoredProc;
    VLTipoAcc  : String;
begin
      if PPAccesorio = 'CP' then
         VLTipoAcc := ' Capital '
      else
         VLTipoAcc := ' Interés ';
      //end if;

     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;

          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPMODIMPCONCEPTOSMER';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
          STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
          STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;

          STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;
          STPObtSuc.ParamByName('PEImpCuota').AsFloat := PPImpCuota;

          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL MODIFICAR CUOTA ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
            btAGREGA_CUOTA.Caption:= 'Aplicar Cambios';
     end;
end;

Procedure   TWCrGenVto.EliminaCuota(PPNumCuota : Integer;PPAccesorio : String);
var STPObtSuc  : TStoredProc;
    VLTipoAcc  : String;
begin
      if PPAccesorio = 'CP' then
         VLTipoAcc := ' Capital '
      else
         VLTipoAcc := ' Interés ';
      //end if;

      if MessageDlg('¿Desea Eliminar cuota No. ' + IntToStr(PPNumCuota) + ' de ' + VLTipoAcc + '?. ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           try
                STPObtSuc:=TStoredProc.Create(Nil);
                STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
                STPObtSuc.SessionName:=Objeto.Apli.SessionName;

                STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPELIMINACONCEPTOSMER';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
                {if PPAccesorio = 'CP' then
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
                else
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;}
                //end if;
                STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;

                STPObtSuc.ExecProc;
                if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
                     ShowMessage('PROBLEMAS AL BORRAR CUOTA: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
                //end if;
           finally
                  STPObtSuc.Free;
           end;
      end;
end;


Procedure  TWCrGenVto.AgregaCuota(PPAccesorio : String);
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPAGREGACONCEPTOSMER';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
          STPObtSuc.Params.CreateParam(ftDateTime,'PEFVencimiento',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveDireccion',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
          STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
          {if PPAccesorio = 'CP' then
             STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
          else
             STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;}
          //end if;
          STPObtSuc.ParamByName('PEFVencimiento').AsDateTime := Objeto.F_VENCIMIENTO.AsDateTime;
          STPObtSuc.ParamByName('PECveDireccion').AsString := 'D0';
          STPObtSuc.ParamByName('PEImpCuota').AsFloat := Objeto.IMP_CUOTA.AsFloat;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL AGREGAR CUOTA: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;

Procedure  TWCrGenVto.ArmaTabla;
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPGENCRCONCEPTOSMER';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIdCredito',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PEImporteAjuste',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIdCredito').AsInteger := Objeto.VGCredito;
          STPObtSuc.ParamByName('PEImporteAjuste').AsFloat := StrToFloat(edAJU_ULTIMO_PER.Text);
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL ARMAR TABLA DE DISPOSICIÓN: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;

Procedure TWCrGenVto.LimpiaTabla;
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPLIMPIATABLACUOTA';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL LIMPIAR LA TABLA DE DISPOSICIÓN: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;

procedure TWCrGenVto.RestauraTabla;
var stpResTab  : TStoredProc;
begin
     try
          stpResTab:=TStoredProc.Create(Nil);
          stpResTab.DatabaseName:= Objeto.Apli.DatabaseName;
          stpResTab.SessionName:= Objeto.Apli.SessionName;
          stpResTab.StoredProcName:='PKGCRCUOTAS.STPREESPERIODCR';
          stpResTab.Params.CreateParam(ftInteger,'peIdCredito',ptInput);
          stpResTab.Params.CreateParam(ftString,'peBCommit',ptInput);
          stpResTab.Params.CreateParam(ftFloat,'psResultado',ptOutput);
          stpResTab.Params.CreateParam(ftString,'psTxResultado',ptOutput);
          stpResTab.Prepare;
          stpResTab.ParamByName('peIdCredito').AsInteger := Objeto.VGCredito;
          stpResTab.ParamByName('peBCommit').AsString := 'V';
          stpResTab.ExecProc;
          if (stpResTab.ParamByName('psResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL RESTAURAR TABLA DE PERIODOS: ' +
               IntToStr(stpResTab.ParamByName('psResultado').AsInteger) +
                        stpResTab.ParamByName('psTXResultado').AsString);
          //end if;
     finally
            stpResTab.Free;
     end;
end;

Procedure  TWCrGenVto.ArmaCadenaSQLCuotas;
begin

     Objeto.CadenaSql := ' SELECT ' +
                         '        FEC.F_VENCIMIENTO, ' +
                         '        FEC.F_PROG_PAGO, ' +
                         #39 + '   ' + #39 + ' AS B1, ' +
                         '        CCP.NUM_PERIODO AS NUM_PERIODO_CP, ' +
                         '        CCP.PLAZO       AS PLAZO_CP, ' +
                         '        CCP.IMP_CUOTA   AS IMP_CUOTA_CP, ' +
                         '        CCP.SIT_CAPITAL AS SIT_CAPITAL_CP, ' +
                         #39 + '   ' + #39 + ' AS B2, ' +
                         '        CIN.NUM_PERIODO AS NUM_PERIODO_IN, ' +
                         '        CIN.PLAZO       AS PLAZO_IN, ' +
                         '        CIN.IMP_CUOTA   AS IMP_CUOTA_IN, ' +
                         '        CIN.SIT_CAPITAL AS SIT_CAPITAL_IN, ' +                   //##DEINTEC.DF   21.MAYO.DF
                         #39 + '   ' + #39 + ' AS B3, ' +
                         '        (CCP.IMP_CUOTA + CIN.IMP_CUOTA) AS TOTAL ' +                   //##DEINTEC.DF   21.MAYO.DF
                         ' FROM ' +
                         '      CR_SOL_CUOTA CCP, ' +
                         '      CR_SOL_CUOTA CIN, ' +
                         '      (SELECT DISTINCT(F_VENCIMIENTO) AS F_VENCIMIENTO, F_PROG_PAGO, ID_REF_SOL_CUOTA ' +
                         '       FROM CR_SOL_CUOTA ' +
                         '       WHERE ID_REF_SOL_CUOTA = ' + IntToStr(Objeto.VGCredito) + ') FEC ' +
                         ' WHERE CCP.ID_REF_SOL_CUOTA(+)= FEC.ID_REF_SOL_CUOTA ' +
                         '   AND CCP.CVE_ACCESORIO(+)   = '+#39+'CP'+#39+
                         '   AND CCP.F_VENCIMIENTO(+)   = FEC.F_VENCIMIENTO ' +
                         '   AND CIN.ID_REF_SOL_CUOTA(+)= FEC.ID_REF_SOL_CUOTA ' +
                         '   AND CIN.CVE_ACCESORIO(+)   = '+#39+'IN'+#39+
                         '   AND CIN.F_VENCIMIENTO(+)   = FEC.F_VENCIMIENTO ' +
                         ' ORDER BY FEC.F_VENCIMIENTO ';
end;
//**********************************
Procedure  TWCrGenVto.ReQueryCuotas;
var Q : TQuery;
begin
     vgCountCap := 0;
     vgImpCap   := 0;
     vgCountIn  := 0;
     vgCountCo  := 0;
     Q :=  GetSQLQuery(Objeto.CadenaSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
          begin
               //COLUMNAS OCULTAS
               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('F_VENCIMIENTO').DisplayLabel := 'F.V.' + #30 +'>C';
               Q.FieldByName('F_PROG_PAGO').DisplayLabel := 'F.P.P' + #30 +'>C';
               Q.FieldByName('B1').DisplayLabel := '   ' + #30 +'>C';
               Q.FieldByName('NUM_PERIODO_CP').DisplayLabel := 'N.P' + #30 +'>C';
               Q.FieldByName('PLAZO_CP').DisplayLabel := 'Plazo' + #30 +'>C';
               Q.FieldByName('IMP_CUOTA_CP').DisplayLabel := 'Importe' + #30 +'>C';
               Q.FieldByName('SIT_CAPITAL_CP').DisplayLabel := 'Sit' + #30 +'>C';
               Q.FieldByName('B2').DisplayLabel := '   ' + #30 +'>C';
               Q.FieldByName('NUM_PERIODO_IN').DisplayLabel := 'N.P' + #30 +'>C';
               Q.FieldByName('PLAZO_IN').DisplayLabel := 'Plazo' + #30 +'>C';
               Q.FieldByName('IMP_CUOTA_IN').DisplayLabel := 'Importe' + #30 +'>C';
               Q.FieldByName('SIT_CAPITAL_IN').DisplayLabel := 'Sit' + #30 +'>C';
               Q.FieldByName('B3').DisplayLabel := '   ' + #30 +'>C';                               //## REMOVED DEINTEC.DF   21.MAYO.DF
               Q.FieldByName('TOTAL').DisplayLabel := 'TOTAL' + #30 +'>C';                   //## REMOVED DEINTEC.DF   21.MAYO.DF
               //Q.FieldByName('PLAZO_CO').DisplayLabel := 'Plazo' + #30 +'>C';                       //## REMOVED DEINTEC.DF   21.MAYO.DF
               //Q.FieldByName('IMP_CUOTA_CO').DisplayLabel := 'Importe' + #30 +'>C';                 //## REMOVED DEINTEC.DF   21.MAYO.DF
               //Q.FieldByName('SIT_CAPITAL_CO').DisplayLabel := 'Sit' + #30 +'>C';                   //## REMOVED DEINTEC.DF   21.MAYO.DF

               //ASIGNACION DE MASCARAS DE EDICION
               TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';
               TDateField(Q.FieldByName('F_PROG_PAGO')).DisplayFormat := 'DD/MM/YYYY';
               TNumericField(Q.FieldByName('IMP_CUOTA_CP')).DisplayFormat := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('IMP_CUOTA_IN')).DisplayFormat := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('TOTAL')).DisplayFormat := '###,###,###,##0.00';  //## REMOVED DEINTEC.DF   21.MAYO.DF

               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('F_VENCIMIENTO').DisplayWidth := 12;
               Q.FieldByName('F_PROG_PAGO').DisplayWidth := 12;
               Q.FieldByName('B1').DisplayWidth := 3;
               Q.FieldByName('NUM_PERIODO_CP').DisplayWidth := 4;
               Q.FieldByName('PLAZO_CP').DisplayWidth := 5;
               Q.FieldByName('IMP_CUOTA_CP').DisplayWidth := 12;
               Q.FieldByName('SIT_CAPITAL_CP').DisplayWidth := 4;
               Q.FieldByName('B2').DisplayWidth := 3;
               Q.FieldByName('NUM_PERIODO_IN').DisplayWidth := 4;
               Q.FieldByName('PLAZO_IN').DisplayWidth := 5;
               Q.FieldByName('IMP_CUOTA_IN').DisplayWidth := 12;
               Q.FieldByName('SIT_CAPITAL_IN').DisplayWidth := 4;
               Q.FieldByName('B3').DisplayWidth := 3;                                //## REMOVED DEINTEC.DF   21.MAYO.DF
               Q.FieldByName('TOTAL').DisplayWidth := 12;                    //## REMOVED DEINTEC.DF   21.MAYO.DF
               //Q.FieldByName('PLAZO_CO').DisplayWidth := 5;                          //## REMOVED DEINTEC.DF   21.MAYO.DF
               //Q.FieldByName('IMP_CUOTA_CO').DisplayWidth := 12;                     //## REMOVED DEINTEC.DF   21.MAYO.DF
               //Q.FieldByName('SIT_CAPITAL_CO').DisplayWidth := 4;                    //## REMOVED DEINTEC.DF   21.MAYO.DF

               SGClBusMovNoAut.Titulo1 := 'Crédito ' + IntToStr(Objeto.VGCredito);
               SGClBusMovNoAut.Titulo2 := '.                                                 |                     CAPITAL                      |                     INTERES                    |            INTERES MAS CAPITAL        .';
               SGClBusMovNoAut.addQry(Q,True,True,-1,-1,-1,True);
      //       SGClBusMovNoAut.SG.Row := SGClBusMovNoAut.SG.FixedRows + 1;
          end
          else
          begin
               SGClBusMovNoAut.Clear('NO EXISTEN CUOTAS DEFINIDAS'#30'>C');
          end;
     finally
          if Q <> nil then
             Q.free;
          //end if
     end;
end;


procedure TWCrGenVto.FormShow(Sender: TObject);
begin
{CAPITAL/COMISINN   (CP,CO)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
--2	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
--3	AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
--4	AMORTIZACIÓN  ÚNICA AL VENCIMIENTO}

{--INTERÉS  (IN)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	SI SE COBRAN EN SU TOTALIDAD POR ANTICIPADO
--2	SI SE COBRAN EN SU TOTALIDAD AL VENCIMIENTO
--3	SI SE COBRAN EN FORMA PERIÓDICA}
      //ONFIGURA POP UP MENU

{POP UP MENU
Agrega Periodo de Capital
Agrega Cuotas Periodicas de Capital
Borra Periodo de Capital
Modificar Monto

Agrega Periodo de Interés
Borra Periodo de Interés}
      edIMP_CREDITO.Enabled := False;
      edF_INICIO.Enabled := False;

      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO;
      
      Objeto.IMP_CUOTA.Control := edIMP_CREDITO;
      Objeto.F_VENCIMIENTO.Control := edF_INICIO;
      Objeto.AJU_ULTIMO_PER.Control:= edAJU_ULTIMO_PER;

      edID_CREDITO.Text := IntToStr(Objeto.VGCredito);
      ///ArmaCadenaSQLCuotas;                            //## REMOVED DEINTEC.DF   26.MAYO.DF
      ///ReQueryCuotas;                                  //## REMOVED DEINTEC.DF   26.MAYO.DF
      ValidaSitCred;

      edAJU_ULTIMO_PER.Text:= '0';

      Objeto.ID_CESION.Control:=edID_CREDITO;
      Objeto.Cesion.ID_CESION.Control:=edID_CREDITO;
      Objeto.Cesion.Credito.ID_CONTRATO.Control:= iedID_CONTRATO;
      Objeto.Cesion.Credito.ContratoCre.CVE_PRODUCTO_CRE.Control:= edCVE_PRODUCTO;
      Objeto.Cesion.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      Objeto.Cesion.Credito.F_VENCIMIENTO.Control := edF_VENCIMIENTO;
      Objeto.Cesion.Credito.IMP_CREDITO.Control := edIMPORTE_CESION;
      btAGREGA_CUOTA.Enabled:= False;

      if Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString <> C_AMORT2 then
      begin
         edAJU_ULTIMO_PER.Enabled:= False;
         edAJU_ULTIMO_PER.Color:= clBtnFace;
         if Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString = C_AMORT3 then
         begin
            BitBtn1.Enabled := False;
            ArmaCadenaSQLCuotas;
            ReQueryCuotas;
         end;

         if Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString <> C_AMORT3 then
         begin
            BitBtn1.Enabled:= True;
            BitBtn1Click(self);
         end;
      end
      else
      begin
         edAJU_ULTIMO_PER.Enabled:= True;
         edAJU_ULTIMO_PER.Color:= clWindow;
         ArmaCadenaSQLCuotas;
         ReQueryCuotas;
      end;

      if(Objeto.Cesion.Credito.ContratoCre.Producto.B_AJU_IMP_U_P.AsString <> CVERDAD) then
      begin
         edAJU_ULTIMO_PER.Enabled:= False;
         edAJU_ULTIMO_PER.Color:= clBtnFace;
      end;

      ValidaSitCred;
end;

procedure TWCrGenVto.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control := nil;
      Objeto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.DESC_L_PRODUCTO.Control := nil;

      Objeto.IMP_CUOTA.Control := nil;
      Objeto.F_VENCIMIENTO.Control := nil;
      Objeto.AJU_ULTIMO_PER.Control:= nil;

      Objeto.ID_CESION.Control:=nil;
      Objeto.Cesion.ID_CESION.Control:=nil;
      Objeto.Cesion.Credito.ID_CONTRATO.Control:= nil;
      Objeto.Cesion.Credito.ContratoCre.CVE_PRODUCTO_CRE.Control:= nil;
      Objeto.Cesion.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= nil;
      Objeto.Cesion.Credito.F_VENCIMIENTO.Control := nil;
end;

procedure TWCrGenVto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGenVto.SGClBusMovNoAutCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
begin
     Case RoWCaso of
     rcRowBegin : begin
                        if ((DataSet.FieldByName('SIT_CAPITAL_CP').AsString='PA') OR
                            (DataSet.FieldByName('SIT_CAPITAL_IN').AsString='PA')) THEN       //OR  ## REMOVED   DEINTEC.DF    21.MAYO.2008
                            //(DataSet.FieldByName('SIT_CAPITAL_CO').AsString='PA')) then    //## REMOVED   DEINTEC.DF    21.MAYO.2008
                           SGClBusMovNoAut.SetFontColor(clGray);
                        if ((DataSet.FieldByName('SIT_CAPITAL_CP').AsString='AC') OR
                            (DataSet.FieldByName('SIT_CAPITAL_IN').AsString='AC')) THEN       //OR ## REMOVED   DEINTEC.DF    21.MAYO.2008
                            //(DataSet.FieldByName('SIT_CAPITAL_CO').AsString='AC')) then    //## REMOVED   DEINTEC.DF    21.MAYO.2008
                           SGClBusMovNoAut.SetFontColor(clGreen);
                        if ((DataSet.FieldByName('SIT_CAPITAL_CP').AsString='IM') OR
                            (DataSet.FieldByName('SIT_CAPITAL_IN').AsString='IM')) THEN       //OR ## REMOVED   DEINTEC.DF    21.MAYO.2008
                            //(DataSet.FieldByName('SIT_CAPITAL_CO').AsString='IM')) then    //## REMOVED   DEINTEC.DF    21.MAYO.2008
                           SGClBusMovNoAut.SetFontColor(clRed);
                        If DataSet.FieldByName('NUM_PERIODO_CP').AsString <> '' THEN
                        Begin
                           vgCountCap := vgCountCap + 1;
                           lbTOT_PER_CAP.Caption := IntToStr(vgCountCap);
                           //vgImpCap := vgImpCap + DataSet.FieldByName('IMP_CUOTA_CP').AsFloat;    //## REMOVED   DEINTEC.DF    21.MAYO.2008
                           vgImpCap := vgImpCap + DataSet.FieldByName('IMP_CUOTA_CP').AsFloat + DataSet.FieldByName('IMP_CUOTA_IN').AsFloat;    //## DEINTEC.DF    21.MAYO.2008
                           lbTOT_IMP_CAP.Caption := Format(CFORMAT_DINERO,[ vgImpCap]);
                        end;
                        If DataSet.FieldByName('NUM_PERIODO_IN').AsString <> '' THEN
                        Begin
                           vgCountIn := vgCountIn + 1;
                           lbTOT_PER_INT.Caption := IntToStr(vgCountIn);
                        end;
                        {If DataSet.FieldByName('NUM_PERIODO_CO').AsString <> '' THEN        //## REMOVED   DEINTEC.DF    21.MAYO.2008
                        Begin
                           vgCountCo := vgCountCo + 1;
                           lbTOT_PER_COM.Caption := IntToStr(vgCountCo);
                        end;}
                  end
     end; // Case
end;

procedure TWCrGenVto.AgregarPeriodo1Click(Sender: TObject);
begin
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento e Importe de Capital');
     edF_INICIO.Enabled := True;
     dtpF_INICIO.Enabled := True;
     edIMP_CREDITO.Enabled := True;
     Try
         Objeto.F_VENCIMIENTO.AsDateTime := StrToDateTime(SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top]);
     except
         ShowMessage('No hay fecha valida en la tabla');
     End;
     btAGREGA_CUOTA.Caption := 'Agregar Cuota';
     btAGREGA_CUOTA.Enabled := True;
     Objeto.VGCveAccesorioAdd := 'CP';
     Objeto.VGCveAccion := 'AG';
     edF_INICIO.SetFocus;
end;

procedure TWCrGenVto.AgregarPeriododeInters1Click(Sender: TObject);
begin
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento');
     edF_INICIO.Enabled := True;
     dtpF_INICIO.Enabled := True;
     Objeto.F_VENCIMIENTO.AsDateTime := StrToDateTime(SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top]);
     btAGREGA_CUOTA.Caption := 'Agregar Cuota';
     btAGREGA_CUOTA.Enabled := True;
     Objeto.VGCveAccion := 'AG';
     Objeto.VGCveAccesorioAdd := 'IN';
     Objeto.IMP_CUOTA.AsFloat := 0;
     edF_INICIO.SetFocus;
end;

procedure TWCrGenVto.btAGREGA_CUOTAClick(Sender: TObject);
var
   Y    :  Integer;
   X    :  Integer;
   nRow : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRGENVTO_APLI',True,True) then
   begin
     if Objeto.VGCveAccion = 'MD' then
     begin
         Objeto.IMP_CUOTA.GetFromControl;
         X:=SGClBusMovNoAut.SG.Selection.Left;
         Y:=SGClBusMovNoAut.SG.Selection.Top;
         if MessageDlg('¿El importe aplica para todos los periodos? ',
                mtConfirmation,[mbYes, mbNo], 0) = mrYes then
            BEGIN
               For nRow := 1 To SGClBusMovNoAut.SG.RowCount - 1 Do
                 begin
                    if SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y] <> '' then
                       ModImpCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]),'CP',Objeto.IMP_CUOTA.AsFloat);
                    Y:= Y + 1;
                 end;
            END
         ELSE
            if MessageDlg('¿Desea Modificar el importe dela cuota No. ' + SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y] + ' de Capital ? ',
                mtConfirmation,[mbYes, mbNo], 0) = mrYes then
               ModImpCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]),'CP',Objeto.IMP_CUOTA.AsFloat);
            //end if;

     end;

     if Objeto.VGCveAccion = 'AG' then
     begin
         Objeto.F_VENCIMIENTO.GetFromControl;
         Objeto.IMP_CUOTA.GetFromControl;
         AgregaCuota(Objeto.VGCveAccesorioAdd);
     end;

     edF_INICIO.Clear;
     edIMP_CREDITO.Enabled := False;
     edF_INICIO.Enabled := False;
     dtpF_INICIO.Enabled := False;
     edIMP_CREDITO.Enabled := False;
     btAGREGA_CUOTA.Enabled := False;
     ArmaCadenaSQLCuotas;
     ReQueryCuotas;
     ValidaTabla(Objeto.VGCredito);
   end;
end;

procedure TWCrGenVto.BorrarPeriodo1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]) then
     Begin
       EliminaCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]),'CP');
       ArmaCadenaSQLCuotas;
       ReQueryCuotas;
     end;
end;

procedure TWCrGenVto.btREINICIA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENVTO_REINI',True,True) then
   begin
      if MessageDlg('¿Desea generar la tabla de amortización en base a las condiciones iniciales de la disposición?.  Los cambios realizados a la misma anteriormente se perderán',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString <> C_AMORT2 then
         begin
             edAJU_ULTIMO_PER.Enabled:= False;
             edAJU_ULTIMO_PER.Color:= clBtnFace;
             BitBtn1.Enabled := False;
             if Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString = C_AMORT3 then
             begin
                LimpiaTabla;
                ArmaCadenaSQLCuotas;
                ReQueryCuotas;
                ShowMessage('Introduzca sus periodos de vencimientos en la tabla');
             end;
             if (Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString = C_AMORT4)
               OR (Objeto.Cesion.Credito.CVE_AMORTIZACION.AsString = C_AMORT1) then
             begin
                BitBtn1Click(self);
             end;
         end
         else
         begin
            BitBtn1.Enabled:= True;
            SGClBusMovNoAut.Clear(''#30'>C');
            if(Objeto.Cesion.Credito.ContratoCre.Producto.B_AJU_IMP_U_P.AsString <> CVERDAD) then
            begin
               edAJU_ULTIMO_PER.Enabled:= False;
               edAJU_ULTIMO_PER.Color:= clBtnFace;
               edAJU_ULTIMO_PER.Text:= '0.0';
               ArmaTabla;
               ArmaCadenaSQLCuotas;
               ReQueryCuotas;
            end
            else
            begin
               edAJU_ULTIMO_PER.Enabled:= True;
               edAJU_ULTIMO_PER.Color:= clWindow;
               edAJU_ULTIMO_PER.Text:= '0.0';
               edAJU_ULTIMO_PER.SetFocus;
               ShowMessage('Indique el importe de ajuste ultimo periodo');
            end;
         end;
         {//if not(FindCredOrigen) then Begin               //## REMOVED DEINTEC.DF   21.MAYO.DF
            ArmaTabla;
         //end
         //else Begin
            //RestauraTabla;
         //end;

         ArmaCadenaSQLCuotas;
         ReQueryCuotas;
         ValidaTabla(Objeto.VGCredito);}
      end;
   end;
end;

procedure TWCrGenVto.BorrarPeriododeInters1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_IN',Y]) then
     Begin
       EliminaCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_IN',Y]),'IN');
       ArmaCadenaSQLCuotas;
       ReQueryCuotas;
     end;
end;

procedure TWCrGenVto.ModificarMonto1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]) then
     Begin
        ShowMessage('Favor de Indicar le nuevo Importe de Capital para el periodo ' +
                     SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]);
        edIMP_CREDITO.Enabled := True;
        btAGREGA_CUOTA.Caption := 'Modifica cuota Capital';
        Objeto.VGCveAccion := 'MD';
        Objeto.VGCveAccesorioAdd := 'CP';
        edIMP_CREDITO.SetFocus;
        btAGREGA_CUOTA.Enabled:= True;
     end;
end;



procedure TWCrGenVto.btVALIDA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENVTO_VALID',True,True) then
      ValidaTabla(Objeto.VGCredito);
end;

procedure TWCrGenVto.btCANCELAClick(Sender: TObject);
begin
     edIMP_CREDITO.Enabled := False;
     edF_INICIO.Enabled := False;
     btAGREGA_CUOTA.Enabled := False;
     dtpF_INICIO.Enabled := False;
     btVALIDA_TABLA.SetFocus;
end;

procedure TWCrGenVto.edIMP_CREDITOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_CREDITO,True,'',True);
end;

procedure TWCrGenVto.edIMP_CREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
   ShowMessage('Salida');
end;

procedure TWCrGenVto.InterForma1DespuesShow(Sender: TObject);
begin
   //lbIMP_DISP.Caption := Format(CFORMAT_DINERO,[ Objeto.IMP_CREDITO.AsFloat ] );
   //ValidaTabla(Objeto.VGCredito);
   if Objeto.vgCesion <>'' then
   Begin
      Objeto.ID_CESION.AsString := Objeto.vgCesion;
      Objeto.Cesion.FindKey([Objeto.ID_CESION.AsString]);
      Objeto.AJU_ULTIMO_PER.AsFloat:= 0;
   end;
end;

function TWCrGenVto.FindCredOrigen: Boolean;
var vlsql: String;    vlCount: Integer;
Begin
     vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CREDITO_REST WHERE ID_CREDITO = ' + IntToStr(Objeto.VGCredito) +
             '  AND FOL_GRUPO_RENUEVA = ' + IntToStr(Objeto.VGCredRenuev);
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
     if vlCount = 1 then
        Result := True
     else
        Result := False;
end;

                                                                                                // <LOLS 24112005 SE AGREGA CARGA DE TABLA NAFIN>
function TWCrGenVto.CargaTablaPYME(sFileName: TFileName): Integer;
var F       : TextFile;
    aBuffer : TArrayString;
    bHeader : Boolean;
    bParser : Boolean;
    nItem   : Integer;
    Cnt     : Integer;
    strBuf  : String;
    sList   : TStringList;
    sAccesorio : String;
    sCveAmort  : String;
begin
  Result   := 0;
  sList    := TStringList.Create;
  Try
    {$I-}
    AssignFile( F, sFileName );
    FileMode := 0;
    Reset(F);
    bHeader  := False;
    bParser  := False;
    sList.Clear;
    //
    while not Eof(F) do
    begin
      bParser  := True;
      ReadLn( F, strBuf  );
      nItem := ParseQuotedString( aBuffer, strBuf, C_SEPARATOR, C_TOKEN_TEXTO );
      if bHeader = False then
      begin
        if nItem = 4 then
          bHeader := ( aBuffer[0] = C_NUM_AMORT   ) and // El primer campo debe ser
                     ( aBuffer[1] = C_FECHA_AMORT ) and
                     ( aBuffer[2] = C_TIPO_CUOTA  ) and
                     ( aBuffer[3] = C_MONTO_AMORT );
        //ends_if
      end else begin
        if nItem = 4 then
        begin
          GetSQLStr( 'SELECT CVE_REFERENCIA FROM CR_GRUPO_CLAVE WHERE VALOR = '  + SQLStr(aBuffer[2]),
                     Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'CVE_REFERENCIA', sAccesorio, False );
          if sAccesorio = '' then
          begin
            bParser  := False;
            MessageDlg( 'No encontré la clave de accesorio de la descripción ' + aBuffer[2],
                        mtError, [mbOk], 0 );
            break;
          end;
          //
          if not ((sAccesorio = C_TBPYME_CP) or (sAccesorio = C_TBPYME_IN) or (sAccesorio = C_TBPYME_CPIN)) then
          begin
            bParser  := False;
            MessageDlg( 'Relación "Tipo de Cuota" - "Clave de Accesorio" desconocida ' +
                        aBuffer[2] + ' - ' + sAccesorio, mtError, [mbOk], 0 );
            break;
          end;
          //
          sList.Add( aBuffer[0] + '|' +  aBuffer[1] + '|' +  sAccesorio + '|' +  aBuffer[3] );
        end;
      end;//ends_if_bHeader_=_False_then
      Application.ProcessMessages;
    end;
    {$I+}
    CloseFile(F);
    //
    if bParser then
    begin
      if sList.Count > 0 then
      begin
        MessageDlg( 'Se encontraron ' + IntToStr(sList.Count) +  ' ' +
                    'registro(s) en el archivo.', mtInformation, [mbOk], 0 );
        // Borra la tabla
        RunSQL('DELETE FROM CR_SOL_CUOTA WHERE ID_REF_SOL_CUOTA = ' + IntToStr(Objeto.VGCredito),
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
        //
        {sCveAmort := Objeto.CVE_AMORTIZACION.AsString;}
        for Cnt := 0 to sList.Count - 1 do
        begin
          strBuf := sList.Strings[Cnt];
          ParseQuotedString( aBuffer, strBuf, '|', C_TOKEN_TEXTO );
          if ( aBuffer[2] = C_TBPYME_CP ) or ( aBuffer[2] = C_TBPYME_CPIN ) then
          begin
            {Objeto.CVE_AMORTIZACION.AsString := '3';}
            Objeto.F_VENCIMIENTO.AsDateTime  := StrToDate ( aBuffer[1] );
            Objeto.IMP_CUOTA.AsFloat         := StrToFloat( aBuffer[3] );
            AgregaCuota('CP');
          end;//if_(_aBuffer[2]_=_C_TBPYME_CP_)_or_(_aBuffer[2]_=_C_TBPYME_CPIN_)_then
          if ( aBuffer[2] = C_TBPYME_IN ) or ( aBuffer[2] = C_TBPYME_CPIN ) then
          begin
            Objeto.F_VENCIMIENTO.AsDateTime := StrToDate( aBuffer[1] );
            Objeto.IMP_CUOTA.AsFloat        := 0;
            AgregaCuota('IN');
          end;//ends_if_(_aBuffer[2]_=_C_TBPYME_IN_)_or_(_aBuffer[2]_=_C_TBPYME_CPIN_)_then
        end;
        {Objeto.CVE_AMORTIZACION.AsString := sCveAmort;}
        //
        ArmaCadenaSQLCuotas;
        ReQueryCuotas;
        ValidaTabla(Objeto.VGCredito);
      end else
        MessageDlg( 'No se encontraron registros en el archivo. Favor de verificar que sea un archivo válido',
                     mtInformation, [mbOk], 0 );
    end;
  Finally
    If Assigned(sList) Then Begin sList.Clear; sList.Free; End;
    SetLength(aBuffer,0);
    //
  End;
end;


procedure TWCrGenVto.edIMPORTE_CESIONExit(Sender: TObject);
var
    vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     if edIMPORTE_CESION.Text = CNULL then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el importe de cesion';
     end;
     InterForma1.ValidaExit(edIMPORTE_CESION,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrGenVto.edAJU_ULTIMO_PERExit(Sender: TObject);
var
    vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     if edAJU_ULTIMO_PER.Text = CNULL then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el importe de cesion';
     end;
     //InterForma1.ValidaExit(edAJU_ULTIMO_PER,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrGenVto.InterForma1DespuesNuevo(Sender: TObject);
begin
   iedID_CONTRATO.ReadOnly:= True;
   iedID_CONTRATO.Color:= clBtnFace;
end;

procedure TWCrGenVto.BitBtn1Click(Sender: TObject);
begin
   ArmaTabla;
   ArmaCadenaSQLCuotas;
   RecalcPlazos;
   ReQueryCuotas;
end;

end.







