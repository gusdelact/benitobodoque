// Sistema         : Clase de CRBITPROD
// Fecha de Inicio : 18/08/2014
// Función forma   : Clase de CRBITPROD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntCRBCHLGPP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntLinkit,
IntParamCre, IntSGCtrl, QuickRpt, InterMemo,
QRExport
;


Type
 TCRBCHLGPP= class;

  TWCRBCHLGPP=Class(TForm)
    InterForma1             : TInterForma;
    lblFechaAlta: TLabel;
    Label3: TLabel;
    edFIniAlta: TEdit;
    stpInicioAlta: TInterDateTimePicker;
    Label4: TLabel;
    edFFinAlta: TEdit;
    stpFinAlta: TInterDateTimePicker;
    chkFechaAlta: TCheckBox;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    sgcData: TSGCtrl;
    bGenera: TButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure chkFechaAltaClick(Sender: TObject);
    procedure bGeneraClick(Sender: TObject);

    procedure ConsultaRegistros;

    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCRBCHLGPP;

    VGSQLGenCons         : String;
end;
 TCRBCHLGPP= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        vgIdSolicitud : String;
        vgPeriodo     : String;

        { Public declarations }
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


constructor TCRBCHLGPP.Create( AOwner : TComponent );
begin Inherited;
    StpName  := ' ';
    UseQuery := False;
    HelpFile := 'InTCRBCHLGPP.Hlp';
    ShowMenuReporte:=True;
end;

Destructor TCRBCHLGPP.Destroy;
begin
   //end if;

  inherited;
end;


function TCRBCHLGPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCRBCHLGPP;
begin
   W:=TWCRBCHLGPP.Create(Self);
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


Function TCRBCHLGPP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrbitpr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCRBCHLGPP.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRBITPROD********************)
(*                                                                              *)
(*  FORMA DE CRBITPROD                                                            *)
(*                                                                              *)
(***********************************************FORMA CRBITPROD********************)

procedure TWCRBCHLGPP.FormShow(Sender: TObject);
begin
      //Objeto
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    InterForma1.BtnImprimir.Visible := False;
    InterForma1.BtnPreview.Visible  := False;
end;

procedure TWCRBCHLGPP.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCRBCHLGPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCRBCHLGPP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCRBCHLGPP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrbitprod.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWCRBCHLGPP.chkFechaAltaClick(Sender: TObject);
begin
    if not chkFechaAlta.Checked then
    begin
        edFIniAlta.Text := '';
        edFFinAlta.Text := '';
    end;
end;

procedure TWCRBCHLGPP.bGeneraClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRBCHLGPP_CONSU',True,True) then
   Begin
       //Validaciones

       if ( chkFechaAlta.checked ) then
       begin
           try
               if (StrToDate(edFIniAlta.Text) > StrToDate(edFFinAlta.Text)) then
               begin
                   ShowMessage('La "Fecha de Alta" inicial no debe ser mayor a la final, rectifique.');
                   Exit;
               end;
           except
               On E: Exception Do Begin
                   ShowMessage('El dato capturado para Fecha Alta es incorrecto, rectifique.');
                   abort;
               end;
           end;
       end;

       //Consulta
       Screen.Cursor:=crHourGlass;
       ConsultaRegistros;
       Screen.Cursor:=crDefault;
   end;
end;

procedure TWCRBCHLGPP.ConsultaRegistros;
var
    Q               : TQuery;
    VGSQLGenCons    : String;
