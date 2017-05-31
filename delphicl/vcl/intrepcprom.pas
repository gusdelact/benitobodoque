Unit IntRepCProm;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, StdCtrls, ExtCtrls, Menus, Buttons, InterApl, IntFrm, IntUnNeg,
  IntFind, IntTCto, db, dbTables, IntGCto, IntLinkit, UnSql2, ComCtrls,
  IntDtPk, intRepPromDet, IntDocumCtto
  ,IntEmpre   //Buscador de Empresa
  ,IntProd, IntSGCtrl    // Producto, tipo de Contrato
  ;
Const
   cCTTO_AC = 0;
   cCTTO_IN = 1;

Type
  TRepCProm = class;

  TwRepCProm = class(TForm)
	 InterForma1: TInterForma;
    rgSitContrato: TRadioGroup;
    edIdPromotorActual: TEdit;
    sbPromotorActual: TBitBtn;
    edNomPromotorActual: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edIdPromotorAnterior: TEdit;
    sbPromotorAnterior: TBitBtn;
    edNomPromotorAnterior: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    edFCambioIni: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    edFCambioFin: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    Label4: TLabel;
    edIdEmpresa: TEdit;
    sbEmpresa: TSpeedButton;
    edNomEmpresa: TEdit;
    lbCveTipContrato: TLabel;
    edCveTipContrato: TEdit;
    sbBuscaTipoContrato: TSpeedButton;
    edDescTipoContra: TEdit;
    SGCtrl1: TSGCtrl;
	 procedure InterForma1Preview(Sender: TObject);
	 procedure InterForma1Imprimir(Sender: TObject);
	 procedure FormShow(Sender: TObject);
	 procedure sbPromotorActualClick(Sender: TObject);
	 procedure sbPromotorAnteriorClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure sbEmpresaClick(Sender: TObject);
    procedure sbBuscaTipoContratoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
	 { Private declarations }
  protected
  public
	 { Public declarations }
     Objeto: TRepCProm;

     Procedure Impresion(Preview: Boolean);
     procedure llenar (sql : String);
  end;

  TRepCProm = class(TInterFrame)
  private
  public
     Id_PromotorActual       : TInterCampo;
     Id_PromotorAnterior     : TInterCampo;
     FCambioIni              : TInterCampo;
     FCambioFin              : TInterCampo;

     Id_Empresa              : TInterCampo;
     Sit_Contrato            : TInterCampo;
     Cve_Tip_contrato        : TInterCampo;
     Empresa                 : TEmpresa;

     PromotorActual          : TGpoCto;
     PromotorAnterior        : TGpoCto;

     TipoCto   : TTipoCto;

     Constructor Create (AOwner: TComponent); override;
     Destructor  Destroy; override;
     Procedure   DataBaseChange; override;
     function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

  end;

Var
   wRepCProm: TwRepCProm;

Implementation

Uses RepCProm;

{$R *.DFM}

(************************************************************************)
(*															CLASE TREPCPROM					*)
(************************************************************************)
procedure TwRepCProm.llenar (sql : String);
var
    sQryInfoBD    : TQuery;
    vRespuesta    : Integer;
    vlCampo       : String;
    vlCuadrotexto : Integer;
    vlConsulta    : String;
