// Sistema         : Clase de SOLFEGACORRECION
// Fecha de Inicio : 08/08/2005
// Función forma   : Clase de SOLFEGACORRECION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntSolFEGAco;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
IntSGCtrl,

IntGenCre,
IntParamCre,
IntCrCredito  //Disposición
;

Type
 TSolFEGAco= class; 

  TWSolFEGAcorrecio=Class(TForm)
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
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    lbID_CREDITO: TLabel;
    ilID_CREDITO: TInterLinkit;
    edIMP_SOLICITAR: TInterEdit;
    lbIMP_SOLICITAR: TLabel;
    edID_SOLICITUD: TInterEdit;
    lbID_SOLICITUD: TLabel;
    cbB_OBLIGA_SOL: TCheckBox;
    btnGenera: TButton;
    MsgPanel: TPanel;
    sgcDATA: TSGCtrl;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbF_SOLICITUD: TLabel;
    edF_SOLICITUD: TEdit;
    btF_SOLICITUD: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edIMP_SOLICITARExit(Sender: TObject);
    procedure cbB_OBLIGA_SOLExit(Sender: TObject);
    procedure btnGeneraExit(Sender: TObject);
    procedure btnGeneraClick(Sender: TObject);
    procedure sgcDATAExit(Sender: TObject);
    private 
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSolFEGAco;

    function StpAltaSolFEGAManual(  peID_CREDITO    : Integer;
                                    peNUM_PERIODO   : Integer;
                                    peB_OBLIGA_SOL  : String;
                                    peIMP_SOLICITAR : Double;
                                    peF_SOLICITUD   : TDateTime;
                                    peB_COMMIT           : String;
                                    var psID_SOLICITUD   : Integer;
                                    var psRESULTADO      : Integer;
                                    var psTX_RESULTADO   : String;
                                    pebMuestraError      : Boolean
                                 ) : Boolean;

     procedure MostrarDatos;
     procedure Habilita_Opcion_Obliga_Sol_FEGA;

    end;
 TSolFEGAco= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre     : TParamCre;
        Credito      : TCrCredito;

        F_SOLICITUD                 : TInterCampo;
        ID_CREDITO                  : TInterCampo;
        B_OBLIGA_SOL                : TInterCampo;
        IMP_SOLICITAR               : TInterCampo;
        ID_SOLICITUD                : TInterCampo;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
      published 
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TSolFEGAco.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CREDITO    := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      B_OBLIGA_SOL  := CreaCampo('B_OBLIGA_SOL',ftString,tsNinguno,tsNinguno,False);
      IMP_SOLICITAR := CreaCampo('IMP_SOLICITAR',ftFloat,tsNinguno,tsNinguno,False);
      ID_SOLICITUD  := CreaCampo('ID_SOLICITUD',ftInteger,tsNinguno,tsNinguno,False);
      F_SOLICITUD   := CreaCampo('F_SOLICITUD',ftDate,tsNinguno,tsNinguno,False);

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      Credito.BuscaWhereString := ' CR_CREDITO.ID_CREDITO IN (SELECT CC.ID_CREDITO FROM CR_CREDITO CC, CR_CONTRATO CO, '+coCRLF+
                                  ' ( SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+SQLStr('AGRONE')+') CP '+coCRLF+
                                  '   WHERE CO.ID_CONTRATO = CC.ID_CONTRATO AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE ) '+coCRLF
                                  ;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntSolFEGAco.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSolFEGAco.Destroy;
begin
 If Assigned(Credito) Then Credito.Free;
 inherited;
end;


function TSolFEGAco.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSolFEGAcorrecio;
begin
   W:=TWSolFEGAcorrecio.Create(Self);
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


Function TSolFEGAco.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ISolFEGA.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA SOLFEGACORRECION********************)
(*                                                                              *)
(*  FORMA DE SOLFEGACORRECION                                                            *)
(*                                                                              *)
(***********************************************FORMA SOLFEGACORRECION********************)

