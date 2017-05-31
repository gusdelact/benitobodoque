// Sistema         : Clase de CRSECOCO
// Fecha de Inicio : 01/03/2004
// Función forma   : Clase de CRSECOCO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrsecoco;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoHeader, IntLinkit,
InterApl, IntSGCtrl, IntGenCre;

const coCHECKED        = 'V';
      coUNCHECKED      = '';
      coPOSSEL         = 5;

Type
 TCrsecoco= class;

  TWCrsecoco=Class(TForm)
    InterForma1             : TInterForma;
    Bevel1: TBevel;
    Label1: TLabel;
    lblInstructions: TLabel;
    lblFECHA: TLabel;
    lblCONCEPTO: TLabel;
    lblIMPORTE1: TLabel;
    lblIndique: TLabel;
    lblSEL: TLabel;
    lblREFERENCIA: TLabel;
    lblDESC_SEGUIMIENTO: TLabel;
    lblInstructions1: TLabel;
    lblIMPORTE: TLabel;
    lblInstructions2: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edF_PAG_INICIAL: TEdit;
    dtpF_PAG_INICIAL: TInterDateTimePicker;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    sgcDATOS: TSGCtrl;
    btnBusqueda: TBitBtn;
    edChequera: TEdit;
    btnCVE_SEGUIMIENTO: TBitBtn;
    edTITNombre: TEdit;
    edNomChequera: TEdit;
    edID_CONTRATO: TEdit;
    ilChequera: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btnBusquedaClick(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure btnCVE_SEGUIMIENTOClick(Sender: TObject);
    procedure ilChequeraCapture(Sender: TObject; var Show: Boolean);
    procedure ilChequeraEjecuta(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edF_PAG_INICIALKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
     function ObtenCheqConcentradora : String;
     function RegistroSeleccionado : Integer;
     function DespliegaRegistros(strFecha, strImporte : String) : Integer;
    public
    { Public declarations }
    Objeto : TCrsecoco;
end;
 TCrsecoco= class(TInterFrame)
      private
        CtoFuente       : TCtrlCto;
        CtoDestino      : TCtrlCto;

        m_nIndicador          : Integer;
        m_strImporte          : String;
        m_strDESC_SEGUIMIENTO : String;
        m_strCHEQUERA         : String;
        m_strID_TRANSACCION   : String;
        m_strChqConcentradora : String;
        m_ModalResult         : TModalResult;
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

function IndicaFechaRecursos(pApli : TInterApli; nIndicador : Integer; strImporte, strDESC_SEGUIMIENTO, strCHEQUERA : String;
                             var strID_TRANSACCION : String; var strChqConcentradora : String) : TModalResult;


implementation
//Uses RepMon;

{$R *.DFM}


function IndicaFechaRecursos(pApli : TInterApli; nIndicador : Integer; strImporte, strDESC_SEGUIMIENTO, strCHEQUERA : String;
                             var strID_TRANSACCION : String; var strChqConcentradora : String) : TModalResult;
var Crsecoco : TCrsecoco;
begin
  Crsecoco := TCrsecoco.Create(Nil);
  With Crsecoco Do
   Begin
   Apli := pApli;
   m_strImporte          := strImporte;
   m_strDESC_SEGUIMIENTO := strDESC_SEGUIMIENTO;
   m_strCHEQUERA         := strCHEQUERA;
   m_nIndicador          := nIndicador;
   Result := ShowWindow(ftConsulta);
   strID_TRANSACCION     := m_strID_TRANSACCION;
   strChqConcentradora   := m_strChqConcentradora;
   End;
end;

constructor TCrsecoco.Create( AOwner : TComponent );
begin Inherited;
      CtoFuente  := TCtrlCto.Create(Self);
      CtoFuente.MasterSource := Self;

      CtoDestino := TCtrlCto.Create(Self);
      CtoDestino.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrsecoco.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrsecoco.Destroy;
begin
 If CtoFuente <> nil Then
   CtoFuente.Free;
 // End If;

 If CtoDestino <> nil Then
   CtoDestino.Free;
 // End If;
   
 inherited;
end;

function TCrsecoco.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrsecoco;
begin
   W:=TWCrsecoco.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.FormaTipo := ftConsulta; // Fija el tipo de forma
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.Objeto.m_ModalResult; // Modificado
   finally
      W.Free;
   end;
end;


Function TCrsecoco.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrsecoc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CRSECOCO********************)
(*                                                                              *)
(*  FORMA DE CRSECOCO                                                            *)
(*                                                                              *)
(***********************************************FORMA CRSECOCO********************)

function TWCrSeCoCo.ObtenCheqConcentradora : String;
var vlChequera : String;
begin
  GetSQLStr('SELECT ID_CTO_CONCEN_NI FROM CR_PARAMETRO',
            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'ID_CTO_CONCEN_NI', vlChequera, True);
  Result := vlChequera;
end;

procedure TWCrsecoco.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  CtoFuente.ID_CONTRATO.Control  := edID_CONTRATO;
  CtoFuente.TitNombre.Control := edTITNombre;
  CtoFuente.FindKey([ObtenCheqConcentradora]);

  CtoDestino.ID_CONTRATO.Control := edChequera;
  CtoDestino.TitNombre.Control := edNomChequera;
  CtoDestino.FindKey([m_strCHEQUERA]);

  lblDESC_SEGUIMIENTO.Caption := m_strDESC_SEGUIMIENTO;
  lblIMPORTE.Caption := m_strImporte;
  End;
 Caption := IntToStr(Objeto.m_nIndicador)+'.- Favor de identificar el recurso.';
end;

procedure TWCrsecoco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 With Objeto Do
  Begin
  CtoFuente.ID_CONTRATO.Control  := Nil;
  CtoFuente.TitNombre.Control := Nil;

  CtoDestino.ID_CONTRATO.Control := Nil;
  CtoDestino.TitNombre.Control := Nil;
  End;
 Action := caFree;
end;

function TWCrSeCoCo.RegistroSeleccionado : Integer;
var I : Integer;
begin
  Result := -1;
  With sgcDATOS Do
   For I := 0 To SG.RowCount - 1 Do
    If (CellStr['SEL',I] = coChecked) Then
      Begin
      Result := I;
      Break;
      End;
end;

function TWCrSeCoCo.DespliegaRegistros(strFecha, strImporte : String) : Integer;
var Qry : TQuery;
    vlSQL : String;
begin
   Result := 0;
   vlSQL :=
           '    SELECT   '' '' AS SEL,'+ coCRLF +
           '             DT.ID_TRANSACCION,'+ coCRLF +
           '             DT.F_LIQUIDACION,'+ coCRLF +
           '             DO.DESC_L_ID_PRIM,'+ coCRLF +
           '             DT.IMP_TRANS,'+ coCRLF +
           '             DT.ID_CONTRATO,'+ coCRLF +
           '             DT.CVE_OPERACION'+ coCRLF +
           '    FROM     DV_TRANSACCION DT,'+ coCRLF +
           '             DV_OPERACION DO,'+ coCRLF +
           '             CR_PARAMETRO CP'+ coCRLF +
           '    WHERE DT.ID_CONTRATO = ( '#39 + edID_CONTRATO.Text + #39' )'+ coCRLF +
           '      AND DT.CVE_OPERACION = DO.CVE_OPERACION'+ coCRLF +
           '      AND CP.CVE_PARAMETRO = '#39+C_CRE+#39+ coCRLF +
           '      AND (DT.CVE_OPE_ORIGEN <> CP.CVE_OPE_DEP_NI AND DT.CVE_OPE_ORIGEN <> CVE_OPE_RET_NI)'+ coCRLF +
           '      AND DO.CVE_AF_IMP_ABO = ''I'''+ coCRLF +
           '      AND DT.ID_COD_RESP = 0'+ coCRLF +
           '      AND DO.B_MUESTRA_EDOCTA = ''V'''+ coCRLF +
           '      AND DT.F_LIQUIDACION = TO_DATE('#39+strFecha+#39',''DD/MM/YYYY'')'+ coCRLF +
           '      AND DT.IMP_TRANS = 275880.14'+ coCRLF +
           '      AND DT.ID_TRANSACCION NOT IN ('+ coCRLF +
           '                                     SELECT DISTINCT( ID_FOLIO_DV )'+ coCRLF +
           '                                     FROM CR_BIT_SEGUIMIENTO'+ coCRLF +
           '                                     WHERE SIT_SEGUIMIENTO NOT IN (''CI'', ''CA'')'+ coCRLF +
           '                                       AND ID_GRUPO_TRANSAC IS NOT NULL'+ coCRLF +
           '                                   )'+ coCRLF +
           '   ORDER BY  DT.ID_TRANSACCION'+ coCRLF
           ;

         {
           ' SELECT   '' '' AS SEL, ' + coCRLF +
           '             DT.ID_TRANSACCION, ' + coCRLF +
           '             DT.F_LIQUIDACION, ' + coCRLF +
           '             DO.DESC_L_ID_PRIM, ' + coCRLF +
           '             DT.IMP_TRANS, ' + coCRLF +
           '             DT.ID_CONTRATO, ' + coCRLF +
           '             DT.CVE_OPERACION ' + coCRLF +
           '    FROM     DV_TRANSACCION DT, ' + coCRLF +
           '             DV_OPERACION DO ' + coCRLF +
           '    WHERE DT.ID_CONTRATO = ( '#39 + edID_CONTRATO.Text + #39' ) ' + coCRLF +
           '      AND DT.CVE_OPERACION = DO.CVE_OPERACION ' + coCRLF +
           '      AND DT.CVE_OPE_ORIGEN NOT IN (  SELECT CVE_OPE_DEP_NI FROM CR_PARAMETRO WHERE CVE_PARAMETRO = ''CRE''' + coCRLF +
           '                                      UNION ' + coCRLF +
           '                                      SELECT CVE_OPE_RET_NI FROM CR_PARAMETRO WHERE CVE_PARAMETRO = ''CRE''' + coCRLF +
           '                                    )' + coCRLF +
           '      AND DO.CVE_AF_IMP_ABO = ''I'' ' + coCRLF +
           '      AND DT.ID_COD_RESP = 0 ' + coCRLF +
           '      AND DO.B_MUESTRA_EDOCTA = ''V'' ' + coCRLF +
           '      AND DT.F_LIQUIDACION = TO_DATE('#39+strFecha+#39',''DD/MM/YYYY'') ' + coCRLF +
           '      AND DT.IMP_TRANS = ' + FloatToStr(CurrFromFrmFloat(strImporte)) + coCRLF +
           '      AND DT.ID_TRANSACCION NOT IN ( ' + coCRLF +
           '                                     SELECT DISTINCT( ID_FOLIO_DV ) ' + coCRLF +
           '                                     FROM CR_BIT_SEGUIMIENTO ' + coCRLF +
           '                                     WHERE SIT_SEGUIMIENTO NOT IN (''CI'', ''CA'') ' + coCRLF +
           '                                       AND ID_GRUPO_TRANSAC IS NOT NULL ' + coCRLF +
           '                                   ) ' + coCRLF +
           ' ORDER BY  DT.ID_TRANSACCION'
           ;
          }
          
    Qry := GetSQLQuery(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    If Assigned(Qry) Then
     Begin
     Qry.FieldByName('ID_CONTRATO').Visible := False;
     Qry.FieldByName('CVE_OPERACION').Visible := False;

     Qry.FieldByName('SEL').DisplayWidth := 3;
     Qry.FieldByName('ID_TRANSACCION').DisplayWidth := 14;
     Qry.FieldByName('IMP_TRANS').DisplayWidth := 14;
     Qry.FieldByName('DESC_L_ID_PRIM').DisplayWidth := 38;
     Qry.FieldByName('F_LIQUIDACION').DisplayWidth := 11;
     TNumericField(Qry.FieldByName('IMP_TRANS')).DisplayFormat := '###,###,###,###,###,###,##0.00';

     sgcDATOS.AddQry( Qry, True,True,-1,-1,-1,False);
     sgcDATOS.ColumnByName('SEL').IsCheck := True;

     Result := Qry.RecordCount;
     End;
end;

procedure TWCrsecoco.btnBusquedaClick(Sender: TObject);
begin
 If (Trim(edID_CONTRATO.Text) = '') Then
  Begin
  ShowMessage('Falta indicar la chequera concentradora');
  Exit;
  End;

 If (Trim(edF_PAG_INICIAL.Text) <> '') Then
     Case DespliegaRegistros(edF_PAG_INICIAL.Text, Objeto.m_strImporte) Of
       0 : Begin
           ShowMessage('No se encontraron recursos con el importe de '+ Objeto.m_strImporte +
                       ' al día '+edF_PAG_INICIAL.Text+ ' en la cuenta concentradora.' +
                       coCRLF + 'Favor de indicar otra fecha.');
           If edF_PAG_INICIAL.CanFocus Then edF_PAG_INICIAL.SetFocus;
           End;

       1 : Begin
           lblIndique.Visible := True;
           sgcDATOS.CellStr['SEL',0] := coChecked; // Automáticamente selecciona el único registro
           If btnAceptar.CanFocus Then btnAceptar.SetFocus;
           // btnAceptarClick(Self);
           End;
       Else
           Begin
           lblIndique.Visible := True;
           MessageDlg('Se encontró más de un recurso con ese mismo importe. '+ coCRLF +
                      'Favor de seleccionar el recurso a traspasar.', mtInformation, [mbOk], 0);
           End;
     End
 Else
  Begin
  ShowMessage('Debe de indicar la fecha para poder iniciar la búsqueda.');
  If edF_PAG_INICIAL.CanFocus Then edF_PAG_INICIAL.SetFocus;
  End;
end;

procedure TWCrsecoco.sgcDATOSDblClick(Sender: TObject);

    procedure CheckRow(nRow : Integer);
    var I : Integer;
        strCheck : String;
    Begin
      With sgcDATOS Do
       Begin
         strCheck := CellStr['SEL',nRow];
         For I := 0 To SG.RowCount - 1 Do
          CellStr['SEL',I] := coUNCHECKED;

         If (strCheck = coUNCHECKED) Then CellStr['SEL',nRow] := coCHECKED
         Else CellStr['SEL',nRow] := coUNCHECKED;
       End;
    end;

begin
 With sgcDATOS Do
  Begin
  If (SG.Selection.Left = coPOSSEL) Then
   If ( Trim(CellStr['F_LIQUIDACION',SG.Row]) <> '' ) Then
    CheckRow(SG.Row);
  End;
end;

procedure TWCrsecoco.btnCVE_SEGUIMIENTOClick(Sender: TObject);
begin
 If Objeto.CtoDestino.Busca Then;
end;

procedure TWCrsecoco.ilChequeraCapture(Sender: TObject; var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrsecoco.ilChequeraEjecuta(Sender: TObject);
begin
 If Objeto.CtoDestino.FindKey([ilChequera.Buffer]) Then;
end;

procedure TWCrsecoco.btnAceptarClick(Sender: TObject);
begin
 Objeto.m_ModalResult := mrNone;
 With sgcDATOS Do
 If (Trim(CellStr['F_LIQUIDACION', SG.Row]) <> '') Then
   Begin
      If (RegistroSeleccionado = -1) Then
        ShowMessage('Debe de seleccionar el depósito que se va a traspasar para poder continuar.')
      Else
        Begin
         If (Trim(edID_CONTRATO.Text) <> '') Then
          Begin
          Objeto.m_strID_TRANSACCION := sgcDATOS.CellStr['ID_TRANSACCION', SG.Row];
          Objeto.m_strChqConcentradora := edID_CONTRATO.Text;
          Objeto.m_ModalResult := mrYes;
          InterForma1.Salir;
          End
         Else
          Begin
          ShowMessage('Favor de indicar la chequera concentradora.');
          If edID_CONTRATO.CanFocus Then edID_CONTRATO.SetFocus;
          End;
        End;
   End
 Else
  Begin
  ShowMessage('Favor de indicar otra fecha, para poder encontrar los depósitos correspondientes.');
  If edF_PAG_INICIAL.CanFocus Then edF_PAG_INICIAL.SetFocus;
 End;
end;

procedure TWCrsecoco.btnCancelarClick(Sender: TObject);
begin
 Objeto.m_ModalResult := mrNo;
 If (RegistroSeleccionado > -1) Then
  Case MessageDlg('¿Desea trapasar el recurso seleccionado?', mtConfirmation,
                  [mbYes, mbNo, mbCancel], 0 ) Of
   mrYes : btnAceptarClick(Self);
   mrCancel : Objeto.m_ModalResult := mrNone;
  End;

 If (Objeto.m_ModalResult <> mrNone) Then
  InterForma1.Salir;
end;

procedure TWCrsecoco.edF_PAG_INICIALKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then btnBusquedaClick(Self);
end;

end.
