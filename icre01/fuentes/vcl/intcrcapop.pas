{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CrCapOp
// Fecha de Inicio : 24/06/2003
// Función forma   : Clase de CrCapOp
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCapOp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,
  InterEdit, IntLinkit,

//Unidades Adicionales
IntCrOperaci, IntCrCredito, IntCrCto,IntCrComisio, IntParamCre,
IntCrReOpCo, IntGenCre;

Type
 TCrcapop= class;

  TWCrCapOp=Class(TForm)
    InterForma1             : TInterForma;
    edCVE_OPERACION: TEdit;
    lbCVE_OPERACION: TLabel;
    lbCVE_COMISION: TLabel;
    btCONTRATO: TBitBtn;
    btOPERACION: TBitBtn;
    edDESC_OPER: TEdit;
    edDESC_CONTRATO: TEdit;
    ilCONTRATO: TInterLinkit;
    ilOPERACION: TInterLinkit;
    edCREDITO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCOMISION: TEdit;
    btCOMISION: TBitBtn;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    edDESC_COMISION: TEdit;
    ilCOMISION: TInterLinkit;
    ilCREDITO: TInterLinkit;
    Label3: TLabel;
    lbIMP_DISPUESTO: TLabel;
    edIMP_NETO: TInterEdit;
    edCOMENTARIO: TEdit;
    Label4: TLabel;
    sagCONCEPTO: TStringAlignGrid;
    btAgregar: TBitBtn;
    btQuitar: TBitBtn;
    Bevel1: TBevel;
    edCVE_CONCEPTO: TEdit;
    btCONCEPTO: TBitBtn;
    edDESC_CONCEPTO: TEdit;
    edIMP_CONCEPTO: TInterEdit;
    Label5: TLabel;
    ilCONCEPTO: TInterLinkit;
    Label6: TLabel;
    edPERIODO: TInterEdit;
    gbFOLIO: TGroupBox;
    lbFOLIO: TLabel;
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
    edID_CONTRATO: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btOPERACIONClick(Sender: TObject);
    procedure ilOPERACIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilOPERACIONEjecuta(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure btAgregarClick(Sender: TObject);
    procedure btCONCEPTOClick(Sender: TObject);
    procedure ilCONCEPTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONCEPTOEjecuta(Sender: TObject);
    procedure btQuitarClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure edCVE_OPERACIONExit(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edCREDITOExit(Sender: TObject);
    procedure edCOMISIONExit(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
    procedure edCOMENTARIOExit(Sender: TObject);
    procedure edCVE_CONCEPTOExit(Sender: TObject);
    procedure edIMP_CONCEPTOExit(Sender: TObject);
    procedure btAgregarExit(Sender: TObject);
    procedure btQuitarExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrcapop;
end;
 TCrcapop= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_OPERACION            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_FOLIO                 : TInterCampo;
        CVE_COMISION             : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        COMENTARIO               : TInterCampo;
        CVE_CONCEPTO             : TInterCampo;
        IMP_CONCEP               : TInterCampo;
        IMP_NETO                 : TInterCampo;

        Operacion                : TCrOperaci;
        ContratoCre              : TCrCto;
        Credito                  : TCrCredito;
        Comision                 : TCrComisio;
        ParamCre                 : TParamCre;
        RelConOp                 : TCrReOpCo;



        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    InternalPost : Boolean; override;
        function    GeneraTransac( peCveOperacion : String; peContrato, peFolContrato, peCredito,
                                   peNumPeriodo, peIdCtoLiq : integer; peCveComision : String;
                                   peImpNeto : Double;peComentario : String; var psFolio : Double ): Boolean;
        function    ActivaConcepto : Boolean;
        Function    GeneraConcepto(peCveConcepto : String; peImpConcepto : Double) : Boolean;
        function    ObtenChqraCte(peIdCredito, peIdAcreditado: Integer): Integer;

      published
      end;
// Salta Renglon vacio
      function IsEmptyRow(StringGrid : TStringGrid; nRow : Integer) : Boolean;

implementation

{$R *.DFM}

function IsEmptyRow(StringGrid : TStringGrid; nRow : Integer) : Boolean;
var J : Integer;
    bEmpty : Boolean;
begin
 Result := True;
 If Assigned(StringGrid) And (nRow > -1) Then
  With StringGrid Do
   For J := 0 To ColCount-1 do
    Begin
    bEmpty := Trim(Cells[J,nRow]) = '';
    If Not bEmpty Then Begin Result := False; Break; End;
    End;
end;

constructor TCrcapop.Create( AOwner : TComponent );
begin Inherited;
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,False);
                CVE_OPERACION.Caption:='Id Operación';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftString,tsNinguno,tsNinguno,False);
                ID_CONTRATO.Caption:='Id Contrato';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftString,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption:='Id Credito';
      ID_FOLIO :=CreaCampo('ID_FOLIO',ftFloat,tsNinguno,tsNinguno,False);
                ID_FOLIO.Caption:='Folio';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,False);
                CVE_COMISION.Caption:='Cve. Comisión';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,False);
                NUM_PERIODO.Caption:='Periodo';
      COMENTARIO :=CreaCampo('COMENTARIO',ftString,tsNinguno,tsNinguno,False);
                COMENTARIO.Caption:='Comentario';
      CVE_CONCEPTO :=CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,False);
                CVE_CONCEPTO.Caption:='Concepto';
      IMP_CONCEP :=CreaCampo('IMP_CONCEP',ftInteger,tsNinguno,tsNinguno,False);
                IMP_CONCEP.Caption:='Importe';
      IMP_NETO :=CreaCampo('IMP_NETO',ftInteger,tsNinguno,tsNinguno,False);
                IMP_NETO.Caption:='Imp. Neto';

      StpName  := '';
      UseQuery := False;
      HelpFile := 'IntCrCapOp.Hlp';
      ShowMenuReporte:=True;

      Operacion := TCrOperaci.Create(Self);
      Operacion.MasterSource:=Self;
      Operacion.FieldByName('CVE_OPERACION').MasterField:='CVE_OPERACION';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Comision := TCrComisio.Create(Self);
      Comision.MasterSource:=Self;
      Comision.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      Comision.FieldByName('CVE_COMISION').MasterField:='CVE_COMISION';

      RelConOp := TCrReOpCo.Create(Self);
      RelConOp.MasterSource:=Self;
      RelConOp.FieldByName('CVE_CONCEPTO').MasterField:='CVE_CONCEPTO';
      RelConOp.FieldByName('CVE_OPERACION').MasterField:='CVE_OPERACION';


