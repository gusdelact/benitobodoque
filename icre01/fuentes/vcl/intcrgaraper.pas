// Sistema         : Clase de CR_GARANT_PER
// Fecha de Inicio : 23/06/2010
// Función forma   : Clase de CR_GARANT_PER
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
Unit IntCrGaraPer;
            
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//
IntParamCre, IntCrCaTiAv  ,
IntMInstDesc, IntLinkit, // Entidad descontadora
IntCrAvalCto,  //Relacion Aval Linea
IntPers,   //Aval dado de Alta en Corporativo
IntCrCaTiAB //Tipo Aval Buró
;

Type
 TCrGaraPer= class;

  TWCrGarantPer=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    lbCVE_AVAL: TLabel;
    edCVE_AVAL: TEdit;
    Panel2: TPanel;
    lbCVE_PER_JURIDICA: TLabel;
    lbTIPO_AVAL: TLabel;
    lbCVE_TIPO_SECTOR: TLabel;
    edTIPO_AVAL: TEdit;
    edCVE_TIPO_SECTOR: TEdit;
    cbCVE_PER_JURIDICA: TComboBox;
    rgSIT_GARANTIA: TRadioGroup;
    lbNOM_AVAL: TLabel;
    lbRFC: TLabel;
    lbDOMICILIO: TLabel;
    edNOM_AVAL: TEdit;
    edRFC: TEdit;
    edDOMICILIO: TEdit;
    Panel3: TPanel;
    lbF_ALTA: TLabel;
    lbFH_MODIFICACION: TLabel;
    lbCVE_USUAR_MODIF: TLabel;
    edF_ALTA: TEdit;
    edFH_MODIFICACION: TEdit;
    edCVE_USUAR_MODIF: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    bbTIPO_AVAL: TBitBtn;
    GroupBox1: TGroupBox;
    lbCALIF_RIESGO_IND: TLabel;
    lbCALIF_RIEGO_FIN: TLabel;
    lbCALIF_EXP_PAG: TLabel;
    edCALIF_RIESGO_IND: TEdit;
    edCALIF_RIEGO_FIN: TEdit;
    edCALIF_EXP_PAG: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnEntDesc: TBitBtn;
    edCVE_FND_ENT_DES: TEdit;
    edDESC_ENT_DES: TEdit;
    ilEntDesc: TInterLinkit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    edCALIF_FITCH: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edCALIF_HR: TEdit;
    Label5: TLabel;
    edCALIF_MOODYS: TEdit;
    Label6: TLabel;
    edCALIF_STANDARD: TEdit;
    edCALIF_OTRO: TEdit;
    Label7: TLabel;
    lblID_PER_AVAL: TLabel;
    edID_PER_AVAL: TEdit;
    btID_PER_AVAL: TBitBtn;
    edNOM_PER_AVAL: TEdit;
    ilCVE_TIP_AVAL_BC: TInterLinkit;
    lblCVE_TIP_AVAL_BC: TLabel;
    edCVE_TIP_AVAL_BC: TEdit;
    btCVE_TIP_AVAL_BC: TBitBtn;
    edDESC_TIPO_AVAL: TEdit;
    ilID_PER_AVAL: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnEntDescClick(Sender: TObject);


    function ObtFolio(pCveFolio, pMsg: String): Integer;
    procedure bbTIPO_AVALClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edID_PER_AVALExit(Sender: TObject);
    procedure btID_PER_AVALClick(Sender: TObject);
    procedure ilID_PER_AVALEjecuta(Sender: TObject);
    procedure ilID_PER_AVALCapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_TIP_AVAL_BCClick(Sender: TObject);
    procedure edCVE_TIP_AVAL_BCExit(Sender: TObject);
    procedure ilCVE_TIP_AVAL_BCEjecuta(Sender: TObject);
    procedure ilCVE_TIP_AVAL_BCCapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_TIP_AVAL_BCExit(Sender: TObject);
    procedure lblID_PER_AVALDblClick(Sender: TObject);
    procedure lblCVE_TIP_AVAL_BCDblClick(Sender: TObject);
    procedure ilEntDescCapture(Sender: TObject; var Show: Boolean);
    procedure ilEntDescEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);  { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrGaraPer;
end;
 TCrGaraPer= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_AVAL                 : TInterCampo;
        NOM_AVAL                 : TInterCampo;
        RFC                      : TInterCampo;
        DOMICILIO                : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;
        TIPO_AVAL                : TInterCampo;
        CVE_TIPO_SECTOR          : TInterCampo;
        CALIF_RIESGO_IND         : TInterCampo;
        CALIF_RIEGO_FIN          : TInterCampo;
        CALIF_EXP_PAG            : TInterCampo;
        F_ALTA                   : TInterCampo;
        FH_MODIFICACION          : TInterCampo;
        CVE_USUAR_MODIF          : TInterCampo;
        SIT_GARANTIA             : TInterCampo;
        CVE_FND_ENT_DES          : TInterCampo;
        CALIF_FITCH              : TInterCampo;
        CALIF_HR                 : TInterCampo;
        CALIF_MOODYS             : TInterCampo;
        CALIF_STANDARD           : TInterCampo;
        CALIF_OTRO               : TInterCampo;
        ID_PER_AVAL              : TInterCampo;
        CVE_TIP_AVAL_BC          : TInterCampo;

        ParamCre                 : TParamCre;

        UCatTipAv               : TCrCaTiAv;

        EntidadDesc             : TMInstDesc;
        Persona                 : TPersona;
        CrCaTiAB                : TCrCaTiAB;

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


constructor TCrGaraPer.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_AVAL :=CreaCampo('CVE_AVAL',ftFloat,tsNinguno,tsNinguno,True);
                CVE_AVAL.Caption:='Clave de Aval';
      NOM_AVAL :=CreaCampo('NOM_AVAL',ftString,tsNinguno,tsNinguno,True);
                NOM_AVAL.Caption:='Nombre Aval';
      RFC :=CreaCampo('RFC',ftString,tsNinguno,tsNinguno,True);
                RFC.Caption:='Rfc';
      DOMICILIO :=CreaCampo('DOMICILIO',ftString,tsNinguno,tsNinguno,True);
                DOMICILIO.Caption:='Domicilio';
      CVE_PER_JURIDICA :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);
      With CVE_PER_JURIDICA Do Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Fisica'); ComboDatos.Add('1');
        ComboLista.Add('Moral'); ComboDatos.Add('2');
        ComboLista.Add('Extranjera'); ComboDatos.Add('3');
        ComboLista.Add('Fideicomiso'); ComboDatos.Add('4');
      End;
                CVE_PER_JURIDICA.Caption:='Clave de Per Juridica';
      TIPO_AVAL :=CreaCampo('TIPO_AVAL',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_AVAL.Caption:='Tipo Aval';
      CVE_TIPO_SECTOR :=CreaCampo('CVE_TIPO_SECTOR',ftFloat,tsNinguno,tsNinguno,True);
                CVE_TIPO_SECTOR.Caption:='Clave de Tipo Sector';
      CALIF_RIESGO_IND :=CreaCampo('CALIF_RIESGO_IND',ftString,tsNinguno,tsNinguno,True);
                CALIF_RIESGO_IND.Caption:='Calif Riesgo Ind';
      CALIF_RIEGO_FIN :=CreaCampo('CALIF_RIEGO_FIN',ftString,tsNinguno,tsNinguno,True);
                CALIF_RIEGO_FIN.Caption:='Calif Riego Fin';
      CALIF_EXP_PAG :=CreaCampo('CALIF_EXP_PAG',ftString,tsNinguno,tsNinguno,True);
                CALIF_EXP_PAG.Caption:='Calif Exp Pag';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      FH_MODIFICACION :=CreaCampo('FH_MODIFICACION',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICACION.Caption:='Fecha y Hora Modificacion';
      CVE_USUAR_MODIF :=CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USUAR_MODIF.Caption:='Clave de Usuario Modificación';
      SIT_GARANTIA :=CreaCampo('SIT_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      With SIT_GARANTIA Do Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('IN');
      End;
      SIT_GARANTIA.Caption:='Situación Garantia';
      SIT_GARANTIA.NoCompare:= True;

      CVE_FND_ENT_DES  :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);

      // <RUCJ4248 : Se agregan las calificadoras para calificación de los Avales>
      CALIF_FITCH :=CreaCampo('CALIF_FITCH',ftString,tsNinguno,tsNinguno,True);
                CALIF_FITCH.Caption:='Calificación Fitch Ratings';
      CALIF_HR :=CreaCampo('CALIF_HR',ftString,tsNinguno,tsNinguno,True);
                CALIF_HR.Caption:='Calificación HR Ratings';
      CALIF_MOODYS :=CreaCampo('CALIF_MOODYS',ftString,tsNinguno,tsNinguno,True);
                CALIF_MOODYS.Caption:='Calificación Moody' + chr(39) +'s';
      CALIF_STANDARD :=CreaCampo('CALIF_STANDARD',ftString,tsNinguno,tsNinguno,True);
                CALIF_STANDARD.Caption:='Calificación Standard & Poor' + chr(39) +'s';
      CALIF_OTRO :=CreaCampo('CALIF_OTRO',ftString,tsNinguno,tsNinguno,True);
                CALIF_OTRO.Caption:='Calificación por otra calificadora';

      ID_PER_AVAL := CreaCampo('ID_PER_AVAL', ftFloat, tsNinguno, tsNinguno, True);
                      ID_PER_AVAL.Caption:= 'Id Persona (Aval)';

      CVE_TIP_AVAL_BC := CreaCampo('CVE_TIP_AVAL_BC', ftFloat, tsNinguno, tsNinguno, True);
                      CVE_TIP_AVAL_BC.Caption:= 'Cve Tipo Aval Buro';


      // </RUCJ4248 : Se agregan las calificadoras para calificación de los Avales>

      UCatTipAv  := TCrCaTiAv.Create(Self);
      UCatTipAv.MasterSource:=Self;
      UCatTipAv.FieldByName('CVE_AVAL').MasterField:='TIPO_AVAL';

      FKeyFields.Add('CVE_AVAL');


      {$WARNINGS OFF}
      EntidadDesc := TMInstDesc.Create(Self);
      {$WARNINGS ON}
      EntidadDesc.MasterSource:=Self;
      EntidadDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

      Persona := TPersona.Create(Self);
      Persona.MasterSource:= Self;
      Persona.FieldByName('ID_PERSONA').Masterfield:='ID_PER_AVAL';

      CrCaTiAB := TCrCaTiAB.Create(Self);
      CrCaTiAB.MasterSource:= Self;
      CrCaTiAB.FieldByName('CVE_AVAL').Masterfield:='CVE_TIP_AVAL_BC';

      TableName := 'CR_GARANT_PER';
      UseQuery := True; 
      HelpFile := 'IntCrGaraPer.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGaraPer.Destroy;
begin
  if UCatTipAv <> nil then
     UCatTipAv.free;
   if EntidadDesc <> nil then
     EntidadDesc.free;
  if Persona <> nil then
     Persona.Free;
  if CrCaTiAB <> nil then
     CrCaTiAB.Free;

 inherited;
end;


function TCrGaraPer.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGarantPer;
begin
   W:=TWCrGarantPer.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrGaraPer.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGaPe.IT','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TCrGaraPer.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_GARANT_PER********************)
(*                                                                              *)
(*  FORMA DE CR_GARANT_PER                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GARANT_PER********************)

procedure TWCrGarantPer.FormShow(Sender: TObject);
begin
      Objeto.CVE_AVAL.Control:=edCVE_AVAL;
      Objeto.NOM_AVAL.Control:=edNOM_AVAL;
      Objeto.RFC.Control:=edRFC;
      Objeto.DOMICILIO.Control:=edDOMICILIO;
      Objeto.CVE_PER_JURIDICA.Control:=cbCVE_PER_JURIDICA;
      Objeto.TIPO_AVAL.Control:=edTIPO_AVAL;
      Objeto.CVE_TIPO_SECTOR.Control:=edCVE_TIPO_SECTOR;
      Objeto.CALIF_RIESGO_IND.Control:=edCALIF_RIESGO_IND;
      Objeto.CALIF_RIEGO_FIN.Control:=edCALIF_RIEGO_FIN;
      Objeto.CALIF_EXP_PAG.Control:=edCALIF_EXP_PAG;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.FH_MODIFICACION.Control:=edFH_MODIFICACION;
      Objeto.CVE_USUAR_MODIF.Control:=edCVE_USUAR_MODIF;
      Objeto.SIT_GARANTIA.Control:=rgSIT_GARANTIA;

      // <RUCJ4248 : Se agregan las calificadoras para calificación de los Avales>
      Objeto.CALIF_FITCH.Control    := edCALIF_FITCH;
      Objeto.CALIF_HR.Control       := edCALIF_HR;
      Objeto.CALIF_MOODYS.Control   := edCALIF_MOODYS;
      Objeto.CALIF_STANDARD.Control := edCALIF_STANDARD;
      Objeto.CALIF_OTRO.Control     := edCALIF_OTRO;
      // </RUCJ4248 : Se agregan las calificadoras para calificación de los Avales>

      Objeto.EntidadDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.EntidadDesc.DESC_ENT_DES.Control    := edDESC_ENT_DES;

      Objeto.ID_PER_AVAL.Control        := edID_PER_AVAL;
      Objeto.Persona.Id_Persona.Control := edID_PER_AVAL;
      Objeto.Persona.Nombre.Control     := edNOM_PER_AVAL;
      Objeto.Persona.GetParams(Objeto);

      Objeto.CVE_TIP_AVAL_BC.Control         := edCVE_TIP_AVAL_BC;
      Objeto.CrCaTiAB.CVE_AVAL.Control       := edCVE_TIP_AVAL_BC;
      Objeto.CrCaTiAB.DESC_TIPO_AVAL.Control := edDESC_TIPO_AVAL;
      Objeto.CrCaTiAB.GetParams(Objeto);

end;

procedure TWCrGarantPer.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AVAL.Control:=nil;
      Objeto.NOM_AVAL.Control:=nil;
      Objeto.RFC.Control:=nil;
      Objeto.DOMICILIO.Control:=nil;
      Objeto.CVE_PER_JURIDICA.Control:=nil;
      Objeto.TIPO_AVAL.Control:=nil;
      Objeto.CVE_TIPO_SECTOR.Control:=nil;
      Objeto.CALIF_RIESGO_IND.Control:=nil;
      Objeto.CALIF_RIEGO_FIN.Control:=nil;
      Objeto.CALIF_EXP_PAG.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.FH_MODIFICACION.Control:=nil;
      Objeto.CVE_USUAR_MODIF.Control:=nil;
      Objeto.SIT_GARANTIA.Control:=nil;

      // <RUCJ4248 : Se agregan las calificadoras para calificación de los Avales>
      Objeto.CALIF_FITCH.Control    := nil;
      Objeto.CALIF_HR.Control       := nil;
      Objeto.CALIF_MOODYS.Control   := nil;
      Objeto.CALIF_STANDARD.Control := nil;
      Objeto.CALIF_OTRO.Control     := nil;
      // </RUCJ4248 : Se agregan las calificadoras para calificación de los Avales>

      Objeto.ID_PER_AVAL.Control              := nil;
      Objeto.Persona.Id_Persona.Control       := nil;
      Objeto.Persona.Nombre.Control           := nil;

      Objeto.CVE_TIP_AVAL_BC.Control          := nil;
      Objeto.CrCaTiAB.CVE_AVAL.Control        := nil;
      Objeto.CrCaTiAB.DESC_TIPO_AVAL.Control  := nil;

   //Objeto
end;

procedure TWCrGarantPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGarantPer.InterForma1DespuesNuevo(Sender: TObject);
begin //
   edNOM_AVAL.SetFocus;
   rgSIT_GARANTIA.ItemIndex := 0;
end;

procedure TWCrGarantPer.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrGarantPer.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


Function TwCrGarantPer.ObtFolio(pCveFolio : String; pMsg : String): Integer;
Var
   STPObtFolios : TStoredProc;
   vlFolio     : Integer;
Begin
   vlFolio := 0;
   STPObtFolios := TStoredProc.Create(Nil);
   Try
      With STPObtFolios Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTENFOLIO';

         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
         Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
         Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Params.CreateParam(ftFloat,'RESULT',ptResult);
         ParamByName('PEIDEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
         ParamByName('PECVEFolio').AsString := pCveFolio;
         ParamByName('PEBCommit').AsString := 'V';

         ExecProc;

         If (ParamByName('PSResultado').AsInteger = 0) Then Begin
            vlFolio := ParamByName('Result').AsInteger;
         End Else
            ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg +
            IntToStr(ParamByName('PSResultado').AsInteger));
      End;
   Finally
      STPObtFolios.Free;
   End;
   ObtFolio:= vlFolio;
End;


procedure TWCrGarantPer.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USUAR_MODIF.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            CVE_AVAL.AsInteger:= ObtFolio('GARAPER','CLAVE AVAL: ');
            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USUAR_MODIF.AsString := DameUsuario;
            FH_MODIFICACION.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;


procedure TWCrGarantPer.btnEntDescClick(Sender: TObject);
begin
   Objeto.EntidadDesc.ShowAll := True;
   if Objeto.EntidadDesc.Busca then
   Begin
      InterForma1.NextTab(btnEntDesc);
   end;
end;

procedure TWCrGarantPer.bbTIPO_AVALClick(Sender: TObject);
begin
 Objeto.UCatTipAv.ShowAll := True;
   if Objeto.UCatTipAv.Busca then
   begin
        Objeto.TIPO_AVAL.AsString := Objeto.UCatTipAv.CVE_AVAL.AsString;
        InterForma1.NextTab(cbCVE_PER_JURIDICA);
   end;

end;

procedure TWCrGarantPer.Button1Click(Sender: TObject);
var
  AvalLinea :     TCrAvalCto;
begin

   if Objeto.CVE_AVAL.AsString = '' then
   begin
      ShowMessage('Debe de guardar al aval antes de agregar los contratos');
      exit;
   end;

   if Objeto.Active then
   begin
     if Objeto.ValidaAccesoEsp('TMPERSONAL_CTO',True,True) then
     begin
          {$WARNINGS OFF}
          AvalLinea := TCrAvalCto.Create(self);
          {$WARNINGS ON}
          try
             AvalLinea.Apli:=Objeto.Apli;
             AvalLinea.ParamCre:=Objeto.ParamCre;
             AvalLinea.CVE_AVAL.AsString := Objeto.CVE_AVAL.AsString;
             AvalLinea.NOM_AVAL.AsString := Objeto.NOM_AVAL.AsString;
             AvalLinea.Catalogo;
          finally
             AvalLinea.Free;
          end;
     end
   end
   else ShowMessage('Debe de seleccionar un Aval');

end;

procedure TWCrGarantPer.edID_PER_AVALExit(Sender: TObject);
begin
  With Objeto Do
  Begin
       if ((Modo = moEdit) or (Modo = moAppend)) then
       begin
          ID_PER_AVAL.GetFromControl;

          try
              if Persona.FindKey([edID_PER_AVAL.Text]) then
              begin
                  edNOM_PER_AVAL.Text := Persona.Nombre.AsString;
              end
              else
              begin
                  edNOM_PER_AVAL.Text := '';
                  edID_PER_AVAL.Text := '';
              end;
              InterForma1.NextTab(btID_PER_AVAL);
          finally
              if edNOM_PER_AVAL.Text = '' then
              begin
                  edID_PER_AVAL.Text := '';
                  InterForma1.NextTab(btID_PER_AVAL);
              end;
          end;
       end;
  end;
end;

procedure TWCrGarantPer.btID_PER_AVALClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPERSONAL_AVA',True,True) then
   begin
       Objeto.Persona.ShowAll := True;
       if Objeto.Persona.Busca then
          InterForma1.NextTab(btID_PER_AVAL);
   end;
end;

procedure TWCrGarantPer.ilID_PER_AVALEjecuta(Sender: TObject);
begin
   if Objeto.Persona.FindKey([ilID_PER_AVAL.Buffer]) then
      InterForma1.NextTab(edID_PER_AVAL);
end;

procedure TWCrGarantPer.ilID_PER_AVALCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrGarantPer.btCVE_TIP_AVAL_BCClick(Sender: TObject);
begin
       Objeto.CrCaTiAB.ShowAll := True;
       if Objeto.CrCaTiAB.Busca then
          InterForma1.NextTab(btCVE_TIP_AVAL_BC);
end;

procedure TWCrGarantPer.edCVE_TIP_AVAL_BCExit(Sender: TObject);
begin
  With Objeto Do
  Begin
       if ((Modo = moEdit) or (Modo = moAppend)) then
       begin
          CVE_TIP_AVAL_BC.GetFromControl;

          try
              if CrCaTiAB.FindKey([edCVE_TIP_AVAL_BC.Text]) then
              begin
                  edDESC_TIPO_AVAL.Text := CrCaTiAB.DESC_TIPO_AVAL.AsString;
              end
              else
              begin
                  edDESC_TIPO_AVAL.Text := '';
                  edCVE_TIP_AVAL_BC.Text := '';
              end;
              InterForma1.NextTab(btCVE_TIP_AVAL_BC);
          finally
              if edDESC_TIPO_AVAL.Text = '' then
              begin
                  edCVE_TIP_AVAL_BC.Text := '';
                  InterForma1.NextTab(btCVE_TIP_AVAL_BC);
              end;
          end;
       end;
  end;
end     ;

procedure TWCrGarantPer.ilCVE_TIP_AVAL_BCEjecuta(Sender: TObject);
begin
   if Objeto.CrCaTiAB.FindKey([ilCVE_TIP_AVAL_BC.Buffer]) then
      InterForma1.NextTab(edCVE_TIP_AVAL_BC);
end;

procedure TWCrGarantPer.ilCVE_TIP_AVAL_BCCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrGarantPer.btCVE_TIP_AVAL_BCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_TIP_AVAL_BC,True,'',True);
end;

