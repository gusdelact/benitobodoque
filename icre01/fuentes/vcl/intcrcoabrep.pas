// Sistema         : Clase de CR_FVAL
// Fecha de Inicio : 09/11/2009
// Función forma   : Clase de CR_FVAL     
// Desarrollo por  : Copy and Paste.
// Diseñado por    :
// Comentarios     :                 
Unit IntCrCoABRep;

interface               

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
Menus, Excel97, OleServer, {IntCrActPa,} DBGrids, IntSGCtrl, ImgList,
IntGenCre,
RepNomA;

const
cMAXFVAL = 5000;

Type
 TCrCoABRep= class;

  TWCrCoABRep=Class(TForm)
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    InterForma1: TInterForma;
    sdReporteCobranza: TSaveDialog;
    Panel1: TPanel;
    Label2: TLabel;
    dtpF_CIERRE: TDateTimePicker;
    btBusca: TButton;
    lbFileNameExcel: TLabel;
    edReporteCobranza: TEdit;
    SGDatos: TSGCtrl;
    btnDReporteCobranza: TButton;
    btnGenArchivo: TButton;
    rgTiposReporte: TRadioGroup;
    TreeView1: TTreeView;
    Label1: TLabel;
    ImageList1: TImageList;
    Label3: TLabel;
    lbEmpresa1: TLabel;
    vgQryNomina: TQuery;
    btnGebReporte: TButton;
    rgOrdenar: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    F_Cobro_Ant: TEdit;
    F_Cobro_Sig: TEdit;
    Label6: TLabel;
    Label7: TLabel; //Consulta de empresas  04.03.2011
    procedure FormShow(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure btMuestraInformacionClick(Sender: TObject);
    procedure btnDReporteCobranzaClick(Sender: TObject);
    procedure btnGenArchivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGebReporteClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure dtpF_CIERRECloseUp(Sender: TObject);
    procedure dtpF_CIERREChange(Sender: TObject);

    private
    { Private declarations }
      vgID_EMPRESA  : String;
    public
    { Public declarations }
    Objeto : TCrCoABRep;
    ParamCre    : TParamCre;
    procedure ShowDataNomina;
    procedure GeneraReporte1(strNombreArchivo : String);
    procedure GeneraReporte2(strNombreArchivo : String);
    procedure Muestra_Arbol(Sender: TObject);
    function ArmaQuery(peID_EMPRESA : String; peF_NOMINA : TDateTime; peORIGEN : string) : String;
    function DevuelveFechaNomina(peFecha : TDateTime) : TDateTime;
    function FechaAnterior(peFecha : TDateTime): TDateTime;
    function FechaSiguiente(peFecha : TDateTime): TDateTime;
end;
 TCrCoABRep= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

var
   vlQry : TQuery;
   vlSql, vlID_EMPRESA, vlEMPRESA : String;
   Nodo_Raiz : TTreeNode;
   B_HAYDATOS : boolean;   


implementation

uses IntDmMain,
     IntCreSelEmp;         // Reporte de Nomina. Seleccion de Empresas                      03/04/2011
    // IntCrEmpresas;
    //IntCrVencAnt;
//Uses RepMon;

{$R *.DFM}


constructor TCrCoABRep.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'InTCrCoABRep.Hlp';
      ShowMenuReporte:=True;
end;


Destructor TCrCoABRep.Destroy;
begin inherited;
end;

function TCrCoABRep.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoABRep;
begin
   W:=TWCrCoABRep.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCoABRep.InternalBusca:Boolean;
begin InternalBusca := False;
end;

(***********************************************FORMA CR_FVAL********************)
(*                                                                              *)
(*  FORMA DE CR_FVAL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FVAL********************)

procedure TWCrCoABRep.Muestra_Arbol(Sender: TObject);
begin
 { Limpia los Datos del arbol}
   TreeView1.Items.Clear;
   Nodo_Raiz := TreeView1.Items.Add(Nil,'Nomina');
   vlSql :=' SELECT ID_EMPRESA, EMPRESA ' +
           ' FROM TMP_EMPRESAS' +
           ' ORDER BY ID_EMPRESA';

   vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
   try
     if vlQry <> nil then
     begin
        while not vlQry.Eof do
        begin
           vlEMPRESA := vlQry.FieldByName('EMPRESA').AsString;
           TreeView1.Items.AddChild(Nodo_Raiz,vlEMPRESA);    //.Items[0]Expanded := True;
           vlQry.Next;
        end;
     end;
   finally
     if vlQry <> nil then
          vlQry.free;
   end;
   if TreeView1.Items.Count>2 then TreeView1.Items.AddChild(Nodo_Raiz,'TODAS');    //.Items[0]Expanded := True;
end;

procedure TWCrCoABRep.FormShow(Sender: TObject);
var
  rb : TRadioButton;

begin
     //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
  With Objeto Do
  Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   { dtpF_Cierre.Date := Objeto.Apli.DameFechaEmpresa;
    F_cobro_Sig.Text := DateToStr(FechaSiguiente(dtpF_CIERRE.Date));
    F_cobro_Ant.Text := DateToStr(FechaAnterior(dtpF_CIERRE.Date));    }


    F_cobro_Sig.Text := DateToStr(FechaSiguiente(Objeto.Apli.DameFechaEmpresa));
    F_cobro_Ant.Text := DateToStr(FechaAnterior(Objeto.Apli.DameFechaEmpresa));
    dtpF_Cierre.Date := StrToDate(F_cobro_Sig.Text);

  End;
  rb := rgTiposReporte.Controls[0] as TRadioButton;
  rb.checked := True;

  vgQryNomina.DatabaseName := Objeto.Apli.DataBaseName;
  vgQryNomina.SessionName  := Objeto.Apli.SessionName;

  Muestra_Arbol(Sender);
end;

procedure TWCrCoABRep.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrCoABRep.btMuestraInformacionClick(Sender: TObject);
var  CreSelEmp : TCreSelEmp;
begin
   if Objeto.ValidaAccesoEsp('TCRCOABREP_SELEM',True,True) then
   begin
       {$WARNINGS OFF}
       CreSelEmp := TCreSelEmp.Create(self);
       {$WARNINGS ON}
       try
          CreSelEmp.Apli:=dmMain.apMain;
          CreSelEmp.ParamCre:=ParamCre;
          CreSelEmp.Catalogo;
       finally
          CreSelEmp.Free;
       end;
          Muestra_Arbol(Sender);
   end;
end;

procedure TWCrCoABRep.btnDReporteCobranzaClick(Sender: TObject);
begin
  If Trim(ExtractFileName(edReporteCobranza.Text)) <> '' Then
    sdReporteCobranza.FileName := edReporteCobranza.Text
  Else
    sdReporteCobranza.FileName := ExtractFilePath(edReporteCobranza.Text) + 'Nomina.Csv';

  If sdReporteCobranza.Execute Then
  begin
    edReporteCobranza.Text := sdReporteCobranza.FileName;
  end;
end;

procedure TWCrCoABRep.btnGenArchivoClick(Sender: TObject);
var
  txtFile : TextFile;
  text : String;
  rb : TRadioButton;
begin
   if Objeto.ValidaAccesoEsp('TCRCOABREP_GENAR',True,True) then
   begin
      if B_HAYDATOS = FALSE then
      begin
        ShowMessage('No hay imformacion para mostrar');
        Exit;
      end;

      if edReporteCobranza.Text = '' then
      begin
        ShowMessage('Debe definir los nombres de los reportes');
        Exit;
      end;

      if FileExists(edReporteCobranza.Text) then
      begin
        if MessageDlg('Reporte existente. ¿Desea sobreescribirlo?',
           mtConfirmation, [mbYes, mbNo], 0) <> mrYes
        then Exit;
      end;

      AssignFile(txtFile, edReporteCobranza.Text);
      ReWrite(txtFile);
      if Assigned(vgQryNomina) then
      begin
        If Not vgQryNomina.Active Then
          Begin
          MessageDlg('Debe de seleccionar un periodo válido y una empresa para poder empezar',
                     mtWarning, [mbOk], 0);
          Exit;
          End;

        vgQryNomina.First;
        rb := rgTiposReporte.Controls[0] as TRadioButton;
        If rb.Checked Then
        begin
          WriteLn(txtFile, 'EMPLEADO, ADEUDO');
          while not vgQryNomina.Eof do
          begin
            text := vgQryNomina.FieldByName('NUM_EMPLEADO').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_TOTAL').AsString;
                    vgQryNomina.FieldByName('DIF_TOT').AsString;
            WriteLn(txtFile, text);
            vgQryNomina.Next;
          end
        end
        else
        begin
          WriteLn(txtFile, 'EMPLEADO, CREDITO, EMPRESA, CVE PROD., NOMBRE, CAPITAL, INTERES, IVA INT, COMISION, IVA COMIS, ADEUDO ');
          while not vgQryNomina.Eof do
          begin
            text := vgQryNomina.FieldByName('NUM_EMPLEADO').AsString + ',' +
                    vgQryNomina.FieldByName('ID_CREDITO').AsString + ',' +
                    vgQryNomina.FieldByName('ID_EMPRESA').AsString + ',' +
                    //vgID_EMPRESA + ',' +
                    vgQryNomina.FieldByName('CVE_PRODUCTO').AsString + ',' +
                    vgQryNomina.FieldByName('NOMBRE').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_CAPITAL').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_INTERES').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_IVA_INTERES').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_COMISION').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_IVA_COMISION').AsString + ',' +
                    //vgQryNomina.FieldByName('IMP_TOTAL').AsString;

                    FloatToStr(vgQryNomina.FieldByName('IMP_CAPITAL').AsFloat      - vgQryNomina.FieldByName('IMP_CAP_PAG').AsFloat)     + ',' +
                    FloatToStr(vgQryNomina.FieldByName('IMP_INTERES').AsFloat      - vgQryNomina.FieldByName('IMP_INT_PAG').AsFloat)     + ',' +
                    FloatToStr(vgQryNomina.FieldByName('IMP_IVA_INTERES').AsFloat  - vgQryNomina.FieldByName('IMP_IVA_INT_PAG').AsFloat) + ',' +
                    FloatToStr(vgQryNomina.FieldByName('IMP_COMISION').AsFloat     - vgQryNomina.FieldByName('IMP_COM_PAG').AsFloat)     + ',' +
                    FloatToStr(vgQryNomina.FieldByName('IMP_IVA_COMISION').AsFloat - vgQryNomina.FieldByName('IMP_IVA_COM_PAG').AsFloat) + ',' +
                    vgQryNomina.FieldByName('DIF_TOT').AsString ;

            WriteLn(txtFile, text);
            vgQryNomina.Next;
          end;
        end;
      CloseFile(txtFile);
      MessageDlg('Reporte generado correctamente', mtInformation, [mbOk], 0 );
      end;
   end;  //SEGURIDAD
