// Sistema         : Clase de CRE_CONTRATO
// Fecha de Inicio : 3/08/1998
// Función forma   : Clase de CRE_CONTRATO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Benjamin Hernandez Delsordo
// Comentarios     :
Unit IntCrCoo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntCrGar, IntCrOri, IntCrDes, IntCtto, intCrSeg, IntCrStB,IntCrCls, IntCrCli,
DBCtrls, IntCrRt, UnCrPack, IntCrCMin;

Type
 TCrCoo= class; 

  TWCrCoo=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CONTRATO : TLabel; 
    edID_CONTRATO : TEdit;
    lbB_EVENTUAL : TLabel; 
    chB_EVENTUAL : TCheckBox;
    lbB_RESTRUCTURA : TLabel; 
    chB_RESTRUCTURA : TCheckBox;
    lbB_REVOLVENTE : TLabel;
    chB_REVOLVENTE : TCheckBox;
    lbCOMITE_AUT : TLabel;
    edCOMITE_AUT : TEdit;
    lbCVE_DESTINO : TLabel; 
    edCVE_DESTINO : TEdit;
    lbCVE_GARANTIA : TLabel; 
    edCVE_GARANTIA : TEdit;
    lbCVE_ORIGEN_REC : TLabel; 
    edCVE_ORIGEN_REC : TEdit;
    lbCVE_USU_AUTORIZA : TLabel; 
    edCVE_USU_AUTORIZA : TEdit;
    lbDIAS_PLAZO : TLabel; 
    edDIAS_PLAZO : TEdit;
    lbFACT_PROPOR_GAR : TLabel; 
    edFACT_PROPOR_GAR : TEdit;
    lbF_AUT_COMITE : TLabel;
    dtpF_AUT_COMITE : TInterDateTimePicker;
    edF_AUT_COMITE : TEdit;
    lbF_AUT_CREDITO : TLabel; 
    dtpF_AUT_CREDITO : TInterDateTimePicker; 
    edF_AUT_CREDITO : TEdit;
    lbF_ENTREGA_RECUR : TLabel; 
    dtpF_ENTREGA_RECUR : TInterDateTimePicker; 
    edF_ENTREGA_RECUR : TEdit;
    lbIMP_AUTORIZADO : TLabel; 
    edIMP_AUTORIZADO : TEdit;
    lbIMP_DISPUESTO : TLabel; 
    edIMP_DISPUESTO : TEdit;
    lbIMP_TRANSITO : TLabel; 
    edIMP_TRANSITO : TEdit;
    lbNUM_AMPLIACION : TLabel;
    edNUM_AMPLIACION : TEdit;
    lbTX_COND_GRALES : TLabel; 
    edTX_COND_GRALES : TEdit;
    lbCODIGO_ERROR : TLabel; 
    edCODIGO_ERROR : TEdit;
    lbSIT_LINEA : TLabel; 
    edSIT_LINEA : TEdit;
    lbCVE_SUB_TIP_BCO : TLabel; 
    edCVE_SUB_TIP_BCO : TEdit;
    lbCVE_CLASIF_CNBV : TLabel; 
    edCVE_CLASIF_CNBV : TEdit;
    lbCVE_CLASIF_SHCP : TLabel; 
    edCVE_CLASIF_SHCP : TEdit;
    Label1: TLabel;
    edCve_cat_minimo: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TCrCoo;
