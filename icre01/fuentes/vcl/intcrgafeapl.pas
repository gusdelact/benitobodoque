// Sistema         : Clase de CRGAFEAPL
// Fecha de Inicio : 14/07/2004
// Función forma   : Clase de CRGAFEAPL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrGaFeApl;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, IntCtoPanel, Menus,
Tabs, InterApl,

IntParamCre,
IntGenCre,
IntCrCredito, // Clase de la Diposición
IntCtoHeader, // Clase del Contrato Corporativo
IntCrGaSoFe;  // Solicitud de Garantía FEGA

const
      C_COLID_SOLICITUD       = 0;
      C_COLNUM_PERIODO        = 1;
      C_COLF_ALTA             = 2;
      C_COLF_PAGO             = 3;
      C_COLIMP_SOLICITAR      = 4;
      C_COLIMP_APLICADO       = 5;
      C_COLIMP_RECUPERADO     = 6;
      C_COLIMP_POR_RECUPERAR  = 7;

      CO_A_SITUACION : Array [0..5] of String = ('',CSIT_AC, CSIT_LQ, CSIT_IM, CSIT_PA, CSIT_CA);      

Type
 TCrgafeapl= class;

  TWCrgafeapl=Class(TForm)
    InterForma1             : TInterForma;
    icpCONTRATO: TInterCtoPanel;
    Shape3: TShape;
    Label3: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    Shape6: TShape;
    Label6: TLabel;
    Shape7: TShape;
    Label7: TLabel;
    Shape8: TShape;
    Label8: TLabel;
    Shape9: TShape;
    Label9: TLabel;
    lbID_CREDITO: TLabel;
    Shape11: TShape;
    Label12: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edID_CREDITO: TEdit;
    tbstSituacion: TTabSet;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edID_CONTROL_EXT: TEdit;
    edID_CRED_EXTERNO: TEdit;
    PopupMenu1: TPopupMenu;
    SolicitudFEGA1: TMenuItem;
    strgrdFEGA: TStringGrid;
    btRefrescar: TButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btRefrescarClick(Sender: TObject);
    procedure strgrdFEGADrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SolicitudFEGA1Click(Sender: TObject);
    procedure strgrdFEGADblClick(Sender: TObject);
    private 
    { Private declarations }
     function Get_SituacionActual : String;
     procedure Set_SituacionActual(pValor : String);

     procedure MuestraDatos(pSIT_GAR_SOL_FEG : String);
    public
    { Public declarations }
    Objeto : TCrgafeapl;

      procedure MuestraConsultaFEGA(pID_CREDITO : Integer; pSIT_GAR_SOL_FEG : String);
      property SituacionActual : String Read Get_SituacionActual Write Set_SituacionActual;

      procedure MuestraSolicitudFEGA;
end;
 TCrgafeapl= class(TInterFrame)
      private
      protected

      public
        { Public declarations }
        Credito  : TCrCredito;
        Contrato : TCtrlCto;
        m_nID_CREDITO : Integer;

        ParamCre : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;

function ConsultaFEGA(pID_CREDITO : Integer; pApli : TInterApli; pParamCre : TParamCre) : TModalResult;

implementation
//Uses RepMon;

{$R *.DFM}

function ConsultaFEGA(pID_CREDITO : Integer; pApli : TInterApli; pParamCre : TParamCre) : TModalResult;
var CrGaFeApl : TCrGaFeApl;
begin
  CrGaFeApl := TCrGaFeApl.Create(Nil);
  CrGaFeApl.Apli := pApli;
  CrGaFeApl.ParamCre := pParamCre;
  CrGaFeApl.m_nID_CREDITO := pID_CREDITO;
  Result := CrGaFeApl.ShowWindow(ftConsulta);
end;

constructor TCrgafeapl.Create( AOwner : TComponent );
begin Inherited;
      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
      Credito.ShowAll := True;

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource:=Self;
      Credito.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';      
      Contrato.ShowAll := True;

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntCrgafeapl.Hlp';
end;

Destructor TCrgafeapl.Destroy;
begin
 If Assigned(Credito) Then Credito.Free;
 If Assigned(Contrato) Then Contrato.Free;
 Inherited;
end;

function TCrgafeapl.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrgafeapl;
begin
   W:=TWCrgafeapl.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA      
      W.InterForma1.Funcion := FInterFun;
      W.MuestraConsultaFEGA( W.Objeto.m_nID_CREDITO, '' );
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrgafeapl.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrgafea.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CRGAFEAPL********************)
(*                                                                              *)
(*  FORMA DE CRGAFEAPL                                                            *)
(*                                                                              *)
(***********************************************FORMA CRGAFEAPL********************)

