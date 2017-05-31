//------------------------------------------------------------------------------
// Función    : Catalogo de Persona Frecuencia Ingresos
// Desarrollo : Abel Alejandro Salazar Carrillo
// Fecha      : Enero del 2013
// Version    : 1.0
//------------------------------------------------------------------------------
Unit IntPerIngPri;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,  Menus, InterEdit,
IntPerFrecue  {Persona Frecuencia         -> PER_FRECUENCIA   },
IntPerFueIng  {Persona Fuente de Ingresos -> PER_FUENTE_INGR  },
IntPerRanIng  {Catalogo de Rango de Ingresos},
IntMon        {Catalogo de Moneda};

Type
 TPerIngPri= class; 

  TWPerIngresPrinci=Class(TForm)
    InterForma1     : TInterForma;
    
    lbIdFteIngr     : TLabel; 
    edIdFteIngr     : TEdit;
    edDescFuenteIngr: TEdit;
    edDescOtro      : TEdit;
    lbDescOtro      : TLabel;
    sbFuenteIngr    : TSpeedButton;
    PopUpFrecuencia : TPopupMenu;
    MenuFrecCatalogo: TMenuItem;
    MenuFrecLimpiar : TMenuItem;
    PopupFuenteIngr : TPopupMenu;
    CatalogoFuenteIngr: TMenuItem;
    LimpiarFuenteIngr : TMenuItem;
    PopupRangoIngresos: TPopupMenu;
    CatalogoRangoIngresos: TMenuItem;
    LimpiarRangoIngresos : TMenuItem;
    Label1: TLabel;
    gpIngMensuales: TGroupBox;
    Label16: TLabel;
    edIdRangoIngreso: TEdit;
    spRangoIngresos: TSpeedButton;
    Label17: TLabel;
    iedMontoMaximo: TInterEdit;
    chbOtroPrg: TCheckBox;
    lbOtroProvienen: TLabel;
    edOtroProvienen: TEdit;
    lbMtoIngreso: TLabel;
    edMtoIngreso: TInterEdit;
    lbCveFrecuencia: TLabel;
    edCveFrecuencia: TEdit;
    SpeedButton2: TSpeedButton;
    edDescFrecuencia: TEdit;
    gpDivisa: TGroupBox;
    sbMoneda: TSpeedButton;
    ieCveMoneda: TInterEdit;
    eDescMoneda: TEdit;
    
    procedure HabilitaPopUpMenu;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure sbFuenteIngrClick(Sender: TObject);
    procedure CatalogoFuenteIngrClick(Sender: TObject);
    procedure edIdFteIngrContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure MenuFrecCatalogoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edCveFrecuenciaContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure isVisibleCampos(visible :Boolean);
    function  EsOtro(Descripcion : String): Boolean;
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chbOtroPrgClick(Sender: TObject);
    procedure CatalogoRangoIngresosClick(Sender: TObject);
    procedure spRangoIngresosClick(Sender: TObject);
    procedure sbMonedaClick(Sender: TObject);
    procedure edDescFuenteIngrChange(Sender: TObject);

    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TPerIngPri;
