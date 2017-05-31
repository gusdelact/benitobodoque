// Sistema         : Clase de PRORROGA
// Fecha de Inicio : 27/04/2004
// Función forma   : Clase de PRORROGA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntProrroga;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, InterEdit, IntSGCtrl,

IntParamCre,   // Objeto de Parametros
IntGenCre      // Funciones Genéricas
;

const
 CO_CORTE = '* * * * * * * * * * * * * * * * *';

Type
 TProrroga= class; 

  TWProrroga=Class(TForm)
    InterForma1             : TInterForma;
    lblIMP_CAPITAL: TLabel;
    Shape4: TShape;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Shape5: TShape;
    Label4: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label6: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    rgSITUACION: TRadioGroup;
    btBusca: TBitBtn;
    edF_FINAL: TEdit;
    dtF_FINAL: TInterDateTimePicker;
    dtF_INICIAL: TInterDateTimePicker;
    edF_INICIAL: TEdit;
    btCANCELA: TBitBtn;
    Merrores: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    sgcDATOS: TSGCtrl;
    Shape8: TShape;
    Label8: TLabel;
    Shape9: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Label5: TLabel;
    Label11: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edF_INICIALExit(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure edF_FINALKeyPress(Sender: TObject; var Key: Char);
    procedure rgSITUACIONClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TProrroga;

    procedure MuestraDatos;
    procedure InvertCheck(SGCtrl : TSGCtrl);
    procedure MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);

end;
 TProrroga= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        SITUACION   :  TInterCampo;
        F_INICIAL   :  TInterCampo;
        F_FINAL     :  TInterCampo;

        ParamCre    : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

procedure CreateSTP_PRORROGA(var StoredProc : TStoredProc; pDatabaseName, pSessionName : String);
function  ActivaGrupoProrroga(pID_GPO_PRGA : Integer; pDatabaseName, pSessionName : String; var pstrMensaje : String) : Boolean;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TProrroga.Create( AOwner : TComponent );
begin Inherited;
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
      With SITUACION do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
            ComboLista.Add('2'); ComboDatos.Add(CSIT_TO);
      end;
                SITUACION.Caption:='Situación';
                SITUACION.Parametro:='SITUACION';
      F_INICIAL :=CreaCampo('F_INICIAL',ftDate,tsNinguno,tsNinguno,False);
                F_INICIAL.Caption:='Fecha Inicial';
                F_INICIAL.Parametro:='F_INICIAL';
      F_FINAL :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
                F_FINAL.Caption:='Fecha Final';
                F_FINAL.Parametro:='F_FINAL';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntProrroga.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TProrroga.Destroy;
begin inherited;
end;

function TProrroga.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWProrroga;
begin
   W:=TWProrroga.Create(Self);
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


Function TProrroga.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IProrrog.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

//******************************************************************************
//******************************************************************************
//******************************************************************************

//INICIO de Nuevas Funciones Body Agropecuario SATV4766
procedure CreateSTP_PRORROGA(var StoredProc : TStoredProc; pDatabaseName, pSessionName : String);
begin
 StoredProc := TStoredProc.Create(Nil);
 If Assigned(StoredProc) Then
 With StoredProc Do
  Begin
    StoredProcName := 'PKGCRPRORRCM.STP_PRORROGA';
    DatabaseName := pDatabaseName;
    SessionName := pSessionName;
    Params.Clear;
    Params.CreateParam(ftFloat,'PEID_CREDITO',ptInput);
    Params.CreateParam(ftFloat,'PEID_PERIODO',ptInput);
    Params.CreateParam(ftFloat,'PEID_PERIODO_PRGA',ptInput);
    Params.CreateParam(ftString,'PECVE_PRORROGA',ptInput);
    Params.CreateParam(ftString,'PECVE_CONCEPTO',ptInput);
    Params.CreateParam(ftDateTime,'PEF_VENC_PRGA',ptInput);
    Params.CreateParam(ftFloat,'PEIMP_CAP_PRGA',ptInput);
    Params.CreateParam(ftDateTime,'PEF_ALTA',ptInput);
    Params.CreateParam(ftString,'PECVE_USU_ALTA',ptInput);
    Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
    Params.CreateParam(ftInteger,'PESID_GPO_PRGA',ptInputOutput);
    Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
    Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);
  End;
