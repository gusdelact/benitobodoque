// Sistema         : Clase de CONSITPREM
// Fecha de Inicio : 09/05/2014
// Función forma   : Clase de CONSITPREM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntConsitpre;   

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit,
IntCrCto,      // Clase de la Línea
IntCrCredito,  // Clase de la Disposición
IntParamCre,
IntGenCre,     // Funciones Genéricas
IntXls,
ComObj
;

Type
 TConsitpre= class;

  TWConsitprem=Class(TForm)
    InterForma1             : TInterForma;
    MsgPanel: TPanel; 
    sgcData: TSGCtrl;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lblFechaAlta: TLabel;
    edFIni: TEdit;
    stpInicio: TInterDateTimePicker;
    lblCredito: TLabel;
    edID_CREDITO: TEdit;
    btnCredito: TBitBtn;
    edNOM_CREDITO: TEdit;
    chkCredito: TCheckBox;
    edFFin: TEdit;
    stpFin: TInterDateTimePicker;
    chkFechaAlta: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    bConsulta: TButton;
    ilID_CREDITO: TInterLinkit;
    lbAplica: TLabel;
    btnGenArchivoXLS: TButton;
    edFileNameExcel: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialogXLS: TOpenDialog;
    Label5: TLabel;
    edID_CONTRATO: TEdit;
    btnCONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    chbxContrato: TCheckBox;
    ilCONTRATO: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnCreditoClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure bConsultaClick(Sender: TObject);

    procedure ConsultaSitPremio;
    procedure LimpiaDatosCto;
    procedure LimpiaDatosCred;
    function  QuitarEspeciales(const Cad: string): string;
    procedure ArmaArchivoExcel(peStrFileName : String);

    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure btnGenArchivoXLSClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure chkCreditoClick(Sender: TObject);
    procedure chkFechaAltaClick(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure chbxContratoClick(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure btnCONTRATOClick(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }


    Objeto : TConsitpre;
end;
 TConsitpre= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations } 

        Credito         : TCrCredito;  // Disposición de ICRE
        ContratoCre     : TCrCto;      // Linea ICRE. Premio no aplica a Intercréditos

        ParamCre        : TParamCre;

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


constructor TConsitpre.Create( AOwner : TComponent );
begin Inherited;
      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntConsitpre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TConsitpre.Destroy;
begin
 If Assigned(ContratoCre)  Then ContratoCre.Free;
 If Assigned(Credito)  Then Credito.Free;
inherited;
end;


function TConsitpre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWConsitprem;
begin
   W:=TWConsitprem.Create(Self);
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


Function TConsitpre.InternalBusca:Boolean;
Var T:TInterFindit;
    vlSalida : Boolean;
begin InternalBusca := False; 
      T := CreaBuscador('IConsitp.it','');
      Try
          if Active then
          begin

          end;

          if T.Execute then
          begin
            InternalBusca := FindKey([]);
          end;
      finally  T.Free;
      end; 
end;

function TConsitpre.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CONSITPREM********************)
(*                                                                              *)
(*  FORMA DE CONSITPREM                                                            *)
(*                                                                              *)
(***********************************************FORMA CONSITPREM********************)

procedure TWConsitprem.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    InterForma1.BtnImprimir.Visible := False;
    InterForma1.BtnPreview.Visible  := False;

    With Objeto Do
    Begin
        ContratoCre.ID_CONTRATO.Control := edID_CONTRATO ;
        ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_C_PRODUCTO ;
        ContratoCre.GetParams(Objeto);

        Credito.ID_CREDITO.Control                     := edID_CREDITO;
        Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_CREDITO;
        Credito.GetParams(Objeto);
    End;
end;

procedure TWConsitprem.FormDestroy(Sender: TObject);
begin
    With Objeto Do
    Begin
        ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
        ContratoCre.ID_CONTRATO.Control              := nil;

        Credito.ID_CREDITO.Control                     := Nil;
        Credito.ContratoCre.Contrato.TITNombre.Control := Nil;
    End;
end;

