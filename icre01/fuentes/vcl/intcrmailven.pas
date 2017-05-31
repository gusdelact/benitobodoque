// Sistema         : Clase de crmailven
// Fecha de Inicio : 25/01/2013
// Función forma   : Clase de crmailven
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrmailven;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, Grids, IntLinkit,
IntQRPreview, QRPrntr, Printers,
IntGenCre,
InterApl,
IntCrEmisor,  //Emisor
Psock, NMsmtp, QuickRpt, Qrctrls   //cat_email
;


Type
 TCrmailven= class; 

  TWCrmailven=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox2: TGroupBox;
    lbID_EMISOR: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    edF_Corte: TEdit;
    dtpF_CORTEIni: TInterDateTimePicker;
    cbBEMISOR: TCheckBox;
    edEMAIL: TEdit;
    eNombreEntiDesc: TEdit;
    edENT_DESC: TEdit;
    ilEMISOR: TInterLinkit;
    NMSMTP1: TNMSMTP;
    Memo2: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    AdminDest: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure cbBEMISORClick(Sender: TObject);
    procedure DestinatariosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure AdminDestClick(Sender: TObject);
    procedure EnviaCorreos(pApli : TInterApli; PFechaCierre : TDate);

    private
    function ObtenDestinatarios(nID_EMISOR : Integer; pApli : TInterApli) : String;
    function DatosValidos(bRequiereCorreo : Boolean) : Boolean;
    function GeneraCorreodeVencimientos(var ACorreos : TArrayString; var AEmisores : TArrayInteger) : Boolean;

    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrmailven;
end; 
 TCrmailven= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 

        ParamCre    : TParamCre;
        Emisor      : TCrEmisor;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;


var
sAcrobatFile : String;
      vlsql1  : String;
      Query1 : TQuery;


implementation
Uses IntCrrepaler, IntMQrAlerVn, IntCrEmaVen;

{$R *.DFM}


constructor TCrmailven.Create( AOwner : TComponent );
begin Inherited;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;

      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrmailven.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrmailven.Destroy;
begin
   if Emisor <> nil then
      Emisor.Free;
inherited;
end;


function TCrmailven.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrmailven;
begin
   W:=TWCrmailven.Create(Self);
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


Function TCrmailven.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrmailv.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrmailven.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA crmailven********************)
(*                                                                              *)
(*  FORMA DE crmailven                                                            *)
(*                                                                              *)
(***********************************************FORMA crmailven********************)

procedure TWCrmailven.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   edF_Corte.Text := DateToStr(Objeto.Apli.DameFechaEmpresaDia('D000'));

   Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
   Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
   Objeto.Emisor.MInstDesc.DESC_ENT_DES.Control := eNombreEntiDesc;
   Objeto.Emisor.MInstDesc.CVE_FND_ENT_DES.Control := edENT_DESC;
   Objeto.Emisor.GetParams(Objeto);
end;

procedure TWCrmailven.FormDestroy(Sender: TObject);
begin
   Objeto.Emisor.ID_ACREDITADO.Control := nil;
   Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
   Objeto.Emisor.MInstDesc.DESC_ENT_DES.Control := nil;

end;

procedure TWCrmailven.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrmailven.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrmailven.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrmailven.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrmailven.btEMISORClick(Sender: TObject);
var i: integer ;
begin
    Objeto.Emisor.ShowAll := True;
    if Objeto.Emisor.Busca then Begin
        cbBEMISOR.Checked:=True;
        cbBEMISOR.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
        edEMAIL.Text := ObtenDestinatarios(Objeto.Emisor.ID_ACREDITADO.AsInteger, Objeto.Apli);
    end;
end;

procedure TWCrmailven.ilEMISOREjecuta(Sender: TObject);
begin
    if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then Begin
        cbBEMISOR.Checked:=True;
        cbBEMISOR.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
        edEMAIL.Text := ObtenDestinatarios(Objeto.Emisor.ID_ACREDITADO.AsInteger, Objeto.Apli);
    End;
end;

procedure TWCrmailven.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
 Show := True;
end;

function TWCrmailven.ObtenDestinatarios(nID_EMISOR: Integer; pApli : TInterApli): String;
var Qry : TQuery;
    strBuf, strSeparator : String;
    VLSQL : String;
