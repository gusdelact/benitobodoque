// Sistema         : Clase de TMProrrat
// Fecha de Inicio : 12/06/2007
// Función forma   : Clase de TMProrrat
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProrrateo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre,
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntMProdGpo,      //Grupo de Producto
IntCrCto,
IntCrCredito,     //Disposición
IntLinkit,
IntSGCtrl, InterEdit
;

Type
 TMProrrat= class; 

  TWMProrrat=Class(TForm)
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
    ilPRODUCTO: TInterLinkit;
    sgcDATA: TSGCtrl;
    Panel1: TPanel;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    chbxProducto: TCheckBox;
    lbF_VENCIMIENTO: TLabel;
    edF_VENCIMIENTO: TEdit;
    dtpF_Vencimiento: TInterDateTimePicker;
    lbAplica: TLabel;
    BitBtn2: TBitBtn;
    cbSelTodos: TCheckBox;
    btnBuscar: TBitBtn;
    memErrores: TMemo;
    rgFiltroFecha: TRadioGroup;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    ilACREDITADO: TInterLinkit;
    Label9: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    ilCesion: TInterLinkit;
    lbID_CONTRATO: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDescCont: TEdit;
    ilIDCONTRATO: TInterLinkit;
    cbxContrato: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure cbSelTodosClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure cbxContratoClick(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure btPRODUCTOExit(Sender: TObject);
    procedure btACREDITADOExit(Sender: TObject);
    procedure btCONTRATOExit(Sender: TObject);
    procedure btID_CESIONExit(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }
      Objeto : TMProrrat;

      Function  CadenaSql : String;
      Procedure MuestraDatos;
end;
 TMProrrat= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        CVE_PRODUCTO_CRE         : TInterCampo;
        DESC_PRODUCTO            : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        DESC_ACREDITADO          : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        CVE_PRODUCTO_GPO         : TInterCampo;
        NOM_CVE_PRODUCTO_GPO     : TInterCampo;

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Acreditado               : TCrAcredit;
        GpoProd                  : TMProdGpo;
        ContratoCre              : TCrCto;
        Credito                  : TCrCredito;

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


constructor TMProrrat.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Producto';
      DESC_PRODUCTO :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_PRODUCTO.Caption:='Descripción Producto';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftString,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO.Caption:='F. Vencimiento';
      ID_ACREDITADO  :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='Acreditado';
      DESC_ACREDITADO :=CreaCampo('DESC_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
                DESC_PRODUCTO.Caption:='Descripción Acreditado';
      CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_GPO.Caption:='Grupo Producto';
      NOM_CVE_PRODUCTO_GPO :=CreaCampo('NOM_CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
                NOM_CVE_PRODUCTO_GPO.Caption:='Descripción Grupo Producto';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField      :='ID_ACREDITADO';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';


      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMProrrateo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMProrrat.Destroy;
begin
   If Producto <> Nil Then
      Producto.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   If ContratoCre <> Nil Then
      ContratoCre.Free;
   If Credito <> Nil Then
      Credito.Free;
inherited;
end;


function TMProrrat.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMProrrat;
begin
   W:=TWMProrrat.Create(Self);
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


Function TMProrrat.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ITMProrrat.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMProrrat.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA TMProrrat********************)
(*                                                                              *)
(*  FORMA DE TMProrrat                                                            *)
(*                                                                              *)
(***********************************************FORMA TMProrrat********************)

procedure TWMProrrat.FormShow(Sender: TObject);
var Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
   Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
   Objeto.DESC_PRODUCTO.Control:=edDESC_PRODUCTO;
   Objeto.F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
   Objeto.ID_ACREDITADO.Control:=edACREDITADO;
   Objeto.DESC_ACREDITADO.Control:=edNOMBRE_ACRED;

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);

   Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
   Objeto.Producto.GetParams(Objeto);
   edDESC_PRODUCTO.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
   edDESC_PRODUCTO.ShowHint := True;

   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.GetParams(Objeto);
   edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACRED.ShowHint := True;

   Objeto.ContratoCre.ID_CONTRATO.Control:= iedID_CONTRATO;
   Objeto.ContratoCre.FOL_CONTRATO.Control:= edCVE_PRODUCTO;
   Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDescCont;
   Objeto.ContratoCre.GetParams(Objeto);

   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);
   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;

   DecodeDate(Objeto.Apli.DameFechaEmpresa,Year, Month, Day);
   dtpF_Vencimiento.MinDate := StrToDate(FormatFloat('00',Day)+'/'+FormatFloat('00',Month)+'/'+FormatFloat('0000',Year));
   dtpF_Vencimiento.DateTime := StrToDate(FormatFloat('00',Day)+'/'+FormatFloat('00',Month)+'/'+FormatFloat('0000',Year));
   edF_VENCIMIENTO.Text:= FormatFloat('00',Day)+'/'+FormatFloat('00',Month)+'/'+FormatFloat('0000',Year);
   rgFiltroFecha.ItemIndex:= 0;

   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