procedure TWCrGarantPer.lblID_PER_AVALDblClick(Sender: TObject);
begin
{    edID_PER_AVAL.Text  := '';
    edNOM_PER_AVAL.Text := '';
    Objeto.Persona.Id_Persona.IsNull;
    Objeto.Persona.Nombre.IsNull;
}
end;

procedure TWCrGarantPer.lblCVE_TIP_AVAL_BCDblClick(Sender: TObject);
begin
{    edCVE_TIP_AVAL_BC.Text  := '';
    edDESC_TIPO_AVAL.Text := '';
    Objeto.CrCaTiAB.CVE_AVAL.IsNull;
    Objeto.CrCaTiAB.DESC_TIPO_AVAL.IsNull;
}
end;

procedure TWCrGarantPer.ilEntDescCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrGarantPer.ilEntDescEjecuta(Sender: TObject);
begin
  if Objeto.EntidadDesc.FindKey([ilEntDesc.Buffer]) then
       InterForma1.NextTab(edCVE_FND_ENT_DES);
end;

procedure TWCrGarantPer.edCVE_FND_ENT_DESExit(Sender: TObject);
begin
  With Objeto Do
  Begin
       if ((Modo = moEdit) or (Modo = moAppend)) then
       begin
          CVE_FND_ENT_DES.GetFromControl;

          try
              if EntidadDesc.FindKey([edCVE_FND_ENT_DES.Text]) then
              begin
                  edDESC_ENT_DES.Text := EntidadDesc.DESC_ENT_DES.AsString;
              end
              else
              begin
                  edDESC_ENT_DES.Text := '';
                  edCVE_FND_ENT_DES.Text := '';
              end;
              InterForma1.NextTab(btnEntDesc);
          finally
              if edDESC_ENT_DES.Text = '' then
              begin
                  edCVE_FND_ENT_DES.Text := '';
                  InterForma1.NextTab(btnEntDesc);
              end;
          end;
       end;
  end;
end;

end.
