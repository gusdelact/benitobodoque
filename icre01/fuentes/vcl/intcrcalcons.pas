// Sistema         : Clase de CR_CAL_CONSULTA
// Fecha de Inicio : 08/06/2005
// Función forma   : Clase de CR_CAL_CONSULTA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCalCons;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, IntLinkit,
InterApl,

IntGenCre,
IntSICC,
IntParamCre,
IntCrAcredit  // Acreditado
;

Const
  CO_COL_ID_CALIFICADORA  = 0;
  CO_COL_NOM_CALIFICADORA = 1;
  CO_COL_FH_CALIFICACION  = 2;
  CO_COL_CVE_CALIFICACION = 3;
  CO_COL_NUM_PUNTOS_DIST  = 4;
  CO_COL_NUM_NIVEL        = 5;

Type
 TCrCalCons= class; 

  TWCrCalConsulta=Class(TForm)
    InterForma1             : TInterForma; 
    lbCAMPO1 : TLabel;
    edID_ACREDITADO: TEdit;
    strAlgnGrdConsulta: TStringAlignGrid;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    chkbtID_ACREDITADO: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgFechas: TGroupBox;
    Label8: TLabel;
    edF_REFERENCIA: TEdit;
    btF_REFERENCIA: TInterDateTimePicker;
    btBusca: TBitBtn;
    ilID_ACREDITADO: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure chkbtID_ACREDITADOClick(Sender: TObject);
    procedure edF_REFERENCIAKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCalCons;
    procedure MuestraDatos;
    function UltimaCalifAcred : TStoredProc;        

end;
 TCrCalCons= class(TInterFrame)
      private

      protected

      public
        { Public declarations }
        ParamCre : TParamCre;
        ID_ACREDITADO   : TInterCampo;
        F_REFERENCIA    : TInterCampo;
        B_MUESTRA_DATOS : TInterCampo;

        Acreditado : TCrAcredit;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

procedure MuestraConsultaCalificaciones(peID_ACREDITADO : Integer; peF_REFERENCIA : TDateTime; ParamCre : TParamcre; peApli : TInterApli);

implementation

{$R *.DFM}

procedure  MuestraConsultaCalificaciones(peID_ACREDITADO : Integer; peF_REFERENCIA : TDateTime; ParamCre : TParamcre; peApli : TInterApli);
var CrCalCons : TCrCalCons;
begin
  CrCalCons := TCrCalCons.Create(Nil);
  try
     CrCalCons.Apli := peApli;
     CrCalCons.ParamCre := ParamCre;
     CrCalCons.ID_ACREDITADO.AsInteger := peID_ACREDITADO;
     CrCalCons.F_REFERENCIA.AsDateTime := peF_REFERENCIA;
     CrCalCons.B_MUESTRA_DATOS.AsString := CVERDAD;
     CrCalCons.Acreditado.FindKey([peID_ACREDITADO]);
     CrCalCons.Catalogo;     
  finally
     CrCalCons.Free;
  end;
end;

constructor TCrCalCons.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_ACREDITADO   := CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
      F_REFERENCIA    := CreaCampo('F_REFERENCIA',ftDate,tsNinguno,tsNinguno,False);
      B_MUESTRA_DATOS := CreaCampo('B_MUESTRA_DATOS',ftString,tsNinguno,tsNinguno,False);

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrCalCons.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalCons.Destroy;
begin
 If Assigned(Acreditado) Then Acreditado.Free;
 inherited;
end;

function TCrCalCons.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalConsulta;
begin
   W:=TWCrCalConsulta.Create(Self);
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

Function TCrCalCons.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaCo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_CAL_CONSULTA********************)
(*                                                                              *)
(*  FORMA DE CR_CAL_CONSULTA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAL_CONSULTA********************)

procedure TWCrCalConsulta.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_ACREDITADO.Control  := edID_ACREDITADO;
  F_REFERENCIA.Control  := edF_REFERENCIA;

  Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
  Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;

  If (B_MUESTRA_DATOS.AsString = CVERDAD) Then
   MuestraDatos
  Else
   F_REFERENCIA.AsDateTime := Apli.DameFechaEmpresa;
  End;
end;