procedure TWCrgafeapl.FormShow(Sender: TObject);
begin
 With Objeto Do
   Begin
   Credito.ID_CREDITO.Control := edID_CREDITO;
   Credito.ID_CONTROL_EXT.Control := edID_CONTROL_EXT;
   Credito.ID_CRED_EXTERNO.Control := edID_CRED_EXTERNO;

   icpCONTRATO.Frame := Contrato;

   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
   End;
end;

procedure TWCrgafeapl.FormDestroy(Sender: TObject);
begin
 With Objeto Do
   Begin
   Credito.ID_CREDITO.Control := Nil;
   Credito.ID_CONTROL_EXT.Control := Nil;
   Credito.ID_CRED_EXTERNO.Control := Nil;
   End;
end;

procedure TWCrgafeapl.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TWCrgafeapl.Get_SituacionActual : String;
begin
 Result := CO_A_SITUACION[tbstSituacion.TabIndex];
end;

procedure TWCrgafeapl.Set_SituacionActual(pValor : String);
var I : Integer;
begin
 If (pValor <> SituacionActual) Then
   For I := 0 To High(CO_A_SITUACION) Do
    If pValor = CO_A_SITUACION[I] Then
     Begin
     tbstSituacion.TabIndex := I;
     Break;
     End;
end;

procedure TWCrgafeapl.MuestraDatos(pSIT_GAR_SOL_FEG : String);
var vlQry : TQuery;
    nRow : Integer;
begin
  ClearGrid(strgrdFEGA,0);
  vlQry := TQuery.Create(Nil);
  If Assigned(vlQry) Then
   With (vlQry) Do
    Try
     DatabaseName := Objeto.Apli.DatabaseName;
     SessionName := Objeto.Apli.SessionName;
     SQL.Clear;
     SQL.Add(
             ' SELECT TEMP.*,'+coCRLF+
             '       ( TEMP.IMP_APLICADO -  (TEMP.IMP_RECUPERADO)) AS IMP_POR_RECUPERAR'+coCRLF+
             ' FROM  ('+coCRLF+
             '       SELECT'+coCRLF+
             '        ID_SOLICITUD,'+coCRLF+
             '        NUM_PERIODO,'+coCRLF+
             '        F_ALTA,'+coCRLF+
             '        F_PAGO,'+coCRLF+
             '        IMP_SOLICITAR,'+coCRLF+
             '        IMP_APLICADO,'+coCRLF+
             '        (IMP_PRODUCTOS + IMP_SEGUROS + IMP_FINCAS + IMP_AVALES + IMP_GTIA_GRAVAD + IMP_OTROS) AS IMP_RECUPERADO'+coCRLF+
             '       FROM CR_GA_SOL_FEGA CGSF'+coCRLF+
             '       WHERE CGSF.ID_CREDITO = '+Objeto.Credito.ID_CREDITO.AsString+coCRLF

             );
     If (Trim(pSIT_GAR_SOL_FEG) <> '') Then
      SQL.Add('         AND CGSF.SIT_GAR_SOL_FEG  = '+ SQLStr(pSIT_GAR_SOL_FEG));
      
     SQL.Add('       ) TEMP'+coCRLF);

     Open; First;
     nRow := 0;
     While Not Eof Do
      Begin
      strgrdFEGA.Cells[C_COLID_SOLICITUD,nRow]      := FieldByName('ID_SOLICITUD').AsString;
      strgrdFEGA.Cells[C_COLNUM_PERIODO,nRow]       := FieldByName('NUM_PERIODO').AsString;
      strgrdFEGA.Cells[C_COLF_ALTA,nRow]            := FormatDateTime(CFORMAT_FECHA,FieldByName('F_ALTA').AsDateTime);
      strgrdFEGA.Cells[C_COLF_PAGO,nRow]            := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);
      strgrdFEGA.Cells[C_COLIMP_SOLICITAR,nRow]     := Format(CFORMAT_DINERO,[FieldByName('IMP_SOLICITAR').AsFloat]);
      strgrdFEGA.Cells[C_COLIMP_APLICADO,nRow]      := Format(CFORMAT_DINERO,[FieldByName('IMP_APLICADO').AsFloat]);
      strgrdFEGA.Cells[C_COLIMP_RECUPERADO,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_RECUPERADO').AsFloat]);
      strgrdFEGA.Cells[C_COLIMP_POR_RECUPERAR,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_POR_RECUPERAR').AsFloat]);
      Next;
      End;

     If (nRow > 0) Then strgrdFEGA.RowCount := nRow
     Else strgrdFEGA.RowCount := 1;

    Finally
     Close;
     vlQry.Free;
    End;
end;

procedure TWCrgafeapl.MuestraConsultaFEGA(pID_CREDITO : Integer; pSIT_GAR_SOL_FEG : String);
begin
  With Objeto Do
   Begin
   If Credito.FindKey([pID_CREDITO]) Then
    Begin
    Contrato.FindKey([Credito.ID_CONTRATO.AsInteger]);
    MuestraDatos(pSIT_GAR_SOL_FEG);
    End;
   End;
end;

procedure TWCrgafeapl.tbstSituacionChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 MuestraDatos(CO_A_SITUACION[NewTab]);
end;

procedure TWCrgafeapl.btRefrescarClick(Sender: TObject);
begin
 MuestraDatos(SituacionActual);
end;

procedure TWCrgafeapl.strgrdFEGADrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
    Case ACol Of
      C_COLIMP_SOLICITAR, C_COLIMP_APLICADO, C_COLIMP_RECUPERADO, C_COLIMP_POR_RECUPERAR
      : Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow]);

      C_COLID_SOLICITUD, C_COLNUM_PERIODO, C_COLF_ALTA, C_COLF_PAGO
      : Canvas.TextRect(Rect,Rect.Left +(Rect.Right - Rect.Left - Canvas.TextWidth(Cells[ACol, ARow])) div 2,Rect.Top,Cells[ACol, ARow]);
    Else
      Canvas.TextRect(Rect, Rect.Left, Rect.Top, Cells[ACol, ARow]);
    End;
   End;