end; 
 TPerIngPri= class(TInterFrame) 
      private 
      protected
        { protected declarations }
        vIdPersona   : Integer;
        vIdFteIngr   : Integer;
        vCveFrecue   : String;
      public
        { Public declarations }
        IdPersona               : TInterCampo;
        IdFteIngr               : TInterCampo;
        DescOtro                : TInterCampo;
        MtoIngreso              : TInterCampo;
        CveFrecuencia           : TInterCampo;
        IdRangoIng              : TInterCampo;
        B_Otro_prg              : TInterCampo;
        Otros_proviene          : TInterCampo;
        Cve_Moneda              : TInterCampo;


        cvePerJuridica          : String;

        { Instancias a objetos }
        PerFueIng               : TPerFueIng;
        Frecuencia              : TPerFrecue;
        RangoIngreso            : TPerRanIng;
        Moneda                  : TMoneda;

        procedure   DataBaseChange; override;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
        property     pIdPersona : Integer Read vIdPersona Write vIdPersona;
        property     pIdFteIngr : Integer  Read vIdFteIngr Write vIdFteIngr;
        property     pCveFrecue : String  Read vCveFrecue Write vCveFrecue;
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TPerIngPri.Create( AOwner : TComponent ); 
begin Inherited;

      PerFueIng := TPerFueIng.Create(Self);
      PerFueIng.MasterSource := self;
      PerFueIng.Id_Fuente_Ingr.MasterField := 'ID_FUENTE_INGR';

      Frecuencia:= TPerFrecue.Create(Self);
      Frecuencia.MasterSource := self;
      Frecuencia.Clave.MasterField  := 'CVE_FRECUENCIA';

      RangoIngreso:= TPerRanIng.Create(Self);
      RangoIngreso.MasterSource := self;
      RangoIngreso.ID_RANGO_INGRESO.MasterField := 'ID_RANGO_INGRESO';

      Moneda              := TMoneda.Create(Self);
      Moneda.MasterSource := Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

      IdPersona      := CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
      IdFteIngr      := CreaCampo('ID_FUENTE_INGR',ftFloat,tsNinguno,tsNinguno,True);
      DescOtro       := CreaCampo('DESC_OTRO',ftString,tsNinguno,tsNinguno,True);
      MtoIngreso     := CreaCampo('MONTO_INGRESO',ftFloat,tsNinguno,tsNinguno,True);
      CveFrecuencia  := CreaCampo('CVE_FRECUENCIA',ftString,tsNinguno,tsNinguno,True);
      IdRangoIng     := CreaCampo('ID_RANGO_INGRESO',ftFloat,tsNinguno,tsNinguno,True);
      B_Otro_prg     := CreaCampo('B_OTROS_PRG',ftString,tsNinguno,tsNinguno,True);
      Otros_proviene := CreaCampo('OTROS_PROVIENE',ftString,tsNinguno,tsNinguno,True);
      Cve_Moneda     := CreaCampo('CVE_MONEDA',ftFloat,  tsNinguno, tsNinguno, True);

      FKeyFields.Add('ID_PERSONA');
      FKeyFields.Add('ID_FUENTE_INGR');
       
      TableName := 'PER_INGRESO_PRINCIPAL';
      UseQuery  := True;
      HelpFile  := 'IntPerIngPri.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPerIngPri.Destroy;
begin
   if PerFueIng    <> nil then PerFueIng.Free;
   if Frecuencia   <> nil then Frecuencia.Free;
   if RangoIngreso <> nil then RangoIngreso.Free;

   inherited;
end;

procedure TPerIngPri.DataBaseChange;
begin
   PerFueIng.GetParams(Self);
   Frecuencia.GetParams(Self);
   RangoIngreso.GetParams(Self);
   Moneda.GetParams(Self);
   inherited;
end;