begin
   vlCuadrotexto  := 1;
   vlConsulta := ' select a.id_fol_cambio,    a.cve_aplicacion,  a.cve_gpo_motivo,  a.cve_motivo, ' +
         '        a.id_contrato,      a.id_promotor_ant, a.id_promotor_nvo, a.f_registro, ' +
         '        a.cve_usu_registro, b.id_empresa,      b.id_entidad,      b.sit_contrato, ' +
         '        c.nombre, empresa.nombre as nom_empresa, sucursal.desc_entidad as sucursal, ' +
         '        promotor_ant.nombre as nom_prom_anterior, ' +
         '        promotor_nvo.nombre as nom_prom_actual, mot.desc_motivo ' +
         '        , percaptura.nombre as usuario_captura ' +
         '   from contrato_campro a ' +
         '    join contrato b ' +
         '                 on b.id_contrato = a.id_contrato ' +
         '    join persona c ' +
         '                 on c.id_persona = b.id_titular ' +
         '    join persona promotor_ant ' +
         '                 on promotor_ant.id_persona = a.id_promotor_ant ' +
         '    join persona promotor_nvo ' +
         '                 on promotor_nvo.id_persona = a.id_promotor_nvo ' +
         '    join persona empresa ' +
         '                 on empresa.id_persona = b.id_empresa ' +
         '    left outer join unidad_negocio sucursal ' +
         '                 on sucursal.id_entidad = b.id_entidad ' +
         '    left outer join motivo mot on mot.cve_aplicacion = a.cve_aplicacion ' +
         '                              and mot.cve_gpo_motivo = a.cve_gpo_motivo ' +
         '                              and mot.cve_motivo     = a.cve_motivo ' +
         '    join usuario usrcaptura ' +
         '                 on usrcaptura.cve_usuario = a.cve_usu_registro ' +
         '    join persona percaptura ' +
         '                 on percaptura.id_persona = usrcaptura.id_persona ' +
         '   Where 1 = 1 ';

   if (objeto.Empresa.ID_Empresa.AsString <> '') then
      vlConsulta := vlConsulta + ' AND b.id_empresa = ' + quotedstr(objeto.Empresa.ID_Empresa.AsString);
   //if (idContrato <> '') then
   //   vlConsulta := vlConsulta + ' AND b.id_contrato = ' + quotedstr(idContrato);
   if (objeto.TipoCto.Cve_Tip_Contrato.AsString <> '') then
      vlConsulta := vlConsulta + ' AND b.cve_tip_contrato = ' + quotedstr(objeto.TipoCto.Cve_Tip_Contrato.AsString);
   if (objeto.Id_PromotorAnterior.AsInteger <> 0) then
      vlConsulta := vlConsulta + ' AND a.id_promotor_ant = ' + IntTOStr(objeto.Id_PromotorAnterior.AsInteger);
   if (objeto.Id_PromotorActual.AsInteger <> 0) then
      vlConsulta := vlConsulta + ' AND a.id_promotor_nvo = ' + IntTOStr(objeto.Id_PromotorActual.AsInteger);
   if (objeto.Sit_Contrato.AsString <> '') then
      vlConsulta := vlConsulta + ' AND b.sit_contrato = ' + quotedstr(objeto.Sit_Contrato.AsString);
   if (objeto.FCambioIni.AsString <> '') then
      vlConsulta := vlConsulta + ' AND a.f_registro >= ' + ' TO_DATE(''' + objeto.FCambioIni.AsString + ''',''DD/MM/YYYY'') ' ;
   if (objeto.FCambioFin.AsString <> '') then
      vlConsulta := vlConsulta + ' AND a.f_registro <= ' + ' TO_DATE(''' + objeto.FCambioFin.AsString + ''',''DD/MM/YYYY'') ' ;

   vlConsulta := vlConsulta + ' ORDER BY a.id_fol_cambio ';

   sQryInfoBD:=GetSqlQuery(vlConsulta,objeto.apli.DataBaseName, objeto.apli.SessionName,True);
   if (sQryInfoBD <> nil) then
   begin
      if not sQryInfoBD.IsEmpty then
      begin
         sQryInfoBD.FieldByName('ID_FOL_CAMBIO').displayLabel := 'FOL_CAMBIO ' + #30 + '>C';
         sQryInfoBD.FieldByName('ID_FOL_CAMBIO').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('CVE_APLICACION').displayLabel := 'APLICACION ' + #30 + '>C';
         sQryInfoBD.FieldByName('CVE_APLICACION').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('CVE_GPO_MOTIVO').displayLabel := 'GPO_MOTIVO ' + #30 + '>C';
         sQryInfoBD.FieldByName('CVE_GPO_MOTIVO').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('CVE_MOTIVO').displayLabel := 'MOTIVO ' + #30 + '>C';
         sQryInfoBD.FieldByName('CVE_MOTIVO').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('ID_CONTRATO').displayLabel := 'CONTRATO ' + #30 + '>C';
         sQryInfoBD.FieldByName('ID_CONTRATO').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('ID_PROMOTOR_ANT').displayLabel := 'PROMOTOR_ANT ' + #30 + '>C';
         sQryInfoBD.FieldByName('ID_PROMOTOR_ANT').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('ID_PROMOTOR_NVO').displayLabel := 'PROMOTOR_NVO ' + #30 + '>C';
         sQryInfoBD.FieldByName('ID_PROMOTOR_NVO').DisplayWidth    := 14;

         sQryInfoBD.FieldByName('F_REGISTRO').displayLabel := 'F_REGISTRO ' + #30 + '>C';
         sQryInfoBD.FieldByName('F_REGISTRO').DisplayWidth    := 22;

         sQryInfoBD.FieldByName('CVE_USU_REGISTRO').displayLabel := 'CVE_USU_REGISTRO ' + #30 + '>C';
         sQryInfoBD.FieldByName('CVE_USU_REGISTRO').DisplayWidth    := 12;

         sQryInfoBD.FieldByName('ID_EMPRESA').displayLabel := 'EMPRESA ' + #30 + '>C';
         sQryInfoBD.FieldByName('ID_EMPRESA').DisplayWidth    := 12;

         sQryInfoBD.FieldByName('ID_ENTIDAD').displayLabel := 'ENTIDAD ' + #30 + '>C';
         sQryInfoBD.FieldByName('ID_ENTIDAD').DisplayWidth    := 12;

         sQryInfoBD.FieldByName('SIT_CONTRATO').displayLabel := 'SIT_CONTRATO ' + #30 + '>C';
         sQryInfoBD.FieldByName('SIT_CONTRATO').DisplayWidth    := 10;

         sQryInfoBD.FieldByName('NOMBRE').displayLabel := 'CLIENTE ' + #30 + '>C';
         sQryInfoBD.FieldByName('NOMBRE').DisplayWidth    := 35;

         sQryInfoBD.FieldByName('NOM_EMPRESA').displayLabel := 'NOM_EMPRESA ' + #30 + '>C';
         sQryInfoBD.FieldByName('NOM_EMPRESA').DisplayWidth    := 30;

         sQryInfoBD.FieldByName('SUCURSAL').displayLabel := 'SUCURSAL ' + #30 + '>C';
         sQryInfoBD.FieldByName('SUCURSAL').DisplayWidth    := 30;

         sQryInfoBD.FieldByName('NOM_PROM_ANTERIOR').displayLabel := 'NOMBRE DEL PROMOTOR ANTERIOR ' + #30 + '>C';
         sQryInfoBD.FieldByName('NOM_PROM_ANTERIOR').DisplayWidth    := 30;

         sQryInfoBD.FieldByName('NOM_PROM_ACTUAL').displayLabel := 'NOMBRE DEL PROMOTOR ACTUAL ' + #30 + '>C';
         sQryInfoBD.FieldByName('NOM_PROM_ACTUAL').DisplayWidth    := 30;

         sQryInfoBD.FieldByName('DESC_MOTIVO').displayLabel := 'DESCRIPCION DEL MOTIVO ' + #30 + '>C';
         sQryInfoBD.FieldByName('DESC_MOTIVO').DisplayWidth    := 30;

         sQryInfoBD.FieldByName('USUARIO_CAPTURA').displayLabel := 'NOMBRE USUARIO QUE CAPTURA ' + #30 + '>C';
         sQryInfoBD.FieldByName('USUARIO_CAPTURA').DisplayWidth    := 30;

         SGCtrl1.AddQry(sQryInfoBD, True, True, 30, -1, -1, True );

      end
   end
   else
      SGCtrl1.Clear('No hay correos históricos guardados.'#30'>C');
end;

procedure TRepCProm.DataBaseChange;
begin
   inherited;
   Empresa.GetParams(Self);
   TipoCto.GetParams(Self);
end;

Constructor TRepCProm.Create (AOwner: TComponent);
Begin
   inherited;
   Empresa:= TEmpresa.Create(Self);
   Empresa.UseLink:= True;
   Empresa.ShowMenuClear:= True;

   Id_PromotorActual   := CreaCampo('ID_PROMOTOR', ftInteger, tsNinguno, tsNinguno, False);
   Id_PromotorAnterior := CreaCampo('ID_PROMOTOR', ftInteger, tsNinguno, tsNinguno, False);

   FCambioIni          := CreaCampo('FCAMBIOINI', ftDate, tsNinguno, tsNinguno, False);
   FCambioFin          := CreaCampo('FCAMBIOFIN', ftDate, tsNinguno, tsNinguno, False);

   Id_Empresa          := CreaCampo('ID_EMPRESA', ftInteger, tsNinguno, tsNinguno, False);
   Sit_Contrato        := CreaCampo('SIT_CONTRATO', ftString, tsNinguno, tsNinguno, False);
   Cve_Tip_Contrato    := CreaCampo('CVE_TIP_CONTRATO', ftString, tsNinguno, tsNinguno, False);

   PromotorActual := TGpoCto.Create(self);
   PromotorActual.MasterSource := Self;
   PromotorActual.Id_Pers_Asociad.MasterField := 'ID_PROMOTOR';
   PromotorActual.Id_Grupo.MasterField := 'ID_GRUPO';

   PromotorAnterior := TGpoCto.Create(self);
   PromotorAnterior.MasterSource := Self;
   PromotorAnterior.Id_Pers_Asociad.MasterField := 'ID_PROMOTOR';
   PromotorAnterior.Id_Grupo.MasterField := 'ID_GRUPO';

   TipoCto                   := TTipoCto.Create(Self);
   TipoCto.MasterSource      := Self;

end;

Destructor  TRepCProm.Destroy;
Begin
   If Empresa <> nil Then Empresa.Free; Empresa:= nil;

   If PromotorActual <> nil Then PromotorActual.Free;
   If PromotorAnterior <> nil Then PromotorAnterior.Free;

   If FCambioFin <> nil Then FCambioFin.Free; FCambioFin:= nil;
   If FCambioFin <> nil Then FCambioFin.Free; FCambioFin:= nil;
   //if TipoCto <> nil then Producto.Free;
   Inherited;
end;

Function TRepCProm.ShowWindow(FormaTipo: TFormaTipo) : Integer;
var
   w: TwRepCProm;
begin
   w:= TwRepCProm.Create(self);
   try
      W.Objeto                   := Self;
      w.InterForma1.CentrarForma := True;
      W.InterForma1.FormaTipo    := ftImprimir;
      W.InterForma1.Funcion      := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                 := W.InterForma1.ModalResult;
   finally
      w.Free;
   end;
end;

(************************************************************************)
(*															FORMA								*)
(************************************************************************)
procedure TwRepCProm.FormShow(Sender: TObject);
begin
   Objeto.Empresa.ID_Empresa.Control := edIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNomEmpresa;
   edIdEmpresa.PopupMenu := Objeto.Empresa.PopMenu;

   Objeto.PromotorActual.Id_Pers_Asociad.Control := edIdPromotorActual;
   Objeto.PromotorActual.PromAsociado.Nombre.Control := edNomPromotorActual;

   Objeto.PromotorAnterior.Id_Pers_Asociad.Control := edIdPromotorAnterior;
   Objeto.PromotorAnterior.PromAsociado.Nombre.Control := edNomPromotorAnterior;

   Objeto.FCambioIni.Control := edFCambioIni;
   Objeto.FCambioFin.Control := edFCambioFin;

   Objeto.TipoCto.Cve_Tip_Contrato.Control    := edCveTipContrato;
   Objeto.TipoCto.Desc_Tipo_Contra.Control    := edDescTipoContra;
   Objeto.TipoCto.ShowMenuCatalogo            := False;
   Objeto.TipoCto.ShowMenuReporte             := False;
   Objeto.TipoCto.ShowMenuClear               := True;

end;

Procedure TwRepCProm.Impresion(Preview: Boolean);
Begin
   {PROMOTOR ACTUAL}
   If Objeto.PromotorActual.Active Then
   Begin
      Objeto.Id_PromotorActual.AsString := edIdPromotorActual.Text;
   end
   else
   Begin
      Objeto.Id_PromotorActual.IsNull := True;
   end;

   {PROMOTOR ANTERIOR}
   If Objeto.PromotorAnterior.Active Then
   Begin
      Objeto.Id_PromotorAnterior.AsString := edIdPromotorAnterior.Text;
   end
   else
   Begin
      Objeto.Id_PromotorAnterior.IsNull := True;
   end;

   {SITUACION DEL CONTRATO}
   Case rgSitContrato.ItemIndex of
      cCTTO_AC:	Objeto.Sit_Contrato.asString := 'AC';
      cCTTO_IN: Objeto.Sit_Contrato.asString := 'IN';
      else
         Objeto.Sit_Contrato.IsNull := True;
   end;
   objeto.GetFromControl;
   llenar('');
   ExecuteRepCProm(Objeto, Preview,
                   Objeto.Empresa.ID_Empresa.AsString,
                   objeto.Id_PromotorAnterior.AsInteger,
                   objeto.Id_PromotorActual.AsInteger,
                   objeto.Sit_Contrato.AsString,
                   objeto.FCambioIni.AsString,
                   objeto.FCambioFin.AsString,
                   '',
                   Objeto.TipoCto.Cve_Tip_Contrato.AsString);
end;

procedure TwRepCProm.InterForma1Preview(Sender: TObject);
begin
   Impresion(True);
end;

procedure TwRepCProm.InterForma1Imprimir(Sender: TObject);
begin
   Impresion(False);
end;

procedure TwRepCProm.sbPromotorActualClick(Sender: TObject);
begin
   Objeto.PromotorActual.Busca;
end;

procedure TwRepCProm.sbPromotorAnteriorClick(Sender: TObject);
begin
   Objeto.PromotorAnterior.Busca;
end;

procedure TwRepCProm.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwRepCProm.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwRepCProm.sbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.Busca;
end;

procedure TwRepCProm.sbBuscaTipoContratoClick(Sender: TObject);
begin
   Objeto.TipoCto.Busca;
end;

procedure TwRepCProm.FormDestroy(Sender: TObject);
begin
   Objeto.Empresa.ID_Empresa.Control := nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := nil;

   Objeto.PromotorActual.Id_Pers_Asociad.Control := nil;
   Objeto.PromotorActual.PromAsociado.Nombre.Control := nil;

   Objeto.PromotorAnterior.Id_Pers_Asociad.Control := nil;
   Objeto.PromotorAnterior.PromAsociado.Nombre.Control := nil;

   Objeto.FCambioIni.Control := nil;
   Objeto.FCambioFin.Control := nil;

   Objeto.TipoCto.Cve_Tip_Contrato.Control    := nil;
   Objeto.TipoCto.Desc_Tipo_Contra.Control    := nil;

end;

end.

