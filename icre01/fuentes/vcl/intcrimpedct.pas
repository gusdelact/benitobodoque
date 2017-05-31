// Sistema         : Clase de CrImpEdCt
// Fecha de Inicio : 31/01/2005
// Función forma   : Clase de CrImpEdCt
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrImpEdCt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//CLASES ADICIONALES
IntParamCre, IntLinkit, //Datos panel

IntCrCredito,    //Disposición
IntMProdGpo,     //Grupo de crédito
IntCrProduct, Spin     //Producto de crédito

;

Type
 TCrGenEdCt= class;

  TWCrGenEdCt=Class(TForm)
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
    Label4: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edDesc_Prod: TEdit;
    ilDisposicion: TInterLinkit;
    Label1: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    Label2: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btCREDITO_FIN: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    Label15: TLabel;
    MBitacora: TMemo;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    sbGeneraEdoCta: TSpeedButton;
    rgmes: TRadioGroup;
    seAnio: TSpinEdit;
    Label3: TLabel;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    chbxProducto: TCheckBox;
    cbxDisposicion: TCheckBox;
    ProgressBar1: TProgressBar;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure btCREDITO_FINClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure btDisposicionClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure sbGeneraEdoCtaClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
     procedure EnableCheckBox(var CheckBox : TCheckBox);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrGenEdCt;
end;
 TCrGenEdCt= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre         : TParamCre;
        CrCredito        : TCrCredito;
        GpoProd          : TMProdGpo;
        Producto         : TCrProduct;

        MBitacora: TMemo;
        ProgressBar1: TProgressBar;

        StpRegeneraCFDI : TStoredProc; // CAPM - CFDI }

        Procedure   GeneraEdoCuenta(PPMes : integer; PPAnio : integer; PPCveGpoPro : String; PPCvePro : String; PPCredito : Integer);

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


constructor TCrGenEdCt.Create( AOwner : TComponent );
begin Inherited;

   CrCredito := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;
   CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

   GpoProd:= TMProdGpo.Create(Self);
   GpoProd.MasterSource:=Self;
   GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

   Producto :=  TCrProduct.Create(Self);
   Producto.MasterSource:=Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntCrimpedct.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TCrGenEdCt.Destroy;
begin
   If Assigned(CrCredito) Then
      CrCredito.Free;
   If Assigned(GpoProd) Then
      GpoProd.Free;
   If Assigned(Producto) Then
      Producto.Free;
   if Assigned(StpRegeneraCFDI) then
   begin   // CAPM - CFDI 
     StpRegeneraCFDI.UnPrepare;
     StpRegeneraCFDI.Free;
   end;

   inherited;
end;


function TCrGenEdCt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGenEdCt;
begin
   W:=TWCrGenEdCt.Create(Self);
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


Function TCrGenEdCt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrimped.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrGenEdCt.Reporte:Boolean;
begin //Execute_Reporte();
end;


Procedure   TCrGenEdCt.GeneraEdoCuenta(PPMes : integer; PPAnio : integer; PPCveGpoPro : String; PPCvePro : String; PPCredito : Integer);
var VLTexto, VLMes : String;
    VLSQL          : String;
    VLSQLCount     : String;
    Qry            : TQuery;
    STP            : TStoredProc;
    VLFIni, VLFFin : TDateTime;
    buttonSelected,
    numReg         :Integer;

