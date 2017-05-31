// Sistema         : Clase de consulta de tipos de baja buró
// Fecha de Inicio : 17/02/2014
// Función forma   : Clase de consulta de tipos de baja buró
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jiménez Rivera
// Comentarios     : En revisión de propuesta
Unit IntBCTBaja;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, IntParamCre, ComCtrls, IntDtPk,
IntLinkit, IntSGCtrl,
IntCrAcredit,     //Acreditado
IntCrCto,         // Linea/Contrato
IntCrCredito;     //Disposición


Type
 TBCTBaja= class;

  TWBCTBaja=Class(TForm)
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
    sgDatos: TSGCtrl;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label5: TLabel;
    edID_CONTRATO: TEdit;
    btnCONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    ilCONTRATO: TInterLinkit;
    chbxContrato: TCheckBox;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    ilCesion: TInterLinkit;
    chbxCESION: TCheckBox;
    GBRango: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    ChBxFechas: TCheckBox;
    bConsulta: TButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure btnCONTRATOClick(Sender: TObject);
    procedure chbxContratoClick(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure bConsultaClick(Sender: TObject);
    procedure ChBxFechasClick(Sender: TObject);
    procedure edF_INICIOChange(Sender: TObject);
    private
    { Private declarations }
    Procedure   ConsultaTiposBajaBC;
    public
    { Public declarations }
    Objeto : TBCTBaja;
end;
 TBCTBaja= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        {CVE_CON_GPO_CAT   :TInterCampo ;
        CVE_CLAVE         :TInterCampo ;
        DESC_CLAVE        :TInterCampo ;
        CVE_VALOR_ADIC    :TInterCampo ; }

        Acreditado               : TCrAcredit;
        ContratoCre              : TCrCto;
        Credito                  : TCrCredito;//Disposición
        ParamCre      : TParamCre ;

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
var CadenaSQL : String;


constructor TBCTBaja.Create( AOwner : TComponent );
begin Inherited;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      UseQuery := False;
      HelpFile := 'IBCTBaja.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TBCTBaja.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If ContratoCre <> Nil then
      ContratoCre.Free;
   If Credito <> Nil Then
      Credito.Free;
inherited;
end;


function TBCTBaja.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWBCTBaja;
begin
   W:=TWBCTBaja.Create(Self);
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

Function TBCTBaja.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
end;

function TBCTBaja.Reporte:Boolean;
begin //Execute_Reporte();
end;


(*****************************FORMA BCTBaja**************************************)
(*                                                                              *)
(*  FORMA DE BCTBaja                                                            *)
(*                                                                              *)
(*****************************FORMA BCTBaja**************************************)

procedure TWBCTBaja.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
    Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
    Objeto.GetParams(Objeto);
    edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
    edNOMBRE_ACRED.ShowHint := True;

    Objeto.ContratoCre.ID_CONTRATO.Control := edID_CONTRATO ;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_C_PRODUCTO ;
    Objeto.GetParams(Objeto);
    edDESC_C_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString ;
    edDESC_C_PRODUCTO.ShowHint := True ;

    Objeto.Credito.ID_CREDITO.Control := edID_CESION;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
    Objeto.Credito.GetParams(Objeto);
    edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
    edCESION.ShowHint := True;
end;

procedure TWBCTBaja.FormDestroy(Sender: TObject);
begin
//Objeto
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil ;
end;

procedure TWBCTBaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWBCTBaja.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrBCTBaj.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWBCTBaja.ConsultaTiposBajaBC;
var Q : TQuery;
   cTablasAcr, cJoinAcr, cValoresAcr,
   cTablasContr, cJoinContr, cValoresContr,
   cTablasCr, cJoinCr, cValoresCr,
   cValoresFch, cTablas, cJoin, cValores : String;

begin
     cTablas:= ''; cJoin:= ''; cValores := '';

     If (chbxAcreditado.Checked and Objeto.Acreditado.Active) Then Begin
        cTablasAcr  := 'CONTRATO';
        cValoresAcr := ' CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ';
     End ;
     If (chbxContrato.Checked and Objeto.ContratoCre.Active) Then Begin
        cTablasContr  := 'CR_CONTRATO';
        cValoresContr := '  CR_CONTRATO.ID_CONTRATO = '+Objeto.ContratoCre.ID_CONTRATO.AsString+' ';
     End ;
     If (chbxCesion.Checked and Objeto.Credito.Active)Then Begin
        cTablasCr  := 'CR_CREDITO';
        cValoresCr := '  CR_CREDITO.ID_CREDITO  = '+Objeto.Credito.ID_CREDITO.AsString+' ';
     End ;

     If chbxFechas.Checked Then Begin
       cValoresFch :=  ' AND CR_CREDITO.F_LIQUIDACION BETWEEN TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(edF_INICIO.Text))+''', ''DD/MM/YYYY'') '+
                       ' AND TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(edF_FINAL.Text))+''', ''DD/MM/YYYY'')  ';
     End ;

     cTablas := ' CR_CREDITO, CR_CONTRATO, CONTRATO ';
     cJoin   := ' (CR_CREDITO.ID_CONTRATO = CONTRATO.ID_CONTRATO) AND (CONTRATO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO) AND CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO ';

     if cTablasCr <> '' then begin
        cValores   := cValores + ' AND ' + Trim(cValoresCr);
     end;

     if cTablasContr <> '' then begin
        cValores   := cValores + ' AND ' + Trim(cValoresContr);
     end;

     if cTablasAcr <> '' then begin
        cValores   := cValores + ' AND ' + Trim(cValoresAcr);
     end;

     cJoin:= Trim(cJoin);  cValores:= Trim(cValores);

     if Copy(cTablas, 1, 1) = ',' then
        cTablas := Copy(cTablas, 2, Length(cTablas)-1);

     if Copy(cJoin, 1, 3)  = 'AND' then
        cJoin := Copy(cJoin, 4, Length(cJoin)-3) ;

     if Copy(cJoin, Length(cJoin)-3, 3)  = 'AND' then
        cJoin := Copy(cJoin, 1, Length(cJoin)-3) ;

     if Copy(cValores, 1, 3)  = 'AND' then
        cValores := Copy(cValores, 4, Length(cValores)-3) ;

     if Copy(cValores, Length(cValores)-3, 3)  = 'AND' then
        cValores := Copy(cValores, 1, Length(cValores)-3) ;

     CadenaSQL :=
          'SELECT ID_CREDITO, F_LIQUIDACION, SIT_CREDITO, CVE_TIPO_BAJA AS CVE_TIPO_BAJA_R04, CVE_TIPO_BAJA_BC, CVE_OBSERVACION '+#13#10+
          '  FROM '+ Trim(cTablas) +#13#10+
          ' WHERE 1=1 '+#13#10;
     if Trim(cJoin) <> '' then
        CadenaSQL := CadenaSQL + #13#10+' AND '+Trim(cJoin) +#13#10;

     if Trim(cValores) <> '' then
        CadenaSQL := CadenaSQL + #13#10 +' AND '+Trim(cValores);

     if Trim(cValoresFch) <> '' then
        CadenaSQL:= CadenaSQL +#13#10+ Trim(cValoresFch);
        
     CadenaSQL := CadenaSQL +#13#10+ ' ORDER BY CR_CREDITO.CVE_TIPO_BAJA_BC, CR_CREDITO.F_LIQUIDACION, CR_CREDITO.ID_CREDITO ';

     //ShowMessage(Trim(CadenaSQL));

     //Exit;

     Q :=  GetSQLQuery(CadenaSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then begin
             Q.FieldByName('ID_CREDITO').DisplayWidth        := 12;
             Q.FieldByName('F_LIQUIDACION').DisplayWidth     := 15;
             Q.FieldByName('SIT_CREDITO').DisplayWidth       := 10;
             Q.FieldByName('CVE_TIPO_BAJA_R04').DisplayWidth := 19;
             Q.FieldByName('CVE_TIPO_BAJA_BC').DisplayWidth  := 19;
             Q.FieldByName('CVE_OBSERVACION').DisplayWidth   := 20;
             
             sgDatos.addQry(Q,True,True,-1,-1,-1,True) ;
          end
          else
          begin
               sgDatos.Clear('NO EXISTEN CRÉDITOS A REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;

end;

procedure TWBCTBaja.InterForma1Buscar(Sender: TObject);
begin
{  if Objeto.InternalBusca then
     Objeto.Operacion.FindKey([Objeto.CVE_CLAVE.AsString]);  }
end;


procedure TWBCTBaja.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWBCTBaja.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWBCTBaja.btACREDITADOClick(Sender: TObject);
begin
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWBCTBaja.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:= False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWBCTBaja.edACREDITADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TWBCTBaja.ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:= True;
end;

procedure TWBCTBaja.ilCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilCONTRATO.Buffer,1]) Then Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TWBCTBaja.btnCONTRATOClick(Sender: TObject);
 var Cad: String;
