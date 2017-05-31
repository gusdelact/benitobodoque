//******************************************************************************
// Sistema         : Clase TDVMovTes
// Fecha de Inicio : 16/04/1999
// Función forma   : Clase de Aplicación de Movimientos de Tesorería(DPVISTA)
// Diseñado por    : Marcos Zárate Castro.
//******************************************************************************
Unit InDVMovTes;
interface
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,IntFrm,DB,
DbTables,Mask,StdCtrls,Buttons,ExtCtrls,InterFor,IntFind,UnSQL2,InterFun,ComCtrls,
IntDtPk, IntCtoHeader, Grids,Wwdbigrd,Wwdbgrid, Wwquery, Wwdatsrc,UnConDV,
Ungene, DBCtrls,InterEdit, IntLinkit, IntSGCtrl, IntDvOperaci, UnQRAcuTes, UnQRRechTes,
IntCtoPanel, InDVSolDep,
UnSegBtn;

Type
 TDVMovTes= class;
  TWDVMovTes=Class(TForm)
    gbSeleccion: TGroupBox;
    lbID_CONTRATO: TLabel;
    edTitular: TEdit;
    p: TBitBtn;
    edID_CONTRATO: TInterEdit;
    Label3: TLabel;
    edCve_Operacion: TEdit;
    bbOperacion: TBitBtn;
    edDesc_Operacion: TEdit;
    InterForma1: TInterForma;
    iedImporte: TInterEdit;
    Label4: TLabel;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    bbAplicar: TBitBtn;
    Label1: TLabel;
    iedComision: TInterEdit;
    mRespuesta: TMemo;
    lbTX_COMENTARIO: TLabel;
    edTXComentario: TEdit;
    spCorpo: TStoredProc;
    InterCtoPanel1: TInterCtoPanel;
    MEMON: TMemo;
    Button1: TButton;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure pClick(Sender: TObject);
    procedure bbOperacionClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure ValidaCto;
    procedure AplicaMovto;
    procedure EstableceOper;
    procedure bbAplicarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function MapeoDPVistaTeso(opeVista: String):Boolean;
    procedure AplicaMovtoTeso(opeVista: String);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto      : TDVMovTes;
    function  Salir(pControl:TWinControl):Boolean;
 end;
 TDVMovTes = class(TInterFrame)
      private
      protected
      public
        SolicDepo: TDVSolDepo;
        { Public declarations }
        Id_Contrato   : TInterCampo;
        Id_Contrato_DV: TInterCampo;
        Cve_Operacion : TInterCampo;
        Imp_Trans     : TInterCampo;
        Imp_Comis     : TInterCampo;
        Tx_Comentario : TInterCampo;
        Contrato      : TCtrlCto;
        Operacion     : TDvOperaci;
        id_Cto_Nuevo  : Integer;
        Cve_Oper_Nvo  : String;
        SoloDepositos : Boolean;
        DestruirCto   : Boolean;
        procedure   databasechange;override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
uses xfuncs;
{$R *.DFM}

constructor TDVMovTes.Create( AOwner : TComponent );
begin Inherited;
      Id_Contrato   := CreaCampo('Id_Contrato',ftFloat,tsNinguno,tsNinguno,False);
      Id_Contrato_DV:= CreaCampo('ID_CONTRATO_DV',ftFloat,tsNinguno,tsNinguno,False);
      Cve_Operacion := CreaCampo('Cve_Operacion',ftString,tsNinguno,tsNinguno,False);
      Imp_Trans     := CreaCampo('Imp_Trans',ftFloat,tsNinguno,tsNinguno,False);
      Imp_Comis     := CreaCampo('Imp_Comis',ftFloat,tsNinguno,tsNinguno,False);
      Tx_Comentario := CreaCampo('Tx_Comentario',ftString,tsNinguno,tsNinguno,False);
      Contrato    :=TCtrlCto.Create(Self);
      Operacion   :=TDvOperaci.Create(Self);
      UseQuery    := False;
      id_Cto_Nuevo:=-1;
      Cve_Oper_Nvo:= '';
      SoloDepositos:=False;
      DestruirCto  :=True;
      SolicDepo:= TDVSolDepo.Create(Self);
      SolicDepo.MasterSource:= Self;
      SolicDepo.ID_FOL_DEPOSITO.MasterField:= 'ID_FOL_DEPOSITO';