end;

Destructor TCrcapop.Destroy;
begin
      if Operacion <> nil then
         Operacion.free;
      //end if

      if ContratoCre <> nil then
         ContratoCre.free;
      //end if

      if Credito <> nil then
         Credito.free;
      //end if

      if Comision <> nil then
         Comision.free;
      //end if

      if RelConOp <> nil then
         RelConOp.free;
      //end if
   inherited;
end;


function TCrcapop.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCapOp;
begin
   W:=TWCrCapOp.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrcapop.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCapOp.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrcapop.GeneraTransac( peCveOperacion : String; peContrato, peFolContrato, peCredito,
     peNumPeriodo, peIdCtoLiq : integer; peCveComision : String; peImpNeto : Double;
     peComentario : String; var psFolio : Double ): Boolean;
var spInserTrn : TStoredProc;
//inicio GeneraTransac
begin
  Result := False;
  spInserTrn :=  TStoredProc.Create(Self);
  try
   with spInserTrn do
   begin
     spInserTrn.DatabaseName := apli.DataBaseName;
     spInserTrn.SessionName := apli.SessionName;
     spInserTrn.StoredProcName := 'PKGCRACTUALIZA.STPINSERTRECEP';
     Prepare;

     ParamByName('peCveOperacion').AsString := peCveOperacion;
     ParamByName('peIdContrato').AsInteger  := peContrato;
     ParamByName('peFolContrato').AsInteger  := peFolContrato;
     ParamByName('peIdCredito').AsInteger   := peCredito;
     ParamByName('peIdPeriodo').AsInteger   := peNumPeriodo;
     ParamByName('peIdCesion').AsFloat      := 0;
     ParamByName('peIdDocumento').AsString  := '';
     ParamByName('peCveComision').AsString  := peCveComision;
     ParamByName('peImpNeto').AsFloat       := peImpNeto;
     ParamByName('peIdCtoLiq').AsFloat      := peIdCtoLiq;
     ParamByName('peFOperacion').AsDate     := apli.DameFechaEmpresa;
     ParamByName('peFValor').AsDate         := apli.DameFechaEmpresa;
     ParamByName('peTxNota').AsString       := peComentario;
     ParamByName('peTipoCambio').AsFloat     := 1;
     ParamByName('peCveAplicSaldo').AsString := 'DEFAUL';
     ParamByName('peCveUsuAlta').AsString    := apli.Usuario;
     ParamByName('peBCommit').AsString       := 'V';
     ParamByName('peIdGrupoTransac').AsFloat := 0;
     ExecProc;
     psFolio := ParamByName('PSIDBITTRANSAC').AsFloat;

     if ParamByName('PSRESULTADO').AsInteger <> 0 then
       Showmessage('Problemas al grabar la transaccion ' + #13#10 +
                   'Error:'       + ParamByName('PSRESULTADO').AsString + #13#10 +
                   'Descripción:' + ParamByName('PSTXRESULTADO').AsString )
     else Result := True;
     UnPrepare;
   end;
  finally
    if Assigned(spInserTrn) then
      spInserTrn.Free;
  end;
