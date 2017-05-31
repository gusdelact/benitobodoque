// Sistema         : Clase de CRACTMECH
// Fecha de Inicio : 29/01/2004
// Función forma   : Clase de CRACTMECH
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCractmech;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
  IntParamCre,
  IntCrLiqDis,
  IntCrCreChe,
  IntGenCre, IntLinkit, InterEdit
;

Type
 TCractmech= class;

  TWCractmech=Class(TForm)
    InterForma1             : TInterForma;
    gbAUTORIZACION: TGroupBox;
    lbID_PROMOTOR: TLabel;
    Label4: TLabel;
    btMEDIO: TBitBtn;
    edDESC_MEDIO: TEdit;
    btCHEQUERA: TBitBtn;
    edBANCO: TEdit;
    cbMEDIO: TCheckBox;
    cbCHEQUERA: TCheckBox;
    btACTUALIZA_AUTOR: TBitBtn;
    edCVE_MEDIO: TEdit;
    edCHEQUERA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    ilMEDIO: TInterLinkit;
    ilCHEQUERA: TInterLinkit;
    Label2: TLabel;
    cbIMPORTE: TCheckBox;
    edIMPORTE: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACTUALIZA_AUTORClick(Sender: TObject);
    procedure cbMEDIOClick(Sender: TObject);
    procedure cbCHEQUERAClick(Sender: TObject);
    procedure btMEDIOClick(Sender: TObject);
    procedure ilMEDIOEjecuta(Sender: TObject);
    procedure btCHEQUERAClick(Sender: TObject);
    procedure ilCHEQUERAEjecuta(Sender: TObject);
    procedure cbIMPORTEClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edIMPORTEExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCractmech;
end;
 TCractmech= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgCveMedio              : String;
        vgRefExterna            : String;
        vgIdCredito             : String;
        vgChequera              : String;
        vgBenefic               : String;
        vgIdBcoChq              : String;
        vgGrupo                 : String;
        vgCveLiquida            : String;
        vgImporte               : String;
        vgLiqMoneda             : String;
        vgMoneda                : String;
        //Clases Adicionales
        ParamCre                 : TParamCre;
        MediosLiq                : TCrLiqDis;
        Chequera                 : TCrCreChe;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    ActualMedChe({pTipoCambio : String; }pCveMedio, pRefExterna, pCredito,
                                pCveMedioNew, pChequera, pImporte : String) : Boolean;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCractmech.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCractmech.Hlp';
      ShowMenuReporte:=True;

      MediosLiq := TCrLiqDis.Create(Self);
      MediosLiq.MasterSource:=Self;
      MediosLiq.BuscaWhereString := 'CR_LIQUIDA_DISP.SIT_LIQUIDA = ''AC''';
      MediosLiq.FilterString := MediosLiq.BuscaWhereString;

      Chequera := TCrCreChe.Create(Self);
      Chequera.MasterSource:=Self;
end;

Destructor TCractmech.Destroy;
begin
   if MediosLiq  <> nil then
      MediosLiq.Free;
   //end if

   if Chequera  <> nil then
      Chequera.Free;
   //end if
   inherited;
end;


function TCractmech.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCractmech;
begin
   W:=TWCractmech.Create(Self);
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

function TCractmech.ActualMedChe({pTipoCambio : String; }pCveMedio, pRefExterna, pCredito,
                                 pCveMedioNew, pChequera, pImporte : String) : Boolean;
var     VLSalida      : Boolean;
        StpActMedChq  : TStoredProc;
Begin
     //Inicia el SPT
     vlSalida := True;
     StpActMedChq := TStoredProc.Create(Self);
     try
        with StpActMedChq do
        begin
          StpActMedChq.DatabaseName:= Apli.DatabaseName;
          StpActMedChq.SessionName:= Apli.SessionName;
          StpActMedChq.StoredProcName:='PKGCRLIQUIDA.STPACTMEDIOCHQ';
          Params.Clear;
