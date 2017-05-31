// Sistema         : Clase de DI_CLIENTE
// Fecha de Inicio : 03/02/1999
// Función forma   : Clase de DI_CLIENTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zarate Castro
// Comentarios     :
Unit IntDiCliente;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntPers, IntLinkit,IntGCto,intctto,uncondi;

Type
 TDiCliente= class;

  TWDiCliente=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_PERSONA : TLabel; 
    edID_PERSONA : TEdit;
    lbF_ALTA : TLabel;
    dtpF_ALTA : TInterDateTimePicker;
    edF_ALTA : TEdit;
    lbID_GRUPO_CONTR : TLabel; 
    edID_GRUPO_CONTR : TEdit;
    lbID_PROMOT_ASOC : TLabel;
    edID_PROMOT_ASOC : TEdit;
    lbTX_COMENTARIO : TLabel;
    edTX_COMENTARIO : TEdit;
    Label12: TLabel;
    edCve_Sector_Divs: TEdit;
    sbSector: TBitBtn;
    edDescSector: TEdit;
    chbImpDomic: TCheckBox;
    sbCliente: TBitBtn;
    bbPromotor: TBitBtn;
    edNombre: TEdit;
    edPromotor: TEdit;
    edDescGpoContr: TEdit;
    rgEnviar: TRadioGroup;
    edContrato: TEdit;
    Label2: TLabel;
    edTitular: TEdit;
    SpeedButton1: TSpeedButton;
    InterLinkit1: TInterLinkit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edCorreo: TEdit;
    rgSituacion: TRadioGroup;
    edFechaModif: TEdit;
    edUsrModif: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    rgB_Calificacion: TRadioGroup;
    edCTA_SIST_INTERM: TEdit;
    Label5: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure sbClienteClick(Sender: TObject);
    procedure bbPromotorClick(Sender: TObject);
    procedure sbSectorClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure rgEnviarClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TDiCliente;
end;
 TDiCliente= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_PERSONA               : TInterCampo;
        F_ALTA                   : TInterCampo;
        ID_GRUPO_CONTR           : TInterCampo;
        ID_PROMOT_ASOC           : TInterCampo;
        TX_COMENTARIO            : TInterCampo;
        CVE_SECTOR_DIVST         : TInterCampo;
        DESC_SECTOR              : TInterCampo;
        B_IMPR_DOMIC             : TInterCampo;
        E_MAIL                   : TInterCampo;//SACC 04042005 NUEVAS COLUMNAS
        B_CMP_EMAIL              : TInterCampo;//SACC 04042005 NUEVAS COLUMNAS
        ID_CONTRATO_CORP         : TInterCampo;//SACC 04072005 NUEVAS COLUMNAS
        SIT_CLIENTE              : TInterCampo;//SACC 23092005 NUEVAS COLUMNAS
        CVE_USUAR_MODIF          : TInterCampo;//SACC 23092005 NUEVAS COLUMNAS
        FH_MODIFICACION          : TInterCampo;//SACC 23092005 NUEVAS COLUMNAS
        B_CALIFICACION           : TInterCampo;//MARA4356 15022006 COLUMNA PARA CALIFICAR AL CLIENTE
        CTA_SIST_INTERM          : TInterCampo;//MARA4356 24042006 CUENTA EN BANXICO
        Persona                  : TPersona;
        GrupoCto                 : TGpoCto;
        Contrato                 : TContrato;
        function    InternalBusca : Boolean; override;
        procedure   BuscaSector;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   BuscadorSector;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}

