{10/10/2014 liberacion RQT 2014 - 08 / 035}
Unit IntPcLimDisc;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, InterEdit,
  UnFunProcICB     { Constantes, Funciones y Procedimientos generales (ICB) }
  ;

Type
  TPcLimDisc= class;

  TWPcLimDisc=Class(TForm)
    InterForma1      : TInterForma;
    edID_EVALUACION  : TEdit;
    lbID_EVALUACION  : TLabel;
    GroupBox1        : TGroupBox;
    lv_PcLimDicLim   : TListView;
    sbModIngr        : TSpeedButton;
    edTipoPerfil     : TEdit;
    Label1           : TLabel;
    Label2           : TLabel;
    Label3           : TLabel;
    edIdPerfil       : TEdit;
    edMontoValuacion : TInterEdit;

    procedure FormShow   ( Sender : TObject);
    procedure FormClose  ( Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy( Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure sbModIngrClick(Sender: TObject);
    procedure edMontoValuacionExit(Sender: TObject);    
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
//    procedure ModificaPerfiCliente( pIdContrato : Integer; pModRubros : Integer; var pResultado : Integer);
    private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TPcLimDisc;
end;

 TPcLimDisc= class(TInterFrame) 
      private
        FContrato: TInterFrame; 
      protected
        vlv_PcLimDicLim  : TListView;
        
        procedure SetContrato(Ctto: TInterFrame);

      public 
        { Public declarations }
        {intercampos}
        MontoEvalBD    : String;
        ID_CONTRATO,
        DESCTIPOPERFIL,
        MONTOVALUA,
        ID_TIPO_PERFIL : TInterCampo;

        procedure  DespuesLocaliza(Sender: TObject);
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   AgregarFilaPcLim(lvw : TListView; informacion : array of string);
        property    Contrato: TInterFrame Read FContrato Write SetContrato;
        
      published
        property plv_PcLimDicLim  : TListView    Read vlv_PcLimDicLim  write vlv_PcLimDicLim;
      end;

implementation
//Uses RepMon;

{$R *.DFM}

constructor TPcLimDisc.Create( AOwner : TComponent ); 
begin
  Inherited;
    ID_CONTRATO     := CreaCampo('ID_CONTRATO'      , ftInteger , tsNinguno, tsNinguno, True);
    DESCTIPOPERFIL  := CreaCampo('DESC_TIPO_PERFIL' , ftString  , tsNinguno, tsNinguno, False);
    MONTOVALUA      := CreaCampo('MONTO_VALUACION'  , ftString  , tsNinguno, tsNinguno, False);
    ID_TIPO_PERFIL  := CreaCampo('ID_TIPO_PERFIL'   , ftString  , tsNinguno, tsNinguno, False);
    FContrato       := nil;

    OnAfterLocaliza := DespuesLocaliza;

    FKeyFields.Add('ID_CONTRATO');
    TableName       := 'PC_LIM_DISC_LIM';
    FActive         := False;
    UseQuery        := True;
    ShowMenuReporte := True;
  //IsCorp:=True;
end;

Destructor TPcLimDisc.Destroy;
begin
  inherited;
end;

function TPcLimDisc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPcLimDisc;

begin
  W := TWPcLimDisc.Create(Self);
  try
    W.Objeto                    := Self;
    W.InterForma1.InterFrame    := Self;
    W.InterForma1.FormaTipo     := FormaTipo;
    W.InterForma1.FormaEstilo   := feAutomatico;
    W.InterForma1.ShowGrid      := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion       := FInterFun;
    plv_PcLimDicLim             := W.lv_PcLimDicLim;
    DespuesLocaliza(Self);
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

Function TPcLimDisc.InternalBusca:Boolean;
Var T         : TInterFindit;
    Realizado : Boolean;
    Qry       : TQuery;
    SQuery    : String;

begin
  InternalBusca := False;
  T := CreaBuscador('IntCtto.it','S,S');
  Try
    if Active then
      T.Param(0,ID_CONTRATO.AsString);
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

procedure TPcLimDisc.SetContrato(Ctto: TInterFrame);
begin
  FContrato := Ctto;
  If Ctto <> nil then begin
    FContrato := Ctto;
  end
  else begin
    FContrato := nil;
    Active    := False;
  end;
end;

procedure TPcLimDisc.DespuesLocaliza(Sender: TObject);
var Qry  : TQuery;
    sSql : String;
    paso : Boolean;

begin
  if (plv_PcLimDicLim <> nil) then // CZR 15-oct-2013
    plv_PcLimDicLim.Items.Clear;
  if Active then begin
    paso := False;
    try
      sSql :=  ' SELECT LIM.ID_CONTRATO '
             +      ' , PER.DESC_TIPO_PERFIL'
             +      ' , UPPER(RUB.DESC_RUBRO) AS DESC_RUBRO'
             +      ' , RUB.CVE_RUBRO'
             +      ' , IMP_VALUACION'
             +      ' , LIM.ID_TIPO_PERFIL'
             +      ' , NVL( TRIM(TO_CHAR(LIM.IMP_LIMITE_RUBRO,''999,999,999,999,999,990.00'')),''N.A.'') AS IMP_LIMITE_RUBRO'
             + ' FROM '
             +      ' PC_LIM_DISC_LIM LIM,'
             +      ' PC_RUBRO        RUB,'
             +      ' PC_TIPO_PERFIL  PER'
             + ' WHERE 1 = 1 '
             +   ' AND LIM.ID_CONTRATO    = ' + ID_CONTRATO.AsSQL
             +   ' AND RUB.CVE_RUBRO      = LIM.CVE_RUBRO '
             +   ' AND PER.ID_TIPO_PERFIL = LIM.ID_TIPO_PERFIL '
             + ' ORDER BY RUB.ORDEN_IMPRESION, RUB.DESC_RUBRO '
             ;

      Qry := GetSqlQuery( sSql , Apli.DataBaseName, Apli.SessionName, False);

      if Qry <> nil then
         while not Qry.eof do begin
           AgregarFilaPcLim(plv_PcLimDicLim, [trim(Qry.FieldByName('CVE_RUBRO').AsString),
                                              Trim(Qry.FieldByName('DESC_RUBRO').AsString),
                                              Trim(Qry.FieldByName('IMP_LIMITE_RUBRO').AsString)]);
           if paso = False Then Begin
             DESCTIPOPERFIL.SetAsString( Trim( Qry.FieldByName('DESC_TIPO_PERFIL').AsString)) ;
             MONTOVALUA.SetAsString( Trim(Qry.FieldByName('IMP_VALUACION').AsString)) ;
             ID_TIPO_PERFIL.SetAsString ( Trim(Qry.FieldByName('ID_TIPO_PERFIL').AsString)) ;
             MontoEvalBD := Trim(Qry.FieldByName('IMP_VALUACION').AsString);
             paso := True;
           End;
           Qry.Next;
         end;
    finally
      if Qry <> nil then
        Qry.Free;
    end;
  End;
end;

procedure TPcLimDisc.AgregarFilaPcLim(lvw : TListView; informacion : array of string); // CZR 07-Nov-2012
var fila : Tlistitem;
    n    : Integer;

begin
  for n := low(informacion) to high(informacion) do
    with lvw do
      if n = 0 then begin
        fila        := Items.Add;
        fila.Caption:= informacion[n];
      end
      else begin
        if n=1 then
          fila.SubItems.Add(informacion[n])
        else
          fila.SubItems.Add(informacion[n]);
      end;
end;

(***********************************************FORMA PSI_EVALUACION********************)
(*                                                                              *)
(*  FORMA DE PSI_EVALUACION                                                            *)
(*                                                                              *)
(***********************************************FORMA PSI_EVALUACION********************)
procedure TWPcLimDisc.FormShow(Sender: TObject);
begin
  {Asociasion de editpores}
  Objeto.ID_CONTRATO.Control    := edID_EVALUACION;
  objeto.DESCTIPOPERFIL.Control := edTipoPerfil;
  Objeto.MONTOVALUA.Control     := edMontoValuacion;
  Objeto.ID_TIPO_PERFIL.Control := edIdPerfil;

  If (Objeto.FContrato <> nil) Then Begin
   {algo}
  End;
end;

procedure TWPcLimDisc.FormDestroy(Sender: TObject);
begin
  {Asociasion a null}
  Objeto.ID_CONTRATO.Control    := nil;
  objeto.DESCTIPOPERFIL.Control := nil;
  Objeto.MONTOVALUA.Control     := nil;
  Objeto.ID_TIPO_PERFIL.Control := nil;
end;

procedure TWPcLimDisc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWPcLimDisc.InterForma1DespuesShow(Sender: TObject);
begin
  InterForma1.f.btNuevo.Visible     := False;
  InterForma1.f.btEliminar.Visible  := False;
  InterForma1.f.btAyuda.Visible     := False;
end;

procedure TWPcLimDisc.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado := True;
end;

procedure TWPcLimDisc.sbModIngrClick(Sender: TObject);
var vMonto     : String;
    vMontoBD   : String;
    Qry        : TQuery;
    sSql       : String;
    CalcPct    : Double;
    QryValida  : TQuery;
    sSqlValida : String;

begin
  if lv_PcLimDicLim.SelCount    = 0 then
    raise EInterFrame.Create('Seleccione un registro');

  {Script para obtener las banderas si se acepta cambios y/o validacion de limite por rubro y perfil}
  try
    sSqlValida := ' SELECT RP.CVE_RUBRO, UPPER(RU.DESC_RUBRO) AS DESC_RUBRO, RP.ACEPTA_CAMBIO, RP.VALIDA_LIMITE    '
                + '   FROM PC_RUBRO_PERFIL RP, '
                + '        PC_RUBRO        RU  '
                + '  WHERE 1 = 1 '
                + '    AND RP.CVE_RUBRO      = ' + chr(39) + lv_PcLimDicLim.Selected.Caption  + chr(39)
                + '    AND RP.ID_TIPO_PERFIL = ' + Objeto.ID_TIPO_PERFIL.AsSQL
                + '    AND RP.CVE_RUBRO      = RU.CVE_RUBRO';

    QryValida := GetSqlQuery( sSqlValida , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

    if QryValida <> nil then Begin
      IF  Trim(QryValida.FieldByName('ACEPTA_CAMBIO').AsString) = 'F'   Then Begin
        messagedlg('El rubro ['
                   + QryValida.FieldByName('CVE_RUBRO').AsString
                   + ' - '
                   + QryValida.FieldByName('DESC_RUBRO').AsString
                   +'] no puede ser modificado', mtInformation, [mbOK], 0);
        exit;
      End
      Else Begin
        vMonto    := Trim(lv_PcLimDicLim.Selected.SubItems[1]);
        vMonto    := StringReplace(vMonto, ',', '',[rfReplaceAll, rfIgnoreCase]);
        vMontoBD  := Trim(lv_PcLimDicLim.Selected.SubItems[1]);

        if not InputQuery('Modificacion', 'Ingrese una Monto para este rubro: ' , vMonto) then
          exit;

        IF  Trim(QryValida.FieldByName('VALIDA_LIMITE').AsString) = 'V'   Then Begin
          try
            sSql := ' Select ( CASE WHEN'
                    + ' Decode (Lop.Id_Rubro_Lo_Carta '
                    + ' , 163, Lop.Limite_Superior_Lo '
                    + ' , (TO_NUMBER(REPLACE(' + chr(39) + edMontoValuacion.Text + chr(39) + ','','',''''))) * Lopcomp.Porc_Limite_Carta) < '
                    + vMonto + ' then 1'
                    + ' Else 0 '
                    + ' end) as CAMBIO'
                    + ' From Pc_Tipo_Port_Mod      Tp '
                    + ' , Pc_V_Porc_Rubro_Carta Lopcomp '
                    + ' , Pc_Lim_Oper_Port      Lop '
                    + ' , Pc_Rubro_Perfil       Rp '
                    + ' , Pc_Rubro              Ru '
                    + '  Where 1=1 '
                    + ' And Tp.Id_Tipo_Perfil          = '+ Objeto.ID_TIPO_PERFIL.AsSQL
                    + ' And Tp.Id_Tipo_Portafolio      = Lop.Id_Tipo_Portafolio '
                    + ' And Lopcomp.Id_Rubro_Lo_Carta  = Lop.Id_Rubro_Lo_Carta '
                    + ' And Lopcomp.Id_Tipo_Portafolio = Lop.Id_Tipo_Portafolio '
                    + ' And Rp.Id_Tipo_Perfil          = Tp.Id_Tipo_Perfil '
                    + ' And Rp.Cve_Rubro               = Ru.Cve_Rubro '
                    + ' And Ru.Id_Rubro_Equivalente    = Lop.Id_Rubro_Lo '
                    + ' And Ru.Cve_Rubro = '  + chr(39) + lv_PcLimDicLim.Selected.Caption  + chr(39);
            Qry := GetSqlQuery( sSql , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

            if Qry <> nil then Begin
              IF  Trim(Qry.FieldByName('CAMBIO').AsString) = '1'   Then Begin
                messagedlg('El importe supera lo maximo permitido para:' + chr(13)
                           + 'el perfil: '+ Objeto.DESCTIPOPERFIL.AsString + chr(13)
                           + 'y el rubro: ' +  lv_PcLimDicLim.Selected.SubItems[0]
                           , mtInformation, [mbOK], 0)
              End
              Else Begin
                vMonto := StringReplace(vMonto, ',', '',[rfReplaceAll, rfIgnoreCase]);
                vMonto := Format('%n', [StrtoFloat(vMonto)] );
                lv_PcLimDicLim.Selected.SubItems[1] := vMonto;
              End;
            End;
          finally
            if Qry <> nil then
              Qry.Free;
          end;
        End
        Else Begin
          vMonto := StringReplace(vMonto, ',', '',[rfReplaceAll, rfIgnoreCase]);
          vMonto := Format('%n', [StrtoFloat(vMonto)] );
          lv_PcLimDicLim.Selected.SubItems[1] := vMonto;
        End;
      End;
    End;
  Finally
    If QryValida <> nil then
      QryValida.Free;
  end;
end;

procedure TWPcLimDisc.edMontoValuacionExit(Sender: TObject);
var Qry  : TQuery;
    sSql : String;
    n    : Integer;

begin
  if Objeto.MontoEvalBD <> edMontoValuacion.Text Then Begin
    if ( MessageDlg('Si realiza modificaciones sobre el monto de inversion se recalcularan todos los rubros' +  chr(13)
             + '¿ Esta seguro de continuar con la modificación ?', mtConfirmation, [mbYes, mbNO], 0) = mrNo) Then Begin
      edMontoValuacion.Text := Objeto.MontoEvalBD;
      edMontoValuacion.SetFocus;
    End
    Else Begin
      try
        sSql := ' Select '
                +        ' Decode (Lop.Id_Rubro_Lo_Carta '
                +      ' , 163, Lop.Limite_Superior_Lo '
                +      ' , (TO_NUMBER(REPLACE(' + chr(39) + edMontoValuacion.Text + chr(39) + ','','','''')) * Lopcomp.Porc_Limite_Carta)  ) as PCT_CALC, Ru.CVE_RUBRO '
                +  ' From Pc_Tipo_Port_Mod      Tp '
                +     ' , Pc_V_Porc_Rubro_Carta Lopcomp '
                +     ' , Pc_Lim_Oper_Port      Lop '
                +     ' , Pc_Rubro_Perfil       Rp '
                +     ' , Pc_Rubro              Ru '
                + ' Where 1=1 '
                +   ' And Tp.Id_Tipo_Perfil          = ' + Objeto.ID_TIPO_PERFIL.AsSQL
                 +   ' And Tp.Id_Tipo_Portafolio      = Lop.Id_Tipo_Portafolio '
                +   ' And Lopcomp.Id_Rubro_Lo_Carta  = Lop.Id_Rubro_Lo_Carta '
                 +   ' And Lopcomp.Id_Tipo_Portafolio = Lop.Id_Tipo_Portafolio '
                 +   ' And Rp.Id_Tipo_Perfil          = Tp.Id_Tipo_Perfil '
                 +   ' And Rp.Cve_Rubro               = Ru.Cve_Rubro '
                 +   ' And Ru.Id_Rubro_Equivalente    = Lop.Id_Rubro_Lo '
                 ;

        Qry := GetSqlQuery( sSql , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

        if Qry <> nil then
          While not Qry.eof do Begin
            for n:=0 to lv_PcLimDicLim.Items.Count-1 do Begin
              if  lv_PcLimDicLim.Items[n].Caption = Trim(Qry.FieldByName('CVE_RUBRO').AsString) Then Begin
                If  ( lv_PcLimDicLim.Items[n].Caption = 'DURAPOND')
                    //And (Objeto.ID_TIPO_PERFIL.AsInteger >= 104 )
                   And ( Qry.FieldByName('PCT_CALC').AsString = '' ) Then Begin
                  lv_PcLimDicLim.Items[n].SubItems[1] := 'N.A.';
                  Break;
                End
                Else Begin
                  lv_PcLimDicLim.Items[n].SubItems[1] := Format('%20n', [StrtoFloat(Trim(Qry.FieldByName('PCT_CALC').AsString))] ) ;
                  Break;
                End;
              End;
            End;
            Qry.next;
          End;
      Finally
        If Qry <> nil then
          Qry.Free;
      end;
    End;
  End;
end;

procedure TWPcLimDisc.InterForma1AntesAceptar(Sender: TObject;
                                              IsNewData: Boolean; var Realizado: Boolean);
Var //Qry           : TQuery;
    sSql,
    sql        : String;
    reali      : Boolean;
    n,
    pResultado : Integer;
    sp         : TStoredProc;                                                  //rohs4279 nov/2015 req. PMO150817

begin
  reali := True;
  sql   := '<Config>';                                                         //rohs4279 nov/2015 req. PMO150817
  for n := 0 to lv_PcLimDicLim.Items.Count-1 do begin
    If (lv_PcLimDicLim.Items[n].Caption = 'DURAPOND') and
      //And (Objeto.ID_TIPO_PERFIL.AsInteger >= 104 )
       ( lv_PcLimDicLim.Items[n].SubItems[1] = 'N.A.') Then Begin
{      sSql := ' UPDATE PC_LIM_DISC_LIM '
            + ' SET IMP_VALUACION    = '  + edMontoValuacion.Text
            +   ' , IMP_LIMITE_RUBRO = NULL '
            + ' WHERE ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsSQL
            +   ' AND CVE_RUBRO   = '+ chr(39) + lv_PcLimDicLim.Items[n].Caption + chr(39)
            ;}
      ssql := '<Rubro>' + '<Id_Contrato>' + Objeto.ID_CONTRATO.AsString + '</Id_Contrato>' +
              '<Cve_Rubro>' + lv_PcLimDicLim.Items[n].Caption + '</Cve_Rubro>' +
              '<Imp_Valuacion>' + Trim(edMontoValuacion.Text) + '</Imp_Valuacion>' +   
              '<Imp_Limite_Rubro>' + '0.00' + '</Imp_Limite_Rubro></Rubro>';
      sql := sql + ssql
    End
    Else Begin
{      sSql := ' UPDATE PC_LIM_DISC_LIM '
            + ' SET IMP_VALUACION    = '  + edMontoValuacion.Text
            +   ' , IMP_LIMITE_RUBRO = TO_NUMBER(REPLACE(' + chr(39) + lv_PcLimDicLim.Items[n].SubItems[1] + chr(39) + ','','','''')) '
            + ' WHERE ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsSQL
            +   ' AND CVE_RUBRO   = '+ chr(39) + lv_PcLimDicLim.Items[n].Caption + chr(39)
            ;}
      ssql := '<Rubro>' + '<Id_Contrato>' + Objeto.ID_CONTRATO.AsString + '</Id_Contrato>' +
              '<Cve_Rubro>' + lv_PcLimDicLim.Items[n].Caption + '</Cve_Rubro>' +
              '<Imp_Valuacion>' + Trim(edMontoValuacion.Text) + '</Imp_Valuacion>' +
              '<Imp_Limite_Rubro>' + Trim(StringReplace(lv_PcLimDicLim.Items[n].SubItems[1],',','',[rfReplaceAll])) +
              '</Imp_Limite_Rubro></Rubro>';
      sql := sql + ssql
    End;
{    try
      RunSQL(sSQL , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
    except
      on e: EInterFrame do Begin
        MessageDlg(e.Message, mtInformation, [mbOK], 0);
        reali := False;
        Break;
      End;
    end;}
    Objeto.MontoEvalBD := edMontoValuacion.Text;
  end;
  sql := sql + '</Config>';
  sp  := TStoredProc.Create(nil);
  try
    sp.DatabaseName   := Objeto.Apli.DataBaseName;
    sp.SessionName    := Objeto.Apli.SessionName;

    sp.StoredProcName := 'PKGCORPORATIVO.BITMODIFICAPERFIL';

    sp.Params.CreateParam(ftInteger, 'peIdContrato',  ptInput);
    sp.Params.CreateParam(ftString,  'peCveUsuario',  ptInput);
    sp.Params.CreateParam(ftString,  'peXmlInfo',     ptInput);
    sp.Params.CreateParam(ftInteger, 'psResultado' ,  ptOutput);

    sp.ParamByName('peIdContrato').AsInteger := Objeto.ID_CONTRATO.AsInteger;
    sp.ParamByName('peCveUsuario').AsString  := Objeto.DameUsuario;
    sp.ParamByName('peXmlInfo').Asstring     := sql;
    sp.ExecProc;

    if sp.ParamByName('psResultado').AsInteger <> 0 then
      reali := False;
  finally
    if sp <> nil then
      sp.Free;
    sp := nil;
  end;                                                                         //rohs4279 nov/2015 req. PMO150817

//  ModificaPerfiCliente(  Objeto.ID_CONTRATO.AsInteger , 1,  pResultado);

  Objeto.DespuesLocaliza(Self);

  Realizado := reali;
end;

procedure TWPcLimDisc.InterForma1DespuesCancelar(Sender: TObject);
begin
  Objeto.DespuesLocaliza(Self);
end;

{procedure TWPcLimDisc.ModificaPerfiCliente( pIdContrato : Integer; pModRubros : Integer; var pResultado : Integer);
var Stp : TStoredProc;

begin
  Stp := TStoredProc.Create(nil);
  try
    with Stp do begin
      DatabaseName   := Objeto.Apli.DataBaseName;
      SessionName    := Objeto.Apli.SessionName;

      StoredProcName := 'PKGCORPORATIVO.MODIFICAPERFILCLIENTE';

      Params.CreateParam(ftInteger, 'peIdContrato',  ptInput);
      Params.CreateParam(ftInteger, 'peModRubros' ,  ptInput );
      Params.CreateParam(ftString , 'peCveUsuario',  ptInput );
      Params.CreateParam(ftInteger, 'peResultado' ,  ptOutput);

      ParamByName('peIdContrato').AsInteger := pIdContrato;
      ParamByName('peModRubros').AsInteger  := pModRubros;
      ParamByName('peCveUsuario').AsString  := Objeto.DameUsuario;
      ExecProc;

      pResultado := ParamByName('peResultado').AsInteger;
    end;
  finally
    if Stp <> nil then
      Stp.Free;
    Stp := nil;
  end;
end;}

end.