procedure TWSolFEGAcorrecio.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CREDITO.Control     := edID_CREDITO;
  B_OBLIGA_SOL.Control   := cbB_OBLIGA_SOL;
  IMP_SOLICITAR.Control  := edIMP_SOLICITAR;
  ID_SOLICITUD.Control   := edID_SOLICITUD;
  F_SOLICITUD.Control   := edF_SOLICITUD;

  Credito.ID_CREDITO.Control := edID_CREDITO;
  Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;

  F_SOLICITUD.AsDateTime := Apli.DameFechaEmpresa;  

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWSolFEGAcorrecio.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CREDITO.Control     := Nil;
  B_OBLIGA_SOL.Control   := Nil;
  IMP_SOLICITAR.Control  := Nil;
  ID_SOLICITUD.Control   := Nil;
  F_SOLICITUD.Control    := Nil;

  Credito.ID_CREDITO.Control := Nil;
  Credito.ContratoCre.Contrato.TITNombre.Control := Nil;

  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWSolFEGAcorrecio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSolFEGAcorrecio.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWSolFEGAcorrecio.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TSOLFEGACO_DISP',True,True) then
   begin
     With Objeto Do
      If Credito.Busca Then
        Begin
        btnGenera.Enabled := True;
        MostrarDatos;
        End;
   end;
end;

procedure TWSolFEGAcorrecio.ilID_CREDITOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Credito.FindKey([ilID_CREDITO.Buffer]) Then
    Begin
    btnGenera.Enabled := True;
    MostrarDatos;
    End;
end;

procedure TWSolFEGAcorrecio.edID_CREDITOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edID_CREDITO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_CREDITO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWSolFEGAcorrecio.edIMP_SOLICITARExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (StrToInt(edIMP_SOLICITAR.Text) = 0) Then vlstrMsg := 'Favor de indicar el '+lbIMP_SOLICITAR.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWSolFEGAcorrecio.cbB_OBLIGA_SOLExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_OBLIGA_SOL, True, '',True);
end;

procedure TWSolFEGAcorrecio.btnGeneraExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btnGenera, True, '',True);
end;