end;  //End GeneraTransac

Function TCrcapop.GeneraConcepto(peCveConcepto : String; peImpConcepto : Double) : Boolean;
var spConcepto : TStoredProc;
//Inicio GeneraConcepto
begin
  Result := False;
  spConcepto :=  TStoredProc.Create(Self);
  try
  with spConcepto do
   begin
     spConcepto.DatabaseName := apli.DataBaseName;
     spConcepto.SessionName := apli.SessionName;
     spConcepto.StoredProcName := 'PKGCRACTUALIZA.STPINSERTCON';
     Prepare;
     ParamByName('PEIDBITTRANSAC').AsFloat := ID_FOLIO.AsFloat;
     ParamByName('PECVECONCEPTO').AsString := peCveConcepto;
     ParamByName('PEIMPCONCEPTO').AsFloat  := peImpConcepto;
     ParamByName('PEBCOMMIT').AsString     := 'V';
     ExecProc;
     if ParamByName('PSRESULTADO').AsInteger <> 0 then
       Showmessage( 'Concepto :'   + ParamByName('PECVECONCEPTO').AsString + #13#10 +
                    'Error:'       + ParamByName('PSRESULTADO').AsString + #13#10 +
                    'Descripción:' + ParamByName('PSTXRESULTADO').AsString )
     else Result := True;
     UnPrepare;
   end;
  finally
    if Assigned(spConcepto) then
      spConcepto.Free;
  end;
end; //end GeneraConcepto


function TCrcapop.ActivaConcepto : Boolean;
var spInsertRecep : TStoredProc;
//Inicio ActivaConcepto
begin
  Result := False;
  spInsertRecep :=  TStoredProc.Create(Self);
  try
    with spInsertRecep do
     begin
     spInsertRecep.DatabaseName := apli.DataBaseName;
     spInsertRecep.SessionName := apli.SessionName;
     spInsertRecep.StoredProcName := 'PKGCRACTUALIZA.STPACTIVATRN';

// Se crean los parametros del StoreProcedure
     Params.Clear;
     Params.CreateParam(ftFloat,'PEIDBITTRANSAC',ptInput);
     Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
     Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
     Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
     Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

//  Se quita el Prepare;

     ParamByName('PEIDBITTRANSAC').AsFloat := ID_FOLIO.AsFloat;
     ParamByName('PECVEUSUARIO').AsString :=  Apli.Usuario;
     ParamByName('PEBCOMMIT').AsString     := 'V';
     ExecProc;

     if ParamByName('PSRESULTADO').AsInteger <> 0 then
       Showmessage('Activa Result'  + #13#10 +
                   'Error:'       + ParamByName('PSRESULTADO').AsString + #13#10 +
                   'Descripción:' + ParamByName('PSTXRESULTADO').AsString)
     else Result := True;
     UnPrepare;
   end;
  finally
    if Assigned(spInsertRecep) then
      spInsertRecep.Free;
  end;
end; //End ActivaConcepto


//Sobreescribiendo el Internal Post

Function TCrcapop.InternalPost : Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;
     if Modo=moAppend then
     begin
          try
             VLSalida :=  ActivaConcepto; //Activa Concepto
          Except
               Beep;Beep;Beep;Beep;
               ShowMessage('Problemas al dar de Alta la Operación');
          end;
     end;
     InternalPost := VLSalida;
     AutoRefresh := False;
End;