begin
 strSeparator := ''; strBuf := '';
 Qry := TQuery.Create(Nil);
 If Assigned(Qry) Then
  With (Qry) Do
   Try
    Memo2.Lines.Clear;
    DatabaseName := pApli.DataBaseName;
    SessionName := pApli.SessionName;
    SQL.Clear;
    VLSQL := ' SELECT email '+
             '    FROM cr_email_venc'+
             '   WHERE id_emisor = '+IntToStr(nID_EMISOR);

             if edID_EMISOR.Text <> '' then begin
             VLSQL := VLSQL +
             '     AND cve_fnd_ent_des = ' + Objeto.Emisor.CVE_FND_ENT_DES.AsSQL;
             end;
             VLSQL := VLSQL +
             '     AND SIT_MAIL_PER = ''AC''';

    SQL.Add(VLSQL);

    Open; First;
    While Not Eof Do
     Begin
     strBuf := strBuf + strSeparator + FieldByName('EMAIL').AsString;
     strSeparator := C_SEPARATOR_MAIL + ' ';
     Memo2.Lines.Add(FieldByName('EMAIL').AsString);
     Next;
     End;

   Finally
    Close;
    Free;
   End;
  Result := strBuf;
end;

procedure TWCrmailven.cbBEMISORClick(Sender: TObject);
begin
    If not cbBEMISOR.Checked Then Begin
        Objeto.Emisor.Active:=False;
        edEMAIL.Text := '';
        cbBEMISOR.Checked:=False;
        cbBEMISOR.Enabled:=False;
    End Else Begin
        cbBEMISOR.Checked:=True;
        cbBEMISOR.Enabled:=True;
    End;
end;

procedure TWCrmailven.DestinatariosClick(Sender: TObject);
var   CrEmaVen     : TCrEmaVen;
begin
//    CrEmaVen := TCrEmaVen.Create(self);
//    try
//    CrEmaVen.apli := Objeto.Apli;
//    CrEmaVen.ParamCre :=Objeto.ParamCre;
//    CrEmaVen.Catalogo;
//    finally
//    CrEmaVen.Free;
//    end;
end;

procedure TWCrmailven.BitBtn1Click(Sender: TObject);
//var vlfhoy : String;
//    QrAlerVn : TQrAlerVn;
//    A : Array [0..255]  of Char;
//    destin : String;
//    vlidemisact, vlidemisant : String;
//begin
//
//  if edF_Corte.Text = '' then
//  vlfhoy := DateToStr(Objeto.Apli.DameFechaEmpresaDia('D000'))
//  else
//  vlfhoy := edF_Corte.Text;
//
//
//vlsql1 := 'select crd.id_cesion, crc.id_emisor, '+
//                '       (select nombre from persona where id_persona = crc.id_emisor and sit_persona = ''AC'') as nom_emisor, '+
//                '       crc.id_proveedor, '+
//                '       (select nombre from persona where id_persona = crc.id_proveedor and sit_persona = ''AC'') as nom_proveedor, '+
//                '       crd.id_documento, '+
//                '       crd.cve_documento, ctd.desc_documento, crd.tasa_aforo, crd.imp_nominal, '+
//                '       pkgcrperiodo.obtenimpaforo (crd.imp_nominal, crd.tasa_aforo) as imp_aforado, '+
//                '       crd.f_compra, cca.f_vencimiento as f_prog_pago, cca.f_vencimiento - crd.f_compra as plazo, '+
//                '       crd.f_emision, crd.f_ingreso_doc, crd.f_venc_real, '+
//                '       to_date('''+vlfhoy+''',''dd/mm/yyyy'') - crd.f_venc_real as dias_vto_emis, crd.sit_documento'+
//                '  from cr_documento crd, cr_cesion crc, cr_tipo_docto ctd, cr_capital cca '+
//                ' where 1 = 1 '+
//                '   and crc.id_cesion = crd.id_cesion '+
//                '   and ctd.cve_documento = crd.cve_documento '+
//                '   and cca.id_credito = crd.id_cesion '+
//                '   and cca.num_periodo = crd.num_periodo_doc '+
//                '   and (crd.sit_documento in (''AC'',''IM'')'+
//                '   and CRD.F_VENC_REAL < to_date('''+vlfhoy+''',''DD/MM/YYYY''))';
//
//        if edID_EMISOR.Text <> '' then
//                   vlsql1 := vlsql1 +
//                '   and crc.id_emisor = '+ edID_EMISOR.Text;
//
//           vlsql1 := vlsql1 +
//                ' order by id_cesion, id_emisor ';
//
//      Query1 := GetSQLQuery(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
//
// if Query1 <> nil then
//   begin
//   while not Query1.EOF do
//      begin
//        try
//        vlidemisact := Query1.FieldByName('ID_EMISOR').AsString;
//        if (vlidemisact <> vlidemisant )
//        then
//          begin
//            RepAlerVn( vlfhoy,
//                       '',
//                       '',
//                       '',
//                       vlidemisact,
//                       '',
//                       '',
//                       '',
//                       '2',
//                       '',
//                       '',
//                       '', '', '', '', '','',
//                       grDigitaliza,
//                       False, Objeto.Apli );
//
//            sAcrobatFile := 'C:\tmp\Venc_Emisor.pdf';
//            ObtenDestinatarios(StrToInt(vlidemisact));
//            if sAcrobatFile <> '' then
//             Begin
//              NMSMTP1.Host := obtValorGpoCve('VENCEM', 'HOST', Objeto.Apli);
//              NMSMTP1.Port := StrToInt(obtValorGpoCve('VENCEM', 'PORT', Objeto.Apli));
//              NMSMTP1.Connect;
//              NMSMTP1.PostMessage.ToAddress.Assign(Memo2.Lines);
//              NMSMTP1.PostMessage.FromAddress := obtValorGpoCve('VENCEM', 'MAIL_SEND', Objeto.Apli);
//              NMSMTP1.PostMessage.FromName := obtValorGpoCve('VENCEM', 'FROM_NAME', Objeto.Apli);
//              NMSMTP1.PostMessage.Subject := obtValorGpoCve('VENCEM', 'SUBJECT', Objeto.Apli);
//              NMSMTP1.PostMessage.date := FormatDateTime('dd/mm/yyyy hh:nn am/pm', Now);
//              NMSMTP1.PostMessage.Body.Text := obtValorGpoCve('VENCEM', 'BODY0', Objeto.Apli)+coCRLF+coCRLF+obtValorGpoCve('VENCEM', 'BODY1', Objeto.Apli)+obtValorGpoCve('VENCEM', 'BODY2', Objeto.Apli)+vlfhoy+coCRLF+coCRLF+obtValorGpoCve('VENCEM', 'BODY3', Objeto.Apli)+coCRLF+coCRLF+coCRLF+coCRLF+obtValorGpoCve('VENCEM', 'BODY4', Objeto.Apli)+coCRLF+obtValorGpoCve('VENCEM', 'BODY5', Objeto.Apli)+coCRLF+obtValorGpoCve('VENCEM', 'BODY6', Objeto.Apli);
//              NMSMTP1.PostMessage.Attachments.Clear;
//              NMSMTP1.PostMessage.Attachments.Add(sAcrobatFile);
//              NMSMTP1.SubType := mtHTML;
//              NMSMTP1.SendMail;
//              NMSMTP1.Disconnect;
//             end;
//          end;
//
//        finally
//
//        end;
//          vlidemisant  := vlidemisact;
//          Query1.Next;
//      end;
//   end;
begin
    EnviaCorreos(Objeto.Apli,strtodate(edF_Corte.text));