end; 
 TCrCoo= class(TInterFrame) 
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations } 
        ID_CONTRATO              : TInterCampo;
        B_EVENTUAL               : TInterCampo;
        B_RESTRUCTURA            : TInterCampo;
        B_REVOLVENTE             : TInterCampo;
        COMITE_AUT               : TInterCampo;
        CVE_DESTINO              : TInterCampo;
        CVE_GARANTIA             : TInterCampo;
        CVE_ORIGEN_REC           : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        FACT_PROPOR_GAR          : TInterCampo;
        F_AUT_COMITE             : TInterCampo;
        F_AUT_CREDITO            : TInterCampo;
        F_ENTREGA_RECUR          : TInterCampo;
        IMP_AUTORIZADO           : TInterCampo;
        IMP_DISPUESTO            : TInterCampo;
        IMP_TRANSITO             : TInterCampo;
        NUM_AMPLIACION           : TInterCampo;
        TX_COND_GRALES           : TInterCampo;
        CODIGO_ERROR             : TInterCampo;
        SIT_LINEA                : TInterCampo;
        CVE_SUB_TIP_BCO          : TInterCampo;
        CVE_CLASIF_CNBV          : TInterCampo;
        CVE_CLASIF_SHCP          : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SOBRETASA                : TInterCampo;
        DIAS_TOLERANCIA          : TInterCampo;
        CVE_CAT_MIN              : TInterCampo;

        F_VENCIMIENTO            :TInterCampo;
        IMP_DISPONER             :TInterCampo;
        IMP_LIQUIDADO            :TInterCampo;
        CONDICIONES              :TInterCampo;
        SITUACION                :TInterCampo;
        DESC_TASA                :TInterCampo;

        Contrato                 :TContrato;
        Cliente                  :TCrCli;
        Garantia                 :TCrGar;
        Destino                  :TCrDes;
        Origen                   :TCrOri;
        ClasifCNBV               :TCrCls;
        ClasifSHCP               :TCrCls;
        SubtipoBanco             :TCrStB;
        CatMin                   :TCrCMin;

        function    InternalBusca : Boolean; override;
        function    InternalLocaliza : boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCoo.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      B_EVENTUAL :=CreaCampo('B_EVENTUAL',ftString,tsNinguno,tsNinguno,True);
       with B_EVENTUAL do
       begin
         Size:=1;
         UseCombo:=True;
         ComboLista.Add('Linea');  ComboDatos.Add('F');
         ComboLista.Add('Eventual');  ComboDatos.Add('V');
         Caption:='Eventual';
       end;
      B_RESTRUCTURA :=CreaCampo('B_RESTRUCTURA',ftString,tsNinguno,tsNinguno,True);
        B_RESTRUCTURA .Size:=1;
                B_RESTRUCTURA.Caption:='Restructura';
      B_REVOLVENTE :=CreaCampo('B_REVOLVENTE',ftString,tsNinguno,tsNinguno,True);
        with B_REVOLVENTE do
        begin
          Size:=1;
          UseCombo:=True;
          ComboLista.Add('No Revolvente');  ComboDatos.Add('F');
          ComboLista.Add('Revolvente');  ComboDatos.Add('V');
          Caption:='Revolvente';
        end;
      COMITE_AUT :=CreaCampo('COMITE_AUT',ftString,tsNinguno,tsNinguno,True);
                COMITE_AUT.Caption:='Comite Aut';
      CVE_DESTINO :=CreaCampo('CVE_DESTINO',ftString,tsNinguno,tsNinguno,True);
        CVE_DESTINO .Size:=6;
                CVE_DESTINO.Caption:='Clave de Destino';
      CVE_GARANTIA :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
        CVE_GARANTIA .Size:=8;
                CVE_GARANTIA.Caption:='Clave de Garantia';
      CVE_ORIGEN_REC :=CreaCampo('CVE_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
        CVE_ORIGEN_REC .Size:=6;
                CVE_ORIGEN_REC.Caption:='Clave de Origen Rec';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
        CVE_USU_AUTORIZA .Size:=8;
                CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      DIAS_PLAZO :=CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PLAZO.Caption:='Dias Plazo';
      FACT_PROPOR_GAR :=CreaCampo('FACT_PROPOR_GAR',ftFloat,tsNinguno,tsNinguno,True);
                FACT_PROPOR_GAR.Caption:='Fact Propor Gar';
      F_AUT_COMITE :=CreaCampo('F_AUT_COMITE',ftDate,tsNinguno,tsNinguno,True);
                F_AUT_COMITE.Caption:='Fecha Aut Comite';
      F_AUT_CREDITO :=CreaCampo('F_AUT_CREDITO',ftDate,tsNinguno,tsNinguno,True);
                F_AUT_CREDITO.Caption:='Fecha Aut Credito';
      F_ENTREGA_RECUR :=CreaCampo('F_ENTREGA_RECUR',ftDate,tsNinguno,tsNinguno,True);
                F_ENTREGA_RECUR.Caption:='Fecha Entrega Recur';
      IMP_AUTORIZADO :=CreaCampo('IMP_AUTORIZADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_AUTORIZADO.Caption:='Imp Autorizado';
      IMP_DISPUESTO :=CreaCampo('IMP_DISPUESTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_DISPUESTO.Caption:='Imp Dispuesto';
      IMP_TRANSITO :=CreaCampo('IMP_TRANSITO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_TRANSITO.Caption:='Imp Transito';
      NUM_AMPLIACION :=CreaCampo('NUM_AMPLIACION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_AMPLIACION.Caption:='Número Ampliacion';
      TX_COND_GRALES :=CreaCampo('TX_COND_GRALES',ftString,tsNinguno,tsNinguno,True);
                TX_COND_GRALES.Caption:='Cond Grales';
      CODIGO_ERROR :=CreaCampo('CODIGO_ERROR',ftFloat,tsNinguno,tsNinguno,True);
                CODIGO_ERROR.Caption:='Codigo Error';
      SIT_LINEA :=CreaCampo('SIT_LINEA',ftString,tsNinguno,tsNinguno,True);
        with SIT_LINEA do
        begin Size:=2;
          UseCombo:=True;
          ComboLista.Add('0');  ComboDatos.Add('PA');
          ComboLista.Add('1');  ComboDatos.Add('AC');
          ComboLista.Add('2');  ComboDatos.Add('LQ');
          ComboLista.Add('3');  ComboDatos.Add('CA');
          Caption:='Situación Linea';
        end;
      CVE_SUB_TIP_BCO :=CreaCampo('CVE_SUB_TIP_BCO',ftFloat,tsNinguno,tsNinguno,True);
                CVE_SUB_TIP_BCO.Caption:='Clave de Sub Tip Bco';
        with CVE_SUB_TIP_BCO do
          begin
            IsRequiered := True;
            Caption := 'Subtipo Banco';
          end;
      CVE_CLASIF_CNBV :=CreaCampo('CVE_CLASIF_CNBV',ftString,tsNinguno,tsNinguno,True);
        CVE_CLASIF_CNBV .Size:=6;
                CVE_CLASIF_CNBV.Caption:='Clave de Clasif Cnbv';
      CVE_CLASIF_SHCP :=CreaCampo('CVE_CLASIF_SHCP',ftString,tsNinguno,tsNinguno,True);
        CVE_CLASIF_SHCP .Size:=6;
                CVE_CLASIF_SHCP.Caption:='Clave de Clasif Shcp';
      CVE_TASA_REFER := CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
        CVE_TASA_REFER.Size := 8;
        CVE_TASA_REFER.Caption := 'Clave de Tasa de Referencia';
      OPERADOR_STASA :=CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,True);
        with OPERADOR_STASA do
        begin
          Size:=1;
          UseCombo:=True;
          ComboLista.Add('0');  ComboDatos.Add('+');
          ComboLista.Add('1');   ComboDatos.Add('*');
          Caption:='Operador de Sobretasa';
        end;
      SOBRETASA := CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
        SOBRETASA.Caption := 'Sobretasa';
      DIAS_TOLERANCIA := CreaCampo('DIAS_TOLERANCIA',ftInteger,tsNinguno,tsNinguno,True);
        DIAS_TOLERANCIA.Caption := 'Dias de Tolerancia';

      CVE_CAT_MIN := CreaCampo('CVE_CAT_MIN',ftString,tsNinguno,tsNinguno,True);
        CVE_CAT_MIN.Size := 10;
        CVE_CAT_MIN.Caption := 'Clave del catálogo mínimo';

   F_VENCIMIENTO              :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
   IMP_DISPONER               :=CreaCampo('IMP_DISPONER',ftFloat,tsNinguno,tsNinguno,False);
   IMP_LIQUIDADO              :=CreaCampo('IMP_LIQUIDADO',ftFloat,tsNinguno,tsNinguno,False);
   CONDICIONES                :=CreaCampo('CONDICIONES',ftString,tsNinguno,tsNinguno,False);
   SITUACION                  :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
   DESC_TASA                  :=CreaCampo('DESC_TASA',ftString,tsNinguno,tsNinguno,False);

   Garantia:=TcrGar.Create(Self);
   Garantia.MasterSource:=Self;
   Garantia.FieldByName('CVE_GARANTIA').MasterField:='CVE_GARANTIA';

   Destino:=Tcrdes.Create(Self);
   Destino.MasterSource:=Self;
   Destino.FieldByName('CVE_DESTINO').MasterField:='CVE_DESTINO';

   Origen:=TcrOri.Create(Self);
   Origen.MasterSource:=Self;
   Origen.FieldByName('CVE_ORIGEN_REC').MasterField:='CVE_ORIGEN_REC';

   ClasifCNBV := TCrCls.Create(Self);
   ClasifCNBV.MasterSource:=Self;
   ClasifCNBV.FieldByName('CVE_TIPO_CLASIF').MasterField:='CVE_CLASIF_CNBV';
   ClasifCNBV.Institucion := 'C';

   ClasifSHCP := TCrCls.Create(Self);
   ClasifSHCP.MasterSource:=Self;
   ClasifSHCP.FieldByName('CVE_TIPO_CLASIF').MasterField:='CVE_CLASIF_SHCP';
   ClasifSHCP.Institucion := 'H';

   Contrato:=TContrato.Create(Self);
   Contrato.MasterSource:=Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

   SubtipoBanco:=TCrStb.Create(Self);
   SubtipoBanco.MasterSource:=Self;
   SubtipoBanco.FieldByName('CVE_SUB_TIP_BCO').MasterField:='CVE_SUB_TIP_BCO';

   Cliente := TCrCli.Create(Self);
   Cliente.MasterSource :=Contrato;
   Cliente.FieldByName('ID_PERSONA').MasterField := 'ID_TITULAR';

   CatMin := TCrCMin.Create(Self);
   CatMin.MasterSource := Self;
   CatMin.FieldByName('CVE_CAT_MIN').MasterField := 'CVE_CAT_MIN';

   FKeyFields.Add('ID_CONTRATO');
   TableName := 'CRE_CONTRATO';
   UseQuery := True;
   HelpFile := 'IntCrCoo.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TCrCoo.Destroy;
begin
   if Garantia <> nil then Garantia.Free;
   if Destino <> nil then Destino.Free;
   if origen <> nil then origen.Free;
   if Contrato <> nil then Contrato.Free;
   if ClasifCNBV <> nil then ClasifCNBV.Free;
   if ClasifSHCP <> nil then ClasifSHCP.Free;
   if SubTipoBanco <> nil then SubTipoBanco.Free;
   if Cliente <> nil then Cliente.Free;
   if CatMin <> nil then CatMin.Free;
   inherited;
end;


function TCrCoo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoo;
begin
   W:=TWCrCoo.Create(Self);
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


Function TCrCoo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IntCrCon.it','F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrCoo.InternalLocaliza:Boolean;
var
  sRevolvente, sLinea, sSituacion : string;
begin
  Result := False;
  F_VENCIMIENTO.AsDateTime:= F_AUT_COMITE.AsDateTime + DIAS_PLAZO.AsInteger;
  IMP_DISPONER.AsFloat := IMP_AUTORIZADO.AsFloat - IMP_DISPUESTO.AsFloat;
  Result := True;
end;

function TCrCoo.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CRE_CONTRATO********************)
(*                                                                              *)
(*  FORMA DE CRE_CONTRATO                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_CONTRATO********************)

procedure TWCrCoo.FormShow(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.B_EVENTUAL.Control:=chB_EVENTUAL;
      Objeto.B_RESTRUCTURA.Control:=chB_RESTRUCTURA;
      Objeto.B_REVOLVENTE.Control:=chB_REVOLVENTE;
      Objeto.COMITE_AUT.Control:=edCOMITE_AUT;
      Objeto.CVE_DESTINO.Control:=edCVE_DESTINO;
      Objeto.CVE_GARANTIA.Control:=edCVE_GARANTIA;
      Objeto.CVE_ORIGEN_REC.Control:=edCVE_ORIGEN_REC;
      Objeto.CVE_USU_AUTORIZA.Control:=edCVE_USU_AUTORIZA;
      Objeto.DIAS_PLAZO.Control:=edDIAS_PLAZO;
      Objeto.FACT_PROPOR_GAR.Control:=edFACT_PROPOR_GAR;
      Objeto.F_AUT_COMITE.Control:=edF_AUT_COMITE;
      Objeto.F_AUT_CREDITO.Control:=edF_AUT_CREDITO;
      Objeto.F_ENTREGA_RECUR.Control:=edF_ENTREGA_RECUR;
      Objeto.IMP_AUTORIZADO.Control:=edIMP_AUTORIZADO;
      Objeto.IMP_DISPUESTO.Control:=edIMP_DISPUESTO;
      Objeto.IMP_TRANSITO.Control:=edIMP_TRANSITO;
      Objeto.NUM_AMPLIACION.Control:=edNUM_AMPLIACION;
      Objeto.TX_COND_GRALES.Control:=edTX_COND_GRALES;
      Objeto.CODIGO_ERROR.Control:=edCODIGO_ERROR;
      Objeto.SIT_LINEA.Control:=edSIT_LINEA;
      Objeto.CVE_SUB_TIP_BCO.Control:=edCVE_SUB_TIP_BCO;
      Objeto.CVE_CLASIF_CNBV.Control:=edCVE_CLASIF_CNBV;
      Objeto.CVE_CLASIF_SHCP.Control:=edCVE_CLASIF_SHCP;
      Objeto.CVE_CAT_MIN.Control := edCve_cat_minimo;
end;

procedure TWCrCoo.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.B_EVENTUAL.Control:=nil;
      Objeto.B_RESTRUCTURA.Control:=nil;
      Objeto.B_REVOLVENTE.Control:=nil;
      Objeto.COMITE_AUT.Control:=nil;
      Objeto.CVE_DESTINO.Control:=nil;
      Objeto.CVE_GARANTIA.Control:=nil;
      Objeto.CVE_ORIGEN_REC.Control:=nil;
      Objeto.CVE_USU_AUTORIZA.Control:=nil;
      Objeto.DIAS_PLAZO.Control:=nil;
      Objeto.FACT_PROPOR_GAR.Control:=nil;
      Objeto.F_AUT_COMITE.Control:=nil;
      Objeto.F_AUT_CREDITO.Control:=nil;
      Objeto.F_ENTREGA_RECUR.Control:=nil;
      Objeto.IMP_AUTORIZADO.Control:=nil;
      Objeto.IMP_DISPUESTO.Control:=nil;
      Objeto.IMP_TRANSITO.Control:=nil;
      Objeto.NUM_AMPLIACION.Control:=nil;
      Objeto.TX_COND_GRALES.Control:=nil;
      Objeto.CODIGO_ERROR.Control:=nil;
      Objeto.SIT_LINEA.Control:=nil;
      Objeto.CVE_SUB_TIP_BCO.Control:=nil;
      Objeto.CVE_CLASIF_CNBV.Control:=nil;
      Objeto.CVE_CLASIF_SHCP.Control:=nil;
      Objeto.CVE_CAT_MIN.Control := nil;
end;

procedure TWCrCoo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCoo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCoo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCoo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