begin
     Case PPMes of
      1: VLMes := 'Enero';
      2: VLMes := 'Febrero';
      3: VLMes := 'Marzo';
      4: VLMes := 'Abril';
      5: VLMes := 'Mayo';
      6: VLMes := 'Junio';
      7: VLMes := 'Julio';
      8: VLMes := 'Agosto';
      9: VLMes := 'Septiembre';
      10: VLMes := 'Octubre';
      11: VLMes := 'Noviembre';
      12: VLMes := 'Diciembre';
     end;

     VLFIni := StrToDate('01/'+IntToStr(PPMes)+'/'+IntToStr(PPAnio));
     VLFFin := IncMonth(VLFIni,1) - 1;
     VLTexto := 'Desea Generar los estados de Cuenta del mes : ' + VLMes + ' del año: ' + IntToStr(PPAnio) + '.';
     if PPCveGpoPro <> '' then
     begin
        VLTexto := VLTexto + ' Del Grupo de Producto: ' +  PPCveGpoPro + '.';
     end;
     if PPCvePro <> '' then
     begin
        VLTexto := VLTexto + ' Del Producto: ' +  PPCvePro + '.';
     end;
     if PPCredito <> 0 then
     begin
        VLTexto := VLTexto + ' De la Disposición: ' +  IntToStr(PPCredito) + '.';
     end;
     if MessageDlg(VLTexto, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          VLSQL :=   ' FROM CR_CREDITO ' +
                     ' WHERE ID_CONTRATO IN ' +
                     '      (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN ' +
//                     '             (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO  WHERE CVE_PRODUCTO_GPO IN ' +       // AICR 13/01/204
                     '             (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO' +
                     '               WHERE ID_EMPRESA = ' + IntToStr(Apli.IdEmpresa) +         // AICR    13/01/2014
                     '                 AND CVE_PRODUCTO_GPO IN ' +
                     '                 (SELECT CVE_PRODUCTO_GPO FROM CR_PRODUCTO_GPO ';
          if PPCveGpoPro <> '' then
          begin
               VLSQL := VLSQL + ' WHERE CVE_PRODUCTO_GPO = ' + #39 +  PPCveGpoPro + #39 + ')';
          end
          else
               VLSQL := VLSQL + ')';
          //end if
          if PPCvePro <> '' then
          begin
               VLSQL := VLSQL + ' AND CVE_PRODUCTO_CRE = ' + #39 +  PPCvePro + #39 + ')';
          end
          else
               VLSQL := VLSQL + ')';
          //end if
{          VLSQL := VLSQL + ' ) ' +
                           ' AND   F_INICIO <= ' + SQLFecha(VLFFin) +      //--Fin   AICR   13/01/2014
                           ' AND  (F_LIQUIDACION IS NULL OR F_LIQUIDACION >= ' + SQLFecha(VLFIni) + ')'+  //--Inicio
                           ' AND   SIT_CREDITO <> '+#39+'CA'+#39;  }

          VLSQL := VLSQL + ' ) ' +
                           ' AND  F_INICIO <= ' + SQLFecha(VLFFin) +      //--Fin   AICR  13/01/2014
                           ' AND  (F_LIQUIDACION IS NULL OR F_LIQUIDACION >= ' + SQLFecha(VLFIni) + ')'+  //--Inicio
                           ' AND  B_GENERA_EDOCTA = ''V'' '+
                           ' AND  SIT_CREDITO in (''AC'',''LQ'')';

          if PPCredito <> 0 then
          begin
               VLSQL := VLSQL + ' AND ID_CREDITO = ' + IntToStr(PPCredito);
          end;

          VLSQLCount := ' SELECT COUNT(ID_CREDITO) AS TOTAL ' + VLSQL;
          VLSQL := ' SELECT ID_CREDITO ' + VLSQL;

          Qry := GetSQLQueryNoNil( VLSQLCount, Apli.DataBaseName, Apli.SessionName, False );
          if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
          begin
               ProgressBar1.Max := Qry.FieldByName('TOTAL').AsInteger;
          end;
          if Assigned(Qry) then
          begin
               Qry.Close;
               Qry.Free;
          end;

          ProgressBar1.Position := 0;

          Qry := GetSQLQueryNoNil( VLSQL, Apli.DataBaseName, Apli.SessionName, False );
          if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
          begin
             numReg:=1;//21Oct2013 HCF Para mostrar cual registro se está procesando del total del query.

             buttonSelected:=-1;//15NE2014 HCF Para manejar YesToAll

             while Not Qry.Eof Do
             begin
               if buttonSelected<>10 //15NE2014 HCF Para manejar YesToAll
               then
                buttonSelected:=messagedlg('Confirme resellar el crédito('+intToStr(numReg)+' de '+intToStr(Qry.RecordCount)+'): '+
                                            Qry.FieldByName('ID_CREDITO').AsString,
                                            mtconfirmation,
                                            [mbNo, mbNoToAll, mbYes, mbYesToAll], 0);//21Oct2013 HCF Para confirmar resellar
                case buttonSelected of
                  6,10: begin//21Oct2013 HCF Para confirmar resello (si resellar)
                     MBitacora.Lines.Add('Generando Crédito: ' + IntToStr(Qry.FieldByName('ID_CREDITO').AsInteger));
                     STP := TStoredProc.Create(Self);
                     try
                        with STP do
                        begin
                              STP.DatabaseName:= Apli.DatabaseName;
                              STP.SessionName:= Apli.SessionName;
                              STP.StoredProcName:='PKGCRGENEDOCUENTA.STPCARGACREDITO';
                              // Se crean los parametros del StoreProcedure
                              Params.Clear;
                              Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
                              {EASA4011   22/11/2005 Se reemplaza el nuevo procedimiento de generacion de Estado de Cuenta}
                              {                          Params.CreateParam(ftInteger,'PENUMMES',ptInput);
                                                        Params.CreateParam(ftInteger,'PEYEAR',ptInput);
                              }
                              {/EASA4011}
                              Params.CreateParam(ftDateTime,'PEFINICORTE',ptInput);
                              Params.CreateParam(ftDateTime,'PEFCORTE',ptInput);
                              Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
                              Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
                              Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                              ParamByName('PEIDCREDITO').AsInteger := Qry.FieldByName('ID_CREDITO').AsInteger;
                              {EASA4011   22/11/2005 Se reemplaza el nuevo procedimiento de generacion de Estado de Cuenta}
                              {
                                                        ParamByName('PENUMMES').AsInteger := PPMes;
                                                        ParamByName('PEYEAR').AsInteger := PPAnio;
                              }
                              {/EASA4011}
                              ParamByName('PEFINICORTE').AsDateTime:= vlFIni;
                              ParamByName('PEFCORTE').AsDateTime   := vlFFin;
                              ParamByName('PECVEUSUALTA').AsString := Apli.Usuario;
                              ExecProc;
                              if ParamByName('PSResultado').AsInteger = 0 then
                              begin

                                { ******************** CAPM CFDI ********************** }
                                StpRegeneraCFDI.Close;
                                StpRegeneraCFDI.ParamByName('peID_CONTRATO').Value := Qry.FieldByName('ID_CREDITO').AsInteger;
                                StpRegeneraCFDI.ParamByName('peID_CESION'  ).Value := FormatDateTime('YYYYMM', vlFFin);

                                try
                                   StpRegeneraCFDI.ExecProc;
                                   if StpRegeneraCFDI.ParamByName('psCOD_RESP').AsInteger <> 0 then
                                   begin
                                     MessageDlg(StpRegeneraCFDI.ParamByName('psSTR_RESP').AsString+'-['+
                                                StpRegeneraCFDI.ParamByName('psCOD_RESP').AsString+']', mtWarning, [mbOK], 0);
                                   end
                                   else
                                   begin
                                     MBitacora.Lines.Add('Sellado CFDI [StpRegeneraCFDI] : OK');
                                   end;
                                except
                                   on E: Exception do
                                     MessageDlg(E.Message, mtWarning, [mbOK], 0);
                                end;
                                { ******************** CAPM CFDI ********************** }
                                   MBitacora.Lines.Add('OK');

                              end
                              else // SI NO REALIZA LA CARGA MANDA ERRORES
                              Begin
                                   MBitacora.Lines.Add('Alta de Disposición, Error [ ' +
                                                        ParamByName('psRESULTADO').AsString + '] ' +
                                                        ParamByName('psTxResultado').AsString);
                              end;
                              UnPrepare;
                         end;
                      finally
                          STP.Free;
                      end;
                    end;//21Oct2013 HCF Para confirmar resello (si resellar)
                  9: Qry.Last;//21Oct2013 HCF Para confirmar resello (No a todo)
                else//21Oct2013 HCF Para confirmar resello
                end;//21Oct2013 HCF Para confirmar resello

                ProgressBar1.Position := ProgressBar1.Position + 1;
                Qry.Next;
                numReg:=numreg+1;//21Oct2013 HCF Para mostrar cual registro se está procesando del total del query.
                Application.ProcessMessages;
             end;
          end;
          if Assigned(Qry) then
          begin
               Qry.Close;
               Qry.Free;
          end;
      end;
end;

(***********************************************FORMA CrGenEdCt********************)
(*                                                                              *)
(*  FORMA DE CrGenEdCt                                                            *)
(*                                                                              *)
(***********************************************FORMA CrGenEdCt********************)

procedure TWCrGenEdCt.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := edDisposicion;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDesc_Prod;
      CrCredito.GetParams(Objeto);

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
   end;

   Objeto.MBitacora := MBitacora;
   Objeto.ProgressBar1 := ProgressBar1;

   seAnio.Value :=  StrToInt(FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa));
   rgmes.ItemIndex :=  StrToInt(FormatDateTime('MM',Objeto.Apli.DameFechaEmpresa)) - 1;

   { ******************** CAPM CFDI ********************** }

   Objeto.StpRegeneraCFDI := TStoredProc.Create(Objeto);

   {
    20Nov2013  JHerminioM CarreónF  Se califican todos los objetos de la facturación electrónica (CFDI) que están en ambos esquemas (ADMIPROD) (CFDI)
                                    se califican con el prefijo del esquema CFDI
   }
   Objeto.StpRegeneraCFDI.StoredProcName := 'CFDI.PKGCAPTACIONCFDI.STPREGENERACFDI';
   Objeto.StpRegeneraCFDI.DatabaseName := Objeto.DataBaseName;
   Objeto.StpRegeneraCFDI.SessionName := Objeto.SessionName;

   Objeto.StpRegeneraCFDI.Params.CreateParam(ftString,  'peSERIE_RECIBO' , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftInteger, 'peID_EMPRESA'   , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftInteger, 'peID_CESION'    , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftString,  'peID_DOCUMENTO' , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftInteger, 'peID_CONTRATO'  , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftString,  'peCVE_USUARIO'  , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftString,  'peCVE_CREDITO'  , ptinput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftString,  'psSTR_RESP'     , ptOutput);
   Objeto.StpRegeneraCFDI.Params.CreateParam(ftInteger, 'psCOD_RESP'     , ptOutput);

   Objeto.StpRegeneraCFDI.ParamByName('peSERIE_RECIBO').Value := 'ECOL';
   Objeto.StpRegeneraCFDI.ParamByName('peID_EMPRESA'  ).Value := 2;
   Objeto.StpRegeneraCFDI.ParamByName('peID_DOCUMENTO').Value := '0';
   Objeto.StpRegeneraCFDI.ParamByName('peCVE_USUARIO' ).Value := Objeto.DameUsuario;
   Objeto.StpRegeneraCFDI.ParamByName('peCVE_CREDITO' ).Value := 'ICRE';

   Objeto.StpRegeneraCFDI.Prepare;

   { ***************************************************** }



end;

procedure TWCrGenEdCt.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TWCrGenEdCt.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= Nil;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= Nil;
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := Nil;
   End;
end;

procedure TWCrGenEdCt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGenEdCt.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrGenEdCt.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrGenEdCt.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWCrGenEdCt.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENEDCT_GPOPR',True,True) then
   begin
     With Objeto Do Begin
        GpoProd.ShowAll := True;
        If GpoProd.Busca Then Begin
           cbxCVE_PRODUCTO_GPO.Checked:= True;
           cbxCVE_PRODUCTO_GPO.Enabled:= True;
           InterForma1.NextTab(edCVE_PRODUCTO_GPO);
        End;
     End;
   end;
end;

procedure TWCrGenEdCt.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWCrGenEdCt.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:= True;
      cbxCVE_PRODUCTO_GPO.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWCrGenEdCt.btCREDITO_FINClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENEDCT_PROD',True,True) then
   begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
      Objeto.Producto.ShowAll := True;
      if Objeto.Producto.Busca Then Begin
          chbxProducto.Checked:= True;
          chbxProducto.Enabled:= True;
          InterForma1.NextTab(edCVE_PRODUCTO_CRE);
      end;
   end;
end;

procedure TWCrGenEdCt.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:= True;
      chbxProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWCrGenEdCt.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWCrGenEdCt.btDisposicionClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENEDCT_DISPO',True,True) then
   begin
     With Objeto Do Begin
        CrCredito.ShowAll := True;
        If CrCredito.Busca then Begin
           cbxDisposicion.Checked:= True;
           cbxDisposicion.Enabled:= True;
           InterForma1.NextTab(edDisposicion);
        End;
     End;
   end;
end;

procedure TWCrGenEdCt.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWCrGenEdCt.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:= True;
      cbxDisposicion.Enabled:= True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TWCrGenEdCt.sbGeneraEdoCtaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENEDCT_GENE',True,True) then
      Objeto.GeneraEdoCuenta(rgmes.itemindex + 1, seAnio.Value,Objeto.GpoProd.CVE_PRODUCTO_GPO.AsString,Objeto.Producto.CVE_PRODUCTO_CRE.AsString,Objeto.CrCredito.ID_CREDITO.AsInteger);
end;

procedure TWCrGenEdCt.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_PRODUCTO_GPO);
   Objeto.GpoProd.Active := cbxCVE_PRODUCTO_GPO.Checked;
end;

procedure TWCrGenEdCt.chbxProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   Objeto.Producto.Active := chbxProducto.Checked;
end;

procedure TWCrGenEdCt.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

end.