end;


function TWCrmailven.DatosValidos(bRequiereCorreo: Boolean): Boolean;
begin
 Result := True;
 If (Trim(edF_Corte.Text) = '') Then
   Begin
   ShowMessage('Favor de indicar la Fecha de Corte');
   If (edF_Corte.CanFocus) Then edF_Corte.SetFocus;
   Result := False;
   End;
end;

function TWCrmailven.GeneraCorreodeVencimientos(var ACorreos: TArrayString;  var AEmisores: TArrayInteger): Boolean;
begin

end;


procedure TWCrmailven.Label4Click(Sender: TObject);
var   CrEmaVen     : TCrEmaVen;
begin
    CrEmaVen := TCrEmaVen.Create(self);
    try
    CrEmaVen.apli := Objeto.Apli;
    CrEmaVen.ParamCre :=Objeto.ParamCre;
    CrEmaVen.Catalogo;
    finally
    CrEmaVen.Free;
    end;
end;

procedure TWCrmailven.AdminDestClick(Sender: TObject);
var   CrEmaVen     : TCrEmaVen;
begin
    CrEmaVen := TCrEmaVen.Create(self);
    try
    CrEmaVen.apli := Objeto.Apli;
    CrEmaVen.ParamCre :=Objeto.ParamCre;
    CrEmaVen.Catalogo;
    finally
    CrEmaVen.Free;
    end;
end;

procedure TWCrmailven.EnviaCorreos(pApli: TInterApli; PFechaCierre: TDate);
var vlfhoy : String;
    QrAlerVn : TQrAlerVn;
    A : Array [0..255]  of Char;
    destin : String;
    vlidemisact, vlidemisant : String;
begin

  if edF_Corte.Text = '' then
//  vlfhoy := DateToStr(Objeto.Apli.DameFechaEmpresaDia('D000'))
  vlfhoy := DateToStr(pApli.DameFechaEmpresaDia('D000'))

  else
  vlfhoy := edF_Corte.Text;


