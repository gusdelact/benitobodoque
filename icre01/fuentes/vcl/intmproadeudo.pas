// Sistema         : Clase de TMPrAdeudo
// Fecha de Inicio : 02/08/2004
// Función forma   : Clase de TMPrAdeudo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit InTMProAdeudo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrCredito,     //Disposición
IntParamCre,
IntMQrTasaAct,
Intempre,         //Empresa
IntUnNeg,          //Unidad Negocio/Suc                                 
IntGenCre,                                            
IntCrCartrIm            //Detalle de Impagado
;

Type
  TMPrAdeudo= class;

  TwMPrAdeudo = Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    rgFechas: TGroupBox;
    Label6: TLabel;
    edFFin: TEdit;
    stpFin: TInterDateTimePicker;
    cbxFECHAS: TCheckBox;
    rgFecha: TRadioGroup;
    Label5: TLabel;
    edFIni: TEdit;
    stpInicio: TInterDateTimePicker;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CESIONChange(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure cbxFECHASClick(Sender: TObject);
    procedure edFIniChange(Sender: TObject);
    procedure edFFinChange(Sender: TObject);
    procedure rgFechaClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
  private
    function     funObtFechaMaxima : TDate;
  private
    procedure EnableCheckBox(var CheckBox : TCheckBox);
    procedure ImprimeReporte(bPreview:Boolean);
    procedure AsignaEmpresaSuc;
    procedure DeterminaFecha(PPBValCre: String);
  public
    Objeto : TMPrAdeudo;
  end;
  //
  TMPrAdeudo= class(TInterFrame)
  private
  protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    Credito          : TCrCredito;//Disposición
    ParamCre         : TParamCre;
    UnidadNegocio    : TUnNegocio;
    Empresa          : TEmpresa;
    VGID_CREDITO     : Integer;
    VGfecha          : TDateTime;
        DetImpagado              : TCrCartrIm;

    function     InternalBusca : Boolean; override;
    constructor  Create( AOwner : TComponent ); override;
    destructor   Destroy; override;
    function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;



implementation

{$R *.DFM}


constructor TMPrAdeudo.Create( AOwner : TComponent );
begin Inherited;
      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      //BSS
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      //
      UseQuery := False;
      HelpFile := 'InTMPrAdeudo.Hlp';
      ShowMenuReporte:=True;

      VGID_CREDITO := 0;
end;

Destructor TMPrAdeudo.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMPrAdeudo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMPrAdeudo;
begin
   W:=TwMPrAdeudo.Create(Self);
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

Function TMPrAdeudo.InternalBusca:Boolean;
begin
  InternalBusca := False;
end;

(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

function TwMPrAdeudo.funObtFechaMaxima: TDate;
var vlSQL : String;
    Qry   : TQuery;
begin
  Result := EncodeDate(5000, 01, 01 );
  VLSQL := 'SELECT MIN(F_VENCIMIENTO) F_VENCIMIENTO ' +
           'FROM   ( ' +
//           '        SELECT F_VENCIMIENTO '    +
//           '        FROM   CR_INTERES    '    +
//           '        WHERE  ID_CREDITO =  '    + Objeto.Credito.ID_CREDITO.AsString       +
//           '          AND  F_VENCIMIENTO >= ' + SQLFecha( Objeto.Apli.DameFechaEmpresa ) +
//           '          AND  SIT_INTERES <> ''CA'' ' +
//           '        UNION  ' +
           '        SELECT F_VENCIMIENTO'     +
           '        FROM   CR_CAPITAL   '     +
           '        WHERE  ID_CREDITO = '     + Objeto.Credito.ID_CREDITO.AsString       +
           '          AND  F_VENCIMIENTO >= ' + SQLFecha( Objeto.Apli.DameFechaEmpresa ) +
           '          AND  SIT_CAPITAL NOT IN (''CA'',''LQ'') ' +
           '       ) ';
  Qry := GetSQLQuery(VLSQL,Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
  if Assigned(Qry) and not( Qry.IsEmpty ) then
  begin
    Qry.First;
    if not Qry.FieldByName('F_VENCIMIENTO').IsNull then
      Result := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
    //end_if
  end;
end;



procedure TwMPrAdeudo.AsignaEmpresaSuc;
begin
     Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

Procedure TwMPrAdeudo.DeterminaFecha(PPBValCre: String);
var Qry   : Tquery;
    VLSQL : String;
begin
     if ((edID_CESION.Text = '') and (PPBValCre= 'V')) then
     begin
        ShowMessage('Falta indicar un crédito');
     end
     else
     begin
         //MD
         if rgFecha.ItemIndex = 0 then
         begin
              stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
              edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
         end
         //Capital
         else if rgFecha.ItemIndex = 1 then
         begin
            VLSQL := ' SELECT MIN(F_VENCIMIENTO) F_VENCIMIENTO FROM CR_CAPITAL WHERE ID_CREDITO =  ' + edID_CESION.Text +
                     ' AND SIT_CAPITAL NOT IN ('+#39+'LQ'+#39+','+#39+'CA'+#39+')  AND F_VENCIMIENTO >= ' + SQLFecha(oBJETO.Apli.DameFechaEmpresa) ;
            Qry := GetSQLQuery(VLSQL,Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
            if Assigned(Qry) and not( Qry.IsEmpty ) then
            begin
              while not Qry.Eof do
              begin
                if Qry.FieldByName('F_VENCIMIENTO').AsFloat <> 0 then
                begin
                    stpInicio.DateTime := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
                    edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
                end
                else
                begin
                    stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
                    edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
                end;
                Qry.Next;
              end;//ends_if
            end
            else
            begin
                stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
                edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
            end;
            if Assigned(Qry) then
            begin
              Qry.Close;        Qry.Free;
            end;
         end
         //Interés
         else if rgFecha.ItemIndex = 2 then
         begin
            VLSQL :=' SELECT MIN(F_VENCIMIENTO) F_VENCIMIENTO FROM CR_INTERES WHERE ID_CREDITO =  ' + edID_CESION.Text +
                    ' AND SIT_INTERES NOT IN ('+#39+'LQ'+#39+','+#39+'CA'+#39+')  AND F_VENCIMIENTO >= ' + SQLFecha(oBJETO.Apli.DameFechaEmpresa) ;
            Qry := GetSQLQuery(VLSQL,Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
            if Assigned(Qry) and not( Qry.IsEmpty ) then
            begin
              while not Qry.Eof do
              begin
                if Qry.FieldByName('F_VENCIMIENTO').AsFloat <> 0 then
                begin
                    stpInicio.DateTime := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
                    edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
                end
                else
                begin
                    stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
                    edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
                end;
                Qry.Next;
              end;
            end
            else
            begin
                stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
                edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
            end;
            if Assigned(Qry) then
            begin
              Qry.Close;        Qry.Free;
            end;
         end
         //Refinanciamiento
         else if rgFecha.ItemIndex = 3 then
         begin
            VLSQL := ' SELECT MIN(F_VENCIMIENTO) F_VENCIMIENTO FROM CR_FINAN_ADIC WHERE ID_CREDITO =  ' + edID_CESION.Text +
                     ' AND SIT_FINAN_ADIC NOT IN ('+#39+'LQ'+#39+','+#39+'CA'+#39+')  AND F_VENCIMIENTO >= ' + SQLFecha(oBJETO.Apli.DameFechaEmpresa);
            Qry := GetSQLQuery(VLSQL,Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
            if Assigned(Qry) and not( Qry.IsEmpty ) then
            begin
              while not Qry.Eof do
              begin
                if Qry.FieldByName('F_VENCIMIENTO').AsFloat <> 0 then
                begin
                    stpInicio.DateTime := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
                    edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
                end
                else
                begin
                    stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
                    edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
                end;
                Qry.Next;
              end;
            end
            else
            begin
                stpInicio.DateTime := Objeto.Apli.DameFechaEmpresa;
                edFIni.Text := FormatDateTime('DD/MM/YYYY',stpInicio.DATE);
            end;
            if Assigned(Qry) then
            begin
              Qry.Close;        Qry.Free;
            end;
         end;
     end;
     edFIni.Enabled := rgFecha.ItemIndex = 4;
     stpInicio.Enabled := rgFecha.ItemIndex = 4;
end;

procedure TwMPrAdeudo.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);

   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;
   DeterminaFecha('F');

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
      Interforma1.MsgPanel := MsgPanel;
   if Objeto.VGID_CREDITO <> 0 then
   begin
        if Objeto.Credito.FindKey([IntToStr(Objeto.VGID_CREDITO)]) then
        begin
             chbxCESION.Checked:=True;
             chbxCESION.Enabled:=True;
        end;
        stpInicio.DateTime := Objeto.VGfecha;
        edFIni.Text := FormatDateTime('DD/MM/YYYY',Objeto.VGfecha);
        rgFecha.ItemIndex := 4;
        edFIni.Enabled := rgFecha.ItemIndex = 4;
        stpInicio.Enabled := rgFecha.ItemIndex = 4;
   end;
end;

procedure TwMPrAdeudo.FormDestroy(Sender: TObject);
begin
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMPrAdeudo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMPrAdeudo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMPrAdeudo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMPrAdeudo.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRADEUDO_PREVI',True,True) then
   begin
      ImprimeReporte(True);
   end;
end;

Procedure TwMPrAdeudo.ImprimeReporte(bPreview:Boolean);
var vFMax : TDate;
    Qry   : TQuery;
    VLSQL : String;
    BNivela : String;
begin
  DeterminaFecha('V');
  //
  if ( rgFecha.ItemIndex = 4 ) then
  begin
    vFMax := funObtFechaMaxima;
    if StrToDate(edFIni.Text) > vFMax then
    begin
      MessageDlg( 'La fecha máxima a la cual se puede generar el reporte es:' +
                  #13#10 + DateToStr(vFMax), mtInformation, [mbOk], 0 );
      //
      stpInicio.DateTime := vFMax;
      edFIni.Text := FormatDateTime('DD/MM/YYYY', vFMax );
      Exit;
    end;
  end;
  {ROIM 18112005 BUSCA EN EL PRODCUTO DE CREDITO EL TIPO DE TABLA DE AMORTIZACIÓN, TRADICIONAL O NIVELADO}
  BNivela := 'T';
  VLSQL := 'SELECT CVE_GEN_TIP_PAG FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE = (SELECT CVE_PRODUCTO_CRE FROM CR_CONTRATO WHERE ID_CONTRATO IN  (SELECT ID_CONTRATO FROM CR_CREDITO WHERE ID_CREDITO = ' + edID_CESION.Text + '))';
  Qry := GetSQLQuery(VLSQL,Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
  if Assigned(Qry) and not( Qry.IsEmpty ) then
  begin
    Qry.First;
    if not Qry.FieldByName('CVE_GEN_TIP_PAG').IsNull then
       if Qry.FieldByName('CVE_GEN_TIP_PAG').AsString = 'PAGNIV' then
          BNivela := 'N';
       //end if;
    //end_if
  end;
  {/ROIM}






  EjecutarReporteProAdeudo( edID_CESION.Text, edFIni.Text , edFFin.Text ,
                            EdIdEmpresa.Text, EdIDSucursal.Text,//BSS
                            {ROIM 18112005 PASA EL PARAMETRO DE NIVELACIÓN}
                            BNivela,
                            {/ROIM}
                            Objeto.Apli, bPreview);
End;
procedure TwMPrAdeudo.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRADEUDO_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;

procedure TwMPrAdeudo.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMPrAdeudo.btID_CESIONClick(Sender: TObject);
var vlMsg : String;
begin
   if Objeto.ValidaAccesoEsp('TMPRADEUDO_CESN',True,True) then
   begin
       Objeto.Credito.ShowAll := True;
       if Objeto.Credito.Busca then begin
            chbxCESION.Checked:=True;
            chbxCESION.Enabled:=True;
            //valida si existe fondeo credito para prepagos  EASA4011 18.SEP.2007
            if ExisteFondeo(Objeto.Credito.ID_CREDITO.AsString, Objeto.Apli, vlMsg) then
               ShowMessage( 'Existe fondeo '+ vlMsg +' para la disposición ' + Objeto.Credito.ID_CREDITO.AsString);
            //END_EASA
            //valida si existe GARANTÍA DE FONDEO EASA4011 18.SEP.2007
            if ExisteGar(Objeto.Credito.ID_CREDITO.AsString, Objeto.Apli, vlMsg) then
               ShowMessage( 'Existe '+ vlMsg +' para la disposición ' + Objeto.Credito.ID_CREDITO.AsString);
            //END_EASA

            //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
            InterForma1.MsgPanel.Caption := '';
            InterForma1.MsgPanel.Color := clBtnFace;
            InterForma1.MsgPanel.Font.Color := clWhite;
            if not ( FindDispIM(Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsInteger,Objeto.Apli, vlMsg)) then
            Begin
               InterForma1.MsgPanel.Caption := vlMsg;
               InterForma1.MsgPanel.Color := clRed;
               InterForma1.MsgPanel.Font.Color := clWhite;
               if MessageDlg(vlMsg + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
               Begin
                  Objeto.DetImpagado := TCrCartrIm.Create(self);
                  Try
                    Objeto.DetImpagado.Apli:= Objeto.Apli;
                    Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Credito.ContratoCre.Contrato.ID_Titular.ASstring;
                    Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Credito.ContratoCre.Contrato.TITNombre.asstring;
                    Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                    Objeto.DetImpagado.Catalogo;
                  finally
                    Objeto.DetImpagado.Free;
                  end;
               end;
            end;
            //END EASA
            InterForma1.NextTab(edID_CESION);
       End;
   end;
end;


procedure TwMPrAdeudo.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMPrAdeudo.chbxCESIONClick(Sender: TObject);
begin
   EnableCheckBox(chbxCESION);
   If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
   End;
end;

procedure TwMPrAdeudo.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMPrAdeudo.ilCesionEjecuta(Sender: TObject);
Var vlMsg: String;
begin
   If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
      chbxCESION.Checked:=True;
      chbxCESION.Enabled:=True;
      //valida si existe fondeo credito para prepagos  EASA4011 18.SEP.2007
      if ExisteFondeo(Objeto.Credito.ID_CREDITO.AsString, Objeto.Apli, vlMsg) then
         ShowMessage( 'Existe fondeo '+ vlMsg +' para la disposición ' + Objeto.Credito.ID_CREDITO.AsString);
      //END_EASA
        //valida si existe GARANTÍA DE FONDEO EASA4011 18.SEP.2007
        if ExisteGar(Objeto.Credito.ID_CREDITO.AsString, Objeto.Apli, vlMsg) then
           ShowMessage( 'Existe '+ vlMsg +' para la disposición ' + Objeto.Credito.ID_CREDITO.AsString);
        //END_EASA
      InterForma1.NextTab(edID_CESION);
   End;
end;
procedure TwMPrAdeudo.cbxFECHASClick(Sender: TObject);
begin
   EnableCheckBox(cbxFECHAS);
   If not cbxFECHAS.Checked Then Begin
      edFIni.Text:='';
      edFFin.Text:='';
   End;
end;

procedure TwMPrAdeudo.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMPrAdeudo.edFIniChange(Sender: TObject);
begin
   If Trim(edFIni.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMPrAdeudo.edFFinChange(Sender: TObject);
begin
   If Trim(edFFin.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMPrAdeudo.rgFechaClick(Sender: TObject);
begin
     DeterminaFecha('V');
end;

procedure TwMPrAdeudo.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMPrAdeudo.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMPrAdeudo.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMPrAdeudo.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMPrAdeudo.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;


end.

