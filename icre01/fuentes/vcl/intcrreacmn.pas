// Sistema         : Clase de CR_REL_ACRE_MON
// Fecha de Inicio : 11/09/2003
// Función forma   : Clase de CR_REL_ACRE_MON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrReAcMn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, IntSGCtrl,

//Unidades Adicionales
        IntCrAcredit, //Acreditado
        IntParamCre,  //Parametros
        IntMon,       //Moneda
        IntGenCre    //Genérica
;

Type
 TCrReAcMn= class; 

  TWCrRelAcreMn=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_ACREDITADO : TLabel; 
    edID_ACREDITADO : TEdit;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    cbB_REL_ACRE_MON: TCheckBox;
    sgcMONEDA: TSGCtrl;
    pnlAcreditado: TPanel;
    pnlDescripcion: TPanel;
    pnlMoneda: TPanel;
    btEliminaAcreditado: TBitBtn;
    btAgregaMoneda: TBitBtn;
    ilIDACREDITADO: TInterLinkit;
    ilCVEMONEDA: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure btAgregaMonedaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbB_REL_ACRE_MONClick(Sender: TObject);
    procedure btEliminaAcreditadoClick(Sender: TObject);
    procedure ilIDACREDITADOEjecuta(Sender: TObject);
    procedure ilCVEMONEDAEjecuta(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrReAcMn;
        Function  CadenaSql : String;
        Procedure MuestraDatos;

end;
 TCrReAcMn= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        B_APLI_REL_MON           : TInterCampo;

        Acreditado               : TCrAcredit;
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    AgregaMoneda : Boolean;
        Function    VerificaMonedaCto : Integer;
        Function    VerificaCtoAC(pMoneda : String) : Integer;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrReAcMn.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Acreditado';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Moneda';
      B_APLI_REL_MON :=CreaCampo('B_APLI_REL_MON',ftString,tsNinguno,tsNinguno,False);
      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('CVE_MONEDA');

      TableName := 'CR_REL_ACRE_MON';
      UseQuery := True;
      HelpFile := 'IntCrReAcMn.Hlp';
      ShowMenuReporte:=True;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';
end;

Destructor TCrReAcMn.Destroy;
begin
    if Moneda <> nil then
       Moneda.Free;
    //end if

    inherited;
end;


function TCrReAcMn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelAcreMn;
begin
   W:=TWCrRelAcreMn.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrReAcMn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRAMn.it','F,F');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString);
                               T.Param(1,CVE_MONEDA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

Function TCrReAcMn.AgregaMoneda : Boolean;
var vlsql       : String;
    vlResultado : Boolean;
Begin
   vlResultado := False;
   vlsql := ' INSERT INTO CR_REL_ACRE_MON(ID_ACREDITADO,CVE_MONEDA ) ' +
            ' VALUES(' + ID_ACREDITADO.AsString + ',' +CVE_MONEDA.AsString + ')';
   vlResultado := RunSQL(vlsql,Apli.DataBaseName,Apli.SessionName,False);
   AgregaMoneda := vlResultado;
End;

Function TCrReAcMn.VerificaMonedaCto : Integer;
var vlSql       : String;
    vlCount     : Integer;
begin
   ID_ACREDITADO.GetFromControl;
   vlSql := ' SELECT COUNT(*) FROM CONTRATO C, CR_CONTRATO CC' +
            ' WHERE ID_TITULAR = ' + ID_ACREDITADO.AsString +
            ' AND CC.ID_CONTRATO = C.ID_CONTRATO ' +//EASA ABRIL 24042004
            ' AND C.CVE_MONEDA NOT IN( SELECT CVE_MONEDA FROM CR_REL_ACRE_MON ' +
                                '      WHERE ID_ACREDITADO = ' + ID_ACREDITADO.AsString + ' )' ;
   GetSQLInt(vlSql,Apli.DataBaseName,Apli.SessionName,'COUNT(*)',vlCount,False);
   VerificaMonedaCto := vlCount;
end;

function TCrReAcMn.VerificaCtoAC(pMoneda : String): Integer;
var vlSql       : String;
    vlCount     : Integer;
begin
   ID_ACREDITADO.GetFromControl;
   vlSql := ' SELECT COUNT(*) FROM CONTRATO ' +
            ' WHERE ID_TITULAR = ' + ID_ACREDITADO.AsString +
            ' AND SIT_CONTRATO = ' + #39 + CSIT_AC + #39 +
            ' AND CVE_MONEDA   = ' + pMoneda +
            ' AND ID_CONTRATO IN( SELECT ID_CONTRATO FROM CR_CONTRATO )';//EASA ABRIL 24042004
   GetSQLInt(vlSql,Apli.DataBaseName,Apli.SessionName,'COUNT(*)',vlCount,False);
   VerificaCtoAC := vlCount;
end;

(***********************************************FORMA CR_REL_ACRE_MON********************)
(*                                                                              *)
(*  FORMA DE CR_REL_ACRE_MON                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_ACRE_MON********************)
Function TWCrRelAcreMn.CadenaSql : String;
var vlsql : String;
Begin
   Objeto.ID_ACREDITADO.GetFromControl;
   vlsql := ' SELECT R.ID_ACREDITADO, ' +
            '        P.NOMBRE AS ACREDITADO, ' +
            '        R.CVE_MONEDA, ' +
            '        M.DESC_MONEDA ' +
            ' FROM  CR_REL_ACRE_MON R, ' +
            '       MONEDA M, ' +
            '       PERSONA P ' +
            ' WHERE M.CVE_MONEDA = R.CVE_MONEDA ' +
            '   AND P.ID_PERSONA = R.ID_ACREDITADO ' +
            '   AND R.ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString +
            ' ORDER BY R.CVE_MONEDA ';
   CadenaSql := vlSql;
end;

Procedure TWCrRelAcreMn.MuestraDatos;
var vlQry : TQuery;
begin
  vlQry := GetSQLQuery(CadenaSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin

            vlQry.FieldByName('ID_ACREDITADO').DisplayLabel := 'ACREDITADO' + #30 +'>C';
            vlQry.FieldByName('ACREDITADO').DisplayLabel := 'NOMBRE' + #30 +'>C';
            vlQry.FieldByName('CVE_MONEDA').DisplayLabel := 'MONEDA' + #30 +'>C';
            vlQry.FieldByName('DESC_MONEDA').DisplayLabel := 'DESCRIPCION' + #30 +'>C';

            vlQry.FieldByName('ID_ACREDITADO').DisplayWidth :=  10;
            vlQry.FieldByName('ACREDITADO').DisplayWidth :=  30;
            vlQry.FieldByName('CVE_MONEDA').DisplayWidth :=  11;
            vlQry.FieldByName('DESC_MONEDA').DisplayWidth := 40;

            sgcMONEDA.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
           sgcMONEDA.Clear('NO EXISTEN DATOS'#30'>C');
        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCrRelAcreMn.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.B_APLI_REL_MON.Control := cbB_REL_ACRE_MON;

      Objeto.Acreditado.Persona.Nombre.Control :=edNOMBRE_ACRED;
      Objeto.Acreditado.B_APLI_REL_MON.Control :=cbB_REL_ACRE_MON;
      Objeto.B_APLI_REL_MON.AsString := Objeto.Acreditado.B_APLI_REL_MON.AsString;
      Objeto.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.AsString;
      Objeto.GetParams(Objeto);

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.GetParams(Objeto);

end;

procedure TWCrRelAcreMn.FormDestroy(Sender: TObject);
begin
      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.B_APLI_REL_MON.Control := nil;

      Objeto.Acreditado.Persona.Nombre.Control :=nil;
      Objeto.Acreditado.B_APLI_REL_MON.Control :=nil;
      Objeto.Moneda.Cve_Moneda.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
   //Objeto
end;

procedure TWCrRelAcreMn.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelAcreMn.InterForma1DespuesNuevo(Sender: TObject);
begin
      Objeto.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.AsString;
      Objeto.B_APLI_REL_MON.AsString := Objeto.Acreditado.B_APLI_REL_MON.AsString;
      edID_ACREDITADO.SetFocus;
end;

procedure TWCrRelAcreMn.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   if Objeto.Acreditado.Busca then
   Begin
      MuestraDatos;
      Objeto.Moneda.Active := False;
      InterForma1.NextTab(edID_ACREDITADO);
   end;
end;

procedure TWCrRelAcreMn.btMONEDAClick(Sender: TObject);
begin
        Objeto.Moneda.ShowAll := True;
        if Objeto.Moneda.Busca then
        Begin
           InterForma1.NextTab(edCVE_MONEDA);
        end;
end;

procedure TWCrRelAcreMn.btAgregaMonedaClick(Sender: TObject);
var nRow,i       : Integer;
    vlExiste     : String;
begin
   nRow := 0;
   vlExiste := CFALSO;
   Objeto.CVE_MONEDA.GetFromControl;
// agregar moneda mediante un query
   if Objeto.CVE_MONEDA.AsString <> '' then
      if MessageDlg('¿Desea almacenar la moneda? ',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
         for i:= 0 to sgcMONEDA.SG.RowCount - 1 Do
         Begin
          if sgcMONEDA.CellStr['CVE_MONEDA',nRow] = Objeto.CVE_MONEDA.AsString then
             Begin
                showmessage('La Moneda ya Existe');
                vlExiste := CVERDAD;
                Break;
             end;
           nRow := nRow + 1;
         end;

         if vlExiste = CFALSO then
            Objeto.AgregaMoneda;
         //end if
          MuestraDatos;
      end;
   //end if

end;

procedure TWCrRelAcreMn.InterForma1DespuesShow(Sender: TObject);
begin
    MuestraDatos;
end;

procedure TWCrRelAcreMn.cbB_REL_ACRE_MONClick(Sender: TObject);
  Procedure MonedaIndistinta;
  var vlSql: String;
  Begin
     Objeto.B_APLI_REL_MON.GetFromControl;
     vlSql := 'UPDATE CR_ACREDITADO SET B_APLI_REL_MON = ' + #39 +Objeto.B_APLI_REL_MON.AsString + #39 +
              'WHERE ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString;
     RunSQL(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
  end;

  Procedure MuestraMonedasFal(pAcreditado : String);
  var Qry : TQuery;
    vlSql :String;
    strId : String;
  begin
     vlsql:= ' SELECT DISTINCT C.CVE_MONEDA, M.DESC_MONEDA ' +
             ' FROM CONTRATO C, MONEDA M, CR_CONTRATO CC ' +
             ' WHERE ID_TITULAR =  ' + pAcreditado +
             ' AND CC.ID_CONTRATO =  C.ID_CONTRATO ' +
             ' AND C.CVE_MONEDA = M.CVE_MONEDA ' +
             ' AND C.CVE_MONEDA NOT IN(SELECT CVE_MONEDA FROM CR_REL_ACRE_MON ' +
                                     ' WHERE ID_ACREDITADO = ' + pAcreditado + ')';
     Qry := TQuery.Create(Self);
     Try
       Qry.SessionName := Objeto.SessionName;
       Qry.DataBaseName := Objeto.DataBaseName;
       Qry.SQL.Clear;
       Qry.SQL.Add(vlsql);
       Qry.Open;

       While Not Qry.Eof Do
        Begin
              ShowMessage('Moneda : << ' + Qry.FieldByName('CVE_MONEDA').AsString +
                          ' : ' + Qry.FieldByName('DESC_MONEDA').AsString + ' >>');
       Qry.Next;
       End;
      Finally
       If Assigned(Qry) Then
        Begin Qry.Close; Qry.Free; End;
      End;
  end;
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   if not cbB_REL_ACRE_MON.Checked then
   Begin
      if Objeto.VerificaMonedaCto > 0 then
      Begin
         ShowMessage('Faltan monedas del Contrato por registrar en el Acreditado');
         MuestraMonedasFal(Objeto.ID_ACREDITADO.AsString);
         cbB_REL_ACRE_MON.Checked := True;
         MonedaIndistinta;
      end
      else
         MonedaIndistinta;
   end
   else
      MonedaIndistinta;
end;

procedure TWCrRelAcreMn.btEliminaAcreditadoClick(Sender: TObject);
var nRow        : Integer;
    vlMoneda    : String;
    vlAcreditado: String;
   Procedure EliminarRelacion(pMoneda,pAcreditado : String);
   var vlsql : String;
   Begin
       vlsql := ' DELETE CR_REL_ACRE_MON WHERE ID_ACREDITADO = ' + pAcreditado +
                ' AND CVE_MONEDA = ' + pMoneda;
       RunSQL(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);
   end;

begin
   nRow := sgcMONEDA.SG.Row;
   if MessageDlg('¿Desea eliminar la moneda : ' + sgcMONEDA.CellStr['CVE_MONEDA',nRow] +
                 ' ' + sgcMONEDA.CellStr['DESC_MONEDA',nRow] + ' ?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      vlMoneda := sgcMONEDA.CellStr['CVE_MONEDA',nRow];
      vlAcreditado:= sgcMONEDA.CellStr['ID_ACREDITADO',nRow];
      if Objeto.VerificaCtoAC(vlMoneda) = 0 then
         EliminarRelacion(vlMoneda,vlAcreditado)
      else  ShowMessage('No se puede eliminar, el Acreditado tiene contratos activos, con esta moneda');
      MuestraDatos;
   end;
end;

procedure TWCrRelAcreMn.ilIDACREDITADOEjecuta(Sender: TObject);
begin
if Objeto.Acreditado.FindKey([ilIDACREDITADO.Buffer]) then
   Begin
      MuestraDatos;
      Objeto.Moneda.Active := False;
      InterForma1.NextTab(edID_ACREDITADO);
   end;
end;

procedure TWCrRelAcreMn.ilCVEMONEDAEjecuta(Sender: TObject);
begin
      if Objeto.Moneda.FindKey([ilCVEMONEDA.Buffer]) then
        InterForma1.NextTab(edCVE_MONEDA);
      //end if
end;

end.