function TCrcapop.ObtenChqraCte(peIdCredito, peIdAcreditado: Integer): Integer;
var vlSqlChqra : TQuery;
begin
  try
    vlSqlChqra := TQuery.Create(nil);
    try
      vlSqlChqra.DatabaseName := Apli.DataBaseName;
      vlSqlChqra.SessionName  := Apli.SessionName;
      vlSqlChqra.SQL.Clear;
      vlSqlChqra.SQL.Add( 'SELECT CUENTA_BANCO             ' +
                          'FROM CR_CRED_CHEQ               ' +
                          'WHERE ID_CREDITO     = ' + IntToStr( peIdCredito ) +
                          '  AND ID_ACREDITADO  = ' + IntToStr( peIdAcreditado ) +
                          '  AND ID_BANCO_CHQRA = 2        ' +
                          'ORDER BY B_PREDETERMINADA  DESC ' );

      vlSqlChqra.Open;
      if vlSqlChqra.IsEmpty then
        Result := 0
      else
      begin
        vlSqlChqra.First;
        Result := vlSqlChqra.FieldByName('CUENTA_BANCO').AsInteger;
      end;
      vlSqlChqra.Close;
    finally
       if Assigned(vlSqlChqra) then
         vlSqlChqra.Free;
    end;
  except
    result := 0;
  end;
end;



(***********************************************FORMA CrCapOp********************)
(*                                                                              *)
(*  FORMA DE CrCapOp                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCapOp********************)

procedure TWCrCapOp.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_OPERACION.Control:= edCVE_OPERACION;
      Objeto.ID_CONTRATO.Control:= edID_CONTRATO;
      Objeto.ID_CREDITO.Control:= edCREDITO;
      Objeto.ID_FOLIO.Control:= lbFOLIO;
      Objeto.CVE_COMISION.Control:= edCOMISION;
      Objeto.COMENTARIO.Control:= edCOMENTARIO;
      Objeto.IMP_NETO.Control:= edIMP_NETO;
      Objeto.CVE_CONCEPTO.Control:= edCVE_CONCEPTO;
      Objeto.IMP_CONCEP.Control:= edIMP_CONCEPTO;
      Objeto.NUM_PERIODO.Control:= edPERIODO;

      Objeto.Operacion.DESC_C_OPERACION.Control := edDESC_OPER;
      Objeto.Operacion.GetParams(Objeto);

      Objeto.ContratoCre.Contrato.TITNombre.Control := edDESC_CONTRATO;
      Objeto.ContratoCre.GetParams(Objeto);

      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
      Objeto.Credito.GetParams(Objeto);

      Objeto.Comision.CrCatComi.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comision.NUM_PERIODO.Control:= edPERIODO;
      Objeto.Comision.GetParams(Objeto);

      Objeto.RelConOp.Concepto.DESC_C_CONCEPTO.Control := edDESC_CONCEPTO;
      Objeto.RelConOp.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrCapOp.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.ID_FOLIO.Control:=nil;
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.COMENTARIO.Control:=nil;
      Objeto.IMP_NETO.Control:=nil;
      Objeto.CVE_CONCEPTO.Control:=nil;
      Objeto.IMP_CONCEP.Control:=nil;
      Objeto.NUM_PERIODO.Control:=nil;

      Objeto.Operacion.DESC_C_OPERACION.Control :=nil;
      Objeto.ContratoCre.Contrato.TITNombre.Control :=nil;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control :=nil;
      Objeto.Comision.CrCatComi.DESC_COMISION.Control := nil;
      Objeto.Comision.NUM_PERIODO.Control:= nil;
      Objeto.RelConOp.Concepto.DESC_C_CONCEPTO.Control := nil;

   //Objeto
end;

procedure TWCrCapOp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCapOp.InterForma1DespuesNuevo(Sender: TObject);
begin
    ClearGrid(sagCONCEPTO); //Limpia el grid
    edCVE_OPERACION.SetFocus;
end;