end;

procedure TWCrCoABRep.GeneraReporte1(strNombreArchivo: String);
var
  txtFile : TextFile;
  text : String;
  i,nRegs : Integer;
begin
  AssignFile(txtFile, strNombreArchivo);
  ReWrite(txtFile);

  with SGDatos do
  begin
    nRegs := SG.RowCount;
    For i:= 1 to nRegs do
    begin
      text := sg.Cells[1,i];
      text := sg.Cells[2,i];
      text := sg.Cells[1,i] + ', ' + sg.Cells[2,i];
      WriteLn(txtFile, text);
    end;
    CloseFile(txtFile);
  end;
end;

procedure TWCrCoABRep.GeneraReporte2(strNombreArchivo: String);
var
  txtFile : TextFile;
  text : String;
  i,nRegs : Integer;
begin
  AssignFile(txtFile, strNombreArchivo);
  ReWrite(txtFile);

  with SGDatos do
  begin
    nRegs := SG.RowCount;
    For i:= 1 to nRegs do
    begin
      text := sg.Cells[1,i];
      text := sg.Cells[2,i];
      text := sg.Cells[1,i] + ', ' + sg.Cells[2,i];
      WriteLn(txtFile, text);
    end;
    CloseFile(txtFile);
  end;
end;


procedure TWCrCoABRep.ShowDataNomina;
var  Y  : Integer;
     vlTotal : double;

begin

  vgQryNomina.Close;
  vgQryNomina.SQL.Clear;