procedure TWConsitprem.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWConsitprem.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWConsitprem.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWConsitprem.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWConsitprem.btnCreditoClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCONSITPRE_BDISP',True,True) then
   Begin
        With Objeto Do
        begin
            Credito.Active := False;

            If chbxContrato.Checked then
            begin
                Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+ edID_CONTRATO.Text +') ' ;
                Credito.FilterString:= Credito.BuscaWhereString;
            end
            else
            begin
                Credito.BuscaWhereString:= '';
                Credito.FilterString:= '';
            end;

            Credito.Active := True;

            Credito.ShowAll := True;

            If Credito.Busca Then Begin
                edNOM_CREDITO.Text := Obten_NombreAcreditado(Credito.ID_CREDITO.AsInteger,Apli);
                chkCredito.Checked := True;
                chkCredito.Enabled := True;
                InterForma1.NextTab(edID_CREDITO);
            End
            else
            begin
                LimpiaDatosCred;
            end;

            if not chbxContrato.Checked then
            begin
                LimpiaDatosCto;
            end;
        end;
   end;
end;

procedure TWConsitprem.ilID_CREDITOEjecuta(Sender: TObject);
begin
    With Objeto Do
    begin
        Credito.Active := False;

        If chbxContrato.Checked then
        begin
            Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+ edID_CONTRATO.Text +') ' ;
            Credito.FilterString:= Credito.BuscaWhereString;
        end
        else
        begin
            Credito.BuscaWhereString:= '';
            Credito.FilterString:= '';
        end;

        Credito.Active := True;

       If Credito.FindKey([ilID_CREDITO.Buffer]) Then
//       If Credito.FindKey([edID_CREDITO.Text]) Then
         Begin
             edNOM_CREDITO.Text := Obten_NombreAcreditado(Credito.ID_CREDITO.AsInteger,Apli);
             chkCredito.Enabled := True;
             chkCredito.Checked := True;
             Credito.GetParams(Objeto);
             InterForma1.NextTab(edID_CREDITO);
         End
         else
             LimpiaDatosCred;

        if not chbxContrato.Checked then
        begin
            LimpiaDatosCto;
        end;
    end;
end;

procedure TWConsitprem.bConsultaClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCONSITPRE_CONSU',True,True) then
   Begin
       //Validaciones
       if  ( chbxContrato.checked     )
       and ( edID_CONTRATO.Text = '' ) then
       begin
               ShowMessage('Para buscar por Línea debe seleccionar una, rectifique.');
               Exit;
       end;

       if  ( chkCredito.checked     )
       and ( edID_CREDITO.Text = '' ) then
       begin
               ShowMessage('Para buscar por Crédito debe seleccionar uno, rectifique.');
               Exit;
       end;

       if ( chkFechaAlta.checked ) then
       begin
           try
               if (StrToDate(edFIni.Text) > StrToDate(edFFin.Text)) then
               begin
                   ShowMessage('La "Fecha de Alta" inicial no debe ser mayor a la final, rectifique.');
                   Exit;
               end;
           except
               On E: Exception Do Begin
                   ShowMessage('El dato capturado para fecha es incorrecto, rectifique.');
                   abort;
               end;
           end;

       end;

       //Consulta
       Screen.Cursor:=crHourGlass;
       ConsultaSitPremio;
       Screen.Cursor:=crDefault;
   end;
end;

procedure TWConsitprem.ConsultaSitPremio;
var
    Q            : TQuery;
    VGSQLGenCons : String;

begin
    VGSQLGenCons := ' SELECT   cc.id_contrato "Línea", ' + #13 +
                    '          cpmp.id_credito "Crédito", ' + #13 +
                    '          SUBSTR(pkgcrconsolidado.fun_nom_tit_cred(cto.id_titular), 1, 80) "Nombre Acreditado", ' + #13 +
                    '          cpmp.cve_ppo_mov "Movimiento", cpm.desc_ppo_mov "Descripción", ' + #13 +
                    '          cpmp.imp_bruto "Importe Bruto", cpmp.imp_iva "IVA", ' + #13 +
                    '          cpmp.imp_neto "Importe Neto", ' + #13 +
                    '          cpmp.id_contrato_dv "Chequera de Abono", ' + #13 +
                    '          SUBSTR(pkgcrconsolidado.fun_nom_tit_cred(c.id_titular), 1, 80) "Nombre Titular Chequera", ' + #13 +
                    '          cpmp.cve_usu_alta "Usuario Alta", ' + #13 +
                    '          cpmp.cve_usu_autoriza "Usuario Autoriza", ' + #13 +
                    '          cpmp.cve_usu_cancela "Usuario Cancela", cpmp.f_alta "Fecha Alta", ' + #13 +
                    '          cpmp.f_autoriza "Fecha Autoriza", cpmp.f_cancela "Fecha Cancela", ' + #13 +
                    '          cpmp.sit_ppo_mov_premio "Situación" ' + #13 +
                    '     FROM cr_ppo_mov_premio cpmp, ' + #13 +
                    '          cr_ppo_mov cpm, ' + #13 +
                    '          contrato c, ' + #13 +
                    '          cr_credito cc, ' + #13 +
                    '          contrato cto ' + #13 +
                    '    WHERE 1 = 1 ' + #13 +
                    '      AND cpm.cve_ppo_mov  = cpmp.cve_ppo_mov ' + #13 +
                    '      AND c.id_contrato(+) = cpmp.id_contrato_dv ' + #13 +
                    '      AND cc.id_credito    = cpmp.id_credito ' + #13 +
                    '      AND cto.id_contrato  = cc.id_contrato ' + #13;

    if chbxContrato.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons + '      AND cc.id_contrato  = ' + edID_CONTRATO.Text + #13;
    end;

    if chkCredito.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons + '      AND cpmp.id_credito  = ' + edID_CREDITO.Text + #13;
    end;

    if chkFechaAlta.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons +
                        '      AND cpmp.f_alta BETWEEN TO_DATE(' + #39 + edFIni.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' +
                        '      AND TO_DATE(' + #39 + edFFin.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13;
    end;

    VGSQLGenCons := VGSQLGenCons + ' ORDER BY cpmp.f_alta ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