end;

Destructor TDVMovTes.Destroy;
begin if (Contrato<>Nil) and DestruirCto then Contrato.free;
      if Operacion   <> Nil then Operacion.free;
      if SolicDepo <> Nil then SolicDepo.Free;
      inherited;
end;

procedure TDVMovTes.databasechange;
begin inherited;
      Contrato.GetParams(Self);
      Operacion.GetParams(Self);
      SolicDepo.GetParams(Self);
end;

function TDVMovTes.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDVMovTes;
begin W:=TWDVMovTes.Create(Self);
      try
         W.Objeto:= Self;
         W.InterForma1.InterFrame      :=Self;
         W.InterForma1.FormaTipo       :=ftConsulta;
         W.InterForma1.Funcion         :=FInterFun;
         W.InterForma1.ShowModal;
         ShowWindow := W.InterForma1.ModalResult;
      finally
         W.Free;
      end;
end;

(********************************************************************************)
(*                                                                              *)
(*                        FORMA DE TCancTrnSB                                   *)
(*                                                                              *)
(********************************************************************************)

procedure TWDVMovTes.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWDVMovTes.FormShow(Sender: TObject);
begin mRespuesta.Clear;
      Objeto.Contrato.Id_Contrato.Control:=edID_CONTRATO;
      Objeto.Contrato.TITNombre.Control  :=edTitular;
      Objeto.Operacion.CVE_OPERACION.Control     :=edCve_Operacion;
      Objeto.Operacion.DESC_L_ID_PRIM.Control    :=edDesc_Operacion;
      Objeto.Id_Contrato.Control:=edID_CONTRATO;
      Objeto.Cve_Operacion.Control:=edCve_Operacion;
      Objeto.Imp_Trans.Control:=iedImporte;
      Objeto.Imp_Comis.Control:=iedComision;
      Objeto.Operacion.IMP_COMISION.Control:=iedComision;
      Objeto.Tx_Comentario.Control:=edTxComentario;
      spCorpo.DatabaseName:=Objeto.Apli.DataBaseName;
      spCorpo.SessionName :=Objeto.Apli.SessionName;
      InterCtoPanel1.Frame:= Objeto.Contrato;
      if Objeto.id_Cto_Nuevo <> -1 then
      begin
        Objeto.Contrato.FindKey([Objeto.id_Cto_Nuevo]);
        ValidaCto;
        EstableceOper;
        If Objeto.Cve_Oper_Nvo <> '' Then Begin
           Objeto.Operacion.FindKey([Objeto.Cve_Oper_Nvo]);
           bbAplicar.SetFocus;
        End;
      end;
      If Objeto.Cve_Oper_Nvo = '' Then
         edID_CONTRATO.SetFocus;
end;

procedure TWDVMovTes.FormHide(Sender: TObject);
begin Objeto.Contrato.Id_Contrato.Control:=nil;
      Objeto.Contrato.TITNombre.Control  :=nil;
      Objeto.Operacion.CVE_OPERACION.Control :=nil;
      Objeto.Operacion.DESC_L_ID_PRIM.Control:=nil;
      Objeto.Id_Contrato.Control:=nil;
      Objeto.Cve_Operacion.Control:=nil;
      Objeto.Imp_Trans.Control:=nil;
      Objeto.Imp_Comis.Control:=nil;
      Objeto.Operacion.IMP_COMISION.Control:=nil;
      Objeto.Tx_Comentario.Control:=nil;
end;

