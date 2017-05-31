unit IntCrAutExAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,Menus,
InterApl,
  //uses Adicionales
  IntParamCre,
  IntGenCre,
  IntSGCtrl,
  IntCrAcredit;

const
  CSI = 'SI'#30'>C';
  CNO = '';

type

 TCrAutExAc = class;

  TWCrAutExAc = class(TForm)
    lbID_CREDITO: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label30: TLabel;
    edID_ACREDITADO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNOMBRE: TEdit;
    InterForma1: TInterForma;
    Label3: TLabel;
    Label1: TLabel;
    sgcDATOS: TSGCtrl;
    btAPLICA_INCRE: TBitBtn;
    MErrores: TMemo;
    lbID_CONTRATO: TLabel;
    edID_CONTRATO: TEdit;
    edIMP_EXCESO_EVE: TInterEdit;
    cbCVE_AFEC_INC_DEC: TComboBox;
    dtpF_INI_EXCESO: TEdit;
    btF_INI_EXCESO: TInterDateTimePicker;
    dtpF_VTO_EXCESO: TEdit;
    btF_VTO_EXCESO: TInterDateTimePicker;
    lbF_INI_EXCESO: TLabel;
    lbF_VTO_EXCESO: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblPesos: TLabel;
    lbNOMBRE: TLabel;
    MsgPanel: TPanel;
    procedure FormDestroy(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure btAPLICA_INCREClick(Sender: TObject);
    procedure cbCVE_AFEC_INC_DECChange(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
  private
    { Private declarations }
       Function    CadenaSql : String;
       procedure   MuestraDatos;

       procedure   MuestraMensaje(pestrMsg : String);
       function    EsValidalaInformacion(var pestrMsg : String) : Boolean;
       procedure   SetCaptionbtAPLICA_INCRE;
       function    RecepSolic(peB_AFEC_ACRED : String; var psSolicitud: Integer): Boolean;
       function    DetalleSol(pSolicitud, pRow: Integer; peCveTipoMovto : String): Boolean;
       function    AplicaExceso(pMetodo, pSolicitud: Integer): Boolean;
       procedure   HabilitaCtrls(pebHabilita : Boolean);
  public
    { Public declarations }
    Objeto : TCrAutExAc;
  end;


 TCrAutExAc= class(TInterFrame)
      private
      protected
      public
        vgApliExce  : Boolean;
        vgFVtoExc   : TDateTime;

        // Inicia modificaciones SATV4766 el 12JUL2006
        vgB_MODIFICA_DATOS       : Boolean;

        ID_ACREDITADO            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        NOMBRE                   : TInterCampo;
        CVE_TIP_DISPOS           : TInterCampo;
        IMP_EXCESO_EVE           : TInterCampo;
        CVE_AFEC_INC_DEC         : TInterCampo;
        F_INI_EXCESO             : TInterCampo;
        F_VTO_EXCESO             : TInterCampo;
        B_AFEC_ACRED             : TInterCampo;
        // Termina modificaciones

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

function MuestraPantallaExcesos(peApli : TInterApli;
                                peParamCre: TParamCre;
                                peID_ACREDITADO,
                                peID_CONTRATO : Integer;
                                peIMP_EXCESO_EVE : Double;
                                peCVE_AFEC_INC_DEC : String;
                                peCVE_TIP_DISPOS : String;
                                peB_AFEC_ACRED : String;
                                peF_VTO_EXCESO : TDateTime;
                                peB_MODIFICA_DATOS : Boolean) : Boolean;

implementation

function MuestraPantallaExcesos(peApli : TInterApli;
                                peParamCre: TParamCre;
                                peID_ACREDITADO,
                                peID_CONTRATO : Integer;
                                peIMP_EXCESO_EVE : Double;
                                peCVE_AFEC_INC_DEC : String;
                                peCVE_TIP_DISPOS : String;
                                peB_AFEC_ACRED : String;
                                peF_VTO_EXCESO : TDateTime;
                                peB_MODIFICA_DATOS : Boolean) : Boolean;


     function AplicaIncDecTemporada(var psTX_RESULTADO : String) : Boolean;
     var vlTotal : Integer;
         vlStrSQL, vlstrSQLFiltro, vlstrMsgError : String;
     begin
        // Inicia variables de Salida
        Result := False; psTX_RESULTADO := 'Error Desconocido';
        // Realiza validaciones de los parametros de entrada
        If (peID_CONTRATO > 0) Then
          Begin
          vlstrSQLFiltro   := '         WHERE CTO.ID_CONTRATO = '+IntToStr(peID_CONTRATO);
          vlstrMsgError    := 'La autorización '+IntToStr(peID_CONTRATO)+' no aplica Incremento/Decremento de Temporada.';
          End
        Else If (peID_ACREDITADO > 0) Then
          Begin
          vlstrSQLFiltro   := '         WHERE CTO.ID_TITULAR  = '+IntToStr(peID_ACREDITADO);
          vlstrMsgError    := 'El acreditado '+IntToStr(peID_ACREDITADO)+'no tiene autorizaciones que apliquen Incremento/Decremento de Temporada.';
          End
        Else
          Begin
          MessageDlg('No se indico el Acreditado o la Autorización. Favor de Avisar a Sistemas.',
                     mtError, [mbOk], 0);
          Exit;
          End;
        // Para armar el Query valida...
        // Que si se indico el número del acreditado, tenga este al menos una autorización
        // el cual aplique Incremento/Decremento de Temporada, en caso de que sólo se hubiese
        // indicado la autorización, valida que este aplique Incremento/Decremento de Temporada.
        vlStrSQL := '  SELECT COUNT(*) AS TOTAL ' + coCRLF +
                    '  FROM ( SELECT CO.ID_CONTRATO, CO.CVE_PRODUCTO_CRE ' + coCRLF +
                    '         FROM CONTRATO CTO, ' + coCRLF +
                    '              CR_CONTRATO CO ' + coCRLF;
        vlStrSQL := vlStrSQL +
                    vlstrSQLFiltro + coCRLF +
                    '           AND CO.ID_CONTRATO = CTO.ID_CONTRATO' + coCRLF +
                    '       ) CO,' + coCRLF +
                    '       ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO' + coCRLF +
                    '         WHERE B_EXCESO_EVE = '+SQLStr(CVERDAD) + coCRLF +
                    '       ) CP ' + coCRLF +
                    '  WHERE CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE' + coCRLF;
        //
        If GetSQLInt(vlstrSQL, peApli.DataBaseName, peApli.SessionName, 'TOTAL', vlTotal, True) Then
           Begin
           // ¿Encontró al menos una autorización que aplique Incremento/Decremento?
           If (vlTotal > 0) Then
              Begin
              psTX_RESULTADO := '';
              Result := True;
              End
           Else
              psTX_RESULTADO := vlstrMsgError;
           End;
     end;

var  AplicaExc : TCrAutExAc;
     vlstrMsg : String;
     vlQry : TQuery;
begin
   Result := False;
   // Valida si Aplica Incremento/Decremento de Temporada el Acreditado o la Autorización
   If Not AplicaIncDecTemporada(vlstrMsg) Then
     Begin
     MessageDlg(vlstrMsg, mtWarning, [mbOk], 0);
     Exit;
     End;
   // Si Aplica entonces, muestra la pantalla de Incremento/Decremento de Temporada
   {$WARNINGS OFF}
   AplicaExc := TCrAutExAc.Create(Nil);
   {$WARNINGS ON}
   vlQry := GetSQLQuery(' SELECT PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_ACREDITADO) AS NOM_ACREDITADO,'+coCRLF+
                        '        CVE_TIP_DISPOS  '+coCRLF+
                        ' FROM CR_ACREDITADO '+coCRLF+
                        ' WHERE ID_ACREDITADO = '+IntToStr(peID_ACREDITADO)+coCRLF,
                        peApli.DataBaseName, peApli.SessionName, True
                        );
   If Not Assigned(vlQry) Then
      MessageDlg('Problemas al encontrar el acreditado '+IntToStr(peID_ACREDITADO)+'. Favor de Avisar a Sistemas',
                 mtError, [mbOk], 0)
   Else
     Try
        AplicaExc.Apli     := peApli;
        AplicaExc.ParamCre := peParamCre;

        AplicaExc.ID_ACREDITADO.AsInteger    := peID_ACREDITADO;
        AplicaExc.ID_CONTRATO.AsInteger      := peID_CONTRATO;
        AplicaExc.NOMBRE.AsString            := vlQry.FieldByName('NOM_ACREDITADO').AsString;
        If (Trim(peCVE_TIP_DISPOS) = '') Then
          AplicaExc.CVE_TIP_DISPOS.AsString    := vlQry.FieldByName('CVE_TIP_DISPOS').AsString
        Else
          AplicaExc.CVE_TIP_DISPOS.AsString    := peCVE_TIP_DISPOS;

        AplicaExc.B_AFEC_ACRED.AsString  := peB_AFEC_ACRED;
        AplicaExc.CVE_AFEC_INC_DEC.AsString  := peCVE_AFEC_INC_DEC;
        AplicaExc.F_INI_EXCESO.AsDateTime    := peApli.DameFechaEmpresa;
        AplicaExc.vgB_MODIFICA_DATOS         := peB_MODIFICA_DATOS;
        If (peF_VTO_EXCESO > peApli.DameFechaEmpresa) Then AplicaExc.F_VTO_EXCESO.AsDateTime := peF_VTO_EXCESO
        Else AplicaExc.F_VTO_EXCESO.AsDateTime := peApli.DameFechaEmpresa;
        AplicaExc.IMP_EXCESO_EVE.AsFloat     := peIMP_EXCESO_EVE;
        AplicaExc.Catalogo;
     Finally
        If Assigned(vlQry) Then vlQry.Free;
        AplicaExc.Free;
     End;
     Result := AplicaExc.vgApliExce;
end;

{$R *.DFM}

constructor TCrAutExAc.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO     := CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
      ID_CONTRATO       := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
      NOMBRE            := CreaCampo('NOMBRE',ftFloat,tsNinguno,tsNinguno,False);
      CVE_TIP_DISPOS    := CreaCampo('CVE_TIP_DISPOS',ftString,tsNinguno,tsNinguno,False);
      IMP_EXCESO_EVE    := CreaCampo('IMP_EXCESO_EVE',ftFloat,tsNinguno,tsNinguno,False);
      CVE_AFEC_INC_DEC  := CreaCampo('CVE_AFEC_INC_DEC',ftString,tsNinguno,tsNinguno,False);
      B_AFEC_ACRED      := CreaCampo('B_AFEC_ACRED',ftString,tsNinguno,tsNinguno,False);
      With CVE_AFEC_INC_DEC Do
         Begin  Size := 1;
                UseCombo := True;
                ComboLista.Add('Incremento');   ComboDatos.Add('I');
                ComboLista.Add('Decremento');   ComboDatos.Add('D');
         End;
      F_INI_EXCESO      := CreaCampo('F_INI_EXCESO',ftDate,tsNinguno,tsNinguno,False);
      F_VTO_EXCESO      := CreaCampo('F_VTO_EXCESO',ftDate,tsNinguno,tsNinguno,False);
      vgApliExce := False;
      StpName  := ' ';
      UseQuery := False;
      ShowMenuReporte:=True;
end;

Destructor TCrAutExAc.Destroy;
begin
   inherited;
end;

function TCrAutExAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAutExAc;
begin
   W:=TWCrAutExAc.Create(Self);
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

(***********************************************FORMA CRLIQUIDA********************)
(*                                                                              *)
(*  FORMA DE CRLIQUIDA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRLIQUIDA********************)

function TWCrAutExAc.CadenaSql: String;
var vlSql, vlSQLID_CONTRATO : String;
begin
   vlSQLID_CONTRATO := '';
   If (Objeto.ID_CONTRATO.AsInteger > 0) Then
    vlSQLID_CONTRATO := '          AND ID_CONTRATO  = ' + Objeto.ID_CONTRATO.AsString + coCRLF;

   vlSql  := ' SELECT  ''  '' AUT_CAN ,' + coCRLF +
             '         CTO.ID_CONTRATO, CP.DESC_C_PRODUCTO, CO.IMP_AUTORIZADO, CO.IMP_DISPUESTO, '+ coCRLF +
             '         PKGCRSALDOS.STPOBTDISPONIBLEAUT(CO.ID_CONTRATO, CO.FOL_CONTRATO) DISPONIBLE, '+ coCRLF +
             '         M.DESC_MONEDA '+ coCRLF +
             ' FROM ( SELECT * FROM CR_ACREDITADO '+ coCRLF +
             '        WHERE ID_ACREDITADO = '+Objeto.ID_ACREDITADO.AsString + coCRLF +
             '      ) CA,'+ coCRLF +
             '      ( SELECT * FROM CONTRATO '+ coCRLF +
             '        WHERE ID_TITULAR = '+Objeto.ID_ACREDITADO.AsString + coCRLF +
             vlSQLID_CONTRATO +
             '      ) CTO, ' + coCRLF +
             '      ( SELECT * FROM CR_PRODUCTO '+ coCRLF +
             '        WHERE B_EXCESO_EVE = ' + SQLStr(CVERDAD) + coCRLF +
             '      ) CP,'+ coCRLF +
             '      CR_CONTRATO CO,'+ coCRLF +             
             '      MONEDA M'+ coCRLF +
             ' WHERE CTO.ID_TITULAR  = CA.ID_ACREDITADO'+ coCRLF +
             '   AND CO.ID_CONTRATO  = CTO.ID_CONTRATO'+ coCRLF +
             '   AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+ coCRLF +             
             '   AND CP.B_EXCESO_EVE = ''V'''+ coCRLF +
             '   AND CO.CVE_MONEDA   = M.CVE_MONEDA'+ coCRLF;
   CadenaSql := vlSql;
end;

procedure TWCrAutExAc.FormDestroy(Sender: TObject);
begin
   With Objeto Do
     Begin
     ID_ACREDITADO.Control       := Nil;
     NOMBRE.Control              := Nil;
     IMP_EXCESO_EVE.Control      := Nil;
     CVE_AFEC_INC_DEC.Control    := Nil;
     F_INI_EXCESO.Control        := Nil;
     F_VTO_EXCESO.Control        := Nil;
     End;
end;

procedure TWCrAutExAc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrAutExAc.MuestraDatos;
var vlQry : TQuery;
    nRow : Integer;
begin
     vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if Assigned(vlQry) then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('AUT_CAN').DisplayWidth := 3;
            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 10;
            vlQry.FieldByName('DESC_C_PRODUCTO').DisplayWidth := 26;
            vlQry.FieldByName('IMP_AUTORIZADO').DisplayWidth := 14;
            vlQry.FieldByName('IMP_DISPUESTO').DisplayWidth := 14;
            vlQry.FieldByName('DISPONIBLE').DisplayWidth := 14;
            vlQry.FieldByName('DESC_MONEDA').DisplayWidth := 12;

            TNumericField(vlQry.FieldByName('IMP_AUTORIZADO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_DISPUESTO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('DISPONIBLE')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('AUT_CAN').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX

            // Inicio de modificaciones SATV 03 Julio 2006
            // Deselecciona todos las casillas 
            For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
               Begin
               // Si es para Acreditado coloca la bandera como Falso en caso contario lo pasa
               // como verdadero, puesto que la autorización, debe de estar seleccionada...
               If (Objeto.B_AFEC_ACRED.AsString = CFALSO) Then
                  sgcDATOS.CellStr['AUT_CAN',nRow] := CSI
               Else
                  sgcDATOS.CellStr['AUT_CAN',nRow] := CNO;
               End;
            // Fin de modificaciones SATV
        end
        else Begin
           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrAutExAc.sgcDATOSDblClick(Sender: TObject);
var I, nCount, nRow : Integer;
    vlBContinua : Boolean;
    vlstrBandera : String;
Begin
   // Inicia modificacion por SATV4766 el 05 de Julio de 2006
   vlBContinua := True;
   // Obtiene la bandera a utilizar
   nRow := sgcDATOS.SG.Row;
   If (sgcDATOS.CellStr['AUT_CAN',nRow] = CSI) Then
      vlstrBandera := CNO
   Else
      vlstrBandera := CSI;
   // Si se              desea seleccionar otra autorización y el "Tipo de Disposicon" del "Acreditado"
   // se encuentra por "Monto Asignado"
   If (Objeto.CVE_TIP_DISPOS.AsString = C_MONTO_ASIGNADO)
         And (vlstrBandera = CSI) Then
      Begin
      nCount := 0;
      For I := 0 To sgcDATOS.SG.RowCount - 1 Do
        Begin
        If (sgcDATOS.CellStr['AUT_CAN', I] = CSI) Then
           Begin
           Inc(nCount);
           If (nCount = 1) Then
             Begin
             MessageDlg('Debido a que el "Tipo de Disposición" en el Acreditado es por "Monto Asignado", no se '+
                        'puede seleccionar más de una autorización para incrementar/decrementar. Verifique.',
                        mtWarning, [mbOk], 0);
             vlBContinua := False;
             Break;
             End;
           End;
        End;
      End;
   // Actualiza la bandera de la casilla si procede
   If (vlBContinua) Then
      sgcDATOS.CellStr['AUT_CAN',nRow] := vlstrBandera;
  // Termina modificación SATV4766
end;

procedure TWCrAutExAc.MuestraMensaje(pestrMsg : String);
begin
  If (pestrMsg = '') Then
    Begin
    MsgPanel.Font.Color := clBlack;
    MsgPanel.Color      := clBtnFace;
    End
  Else
    Begin
    MsgPanel.Font.Color := clWhite;
    MsgPanel.Color      := clRed;
    End;
  MsgPanel.Caption := pestrMsg;
end;

function  TWCrAutExAc.EsValidalaInformacion(var pestrMsg : String) : Boolean;
var vlMsg : String;
begin
   vlMsg := '';
   With Objeto Do
      Begin
      IMP_EXCESO_EVE.GetFromControl;
      F_INI_EXCESO.GetFromControl;
      F_VTO_EXCESO.GetFromControl;

      If (IMP_EXCESO_EVE.AsFloat = 0) Then
        vlMsg := 'Favor de indicar el Imp. de '+cbCVE_AFEC_INC_DEC.Text

      Else If (F_INI_EXCESO.AsDateTime < Apli.DameFechaEmpresa) Then
              vlMsg := 'La '+lbF_INI_EXCESO.Caption+' no puede ser anterior a la fecha de hoy'

      Else If (F_INI_EXCESO.AsDateTime > F_VTO_EXCESO.AsDateTime) Then
              vlMsg := 'La '+lbF_INI_EXCESO.Caption+' no puede ser mayor que la '+lbF_VTO_EXCESO.Caption

      Else If (F_INI_EXCESO.AsDateTime = F_VTO_EXCESO.AsDateTime) Then
              vlMsg := 'La '+lbF_INI_EXCESO.Caption+' no puede ser igual que la '+lbF_VTO_EXCESO.Caption

      Else If ((ValidaFecha(F_INI_EXCESO.AsDateTime, Apli) <> 0)) Then
              vlMsg := ' La '+lbF_INI_EXCESO.Caption+' es un día no hábil'

      Else If ((ValidaFecha(F_VTO_EXCESO.AsDateTime, Apli) <> 0)) Then
              vlMsg := ' La '+lbF_VTO_EXCESO.Caption+' es un día no hábil';
      End;
  pestrMsg := vlMsg;
  Result := vlMsg = '';
end;

procedure TWCrAutExAc.btAPLICA_INCREClick(Sender: TObject);
var nRow : Integer;
    vlSolicitud, vlNumReg: Integer;
    vlstrMsg : String;
Begin
  // Inicia modificaciones SATV4766 el 21JUL2006
  With Objeto Do
     Begin
     // Inicializa Variables
     GetFromControl;
     MuestraMensaje('');

     // Valida Información
     If Not EsValidalaInformacion(vlstrMsg) Then
        Begin
        MuestraMensaje(vlstrMsg);
        Exit;
        End;

     // Si la fecha de activación es posterior al día de hoy, entonces...
     If (Apli.DameFechaEmpresa < F_INI_EXCESO.AsDateTime) Then
        Begin
        vlstrMsg := 'La '+lbF_INI_EXCESO.Caption+' es posterior al día de Hoy, por lo que el '+
                    cbCVE_AFEC_INC_DEC.Text+' se vera reflejado hasta el día '+DateToStr(F_INI_EXCESO.AsDateTime)+
                    '. ¿Es correcta esta fecha?';
        // Válida que el usuario haya especificado la fecha de inicio correctamente...
        If (MessageDlg(vlstrMsg, mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
           Begin
           MessageDlg('Favor de especificar la '+lbF_INI_EXCESO.Caption+' correcta.', mtWarning, [mbOk], 0);
           If dtpF_INI_EXCESO.CanFocus Then dtpF_INI_EXCESO.SetFocus;
           Exit;
           End;
        End;

    // Genera la recepcíon de solicitud
    If Not RecepSolic(B_AFEC_ACRED.AsString, vlSolicitud) Then
       Begin
       vlstrMsg := 'Favor de reintentar o Avisar a Sistemas.';
       MessageDlg(vlstrMsg, mtError, [mbOk], 0);
       Exit;
       End;
    vlNumReg := 0;
    // Barre el Grid para identificar las autorizaciones a afectar
    For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
      If (sgcDATOS.CellStr['AUT_CAN',nRow] = CSI) Then
         Begin
         // Inicia Modificaciones SATV4766 el 30 de Junio de 2006
         If (Not DetalleSol(vlSolicitud, nRow, CVE_AFEC_INC_DEC.AsString)) Then //Adiciona autorizaciones a afectar
           Begin
           // Borra solicitud (Es como si se hiciera un ROLLBACK SATV4766)
           AplicaExceso(0, vlSolicitud);
           Break;
           End
         Else
           Inc(vlNumReg);
         // Termina Modificaciones SATV4766
         End;

    // Válida si no se seleccionó una autorización a afectar
    If (vlNumReg = 0) Then
       Begin
       MuestraMensaje('Favor de seleccionar al menos una autorización a afectar');
       Exit;
       End
    Else
       Begin
      // Si la fecha de activación es posterior al día de hoy, entonces...
       If (Apli.DameFechaEmpresa < F_INI_EXCESO.AsDateTime) Then
          Begin
          MessageDlg('El "'+cbCVE_AFEC_INC_DEC.Text+'" en las autorización(es) seleccionada(s) se'+
                     ' verá reflejado hasta el día '+DateToStr(F_INI_EXCESO.AsDateTime),
                     mtInformation, [mbOk], 0);
          vgApliExce := True;
          End
       Else
          Begin
          //Activa las solicitudes realizadas
          vgApliExce := AplicaExceso(1, vlSolicitud);
          If (vgApliExce) Then
            MessageDlg('Se aplico el '+cbCVE_AFEC_INC_DEC.Text+' en las autorizaciones seleccionadas.', mtInformation, [mbOk], 0);
          End;

       If (vgApliExce) Then
          InterForma1.Salir
       Else
          Begin
          // Borra solicitud (Es como si se hiciera un ROLLBACK SATV4766)
          AplicaExceso(0, vlSolicitud);
          End;
       End;
    End;
    // Termina modificaciones SATV4766
end;

function TWCrAutExAc.RecepSolic(peB_AFEC_ACRED : String; var psSolicitud: Integer): Boolean;
var vlResult         : Boolean;
    StpRecepSol      : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := False;
    StpRecepSol := TStoredProc.Create(Self);
    If Assigned(StpRecepSol) Then // SATV4766 el 30 de Junio de 2006
       With StpRecepSol Do
          Try
            StpRecepSol.DatabaseName:= Objeto.Apli.DatabaseName;
            StpRecepSol.SessionName:= Objeto.Apli.SessionName;
            StpRecepSol.StoredProcName:='PKGCRCREDITO.STPSOLRECEPEXC';

            Params.Clear;
            Params.CreateParam(ftFloat,'PEIDACREDITADO',ptInput);
            Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
            Params.CreateParam(ftFloat,'PEIMPEXCESO',ptInput);
            Params.CreateParam(ftString,'PECVETIPOMOVTO',ptInput);
            Params.CreateParam(ftString,'PEBAFECACRED',ptInput); // SATV4766
            Params.CreateParam(ftDate,'PEFEXCESOFIN',ptInput);
            Params.CreateParam(ftDate,'PEFEXCESOINI',ptInput);
            Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
            Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
            Params.CreateParam(ftFloat,'PSIDSOLEXCESO',ptOutput);
            Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
            Prepare;

            ParamByName('PEIDACREDITADO').AsString := edID_ACREDITADO.Text;
            ParamByName('PEIDEMPRESA').AsInteger   := Objeto.Apli.IdEmpresa;
            ParamByName('PEIMPEXCESO').AsFloat     := Objeto.IMP_EXCESO_EVE.AsFloat;
            ParamByName('PECVETIPOMOVTO').AsString := Objeto.CVE_AFEC_INC_DEC.AsString;
            ParamByName('PEBAFECACRED').AsString   := peB_AFEC_ACRED;
            ParamByName('PEFEXCESOFIN').AsDateTime := Objeto.F_VTO_EXCESO.AsDateTime;
            ParamByName('PEFEXCESOINI').AsDateTime := Objeto.F_INI_EXCESO.AsDateTime;
            ParamByName('PECVEUSUALTA').AsString   := Objeto.Apli.Usuario;
            ParamByName('PEBCOMMIT').AsString      := CVERDAD;
            ExecProc;

            If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
               Begin
               vlMsgErr :=  '    ' + ParamByName('PSRESULTADO').AsString + ' : ' + ParamByName('PSTXRESULTADO').AsString;
               AddLine(MErrores,vlMsgErr);
               AddLine(MErrores, ' ');
               End
            Else
               Begin
               psSolicitud := ParamByName('PSIDSOLEXCESO').AsInteger;
               vlResult := True;
               End;
        Finally
           StpRecepSol.Free;
        End;
  RecepSolic:= vlResult;
end;

// Modficado por SATV4766 el 30 de Junio de 2006
function TWCrAutExAc.DetalleSol(pSolicitud, pRow: Integer; peCveTipoMovto : String): Boolean;
var vlResult         : Boolean;
    StpDetSol        : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpDetSol := TStoredProc.Create(Self);
    If Assigned(StpDetSol) Then // SATV4766 el 30 de Junio de 2006
    try
       with StpDetSol do
       begin
          StpDetSol.DatabaseName:= Objeto.Apli.DatabaseName;
          StpDetSol.SessionName:= Objeto.Apli.SessionName;
          StpDetSol.StoredProcName:='PKGCRCREDITO.STPDETEXCESO';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDSOLEXCESO',ptInput);
          Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
          Params.CreateParam(ftString,'PECVETIPOMOVTO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PEIDSOLEXCESO').AsInteger := pSolicitud;
          ParamByName('PEIDCONTRATO').AsString := sgcDATOS.CellStr['ID_CONTRATO',pRow];
          ParamByName('PECVETIPOMOVTO').AsString := peCveTipoMovto;
          ParamByName('PECVEUSUALTA').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             vlMsgErr :=  '    ' + ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores, ' ');
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
          end
          else Begin
             AddLine(MErrores, ' ');
             AddLine(MErrores, 'Se afecto la autorización ' + sgcDATOS.CellStr['ID_CONTRATO',pRow] );
             AddLine(MErrores, ' ');
             vlResult := True;
          end;
          UnPrepare;
       end;
    finally
       StpDetSol.Free;
    end;
    DetalleSol:= vlResult;
end;

function TWCrAutExAc.AplicaExceso(pMetodo, pSolicitud: Integer): Boolean;
var vlResult         : Boolean;
    StpAplicaExc     : TStoredProc;
    vlMsgErr         : String;
begin
    vlResult := True;
    StpAplicaExc := TStoredProc.Create(Self);
    If Assigned(StpAplicaExc) Then // SATV4766 el 30 de Junio de 2006
    try
       with StpAplicaExc do
       begin
          StpAplicaExc.DatabaseName:= Objeto.Apli.DatabaseName;
          StpAplicaExc.SessionName:= Objeto.Apli.SessionName;
          StpAplicaExc.StoredProcName:='PKGCRCREDITO.STPAPLIEXCESO';
          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDSOLEXCESO',ptInput);
          Params.CreateParam(ftInteger,'PEIDACREDITADO',ptInput);
          Params.CreateParam(ftInteger,'PEMETODO',ptInput);
          Params.CreateParam(ftDateTime,'PEFMODIFICA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUMODIFICA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PEIDSOLEXCESO').AsInteger := pSolicitud;
          ParamByName('PEIDACREDITADO').AsInteger := StrToInt(edID_ACREDITADO.Text);
          ParamByName('PEMETODO').AsInteger := pMetodo;
          ParamByName('PEFMODIFICA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
          ParamByName('PECVEUSUMODIFICA').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger <> 0 then
          Begin
             vlMsgErr :=  '    ' + ParamByName('PSRESULTADO').AsString + ' : ' + ParamByName('PSTXRESULTADO').AsString;
             ShowMessage(vlMsgErr);
             AddLine(MErrores,vlMsgErr);
             AddLine(MErrores, ' ');
             vlResult := False;
          end
          else Begin
             if pMetodo = 1 then
                AddLine(MErrores, 'Se Activó la Solicitud ' + IntToStr(pSolicitud));
             vlResult := True;
          end;
          UnPrepare;
       end;
    finally
       StpAplicaExc.Free;
    end;
    AplicaExceso:= vlResult;
end;

procedure TWCrAutExAc.HabilitaCtrls(pebHabilita : Boolean);
begin
  // edIMP_EXCESO_EVE.Enabled  := pebHabilita;
  edIMP_EXCESO_EVE.ReadOnly := Not pebHabilita;
  edIMP_EXCESO_EVE.TabStop  := pebHabilita;
  If (pebHabilita) Then edIMP_EXCESO_EVE.Color := clWindow
  Else edIMP_EXCESO_EVE.Color := clBtnFace;

  dtpF_VTO_EXCESO.Enabled  := pebHabilita;
  dtpF_VTO_EXCESO.ReadOnly := edIMP_EXCESO_EVE.ReadOnly;
  dtpF_VTO_EXCESO.TabStop  := edIMP_EXCESO_EVE.TabStop;
  dtpF_VTO_EXCESO.Color    := edIMP_EXCESO_EVE.Color;

  cbCVE_AFEC_INC_DEC.Enabled  := pebHabilita;
  cbCVE_AFEC_INC_DEC.TabStop  := edIMP_EXCESO_EVE.TabStop;
  cbCVE_AFEC_INC_DEC.Color    := edIMP_EXCESO_EVE.Color;
end;

procedure TWCrAutExAc.SetCaptionbtAPLICA_INCRE;
begin
  btAPLICA_INCRE.Caption := 'Realizar '+cbCVE_AFEC_INC_DEC.Text+'(s) Indicado(s)';
end;

procedure TWCrAutExAc.cbCVE_AFEC_INC_DECChange(Sender: TObject);
begin
  SetCaptionbtAPLICA_INCRE;
end;

procedure TWCrAutExAc.InterForma1DespuesShow(Sender: TObject);
begin
   With Objeto Do
     Begin
     lbDempresa.Caption := ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := ParamCre.FECHA.AsString;
     lbDUsuario.Caption := ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

     ID_ACREDITADO.Control       := edID_ACREDITADO;
     NOMBRE.Control              := edNOMBRE;
     IMP_EXCESO_EVE.Control      := edIMP_EXCESO_EVE;
     CVE_AFEC_INC_DEC.Control    := cbCVE_AFEC_INC_DEC;
     F_INI_EXCESO.Control        := dtpF_INI_EXCESO;
     F_VTO_EXCESO.Control        := dtpF_VTO_EXCESO;

     edID_CONTRATO.Text := '';
     If (ID_CONTRATO.AsInteger > 0) Then edID_CONTRATO.Text := ID_CONTRATO.AsString;

     SetCaptionbtAPLICA_INCRE;
     MuestraDatos;
     HabilitaCtrls(Objeto.vgB_MODIFICA_DATOS);
     End;
end;

end.
