{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

// Sistema         : Clase de CR_COMIS_PROG
// Fecha de Inicio : 02/06/2003
// Función forma   : Clase de CR_COMIS_PROG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCnPrAcc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCrCatComi, IntParamCre,
IntLinkit,  Grids, Aligrid,   IntGenCre, Menus, IntSGCtrl,
//
IntCrAcredit,  // Acreditado
IntCrCto,      // Contrato
IntCrCoPrAc;

Const
   COL_CVE = 0; //Descripción de Comisión
   COL_COM = 1; //Descripción de Comisión
   COL_PCT = 2; //Porcentaje
   COL_IMP = 3; //Importe
   COL_SIT = 4; //Situación
Type
  TCrCnPrAcc = class;


  TWCrComProAcc=Class(TForm)
    InterForma1             : TInterForma;
    lbID_ACCESORIO: TLabel;
    edID_ACCESORIO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESC_ACCESORIO: TEdit;
    Label23: TLabel;
    Label25: TLabel;
    Label7: TLabel;
    sgcDATOS: TSGCtrl;
    Label1: TLabel;
    Label2: TLabel;
    Label30: TLabel;
    pupComProg: TPopupMenu;
    ConfiguraComision: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure ConfiguraComisionClick(Sender: TObject);
  private
    fDataFound : Boolean;
  private
    procedure LiberaControles;
    procedure setTipoPantalla;
    Procedure LlenaGrid;
    //
    Procedure ActivaComision( peid_accesorio  : integer;
                              pefol_accesorio : integer;
                              pecve_accesorio : string;
                              pecve_comision  : string;
                              peSitComProg    : string
                            );
  public
    Objeto : TCrCnPrAcc;
  end;
  //
  TCrCnPrAcc = class(TInterFrame)
  private
  protected
  public
        ID_ACCESORIO             : TInterCampo;
        FOL_ACCESORIO            : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        //
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Contrato                 : TCrCto;
        //
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published

  
  end;



implementation


{$R *.DFM}


constructor TCrCnPrAcc.Create( AOwner : TComponent );
begin
  Inherited;
  //
  CVE_ACCESORIO  := CreaCampo('CVE_ACCESORIO',  ftString, tsNinguno, tsNinguno, True );
  CVE_ACCESORIO.Caption  := 'Accesorio';
  ID_ACCESORIO   := CreaCampo('ID_ACCESORIO',   ftFloat,  tsNinguno, tsNinguno, True );
  ID_ACCESORIO.Caption   := 'Acreditado';
  FOL_ACCESORIO  := CreaCampo('FOL_ACCESORIO',  ftFloat,  tsNinguno, tsNinguno, True );
  FOL_ACCESORIO.Caption  := 'Folio';
  //

  Acreditado := TCrAcredit.Create(Self);      // Clase de acreditado
  Acreditado.MasterSource := Self;
  Contrato   := TCrCto.Create(Self);          // Clase de contrato
  Contrato.MasterSource := Self;
  //
  TableName := '';
  UseQuery  := True;
  HelpFile  := 'IntCrCnPrAcc.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCnPrAcc.Destroy;
begin
  if Acreditado <> nil then
     Acreditado.Free;
  //
  if Contrato <> nil then
     Contrato.Free;
  //
  inherited;
end;


function TCrCnPrAcc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComProAcc;
begin
   W:=TWCrComProAcc.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CR_COMIS_PROG********************)
(*                                                                              *)
(*  FORMA DE CR_COMIS_PROG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COMIS_PROG********************)

procedure TWCrComProAcc.ActivaComision( peid_accesorio  : integer;
                                        pefol_accesorio : integer;
                                        pecve_accesorio : string;
                                        pecve_comision  : string;
                                        peSitComProg    : string
                                      );
var   StpComis : TStoredProc;
Begin
   try
     StpComis := TStoredProc.Create(Self);
     with StpComis do
     begin
        //Inicia el SPT
        StpComis.DatabaseName:= Objeto.Apli.DatabaseName;
        StpComis.SessionName:= Objeto.Apli.SessionName;
        StpComis.StoredProcName:= 'PKGCRCOMISIONES.STPUPDSITCNPRACC';
        Params.Clear;
        Params.CreateParam( ftFloat,    'PEIDACCESORIO',  ptInput);
        Params.CreateParam( ftFloat,    'PEFOLACCESORIO', ptInput);
        Params.CreateParam( ftString,   'PECVEACCESORIO', ptInput);
        Params.CreateParam( ftString,   'PECVECOMISION',  ptInput);
        Params.CreateParam( ftString,   'PESITCOMPROG',   ptInput);
        Params.CreateParam( ftString,   'PECVEUSUMOD',    ptInput);
        Params.CreateParam( ftString,   'PEBCOMMIT',      ptInput);
        Params.CreateParam( ftInteger,  'PSRESULTADO',    ptOutput);
        Params.CreateParam( ftString,   'PSTXRESULTADO',  ptOutput);
        Prepare;
        ParamByName('PEIDACCESORIO').AsInteger  := peid_accesorio;
        ParamByName('PEFOLACCESORIO').AsInteger := pefol_accesorio;
        ParamByName('PECVEACCESORIO').AsString  := pecve_accesorio;
        ParamByName('PECVECOMISION').AsString   := pecve_comision;
        ParamByName('PESITCOMPROG').AsString    := peSitComProg;
        ParamByName('PECVEUSUMOD').AsString     := Objeto.Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString       := CVERDAD;
        ExecProc;
        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' + ParamByName('psTxResultado').AsString );
        end;
        //end if;
     end;
   finally
      StpComis.Free;
   end;