//  vgQryNomina.SQL.Add(ArmaQuery(vgID_EMPRESA, DevuelveFechaNomina(dtpF_CIERRE.Date) ));
  vgQryNomina.SQL.Add(ArmaQuery(vgID_EMPRESA, dtpF_CIERRE.Date , 'P'));
  vgQryNomina.Open;
  vgQryNomina.FieldByName('NUM_EMPLEADO').DisplayLabel := 'Empleado';
  vgQryNomina.FieldByName('NUM_EMPLEADO').DisplayWidth := 10;
  vgQryNomina.FieldByName('ID_CREDITO').DisplayLabel := 'Crédito';
  vgQryNomina.FieldByName('ID_CREDITO').DisplayWidth := 10;
  vgQryNomina.FieldByName('CVE_PRODUCTO').DisplayLabel := 'Producto';
  vgQryNomina.FieldByName('CVE_PRODUCTO').DisplayWidth := 15;
  vgQryNomina.FieldByName('ID_EMPRESA').DisplayLabel := 'Empresa';
  vgQryNomina.FieldByName('ID_EMPRESA').DisplayWidth := 10;
  vgQryNomina.FieldByName('NOMBRE').DisplayLabel := 'Nombre';
  vgQryNomina.FieldByName('NOMBRE').DisplayWidth := 50;
  //
  vgQryNomina.FieldByName('IMP_CAPITAL').DisplayLabel := 'Capital';
  vgQryNomina.FieldByName('IMP_CAPITAL').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_INTERES').DisplayLabel := 'Interes';
  vgQryNomina.FieldByName('IMP_INTERES').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_IVA_INTERES').DisplayLabel := 'IVA';
  vgQryNomina.FieldByName('IMP_IVA_INTERES').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_COMISION').DisplayLabel := 'Comisión';
  vgQryNomina.FieldByName('IMP_COMISION').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_IVA_COMISION').DisplayLabel := 'IVA de Comisión';
  vgQryNomina.FieldByName('IMP_IVA_COMISION').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_TOTAL').DisplayLabel := 'Total';
  vgQryNomina.FieldByName('IMP_TOTAL').DisplayWidth := 14;
  //
  vgQryNomina.FieldByName('IMP_CAP_PAG').DisplayLabel := 'Capital Pagado';
  vgQryNomina.FieldByName('IMP_CAP_PAG').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_INT_PAG').DisplayLabel := 'Interes Pagado';
  vgQryNomina.FieldByName('IMP_INT_PAG').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_IVA_INT_PAG').DisplayLabel := 'IVA Pagado';
  vgQryNomina.FieldByName('IMP_IVA_INT_PAG').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_COM_PAG').DisplayLabel := 'Comisión Pagado';
  vgQryNomina.FieldByName('IMP_COM_PAG').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_IVA_COM_PAG').DisplayLabel := 'IVA de Comisión Pagado';
  vgQryNomina.FieldByName('IMP_IVA_COM_PAG').DisplayWidth := 14;
  vgQryNomina.FieldByName('IMP_PAG_T').DisplayLabel := 'Total Pagado';
  vgQryNomina.FieldByName('IMP_PAG_T').DisplayWidth := 14;
  //
  vgQryNomina.FieldByName('DIF_CAP').DisplayLabel := 'Adeudo Capital';
  vgQryNomina.FieldByName('DIF_CAP').DisplayWidth := 14;
  vgQryNomina.FieldByName('DIF_INT').DisplayLabel := 'Adeudo Interes+IVA';
  vgQryNomina.FieldByName('DIF_INT').DisplayWidth := 14;
  vgQryNomina.FieldByName('DIF_COM').DisplayLabel := 'Adeudo Comisión+IVA';
  vgQryNomina.FieldByName('DIF_COM').DisplayWidth := 14;
  vgQryNomina.FieldByName('DIF_TOT').DisplayLabel := 'Adeudo Total';
  vgQryNomina.FieldByName('DIF_TOT').DisplayWidth := 14;
  SGDatos.AddQry(vgQryNomina,True,True,20,20,20,True);

  //
  vlTotal :=0;
  for Y := 1 to sgDatos.SG.RowCount-1 do
    vlTotal:= vlTotal + StrToFloat(sgDatos.CellStr[ 'IMP_TOTAL', Y ]);

  if vlTotal=0 then
  begin
     sgDatos.Clear(' ');
     B_HAYDATOS:=FALSE;
  end
  else B_HAYDATOS:=TRUE;

end;

procedure TWCrCoABRep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vgQryNomina.Close;
end;

procedure TWCrCoABRep.btnGebReporteClick(Sender: TObject);
var
 // Rp  : TRepDNom;
  vlStrSQL : String;
  //vlID_EMPRESA : integer;    
  rb : TRadioButton;
  vlFechaNomina : TDateTime;
begin
   if Objeto.ValidaAccesoEsp('TCRCOABREP_REPOR',True,True) then
   begin
     if B_HAYDATOS = FALSE then
      begin
        ShowMessage('No hay imformacion para mostrar');
        Exit;
      end;

      //if (Rp <> nil) then Rp.Free;

      //Rp := TRepDNom.Create(Self);
      //Rp.qNomina.Active := False;
      //Establece el query

      vlFechaNomina := dtpF_CIERRE.Date;
      vlStrSQL:= ArmaQuery(vgID_EMPRESA, vlFechaNomina, 'R');
      //QUERY PARA EL REPORTE EN QR

      Case rgOrdenar.ItemIndex Of
        0 : vlStrSQL := vlStrSQL + '  ORDER BY NOMBRE ';
        1 : vlStrSQL := vlStrSQL + '  ORDER BY RESULT.NUM_EMPLEADO ';
      End;


      RepNomina( vlStrSQL, DatetoStr(vlFechaNomina), lbEmpresa1.Caption, Objeto.Apli);

      //Rp.QRInterEncabezado1.Titulo1 := 'Reporte de vencimientos créditos ABCD';

      //Rp.QRInterEncabezado1.Titulo2 := 'Día:  ' +  DatetoStr(vlFechaNomina) +  ' Empresa: ' + lbEmpresa1.Caption;

      //Rp.qNomina.DatabaseName := Objeto.Apli.DataBaseName;
      //Rp.qNomina.SessionName  := Objeto.Apli.SessionName;
      //Rp.qNomina.close;
      //Rp.qNomina.sql.clear;
      //Rp.qNomina.sql.add(vlStrSQL);

      //Rp.qNomina.SQL.SaveToFile('c:\IntCrCoABRep.SQL');

      //Rp.qNomina.open;

     // Rp.qNomina.Active := True;
      //Rp.QRInterEncabezado1.Apli := Objeto.Apli;
      //Rp.Preview;
      //Rp.Free;
   end;
end;