procedure TWMProrrat.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_PRODUCTO_CRE.Control:=nil;
   Objeto.DESC_PRODUCTO.Control:=nil;
   Objeto.F_VENCIMIENTO.Control:=nil;
   Objeto.ID_ACREDITADO.Control:=nil;
   Objeto.DESC_ACREDITADO.Control:=nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
   Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
   Objeto.Credito.ID_CREDITO.Control := nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.ContratoCre.ID_CONTRATO.Control:= nil;
   Objeto.ContratoCre.FOL_CONTRATO.Control:= nil;
   Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= nil;
end;

procedure TWMProrrat.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMProrrat.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMProrrat.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWTMProrrat.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWMProrrat.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_PROD',True,True) then
   begin
     If Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PF' Then Begin
        Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_FISICA = '
                                         + #39 + 'V' + #39
                                         + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                         + #39 + 'AC' + #39 ;
        Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
     End Else If Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PM' Then Begin
        Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_MORAL = '
                                         + #39 + 'V' + #39
                                         + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                         + #39 + 'AC' + #39 ;
        Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
     End;

     If Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
     end;
   end;
end;

procedure TWMProrrat.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWMProrrat.chbxProductoClick(Sender: TObject);
begin
   If not chbxProducto.Checked Then Begin
      Objeto.Producto.Active:=False;
      chbxProducto.Checked:=False;
      chbxProducto.Enabled:=False;
   End Else Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
   End;
end;

procedure TWMProrrat.edF_VENCIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_VENCIMIENTO,True,'',True);
end;

