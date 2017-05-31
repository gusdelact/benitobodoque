// Sistema         : Clase de CorrecPCORP
// Fecha de Inicio : 07/09/2010
// Función forma   : Clase de CorrecPCORP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCorrecP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre,IntLinkit,  Grids, Aligrid,   IntGenCre, Menus, IntSGCtrl,
InterEdit;

Type
 TCorrecP= class; 

  TWCorrecP=Class(TForm)
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
    GBReinDolar: TGroupBox;
    edF_REINICIO: TEdit;
    Label22: TLabel;
    dtpF_REINICIO: TInterDateTimePicker;
    btACEPTAR: TBitBtn;
    GBcve_ope_cont: TGroupBox;
    cbCVE_OPER_CRED: TComboBox;
    cbCVE_TIPO_MOVTO: TComboBox;
    cbCVE_COMISION: TComboBox;
    cbCVE_OPE_CONT: TComboBox;
    cbCVE_CONCEPTO: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bguardar: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACEPTARClick(Sender: TObject);
    procedure BguardarClick(Sender: TObject);
    private 
    { Private declarations }
       function Reinicia_ContDolares( peF_REINICIO: STring ) : Integer;
       function InsCveOpeCont (peCVEOPERCRED, peCVECOMISION, peCVECONCEPTO, peCVETIPOMOVTO, peCVE_OPE_CONT : String) : boolean;
    public
    { Public declarations }
    Objeto : TCorrecP;
end;
 TCorrecP= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        ParamCre                 : TParamCre;

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


constructor TCorrecP.Create( AOwner : TComponent ); 
begin Inherited; 
      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCorrecP.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCorrecP.Destroy;
begin inherited;
end;


function TCorrecP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCorrecP;
begin
   W:=TWCorrecP.Create(Self);
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


Function TCorrecP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICorrecP.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCorrecP.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CorrecP********************)
(*                                                                              *)
(*  FORMA DE CorrecP                                                            *)
(*                                                                              *)
(***********************************************FORMA CorrecP********************)

