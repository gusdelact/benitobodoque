Unit IntCrTblAmo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, Grids, DBGrids,
IntWFind, IntGenCre, IntLinkit,

IntParamCre, DBCtrls   // Parametros
;

Type
 TCrTblAmo = class;

  TWCrTblAmo=Class(TForm)
    InterForma1             : TInterForma;
    DataSource1: TDataSource;
    lblF_CIERRE: TLabel;
    Label8: TLabel;
    edID_CREDITO: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edNOMBRE: TEdit;
    edDESC_L_PRODUCTO: TEdit;
    edID_ACREDITADO: TEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    Label11: TLabel;
    QryCR_TBL_AMOR_R04: TQuery;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    dtpF_CIERRE: TInterDateTimePicker;
    QryCR_TBL_AMOR_R04F_CIERRE: TDateTimeField;
    edF_CIERRE: TEdit;
    ilID_CREDITO: TInterLinkit;
    btIdCredito: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ATR: TLabel;
    MAXATR: TLabel;
    POR_PAGO: TLabel;
    POR_PR: TLabel;
    VECES: TLabel;
    QryCR_TBL_AMOR_R04IMP_EXIGIBLE: TFloatField;
    QryCR_TBL_AMOR_R04IMP_PAGADO: TFloatField;
    QryCR_TBL_AMOR_R04ID_CREDITO_ORIG: TFloatField;
    QryCR_TBL_AMOR_R04NUM_DIAS_ATR: TFloatField;
    QryCR_TBL_AMOR_R04NUM_PER_ATR: TFloatField;
    QryCR_TBL_AMOR_R04F_PROG_PAGO: TDateTimeField;
    QryCR_TBL_AMOR_R04F_VENCIMIENTO: TDateTimeField;
    QryCR_TBL_AMOR_R04F_PAGO: TDateTimeField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure dtpF_CIERRECloseUp(Sender: TObject);
    procedure edF_CIERREExit(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure btIdCreditoClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure   ColocaVariables;
    procedure   ColocaDatosCredito;
    procedure   ColocaDatos;
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTblAmo;

end;
 TCrTblAmo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre    : TParamCre;



        ID_CREDITO       : TInterCampo;
        F_CIERRE         : TInterCampo;

        ID_ACREDITADO    : TInterCampo;
        NOMBRE           : TInterCampo;
        CVE_PRODUCTO_CRE : TInterCampo;
        DESC_L_PRODUCTO  : TInterCampo;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

implementation
{$R *.DFM}


constructor TCrTblAmo.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      ID_CREDITO.Caption:='No. Disposición';

      F_CIERRE :=CreaCampo('F_CIERRE',ftDate,tsNinguno,tsNinguno,False);
      F_CIERRE.Caption:='Fecha de Cierre';

      ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
      ID_ACREDITADO.Caption:='Id. Acreditado';

      NOMBRE := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,False);
      NOMBRE.Caption:='Nombre Acreditado';

      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_CRE.Caption:='Clave del Producto';

      DESC_L_PRODUCTO  :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
      DESC_L_PRODUCTO.Caption:='Producto';

      FKeyFields.Add('F_CIERRE');
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('F_PROG_PAGO');
      TableName := 'CR_TBL_AMOR_R04';

      UseQuery := False;
      ShowMenuReporte:=False;
end;

Destructor TCrTblAmo.Destroy;
begin
  inherited;
end;

function TCrTblAmo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTblAmo;
begin
   W:=TWCrTblAmo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      W.InterForma1.ShowBtnEliminar := False;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CR_TBL_AMOR_R04********************)
(*                                                                              *)
(*  FORMA DE CR_TBL_AMOR_R04                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TBL_AMOR_R04********************)

procedure TWCrTblAmo.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_CREDITO.Control := edID_CREDITO;
    F_CIERRE.Control := edF_CIERRE;

    ID_ACREDITADO.Control    := edID_ACREDITADO;
    NOMBRE.Control           := edNOMBRE;
    CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    DESC_L_PRODUCTO.Control  := edDESC_L_PRODUCTO;

    F_CIERRE.AsDateTime := (Apli.DameFechaEmpresa - 1);
    End;
end;

procedure TWCrTblAmo.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_CREDITO.Control := Nil;
    F_CIERRE.Control := Nil;

    ID_ACREDITADO.Control    := Nil;
    NOMBRE.Control           := Nil;
    CVE_PRODUCTO_CRE.Control := Nil;
    DESC_L_PRODUCTO.Control  := Nil;

    End;
end;