begin
   Cad:= ' SELECT DISTINCT CONTRATO.ID_CONTRATO  '+
         ' FROM CONTRATO , CR_CREDITO '+
         ' WHERE CR_CREDITO.SIT_CREDITO = ''LQ'' AND CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO';
   If chbxACREDITADO.Checked then
      begin
         Cad := Cad + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
      end ;
   Objeto.ContratoCre.BuscaWhereString := ' CR_CONTRATO.ID_CONTRATO IN ('+Cad+') ';
   Objeto.ContratoCre.FilterString:= Objeto.ContratoCre.BuscaWhereString ;
   Objeto.ContratoCre.ShowAll := True;
   If Objeto.ContratoCre.Busca Then Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TWBCTBaja.chbxContratoClick(Sender: TObject);
begin
    If not chbxContrato.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxContrato.Checked:=False;
        chbxContrato.Enabled:=False;
    End Else Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
    End;
end;

procedure TWBCTBaja.edID_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CONTRATO,True,'',True);
end;

procedure TWBCTBaja.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:= True;
end;

procedure TWBCTBaja.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWBCTBaja.btID_CESIONClick(Sender: TObject);
var C: String;
begin
   C:= ' SELECT DISTINCT CR_CREDITO.ID_CONTRATO  '+
       ' FROM CONTRATO , CR_CREDITO '+
       ' WHERE CR_CREDITO.SIT_CREDITO = ''LQ'' AND CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO ';
   If chbxACREDITADO.Checked then
      begin
         C := C + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
      end ;

   If chbxContrato.Checked then
      begin
         C := C + ' AND CR_CREDITO.ID_CONTRATO = '+Objeto.ContratoCre.ID_CONTRATO.AsString+' ' ;
      end ;

   Objeto.Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+C+') ' ;
   If Objeto.Credito.Busca Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWBCTBaja.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TWBCTBaja.edID_CESIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TWBCTBaja.bConsultaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TBCTBAJA_CONSU',True,True) then
      ConsultaTiposBajaBC
end;

procedure TWBCTBaja.ChBxFechasClick(Sender: TObject);
begin
   if not(ChBxFechas.Checked) then
      begin
         edF_INICIO.Text := '' ;
         edF_FINAL.Text := '' ;
      end ;
   ChBxFechas.Enabled := ChBxFechas.Checked;
end;

procedure TWBCTBaja.edF_INICIOChange(Sender: TObject);
begin
   ChBxFechas.Checked:=  (edF_INICIO.Text<> '') and (edF_FINAL.Text <> '');
   ChBxFechas.Enabled:= ChBxFechas.Checked;
end;

end.