function TWCorrecP.Reinicia_ContDolares( peF_REINICIO: STring ) : Integer;
var   StpReinConDolar : TStoredProc;
Begin
   try
     StpReinConDolar := TStoredProc.Create(Self);
     with StpReinConDolar do
     begin
        //Inicia el SPT
        StpReinConDolar.DatabaseName:= Objeto.Apli.DatabaseName;
        StpReinConDolar.SessionName:= Objeto.Apli.SessionName;
        StpReinConDolar.StoredProcName:= 'PKGCR_CORRECPCORP.STP_REINCONTA_DOLAR';
        Params.Clear;
        Params.CreateParam(ftDate,    'PEF_REINICIO', ptInput);
        Params.CreateParam(ftString,  'PEBCOMMIT',    ptInput);
        Params.CreateParam(ftInteger, 'PSFOL_GENERACION',  ptOutput);
        Params.CreateParam(ftFloat,   'PSRESULTADO',  ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peF_Reinicio').AsDateTime := StrToDateTime(peF_REINICIO);
        ParamByName('peBCommit').AsString := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           Reinicia_ContDolares:=0;

           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('No fue posible Reiniciar Dolares de la Fecha: ' + peF_REINICIO +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Objeto.Apli);
        end
        else
           Reinicia_ContDolares:=ParamByName('psFol_Generacion').AsInteger;
     end;
   finally
      StpReinConDolar.Free;
   end;
end;


function TWCorrecP.InsCveOpeCont( peCVEOPERCRED, peCVECOMISION, peCVECONCEPTO, peCVETIPOMOVTO, peCVE_OPE_CONT : String) : boolean;
var   StpInsCveOpeCont : TStoredProc;
      vlQry : TQuery;
Begin
  { try
     vlQry := TQuery.Create(Self);
     vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
     vlQry.SessionName   := Objeto.Apli.SessionName;
     vlQry.close;

     vlQry.SQL.Text:= ' INSERT INTO CR_CONT_OPE_CON ' +
                      '	  (ID_EMPRESA, CVE_OPER_CRED, CVE_COMISION, CVE_CONCEPTO, CVE_TIPO_MOVTO, CVE_OPE_CONT )' +
                      ' VALUES ' +
	              '   (2, '''+peCVEOPERCRED+''','''+ peCVECOMISION+''','''+peCVECONCEPTO+''','''+peCVETIPOMOVTO+''','''+peCVE_OPE_CONT+''')';
     vlQry.ExecSQL;

   finally
       vlQry.close;
   end;
   }
   try
     StpInsCveOpeCont := TStoredProc.Create(Self);
     with StpInsCveOpeCont do
     begin
        //Inicia el SPT
        StpInsCveOpeCont.DatabaseName:= Objeto.Apli.DatabaseName;
        StpInsCveOpeCont.SessionName:= Objeto.Apli.SessionName;
        StpInsCveOpeCont.StoredProcName:= 'PKGCR_CORRECPCORP.STP_INSOPECON';
        Params.Clear;
        Params.CreateParam(ftDate,    'peIDEMPRESA', ptInput);
        Params.CreateParam(ftDate,    'peCVEOPERCRED', ptInput);
        Params.CreateParam(ftDate,    'peCVECOMISION', ptInput);
        Params.CreateParam(ftDate,    'peCVECONCEPTO', ptInput);
        Params.CreateParam(ftDate,    'peCVETIPOMOVTO', ptInput);
        Params.CreateParam(ftDate,    'peCVE_OPE_CONT', ptInput);
        Params.CreateParam(ftString,  'PEBCOMMIT',    ptInput);
        Params.CreateParam(ftFloat,   'PSRESULTADO',  ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIDEMPRESA').AsInteger := Objeto.Apli.IdEmpresa;
        ParamByName('peCVEOPERCRED').AsString := peCVEOPERCRED;
        ParamByName('peCVECOMISION').AsString := peCVECOMISION;
        ParamByName('peCVECONCEPTO').AsString := peCVECONCEPTO;
        ParamByName('peCVETIPOMOVTO').AsString := peCVETIPOMOVTO;
        ParamByName('peCVE_OPE_CONT').AsString := peCVE_OPE_CONT;
        ParamByName('peBCommit').AsString := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           InsCveOpeCont:=false;

           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('No fue posible Insertar la Clave: ' + peCVEOPERCRED +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Objeto.Apli);
        end
        else
           InsCveOpeCont:=true;
     end;
   finally
      StpInsCveOpeCont.Free;
   end;
                   
end;


procedure TWCorrecP.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   InterForma1.BtnNuevo.Visible:=false;
   InterForma1.BtnAceptar.Visible:=false;
   InterForma1.BtnModificar.Visible:=false;
   InterForma1.BtnEliminar.Visible:=false;
   InterForma1.BtnBuscar.Visible:=false;
   InterForma1.BtnImprimir.Visible:=false;
   InterForma1.BtnPreview.Visible:=false;
   InterForma1.BtnCancelar.Visible:=false;
end;

procedure TWCorrecP.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCorrecP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCorrecP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCorrecP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCorrecpcorp.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCorrecP.btACEPTARClick(Sender: TObject);
var vlFol_Generacion : integer;
begin
   if Objeto.ValidaAccesoEsp('TCORRECP_ACEP',True,True) then
   begin
       if MessageDlg('¿Esta seguro de Reiniciar la Contabilidad de Dolares a esta Fecha?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          vlFol_Generacion := Reinicia_ContDolares( edF_REINICIO.Text );
          if vlFol_Generacion > 0 then
             MessageDlg('El Reinicio se realizo con Exito, el Folio Regenerado es el: ' + IntToStr(vlFol_Generacion), mtConfirmation, [mbOK], 0);
       end;
   end;
end;

procedure TWCorrecP.BguardarClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCORRECP_GUARD',True,True) then
   begin
       if (Trim(cbCVE_OPER_CRED.Text)<>'') and (Trim(cbCVE_TIPO_MOVTO.Text)<>'') and
          (Trim(cbCVE_COMISION.Text)<>'') and (Trim(cbCVE_OPE_CONT.Text)<>'') and
          (Trim(cbCVE_CONCEPTO.Text)<>'') then
       begin
          if MessageDlg('¿Esta seguro de Insertar la Clave?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
             if InsCveOpeCont( cbCVE_OPER_CRED.Text, cbCVE_COMISION.Text, cbCVE_CONCEPTO.Text, cbCVE_TIPO_MOVTO.Text, cbCVE_OPE_CONT.Text) then
                MessageDlg('La clave de Operacion se Inserto Correctamente', mtConfirmation, [mbOK], 0);
          end;
       end
       else
         MessageDlg('Falta algun valor', mtError, [mbOK], 0);
   end;
end;

end.