end;

function ActivaGrupoProrroga(pID_GPO_PRGA : Integer; pDatabaseName, pSessionName : String; var pstrMensaje : String) : Boolean;
var StpPrgaActivaGpo : TStoredProc;
begin
  Result := False;
  pstrMensaje := '';
  StpPrgaActivaGpo := TStoredProc.Create(Nil);
  If Assigned(StpPrgaActivaGpo) Then
  With StpPrgaActivaGpo Do
    Try
     StoredProcName := 'PKGCRPRORRCM.STP_PRGA_ACTIVA_GPO';
     DatabaseName := pDatabaseName;
     SessionName := pSessionName;
     Params.Clear;
     Params.CreateParam(ftFloat,'PEID_GPO_PRGA', ptInput);
     Params.CreateParam(ftString,'PEB_COMMIT', ptInput);
     Params.CreateParam(ftFloat,'PSRESULTADO', ptInput);
     Params.CreateParam(ftString,'PSTX_RESULTADO', ptInput);

     ParamByName('PEID_GPO_PRGA').AsFloat := pID_GPO_PRGA;
     ParamByName('PEB_COMMIT').AsString := CVERDAD;
     ExecProc;

     If (ParamByName('PSRESULTADO').AsFloat <> 0) Then
       pstrMensaje := ParamByName('PSTX_RESULTADO').AsString
     Else
       Result := True;
    Finally
     Free;
    End;
end;
//FIN de Nuevas Funciones Body Agropecuario SATV4766



(***********************************************FORMA PRORROGA********************)
(*                                                                              *)
(*  FORMA DE PRORROGA                                                            *)
(*                                                                              *)
(***********************************************FORMA PRORROGA********************)

procedure TWProrroga.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  SITUACION.Control := rgSITUACION;
  F_INICIAL.Control := edF_INICIAL;
  F_FINAL.Control   := edF_FINAL;
  End;
end;

procedure TWProrroga.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  SITUACION.Control := Nil;
  F_INICIAL.Control := Nil;
  F_FINAL.Control   := Nil;
  End;
end;

procedure TWProrroga.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;




procedure TWProrroga.MuestraDatos;
var vlQry : TQuery;
    vlstrSQL, vlstrSituacion : String;