procedure TWDVMovTes.ValidaCto;
begin if Objeto.Contrato.Active then
      begin
        if Not ( (Objeto.Contrato.Cve_Tip_Contrato.AsString = cCDVIBco) or
                 (Objeto.Contrato.Cve_Tip_Contrato.AsString = cCDVIfs)  or
                 (Objeto.Contrato.Cve_Tip_Contrato.AsString = cCDVIBDl)
               )
        then begin
               messagedlg('No puede operar con este tipo de contrato',mtError,[mbOK],0);
               Objeto.Contrato.Active:=False;
             end
        else begin
               if Objeto.Contrato.Id_Empresa.AsInteger <> cEmpBanco
               then begin
                      if Objeto.SoloDepositos
                      then begin
                             Objeto.Operacion.Active:=False;
                             Objeto.Operacion.FilterString:='';
                             Objeto.Operacion.BuscaWherestring:='';
                             if EsContraCuenta(Objeto.Contrato)
                             then begin
                                    Objeto.Operacion.BuscaWherestring:='CVE_OPERACION = ''DTRCON'' ';
                                    Objeto.Operacion.FindKey(['DTRCON']);
                                  end
                             else begin
                                    Objeto.Operacion.BuscaWherestring:='CVE_OPERACION = ''DINPAG'' ';
                                    Objeto.Operacion.FindKey(['DINPAG']);
                                  end;
                           end
                      else begin
                             if EsContraCuenta(Objeto.Contrato)
                             then Objeto.Operacion.BuscaWherestring:='B_APL_TESOR_IFS=''V'' AND CVE_OPERACION IN(''DTRCON'',''RTRCON'')'
                             else Objeto.Operacion.BuscaWherestring:='B_APL_TESOR_IFS=''V'' AND CVE_OPERACION NOT IN(''DTRCON'',''RTRCON'')';
                           end;
                    end
               else Objeto.Operacion.BuscaWherestring:='B_APL_TESOR = ''V'' ';
               Objeto.Operacion.FilterString:=Objeto.Operacion.BuscaWherestring;
               if Not Objeto.SoloDepositos then Objeto.Operacion.Active:=False;
               mRespuesta.Clear;
             end;
      end;
end;

procedure TWDVMovTes.pClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVMOVTES_BTN0',true, true) THEN EXIT;

  if Objeto.Contrato.Busca then ValidaCto;
end;

function TWDVMovTes.Salir(pControl:TWinControl):Boolean;
begin Salir:=Interforma1.IsCancel;
end;

procedure TWDVMovTes.bbOperacionClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVMOVTES_BTN1',true, true) THEN EXIT;

  if Not Objeto.Contrato.Active
      then begin
             MessageDlg('Debe seleccionar un contrato ',mtError,[mbOK],0);
             edID_CONTRATO.Setfocus;
           end
      else if Objeto.Operacion.Busca then EstableceOper;
end;


procedure TWDVMovTes.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=True;
end;

procedure TWDVMovTes.InterLinkit1Ejecuta(Sender: TObject);
begin if Objeto.Contrato.FindKey([InterLinkit1.Buffer]) then ValidaCto;
end;

procedure TWDVMovTes.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=True;
end;

procedure TWDVMovTes.InterLinkit2Ejecuta(Sender: TObject);
begin if Not Objeto.Contrato.Active
      then begin
             MessageDlg('Debe seleccionar un contrato ',mtError,[mbOK],0);
             edID_CONTRATO.Setfocus;
           end
      else if Objeto.Operacion.FindKey([InterLinkit2.Buffer]) then EstableceOper;
end;

procedure TWDVMovTes.EstableceOper;
begin //Verifica si la operación establece un contrato default
      if (Objeto.Operacion.CVE_OPERACION.AsString ='DCITYB') or
         (Objeto.Operacion.CVE_OPERACION.AsString ='RCITYB')
      then Objeto.Contrato.FindKey(['309900184']);
      //Verifica si la operación cobra comisión
      iedComision.Enabled:=(Objeto.Operacion.IMP_COMISION.AsFloat > 0);
      mRespuesta.Clear;
end;