procedure TWCrCapOp.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCapOp.btOPERACIONClick(Sender: TObject);
begin
   Objeto.Operacion.ShowAll := True;
   if Objeto.Operacion.Busca then
      Begin
         InterForma1.NextTab(edCVE_OPERACION);
         //Verifica Accesorio Linea
         if Objeto.Operacion.CVE_ACCESORIO.AsString = 'LN' then
            Begin
               Objeto.Credito.Active := False;
               edCREDITO.Enabled := False;
               btCREDITO.Enabled := False;
               edCREDITO.Color := clBtnFace;

               Objeto.Comision.Active := False;
               edCOMISION.Enabled := False;
               edCOMISION.Color := clBtnFace;
               btCOMISION.Enabled := False;

               edPERIODO.Enabled := False;
               edPERIODO.Color := clBtnFace;

            end
         //Verifica Accesorio Credito
         else if(Objeto.Operacion.CVE_ACCESORIO.AsString = 'CR') then
            Begin
               Objeto.Credito.Active := True;
               edCREDITO.Enabled := True;
               btCREDITO.Enabled := True;
               edCREDITO.Color := clWindow;

               Objeto.Comision.Active := False;
               edCOMISION.Enabled := False;
               edCOMISION.Color := clBtnFace;
               btCOMISION.Enabled := False;

               edPERIODO.Enabled := False;
               edPERIODO.Color := clBtnFace;
            end
         //Verifica Accesorio Captal, Interes y CN
         else if(Objeto.Operacion.CVE_ACCESORIO.AsString = 'CP') or
                (Objeto.Operacion.CVE_ACCESORIO.AsString = 'IN') or
                (Objeto.Operacion.CVE_ACCESORIO.AsString = 'CN') then
               Begin
                   Objeto.Credito.Active := True;
                   edCREDITO.Enabled := True;
                   btCREDITO.Enabled := True;
                   edCREDITO.Color := clWindow;

                   Objeto.Comision.Active := False;
                   edCOMISION.Enabled := False;
                   edCOMISION.Color := clBtnFace;
                   btCOMISION.Enabled := False;

                   edPERIODO.Enabled := True;
                   edPERIODO.Color := clWindow;
                   //Verifica solo si es Accesorio CN
                   if(Objeto.Operacion.CVE_ACCESORIO.AsString = 'CN') then
                   Begin
                         Objeto.Comision.Active := True;
                         edCOMISION.Enabled := True;
                         edCOMISION.Color := clWindow;
                         btCOMISION.Enabled := True;
                   end; //end if
               end;
         ClearGrid(sagCONCEPTO); //Se obtiene de IntGenCre
      end;//end if busca
end;

procedure TWCrCapOp.ilOPERACIONCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCapOp.ilOPERACIONEjecuta(Sender: TObject);
begin
   if Objeto.Operacion.FindKey([ilOPERACION.Buffer]) then
      InterForma1.NextTab(edCVE_OPERACION);
   //end if
end;

procedure TWCrCapOp.btCONTRATOClick(Sender: TObject);
begin
   Objeto.ContratoCre.ShowAll := True;
   if Objeto.ContratoCre.Busca then
      InterForma1.NextTab(edID_CONTRATO);
   //end if
end;

  procedure TWCrCapOp.ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
  begin
Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCapOp.ilCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilCONTRATO.Buffer,'1']) then
      InterForma1.NextTab(edID_CONTRATO);
   //end if
end;

procedure TWCrCapOp.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.BuscaWhereString :=  'CR_CREDITO.ID_CONTRATO = ' +
                                        Objeto.ID_CONTRATO.AsString +
                                        ' AND CR_CREDITO.FOL_CONTRATO = ' +
                                        Objeto.ContratoCre.FOL_CONTRATO.AsString;
   Objeto.Credito.FilterString := Objeto.Comision.BuscaWhereString;

   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
      InterForma1.NextTab(edCREDITO);
   //end if
end;

procedure TWCrCapOp.ilCREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCapOp.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
      InterForma1.NextTab(edCREDITO);
   //end if
end;

procedure TWCrCapOp.btCOMISIONClick(Sender: TObject);
Begin
   Objeto.Comision.BuscaWhereString :=  'CR_COMISION.ID_CREDITO = ' +
                                        Objeto.ID_CREDITO.AsString;
   Objeto.Comision.FilterString := Objeto.Comision.BuscaWhereString;
   Objeto.Comision.ShowAll := True;
   if Objeto.Comision.Busca then
      InterForma1.NextTab(edCOMISION);
   //end if
end;

procedure TWCrCapOp.ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCapOp.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comision.FindKey([ilCOMISION.Buffer]) then
      InterForma1.NextTab(edCOMISION);
end;

procedure TWCrCapOp.btAgregarClick(Sender: TObject);

  //Valida si existe el concepto dentro del grid
  function IfExists(StringGrid : TStringGrid; nCol : Integer; strFind : String) : Boolean;
  var nRow : Integer;
      bExists : Boolean;
  //Inicio Funcion IfExists
  begin
   bExists := False;
   If Assigned(StringGrid) Then
    With StringGrid Do
     For nRow := 1 To RowCount - 1 Do
      Begin
      bExists := Trim(Cells[nCol,nRow]) = Trim(strFind);
      If bExists Then Break;
      End;
   Result := bExists;
  end;//End IfExists