//     Q.SQL.SaveToFile('c:\VGSQLGenCons.txt');
     try
          if Q <> nil then
          begin
               TNumericField( Q.FieldByName('Importe Bruto') ).DisplayFormat:= '0,00.00';
               TNumericField( Q.FieldByName('IVA') ).DisplayFormat:= '0,00.00';
               TNumericField( Q.FieldByName('Importe Neto') ).DisplayFormat:= '0,00.00';
               sgcData.addQry(Q,True,True,-1,-1,-1,True);
          end
          else
          begin
               sgcData.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
          end;
     finally
          if Q <> nil then  Q.free;
     end;
end;

procedure TWConsitprem.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWConsitprem.LimpiaDatosCred;
begin
    edID_CREDITO.Text  := '';
    edNOM_CREDITO.Text := '';
    Objeto.Credito.ID_CREDITO.IsNull;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.IsNull;
end;

procedure TWConsitprem.LimpiaDatosCto;
begin
  edID_CONTRATO.Text     := '';
  edDESC_C_PRODUCTO.Text := '';
  Objeto.ContratoCre.ID_CONTRATO.IsNull;
  Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.IsNull;
end;


procedure TWConsitprem.btnGenArchivoXLSClick(Sender: TObject);
begin
    if Objeto.ValidaAccesoEsp('TCONSITPRE_ARCHE',True,True) then
    begin
      If (Trim(ExtractFileName(edFileNameExcel.Text)) = '') Then
         Begin
         MessageDlg('Favor de indicar la ruta en donde se depositará el archivo Excel.', mtWarning, [mbOk], 0);
         If edFileNameExcel.CanFocus Then edFileNameExcel.SetFocus;
         Exit;
         End;

      If FileExists(edFileNameExcel.Text) Then
         Begin
         If (MessageDlg('El archivo indicado ya existe. ¿Desea sobreescribirlo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
            Begin
            DeleteFile(edFileNameExcel.Text);
            End
         Else
            Begin
            MessageDlg('Favor de indicar otro archivo Excel ú otra ruta.', mtWarning, [mbOk], 0);
            If edFileNameExcel.CanFocus Then edFileNameExcel.SetFocus;
            Exit;
            End;
         End;

      btnGenArchivoXLS.Enabled := False;
      bConsulta.Enabled        := False;
      bConsultaClick(Self);
      ArmaArchivoExcel(edFileNameExcel.Text);
   end;
end;

procedure TWConsitprem.ArmaArchivoExcel(peStrFileName: String);
var vlExcelApp : OleVariant;
    vlCol, vlRow : Integer;
    vlColumnRange : Variant;
    vlNombreCol   : String;
    vlCeldaGrid   : String;
begin
  Try
    vlExcelApp := CreateOleObject('Excel.Application');
    vlExcelApp.Workbooks.Add;
    vlColumnRange := vLExcelApp.Workbooks[1].WorkSheets[1].Columns;

    // Coloca el tipo de fuente a 8
    For vlCol := 1 To sgcData.ColCount Do
      Begin
      vlColumnRange.Columns[vlCol].Font.Size := 8;
      // vlColumnRange.Columns[vlCol].ColumnWidth := ;
      End;

    // Copia la informacion al nuevo libro de Excel
    For vlRow := 0 To sgcData.MaxRow - 1 Do
      For vlCol := 0 To sgcData.ColCount - 1 Do
        Begin
            //Valor como viene de la celda SG
            vlCeldaGrid := sgcData.CellStr[sgcData.Columnas[vlCol].ColName, vlRow];

            //montos
            if ( vlCol = 5 ) or ( vlCol = 6 ) or ( vlCol = 7 ) then
            begin
                vlExcelApp.Cells[vlRow + 1, vlCol + 1].NumberFormat := '0,00.00';
            end;

            //fechas
            if (( vlCol = 13 ) or (vlCol = 14 ) or ( vlCol = 15 ))
            and ( vlRow > 0 ) then
            begin
                vlExcelApp.Cells[vlRow + 1, vlCol + 1].HorizontalAlignment := xlRight;
                vlExcelApp.Cells[vlRow + 1, vlCol + 1].NumberFormat := '@';
            end;

            //Limpia cabeceros
            if ( vlRow = 0 ) then
            begin
               vlExcelApp.Cells[vlRow + 1, vlCol + 1].Interior.Color := clYellow;
               vlExcelApp.Cells[vlRow + 1, vlCol + 1].Font.Bold      := True;

               vlNombreCol := QuitarEspeciales(vlCeldaGrid);
               vlNombreCol := Copy(vlNombreCol, 1,Length(vlNombreCol)-1);
               vlCeldaGrid := vlNombreCol;
            end;

            vlExcelApp.Cells[vlRow + 1, vlCol + 1].Value := vlCeldaGrid;

            Application.ProcessMessages;
        End;

     vlColumnRange.Columns.AutoFit;
  Finally
    sgcData.Cursor           := crDefault;
    btnGenArchivoXLS.Enabled := True;
    bConsulta.Enabled        := True;
    vlExcelApp.ActiveWorkBook.SaveAs(peStrFileName);
    CloseExcelFile(vlExcelApp);
    Application.ProcessMessages;
    MessageDlg('Archivo Excel Generado',mtInformation,[mbOk],0);
  End;
end;


procedure TWConsitprem.SpeedButton1Click(Sender: TObject);
begin
    OpenDialogXLS.InitialDir := ExtractFilePath(edFileNameExcel.Text);
    if OpenDialogXLS.Execute then
        edFileNameExcel.Text := OpenDialogXLS.FileName;
end;


function TWConsitprem.QuitarEspeciales(const Cad: string): string;
const
    VALIDOS=[' ','0'..'9','A'..'Z','a'..'z','á','é','í','ó','ú'];
var
    i: Integer;
begin
    Result:= '';
    for i:= 1 to Length(Cad) do
        if Cad[i] in VALIDOS then Result:= Result+Cad[i]
end;


procedure TWConsitprem.chkCreditoClick(Sender: TObject);
begin
    //bConsultaClick(Sender);
end;

procedure TWConsitprem.chkFechaAltaClick(Sender: TObject);
begin
    //bConsultaClick(Sender);
end;

procedure TWConsitprem.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWConsitprem.ilCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWConsitprem.ilCONTRATOEjecuta(Sender: TObject);
begin
    with objeto do
    begin
        If ContratoCre.FindKey([ilCONTRATO.Buffer,1]) Then Begin
            chbxContrato.Checked:=True;
            chbxContrato.Enabled:=True;
            ContratoCre.GetParams(Objeto);
            InterForma1.NextTab(edID_CONTRATO);
            LimpiaDatosCred;
        End
        else
        begin
            LimpiaDatosCto;
            LimpiaDatosCred;
        end;
    end;
end;

procedure TWConsitprem.btnCONTRATOClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCONSITPRE_BLIN',True,True) then
   Begin
        with objeto do
        begin
            ContratoCre.ShowAll := True;

            If ContratoCre.Busca Then Begin
                chbxContrato.Checked := True;
                chbxContrato.Enabled := True;
                InterForma1.NextTab(edID_CONTRATO);
                LimpiaDatosCred;
            End
            else
            begin
                LimpiaDatosCto;
                LimpiaDatosCred;
            end;
        end;
   end;
end;

procedure TWConsitprem.chbxContratoClick(Sender: TObject);
begin
    //bConsultaClick(Sender);
end;

end.