function TWCrCoABRep.ArmaQuery(peID_EMPRESA: String; peF_NOMINA: TDateTime; peORIGEN: STRING): String;
var vlStrSQL, vlstrID_EMPRESA, vlstrF_NOMINA, vlOrigen : String;
begin
  vlstrID_EMPRESA := peID_EMPRESA;
  vlstrF_NOMINA := SQLFecha(peF_NOMINA);
  //QUERY PARA EL REPORTE A EXPORTAR EN EXCEL

   vlStrSQL :=
    ' SELECT '+coCRLF+
    '     RESULT.NUM_EMPLEADO	,'+coCRLF+
    '	  RESULT.ID_CREDITO,'+coCRLF+
    '	  RESULT.CVE_PRODUCTO,'+coCRLF+
    '     RESULT.ID_EMPRESA, '+coCRLF+
    '     (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA) AS NOMBRE,'+coCRLF+
    '     RESULT.IMP_CAPITAL '+coCRLF;

    if peORIGEN='P' then
    begin
    vlStrSQL := vlStrSQL +

    '    ,RESULT.IMP_INTERES,'+coCRLF+
    '     RESULT.IMP_IVA_INTERES,'+coCRLF+
    '     RESULT.IMP_COMISION ,'+coCRLF+
    '     RESULT.IMP_IVA_COMISION, '+coCRLF+
    '     RESULT.IMP_TOTAL '+coCRLF+
    //     
    '	  ,RESULT.IMP_CAP_PAG,'+coCRLF+
    ' 	  RESULT.IMP_INT_PAG,'+coCRLF+
    '	  RESULT.IMP_IVA_INT_PAG,'+coCRLF+
    '	  RESULT.IMP_COM_PAG,'+coCRLF+
    '	  RESULT.IMP_IVA_COM_PAG,'+coCRLF+
    //'	  RESULT.IMP_INT_PAG_T,'+coCRLF+
    //'	  RESULT.IMP_COM_PAG_T,'+coCRLF+
    '	  RESULT.IMP_PAG_T,'+coCRLF+

    '	  RESULT.IMP_CAPITAL - RESULT.IMP_CAP_PAG AS DIF_CAP,'+coCRLF+
    '	  (RESULT.IMP_INTERES + RESULT.IMP_IVA_INTERES) - RESULT.IMP_INT_PAG_T AS DIF_INT,'+coCRLF+
    '	  (RESULT.IMP_COMISION + RESULT.IMP_IVA_COMISION) - RESULT.IMP_COM_PAG_T AS DIF_COM,'+coCRLF+
    '     RESULT.IMP_TOTAL - RESULT.IMP_PAG_T AS DIF_TOT '+coCRLF;
    end;


   if peORIGEN='R' then
   begin
    vlStrSQL := vlStrSQL + '     , RESULT.SIT_EMPLEADO, '+coCRLF+
    '     (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA) AS NBR_PERSONA,'+coCRLF+
    '     RESULT.NUM_PERIODO, '+coCRLF+
    '	  RESULT.f_vencimiento,'+coCRLF+
    '     RESULT.SIT_CREDITO, '+coCRLF+
    '     RESULT.id_persona, '+coCRLF+
    '     RESULT.F_PAGO, '+coCRLF+

    '     (RESULT.IMP_INTERES + RESULT.IMP_IVA_INTERES) AS IMP_INTERES, '+coCRLF+
    '     (RESULT.IMP_COMISION + RESULT.IMP_IVA_COMISION) AS IMP_COMISION, '+coCRLF+

    '     RESULT.IMP_TOTAL AS total, '+coCRLF+

    '	  RESULT.IMP_CAP_PAG,'+coCRLF+
    ' 	  RESULT.IMP_INT_PAG,'+coCRLF+
    '	  RESULT.IMP_IVA_INT_PAG,'+coCRLF+
    '	  RESULT.IMP_COM_PAG,'+coCRLF+
    '	  RESULT.IMP_IVA_COM_PAG,'+coCRLF+
    '	  RESULT.IMP_INT_PAG_T,'+coCRLF+
    '	  RESULT.IMP_COM_PAG_T,'+coCRLF+
    '	  RESULT.IMP_PAG_T,'+coCRLF+

    '	  RESULT.IMP_CAPITAL - RESULT.IMP_CAP_PAG AS DIF_CAP,'+coCRLF+
    '	  (RESULT.IMP_INTERES + RESULT.IMP_IVA_INTERES) - RESULT.IMP_INT_PAG_T AS DIF_INT,'+coCRLF+
    '	  (RESULT.IMP_COMISION + RESULT.IMP_IVA_COMISION) - RESULT.IMP_COM_PAG_T AS DIF_COM,'+coCRLF+
    '     RESULT.IMP_TOTAL - RESULT.IMP_PAG_T AS DIF_TOT,'+coCRLF+

    '	  RESULT.SIT_CAPITAL,'+coCRLF+
    '	  RESULT.SIT_INTERES,'+coCRLF+
    '	  RESULT.SIT_COMISION,'+coCRLF+
    '     SUBSTR(Pkgcrperiodo.STPObtChqCte(NULL,NULL,RESULT.ID_CREDITO,''AC'',''AD'',''CR''),1,20) CHEQUERA,'+coCRLF+
    '     '''+lbEmpresa1.Caption+''' EMPRESA'+coCRLF;
    end;

    vlStrSQL := vlStrSQL + 'FROM'+coCRLF+
    ' ('+coCRLF+
    '  SELECT CC.id_credito,CC.SIT_CREDITO,'+coCRLF+
    '		  TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO,'+coCRLF+
    '		  E.ID_EMPRESA,'+coCRLF+
    '         E.NUM_EMPLEADO,'+coCRLF+
    '         E.SIT_EMPLEADO, '+coCRLF+
    '         E.ID_PERSONA,'+coCRLF+
    '         SUM(NVL(CA_CRED.IMP_CAPITAL, 0))  AS IMP_CAPITAL,'+coCRLF+
    '         SUM(NVL(CI_CRED.IMP_INTERES_PROY, 0)) AS IMP_INTERES,'+coCRLF+
    '         SUM(NVL(CI_CRED.IMP_IVA_PROYEC, 0)) AS IMP_IVA_INTERES,'+coCRLF+
    '         SUM(NVL(CDC_CRED.IMP_COMISION,0)) AS IMP_COMISION,'+coCRLF+
    '         SUM(NVL(CDC_CRED.IMP_IVA,0)) AS IMP_IVA_COMISION,'+coCRLF+
    '         SUM(NVL(CA_CRED.IMP_CAPITAL, 0) +'+coCRLF+
    '             NVL(CI_CRED.IMP_INTERES_PROY, 0) +'+coCRLF+
    '             NVL(CI_CRED.IMP_IVA_PROYEC, 0) +'+coCRLF+
    '             NVL(CDC_CRED.IMP_COMISION, 0) +'+coCRLF+
    '             NVL(CDC_CRED.IMP_IVA,0)) AS IMP_TOTAL,'+coCRLF+
    '			CA_CRED.f_vencimiento,'+coCRLF+
    '            CA_CRED.F_PAGO,'+coCRLF+
    '           CA_CRED.NUM_PERIODO,'+coCRLF+
    '	        NVL(CA_CRED.IMP_CAP_PAG,0) IMP_CAP_PAG,'+coCRLF+
    '	        NVL(CI_CRED.IMP_INT_PAG,0) IMP_INT_PAG,'+coCRLF+
    '	        NVL(CI_CRED.IMP_IVA_INT_PAG,0) IMP_IVA_INT_PAG,'+coCRLF+
    '	        NVL(CDC_CRED.IMP_COM_PAG,0) IMP_COM_PAG,'+coCRLF+
    '	        NVL(CDC_CRED.IMP_IVA_COM_PAG,0) IMP_IVA_COM_PAG,'+coCRLF+
    '			 SUM(NVL(CI_CRED.IMP_INT_PAG,0) + NVL(CI_CRED.IMP_INT_PAG,0)) AS IMP_INT_PAG_T,'+coCRLF+
    '         SUM(NVL(CDC_CRED.IMP_COM_PAG,0)+NVL(CDC_CRED.IMP_IVA_COM_PAG,0)) AS IMP_COM_PAG_T,'+coCRLF+
    '         SUM(NVL(CA_CRED.IMP_CAP_PAG,0)+ '+coCRLF+
    '	         	 NVL(CI_CRED.IMP_INT_PAG,0)+ '+coCRLF+
    '	        	 NVL(CI_CRED.IMP_IVA_INT_PAG,0)+ '+coCRLF+
    '	        	 NVL(CDC_CRED.IMP_COM_PAG, 0) + '+coCRLF+
    '	        	 NVL(CDC_CRED.IMP_IVA_COM_PAG,0)) AS IMP_PAG_T,'+coCRLF+
    '        CA_CRED.SIT_CAPITAL,'+coCRLF+
    '  	    CI_CRED.SIT_INTERES,'+coCRLF+
    '  	    CDC_CRED.SIT_COMISION'+coCRLF+
    '  FROM --CAPITAL DE INTERCREDITOS'+coCRLF+
    '	       ( SELECT CA.ID_CREDITO, CA.NUM_PERIODO, CA.F_PAGO, CA.IMP_CAPITAL, ca.f_vencimiento, NVL(CT.IMP_OPERACION,0) AS IMP_CAP_PAG, CA.SIT_CAPITAL'+coCRLF+
    '            FROM CRE_CAPITAL CA,'+coCRLF+
    '		      (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CREDITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'+coCRLF+
    '                  AND CVE_OPERACION IN (''CCAPIT'', ''CAMCAP'', ''CPCAPP'',''CPCAPV'')'+coCRLF+
    '                  AND F_PROCESO = '+vlstrF_NOMINA+coCRLF+
    '                   AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '			 GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'+coCRLF+
    '			) CT'+coCRLF+
    '         WHERE CA.F_VENCIMIENTO = '+vlstrF_NOMINA+coCRLF+
    '           AND CA.SIT_CAPITAL NOT IN (''TA'',''TC'',''TI'',''TL'',''TP'',''TR'',''TS'', ''CA'')'+coCRLF+
    '           AND CT.ID_CREDITO (+)= CA.ID_CREDITO'+coCRLF+
    '           AND CT.NUM_PERIODO (+)= CA.NUM_PERIODO'+coCRLF+
    '       ) CA_CRED,'+coCRLF+
    '       --INTERES DE INTERCREDITOS'+coCRLF+
    '       ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA_PROYEC, NVL(CT.IMP_OPERACION,0) AS IMP_INT_PAG, NVL(CT2.IMP_OPERACION,0) AS IMP_IVA_INT_PAG, CI.SIT_INTERES'+coCRLF+
    '         FROM CRE_INTERES CI,'+coCRLF+
    '			      (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CREDITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'+coCRLF+
    '                  AND CVE_OPERACION IN (''CAMINT'', ''CPINTP'', ''CPINTV'', ''AMOINT'')'+coCRLF+
    '                  AND F_PROCESO = '+vlstrF_NOMINA+coCRLF+
    '                  AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '					GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'+coCRLF+
    '					  ) CT,'+coCRLF+
    '			      (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CREDITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'+coCRLF+
    '                  AND CVE_OPERACION IN (''CAMIVA'', ''CPIVAP'', ''CPIVAV'')'+coCRLF+
    '                  AND F_PROCESO = '+vlstrF_NOMINA+coCRLF+
    '                   AND SIT_TRANSACCION= ''AC''' +coCRLF+
    '					GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'+coCRLF+
    '					  ) CT2'+coCRLF+
    '         WHERE CI.F_VENCIMIENTO = '+vlstrF_NOMINA+coCRLF+
    '           AND CI.SIT_INTERES NOT IN (''TA'',''TC'',''TI'',''TL'',''TP'',''TR'',''TS'', ''CA'')'+coCRLF+
    '           AND CT.ID_CREDITO (+)= CI.ID_CREDITO'+coCRLF+
    '           AND CT.NUM_PERIODO (+)= CI.NUM_PERIODO'+coCRLF+
    '           AND CT2.ID_CREDITO (+)= CI.ID_CREDITO'+coCRLF+
    '           AND CT2.NUM_PERIODO (+)= CI.NUM_PERIODO'+coCRLF+
    '       ) CI_CRED,'+coCRLF+
    '       -- COMISIONES DE INTERCREDITOS'+coCRLF+
    '       ( SELECT CDC.ID_CREDITO, CDC.IMP_COMISION, CDC.IMP_IVA, NVL(CT.IMP_OPERACION,0) AS IMP_COM_PAG, 0 AS IMP_IVA_COM_PAG, CDC.SIT_COMISION'+coCRLF+
    '         FROM CRE_DET_COMISION CDC,'+coCRLF+
    '              (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CREDITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'+coCRLF+
    '                  AND CVE_OPERACION IN (''CPSVEM'',''CPSVEI'', ''CPSVEP'', ''CPSVEI'')'+coCRLF+
    '                  AND F_PROCESO = '+vlstrF_NOMINA+coCRLF+
    '                   AND SIT_TRANSACCION= ''AC''' +coCRLF+
    '					GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'+coCRLF+
    '					  ) CT'+coCRLF+
    '         WHERE CDC.F_VENCIMIENTO = '+vlstrF_NOMINA+coCRLF+
    '           AND CDC.SIT_COMISION NOT IN (''TA'',''TC'',''TI'',''TL'',''TP'',''TR'',''TS'', ''CA'')'+coCRLF+
    '           AND CT.ID_CREDITO (+)= CDC.ID_CREDITO'+coCRLF+
    '           AND CT.NUM_PERIODO (+)= CDC.NUM_PERIODO'+coCRLF+
    '       ) CDC_CRED,'+coCRLF+
    '        CRE_CREDITO CC,'+coCRLF+
    '        CRE_CONTRATO CO,'+coCRLF+
    '        CONTRATO CTO,'+coCRLF+
    '        ( SELECT E.ID_EMPRESA, E.ID_PERSONA, E.NUM_EMPLEADO, E.SIT_EMPLEADO '+coCRLF+
    '          FROM EMPLEADO E'+coCRLF+
    '          WHERE E.ID_EMPRESA IN ( '+ vlstrID_EMPRESA+ ' )'+coCRLF+
    '        ) E'+coCRLF+
    '  WHERE 1=1'+coCRLF+
    '    AND CC.SIT_CREDITO = ''AC'''+coCRLF+
    '    AND CA_CRED.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF+
    '    AND CI_CRED.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF+
    '    AND CDC_CRED.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF+
    '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
    '    AND CO.CVE_SUB_TIP_BCO  IN ('+coCRLF+
    '                                 SELECT TO_NUMBER(CVE_CLAVE) AS CVE_SUB_TIP_BCO'+coCRLF+
    '                                 FROM CR_CON_CAT_DATA'+coCRLF+
    '                                 WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD_C'''+coCRLF+
    '                               )'+coCRLF+
    '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
    '    AND E.ID_PERSONA(+) = CTO.ID_TITULAR'+coCRLF+
    '  GROUP BY cc.id_credito,CC.SIT_CREDITO,E.ID_EMPRESA, E.NUM_EMPLEADO, E.ID_PERSONA, E.SIT_EMPLEADO,CA_CRED.f_vencimiento, CO.CVE_SUB_TIP_BCO,'+coCRLF+
    '	        CA_CRED.IMP_CAP_PAG, CI_CRED.IMP_INT_PAG, CI_CRED.IMP_IVA_INT_PAG, CDC_CRED.IMP_COM_PAG, CDC_CRED.IMP_IVA_COM_PAG,'+coCRLF+
    '        CA_CRED.SIT_CAPITAL, CI_CRED.SIT_INTERES, CDC_CRED.SIT_COMISION, CA_CRED.F_PAGO,CA_CRED.NUM_PERIODO '+coCRLF+
    'UNION'+coCRLF+
    '  SELECT cc.id_credito,CC.SIT_CREDITO,'+coCRLF+
    '		  TO_CHAR(CO.CVE_PRODUCTO_CRE) AS CVE_PRODUCTO,'+coCRLF+
    '		  E.ID_EMPRESA,'+coCRLF+
    '         E.NUM_EMPLEADO,'+coCRLF+
    '         E.SIT_EMPLEADO, '+coCRLF+
    '         E.ID_PERSONA,'+coCRLF+
    '         SUM(NVL(CA_ICRE.IMP_CAPITAL,0))            AS IMP_CAPITAL,'+coCRLF+
    '         SUM(NVL(CI_ICRE.IMP_INTERES_PROY,0)) AS IMP_INTERES,'+coCRLF+
    '         SUM(NVL(CI_ICRE.IMP_IVA_PROY,0)) AS IMP_IVA_INTERES,'+coCRLF+
    '         SUM(NVL(CDC_ICRE.IMP_COMISION,0)) AS IMP_COMISION,'+coCRLF+
    '         SUM(NVL(CDC_ICRE.IMP_IVA,0)) AS IMP_IVA_COMISION,'+coCRLF+
    '         SUM(NVL(CA_ICRE.IMP_CAPITAL,0) +'+coCRLF+
    '             NVL(CI_ICRE.IMP_INTERES_PROY,0) +'+coCRLF+
    '             NVL(CI_ICRE.IMP_IVA_PROY,0) +'+coCRLF+
    '             NVL(CDC_ICRE.IMP_COMISION, 0) +'+coCRLF+
    '             NVL(CDC_ICRE.IMP_IVA,0)) AS IMP_TOTAL,'+coCRLF+
    '			CA_ICRE.f_vencimiento,'+coCRLF+
    '           CA_ICRE.F_PAGO,'+coCRLF+
    '           NVL(CA_ICRE.NUM_PERIODO,0) NUM_PERIODO,'+coCRLF+
    '	        NVL(CA_ICRE.IMP_CAP_PAG,0) IMP_CAP_PAG,'+coCRLF+
    '	        NVL(CI_ICRE.IMP_INT_PAG,0) IMP_INT_PAG, '+coCRLF+
    '	        NVL(CI_ICRE.IMP_IVA_INT_PAG,0) IMP_IVA_INT_PAG,'+coCRLF+
    '	        NVL(CDC_ICRE.IMP_COM_PAG,0) IMP_COM_PAG,'+coCRLF+
    '	        NVL(CDC_ICRE.IMP_IVA_COM_PAG,0) IMP_IVA_COM_PAG,'+coCRLF+
    '            SUM(NVL(CI_ICRE.IMP_INT_PAG,0) + NVL(CI_ICRE.IMP_IVA_INT_PAG,0)) AS IMP_INT_PAG_T,'+coCRLF+
    '            SUM(NVL(CDC_ICRE.IMP_COM_PAG,0)+NVL(CDC_ICRE.IMP_IVA_COM_PAG,0))   AS IMP_COM_PAG_T,'+coCRLF+
    '            SUM(NVL(CA_ICRE.IMP_CAP_PAG,0)+ '+coCRLF+
    '	         	 NVL(CI_ICRE.IMP_INT_PAG,0)+ '+coCRLF+
    '	        	 NVL(CI_ICRE.IMP_IVA_INT_PAG,0)+ '+coCRLF+
    '	        	 NVL(CDC_ICRE.IMP_COM_PAG, 0) +'+coCRLF+
    ' 	        	 NVL(CDC_ICRE.IMP_IVA_COM_PAG,0)) AS IMP_PAG_T,'+coCRLF+
    '        CA_ICRE.SIT_CAPITAL,'+coCRLF+
    '  	    CI_ICRE.SIT_INTERES,'+coCRLF+
    '  	    CDC_ICRE.SIT_COMISION'+coCRLF+
    '  FROM --CAPITAL EN ICRE'+coCRLF+