procedure TWDVMovTes.bbAplicarClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVMOVTES_BTN2',true, true) THEN EXIT;

  Objeto.GetFromControl;
      if Not Objeto.Contrato.Active
      then begin
             messagedlg('Debe seleccionar un contrato',mtError,[mbOK],0);
             edid_Contrato.SetFocus;
           end
      else if Not Objeto.Operacion.Active
           then begin
                  messagedlg('Debe seleccionar una operación',mtError,[mbOK],0);
                  edCve_Operacion.SetFocus;
                end
           else if (Objeto.Imp_Trans.AsString='') or
                   (Objeto.Imp_Trans.AsFloat=0)
                then begin
                       messagedlg('Debe indicar un importe',mtError,[mbOK],0);
                       iedImporte.SetFocus;
                     end
                else if (Objeto.Imp_Trans.AsFloat < 50000) and
                        ((Objeto.Operacion.CVE_OPERACION.AsString = 'DSPEUA') or
                         (Objeto.Operacion.CVE_OPERACION.AsString = 'RSPEUA'))
                     then begin
                            messagedlg('El importe de la transacción para un SPEUA debe ser >= $50,000.00',mtError,[mbOK],0);
                            iedImporte.SetFocus;
                          end
                     else if Objeto.Imp_Comis.AsString=''
                          then begin
                                 messagedlg('Debe indicar un importe de comisión',mtError,[mbOK],0);
                                 iedComision.SetFocus;
                               end
                          else begin
                                  if MapeoDPVistaTeso(Objeto.Operacion.CVE_OPERACION.AsString) then
                                  begin
                                    if Messagedlg('El movimiento tendra afectacion en el sistema de Tesoreria Operativa, ¿Desea Continuar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                                    begin
                                 if Messagedlg('¿Confirma el movimiento?',mtConfirmation,[mbYes,mbNo],0) <> mrYes
                                 then Exit
                                       else AplicaMovtoTeso(Objeto.Operacion.CVE_OPERACION.AsString);
                                    end
                                    else Exit;
                                  end
                                  else
                                  begin
                                     if Messagedlg('¿Confirma el movimiento?',mtConfirmation,[mbYes,mbNo],0) <> mrYes
                                     then Exit
                                 else AplicaMovto;
                                  end;
                               end;
end;

procedure TWDVMovTes.AplicaMovto;
Var vlGpoTran : Double;
    vlInterfin:Boolean;
begin
      { Prepara }
      spCorpo.Params.Clear;
      spCorpo.Params.CreateParam(ftString ,'VUSUARIO' ,ptInput);
      spCorpo.Params.CreateParam(ftString ,'VCVEOPER' ,ptInput);
      spCorpo.Params.CreateParam(ftFloat  ,'VIDCONT'  ,ptInput);
      spCorpo.Params.CreateParam(ftFloat  ,'VIMPTRANS',ptInput);
      spCorpo.Params.CreateParam(ftString ,'VTXREFER' ,ptInput);
      spCorpo.Params.CreateParam(ftFloat  ,'VIMPCOMIS',ptInput);
      spCorpo.Params.CreateParam(ftString ,'VBCOMMIT' ,ptInput);
      spCorpo.Params.CreateParam(ftFloat  ,'VGPOTRANS',ptOutput);
      spCorpo.Params.CreateParam(ftString ,'VRESP'    ,ptOutput);
      spCorpo.Params.CreateParam(ftString ,'VDESCPROC',ptOutput);

      //Verifica si el contrato está bloqueado para hacer una operación de retiro
      if (Objeto.Operacion.CVE_AF_SDO_EFE.AsString = cDecrementa) and
         (Objeto.Contrato.Id_Empresa.AsFloat <> cEmpBanco) then
      begin
         Objeto.Id_Contrato_DV.AsFloat:=Objeto.Id_Contrato.AsFloat;
         if CtoBloqRet(Objeto) then Exit;
      end;

      vlInterfin:=(Objeto.Contrato.Id_Empresa.AsInteger = cEmpifs);
      spCorpo.ParamByName('VUsuario').AsString :=Objeto.Apli.Usuario;
      spCorpo.ParamByName('VCveOper').AsString :=Objeto.Cve_Operacion.AsString;
      spCorpo.ParamByName('VidCont').AsFloat   :=Objeto.Id_Contrato.AsFloat;
      spCorpo.ParamByName('VImpTrans').AsFloat :=Objeto.Imp_Trans.AsFloat;
      spCorpo.ParamByName('VTxRefer').AsString :=Objeto.Tx_Comentario.AsString;
      spCorpo.ParamByName('VImpComis').asFloat :=Objeto.Imp_Comis.AsFloat;
      spCorpo.ParamByName('VBCommit').AsString :='V';

      spCorpo.ExecProc;
      Messagebeep(0);
      mrespuesta.Lines.Add('Código : ' + spCorpo.ParamByName('VResp').AsString);
      mRespuesta.Lines.Add(spCorpo.ParamByName('VDescProc').AsString + ', Contrato ' + Objeto.Id_Contrato.AsString + ', Importe ' + FormatFloat('$##,##0.00',Objeto.Imp_Trans.AsFloat));
      vlGpoTran:=spCorpo.ParamByName('VGpoTrans').asFloat;
      if Objeto.Contrato.Id_Empresa.AsInteger = cEmpBanco then
      begin
        if spCorpo.ParamByName('VResp').AsInteger = 0
        then begin
               Messagedlg('Transacción aprobada',mtInformation,[mbOK],0);
               //EXECUTE_ACUSETESO(False,vlGpoTran,Objeto.Apli,vlInterfin, spCorpo.ParamByName('VDescProc').AsString);
             end
        else begin
               Messagedlg('Transacción rechazada',mtError,[mbOK],0);
               //EXECUTE_RECHAZOTESO(False,0,Objeto.Contrato.Id_Contrato.AsFloat,Objeto.Contrato.TITNombre.AsString,Objeto.Operacion.DESC_L_ID_PRIM.AsString,Objeto.Imp_Trans.AsFloat,Objeto.Apli, vlInterfin,spCorpo.ParamByName('VDescProc').AsString);
             end;
      end;
      Objeto.Imp_Trans.AsFloat:=0;
      Objeto.Imp_Trans.DrawControl;
      edID_CONTRATO.SetFocus;
end;

procedure TWDVMovTes.AplicaMovtoTeso(opeVista: String);
var
    sSQL :String;
    vlQry : TQuery;
begin
   Objeto.SolicDepo.Append;
   Objeto.SolicDepo.ID_CONTRATO.AsFloat:= Objeto.Id_Contrato.AsFloat;
   Objeto.SolicDepo.IMP_TRANS.AsFloat:= Objeto.Imp_Trans.AsFloat;
   Objeto.SolicDepo.CVE_OPERACION.AsString:= Objeto.Cve_Operacion.AsString;
   Objeto.SolicDepo.CVE_USUAR_ALTA.AsString:= Objeto.Apli.Usuario;
   Objeto.SolicDepo.TX_COMENTARIO.AsString:= Objeto.Tx_Comentario.AsString;
   sSQL:= ' SELECT * FROM DV_OPER_TESOR ' +
          ' WHERE CVE_OPERACION = ''' +
          opeVista +
	  ''' AND B_AF_TESO_CQH = ''V'' ';
   vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   Try
      If vlQry <> Nil Then
      begin
        Objeto.SolicDepo.CVE_INSTRUMENTO.AsString:= vlQry.FieldBYNAME('CVE_INSTRUMENTO').AsString;
      end
      else
        exit;
   Finally
     If vlQry <> Nil Then
        vlQry.free;
   end;
   TRY
      Objeto.SolicDepo.OldPost;
      mRespuesta.Lines.Add(' Contrato ' + Objeto.Id_Contrato.AsString + ', Importe ' + FormatFloat('$##,##0.00',Objeto.Imp_Trans.AsFloat)+ '; Pendiente de autorizar');
      Messagedlg('Transacción aprobada',mtInformation,[mbOK],0);
   EXCEPT
        Messagedlg('Transacción rechazada',mtError,[mbOK],0);
   END;
   Objeto.Imp_Trans.AsFloat:=0;
   Objeto.Imp_Trans.DrawControl;
   edID_CONTRATO.SetFocus;
end;
procedure TWDVMovTes.Button1Click(Sender: TObject);
var i: Integer;
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVMOVTES_BTN3',true, true) THEN EXIT;


  for i:=0  to MEMON.Lines.Count -1  do begin
    ParseByTokens(['|'], MEMON.LINES[I]);
    Objeto.Cve_Operacion.AsString := 'DESPEI';
    Objeto.Id_Contrato.AsFloat :=STRTOFLOAT(xResStr[2]);
    //STRTOFLOAT(xResStr[2]);
    //300095729;
    Objeto.Imp_Trans.AsFloat  := STRTOFLOAT( xResStr[1] );
    Objeto.Tx_Comentario.AsString :=  xResStr[3];
    Objeto.Imp_Comis.AsFloat := 0;
    AplicaMovto;
  end;
end;

function TWDVMovTes.MapeoDPVistaTeso(opeVista: String):Boolean;
var
    sSQL :String;
    vlQry : TQuery;
begin
   sSQL:= ' SELECT * FROM DV_OPER_TESOR ' +
          ' WHERE CVE_OPERACION = ''' +
          opeVista +
	  ''' AND B_AF_TESO_CQH = ''V'' ';
   vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   Try
      If vlQry <> Nil Then
      begin
        MapeoDPVistaTeso:= True;
      end
      else
      begin
        MapeoDPVistaTeso:= False;
      end;
   Finally
     If vlQry <> Nil Then
        vlQry.free;
   end;
end;
end.