var   nRowCount : Integer;
      vlImp           : Double;
//Inicio Adiciona Datos
begin
 With  Objeto Do
  Begin
    vlImp := 0;
    nRowCount := sagCONCEPTO.RowCount;

   If IfExists(sagCONCEPTO,0,edCVE_CONCEPTO.Text) Then
    ShowMessage('El concepto ya existe')
   Else
    Begin
       // si no Renglon vacio aumenta uno más, para empezar a agregar datos
       If Not IsEmptyRow(sagCONCEPTO,1) Then
          sagCONCEPTO.RowCount := nRowCount + 1
       Else nRowCount := 1;
       //end if
       IMP_CONCEP.GetFromControl;
       sagCONCEPTO.Cells[0,nRowCount] := CVE_CONCEPTO.AsString;
       sagCONCEPTO.Cells[1,nRowCount] := RelConOp.Concepto.DESC_C_CONCEPTO.AsString;
       sagCONCEPTO.Cells[2,nRowCount] := IMP_CONCEP.AsString;

       vlImp := IMP_CONCEP.AsFloat + vlImp;
       IMP_NETO.AsFloat := vlImp + IMP_NETO.AsFloat;

       CVE_CONCEPTO.GetFromControl;
    End;
  End;
end;

procedure TWCrCapOp.btCONCEPTOClick(Sender: TObject);
begin
   if Objeto.CVE_OPERACION.AsString <> '' then
      Begin
         Objeto.RelConOp.BuscaWhereString :=  'CR_REL_OPE_CON.CVE_OPERACION = ' +
                                              #39 +Objeto.CVE_OPERACION.AsString + #39;
         Objeto.RelConOp.FilterString := Objeto.RelConOp.BuscaWhereString;
         Objeto.RelConOp.ShowAll := True;
         if Objeto.RelConOp.Busca then
            InterForma1.NextTab(btCONCEPTO);
         //end if
         Objeto.CVE_CONCEPTO.AsString := Objeto.RelConOp.CVE_CONCEPTO.AsString;
      end
   else ShowMessage('Necesita elegir una Operación para poder elegir un Concepto');
end;

procedure TWCrCapOp.ilCONCEPTOCapture(Sender: TObject; var Show: Boolean);
begin
    Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCapOp.ilCONCEPTOEjecuta(Sender: TObject);
begin
   if Objeto.RelConOp.FindKey([ilCONCEPTO.Buffer]) then
      InterForma1.NextTab(edCVE_CONCEPTO);
end;


procedure TWCrCapOp.btQuitarClick(Sender: TObject);

   //Remueve las columnas hasta el tope
    procedure RoveData(StrGrd : TStringGrid);
    var I, J, nTop : Integer;
    begin
     With StrGrd Do
      Begin
      nTop := 0;
      For I := 1 To RowCount-1 Do
       Begin
        If Not IsEmptyRow(StrGrd,I) Then
         Begin
         Inc(nTop);
         If (nTop <> I) Then
         For J := 0 To ColCount-1 Do
          Begin
          Cells[J,nTop] := Cells[J,I];
          Cells[J,I] := '';
          End;
         End;
       End;
       I := RowCount - nTop - 1;
       If (RowCount - I) < 2 Then RowCount := 2
       Else RowCount := RowCount - I;
      End;
    end;//end RoveData

  //Calcula el importe neto
  function ImpNeto(StringGrid : TStringGrid; nCol : Integer) : Double;
  var nRow : Integer;
      vlImp : Double;
      vlImpNeto: Double;
  //Inicio Función
  begin
   vlImpNeto:=0;
   If Assigned(StringGrid) Then
    With StringGrid Do
     For nRow := 1 To RowCount - 1 Do
      Begin
      vlImp := StrToFloat(Trim(Cells[nCol,nRow]));
      vlImpNeto := vlImpNeto + vlImp;
      End;
   ImpNeto := vlImpNeto;
  end;//end ImpNeto