end;

procedure TWCrgafeapl.MuestraSolicitudFEGA;

  procedure ObtenDatosSolicitudFEGA(peID_SOLICITUD : Integer;
            var psID_SOLIC_LIQ, psID_CREDITO, psNUM_PERIODO : Integer);
  var vlQry : TQuery;
  begin
    psID_SOLIC_LIQ := 0;
    psID_CREDITO   := 0;
    psNUM_PERIODO  := 0;
    vlQry := TQuery.Create(Nil);
    If Assigned(vlQry) Then
      With (vlQry) Do
        Try
         DataBaseName := Objeto.Apli.DatabaseName;
         SessionName := Objeto.Apli.SessionName;
         SQL.Clear;
         SQL.Add('SELECT * FROM CR_GA_SOL_FEGA WHERE ID_SOLICITUD = '+IntToStr(peID_SOLICITUD));
         Open;
         psID_SOLIC_LIQ := FieldByName('ID_SOLIC_LIQ').AsInteger;
         psID_CREDITO   := FieldByName('ID_CREDITO').AsInteger;
         psNUM_PERIODO  := FieldByName('NUM_PERIODO').AsInteger;
         Close;
        Finally
         vlQry.Free;
        End;  
  end;

var vlID_SOLICITUD, vlID_SOLIC_LIQ,
    vlID_CREDITO, vlNUM_PERIODO  : Integer;

    CrGaSoFe : TCrGaSoFe;
begin
 If (Trim(strgrdFEGA.Cells[C_COLID_SOLICITUD, strgrdFEGA.Row]) <> '') Then
  Begin
  vlID_SOLICITUD := StrToInt(strgrdFEGA.Cells[C_COLID_SOLICITUD, strgrdFEGA.Row]);
  ObtenDatosSolicitudFEGA(vlID_SOLICITUD, vlID_SOLIC_LIQ, vlID_CREDITO, vlNUM_PERIODO);
  If (vlID_CREDITO > 0) Then
    Begin
    CrGaSoFe := TCrGaSoFe.Create(Self);
    CrGaSoFe.Apli := Objeto.Apli;
    CrGaSoFe.ParamCre := Objeto.ParamCre;
    CrGaSoFe.FindKey([vlID_SOLICITUD, vlID_SOLIC_LIQ, vlID_CREDITO, vlNUM_PERIODO]);
    CrGaSoFe.SolicitudLiq.FindKey([vlID_SOLIC_LIQ, vlID_CREDITO, vlNUM_PERIODO]);
    CrGaSoFe.Consulta;
    If Assigned(CrGaSoFe) Then CrGaSoFe.Free;
    End; 
  End;
end;

procedure TWCrgafeapl.SolicitudFEGA1Click(Sender: TObject);
begin
 MuestraSolicitudFEGA;
end;

procedure TWCrgafeapl.strgrdFEGADblClick(Sender: TObject);
begin
 MuestraSolicitudFEGA;
end;

end.