begin
    //Nota: en ésta tabla solo hay altas o eliminaciones.
    //las columnas de cambios no son funcionales ya que no existen cambios en los campos.
    //1 as l, --en estos casos que en la tabla no  se dan los updates, se requiere presente todos los delete efectuados.    


    //Arma consulta
    VGSQLGenCons := ' select ' + #13 +
                    ' --     regs.*, ' + #13 +
                    ' --     regs.L, ' + #13 +
                    ' --     regs.B_AD, ' + #13 +
                    '      CAST(regs.ID_SOLICITUD as NUMBER(10)) as ID_SOLICITUD, ' + #13 +
                    ' --     case when ID_SOLICITUD <> lag(ID_SOLICITUD) over (partition by ID_SOLICITUD order by fh_registro) then ''SI'' else ''NO'' end cambio_ID_SOLICITUD, ' + #13 +
                    '      CAST(regs.PERIODO as NUMBER(6)) as PERIODO, ' + #13 +
                    '      CAST(regs.ID_AUDIT as NUMBER(10)) as FOL_CAMBIO, ' + #13 +
                    ' --     regs.CVE_TIPO_EVENTO, ' + #13 +
                    '      case ' + #13 +
                    '      when regs.CVE_TIPO_EVENTO = ''CREATE'' then ''ALTA'' ' + #13 +
                    '      when regs.CVE_TIPO_EVENTO = ''UPDATE'' then ''CAMBIO'' ' + #13 +
                    '      when regs.CVE_TIPO_EVENTO = ''DELETE'' then ''ELIMINA'' ' + #13 +
                    '      end as CVE_TIPO_EVENTO, ' + #13 +
                    '      to_char(cast(regs.FH_REGISTRO as date), ''DD/MM/YYYY'') as F_REGISTRO, ' + #13 +
                    '      to_char(cast(regs.FH_REGISTRO as date), ''HH12:MI:SS AM'') as HORA_REGISTRO, ' + #13 +
                    '      regs.CVE_USUARIO AS CVE_USU_REG_EVE, ' + #13 +
                    '      CAST(regs.ID_CONTRATO as NUMBER(10)) as ID_CONTRATO, ' + #13 +
                    '      CAST(regs.SIT_GAR_CTO as VARCHAR2(2)) as SIT_GAR_CTO, ' + #13 +
                    '      to_date(regs.F_ALTA, ''DD/MM/YYYY HH12:MI:SS AM'') as F_ALTA, ' + #13 +
                    '      CAST(regs.CVE_USU_ALTA as VARCHAR2(8)) as CVE_USU_ALTA ' + #13 +
                    ' from   (select   * ' + #13 +
                    '         from     (select 1 as l, ' + #13 +
                    '                          his.* ' + #13 +
                    '                   from   (select h.b_ad, ' + #13 +
                    '                                  h.cve_tipo_evento, ' + #13 +
                    '                                  h.fh_registro, ' + #13 +
                    '                                  h.cve_usuario, ' + #13 +
                    '                                  det.id_audit, ' + #13 +
                    '                                  det.campo, ' + #13 +
                    '                                  det.valor ' + #13 +
                    '                           from   corp_audit_cambio h, corp_audit_cambio_det det ' + #13 +
                    '                           where  h.origen_datos = ''CR_GA_GAR_CTO_PP_HIS'' ' + #13 +
                    '                           and    h.id_audit = det.id_audit) ' + #13 +
                    '                           pivot(MAX(valor) FOR campo IN(''ID_SOLICITUD'' as "ID_SOLICITUD", ' + #13 +
                    '                                                         ''PERIODO'' as "PERIODO", ' + #13 +
                    '                                                         ''ID_CONTRATO'' as "ID_CONTRATO", ' + #13 +
                    '                                                         ''SIT_GAR_CTO'' as "SIT_GAR_CTO", ' + #13 +
                    '                                                         ''F_ALTA'' as "F_ALTA", ' + #13 +
                    '                                                         ''CVE_USU_ALTA'' as "CVE_USU_ALTA")) his ' + #13 +
                    '                  ) ' + #13 +
                    '         where    1 = 1 ' + #13 +
                    '         and      (   b_ad = ''D'' ' + #13 +
                    '                   or l = 1) ' + #13 +
                    '         order by fh_registro) regs ' + #13 +
                    ' where ' + #13 +
                    '       regs.ID_SOLICITUD = NVL('+ objeto.vgIdSolicitud + ', regs.ID_SOLICITUD) --PARAMETRO1-- ' + #13 +
                    '   and regs.PERIODO      = NVL('+ objeto.vgPeriodo + ', regs.PERIODO) --PARAMETRO2-- ' + #13;

    //FILTROS
    if chkFechaAlta.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons +
                    '   and trunc(regs.FH_REGISTRO) between to_date(' + #39 + edFIniAlta.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' +
                    '                                   and to_date(' + #39 + edFFinAlta.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13;
    end;


    //ORDEN - ya viene ordenada
    //    VGSQLGenCons := VGSQLGenCons + ' ORDER BY CRC.ID_CONTRATO ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     //Q.SQL.SaveToFile('c:\VGSQLGenCons.txt');
     try
          if Q <> nil then
          begin
               Q.FieldByName('ID_SOLICITUD').DisplayWidth           := 18;
               Q.FieldByName('PERIODO').DisplayWidth                := 18;
               Q.FieldByName('FOL_CAMBIO').DisplayWidth             := 18;
               Q.FieldByName('CVE_TIPO_EVENTO').DisplayWidth        := 18;
               Q.FieldByName('F_REGISTRO').DisplayWidth             := 18;
               Q.FieldByName('HORA_REGISTRO').DisplayWidth          := 18;
               Q.FieldByName('CVE_USU_REG_EVE').DisplayWidth        := 18;
               Q.FieldByName('ID_CONTRATO').DisplayWidth            := 18;
               Q.FieldByName('SIT_GAR_CTO').DisplayWidth            := 18;
               Q.FieldByName('F_ALTA').DisplayWidth                 := 18;
               Q.FieldByName('CVE_USU_ALTA').DisplayWidth           := 18;
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

end.