function TWSolFEGAcorrecio.StpAltaSolFEGAManual(  peID_CREDITO    : Integer;
                                                  peNUM_PERIODO   : Integer;
                                                  peB_OBLIGA_SOL  : String;
                                                  peIMP_SOLICITAR : Double;
                                                  peF_SOLICITUD   : TDateTime;
                                                  peB_COMMIT           : String;
                                                  var psID_SOLICITUD   : Integer;
                                                  var psRESULTADO      : Integer;
                                                  var psTX_RESULTADO   : String;
                                                  pebMuestraError      : Boolean
                                               ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;  psID_SOLICITUD := 0;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRCREDITOO1.STP_ALTA_SOL_FEGA_MANUAL';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;

       Params.CreateParam(ftInteger ,'peID_CREDITO'  ,ptInput);
       Params.CreateParam(ftInteger ,'peNUM_PERIODO' ,ptInput);
       Params.CreateParam(ftString  ,'peB_OBLIGA_SOL',ptInput);
       Params.CreateParam(ftFloat   ,'peIMP_SOLICITAR',ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_ALTA',ptInput);
       Params.CreateParam(ftDateTime,'peF_ALTA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psID_SOLICITUD'    ,ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_CREDITO').AsInteger   := peID_CREDITO;
       ParamByName('peNUM_PERIODO').AsInteger  := peNUM_PERIODO;
       ParamByName('peB_OBLIGA_SOL').AsString  := peB_OBLIGA_SOL;
       ParamByName('peIMP_SOLICITAR').AsFloat  := peIMP_SOLICITAR;
       ParamByName('peCVE_USU_ALTA').AsString  := Objeto.Apli.Usuario;
       ParamByName('peF_ALTA').AsDateTime      := peF_SOLICITUD;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psID_SOLICITUD   := ParamByName('psID_SOLICITUD').AsInteger  ;
       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

procedure TWSolFEGAcorrecio.btnGeneraClick(Sender: TObject);
var vlID_SOLICITUD, vlRESULTADO, vlNUM_PERIODO : Integer;
    vlTX_RESULTADO, vlSIT_CAPITAL, vlstr, vlstrMsg : String;

    vlQry: TQuery;
    vlSql: string;
begin
   if Objeto.ValidaAccesoEsp('TSOLFEGACO_GENER',True,True) then
   begin
       With Objeto Do
        Begin
        // Válida
        vlSIT_CAPITAL := sgcDATA.CellStr['SIT_CAPITAL', sgcDATA.SG.Row];
        vlStr := sgcDATA.CellStr['NUM_PERIODO', sgcDATA.SG.Row];
        vlstrMsg := '';
        If (edF_SOLICITUD.Text = '') Then
          vlstrMsg :=  'Debe de indicar la fecha de solicitud de pago...'
        Else If (Trim(edID_CREDITO.Text) = '') Then
          vlstrMsg :=  'Debe de seleccionar una disposición, para poder continuar...'
        Else If (Trim(vlstr) = '') Then
          vlstrMsg :=  'Debe de seleccionar un periodo para poder continuar...'
        Else If (sgcDATA.CellStr['ID_SOLICITUD', sgcDATA.SG.Row] <> '') Then
          vlstrMsg :=  'El periodo ya tiene una solicitud FEGA vinculada, no se puede generar otra solicitud. Verifique.'
        Else If (vlSIT_CAPITAL = CSIT_LQ) Then
          vlstrMsg :=  'Para solicitar la garantía FEGA, el periodo no debe de estar Liquidado "LQ".'
        Else If (StrToFloat(edIMP_SOLICITAR.Text) = 0) Then
          vlstrMsg :=  'Debe de indicar el importe la solicitud de Garantía FEGA.';

        //HERJA - 28.03.2011
        //        VALIDACION PARA QUE NO PERMITA LA SOLICITUD DE GARANTIA
        //        SI EXISTIO UN RETIRO DE FONDEO
        vlSql :=' SELECT F_CANC_PAS, CVE_CA_FND, F_RESCATE FROM CR_FND_CREDITO ' +
                ' WHERE ID_CREDITO = ' +edID_CREDITO.Text+
                ' AND PCT_REDESCONTADO = 0 ' ;
      //          ' AND SIT_CREDITO IN (''AC'')';
        vlQry := GetSQLQuery(vlSql, Apli.DataBaseName, Apli.SessionName, True );
        try
          if vlQry <> nil then
          begin
             if vlQry.FieldByName('CVE_CA_FND').AsString = 'DP' then
                vlstrMsg := 'No se puede dar de Alta la Soicitud ya que la Cancelación de Fondeo fue por RESCATE el dia: '+DateToStr(vlQry.FieldByName('F_RESCATE').AsDateTime);
          end
          else
            vlstrMsg := 'No existen Pasivos con Redescuento en CERO asociados';
        finally
            if vlQry <> nil then vlQry.free;
        end;
        //FIN HERJA 28.03.2011

        // Despliega el mensaje
        If (vlstrMsg <> '') Then
         Begin
         MessageDlg(vlstrMsg, mtWarning, [mbOk], 0);
         Exit;
         End;
        // Obtiene la información de los controles
        ID_CREDITO.GetFromControl;
        B_OBLIGA_SOL.GetFromControl;
        IMP_SOLICITAR.GetFromControl;
        F_SOLICITUD.GetFromControl;
        vlNUM_PERIODO := StrToInt(vlStr);
        // Genera la Solicitud de Garantía FEGA
        If (MessageDlg('¿Desea generar la solicitud FEGA de la Disposición '+ID_CREDITO.AsString+
                       ' con No. Periodo '+vlstr+' y fecha del '+FormatDateTime(CFORMAT_FECHA,F_SOLICITUD.AsDateTime)+'?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes ) Then
           Begin
            If StpAltaSolFEGAManual(ID_CREDITO.AsInteger,
                                    vlNUM_PERIODO,
                                    B_OBLIGA_SOL.AsString,
                                    IMP_SOLICITAR.AsFloat,
                                    F_SOLICITUD.AsDateTime,
                                    CVERDAD,
                                    vlID_SOLICITUD,
                                    vlRESULTADO,
                                    vlTX_RESULTADO,
                                    True
                                   ) Then
              Begin
              ID_SOLICITUD.AsInteger := vlID_SOLICITUD;
              MessageDlg('Solicitud FEGA Generada', mtInformation, [mbOk], 0);
              btnGenera.Enabled := False;
              MostrarDatos;
              End
            Else
              Begin
              MessageDlg('No se pudo generar la Solicitud FEGA.', mtError, [mbOk], 0);
              End;
           End
        Else
           MessageDlg('Operación cancelada por el usuario', mtWarning, [mbOk], 0);
        End;
   end;
end;

procedure TWSolFEGAcorrecio.MostrarDatos;
var vlSQL : String;
    vlQry : TQuery;
begin
  With Objeto Do
    Begin
    vlSQL := ' SELECT '+coCRLF+
             '      CA.ID_CREDITO, '+coCRLF+
             '      CA.NUM_PERIODO, '+coCRLF+
             '      CA.F_VENCIMIENTO, '+coCRLF+
             '      CA.SIT_CAPITAL, '+coCRLF+
             '      CGSF.ID_SOLICITUD, '+coCRLF+
             '      CGSF.IMP_SOLICITAR, '+coCRLF+
             '      CGSF.IMP_APLICADO, '+coCRLF+
             '      CGSF.F_ALTA, '+coCRLF+
             '      CGSF.SIT_GAR_SOL_FEG '+coCRLF+
             '  FROM '+coCRLF+
             '      ( SELECT * FROM CR_CAPITAL '+coCRLF+
             '        WHERE ID_CREDITO = '+Credito.ID_CREDITO.AsString+coCRLF+
             '            AND SIT_CAPITAL <> '+SQLStr(CSIT_CA)+coCRLF+
             '      ) CA, '+coCRLF+
             '      (  SELECT * FROM CR_GA_SOL_FEGA '+coCRLF+
             '          WHERE ID_CREDITO = '+Credito.ID_CREDITO.AsString+coCRLF+
             '            AND SIT_GAR_SOL_FEG <> '+SQLStr(CSIT_CA)+coCRLF+
             '       ) CGSF '+coCRLF+
             '  WHERE CGSF.NUM_PERIODO (+)= CA.NUM_PERIODO '+coCRLF+
             '  ORDER BY ID_CREDITO, NUM_PERIODO '+coCRLF
             ;
     vlQry := GetSQLQuery(vlSQL, Apli.DataBaseName, Apli.SessionName, True );
     If Assigned(vlQry) Then
       Try
         vlQry.FieldByName('ID_CREDITO').Visible        := False;

         vlQry.FieldByName('NUM_PERIODO').DisplayWidth      := 11;
         vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth    := 11;
         vlQry.FieldByName('SIT_CAPITAL').DisplayWidth      := 11;
         vlQry.FieldByName('ID_SOLICITUD').DisplayWidth     := 12;
         vlQry.FieldByName('IMP_SOLICITAR').DisplayWidth    := 13;
         vlQry.FieldByName('IMP_APLICADO').DisplayWidth     := 13;
         vlQry.FieldByName('F_ALTA').DisplayWidth           := 12;
         vlQry.FieldByName('SIT_GAR_SOL_FEG').DisplayWidth  := 12;

         TNumericField(vlQry.FieldByName('IMP_SOLICITAR')).DisplayFormat := '###,###,###,###,###,###,##0.00';
         TNumericField(vlQry.FieldByName('IMP_APLICADO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
         sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
       Finally
         vlQry.Close;
         vlQry.Free;
       End;
    End;
  Habilita_Opcion_Obliga_Sol_FEGA;    
end;

procedure TWSolFEGAcorrecio.sgcDATAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(sgcDATA, True, '',True);
end;

procedure TWSolFEGAcorrecio.Habilita_Opcion_Obliga_Sol_FEGA;
var vlstrSQL : String;
    vlPCT_GTIA_LIQ : Real;
begin
 With Objeto Do
   Begin
   vlstrSQL := ' SELECT'+coCRLF+
               '      PKGCRCREDITOO1.OBTEQUIVALENCIA(1, CTO.CVE_MONEDA, CC.CVE_OPERATIVA, CGFC.PCT_GTIA_LIQ) AS PCT_GTIA_LIQ'+coCRLF+
               ' FROM ( SELECT * FROM CR_CREDITO'+coCRLF+
               '        WHERE ID_CREDITO = '+Credito.ID_CREDITO.AsString+coCRLF+
               '          AND SIT_CREDITO <> '+SQLStr(CSIT_CA)+' -- Que no se encuentre cancelado'+coCRLF+
               '      ) CC,'+coCRLF+
               '      ( SELECT * FROM CR_GA_FIRA_CTO'+coCRLF+
               '        WHERE SIT_GA_FIRA <> '+SQLStr(CSIT_CA)+' -- Que no se encuentre cancelado'+coCRLF+
               '      ) CGFC,'+coCRLF+
               '      CONTRATO CTO'+coCRLF+
               ' WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
               '   AND CGFC.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
               '   AND CGFC.CVE_OPERATIVA = CC.CVE_OPERATIVA'+coCRLF
               ;
  GetSQLFloat(vlstrSQL, Objeto.Apli.DatabaseName , Objeto.Apli.SessionName,
             'PCT_GTIA_LIQ', vlPCT_GTIA_LIQ, True);
  cbB_OBLIGA_SOL.Enabled := (vlPCT_GTIA_LIQ > 0);
  If cbB_OBLIGA_SOL.Enabled Then B_OBLIGA_SOL.AsString := CVERDAD
  Else B_OBLIGA_SOL.AsString := CFALSO;
  End;
end;

end.