begin
  Objeto.SITUACION.GetFromControl;
  Objeto.F_INICIAL.GetFromControl;
  Objeto.F_FINAL.GetFromControl;

  vlstrSituacion := '';
  Case rgSITUACION.ItemIndex Of
   0 : vlstrSituacion := '    AND SIT_RECEP_PRGA = '+SQLStr(CSIT_AC)+coCRLF;
   1 : vlstrSituacion := '    AND SIT_RECEP_PRGA = '+SQLStr(CSIT_CA)+coCRLF;
  End;

  vlstrSQL :=
          ' SELECT'+coCRLF+
          '  ''  '' AS SEL,'+coCRLF+
          '  CRP.ID_GPO_PRGA,'+coCRLF+
          '  CRP.ID_CREDITO,'+coCRLF+
          '  CP.DESC_PRORROGA,'+coCRLF+
          '  CRP.CVE_PRORROGA,'+coCRLF+
          '  CRP.SIT_RECEP_PRGA,'+coCRLF+
          '  CRP.CVE_USU_ALTA,'+coCRLF+
          '  CRP.F_ALTA,'+coCRLF+
          '  CRP.CVE_USU_CANCELA,'+coCRLF+          
          '  CRP.F_CANCELA,'+coCRLF+
          '  CRP.TOTAL'+coCRLF+
          ' FROM'+coCRLF+
          '    ('+coCRLF+
          '    SELECT'+coCRLF+
          '     ID_GPO_PRGA,  ID_CREDITO, CVE_PRORROGA, SIT_RECEP_PRGA,'+coCRLF+
          '     CVE_USU_ALTA, F_ALTA, CVE_USU_CANCELA, F_CANCELA, COUNT(*) AS TOTAL'+coCRLF+
          '    FROM CR_RECEP_PRGA'+coCRLF+
          '    GROUP BY ID_GPO_PRGA,  ID_CREDITO, CVE_PRORROGA, SIT_RECEP_PRGA,'+coCRLF+
          '     CVE_USU_ALTA, F_ALTA, CVE_USU_CANCELA, F_CANCELA '+coCRLF+
          '    ) CRP,'+coCRLF+
          '    CR_PRORROGA CP'+coCRLF+
          ' WHERE CP.CVE_PRORROGA = CRP.CVE_PRORROGA'+coCRLF+
          vlstrSituacion+
          '   AND F_ALTA BETWEEN '+SQLFecha(Objeto.F_INICIAL.AsDateTime)+' AND '+SQLFecha(Objeto.F_FINAL.AsDateTime)+
          ' ORDER BY ID_GPO_PRGA DESC'+coCRLF;  // Es muy Importante que el order no se modifique

    vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    If Assigned(vlQry) Then
     Begin
       With vlQry Do
        Try
         //Datos que no se muestran
          FieldByName('CVE_PRORROGA').Visible := False;
          FieldByName('TOTAL').Visible := False;

          FieldByName('SEL').DisplayWidth := 5;
          FieldByName('ID_GPO_PRGA').DisplayWidth := 13;
          FieldByName('ID_CREDITO').DisplayWidth := 13;
          FieldByName('DESC_PRORROGA').DisplayWidth := 29;
          FieldByName('SIT_RECEP_PRGA').DisplayWidth := 13;
          FieldByName('CVE_USU_ALTA').DisplayWidth := 13;
          FieldByName('F_ALTA').DisplayWidth := 13;
          FieldByName('CVE_USU_CANCELA').DisplayWidth := 13;
          FieldByName('F_CANCELA').DisplayWidth := 13;

          sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1, False); // AGREGAR QUERY
          sgcDATOS.ColumnByName('SEL').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
        Finally
          Close;
          Free;
        End;
     End
    Else
      sgcDATOS.Clear(CERROR_NOEXISTEN);
end;

procedure TWProrroga.InterForma1DespuesShow(Sender: TObject);
begin
   rgSITUACION.ItemIndex := 0;
   Objeto.F_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   MuestraDatos;
end;

procedure TWProrroga.edF_INICIALExit(Sender: TObject);
begin
     Objeto.F_INICIAL.GetFromControl;
     Objeto.F_FINAL.GetFromControl;
     if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La "Fecha Inicial" no debe de ser mayor a la "Fecha Final"');
        edF_INICIAL.SetFocus;
     end
end;

procedure TWProrroga.edF_FINALExit(Sender: TObject);
begin
     Objeto.F_INICIAL.GetFromControl;
     Objeto.F_FINAL.GetFromControl;
     if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La "Fecha Inicial" no debe de ser mayor a la "Fecha Final"');
        edF_FINAL.SetFocus;
     end
end;

procedure TWProrroga.btBuscaClick(Sender: TObject);
begin
    MuestraDatos;
end;

procedure TWProrroga.InvertCheck(SGCtrl : TSGCtrl);
var I, nRow : Integer;
    vlstrID_CREDITO, vlstrF_ALTA : String;
begin
 With (SGCtrl) Do
  Begin
    nRow := SG.Row;
    If (CellStr['SIT_RECEP_PRGA', nRow] <> CSIT_AC) Then
      MuestraMensaje('Debe de encontrarse Activa la Prorroga, para poder reversarla.',mtError)
    Else If (CellStr['F_ALTA', nRow] <> DateToStr(Objeto.Apli.DameFechaEmpresa)) Then
      MuestraMensaje('Solamente se pueden reversar prórrogas efectuadas en el mismo día.',mtError)
    Else
      Begin
      vlstrID_CREDITO := CellStr['ID_CREDITO',nRow];
      vlstrF_ALTA := CellStr['F_ALTA',nRow];
      
      For I := 0 To SG.RowCount - 1 Do
       If (CellStr['F_ALTA',I] = vlstrF_ALTA) And (CellStr['ID_CREDITO',I] = vlstrID_CREDITO)
           And (I <>  nRow) Then
        CellStr['SEL',I] := '';

      If (CellStr['SEL', nRow] = CVERDAD) Then CellStr['SEL',nRow] := ''
      Else CellStr['SEL',nRow] := CVERDAD;

      For I := nRow - 1 DownTo 0 Do
       If (CellStr['F_ALTA',I] = vlstrF_ALTA) And (CellStr['ID_CREDITO',I] = vlstrID_CREDITO) Then
        CellStr['SEL',I] := CellStr['SEL',nRow];
      End;
   End;