constructor TDiCliente.Create( AOwner : TComponent );
begin Inherited;
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Número de Persona';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      ID_GRUPO_CONTR :=CreaCampo('ID_GRUPO_CONTR',ftFloat,tsNinguno,tsNinguno,True);
                ID_GRUPO_CONTR.Caption:='Número de Grupo Contr';
      ID_PROMOT_ASOC :=CreaCampo('ID_PROMOT_ASOC',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROMOT_ASOC.Caption:='Número de Promot Asoc';
      TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIO.Caption:='Comentario';
      CVE_SECTOR_DIVST :=CreaCampo('CVE_SECTOR_DIVST',ftString,tsNinguno,tsNinguno,True);
      CVE_SECTOR_DIVST.Size:=2;

      DESC_SECTOR :=CreaCampo('DESC_SECTOR',ftString,tsNinguno,tsNinguno,False);

      B_IMPR_DOMIC:=CreaCampo('B_IMPR_DOMIC',ftString,tsNinguno,tsNinguno,True);
      B_IMPR_DOMIC.Size:=1;

      E_MAIL:=CreaCampo('E_MAIL',ftString,tsNinguno,tsNinguno,True);
      B_CMP_EMAIL:=CreaCampo('B_CMP_EMAIL',ftString,tsNinguno,tsNinguno,True);
      WITH B_CMP_EMAIL DO
      BEGIN
      UseCombo:=TRUE;
      Size:=2;
      ComboDatos.Add('V');  ComboLista.Add('0');
      ComboDatos.Add('F');  ComboLista.Add('1');
      end;
      ID_CONTRATO_CORP:=CreaCampo('ID_CONTRATO_CORP',ftFloat,tsNinguno,tsNinguno,True);
      SIT_CLIENTE:=CreaCampo('SIT_CLIENTE',ftString,tsNinguno,tsNinguno,True);           //SACC 23092005
      WITH SIT_CLIENTE DO
      BEGIN
      UseCombo:=TRUE;
      Size:=2;
      ComboDatos.Add('AC');  ComboLista.Add('0');
      ComboDatos.Add('IN');  ComboLista.Add('1');
      end;
      CVE_USUAR_MODIF:=CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);   //SACC 23092005
      FH_MODIFICACION:=CreaCampo('FH_MODIFICACION',ftDateTime,tsNinguno,tsNinguno,True); //SACC 23092005

      B_CALIFICACION:=CreaCampo('B_CALIFICACION',ftString,tsNinguno,tsNinguno,True); //MARA4356 15022006 COLUMNA PARA CALIFICAR AL CLIENTE
      WITH B_CALIFICACION DO
      BEGIN
         UseCombo:=TRUE;
         Size:=2;
         ComboDatos.Add('V');  ComboLista.Add('0');
         ComboDatos.Add('F');  ComboLista.Add('1');
      end;

      CTA_SIST_INTERM:=CreaCampo('CTA_SIST_INTERM',ftString,tsNinguno,tsNinguno,True);//MARA4356 24042006 CUENTA EN BANXICO

      FKeyFields.Add('ID_PERSONA');

      TableName := 'DI_CLIENTE';
      UseQuery := True;
      HelpFile := 'IntDiCliente.Hlp';
      ShowMenuReporte:=True;

      Persona:= TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.ID_Persona.MasterField:='ID_PERSONA';

      GrupoCto:=TGpoCto.Create(Nil);
      GrupoCto.MasterSource:=Self;
      GrupoCto.Id_Grupo.MasterField:='ID_GRUPO_CONTR';
      GrupoCto.Id_Pers_Asociad.MasterField:='ID_PROMOT_ASOC';

      Contrato:=TContrato.Create(nil);
      Contrato.MasterSource:=Self;
      Contrato.ID_CONTRATO.MasterField:='ID_CONTRATO_CORP';

end;

Destructor TDiCliente.Destroy;
begin
      if Persona <> nil then Persona.free;
      if GrupoCto <> nil then GrupoCto.free;
      inherited;
end;

procedure TDiCliente.BuscadorSector;
Var T : TInterFindit;
begin T := CreaBuscador('Sector.It','S,S');
      Try
       T.Param(0,Cve_Sector_divst.AsString);
       T.Param(1,Desc_Sector.AsString);
       if T.Execute then
           begin
              Cve_Sector_divst.AsString := T.DameCampo(0);
              Desc_Sector.AsString:= T.DameCampo(1);
           end;
      finally  T.Free;
      end;
