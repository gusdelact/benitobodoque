//------------------------------------------------------------------------------
// Función    : Reporte de Aviso de Privacidad
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 07 de Agosto del 2013
//------------------------------------------------------------------------------

unit IntRpAvisoPriv;
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, InterEdit,
   IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, IntSGCtrl, Grids,
   Spin, Tabs, UnSubGen, UnGene, Menus, UnFunProcICB;

Type
  TRpAviPriv  = Class;
  TWAvisoPriv = Class(TForm)
    InterForma1 : TInterForma;
    SGCtrl: TSGCtrl;
    bbGenerar: TBitBtn;
    gbAutorizacion: TGroupBox;
    cbAcepto: TCheckBox;
    cbNoAcepto: TCheckBox;
    gbPersona: TGroupBox;
    lSituacion: TLabel;
    gbSituacion: TGroupBox;
    cbActiva: TCheckBox;
    cbInactiva: TCheckBox;
    dtpFecAltaIni: TDateTimePicker;
    lFecAltaSep: TLabel;
    dtpFecAltaFin: TDateTimePicker;
    cbFecAlta: TCheckBox;
    function  ObtenerSQL : String;
    procedure FormShow(Sender : TObject);
    procedure bbGenerarClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TRpAviPriv;
    end;

  TRpAviPriv = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      constructor Create(AOwner : TComponent); override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure   DataBaseChange; override;
   published
      { Published declarations }
   end;
implementation
  {$R *.DFM}

procedure TRpAviPriv.DataBaseChange;
begin
   inherited;
end;

constructor TRpAviPriv.Create(AOwner : TComponent);
begin
   inherited;
   UseQuery        := True;
   ShowMenuReporte := True;
   AutoRefresh     := False;
end;

function TRpAviPriv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWAvisoPriv;
begin
   W := TWAvisoPriv.Create(Self);
   try
      W.Objeto                      := Self;
      W.InterForma1.InterFrame      := Self;
      W.InterForma1.FormaTipo       := ftImprimir;
      W.InterForma1.ShowGrid        := False;
      W.InterForma1.ShowNavigator   := False;
      W.InterForma1.ShowBtnPreview  := False;
      W.InterForma1.ShowBtnImprimir := False;
      W.InterForma1.Funcion         := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                    := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWAvisoPriv.InterForma1DespuesShow(Sender: TObject);
begin
  InterForma1.F.btAyuda.Caption := '&Limpiar';
  InterForma1.F.btAyuda.Hint    := 'Limpia todos los campos en pantalla';
end;

procedure TWAvisoPriv.InterForma1BtnAyudaClick(Sender: TObject);
begin
   Objeto.Active      := False;
   cbNoAcepto.Checked := False;
   cbInactiva.Checked := False;
   cbAcepto.Checked   := True;
   cbActiva.Checked   := True;
   cbFecAlta.Checked  := True;
   dtpFecAltaIni.Date := Objeto.Apli.DameFechaEmpresaDia(cLiqHoy);
   dtpFecAltaFin.Date := Objeto.Apli.DameFechaEmpresaDia(cLiqHoy);
   SGCtrl.ColCount    := 0;
end;

procedure TWAvisoPriv.FormShow(Sender: TObject);
begin
   InterForma1BtnAyudaClick(Sender);
end;

function TWAvisoPriv.ObtenerSQL : String;
var
   vSQL : String;