end;

procedure TWProrroga.sgcDATOSDblClick(Sender: TObject);
begin
 InvertCheck(sgcDATOS);
end;

procedure TWProrroga.MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
begin
  MessageDlg(pstrMsg, MsgDlgType, [mbOk], 0);
  Merrores.Lines.Add(CO_CORTE+coCRLF+FormatDateTime('HH:MM:SS AM/PM',Time)+#32+pstrMsg);
end;

procedure TWProrroga.btCANCELAClick(Sender: TObject);

 function ValidaSeleccion : Boolean;
 var I : Integer;
 begin
  Result := False;
  With sgcDATOS Do
   For I := 0 To SG.RowCount - 1 Do
    If (CellStr['SEL',I] = CVERDAD) Then
     Begin
     Result := True;
     Break;
     End;
 end;

 function Restaura(pID_GPO_PRGA : Integer; var pstrMensaje : String) : Boolean;
 var StpPrgaRestaura : TStoredProc;
 begin
   Result := False;
   StpPrgaRestaura := TStoredProc.Create(Nil);
   If Assigned(StpPrgaRestaura) Then
     With StpPrgaRestaura Do
      Try
       StoredProcName := 'PKGCRPRORRCM.STP_PRGA_RESTAURA';
       DatabaseName := Objeto.Apli.DatabaseName;
       SessionName := Objeto.Apli.SessionName;
       Params.Clear;
       Params.CreateParam(ftInteger,'PEID_GPO_PRGA',ptInput);
       Params.CreateParam(ftString,'PECVE_USU_CANCELA',ptInput);
       Params.CreateParam(ftDateTime,'PEF_CANCELA',ptInput);
       Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
       Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
       Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

       ParamByName('PEID_GPO_PRGA').AsInteger := pID_GPO_PRGA;
       ParamByName('PECVE_USU_CANCELA').AsString := Objeto.Apli.Usuario;
       ParamByName('PEF_CANCELA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('PEB_COMMIT').AsString := CVERDAD;
       ExecProc;

       If ( ParamByName('PSRESULTADO').AsInteger <> 0) Then
        MuestraMensaje(ParamByName('PSTX_RESULTADO').AsString, mtError)
       Else
        Result := True;
      Finally
       Free;
      End;
 end;

var vlstrID_GPO_PRGA, vlstrMensaje : String;
    vlbError : Boolean;
    nRow : Integer;
begin
 If Not ValidaSeleccion Then
  Begin
  MuestraMensaje('Debe seleccionar al menos una prórroga, para poder continuar...', mtError);
  Exit;
  End;

  vlBError := False;
   With sgcDATOS Do
    For nRow := 0 To SG.RowCount - 1 Do
     Begin
       If (CellStr['SEL',nRow] = CVERDAD) Then
         Begin
         vlstrID_GPO_PRGA := CellStr['ID_GPO_PRGA',nRow];
         If (IsInteger(vlstrID_GPO_PRGA)) Then
           If Not Restaura(StrToInt(vlstrID_GPO_PRGA), vlstrMensaje) Then
             Begin
             MuestraMensaje(vlstrMensaje,mtError);
             vlBError := True;
             Break;
             End;
         End;
     End;

    // Si no hubo errores
   If Not (vlBError) Then
    MuestraMensaje('Se ha(n) reversado la(s) prorróga(s) seleccionada(s).', mtInformation);

   // Refresca la información
   btBuscaClick(Self);
end;

procedure TWProrroga.edF_FINALKeyPress(Sender: TObject; var Key: Char);
begin
 If (Key = #13) Then btBUSCAClick(Self);
end;

procedure TWProrroga.rgSITUACIONClick(Sender: TObject);
begin
 btBuscaClick(Self);
end;

end.