var         J     : Integer;
//Inicio Quitar registros
begin
  Objeto.IMP_NETO.GetFromControl;
  With sagCONCEPTO Do
    Begin
       For J := 0 To ColCount - 1 Do Cells[J,Row] := '';
          RoveData(sagCONCEPTO);//Remueve renglones
       If Cells[Col,Row] <> '' then Objeto.IMP_NETO.AsFloat := ImpNeto(sagCONCEPTO,2)
       else Objeto.IMP_NETO.AsFloat := 0;
       //end if
    End; //end with
end;

procedure TWCrCapOp.InterForma1DespuesCancelar(Sender: TObject);
begin
   ClearGrid(sagCONCEPTO); //Limpia el grid
end;

procedure TWCrCapOp.edCVE_OPERACIONExit(Sender: TObject);
var     VLSalida :     Boolean;
        VLMsg     :     String;
begin
       if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
       Begin
           VLMsg := '';
           VLSalida := True;
           Objeto.CVE_OPERACION.GetFromControl;
           If Objeto.CVE_OPERACION.AsString = '' then
               VLSalida := False;
               VLMsg := 'Favor de Indicar la Clave de Operación';
           //end if
           InterForma1.ValidaExit(edCVE_OPERACION,VLSalida,VLMsg,True);
       End;
end;

procedure TWCrCapOp.edID_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CONTRATO,True,'',True);
end;

procedure TWCrCapOp.edCREDITOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCREDITO,True,'',True);
end;

procedure TWCrCapOp.edCOMISIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCOMISION,True,'',True);
end;

procedure TWCrCapOp.edPERIODOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edPERIODO,True,'',True);
end;

procedure TWCrCapOp.edCOMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCOMENTARIO,True,'',True);
end;

procedure TWCrCapOp.edCVE_CONCEPTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_CONCEPTO,True,'',True);
end;

procedure TWCrCapOp.edIMP_CONCEPTOExit(Sender: TObject);
var     VLSalida      : Boolean;
        VLMsg         : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      Begin
         VLMsg := '';
         VLSalida := True;
         Objeto.IMP_CONCEP.GetFromControl;
         if not(ValNumPositivo(VlMsg,Objeto.IMP_CONCEP.AsInteger)) then
            VLSalida:= False;
         //end if
         InterForma1.ValidaExit(edIMP_CONCEPTO,VlSalida,VlMsg,True);
      end;
end;

procedure TWCrCapOp.btAgregarExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btAgregar,True,'',True);
end;

procedure TWCrCapOp.btQuitarExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btQuitar,True,'',True);
end;

procedure TWCrCapOp.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);

var vlFolio : Double;
//Inserta registros del grid al spt
  Function InsertConcept : Boolean;
  var vlConcepto : String;
      vlImporte  : Double;
      nRow       : Integer;
      vlSalida   : Boolean;
  Begin
    VlSalida := False;
    For nRow := 1 to (sagCONCEPTO.RowCount-1) do
       begin
          vlConcepto := UpperCase(sagCONCEPTO.Cells[0,nRow]);
          vlImporte := StrToFloat(sagCONCEPTO.Cells[2,nRow]);
          if Objeto.GeneraConcepto(vlConcepto,vlImporte) then
             vlSalida := True;
       end;
{
    if VlSalida then
      VLSalida :=  Objeto.ActivaConcepto; //Activa Concepto
}
    InsertConcept := VlSalida;
  End;
//Inicia evento
Begin
   //Nuevo
   if InterForma1.IsNewData then
     begin
          Realizado := False;
          Objeto.NUM_PERIODO.GetFromControl;
          Objeto.COMENTARIO.GetFromControl;
          //Genera transaccion


          if Objeto.GeneraTransac(Objeto.CVE_OPERACION.AsString,Objeto.ID_CONTRATO.AsInteger,
                                  Objeto.ContratoCre.FOL_CONTRATO.AsInteger, Objeto.ID_CREDITO.AsInteger,
                                  Objeto.NUM_PERIODO.AsInteger,
                                  Objeto.ObtenChqraCte( Objeto.ID_CREDITO.AsInteger, Objeto.ContratoCre.Acreditado.ID_ACREDITADO.AsInteger ),
                                  //300094021,
                                  Objeto.CVE_COMISION.AsString,Objeto.IMP_NETO.AsFloat,
                                  Objeto.COMENTARIO.AsString, vlFolio) then
          begin
               Objeto.ID_FOLIO.AsFloat := vlFolio;
               if InsertConcept then
                  Realizado := True;
               //end if;
          end;
     end;
end;

end.