procedure TWCrTblAmo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrTblAmo.ColocaVariables;
var vlQry : TQuery;
begin
  Objeto.F_CIERRE.GetFromControl;
  Objeto.ID_CREDITO.GetFromControl;
  If (Trim(Objeto.ID_CREDITO.AsString) = '') Then
    Exit;

  vlQry := GetSQLQueryNoNil(' SELECT *'+coCRLF+
                            ' FROM CR_CON_REG_EXP_C WHERE F_CIERRE = '+SQLFecha(Objeto.F_CIERRE.AsDateTime)+coCRLF+
                            '  AND ID_CREDITO = '+Objeto.ID_CREDITO.AsString,
                            Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  If Assigned(vlQry) Then
    Begin
    With vlQry Do
      Try
        ATR.Caption    := FieldByName('NUM_PERI_IM_REGU').AsString;
//        VECES.Caption    := FieldByName('VECES').AsFloat; Pendiente de ver de donde se saca esta variable 
        MAXATR.Caption := FieldByName('NUM_MAXATR').AsString;
        POR_PAGO.Caption := FieldByName('PORCENTAJE_PAGO').AsString;
        POR_PR.Caption    := FieldByName('PLAZO_REMANENTE').AsString;
      Finally
        Close;
      End;
    End
  Else
    Begin
        ATR.Caption    := '';
        VECES.Caption    := '';
        MAXATR.Caption := '';
        POR_PAGO.Caption := '';
        POR_PR.Caption    := '';


        MessageDlg('No se encontró saldo para la disposición '+Objeto.ID_CREDITO.AsString+' con Fecha Especifcica '+SQLFecha(Objeto.F_CIERRE.AsDateTime),
               mtWarning, [mbOk], 0);
    End;

  With QryCR_TBL_AMOR_R04 Do
    Begin
    QryCR_TBL_AMOR_R04.Close;

    DatabaseName := Objeto.Apli.DatabaseName;
    SessionName  := Objeto.Apli.SessionName;

    If Active Then Close;
    SQL.Clear;
    SQL.Add( ' SELECT F_CIERRE,  ID_CREDITO_ORIG, '+coCRLF+
             '        F_PROG_PAGO, F_VENCIMIENTO, F_PAGO,'+coCRLF+
             '        IMP_EXIGIBLE, IMP_PAGADO,'+coCRLF+
             '        NUM_DIAS_ATR, NUM_PER_ATR'+coCRLF+
             '  From CR_TBL_AMOR_R04'+coCRLF+
             '  Where ID_CREDITO   ='+Objeto.ID_CREDITO.AsString+coCRLF+
             '      And F_CIERRE   = '+ SQLFecha(Objeto.F_CIERRE.AsDateTime) + coCRLF+
             ' ORDER BY F_PROG_PAGO '+coCRLF
           );
    Open;
    End;
end;

procedure TWCrTblAmo.ColocaDatosCredito;
var vlQry : TQuery;
begin
  Objeto.ID_CREDITO.GetFromControl;
  vlQry := GetSQLQueryNoNil('  SELECT CC.ID_CREDITO, CTO.ID_TITULAR AS ID_ACREDITADO, P.NOMBRE, CO.CVE_PRODUCTO_CRE, CP.DESC_L_PRODUCTO'+coCRLF+
                            '  FROM CR_CREDITO CC, CR_CONTRATO CO, CONTRATO CTO, PERSONA P, CR_PRODUCTO CP'+coCRLF+
                            '  WHERE CC.ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
                            '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                            '    AND CTO.ID_CONTRATO = CO.ID_CONTRATO AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                            '    AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
                            ' UNION'+coCRLF+
                            '  SELECT CC.ID_CREDITO, CTO.ID_TITULAR AS ID_ACREDITADO, P.NOMBRE, TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO, CSTB.DESC_SUB_TIPO'+coCRLF+
                            '  FROM CRE_CREDITO CC, CRE_CONTRATO CO, CONTRATO CTO, PERSONA P, CRE_SUB_TIP_BCO CSTB'+coCRLF+
                            '  WHERE CC.ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
                            '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                            '    AND CTO.ID_CONTRATO = CO.ID_CONTRATO AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                            '    AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF,
                            Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);

  If Assigned(vlQry) Then
    Begin
      With vlQry Do
        Try
          Objeto.ID_ACREDITADO.AsString    := FieldByName('ID_ACREDITADO').AsString;
          Objeto.NOMBRE.AsString           := FieldByName('NOMBRE').AsString;
          Objeto.CVE_PRODUCTO_CRE.AsString := FieldByName('CVE_PRODUCTO_CRE').AsString;
          Objeto.DESC_L_PRODUCTO.AsString  := FieldByName('DESC_L_PRODUCTO').AsString;
        Finally
          Close;
        End;
    End
  Else
    Begin
    Objeto.ID_CREDITO.AsString       := '';
    Objeto.ID_ACREDITADO.AsString    := '';
    Objeto.NOMBRE.AsString           := '';
    Objeto.CVE_PRODUCTO_CRE.AsString := '';
    Objeto.DESC_L_PRODUCTO.AsString  := '';
    End;
end;


procedure TWCrTblAmo.ColocaDatos;
begin
   Objeto.ID_CREDITO.GetFromControl;
   If (Objeto.ID_CREDITO.AsString = '') Then
     Begin
     MessageDlg('Favor de indicar el No. de Disposición', mtWarning, [mbOk], 0);
     Exit;
     End;
   ColocaDatosCredito;
   ColocaVariables;
end;

procedure TWCrTblAmo.dtpF_CIERRECloseUp(Sender: TObject);
begin
  edF_CIERRE.Text := DateToStr(dtpF_CIERRE.Date);
  Objeto.ID_CREDITO.GetFromControl;
  If (Objeto.ID_CREDITO.AsString <> '') Then
     ColocaDatos;
end;

procedure TWCrTblAmo.edF_CIERREExit(Sender: TObject);
begin
  dtpF_CIERRE.Date := StrToDate(edF_CIERRE.Text);
  Objeto.ID_CREDITO.GetFromControl;
  If (Objeto.ID_CREDITO.AsString <> '') Then
     ColocaDatos;
end;

procedure TWCrTblAmo.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrTblAmo.btIdCreditoClick(Sender: TObject);
Var vlInterFindit : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRTBLAMO_DISPO',True,True) then
   begin
      VlInterFindit := Objeto.CreaBuscador('ICRCCAS.IT','');
      Try
        If vlInterFindit.Execute Then
          Begin
          Objeto.ID_CREDITO.AsInteger := StrToInt(vlInterFindit.DameCampo(0));
          ColocaDatos;
          End;
      Finally
          vlInterFindit.Free;
      End;
   end;
end;

procedure TWCrTblAmo.ilID_CREDITOEjecuta(Sender: TObject);
begin
 ColocaDatos;
end;

end.