//    '	       ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL, CA.NUM_PERIODO, CA.F_PAGO, ca.f_vencimiento, NVL(CT.IMP_CONCEPTO,0) IMP_CAP_PAG, CA.SIT_CAPITAL'+coCRLF+
    '	       ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL, CA.NUM_PERIODO, CA.F_PAGO, ca.f_vencimiento,'+coCRLF+
    '          NVL(PKGCRCOMUN.STPOBTIMPPAG(''CP'',''IMPBRU'', CA.ID_CREDITO, CA.NUM_PERIODO, NULL, '+vlstrF_NOMINA+',''V'',''F'') ,0) IMP_CAP_PAG,'+coCRLF+
    '          CA.SIT_CAPITAL'+coCRLF+
    //--FIN HERJA
    '         FROM ( SELECT CC.ID_CREDITO'+coCRLF+
    '                FROM ('+coCRLF+
    '                       SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
    '                       FROM CR_CON_CAT_DATA'+coCRLF+
    '                       WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
    '                     ) CPROD_ICRE,'+coCRLF+
    '                     CR_CREDITO CC,'+coCRLF+
    '                     CR_CONTRATO CO'+coCRLF+
    '                WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
    '                  AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
    '                  AND CC.SIT_CREDITO = ''AC'''+coCRLF+
    '              ) CC,'+coCRLF+
    '              CR_CAPITAL CA'+coCRLF+