Function TWMProrrat.CadenaSql : String;
Var   sSQL , sOperador: String;
Begin
   sOperador:='=';
   If rgFiltroFecha.ItemIndex= 1 Then
      sOperador:='>=';

   sSQL :='SELECT CAPITAL.ID_CREDITO, CAPITAL.NUM_PER, CCTO.ID_CONTRATO, '+
          '       CTO.ID_TITULAR AS ID_ACREDITADO, PER.NOMBRE,  '+
          '       CAPITAL.F_VENCIMIENTO, '+
          '       (SELECT IMP_CAPITAL FROM CR_CAPITAL WHERE ID_CREDITO = CAPITAL.ID_CREDITO AND NUM_PERIODO = CAPITAL.NUM_PER) AS IMP_CAPITAL,'+
          '       (SELECT SDO_INSOLUTO FROM CR_CAPITAL WHERE ID_CREDITO = CAPITAL.ID_CREDITO AND NUM_PERIODO = CAPITAL.NUM_PER) AS SDO_INSOLUTO,'+
          //'       (SELECT SIT_CAPITAL FROM CR_CAPITAL WHERE ID_CREDITO = CAPITAL.ID_CREDITO AND NUM_PERIODO = CAPITAL.NUM_PER) AS SIT_CAPITAL,'+
          '       '' '' AS PRORRATEO '+
          '  FROM CR_CREDITO CC,'+
          '       (SELECT CAP.ID_CREDITO, MIN(CAP.NUM_PERIODO) as NUM_PER, MIN(F_VENCIMIENTO) as F_VENCIMIENTO'+
          '          FROM CR_CAPITAL CAP,'+
                          //--Crédito con mas de un periodo faltante
          '               (SELECT PERRES.ID_CREDITO'+
          '                  FROM (SELECT ID_CREDITO, COUNT( *) SUM'+
          '                          FROM CR_CAPITAL'+
          '                         WHERE F_VENCIMIENTO >= TO_DATE('''+ edF_VENCIMIENTO.Text +''',''DD/MM/YYYY'')'+
          '                           AND SIT_CAPITAL IN(''PA'',''AC'')'+
          '                         GROUP BY ID_CREDITO'+
          '                       )PERRES'+
          '                 WHERE PERRES.SUM > 1'+
          '               )CR_ULT_PER'+
          '         WHERE CAP.F_VENCIMIENTO '+ sOperador +' TO_DATE('''+ edF_VENCIMIENTO.Text +''',''DD/MM/YYYY'')'+   //-- >=
          '           AND CAP.SIT_CAPITAL IN(''PA'',''AC'')'+
          '           AND CR_ULT_PER.ID_CREDITO = CAP.ID_CREDITO'+
          '         GROUP BY CAP.ID_CREDITO'+
          '         ORDER BY CAP.ID_CREDITO'+
          '       )CAPITAL,'+
          //       --Periodo no válido
          '       (SELECT CC.ID_CREDITO'+
          '          FROM CR_CREDITO CC'+
          '         WHERE CC.F_VENCIMIENTO > TO_DATE('''+ edF_VENCIMIENTO.Text +''',''DD/MM/YYYY'')'+
          '         MINUS'+
          '        SELECT DISTINCT CC.ID_CREDITO'+
          '          FROM CR_CREDITO CC, CR_CAPITAL CAP'+
          '         WHERE CC.F_VENCIMIENTO > TO_DATE('''+ edF_VENCIMIENTO.Text +''',''DD/MM/YYYY'')'+
          '           AND CAP.F_VENCIMIENTO < TO_DATE('''+ edF_VENCIMIENTO.Text +''',''DD/MM/YYYY'')'+
          '           AND CAP.SIT_CAPITAL IN(''PA'',''AC'')'+
          '           AND CAP.ID_CREDITO = CC.ID_CREDITO'+
          '       )PERNO, CR_CONTRATO CCTO, CR_PRODUCTO CPR, CONTRATO CTO, PERSONA PER '+
          ' WHERE CAPITAL.ID_CREDITO = CC.ID_CREDITO'+
          '   AND CC.F_VENCIMIENTO > TO_DATE('''+ edF_VENCIMIENTO.Text +''',''DD/MM/YYYY'')'+
          '   AND PERNO.ID_CREDITO = CC.ID_CREDITO'+
          '   AND CCTO.ID_CONTRATO = CC.ID_CONTRATO '+
          '   AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'+
          '   AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO'+
          '   AND PER.ID_PERSONA  = CTO.ID_TITULAR';

   If Trim(edCVE_PRODUCTO_GPO.Text)<> '' Then
      sSQL:= sSQL + '    AND  CPR.CVE_PRODUCTO_GPO = '''+ Trim(edCVE_PRODUCTO_GPO.Text) +'''';

   If Trim(edCVE_PRODUCTO_CRE.Text)<> '' Then
      sSQL := sSQL + '   AND CCTO.CVE_PRODUCTO_CRE = '''+ Trim(edCVE_PRODUCTO_CRE.Text) +'''';

   If Trim(edACREDITADO.Text)<>'' Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR ='+ Trim(edACREDITADO.Text);

   If Trim(iedID_CONTRATO.Text)<>'' Then
      sSQL:= sSQL + ' AND CC.ID_CONTRATO ='+ Trim(iedID_CONTRATO.Text);

   If Trim(edID_CESION.Text)<>'' Then
      sSQL:= sSQL + ' AND CC.ID_CREDITO  ='+ Trim(edID_CESION.Text);

   CadenaSql := sSQL;
End;

Procedure TWMProrrat.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
   i:Integer;
   index:Integer;
Begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('ID_CREDITO').DisplayLabel  := 'Crédito' + #30 +'>C';
            vlQry.FieldByName('NUM_PER').DisplayLabel  := 'N.Per' + #30 +'>C';
            vlQry.FieldByName('ID_CONTRATO').DisplayLabel  := 'Contrato' + #30 +'>C';
            vlQry.FieldByName('ID_ACREDITADO').DisplayLabel  := 'Id.Acred' + #30 +'>C';
            vlQry.FieldByName('NOMBRE').DisplayLabel  := 'Acreditado' + #30 +'>C';
            vlQry.FieldByName('F_VENCIMIENTO').DisplayLabel  := 'F.Vencimiento' + #30 +'>C';
            vlQry.FieldByName('IMP_CAPITAL').DisplayLabel  := 'Imp.Capital' + #30 +'>C';
            vlQry.FieldByName('SDO_INSOLUTO').DisplayLabel  := 'Sdo.Insoluto' + #30 +'>C';
            //vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayLabel  := 'Cve.Producto' + #30 +'>C';
            vlQry.FieldByName('PRORRATEO').DisplayLabel  := 'Prorrateo' + #30 +'>C';

            vlQry.FieldByName('ID_CREDITO').DisplayWidth  := 8;
            vlQry.FieldByName('NUM_PER').DisplayWidth  := 5;
            vlQry.FieldByName('ID_CONTRATO').DisplayWidth  := 10;
            vlQry.FieldByName('ID_ACREDITADO').DisplayWidth  := 10;
            vlQry.FieldByName('NOMBRE').DisplayWidth  := 20;
            vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth  := 12;
            vlQry.FieldByName('IMP_CAPITAL').DisplayWidth  := 20;
            vlQry.FieldByName('SDO_INSOLUTO').DisplayWidth  := 20;
            //vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayWidth  := 12;
            vlQry.FieldByName('PRORRATEO').DisplayWidth  := 8;

            sgcDATA.SG.Canvas.Font.Size := 5;
            TNumericField(vlQry.FieldByName('IMP_CAPITAL')).DisplayFormat := '###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('SDO_INSOLUTO')).DisplayFormat := '###,###,###,##0.00';
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,True);
            sgcDATA.ColumnByName('PRORRATEO').IsCheck := True;
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
 
      For index:= 1 To sgcDATA.SG.RowCount-1 Do Begin
         If cbSelTodos.Checked Then
            sgcDATA.CellStr['PRORRATEO',index] := 'SI' + #30 + '>C'
         Else
            sgcDATA.CellStr['PRORRATEO',index]:= '';
      End;
   End;
End;

procedure TWMProrrat.btnBuscarClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_BUSCA',True,True) then
   begin
     If Trim(edF_VENCIMIENTO.Text)<> '' Then
        MuestraDatos
     Else ShowMessage('Debe indicar una Fecha de Vencimiento');
   end;
end;

procedure TWMProrrat.sgcDATADblClick(Sender: TObject);
Var
   Y : integer;
   Procedure MarcaCesion(iRen: Integer);
   Begin
      If sgcDATA.CellStr['PRORRATEO',iRen] <> 'SI' + #30 + '>C' Then
        sgcDATA.CellStr['PRORRATEO',iRen]:= 'SI' + #30 + '>C'
      Else
        sgcDATA.CellStr['PRORRATEO',iRen]:= '';
   End;
Begin
   Y := sgcDATA.SG.Row;
   If sgcDATA.SG.Selection.Left = 11 Then Begin
      MarcaCesion(Y);
   End;
end;

procedure TWMProrrat.cbSelTodosClick(Sender: TObject);
var index:Integer;
begin
   For index:= 1 To sgcDATA.SG.RowCount-1 Do Begin
      If cbSelTodos.Checked Then
         sgcDATA.CellStr['PRORRATEO',index] := 'SI' + #30 + '>C'
      Else
        sgcDATA.CellStr['PRORRATEO',index]:= '';
   End;
end;

procedure TWMProrrat.BitBtn2Click(Sender: TObject);
var index:Integer; qSP: TStoredProc; vgErrores: String;
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_APLIC',True,True) then
   begin
     vgErrores:='';
     memErrores.Clear;
     memErrores.Lines.Add('Iniciando Proceso de Prorrateo '+ FormatDateTime('dd/mm/yyyy hh:mm:ss am/pm',Objeto.Apli.SysDateTime));

     For index:= 1 To sgcDATA.SG.RowCount-1 Do Begin
        If sgcDATA.CellStr['PRORRATEO',index] = 'SI' + #30 + '>C' Then Begin
           qSP                := TStoredProc.Create(nil);
           qSP.DatabaseName   := Objeto.Apli.DataBaseName;
           qSP.SessionName    := Objeto.Apli.SessionName;
           Try
              //Define parametros
              qSP.UnPrepare;
              qSP.StoredProcName := 'PKGCRCUOTAS.STPPRORRATEO';
              qSP.Params.Clear;
              qSP.Params.CreateParam(ftInteger, 'PEIDCREDITO',    ptInput);
              qSP.Params.CreateParam(ftDateTime,'PEFECHA',        ptInput);
              qSP.Params.CreateParam(ftInteger, 'PSCODRESP',      ptOutput);
              qSP.Params.CreateParam(ftString,  'PSTXTRESP',      ptOutput);

              qSP.ParamByName('PEIDCREDITO').AsInteger := StrToInt(sgcDATA.CellStr['ID_CREDITO',index]);
              qSP.ParamByName('PEFECHA').AsDateTime    := StrToDate(sgcDATA.CellStr['F_VENCIMIENTO',index]);
              qSP.Prepare;
              qSP.ExecProc;
              If qSP.ParamByName('PSCODRESP').AsInteger <> 0 Then Begin
                 vgErrores:= vgErrores + 'Crédito:'+ sgcDATA.CellStr['ID_CREDITO',index]+ ':'+sgcDATA.CellStr['PSTXTRESP',Index] + #13#10;
              End;
           Finally
              If qSP <> nil Then qSP.Free; qSP:= nil;
           End;
        End;
     End;
     memErrores.Lines.Add('Termina Proceso de Prorrateo '+ FormatDateTime('dd/mm/yyyy hh:mm:ss am/pm',Objeto.Apli.SysDateTime));
     If Trim(vgErrores)<> '' Then Begin
        memErrores.Lines.Add(vgErrores);
     End;
     MuestraDatos;
   end;
end;

procedure TWMProrrat.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TWMProrrat.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxAcreditado.Checked:=True;
      chbxAcreditado.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMProrrat.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_ACRED',True,True) then
   begin
     If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
     End;
   end;
end;

procedure TWMProrrat.chbxAcreditadoClick(Sender: TObject);
begin
   If not chbxAcreditado.Checked Then Begin
      Objeto.Acreditado.Active:=False;
      chbxAcreditado.Checked:=False;
      chbxAcreditado.Enabled:=False;
   End Else Begin
      chbxAcreditado.Checked:=True;
      chbxAcreditado.Enabled:=True;
   End;
end;

procedure TWMProrrat.edACREDITADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TWMProrrat.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_GPOPR',True,True) then
   begin
       If Objeto.GpoProd.Busca Then Begin
          cbxCVE_PRODUCTO_GPO.Checked:= True;
          cbxCVE_PRODUCTO_GPO.Enabled:= True;
          InterForma1.NextTab(edCVE_PRODUCTO_GPO);
       End;
   end;
end;

procedure TWMProrrat.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TWMProrrat.btCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TWMProrrat.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TWMProrrat.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:= True;
      cbxCVE_PRODUCTO_GPO.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMProrrat.btCONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_AUTOR',True,True) then
   begin
     If Objeto.ContratoCre.Busca Then Begin
        cbxContrato.Checked:= True;
        cbxContrato.Enabled:= True;
        InterForma1.NextTab(btCONTRATO);
     end;
   end;
end;

procedure TWMProrrat.cbxContratoClick(Sender: TObject);
begin
   If not cbxContrato.Checked Then Begin
      Objeto.ContratoCre.Active:=False;
      cbxContrato.Checked:=False;
      cbxContrato.Enabled:=False;
   End Else Begin
      cbxContrato.Checked:=True;
      cbxContrato.Enabled:=True;
   End;
end;

procedure TWMProrrat.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
      cbxContrato.Checked:= True;
      cbxContrato.Enabled:= True;
      InterForma1.NextTab(iedID_CONTRATO);
   end;
end;

procedure TWMProrrat.btID_CESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRORRAT_DISP',True,True) then
   begin
     If Objeto.Credito.Busca Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
     End;
   end;
end;

procedure TWMProrrat.ilCesionEjecuta(Sender: TObject);
begin
   If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
      chbxCESION.Checked:=True;
      chbxCESION.Enabled:=True;
      InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMProrrat.chbxCESIONClick(Sender: TObject);
begin
   If not chbxCESION.Checked Then Begin
      Objeto.Credito.Active:=False;
      chbxCESION.Checked:=False;
      chbxCESION.Enabled:=False;
   End Else Begin
      chbxCESION.Checked:=True;
      chbxCESION.Enabled:=True;
   End;
end;

procedure TWMProrrat.iedID_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TWMProrrat.edID_CESIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TWMProrrat.btPRODUCTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TWMProrrat.btACREDITADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TWMProrrat.btCONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TWMProrrat.btID_CESIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

end.