procedure TWCrCalConsulta.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_ACREDITADO.Control  := Nil;
  F_REFERENCIA.Control  := Nil;

  Acreditado.ID_ACREDITADO.Control  := Nil;
  Acreditado.Persona.Nombre.Control := Nil;
  End;
end;

procedure TWCrCalConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TWCrCalConsulta.UltimaCalifAcred : TStoredProc;
var vlStp : TStoredProc;
begin
  vlStp := TStoredProc.Create(Nil);
  If Assigned(vlStp) Then
   With vlStp Do
    Try
     StoredProcName := 'PKGCRSICC.STP_ULTIMA_CALIF_ACRED';
     DataBaseName   := Objeto.Apli.DataBaseName;
     SessionName    := Objeto.Apli.SessionName;
     Params.CreateParam(ftInteger ,'peID_ACREDITADO'   ,ptInput);
     Params.CreateParam(ftInteger ,'peID_CALIFICADORA' ,ptInput);
     Params.CreateParam(ftString  ,'peCVE_TIPO_RIESGO' ,ptInput);
     Params.CreateParam(ftDateTime,'peF_REFERENCIA'    ,ptInput);
     Params.CreateParam(ftString  ,'psCVE_CALIFICACION',ptOutPut);
     Params.CreateParam(ftDateTime,'psF_CALIFICACION'  ,ptOutPut);
     Params.CreateParam(ftString  ,'psTX_CALIFICACION' ,ptOutPut);
     Params.CreateParam(ftDateTime,'psFH_CALIFICACION' ,ptOutPut);
     Params.CreateParam(ftInteger ,'psNUM_PUNTOS_DIST' ,ptOutPut);
     Params.CreateParam(ftInteger ,'psNUM_NIVEL'       ,ptOutPut);
     Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutPut);
     Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutPut);
   Finally
   End;
  Result := vlStp;    
end;

procedure TWCrCalConsulta.MuestraDatos;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow : Integer;
    vlF_OUT1 : Double;
    vlStpUltimaCalifAcred : TStoredProc;