//HERJA SE COMENTA PORQUE YA SE UTILIZARA LA FUNCION DE OBTIMPPAGADO
{
    '              ,( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO, CT.ID_CREDITO, CT.ID_PERIODO'+coCRLF+
    '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'+coCRLF+
    '                 WHERE 1=1'+coCRLF+
    '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
    '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
    '                   AND CT.CVE_OPERACION IN (''PAGOCP'')'+coCRLF+
    '                   AND CDT.CVE_CONCEPTO IN (''IMPBRU'')'+coCRLF+
    '                   AND CT.F_VALOR = '+vlstrF_NOMINA+coCRLF+
    '        		AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '			AND ID_TRANS_CANCELA IS NULL '+coCRLF+
    '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'+coCRLF+
    '              ) CT'+coCRLF+
}
    '         WHERE CA.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
    '           AND CA.F_VENCIMIENTO = '+vlstrF_NOMINA+coCRLF+
    '           AND CA.SIT_CAPITAL NOT IN (''CA'')'+coCRLF+
//    '           AND CT.ID_CREDITO (+)= CA.ID_CREDITO'+coCRLF+
//    '	        AND CT.ID_PERIODO (+)= CA.NUM_PERIODO'+coCRLF+
    '       ) CA_ICRE,'+coCRLF+
    '		   --INTERES EN ICRE'+coCRLF+
    '       ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA_PROY, NVL(CT.IMP_CONCEPTO,0) AS IMP_INT_PAG, NVL(CT2.IMP_CONCEPTO,0) AS IMP_IVA_INT_PAG, CI.SIT_INTERES'+coCRLF+
    '         FROM ( SELECT CC.ID_CREDITO'+coCRLF+
    '                FROM ('+coCRLF+
    '                       SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
    '                       FROM CR_CON_CAT_DATA'+coCRLF+
    '                       WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
    '                     ) CPROD_ICRE,'+coCRLF+
    '                     CR_CREDITO CC,'+coCRLF+
    '                     CR_CONTRATO CO'+coCRLF+
    '                WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
    '                  AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
    '                  AND CC.SIT_CREDITO = ''AC'''+coCRLF+
    '              )  CC,'+coCRLF+
    '              CR_INTERES CI,'+coCRLF+
    '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO, CT.ID_CREDITO, CT.ID_PERIODO'+coCRLF+
    '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'+coCRLF+
    '                 WHERE 1=1'+coCRLF+
    '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
    '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
    '                   AND CT.CVE_OPERACION IN (''PAGOIN'')'+coCRLF+
    '                   AND CDT.CVE_CONCEPTO IN (''IMPBRU'')'+coCRLF+
    '                   AND CT.F_VALOR = '+vlstrF_NOMINA+coCRLF+
    '    		AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '			AND ID_TRANS_CANCELA IS NULL '+coCRLF+
    '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'+coCRLF+
    '              ) CT,'+coCRLF+
    '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO, CT.ID_CREDITO, CT.ID_PERIODO'+coCRLF+
    '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'+coCRLF+
    '                 WHERE 1=1'+coCRLF+
    '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
    '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
    '                   AND CT.CVE_OPERACION IN (''PAGOIN'')'+coCRLF+
    '                   AND CDT.CVE_CONCEPTO IN (''IMPIVA'')'+coCRLF+
    '                   AND CT.F_VALOR = '+vlstrF_NOMINA+coCRLF+
    '        		AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '			AND ID_TRANS_CANCELA IS NULL '+coCRLF+
    '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'+coCRLF+
    '              ) CT2'+coCRLF+
    '         WHERE CI.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
    '           AND CI.F_VENCIMIENTO = '+vlstrF_NOMINA+coCRLF+
    '           AND CI.SIT_INTERES NOT IN (''CA'')'+coCRLF+
    '           AND CT.ID_CREDITO (+)= CI.ID_CREDITO'+coCRLF+
    '		AND CT.ID_PERIODO (+)= CI.NUM_PERIODO'+coCRLF+
    '           AND CT2.ID_CREDITO (+)= CI.ID_CREDITO'+coCRLF+
    '		AND CT2.ID_PERIODO (+)= CI.NUM_PERIODO'+coCRLF+
    '       ) CI_ICRE,'+coCRLF+
    '		   --COMISION EN ICRE'+coCRLF+
    '       ( SELECT CDC.ID_CREDITO, CDC.SIT_COMISION, SUM(CDC.IMP_COMISION) AS IMP_COMISION, SUM(CDC.IMP_IVA) AS  IMP_IVA, SUM(CT.IMP_CONCEPTO) AS IMP_COM_PAG, SUM(CT2.IMP_CONCEPTO) AS IMP_IVA_COM_PAG'+coCRLF+
    '         FROM ( SELECT CC.ID_CREDITO'+coCRLF+
    '                FROM ('+coCRLF+
    '                       SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
    '                       FROM CR_CON_CAT_DATA'+coCRLF+
    '                       WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
    '                     ) CPROD_ICRE,'+coCRLF+
    '                     CR_CREDITO CC,'+coCRLF+
    '                     CR_CONTRATO CO'+coCRLF+
    '                WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
    '                  AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
    '                  AND CC.SIT_CREDITO = ''AC'''+coCRLF+
    '              )  CC,'+coCRLF+
    '              CR_COMISION CDC,'+coCRLF+
    '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO, CT.ID_CREDITO, CT.ID_PERIODO'+coCRLF+
    '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'+coCRLF+
    '                 WHERE 1=1'+coCRLF+
    '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
    '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
    '                   AND CT.CVE_OPERACION IN (''PAGOCN'')'+coCRLF+
    '                   AND CDT.CVE_CONCEPTO IN (''IMPBRU'')'+coCRLF+
    '                   AND CT.F_VALOR = '+vlstrF_NOMINA+coCRLF+
    '        		AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '			AND ID_TRANS_CANCELA IS NULL '+coCRLF+
    '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'+coCRLF+
    '              ) CT,'+coCRLF+
    '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO, CT.ID_CREDITO, CT.ID_PERIODO'+coCRLF+
    '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'+coCRLF+
    '                 WHERE 1=1'+coCRLF+
    '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
    '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
    '                   AND CT.CVE_OPERACION IN (''PAGOCN'')'+coCRLF+
    '                   AND CDT.CVE_CONCEPTO IN (''IMPIVA'')'+coCRLF+
    '                   AND CT.F_VALOR = '+vlstrF_NOMINA+coCRLF+
    '        		AND SIT_TRANSACCION= ''AC'''+coCRLF+
    '			AND ID_TRANS_CANCELA IS NULL '+coCRLF+
    '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'+coCRLF+
    '              ) CT2'+coCRLF+
    '         WHERE CDC.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
    '           AND CDC.F_VENCIMIENTO = '+vlstrF_NOMINA+coCRLF+
    '           AND CDC.SIT_COMISION NOT IN (''CA'')'+coCRLF+
    '           AND CT.ID_CREDITO (+)= CDC.ID_CREDITO'+coCRLF+
    '		AND CT.ID_PERIODO (+)= CDC.NUM_PERIODO'+coCRLF+
    '           AND CT2.ID_CREDITO (+)= CDC.ID_CREDITO'+coCRLF+
    '		AND CT2.ID_PERIODO (+)= CDC.NUM_PERIODO'+coCRLF+
    '         GROUP BY CDC.ID_CREDITO, CDC.SIT_COMISION'+coCRLF+
    '       ) CDC_ICRE,'+coCRLF+
    '        CR_CREDITO CC,'+coCRLF+
    '        CR_CONTRATO CO,'+coCRLF+
    '        CONTRATO CTO,'+coCRLF+
    '        ( SELECT E.ID_EMPRESA, ID_PERSONA, E.NUM_EMPLEADO, E.SIT_EMPLEADO'+coCRLF+
    '          FROM EMPLEADO E'+coCRLF+
    '           WHERE E.ID_EMPRESA IN ( '+ vlstrID_EMPRESA+' )'+coCRLF+
    '        ) E,'+coCRLF+
    '        ('+coCRLF+
    '          SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
    '          FROM CR_CON_CAT_DATA'+coCRLF+
    '          WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
    '        ) CPROD_ICRE'+coCRLF+
    '  WHERE 1=1'+coCRLF+
    '    AND CC.SIT_CREDITO = ''AC'''+coCRLF+
    '    AND CA_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF+
    '    AND CI_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF+
    '    AND CDC_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF+
    '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
    '    AND CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
    '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
    '    AND E.ID_PERSONA(+) = CTO.ID_TITULAR'+coCRLF+
    '  GROUP BY cc.id_credito,CC.SIT_CREDITO, E.ID_EMPRESA, E.NUM_EMPLEADO, E.ID_PERSONA, E.SIT_EMPLEADO,CA_ICRE.f_vencimiento, CO.CVE_PRODUCTO_CRE,'+coCRLF+
    '	        CA_ICRE.IMP_CAP_PAG, CI_ICRE.IMP_INT_PAG, CI_ICRE.IMP_IVA_INT_PAG, CDC_ICRE.IMP_COM_PAG, CDC_ICRE.IMP_IVA_COM_PAG,'+coCRLF+
    '        CA_ICRE.SIT_CAPITAL, CI_ICRE.SIT_INTERES, CDC_ICRE.SIT_COMISION,CA_ICRE.F_PAGO,CA_ICRE.NUM_PERIODO'+coCRLF+
    ')  RESULT,'+coCRLF+
    'PERSONA_FISICA PF'+coCRLF+
    'WHERE PF.ID_PERSONA = RESULT.ID_PERSONA'+coCRLF+
    '  AND RESULT.IMP_TOTAL > 0'+coCRLF;
     if peORIGEN='P' then
          vlStrSQL := vlStrSQL +'  ORDER BY NOMBRE ';

 Result := vlStrSQL;