end;


procedure TWCrComProAcc.LiberaControles;
begin
  if Objeto.Acreditado.ID_ACREDITADO.Control    <> nil then Objeto.Acreditado.ID_ACREDITADO.Control    := nil;
  if Objeto.Acreditado.Persona.Nombre.Control   <> nil then Objeto.Acreditado.Persona.Nombre.Control   := nil;
  if Objeto.Contrato.ID_CONTRATO.Control        <> nil then Objeto.Contrato.ID_CONTRATO.Control        := nil;
  if Objeto.Contrato.Contrato.TITNombre.Control <> nil then Objeto.Contrato.Contrato.TITNombre.Control := nil;
end;


procedure TWCrComProAcc.setTipoPantalla;
begin
  LiberaControles;
  lbID_ACCESORIO.Caption := 'No Data Found';
  if Objeto.CVE_ACCESORIO.AsString = 'AC' then // Acreditado
  begin
    if Objeto.Acreditado.FindKey([ Objeto.ID_ACCESORIO.AsString ]) then
    Begin
      lbID_ACCESORIO.Caption := 'Acreditado';
      Objeto.Acreditado.ID_ACREDITADO.Control  := edID_ACCESORIO;
      Objeto.Acreditado.Persona.Nombre.Control := edDESC_ACCESORIO;
    End;
     //
  end else if Objeto.CVE_ACCESORIO.AsString = 'LN' then // Acreditado
  begin
     if Objeto.Contrato.FindKey([ Objeto.ID_ACCESORIO.AsString, Objeto.FOL_ACCESORIO.AsString ]) then
     Begin
      lbID_ACCESORIO.Caption := 'Autorización';
      Objeto.Contrato.ID_CONTRATO.Control        := edID_ACCESORIO;
      Objeto.Contrato.Contrato.TITNombre.Control := edDESC_ACCESORIO;
     End;
    //
  End;
End;


procedure TWCrComProAcc.LlenaGrid;
var vlQry   : TQuery;
    vlsql   : String;
    vlsqlw  : String;
    vlBFind : Boolean;
