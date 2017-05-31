// Sistema         : Clase de CR_AM_CONTRATOF
// Fecha de Inicio : 17/03/2010
// Función forma   : Clase de CR_AM_CONTRATOF
// Desarrollo por  : MACV. Class Maker.                                   
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrContrF;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,     IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
// Uidades adicionales
     IntCrProduct,
     IntMPers,
     IntPers,
     IntLinkit,
     InterEdit,
     IntSGCtrl,
     IntCrCto
;

const
 CFAVOR = 'Favor de indicar el/la ';

Type
 TCrContrF= class;

  TWCrContrF=Class(TForm)
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
    Panel1: TPanel;
    lbledChequera: TLabel;
    lbledID_Acreditado: TLabel;
    btID_Contrato: TBitBtn;
    edNOM_PERSONA: TEdit;
    lbledCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edDESC_PRODUCTO: TEdit;
    lbledF_ALTA: TLabel;
    lbledF_VENCIMIENTO: TLabel;
    edF_VENCIMIENTO: TEdit;
    edF_ALTA: TEdit;
    lbledPlazoContrato: TLabel;
    edPlazoContrato: TEdit;
    lbledIMP_CREDITO: TLabel;
    lbledIDPersonaRelacionada: TLabel;
    edNumChequera: TEdit;
    lbledSaldoChequera: TLabel;
    edSaldoChequera: TEdit;
    lblID_Contrato: TLabel;
    edIDPersonaRel: TEdit;
    edID_PERSONA: TEdit;
    lbledID_promotor: TLabel;
    edID_PROMOTOR: TEdit;
    edNombrePromotor: TEdit;
    edNombrePersonaRelacionada: TEdit;
    edTipo_Rel: TRadioGroup;
    lbledRelConAcred: TLabel;
    edRel_Con_Acred: TEdit;
    sgPersonasRel: TSGCtrl;
    ilID_persona_rel: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    edIMP_CREDITO: TInterEdit;
    MsgPanel: TPanel;
    edID_CONTRATO: TEdit;
    btnID_PersonaRelacionada: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btID_ContratoClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure edIDPersonaRelExit(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure btnID_PersonaRelacionadaClick(Sender: TObject);
    procedure ListaPersonasRel;
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure ilID_persona_relEjecuta(Sender: TObject);
    procedure edTipo_RelExit(Sender: TObject);
    procedure edRel_Con_AcredExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure ColocaDatosDelContrato;
    procedure sgPersonasRelDblClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrContrF;
end;
 TCrContrF= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CONTRATO               : TInterCampo;
        ID_PERSONA_REL            : TInterCampo;
        REL_CON_ACRED             : TInterCampo;
        TIPO_REL                  : TInterCampo;

        ParamCre                 : TParamCre;
        Contrato, Contrato2      : TCrCto;
        Persona_Rel              : TPersona;
        Acreditado               : TPersona;
        Promotor                 : TPersona;
   //     Producto                 : TCrProduct;


        function    InternalBusca  : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
//        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrContrF.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO           := CreaCampo('ID_CONTRATO'   , ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption   := 'Número de Contrato';
      ID_PERSONA_REL        := CreaCampo('ID_PERSONA_REL', ftFloat,tsNinguno,tsNinguno,True);
      ID_PERSONA_REL.Caption:= 'ID persona relacionada';
      REL_CON_ACRED         :=CreaCampo('REL_CON_ACRED',  ftString,tsNinguno,tsNinguno,True);
      REL_CON_ACRED.Caption :='Relación con el acreditado';
      TIPO_REL              :=CreaCampo('TIPO_REL' ,      ftString,tsNinguno,tsNinguno,True);
         With TIPO_REL do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AV');  // Aval
                ComboLista.Add('1'); ComboDatos.Add('OT');  // Otro
          end;
      TIPO_REL.Caption      :='Tipo de Relación';


      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_PERSONA_REL');

      Contrato := TCrCto.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.ID_CONTRATO.MasterField:='ID_CONTRATO';

      Promotor := TPersona.Create(Self);
      Promotor.MasterSource:=Self;

      Acreditado := TPersona.Create(Self);
      Acreditado.MasterSource:=Self;

      Persona_Rel := TPersona.Create(Self);
      Persona_Rel.MasterSource:=Self;
      Persona_Rel.FieldByName('ID_PERSONA').MasterField :='ID_PERSONA_REL';

      TableName := 'ADMIPROD.CR_AM_CONTRF';
      UseQuery := True;
      HelpFile := 'InTWCrContrF.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrContrF.Destroy;
begin
   if Contrato <> nil then Contrato.Free;
   if Promotor <> nil then Promotor.Free;
   if Persona_Rel <> nil then Persona_Rel.Free;
   if Acreditado <> nil then Acreditado.Free;

   inherited;
end;


function TCrContrF.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrContrF;
begin

   W:=TWCrContrF.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
   
end;


Function TCrContrF.InternalBusca:Boolean;
Var
    T          : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrAmContrF.it','F,F');

  Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                           T.Param(1,ID_PERSONA_REL.AsString);
                     end;
      if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
  finally
    T.Free;
  end;
end;

{

function TWCrContrF.Reporte:Boolean;
begin //Execute_Reporte();
end;

}

(***********************************************************************************)
(*                                                                                 *)
(*                             FORMA DE CR_AM_CONTRATOF                            *)
(*                                                                                 *)
(***********************************************************************************)

procedure TWCrContrF.FormShow(Sender: TObject);
begin
     //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  With Objeto Do
    Begin
      ID_CONTRATO.Control       := edID_CONTRATO;
      ID_PERSONA_REL.Control    := edIDPersonaRel;
      REL_CON_ACRED.Control     := edRel_Con_Acred;
      TIPO_REL.Control          := edTipo_Rel;

      //Contrato.Contrato.ID_Titular.Control      := edID_PERSONA;
      //Contrato.Contrato.TITNombre.Control       := edNOM_PERSONA;
      Acreditado.Nombre.Control                 := edNOM_PERSONA;
      //Contrato.ID_PROM_ADMON.Control            := edID_PROMOTOR;
      Promotor.Nombre.Control                   := edNombrePromotor;
      Persona_rel.Nombre.Control                := edNombrePersonaRelacionada;
      Contrato.CVE_PRODUCTO_CRE.Control         := edCVE_PRODUCTO_CRE;
      //Contrato.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      Contrato.F_ALTA.Control                   := edF_ALTA;
      Contrato.DIAS_PLAZO.Control               := edPlazoContrato;
      Contrato.F_VENCIMIENTO.Control            := edF_VENCIMIENTO;
      Contrato.IMP_AUTORIZADO.Control           := edIMP_CREDITO;
    End;


    Interforma1.MsgPanel := MsgPanel;


end;

procedure TWCrContrF.FormDestroy(Sender: TObject);
begin
  with objeto do
  begin
    ID_CONTRATO.Control    :=nil;
    ID_PERSONA_REL.Control :=nil;
    REL_CON_ACRED.Control  :=nil;
    TIPO_REL.Control       :=nil;

    //Contrato.Contrato.ID_Titular.Control      := nil;
    //Contrato.Contrato.TITNombre.Control       := nil;
    Acreditado.Nombre.Control                 := edNOM_PERSONA;
    //Contrato.ID_PROM_ADMON.Control            := nil;
    Promotor.Nombre.Control                   := nil;
    Persona_rel.Nombre.Control                := nil;
    Contrato.CVE_PRODUCTO_CRE.Control         := nil;
    //Contrato.Producto.DESC_C_PRODUCTO.Control := nil;
    Contrato.F_ALTA.Control                   := nil;
    Contrato.DIAS_PLAZO.Control               := nil;
    Contrato.F_VENCIMIENTO.Control            := nil;
    Contrato.IMP_AUTORIZADO.Control           := nil;
  end;

end;

procedure TWCrContrF.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWCrContrF.btID_ContratoClick(Sender: TObject);
begin
   Objeto.Contrato.ShowAll := True;
   if Objeto.Contrato.Busca then begin
     ColocaDatosDelContrato;
     Objeto.Promotor.FindKey([Objeto.Contrato.ID_PROM_ADMON.AsString]);
     ListapersonasRel;
     InterForma1.NextTab(btID_Contrato);
   End;
end;

procedure TWCrContrF.btnID_PersonaRelacionadaClick(Sender: TObject);
begin
   Objeto.Persona_Rel.ShowAll := True;
   if Objeto.Persona_Rel.Busca then begin
        InterForma1.NextTab(btnID_PersonaRelacionada);
   End;
end;

procedure TWCrContrF.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Contrato.FindKey([ilID_CONTRATO.buffer]) Then
     Begin
       ColocaDatosDelContrato;
       Promotor.FindKey([Contrato.ID_PROM_ADMON.AsString]);
       ListapersonasRel;
       InterForma1.NextTab(btID_Contrato);
     End;

end;

procedure TWCrContrF.ilID_Persona_RelEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Persona_Rel.FindKey([ilID_Persona_Rel.buffer]) Then
     Begin
       InterForma1.NextTab(edIDPersonaRel);
     End;
end;

procedure TWCrContrF.edIDPersonaRelExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';

  If (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    objeto.ID_PERSONA_REL.GetFromControl;

    If (objeto.ID_PERSONA_REL.AsString = '') Then
    Begin
     vlbSalida := False;
     vlStrMesg := CFAVOR + lbledIDPersonaRelacionada.Caption;
    End;
  End;

  InterForma1.ValidaExit(edIDPersonaRel, vlbSalida, vlStrMesg, True);
end;



procedure TWCrContrF.edID_CONTRATOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';

  If (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    objeto.ID_CONTRATO.GetFromControl;
    
    If (objeto.ID_CONTRATO.AsString = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lblID_Contrato.Caption;
    End;
  end;
  InterForma1.ValidaExit(edID_CONTRATO, vlbSalida, vlStrMesg, True);
end;



procedure TWCrContrF.InterForma1DespuesNuevo(Sender: TObject);
begin
   If edID_CONTRATO.CanFocus Then edID_CONTRATO.SetFocus;
   edTipo_Rel.ItemIndex := 0;
   ListapersonasRel;
end;




procedure TWCrContrF.edTipo_RelExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  InterForma1.ValidaExit(edTipo_Rel, True, '', True);
end;


procedure TWCrContrF.edRel_Con_AcredExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg  :  String;
Begin

  vlbSalida := True;
  vlStrMesg := '';

  If (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    objeto.REL_CON_ACRED.GetFromControl;

    If (objeto.REL_CON_ACRED.AsString = '') Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbledRelConAcred.Caption;
       End
  End;
  
  InterForma1.ValidaExit(edRel_Con_Acred, vlbSalida, vlStrMesg, True);

end;


procedure TWCrContrF.ListaPersonasRel;
var
  vlSQL : String;
  vgQryPersonasRel, qry : TQuery;
begin
  sgPersonasRel.Clear('NO EXISTEN DATOS'#30'>C');
  if edID_CONTRATO.Text <> '' then
  begin

    vlSQL :=
      ' select cf.id_persona_rel, p.Nombre, cf.rel_con_acred,' +
      ' case cf.tipo_rel ' +
      '   when ''AV'' then ''AVAL'' ' +
      '   when ''OT'' then ''OTRO'' ' +
      ' end as tipo_rel ' +
      ' from cr_am_contrF cf, persona p' +
      ' where cf.id_persona_rel = p.id_persona ' +
      '  and id_contrato = ' + edID_CONTRATO.Text;

    vgQryPersonasRel  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(vgQryPersonasRel) Then
    begin
      try
      vgQryPersonasRel.FieldByName('id_persona_rel').DisplayLabel := 'Persona Rel';
      vgQryPersonasRel.FieldByName('id_persona_rel').DisplayWidth := 12;
      vgQryPersonasRel.FieldByName('Nombre').DisplayLabel := 'Nombre';
      vgQryPersonasRel.FieldByName('Nombre').DisplayWidth := 40;
      vgQryPersonasRel.FieldByName('tipo_rel').DisplayLabel := 'Tipo Relación';
      vgQryPersonasRel.FieldByName('tipo_rel').DisplayWidth := 14;
      vgQryPersonasRel.FieldByName('rel_con_acred').DisplayLabel := 'Relación';
      vgQryPersonasRel.FieldByName('rel_con_acred').DisplayWidth := 40;

      sgPersonasRel.AddQry(vgQryPersonasRel,True,True,-1,-1,-1,True);
      finally vgQryPersonasRel.Free;
      end;
    end;

  end;



    vlSQL :=
    ' SELECT DCTO.ID_CONTRATO AS CHEQUERA,  ' +
    '      SDO_EFE_VIRT AS SALDO  ' +
    ' FROM  ' +
    '      CR_ACREDITADO CA,  ' +
    '      CONTRATO CTO,     ' +
    '      DV_CONTRATO DCTO,  ' +
    '      CR_CRED_CHEQ CCC,  ' +
    '      PERSONA P,   ' +
    '      PERSONA_FISICA PF,  ' +
    '      PERSONA_MORAL PM,  ' +
    '      MONEDA M, ' +
    '      (   ' +
    '          SELECT ID_CTO_LIQ, SUM(IMP_NETO) AS SUM_IMP_NETO  ' +
    '          FROM CR_TRANSACCION  ' +
    '          WHERE F_OPERACION = SYSDATE ' +
    '            AND CVE_OPERACION = (SELECT CVE_OPE_REM_INT FROM CR_PARAMETRO  ' +
    '                                 WHERE CVE_PARAMETRO = ''CRE'') ' +
    '            AND SIT_TRANSACCION = ''AC''    ' +
    '            AND ID_TRANS_CANCELA IS NULL  ' +
    '          GROUP BY ID_CTO_LIQ  ' +
    '      )  CT  ' +
    ' WHERE 1=1  ' +
    '    AND CTO.ID_TITULAR = CA.ID_ACREDITADO   ' +
    '    AND CTO.ID_CONTRATO = DCTO.ID_CONTRATO  ' +
    '    AND CT.ID_CTO_LIQ (+)= DCTO.ID_CONTRATO  ' +
    '    AND CCC.SIT_CHEQUERA (+)= ''AC''   ' +
    '    AND CTO.ID_CONTRATO = CCC.CUENTA_BANCO (+) ' +
    '    AND CCC.ID_ACREDITADO (+)= CTO.ID_TITULAR  ' +
    '    AND P.ID_PERSONA = CTO.ID_TITULAR ' +
    '    AND PF.ID_PERSONA (+)= P.ID_PERSONA ' +
    '    AND PM.ID_PERSONA (+)= P.ID_PERSONA ' +
    '    AND M.CVE_MONEDA = CTO.CVE_MONEDA ' +
    '    AND CA.ID_ACREDITADO = ';

    if  edID_PERSONA.Text <> '' then vlSQL:= vlSQL + edID_PERSONA.Text
                                  else vlSQL:= vlSQL + '0';


    qry  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(qry) Then
    begin
      try
      qry.FieldByName('CHEQUERA').DisplayLabel := 'CHEQUERA';
      qry.FieldByName('CHEQUERA').DisplayWidth := 14;
      qry.FieldByName('SALDO').DisplayLabel := 'SALDO';
      qry.FieldByName('SALDO').DisplayWidth := 20;

      edNumChequera.TEXT:= qry.FieldByName('CHEQUERA').AsString;
      edSaldoChequera.TEXT:= qry.FieldByName('SALDO').AsString;
      finally qry.Free;
      end;
    end;

end;


procedure TWCrContrF.InterForma1Buscar(Sender: TObject);
begin
  if objeto.InternalBusca then
  begin
    objeto.Promotor.FindKey([Objeto.Contrato.ID_PROM_ADMON.AsString]);
    ListapersonasRel;
    ColocaDatosDelContrato;
  end;

end;

procedure TWCrContrF.InterForma1DespuesAceptar(Sender: TObject);
begin
  ListapersonasRel;
  ColocaDatosDelContrato;
end;

procedure TWCrContrF.ColocaDatosDelContrato;
var
  SQL : String;
  qyQuery : TQuery;
begin
//  if objeto.Modo = moBrowse then
//  begin

    SQL :=
        ' select  con.ID_TITULAR, crc.ID_PROM_ADMON,  crc.CVE_PRODUCTO_CRE, crc.CVE_PRODUCTO_CRE, crc.F_ALTA, crc.DIAS_PLAZO, crc.F_VENCIMIENTO, crc.IMP_AUTORIZADO '
      + ' from cr_contrato crc, contrato con where crc.id_contrato = con.id_contrato and crc.ID_Contrato = ' + Objeto.ID_CONTRATO.AsString  ;


      qyQuery  := GetSQLQueryNoNil(SQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, True);

    If Assigned(qyQuery) Then
    try
      If not (qyQuery.IsEmpty) Then
      with objeto do
      begin
        edID_PROMOTOR.Text:=      qyQuery.FieldByName('ID_PROM_ADMON').AsString;
        edCVE_PRODUCTO_CRE.Text:= qyQuery.FieldByName('CVE_PRODUCTO_CRE').AsString;
        edIMP_CREDITO.Text:=      qyQuery.FieldByName('IMP_AUTORIZADO').AsString;
        edF_VENCIMIENTO.Text:=    qyQuery.FieldByName('F_VENCIMIENTO').AsString;
        edPlazoContrato.Text:=    qyQuery.FieldByName('DIAS_PLAZO').AsString;
        edF_ALTA.Text:=           qyQuery.FieldByName('F_ALTA').AsString;
        edID_PERSONA.Text :=      qyQuery.FieldByName('ID_TITULAR').AsString;
        //*Contrato.FindKey([ID_CONTRATO.AsString]);
        Acreditado.FindKey([edID_PERSONA.Text]);
        Promotor.FindKey([edID_PROMOTOR.Text]);
        //Contrato.Producto.FindKey([edCVE_PRODUCTO_CRE.Text]);
        //Contrato.Contrato.FindKey([ID_CONTRATO.AsString]);
      end;
    finally
      qyQuery.Free;
    end;
//  end;
end;


procedure TWCrContrF.sgPersonasRelDblClick(Sender: TObject);
var
  row : Integer;
  persrel   : String;
begin
  if objeto.Modo = moBrowse then
  begin
    row := sgPersonasRel.SG.Row;
    persrel := sgPersonasRel.SG.Cells[3,row];

    Objeto.FindKey([edID_CONTRATO.Text, persrel]);
    objeto.Promotor.FindKey([Objeto.Contrato.ID_PROM_ADMON.AsString]);
    ColocaDatosDelContrato;
  end;
end;

procedure TWCrContrF.InterForma1DespuesModificar(Sender: TObject);
begin
  edIDPersonaRel.SetFocus;
end;

end.