end;

procedure TWCrCoABRep.TreeView1Click(Sender: TObject);
var vlcounte:word;
begin
    sgDatos.Clear(' ');
    // cambiar este codigo duro por el contenido de la tabla TMP_EMPRESAS
    vgID_EMPRESA:='';

    if trim(TreeView1.Selected.Text)<>'TODAS' then
    begin
       vlSql :=' SELECT ID_EMPRESA, EMPRESA ' +
               ' FROM TMP_EMPRESAS ' +
               ' WHERE TRIM(EMPRESA) = ''' + trim(TreeView1.Selected.Text)+'''';

       vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
       try
         if vlQry <> nil then
         begin
            vgID_EMPRESA := vlQry.FieldByName('ID_EMPRESA').AsString;
            lbEmpresa1.Caption := vlQry.FieldByName('EMPRESA').AsString;
            ShowDataNomina;
         end;
       Finally
          if vlQry <> nil then
              vlQry.free;
       end;
    end;

    if trim(TreeView1.Selected.Text)='TODAS' then
    begin
       vlcounte:=0;
       vlSql :=' SELECT ID_EMPRESA, EMPRESA ' +
               ' FROM TMP_EMPRESAS ' ;

       vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
       try
         if vlQry <> nil then
         begin
            while not vlQry.Eof do
            begin
               if vlcounte=0 then
                  vgID_EMPRESA := vlQry.FieldByName('ID_EMPRESA').AsString
               else
                  vgID_EMPRESA := vgID_EMPRESA + ',' + vlQry.FieldByName('ID_EMPRESA').AsString;

               vlcounte:=vlcounte+1;
               vlQry.Next;
            end;
            lbEmpresa1.Caption := 'TODAS LAS EMPRESAS';
            ShowDataNomina;
         end;
       Finally
          if vlQry <> nil then
              vlQry.free;
       end;
    end;
end;

procedure TWCrCoABRep.dtpF_CIERRECloseUp(Sender: TObject);
begin
//   ShowDataNomina;
    sgDatos.Clear(' ');
end;

function TWCrCoABRep.DevuelveFechaNomina(peFecha : TDateTime): TDateTime;
var vlSQL : String;
    vlQry : TQuery;
begin
  With Objeto Do
    Begin
    vlSQL :=' SELECT MIN(F_PAGO) AS F_NOMINA'+coCRLF+
            ' FROM CRE_FECHA_NOMINA'+coCRLF+
            ' WHERE F_PAGO >= '+SQLFecha(peFecha);

    vlQry := GetSqlQueryNoNil(vlSQL, Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
      Begin
      Result := vlQry.FieldByName('fecha').AsDateTime;
      vlQry.Close;
      vlQry.Free;
      End;
    End;
end;

function TWCrCoABRep.FechaAnterior(peFecha : TDateTime): TDateTime;
var vlSQL : String;
    vlQry : TQuery;
begin
  With Objeto Do
    Begin
    vlSQL :=' SELECT max(ca.f_vencimiento) as fecha'+coCRLF+
            '   FROM ( SELECT CC.ID_CREDITO '+coCRLF+
            '       FROM ( '+coCRLF+
            '              SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
            '                FROM CR_CON_CAT_DATA '+coCRLF+
            '               WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
            '              ) CPROD_ICRE,'+coCRLF+
            '              CR_CREDITO CC, '+coCRLF+
            '              CR_CONTRATO CO '+coCRLF+
            '         WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
            '          AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '          AND CC.SIT_CREDITO = ''AC'''+coCRLF+
            '      ) CC, '+coCRLF+
            '      CR_CAPITAL CA '+coCRLF+
            ' WHERE CA.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
            'AND CA.SIT_CAPITAL NOT IN (''CA'') '+coCRLF+
            'AND CA.F_VENCIMIENTO < ' +SQLFecha(peFecha);

    vlQry := GetSqlQueryNoNil(vlSQL, Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
      Begin
      Result := vlQry.FieldByName('fecha').AsDateTime;
      vlQry.Close;
      vlQry.Free;
      End;
    End;
end;

function TWCrCoABRep.FechaSiguiente(peFecha : TDateTime): TDateTime;
var vlSQL : String;
    vlQry : TQuery;
begin
  With Objeto Do
    Begin
    vlSQL :=' SELECT min(ca.f_vencimiento) as fecha'+coCRLF+
            '   FROM ( SELECT CC.ID_CREDITO '+coCRLF+
            '       FROM ( '+coCRLF+
            '              SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
            '                FROM CR_CON_CAT_DATA '+coCRLF+
            '               WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
            '              ) CPROD_ICRE,'+coCRLF+
            '              CR_CREDITO CC, '+coCRLF+
            '              CR_CONTRATO CO '+coCRLF+
            '         WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
            '          AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '          AND CC.SIT_CREDITO = ''AC'''+coCRLF+
            '      ) CC, '+coCRLF+
            '      CR_CAPITAL CA '+coCRLF+
            ' WHERE CA.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
            'AND CA.SIT_CAPITAL NOT IN (''CA'') '+coCRLF+
            'AND CA.F_VENCIMIENTO >= ' +SQLFecha(peFecha);

    vlQry := GetSqlQueryNoNil(vlSQL, Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
      Begin
      Result := vlQry.FieldByName('fecha').AsDateTime;
      vlQry.Close;
      vlQry.Free;
      End;
    End;
end;

procedure TWCrCoABRep.dtpF_CIERREChange(Sender: TObject);
begin
//   F_cobro_Sig.Text := DateToStr(FechaSiguiente(dtpF_CIERRE.Date + 1));
   F_cobro_Sig.Text := DateToStr(FechaSiguiente(dtpF_CIERRE.Date));
   F_cobro_Ant.Text := DateToStr(FechaAnterior(dtpF_CIERRE.Date));
end;

end.