begin
   vSQL := '';

   if ((cbAcepto.Checked) and (not cbNoAcepto.Checked)) or ((not cbAcepto.Checked) and (cbNoAcepto.Checked)) then
   begin
      if cbAcepto.Checked   then  vSQL := vSQL + ' and pf.b_aviso_priv = ' + QuotedStr(cVerdadero);
      if cbNoAcepto.Checked then  vSQL := vSQL + ' and pf.b_aviso_priv = ' + QuotedStr(cFalso);
   end;
   if ((cbActiva.Checked) and (not cbInactiva.Checked)) or ((not cbActiva.Checked) and (cbInactiva.Checked)) then
   begin
      if cbActiva.Checked   then  vSQL := vSQL + ' and per.sit_persona = ' + QuotedStr(cActivo);
      if cbInactiva.Checked then  vSQL := vSQL + ' and per.sit_persona = ' + QuotedStr(cInactivo);
   end;
   if trim(vSQL) <> '' then
      vSQL := 'where ' + copy(vSQL, 5, length(vSQL));

   vSQL := 'select pf.nombre_persona, pf.apellido_paterno, pf.apellido_materno, '
         + '      (rfc.siglas_rfc || rfc.f_rfc || rfc.homoclave_rfc) as rfc, '
         + '       decode(per.sit_persona, ' + QuotedStr(cActivo) + ', ''Activa'', ''Inactiva'') as situacion '
         + '  from persona_fisica     pf '
         + '       inner join persona per on per.id_persona = pf.id_persona '
         + '       left join rfc          on rfc.id_persona = pf.id_persona '
         + trim(vSQL)
         + ' order by pf.b_aviso_priv, pf.id_persona';

   result := vSQL;
end;

procedure TWAvisoPriv.bbGenerarClick(Sender: TObject);
var
   Qry : TQuery;
begin
   if Objeto.ValidaAccesoEsp('AP_GENERAR', True, True) then
   begin
      try
         SGCtrl.ColCount := 0;

         if (not cbAcepto.Checked) and (not cbNoAcepto.Checked) then
         begin
            cbAcepto.SetFocus;
            raise EInterFrame.Create('Seleccione el Aviso de Privacidad');
         end;
         if cbFecAlta.Checked then
         begin
            if dtpFecAltaIni.Date > dtpFecAltaFin.Date then
            begin
               dtpFecAltaIni.SetFocus;
               raise EInterFrame.Create('La fecha de alta inicial debe ser menor a la fecha de alta final');
            end;
         end;
         if (not cbActiva.Checked) and (not cbInactiva.Checked) then
         begin
            cbActiva.SetFocus;
            raise EInterFrame.Create('Seleccione la Situacion de Persona');
         end;

         try
            Qry := GetSqlQuery(ObtenerSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
            if Qry = nil then
               raise EInterFrame.Create('No existe informacion para ser presentada...');
            with Qry do
            begin
               FieldByName('NOMBRE_PERSONA').DisplayWidth   := 25;
               FieldByName('APELLIDO_PATERNO').DisplayWidth := 25;
               FieldByName('APELLIDO_MATERNO').DisplayWidth := 25;
               FieldByName('RFC').DisplayWidth              := 18;
               FieldByName('SITUACION').DisplayWidth        := 8;
            end;
            with SGCtrl do
            begin
                ColCount:= 5;
                BeginGrid;
                Titulo1 := 'Reporte de Aviso de Privacidad';
                SetPrintCol(kNoPrint);
                AddTitle(SGCtrl.Titulo1, tcCenter);
                LeftCol := 0;
                Columnas[ 0].SetInfo ('A0', 'Nombre',           100, tcLeft, '', True);
                Columnas[ 1].SetInfo ('A1', 'Apellido Paterno', 100, tcLeft, '', True);
                Columnas[ 2].SetInfo ('A2', 'Apellido Materno', 100, tcLeft, '', True);
                Columnas[ 3].SetInfo ('A3', 'RFC',              100, tcLeft, '', True);
                Columnas[ 4].SetInfo ('A4', 'Situacion',        100, tcLeft, '', True);
                SetPrintCol(kPrintHeader);
                NextRow;
                EndCaption;
                AddQry(Qry, False, False, -1, 0, -1, False);
            end;
         finally
            if Qry <> nil then
            begin
               Qry.Free;
               Qry := nil;
            end;
         end;
      except
         on e: EInterFrame do
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
      end;
   end;
end;
end.