//          Params.CreateParam(ftString,'peTipoCambio',ptInput);
          Params.CreateParam(ftString,'peCveMedio',ptInput);
          Params.CreateParam(ftString,'peRefExterna',ptInput);
          Params.CreateParam(ftInteger,'peIdCredito',ptInput);
          Params.CreateParam(ftString,'peCveMedNew',ptInput);
          Params.CreateParam(ftString,'peChequera',ptInput);
          Params.CreateParam(ftFloat,'peImporte',ptInput);
          Params.CreateParam(ftString,'peCveUsuModif',ptInput);
          Params.CreateParam(ftString,'peBCommit',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
//          ParamByName('peTipoCambio').AsString := pTipoCambio;
          ParamByName('peCveMedio').AsString := pCveMedio;
          ParamByName('peRefExterna').AsString := pRefExterna;
          ParamByName('peIdCredito').AsString := pCredito;
          ParamByName('peCveMedNew').AsString := pCveMedioNew;
          ParamByName('peChequera').AsString := pChequera;
          ParamByName('peImporte').AsString := pImporte;
          ParamByName('peCveUsuModif').AsString := Apli.Usuario;
          ParamByName('peBCommit').AsString := 'V';
          ExecProc;

          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             ShowMessage('Problemas al actualizar: ' +
             IntToStr(ParamByName('psRESULTADO').AsInteger));
             ShowMessage(ParamByName('psTxResultado').AsString);
             vlSalida := False;
          end;
        end;
     finally
          StpActMedChq.Free;
     end;
     ActualMedChe := vlSalida;
end;

(***********************************************FORMA CRACTMECH********************)
(*                                                                              *)
(*  FORMA DE CRACTMECH                                                            *)
(*                                                                              *)
(***********************************************FORMA CRACTMECH********************)

procedure TWCractmech.FormShow(Sender: TObject);
begin
   with Objeto do
   Begin
      MediosLiq.CVE_LIQUIDACION.Control := edCVE_MEDIO;
      MediosLiq.DESC_LIQUIDACION.Control := edDESC_MEDIO;

      Chequera.CUENTA_BANCO.Control := edCHEQUERA;
      Chequera.Intermediario.Nom_Corto_Interm.Control := edBANCO;
   end;
end;

procedure TWCractmech.FormDestroy(Sender: TObject);
begin
   with Objeto do
   Begin
      MediosLiq.CVE_LIQUIDACION.Control := nil;
      MediosLiq.DESC_LIQUIDACION.Control := nil;

      Chequera.CUENTA_BANCO.Control := nil;
      Chequera.Intermediario.Nom_Corto_Interm.Control := nil;

   end;
end;

procedure TWCractmech.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCractmech.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_MEDIO.SetFocus;
end;

procedure TWCractmech.btACTUALIZA_AUTORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACTMECH_ACT',True,True) then
   begin
       if not(cbMEDIO.Checked) and not(cbCHEQUERA.Checked) and not(cbIMPORTE.Checked) then
          showmessage('Favor de seleecionar el campo a modificar')
       else
       Begin
         if MessageDlg('¿Está seguro de actualizar datos del grupo ' + Objeto.vgGrupo+' ?',
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
           if cbMEDIO.Checked then
           Begin
              IF Objeto.vgLiqMoneda = CLIQ_LP THEN
              Begin
                IF Objeto.ActualMedChe({'CM',} Objeto.vgCveMedio, Objeto.vgRefExterna, Objeto.vgIdCredito,
                                    edCVE_MEDIO.Text, CNULL, CNULL) THEN
                   ShowMessage('Se ha actualizado el medio : ' + Objeto.vgCveLiquida + ' por ' + edCVE_MEDIO.Text);
                //end if
              end;
           end;
           if cbCHEQUERA.Checked then
           Begin
              IF Objeto.ActualMedChe({'CH',} Objeto.vgCveMedio, Objeto.vgRefExterna, Objeto.vgIdCredito,
                                     CNULL, edCHEQUERA.Text, CNULL) THEN
              ShowMessage('Se ha actualizado la Chequera : ' + Objeto.vgChequera + ' por ' + edCHEQUERA.Text);
           end;
           if cbIMPORTE.Checked then
           Begin
              IF Objeto.ActualMedChe({'IM',} Objeto.vgCveMedio, Objeto.vgRefExterna, Objeto.vgIdCredito,
                                     CNULL, CNULL, edIMPORTE.Text ) THEN
              ShowMessage('Se ha actualizado el importe: ' + Objeto.vgImporte + ' por ' + edIMPORTE.Text);
           end;
         end;
       end;
   end;
end;

procedure TWCractmech.cbMEDIOClick(Sender: TObject);
begin
{   if ( cbMEDIO.Checked ) then
   Begin
      if Objeto.MediosLiq.Active then
      Begin
          cbCHEQUERA.Checked := False;
          cbIMPORTE.Checked := False;
      end
      else cbMEDIO.Checked := False;
   end
   else
   Begin
      if not( Objeto.MediosLiq.Active )  then
         cbMEDIO.Checked := False;
   end;}
end;

procedure TWCractmech.cbCHEQUERAClick(Sender: TObject);
begin
{   if ( cbCHEQUERA.Checked ) then
   Begin
      if Objeto.Chequera.Active then
      Begin
          cbMEDIO.Checked := False;
          cbIMPORTE.Checked := False;
      end
      else cbCHEQUERA.Checked := False;
   end
   else
   Begin
      if not ( Objeto.Chequera.Active ) then
         cbCHEQUERA.Checked := False;
   end;}
end;

procedure TWCractmech.btMEDIOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACTMECH_LIQU',True,True) then
   begin
     Objeto.MediosLiq.ShowAll := True;
     if Objeto.MediosLiq.Busca then
     Begin
        cbMEDIO.Checked := True;
     end;
   end;
end;

procedure TWCractmech.ilMEDIOEjecuta(Sender: TObject);
begin
   if Objeto.MediosLiq.FindKey([ilMEDIO.Buffer]) then
   Begin
      cbMEDIO.Checked := True;
   end;
end;

procedure TWCractmech.btCHEQUERAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACTMECH_CHLQ',True,True) then
   begin
     Objeto.Chequera.BuscaWhereString := ' CR_CRED_CHEQ.ID_ACREDITADO = ' + Objeto.vgBenefic +
  //                                   ' AND CR_CRED_CHEQ.CVE_TIPO_ACRED = ' + SQLStr(C_PROVE) +
                                     ' AND CR_CRED_CHEQ.CVE_TIPO_CHEQ = ' + SQLStr(C_LIQUI) ;
     Objeto.Chequera.FilterString := Objeto.Chequera.BuscaWhereString;
     Objeto.Chequera.ShowAll := True;
     if Objeto.Chequera.Busca then
     Begin
        cbCHEQUERA.Checked := True;
     end;
   end;
end;

procedure TWCractmech.ilCHEQUERAEjecuta(Sender: TObject);
begin
   Objeto.Chequera.BuscaWhereString := ' CR_CRED_CHEQ.ID_ACREDITADO = ' + Objeto.vgBenefic +
                                   ' AND CR_CRED_CHEQ.CVE_TIPO_ACRED = ' + SQLStr(C_PROVE) +
                                   ' AND CR_CRED_CHEQ.CVE_TIPO_CHEQ = ' + SQLStr(C_LIQUI) ;
   Objeto.Chequera.FilterString := Objeto.Chequera.BuscaWhereString;
   if Objeto.Chequera.FindKey([Objeto.vgBenefic,C_PROVE,0,C_LIQUI,0,Objeto.vgIdBcoChq,ilCHEQUERA.Buffer]) then
   Begin
      cbCHEQUERA.Checked := True;
   end;
end;

procedure TWCractmech.cbIMPORTEClick(Sender: TObject);
begin
{   if ( cbIMPORTE.Checked ) then
   Begin
      cbMEDIO.Checked := False;
      cbCHEQUERA.Checked := False;
   end
   else if ( cbMEDIO.Checked ) then
   Begin
      cbIMPORTE.Checked := False;
      cbCHEQUERA.Checked := False;
   end
   else if ( cbCHEQUERA.Checked ) then
   Begin
      cbIMPORTE.Checked := False;
      cbMEDIO.Checked := False;
   end;}
end;

procedure TWCractmech.InterForma1DespuesShow(Sender: TObject);
begin
   edIMPORTE.Text := Objeto.vgImporte;
   Objeto.MediosLiq.BuscaWhereString := 'CR_LIQUIDA_DISP.SIT_LIQUIDA = ''AC''';
   Objeto.MediosLiq.FilterString := Objeto.MediosLiq.BuscaWhereString;
   IF edCVE_MEDIO.Text = C_MANUAL THEN
   Begin
     IF Objeto.vgLiqMoneda = CLIQ_LD THEN
     Begin
        btMEDIO.Enabled := False;
        cbMEDIO.Enabled := False;
        Objeto.MediosLiq.BuscaWhereString := Objeto.MediosLiq.BuscaWhereString +
                                             ' AND CR_LIQUIDA_DISP.CVE_LIQUIDACION = ' + SQLStr(C_MANUAL);
        Objeto.MediosLiq.FilterString := Objeto.MediosLiq.BuscaWhereString;
     end;
   end;
end;

procedure TWCractmech.edIMPORTEExit(Sender: TObject);
var vlMsg : String;
begin
   if CurrFromFrmFloat( Objeto.vgImporte ) < StrToFloat( edIMPORTE.Text )  then
   Begin
      ShowMessage('El Importe a cambiar no puede ser mayor al importe actual');
      edIMPORTE.SetFocus;
   end;
end;

end.