begin
 With Objeto Do
   Begin
   ClearAlignGrid(strAlgnGrdConsulta, 0, False);
   strAlgnGrdConsulta.RowCount := 1;
   F_REFERENCIA.GetFromControl;
   ID_ACREDITADO.GetFromControl;

   If (ID_ACREDITADO.AsInteger = 0) Then
    Begin
    MessageDlg('Debe de especificar un acreditado para poder continuar.',mtWarning, [mbOk], 0);
    If edID_ACREDITADO.CanFocus Then edID_ACREDITADO.SetFocus;
    Exit;
    End;

   If Not SICC_IsDate(F_REFERENCIA.AsString, vlF_OUT1) Then
    Begin
    MessageDlg('Debe de especificar una fecha válida para poder continuar.',mtWarning, [mbOk], 0);
    If edF_REFERENCIA.CanFocus Then edF_REFERENCIA.SetFocus;
    Exit;
    End;

   vlstrSQL := ' SELECT TEMP.*,'+coCRLF+
               '        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, TEMP.ID_CALIFICADORA, 2), 1, 255) AS NOM_CALIFICADORA'+coCRLF+
               ' FROM ( SELECT ID_ACREDITADO, ID_CALIFICADORA'+coCRLF+
               '        FROM CR_REL_CAL_ACRE '+coCRLF+
               '        WHERE ID_ACREDITADO = '+ID_ACREDITADO.AsString+coCRLF+
               '          AND ID_CALIFICADORA IN ( SELECT ID_CALIFICADORA FROM CR_CALIFICADORA WHERE SIT_CALIFICADORA <> ''CA'')'+coCRLF+
               '          AND SIT_REL_CAL_ACRE <> '+SQLStr(CSIT_CA)+coCRLF+
               '        GROUP BY ID_ACREDITADO, ID_CALIFICADORA'+coCRLF+
               '      ) TEMP'+coCRLF+
               ' ORDER BY NOM_CALIFICADORA'
               ;
   vlQry := GetSQLQuery(vlstrSQL, Apli.DatabaseName, Apli.SessionName, True);
   End; // With Objeto

   If Not Assigned(vlQry) Then
     Begin
     strAlgnGrdConsulta.Cells[CO_COL_ID_CALIFICADORA, 0] := CERROR_NOEXISTEN;
     strAlgnGrdConsulta.ColWidths[CO_COL_ID_CALIFICADORA] := 639;
     End
   Else
     With vlQry Do
       Try
       strAlgnGrdConsulta.ColWidths[CO_COL_ID_CALIFICADORA] := 63;
       Last;
       If (RecordCount > 1) Then strAlgnGrdConsulta.RowCount := RecordCount Else strAlgnGrdConsulta.RowCount := 1;
       First;
       vlnRow := 0;
       vlStpUltimaCalifAcred := UltimaCalifAcred;
        While Not Eof Do
         Begin
         strAlgnGrdConsulta.Cells[CO_COL_ID_CALIFICADORA,  vlnRow] := FieldByName('ID_CALIFICADORA').DisplayText;
         strAlgnGrdConsulta.Cells[CO_COL_NOM_CALIFICADORA, vlnRow] := FieldByName('NOM_CALIFICADORA').DisplayText;

         vlStpUltimaCalifAcred.ParamByName('peID_CALIFICADORA').AsInteger := FieldByName('ID_CALIFICADORA').AsInteger;
         vlStpUltimaCalifAcred.ParamByName('peID_ACREDITADO').AsInteger   := Objeto.Acreditado.ID_ACREDITADO.AsInteger;
         vlStpUltimaCalifAcred.ParamByName('peCVE_TIPO_RIESGO').AsString  := CCVE_RIESGO;
         vlStpUltimaCalifAcred.ParamByName('peF_REFERENCIA').AsDateTime   := Objeto.F_REFERENCIA.AsDateTime; 
         vlStpUltimaCalifAcred.ExecProc;

         If (vlStpUltimaCalifAcred.ParamByName('psRESULTADO').AsInteger <> 0) Then
          Begin
          MessageDlg(vlStpUltimaCalifAcred.ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
          MessageDlg('Intente nuevamente ó Avise a Sistemas.', mtError, [mbOk], 0);
          Break;
          End
         Else
          Begin
          strAlgnGrdConsulta.Cells[CO_COL_CVE_CALIFICACION, vlnRow] := vlStpUltimaCalifAcred.ParamByName('psCVE_CALIFICACION').AsString;
          strAlgnGrdConsulta.Cells[CO_COL_FH_CALIFICACION,  vlnRow] := vlStpUltimaCalifAcred.ParamByName('psFH_CALIFICACION').AsString;
          strAlgnGrdConsulta.Cells[CO_COL_NUM_PUNTOS_DIST,  vlnRow] := vlStpUltimaCalifAcred.ParamByName('psNUM_PUNTOS_DIST').AsString;
          strAlgnGrdConsulta.Cells[CO_COL_NUM_NIVEL,        vlnRow] := vlStpUltimaCalifAcred.ParamByName('psNUM_NIVEL').AsString;
          End;
         Next;
         Inc(vlnRow);
         End;
       Finally
        vlStpUltimaCalifAcred.Close;
        vlStpUltimaCalifAcred.Free;
        Close;
        vlQry.Free;
       End;
end;

procedure TWCrCalConsulta.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCALCONS_BUSQ',True,True) then
   begin
      MuestraDatos;
   end;
end;

procedure TWCrCalConsulta.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCALCONS_ACRED',True,True) then
   begin
      With Objeto Do
       If Acreditado.Busca Then
        Begin
        chkbtID_ACREDITADO.Checked := True;
        btBuscaClick(Self);
        End;
   end;
end;

procedure TWCrCalConsulta.ilID_ACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrCalConsulta.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
  With Objeto Do
   Begin
   If Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then
    Begin
    chkbtID_ACREDITADO.Checked := True;
    btBuscaClick(Self);
    End;
   End;
end;

procedure TWCrCalConsulta.chkbtID_ACREDITADOClick(Sender: TObject);
begin
  If Not chkbtID_ACREDITADO.Checked Then
   Begin
   Objeto.Acreditado.Active := False;
   ClearAlignGrid(strAlgnGrdConsulta, 0, False);
   strAlgnGrdConsulta.RowCount := 1;
   End;
end;

procedure TWCrCalConsulta.edF_REFERENCIAKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then btBuscaClick(Self);
end;

end.