begin
  vlsqlw     := '';
  vlBFind    := (Objeto.CVE_ACCESORIO.AsString = 'AC') OR (Objeto.CVE_ACCESORIO.AsString = 'LN');
  fDataFound := False;
  if Objeto.CVE_ACCESORIO.AsString = 'AC' then          // Acreditado
  begin
    vlsqlw  := 'CCP.CVE_ACCESORIO = '  + SQLStr( Objeto.CVE_ACCESORIO.AsString ) + ' AND ' +
               'CCP.ID_ACCESORIO  = '  + Objeto.ID_ACCESORIO.AsString;
  end else if Objeto.CVE_ACCESORIO.AsString = 'LN' then // Autorización
  begin
    vlsqlw := 'CCP.CVE_ACCESORIO = '  + SQLStr( Objeto.CVE_ACCESORIO.AsString )  + ' AND ' +
              'CCP.ID_ACCESORIO  = '  + Objeto.ID_ACCESORIO.AsString   + ' AND ' +
              'CCP.FOL_ACCESORIO = '  + Objeto.FOL_ACCESORIO.AsString
    ;
  end;
  //
  vlSql :=  'SELECT  DECODE( CCP.SIT_COMIS_PROG,''CA'','''',''SI'') SIT_COMISION,      ' + coCRLF +
            '        CCC.CVE_COMISION,'    + coCRLF +
            '        CCC.DESC_COMISION,'   + coCRLF +
            '        CCP.PCT_COMISION,'    + coCRLF +
            '        CCP.IMP_COMISION,'    + coCRLF +
            '        DECODE(CCC.CVE_TIPO_COM,''EV'',''EVENTUAL'',''PE'', ''PERIODICA'', ''PP'', ''PLAN DE PAGO'', ''ERROR'') CVE_TIPO_COM, ' + coCRLF +
            '        CCP.SIT_COMIS_PROG,'  + coCRLF +
            '        CCP.ID_ACCESORIO,'    + coCRLF +
            '        CCP.FOL_ACCESORIO,'   + coCRLF +
            '        CCP.CVE_ACCESORIO'    + coCRLF +
            'FROM    CR_CAT_COMISION CCC,' + coCRLF +
            '        CR_COM_PROG_ACC CCP'  + coCRLF +
            'WHERE   '  + vlsqlw + coCRLF +
            '  AND   CCP.CVE_COMISION  = CCC.CVE_COMISION ';
  //
  vlQry := nil;
  if vlBFind then
    vlQry := GetSQLQuery( vlSql, Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, True );
  //
  if vlQry <> nil then
  Begin
    fDataFound:= True;
    //Datos que no se muestran
    vlQry.FieldByName('SIT_COMISION').DisplayWidth   := 4;
    vlQry.FieldByName('CVE_COMISION').DisplayWidth   := 8;
    vlQry.FieldByName('DESC_COMISION').DisplayWidth  := 38;
    vlQry.FieldByName('PCT_COMISION').DisplayWidth   := 10;
    vlQry.FieldByName('IMP_COMISION').DisplayWidth   := 13;
    vlQry.FieldByName('CVE_TIPO_COM').DisplayWidth   := 13;
    vlQry.FieldByName('SIT_COMIS_PROG').DisplayWidth := 9;
    //
    vlQry.FieldByName('CVE_ACCESORIO').DisplayWidth  := 1;
    vlQry.FieldByName('ID_ACCESORIO').DisplayWidth   := 1;
    vlQry.FieldByName('FOL_ACCESORIO').DisplayWidth  := 1;
    //
    sgcDATOS.AddQry( vlQry, True, True, -1, -1, -1, False ); // AGREGAR QUERY
    sgcDATOS.ColumnByName('SIT_COMISION').IsCheck := True;   // DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
    vlQry.Free;
  End else
    sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
  //ends_if    
end;

procedure TWCrComProAcc.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  setTipoPantalla;
  LlenaGrid;
end;

procedure TWCrComProAcc.FormDestroy(Sender: TObject);
begin
  LiberaControles;
end;

procedure TWCrComProAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TWCrComProAcc.sgcDATOSDblClick(Sender: TObject);
var Y     : integer;
    vlSit : String;
begin
  if fDataFound  then
  begin
    with sgcDATOS do
    Begin
      Y     := SG.Row;
      vlSit := '';
      if CellStr['SIT_COMIS_PROG',Y] = CSIT_AC then
        vlSit := CSIT_CA
      else
        vlSit := CSIT_AC;
      //
      ActivaComision( StrToIntDef( CellStr['ID_ACCESORIO',  Y], 0 ),
                      StrToIntDef( CellStr['FOL_ACCESORIO', Y], 0 ),
                      CellStr['CVE_ACCESORIO', Y],
                      CellStr['CVE_COMISION',  Y],
                      vlSit );
    End;
  End;
  LlenaGrid;
end;
//IntCrCoPrAc
procedure TWCrComProAcc.ConfiguraComisionClick(Sender: TObject);
var Y        : integer;
    CrCoPrAc : TCrCoPrAc;
begin
    CrCoPrAc := TCrCoPrAc.Create(Self);
    try
      Y     := sgcDATOS.SG.Row;
      CrCoPrAc.Apli     := Objeto.Apli;
      CrCoPrAc.ParamCre := Objeto.ParamCre;
      with sgcDATOS do
      begin
        CrCoPrAc.ID_ACC_DEFAULT  := Objeto.ID_ACCESORIO.AsString;
        CrCoPrAc.FOL_ACC_DEFAULT := Objeto.FOL_ACCESORIO.AsString;
        CrCoPrAc.CVE_ACC_DEFAULT := Objeto.CVE_ACCESORIO.AsString;
        //
        CrCoPrAc.BuscaWhereString := 'CR_COM_PROG_ACC.ID_ACCESORIO   = ' +         Objeto.ID_ACCESORIO.AsString   +
                          ' AND ' +  'CR_COM_PROG_ACC.FOL_ACCESORIO  = ' +         Objeto.FOL_ACCESORIO.AsString  +
                          ' AND ' +  'CR_COM_PROG_ACC.CVE_ACCESORIO  = ' + SQLStr( Objeto.CVE_ACCESORIO.AsString  );
        CrCoPrAc.FilterString     := CrCoPrAc.BuscaWhereString;
        CrCoPrAc.FindKey([ CellStr['ID_ACCESORIO',  Y], CellStr['FOL_ACCESORIO',Y],
                           CellStr['CVE_ACCESORIO', Y], CellStr['CVE_COMISION', Y] ] );
      end;
      CrCoPrAc.Catalogo;
    finally
      CrCoPrAc.Free;
    end;
    LlenaGrid;
end;




end.