function TPerIngPri.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPerIngresPrinci;
begin
   W:=TWPerIngresPrinci.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TPerIngPri.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IPeInPr.it','F,F');
      Try if Active then begin T.Param(0,IdPersona.AsString); 
                               T.Param(1,IdFteIngr.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

(************************* FORMA PER_INGRESO_PRINCIPAL ************************)
(*                                                                            *)
(*  FORMA PER_INGRESO_PRINCIPAL                                               *)
(*                                                                            *)
(************************* FORMA PER_INGRESO_PRINCIPAL ************************)

procedure TWPerIngresPrinci.FormShow(Sender: TObject);
begin
      Objeto.IdFteIngr.Control      := edIdFteIngr;
      Objeto.DescOtro.Control       := edDescOtro;
      Objeto.MtoIngreso.Control     := edMtoIngreso;
      Objeto.CveFrecuencia.Control  := edCveFrecuencia;
      Objeto.IdRangoIng.Control     := edIdRangoIngreso;
      Objeto.B_Otro_prg.Control     := chbOtroPrg;
      Objeto.Otros_proviene.Control := edOtroProvienen;
      Objeto.PerFueIng.Desc_Fuente_Ingr.Control   := edDescFuenteIngr;
      Objeto.Frecuencia.Descripcion.Control       := edDescFrecuencia;
      Objeto.RangoIngreso.MONTO_MAXIMO.Control    := iedMontoMaximo;

      if trim(Objeto.cvePerJuridica) = 'PM' then
      begin
        Objeto.Moneda.Cve_Moneda.Control            := ieCveMoneda;
        Objeto.Moneda.Desc_Moneda.Control           := eDescMoneda;
        Objeto.Moneda.ShowMenuCatalogo              := True;
        Objeto.Moneda.ShowMenuReporte               := False;
        Objeto.Moneda.ShowMenuClear                 := False;
        ieCveMoneda.PopupMenu                       := Objeto.Moneda.PopMenu;
      end
      

end;

procedure TWPerIngresPrinci.FormDestroy(Sender: TObject);
begin
      Objeto.IdFteIngr.Control                  := nil;
      Objeto.DescOtro.Control                   := nil;
      Objeto.MtoIngreso.Control                 := nil;
      Objeto.CveFrecuencia.Control              := nil;
      Objeto.IdRangoIng.Control                 := nil;
      Objeto.B_Otro_prg.Control                 := nil;
      Objeto.Otros_proviene.Control             := nil;
      Objeto.PerFueIng.Desc_Fuente_Ingr.Control := nil;
      Objeto.Frecuencia.Descripcion.Control     := nil;
      if trim(Objeto.cvePerJuridica) = 'PM' then
      begin
        Objeto.Moneda.Cve_Moneda.Control         := nil;
        Objeto.Moneda.Desc_Moneda.Control        := nil;
      end;
end;

procedure TWPerIngresPrinci.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPerIngresPrinci.sbFuenteIngrClick(Sender: TObject);
begin
 Objeto.PerFueIng.BuscaWhereString := 'PER_FUENTE_INGR.B_VAL_PLD = ''V'' ';
if Objeto.PerFueIng.Busca then
    begin
       Objeto.IdFteIngr.AsString := Objeto.PerFueIng.Id_Fuente_Ingr.AsString;
       if EsOtro( Objeto.PerFueIng.DESC_FUENTE_INGR.AsString ) Then
           isVisibleCampos(True)
       else
           isVisibleCampos(False);
    end;

end;

procedure TWPerIngresPrinci.CatalogoFuenteIngrClick(Sender: TObject);
begin
  if edIdFteIngr.Text <> '' then
      Objeto.PerFueIng.FindKey([edIdFteIngr.Text]);

  Objeto.PerFueIng.Catalogo;

  if InterForma1.CanEdit then begin
     if(Objeto.PerFueIng.Active)then  begin
       Objeto.IdFteIngr.AsString := Objeto.PerFueIng.Id_Fuente_Ingr.AsString;
       if EsOtro( Objeto.PerFueIng.DESC_FUENTE_INGR.AsString ) Then
           isVisibleCampos(True)
       else
           isVisibleCampos(False);

     end;
  end;//if
end;

procedure TWPerIngresPrinci.edIdFteIngrContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
   HabilitaPopUpMenu;
end;

procedure TWPerIngresPrinci.HabilitaPopUpMenu;
begin
  PopupFrecuencia.AutoPopup    := InterForma1.BtnAceptar.Enabled;
  PopupFuenteIngr.AutoPopup    := InterForma1.BtnAceptar.Enabled;
end;

procedure TWPerIngresPrinci.MenuFrecCatalogoClick(Sender: TObject);
begin
   Objeto.Frecuencia.Catalogo;
end;

procedure TWPerIngresPrinci.SpeedButton2Click(Sender: TObject);
begin
    if Objeto.Frecuencia.Busca then
    begin
       Objeto.CveFrecuencia.AsString := Objeto.Frecuencia.Clave.AsString;
    end;//if
end;

procedure TWPerIngresPrinci.edCveFrecuenciaContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
   vRealizado : Boolean;
begin
        HabilitaPopUpMenu;
end;

procedure TWPerIngresPrinci.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

   try

      if trim(Objeto.cvePerJuridica) = 'PF' then
      begin
        if trim(edIdFteIngr.Text) = '' then
        begin
           edIdFteIngr.SetFocus;
           raise EInterFrame.Create('Seleccione un tipo de Ingreso');
        end;
      end;

      if EsOtro( Objeto.PerFueIng.DESC_FUENTE_INGR.AsString ) Then
      Begin
         if trim(edDescOtro.text) = '' then
         begin
            edDescOtro.SetFocus;
            raise EInterFrame.Create('Proporcione' + lbOtroProvienen.Caption );
         end;
      end;

      if chbOtroPrg.Checked then
      begin
         if Trim(edOtroProvienen.Text)='' then
         begin
            edOtroProvienen.SetFocus;
            raise EInterFrame.Create('Especifique de donde provienen');
         end;

         if trim(edMtoIngreso.text) = '' then
         begin
            edMtoIngreso.SetFocus;
            raise EInterFrame.Create('Proporcione un Monto del Ingreso');
         end;
         if trim(edCveFrecuencia.text) = '' then
         begin
            edCveFrecuencia.SetFocus;
            raise EInterFrame.Create('Seleccione la Frecuencia');
         end;
      end;

      if trim(Objeto.cvePerJuridica) = 'PM' then
      begin
         if trim(ieCveMoneda.Text) = '' then
         begin
            ieCveMoneda.SetFocus;
            raise EInterFrame.Create('Seleccione un tipo de Divisa');
         end;
      end; 

     Objeto.IdPersona.AsInteger := Objeto.pIdPersona;
     
     Realizado := True;
   except
      on e: EInterFrame do
      begin
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
         Realizado := False;
      end;
   end;
end;

procedure TWPerIngresPrinci.InterForma1DespuesAceptar(Sender: TObject);
begin
   isVisibleCampos(False);
end;

procedure TWPerIngresPrinci.isVisibleCampos(visible :Boolean);
begin
    edDescOtro.Enabled       := visible;
    lbDescOtro.Enabled       := visible;
end;

function  TWPerIngresPrinci.EsOtro(Descripcion : String): Boolean;
begin
   lbOtroProvienen.Enabled  :=  chbOtroPrg.Checked;
   lbMtoIngreso.Enabled     :=  chbOtroPrg.Checked;
   edOtroProvienen.Enabled  :=  chbOtroPrg.Checked;
   edMtoIngreso.Enabled     :=  chbOtroPrg.Checked;
   lbCveFrecuencia.Enabled  :=  chbOtroPrg.Checked;
   edCveFrecuencia.Enabled  :=  chbOtroPrg.Checked;
   SpeedButton2.Enabled     :=  chbOtroPrg.Checked;
   edDescFrecuencia.Enabled :=  chbOtroPrg.Checked;

   if chbOtroPrg.Checked then
   begin
     edOtroProvienen.Color := clWindow;
     edMtoIngreso.Color    := clWindow;
   end
   else
   begin
     edOtroProvienen.Color := clBtnFace;
     edMtoIngreso.Color    := clBtnFace;
   end;


   if Pos('OTRO', Descripcion ) > 0 then
   begin
      EsOtro := True;
      edDescOtro.Color      := clWindow;
   end
   else
   begin
      EsOtro := False;
      edDescOtro.Color      := clBtnFace;
   end;

      
end;

procedure TWPerIngresPrinci.InterForma1DespuesShow(Sender: TObject);
begin
       if EsOtro( Objeto.PerFueIng.DESC_FUENTE_INGR.AsString ) Then
           isVisibleCampos(True)
       else
           isVisibleCampos(False);



      if trim(Objeto.cvePerJuridica) = 'PM' then
      begin
        if  InterForma1.IsNewData then
        begin
          Objeto.IdFteIngr.AsFloat  := 7;
          Objeto.PerFueIng.FindKey([Objeto.IdFteIngr.AsFloat]);
          Objeto.DescOtro.AsString  := 'Ingresos mensuales promedio propios de la operación de la empresa';
        end;
        lbOtroProvienen.Caption   := 'Especifique';
        lbCveFrecuencia.Caption   := 'Periodicidad';
        gpIngMensuales.Top := 0;
        Self.Caption              := 'Ingreso Mensual';
      end
      else
      begin
        gpDivisa.Visible := False;
      end;
end;

procedure TWPerIngresPrinci.chbOtroPrgClick(Sender: TObject);
begin
   EsOtro('');
   if chbOtroPrg.Checked = False then
   begin
      edOtroProvienen.Text  := '';
      edMtoIngreso.Text     := '';
      edCveFrecuencia.Text  := '';
      edDescFrecuencia.Text := '';
   end;

end;

procedure TWPerIngresPrinci.CatalogoRangoIngresosClick(Sender: TObject);
begin
 if edIdRangoIngreso.Text <> '' then
      Objeto.RangoIngreso.FindKey([edIdRangoIngreso.Text]);
  Objeto.RangoIngreso.Catalogo;
  if InterForma1.CanEdit then begin
     if(Objeto.RangoIngreso.Active)then begin
       Objeto.IdRangoIng.AsString := Objeto.RangoIngreso.Id_Rango_Ingreso.AsString;
     end;//if
  end;//if
end;

procedure TWPerIngresPrinci.spRangoIngresosClick(Sender: TObject);
begin
If Objeto.ValidaAccesoEsp('PF_RGOING',True,True) Then
  Begin
    Objeto.RangoIngreso.BuscaWhereString := 'CVE_PER_JURIDICA = '+ chr(39) + Objeto.cvePerJuridica + chr(39) ;
    if Objeto.RangoIngreso.Busca then
    begin
       Objeto.IdRangoIng.AsString := Objeto.RangoIngreso.Id_Rango_Ingreso.AsString;
    end;//if
  End;
end;

procedure TWPerIngresPrinci.sbMonedaClick(Sender: TObject);
begin
        Objeto.Moneda.Busca;
end;

procedure TWPerIngresPrinci.edDescFuenteIngrChange(Sender: TObject);
begin
     EsOtro('');
end;

end.