end;

procedure TDiCliente.BuscaSector;
Var qSector : tQuery;
begin qSector := Getsqlquery ('SELECT DESC_SECTOR  FROM DI_SECTOR WHERE CVE_SECTOR_DIVS=''' + Cve_Sector_divst.AsString + '''',SeguDataBaseName,SeguSessionName,True);
      try If qSector <> nil
          then Desc_Sector.AsString:=qSector.FieldByName('DESC_SECTOR').AsString
          else Desc_Sector.AsString:='';
          Desc_Sector.DrawControl;
        finally qSector.Free;
        end;
end;

function TDiCliente.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDiCliente;
begin
   W:=TWDiCliente.Create(Self);
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


Function TDiCliente.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IDiClien.it','F');
      Try if Active then begin T.Param(0,ID_PERSONA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA DI_CLIENTE********************)
(*                                                                              *)
(*  FORMA DE DI_CLIENTE                                                            *)
(*                                                                              *)
(***********************************************FORMA DI_CLIENTE********************)

procedure TWDiCliente.FormShow(Sender: TObject);
begin
      Objeto.ID_PERSONA.Control:=edID_PERSONA;
      Objeto.Persona.Nombre.Control:=edNombre;
      Objeto.F_ALTA.Control    :=edF_ALTA;
      Objeto.ID_GRUPO_CONTR.Control:=edID_GRUPO_CONTR;
      Objeto.ID_PROMOT_ASOC.Control:=edID_PROMOT_ASOC;
      Objeto.TX_COMENTARIO.Control :=edTX_COMENTARIO;
      Objeto.B_IMPR_DOMIC.Control:=chbImpDomic;
      Objeto.CVE_SECTOR_DIVST.Control:=edCve_Sector_Divs;
      Objeto.GrupoCto.Id_Grupo.Control:=edID_GRUPO_CONTR;
      Objeto.GrupoCto.Id_Pers_Asociad.Control:=edID_PROMOT_ASOC;
      Objeto.GrupoCto.PromAsociado.Nombre.Control:=edPromotor;
      Objeto.GrupoCto.Desc_Gpo_Contrat.Control:=edDescGpoContr;
      Objeto.DESC_SECTOR.Control:=edDescSector;
      Objeto.E_MAIL.Control:=edCorreo;
      Objeto.B_CMP_EMAIL.Control:=rgEnviar;
      Objeto.ID_CONTRATO_CORP.Control:=edContrato;
      Objeto.Contrato.ID_CONTRATO.Control:=edContrato;
      Objeto.Contrato.TITNombre.Control:=edTitular;

      Objeto.SIT_CLIENTE.Control:=rgSituacion;      //SACC23092005
      Objeto.FH_MODIFICACION.Control:=edFechaModif; //SACC23092005
      Objeto.CVE_USUAR_MODIF.Control:=edUsrModif;   //SACC23092005

      Objeto.Contrato.BuscaWhereString:='CONTRATO.CVE_TIP_CONTRATO in(''CAME'',''CIBC'',''IFON'',''INPA'',''CDVI'',''CRED'') ';
      Objeto.Contrato.FilterString:= Objeto.Contrato.BuscaWhereString;

      Objeto.B_CALIFICACION.Control:=rgB_CALIFICACION;//MARA4356 15022006 CALIFICACION DEL CLIENTE
      Objeto.CTA_SIST_INTERM.Control:=edCTA_SIST_INTERM;//MARA4356 24042006 CUENTA BANXICO
end;

procedure TWDiCliente.FormDestroy(Sender: TObject);
begin
      Objeto.ID_PERSONA.Control:=nil;
      Objeto.F_ALTA.Control    :=nil;
      Objeto.ID_GRUPO_CONTR.Control:=nil;
      Objeto.ID_PROMOT_ASOC.Control:=nil;
      Objeto.TX_COMENTARIO.Control :=nil;
      Objeto.B_IMPR_DOMIC.Control:=nil;
      Objeto.CVE_SECTOR_DIVST.Control:=nil;
      Objeto.Persona.Nombre.Control:=nil;
      Objeto.GrupoCto.Id_Grupo.Control:=nil;
      Objeto.GrupoCto.Id_Pers_Asociad.Control:=nil;
      Objeto.GrupoCto.PromAsociado.Nombre.Control:=nil;
      Objeto.GrupoCto.Desc_Gpo_Contrat.Control:=nil;
      Objeto.DESC_SECTOR.Control:=nil;
      Objeto.E_MAIL.Control:=nil;
      Objeto.B_CMP_EMAIL.Control:=nil;
      Objeto.ID_CONTRATO_CORP.Control:=nil;
      Objeto.Contrato.ID_CONTRATO.Control:=nil;
      Objeto.Contrato.TITNombre.Control:=nil;

      Objeto.SIT_CLIENTE.Control:=nil;      //SACC23092005
      Objeto.FH_MODIFICACION.Control:=nil; //SACC23092005
      Objeto.CVE_USUAR_MODIF.Control:=nil;   //SACC23092005

      Objeto.B_CALIFICACION.Control:=nil;//MARA4356 15022006 CALIFICACION DEL CLIENTE
      Objeto.CTA_SIST_INTERM.Control:=nil;//MARA4356 26042006 CUENTA BANXICO
end;

procedure TWDiCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDiCliente.sbClienteClick(Sender: TObject);
begin Objeto.Persona.Busca;
end;

procedure TWDiCliente.bbPromotorClick(Sender: TObject);
begin Objeto.GrupoCto.Busca;

end;

procedure TWDiCliente.sbSectorClick(Sender: TObject);
begin Objeto.BuscadorSector;
end;


procedure TWDiCliente.InterForma1Buscar(Sender: TObject);
begin if Objeto.Busca then Objeto.BuscaSector;
end;

procedure TWDiCliente.InterForma1DespuesNuevo(Sender: TObject);
begin Objeto.F_ALTA.AsDateTime:=Objeto.Apli.SysDateTime;
      edFechaModif.Text:=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM', Objeto.Apli.SysDateTime);
      edUsrModif.Text:=Objeto.Apli.Usuario;
end;

procedure TWDiCliente.SpeedButton1Click(Sender: TObject);
begin
  Objeto.Contrato.Busca;
end;

procedure TWDiCliente.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=TRUE;
end;

procedure TWDiCliente.InterLinkit1Ejecuta(Sender: TObject);
begin
  Objeto.Contrato.FindKey([InterLinkit1.Buffer]);
end;

procedure TWDiCliente.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 Realizado:=False;
  if rgEnviar.ItemIndex=0 then
  BEGIN
    if Length(edCorreo.Text)<>0 then
    begin
       if ValidaEmail(edCorreo.Text) then Realizado:=True;
    end
    else ShowMessage('Capture la Dirección de Correo Electrónico');
  END
  else
  BEGIN
    edCorreo.Clear;
    Realizado:=True;
  END;
      edFechaModif.Text:=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM', Objeto.Apli.SysDateTime);
      edUsrModif.Text:=Objeto.Apli.Usuario;
end;

procedure TWDiCliente.rgEnviarClick(Sender: TObject);
begin
  if rgEnviar.ItemIndex=1 then
  BEGIN
  edCorreo.Clear;
  END;
end;

procedure TWDiCliente.InterForma1DespuesModificar(Sender: TObject);
begin
      edFechaModif.Text:=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM', Objeto.Apli.SysDateTime);
      edUsrModif.Text:=Objeto.Apli.Usuario;
end;

end.