vlsql1 := 'select crd.id_cesion, crc.id_emisor, '+
                '       (select nombre from persona where id_persona = crc.id_emisor and sit_persona = ''AC'') as nom_emisor, '+
                '       crc.id_proveedor, '+
                '       (select nombre from persona where id_persona = crc.id_proveedor and sit_persona = ''AC'') as nom_proveedor, '+
                '       crd.id_documento, '+
                '       crd.cve_documento, ctd.desc_documento, crd.tasa_aforo, crd.imp_nominal, '+
                '       pkgcrperiodo.obtenimpaforo (crd.imp_nominal, crd.tasa_aforo) as imp_aforado, '+
                '       crd.f_compra, cca.f_vencimiento as f_prog_pago, cca.f_vencimiento - crd.f_compra as plazo, '+
                '       crd.f_emision, crd.f_ingreso_doc, crd.f_venc_real, '+
                '       to_date('''+vlfhoy+''',''dd/mm/yyyy'') - crd.f_venc_real as dias_vto_emis, crd.sit_documento'+
                '  from cr_documento crd, cr_cesion crc, cr_tipo_docto ctd, cr_capital cca '+
                ' where 1 = 1 '+
                '   and crc.id_cesion = crd.id_cesion '+
                '   and ctd.cve_documento = crd.cve_documento '+
                '   and cca.id_credito = crd.id_cesion '+
                '   and cca.num_periodo = crd.num_periodo_doc '+
                '   and (crd.sit_documento in (''AC'',''IM'')'+
                '   and CRD.F_VENC_REAL < to_date('''+vlfhoy+''',''DD/MM/YYYY''))';
                                                
        if edID_EMISOR.Text <> '' then
                   vlsql1 := vlsql1 +
                '   and crc.id_emisor = '+ edID_EMISOR.Text;

           vlsql1 := vlsql1 +
                ' order by id_cesion, id_emisor ';

      Query1 := GetSQLQuery(vlsql1, Papli.DataBaseName, Papli.SessionName, True );

 if Query1 <> nil then
   begin
   while not Query1.EOF do
      begin
        try
        vlidemisact := Query1.FieldByName('ID_EMISOR').AsString;
        if (vlidemisact <> vlidemisant )
        then
          begin
            RepAlerVn( vlfhoy,
                       '',
                       '',
                       '',
                       vlidemisact,
                       '',
                       '',
                       '',
                       '2',
                       '',
                       '',
                       '', '', '', '', '','',
                       grDigitaliza,
                       False, Papli);

            sAcrobatFile := 'C:\tmp\Venc_Emisor.pdf';
           if ObtenDestinatarios(StrToInt(vlidemisact),pApli) <> '' then
           begin
           if sAcrobatFile <> '' then
             Begin
              NMSMTP1.Host := obtValorGpoCve('VENCEM', 'HOST', Papli);
              NMSMTP1.Port := StrToInt(obtValorGpoCve('VENCEM', 'PORT', Papli));
              NMSMTP1.Connect;
              NMSMTP1.PostMessage.ToAddress.Assign(Memo2.Lines);
              NMSMTP1.PostMessage.FromAddress := obtValorGpoCve('VENCEM', 'MAIL_SEND', Papli);
              NMSMTP1.PostMessage.FromName := obtValorGpoCve('VENCEM', 'FROM_NAME', Papli);
              NMSMTP1.PostMessage.Subject := obtValorGpoCve('VENCEM', 'SUBJECT', Papli);
              NMSMTP1.PostMessage.date := FormatDateTime('dd/mm/yyyy hh:nn am/pm', Now);
              NMSMTP1.PostMessage.Body.Text := obtValorGpoCve('VENCEM', 'BODY0', Papli)+coCRLF+coCRLF+obtValorGpoCve('VENCEM', 'BODY1', Papli)+obtValorGpoCve('VENCEM', 'BODY2', Papli)+vlfhoy+coCRLF+coCRLF+obtValorGpoCve('VENCEM', 'BODY3', Papli)+coCRLF+coCRLF+coCRLF+coCRLF+obtValorGpoCve('VENCEM', 'BODY4', Papli)+coCRLF+obtValorGpoCve('VENCEM', 'BODY5', Papli)+coCRLF+obtValorGpoCve('VENCEM', 'BODY6', Papli);
              NMSMTP1.PostMessage.Attachments.Clear;
              NMSMTP1.PostMessage.Attachments.Add(sAcrobatFile);
              NMSMTP1.SubType := mtHTML;
              NMSMTP1.SendMail;
              NMSMTP1.Disconnect;
             end;
           end;

          end;

        finally

        end;
          vlidemisant  := vlidemisact;
          Query1.Next;
      end;
   end;
end;

end.
