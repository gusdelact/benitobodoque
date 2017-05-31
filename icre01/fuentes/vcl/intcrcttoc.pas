// Sistema         : Clase de CrCttoC
// Fecha de Inicio : 12/06/2003
// Función forma   : Clase de CrCttoC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :   intctto
Unit IntCrcttoc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntLinkit,
IntParamCre,

        IntCrCto,       //Contrato Crédito

        IntCtto,        //Contrato
//        IntProd,        //Producto
        IntDom,         //Domicilio
        IntGcto,        //Promotor
        IntUnNeg,       //Inidad de Negocio
        IntMpers        //Persona

        ;

Type
 TCrcttoc= class;

  TWCrcttoc=Class(TForm)
    InterForma1             : TInterForma;
    lbTITULAR: TLabel;
    lbCONTRATO: TLabel;
    lbDOMICILIO: TLabel;
    lbPROMOTOR: TLabel;
    lbGRUPO: TLabel;
    lbTIPOCTA: TLabel;
    lbCORRESPONDENCIA: TLabel;
    edID_TITULAR: TEdit;
    edNOMBRE_TITULAR: TEdit;
    edNOMBRE_CONTRATO: TEdit;
    edID_DOMICILIO: TEdit;
    edCALLE_NUMERO: TEdit;
    edNOMBRE_PROMOTOR: TEdit;
    edID_PROMOTOR: TEdit;
    cbTIPO_CUENTA: TComboBox;
    cbCORRESPONDENCIA: TComboBox;
    edDESC_UNNEGOCIO: TEdit;
    edUNIDAD_NEGOCIO: TEdit;
    edNOMBRE_GRUPO: TEdit;
    rgREGISTRO: TGroupBox;
    Label10: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label17: TLabel;
    edF_ALTA: TEdit;
    edF_MODIF: TEdit;
    edUSU_ALTA: TEdit;
    edUSU_MODIF: TEdit;
    edUSU_CANCELA: TEdit;
    edF_CANCELA: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilDOMICILIO: TInterLinkit;
    btDOMICILIO: TBitBtn;
    btPROMOTOR: TBitBtn;
    Label1: TLabel;
    edID_PROM_ADM: TEdit;
    edNAME_PROM_ADM: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btDOMICILIOClick(Sender: TObject);
    procedure ilDOMICILIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilDOMICILIOEjecuta(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
//    procedure ilPROMOTOREjecuta(Sender: TObject);  EASA 09.MAR.2007 >/ }
    procedure edNOMBRE_CONTRATOExit(Sender: TObject);
    procedure edID_DOMICILIOExit(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure edUNIDAD_NEGOCIOExit(Sender: TObject);
    procedure cbTIPO_CUENTAExit(Sender: TObject);
    procedure cbCORRESPONDENCIAExit(Sender: TObject);
    private
    { Private declarations }
    Procedure ObtenUnidadNegocio;
    Procedure ValidaPromotor;
    public
    { Public declarations }
    Objeto : TCrcttoc;
end;
 TCrcttoc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ID_CONTRATO             : TInterCampo;
        CVE_MONEDA              : TInterCampo;
        CVE_SEGMENTO            : TInterCampo;
        CVE_TIP_CONTRATO        : TInterCampo;
        ID_CTO_LIQ              : TInterCampo;
        ID_PERS_ASOCIAD         : TInterCampo;
        ID_GRUPO                : TInterCampo;
        ID_DOMICILIO            : TInterCampo;
        Id_EMPRESA              : TInterCampo;
        ID_ENTIDAD              : TInterCampo;
        CVE_CORRESP             : TInterCampo;
        CVE_PRODUCTO            : TInterCampo;
        CVE_TIPO_CTA            : TInterCampo;
        B_ASIG_SEG_AUT          : TInterCampo;
        B_IMPRESO               : TInterCampo;
        F_ALTA                  : TInterCampo;
        F_BAJA                  : TInterCampo;
        ID_TITULAR              : TInterCampo;
        NOMB_CONTRATO           : TInterCampo;
        SIT_CONTRATO            : TInterCampo;
        CVE_USUAR_MODIF         : TInterCampo;
        FH_MODIFICACION         : TInterCampo;
        B_DOCTOS_VERIF          : TInterCampo;
        F_TRASPASO              : TInterCampo;
        F_REACTIVACION          : TInterCampo;
        B_RESTRINGIDO           : TInterCampo;
        TX_COMENTARIO           : TInterCampo;
        CVE_CONCEP_CTO          : TInterCampo;
        CVE_ACTIV_CTO           : TInterCampo;
        IMP_VALUACION           : TInterCampo;
        FH_VALUACION            : TInterCampo;
        CVE_USU_ALTA            : TInterCampo;
        // </ EASA4011  09.MAR.2007      Req. Promotor asignado
        ID_PROM_ADMON           : TInterCampo;
        NOM_PROM_ASO            : TInterCampo;
        NOM_PROM_ADM            : TInterCampo;
        NOM_GRUPO               : TInterCampo;
        // </ END_EASA
        ParamCre        : TParamCre;

        ContrCred       : TCrCto;
//        Producto        : TProducto;
        Domicilio       : TDomicilio;
        Promotor        : TGpoCto;
        UnNegocio       : TUnNegocio;
        Titular         : TMPersona;

        VLtitular       : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    InternalPost    : Boolean; override;
        Function    InsertaContratoCorp  : Boolean;
        Function    DameProductoCorp : String;

      published
      end;



implementation
//Uses

{$R *.DFM}



constructor TCrcttoc.Create( AOwner : TComponent );
begin Inherited;
        ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
        CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
        CVE_SEGMENTO :=CreaCampo('CVE_SEGMENTO',ftString,tsNinguno,tsNinguno,False);
        CVE_TIP_CONTRATO :=CreaCampo('CVE_TIP_CONTRATO',ftString,tsNinguno,tsNinguno,False);
        ID_CTO_LIQ :=CreaCampo('ID_CTO_LIQ',ftFloat,tsNinguno,tsNinguno,False);
        ID_PERS_ASOCIAD :=CreaCampo('ID_PERS_ASOCIAD',ftFloat,tsNinguno,tsNinguno,False);
        ID_GRUPO :=CreaCampo('ID_GRUPO',ftInteger,tsNinguno,tsNinguno,False);
        ID_DOMICILIO :=CreaCampo('ID_DOMICILIO',ftFloat,tsNinguno,tsNinguno,False);
        ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,False);
        ID_ENTIDAD :=CreaCampo('ID_ENTIDAD',ftInteger,tsNinguno,tsNinguno,False);
        CVE_CORRESP :=CreaCampo('CVE_CORRESP',ftString,tsNinguno,tsNinguno,False);
        with CVE_CORRESP do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('RETENER');                  ComboDatos.Add('RT');
                ComboLista.Add('CORREO');                   ComboDatos.Add('CR');
                ComboLista.Add('DHL');                      ComboDatos.Add('DH');
                ComboLista.Add('FEDERAL EXPRESS');          ComboDatos.Add('FX');
                ComboLista.Add('LIQUIDACION');              ComboDatos.Add('LQ');
                ComboLista.Add('RET. DE BANCO');            ComboDatos.Add('RB');
                ComboLista.Add('RET. DE CTAS. PROPIAS');    ComboDatos.Add('RP');
                ComboLista.Add('RET. DE CTES. MENSAJEROS'); ComboDatos.Add('RC');
                ComboLista.Add('APARTADO POSTAL');          ComboDatos.Add('AP');
          end;
        CVE_PRODUCTO :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
        CVE_TIPO_CTA :=CreaCampo('CVE_TIPO_CTA',ftString,tsNinguno,tsNinguno,False);
        with CVE_TIPO_CTA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('ADMINISTRATIVO'); ComboDatos.Add('AD');
                ComboLista.Add('EMPLEADO');       ComboDatos.Add('EM');
                ComboLista.Add('NORMAL');         ComboDatos.Add('NO');
          end;
        B_ASIG_SEG_AUT  :=CreaCampo('B_ASIG_SEG_AUT',ftString,tsNinguno,tsNinguno,False);
        with B_ASIG_SEG_AUT do
          begin Size:=1;
                UseCombo:=True;
                ComboLista.Add('SI');                  ComboDatos.Add('V');
                ComboLista.Add('NO');                  ComboDatos.Add('F');
          end;
        B_IMPRESO :=CreaCampo('B_IMPRESO',ftString,tsNinguno,tsNinguno,False);
        F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,False);
        F_BAJA :=CreaCampo('F_BAJA',ftDate,tsNinguno,tsNinguno,False);
        ID_TITULAR :=CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
        NOMB_CONTRATO :=CreaCampo('NOMB_CONTRATO',ftString,tsNinguno,tsNinguno,False);
        SIT_CONTRATO :=CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsNinguno,False);
        with SIT_CONTRATO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');  ComboDatos.Add('AC');
                ComboLista.Add('1');  ComboDatos.Add('IN');
                ComboLista.Add('2');  ComboDatos.Add('CA');
          end;
        CVE_USUAR_MODIF :=CreaCampo('CVE_USUAR_MODif',ftString,tsNinguno,tsNinguno,False);
        FH_MODIFICACION :=CreaCampo('FH_Modificacion',ftDatetime,tsNinguno,tsNinguno,False);
        B_DOCTOS_VERIF :=CreaCampo('B_DOCTOS_VERif',ftString,tsNinguno,tsNinguno,False);
        F_TRASPASO :=CreaCampo('F_TRASPASO',ftDate,tsNinguno,tsNinguno,False);
        F_REACTIVACION :=CreaCampo('F_REACTIVACION',ftDate,tsNinguno,tsNinguno,False);
        B_RESTRINGIDO :=CreaCampo('B_RESTRINGIDO',ftstring,tsNinguno,tsNinguno,False);
        TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftstring,tsNinguno,tsNinguno,False);
        CVE_CONCEP_CTO := CreaCampo('CVE_CONCEP_CTO',ftString,tsNinguno,tsNinguno,False);
        CVE_ACTIV_CTO := CreaCampo('CVE_ACTIV_CTO',ftString,tsNinguno,tsNinguno,False);
        IMP_VALUACION := CreaCampo('IMP_VALUACION',ftInteger,tsNinguno,tsNinguno,False);
        FH_VALUACION:= CreaCampo('FH_VALUACION',ftDate,tsNinguno,tsNinguno,False);
        CVE_USU_ALTA :=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,False);

      // </ EASA4011  09.MAR.2007      Req. Promotor asignado
      ID_PROM_ADMON := CreaCampo('ID_PROM_ADMON', ftFloat, tsNinguno, tsNinguno, False );
      NOM_PROM_ASO := CreaCampo('NOM_PROM_ASO', ftString, tsNinguno, tsNinguno, False );
      NOM_PROM_ADM := CreaCampo('NOM_PROM_ADM', ftString, tsNinguno, tsNinguno, False );
      NOM_GRUPO :=CreaCampo('NOM_GRUPO',ftInteger,tsNinguno,tsNinguno,False);
      //END_EASA

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrcttoc.Hlp';
      ShowMenuReporte:=True;

      ContrCred := TCrCto.Create(Self);
      ContrCred.MasterSource := Self;
      ContrCred.FieldByName('ID_CONTRATO').MasterField:= 'ID_CONTRATO';

{      Producto := TProducto.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO').MasterField:='CVE_PRODUCTO';}

      Domicilio := TDomicilio.Create(Self);
      Domicilio.MasterSource:=Self;
      Domicilio.FieldByName('ID_DOMICILIO').MasterField:='ID_DOMICILIO';

      Promotor := TGpoCto.Create(Self);
      Promotor.MasterSource:=Self;
      Promotor.FieldByName('ID_PERS_ASOCIAD').MasterField:= 'ID_PERS_ASOCIAD';
      Promotor.FieldByName('ID_GRUPO').MasterField:= 'ID_GRUPO';

      UnNegocio := TUnNegocio.Create(Self);
      UnNegocio.MasterSource:=Self;
      UnNegocio.FieldByName('ID_ENTIDAD').MasterField:='ID_ENTIDAD';


      Titular := TMPersona.Create(Self);
      Titular.MasterSource:= Self;
      Titular.FieldByName('ID_PERSONA').MasterField:='ID_TITULAR';

end;

Destructor TCrcttoc.Destroy;
begin
//      if ContrCred <> nil then
//         ContrCred.Free;
      //end if
{      if Producto <> nil then
         Producto.Free;
      //end if         }

      if Domicilio <> nil then
         Domicilio.Free;
      //end if

      if Promotor <> nil then
         Promotor.Free;
      //end if

      if UnNegocio <> nil then
         UnNegocio.Free;
      //end if

      if Titular <> nil then
         Titular.Free;
      //end if}

      inherited;
end;


function TCrcttoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcttoc;
begin
   W:=TWCrcttoc.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftCaptura;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrcttoc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcttoc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

Function    TCrcttoc.InsertaContratoCorp  : Boolean;
var     ContratoPost :TContrato;
        VLSalida : Boolean;
begin
     //crea clase de contrato
     ContratoPost :=TContrato.Create(Self);
     try
        ContratoPost.GetParams(Self);
        //lo pone en modo de Insert
        ContratoPost.Append;
        //asigna parámetros
//        ID_GRUPO.AsInteger := Promotor.Id_Grupo.AsInteger;  // </ EASA4011  09.MAR.2007      Req. Promotor asignado
        NOMB_CONTRATO.AsString := ContrCred.Acreditado.Persona.Nombre.AsString;

        ContratoPost.CVE_MONEDA.AsInteger := ContrCred.CVE_MONEDA.AsInteger;// CVE_MONEDA.AsInteger;
        ContratoPost.CVE_SEGMENTO.AsString := CVE_SEGMENTO.AsString;
        ContratoPost.CVE_TIP_CONTRATO.AsString := 'CRED';
        ContratoPost.ID_PERS_ASOCIAD.AsInteger := ID_PERS_ASOCIAD.AsInteger;
        ContratoPost.ID_GRUPO.AsInteger := ID_GRUPO.AsInteger;
        ContratoPost.ID_DOMICILIO.AsInteger := ID_DOMICILIO.AsInteger;
        ContratoPost.ID_EMPRESA.AsInteger := Apli.IdEmpresa;
        ContratoPost.ID_ENTIDAD.AsInteger := ID_ENTIDAD.AsInteger;
        ContratoPost.CVE_CORRESP.AsString := CVE_CORRESP.AsString;
        ContratoPost.CVE_PRODUCTO.AsString := ContrCred.ObtenProdCorp; //CVE_PRODUCTO.AsString;
        ContratoPost.CVE_TIPO_CTA.AsString := CVE_TIPO_CTA.AsString;
        ContratoPost.B_ASIG_SEG_AUT.AsString := 'F';
        ContratoPost.B_IMPRESO.AsString := 'F';
        ContratoPost.ID_TITULAR.AsInteger := ID_TITULAR.AsInteger;
        ContratoPost.NOMB_CONTRATO.AsString := NOMB_CONTRATO.AsString;
        ContratoPost.SIT_CONTRATO.AsString := 'AC';
        ContratoPost.SIT_DOCUMENTOS.AsString := 'CO';
        ContratoPost.B_DOCTOS_VERIF.AsString := 'F';  //constante
        ContratoPost.B_RESTRINGIDO.AsString := 'F';
        ContratoPost.CVE_CONCEP_CTO.AsString := CVE_CONCEP_CTO.AsString;
        ContratoPost.CVE_ACTIV_CTO.AsInteger := 3;   //constante
        ContratoPost.FH_Modificacion.AsString:=FormatDateTime('DD/MM/YYYY HH:MM',Now);
        ContratoPost.Cve_Usuar_Modif.AsString:=Apli.Usuario;
        ContratoPost.F_Alta.AsString:=FormatDateTime('DD/MM/YYYY',Date);
        //findkey de clases auxiliares de contrato
//        ContratoPost.Producto.FindKey([ContratoPost.CVE_PRODUCTO.AsString]);
//        ContratoPost.Moneda.FindKey([ContratoPost.CVE_MONEDA.AsString]);
        //inserta el contrato
        ContratoPost.Post;
        //asigna variable de salida
        VLSalida := True;
        //Asigna Contrato
        ID_CONTRATO.AsFloat := ContratoPost.ID_CONTRATO.AsFloat;
     Finally
        if ContratoPost <> nil then ContratoPost.Free;
     end;
     InsertaContratoCorp  := VLSalida;
end;


Function TCrcttoc.InternalPost : Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;
     if Modo=moEdit then
     begin
          Result:=Inherited InternalPost;
     end;
     if Modo=moAppend then
     begin
          try
             VLSalida := InsertaContratoCorp;
          Except
               Beep;Beep;Beep;Beep;
               ShowMessage('Problemas con el Alta de Contrato. Avise Urgentemente a Sistemas');
          end;
     end;
     AutoRefresh := False;
     InternalPost := VLSalida;
end;

Function    TCrcttoc.DameProductoCorp : String;
var    VLSalidaStr : String;
begin
     VLSalidaStr := 'Error';
     //Asigna producto Producto
     VLSalidaStr := 'CRMP';

     DameProductoCorp := VLSalidaStr;
end;

(***********************************************FORMA CrCttoC********************)
(*                                                                              *)
(*  FORMA DE CrCttoC                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCttoC********************)

procedure TWCrcttoc.FormShow(Sender: TObject);
begin

      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_PERS_ASOCIAD.Control := edID_PROMOTOR;
      Objeto.ID_ENTIDAD.Control := edUNIDAD_NEGOCIO;
      Objeto.ID_TITULAR.Control := edID_TITULAR;
      Objeto.CVE_TIPO_CTA.Control := cbTIPO_CUENTA;
      Objeto.CVE_CORRESP.Control := cbCORRESPONDENCIA;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USUAR_MODIF.Control := edUSU_MODIF;
      Objeto.FH_MODIFICACION.Control := edF_MODIF;
      Objeto.CVE_USU_ALTA.Control := edUSU_ALTA;
      Objeto.ID_PROM_ADMON.Control := edID_PROM_ADM; // </ EASA4011  09.MAR.2007      Req. Promotor asignado

      Objeto.ContrCred.Acreditado.Persona.Nombre.Control := edNOMBRE_TITULAR;
      Objeto.ContrCred.Acreditado.Persona.Nombre.Control := edNOMBRE_CONTRATO;
//      Objeto.ContrCred.Acreditado.Persona.Id_Domicilio.Control := edID_DOMICILIO;
      Objeto.Domicilio.IdDomicilio.Control := edID_DOMICILIO;
      Objeto.Domicilio.CalleNumero.Control := edCALLE_NUMERO;

     //EASA4011  09.MAR.2007      Req. Promotor asignado
     // Objeto.Promotor.PromAsociado.Nombre.Control := edNOMBRE_PROMOTOR;
      Objeto.NOM_PROM_ASO.Control := edNOMBRE_PROMOTOR;
      //Objeto.Promotor.Desc_Gpo_Contrat.Control := edNOMBRE_GRUPO;
      Objeto.NOM_GRUPO.Control := edNOMBRE_GRUPO;
      Objeto.UnNegocio.Desc_Entidad.Control := edDESC_UNNEGOCIO;
      Objeto.NOM_PROM_ADM.Control := edNAME_PROM_ADM;
      //END_EASA

      InterForma1.MsgPanel := MsgPanel;
   //Objeto
end;

procedure TWCrcttoc.FormDestroy(Sender: TObject);
begin
      Objeto.ID_PERS_ASOCIAD.Control := nil;
      Objeto.ID_ENTIDAD.Control := nil;
      Objeto.ID_TITULAR.Control := nil;
      Objeto.CVE_TIPO_CTA.Control := nil;
      Objeto.CVE_CORRESP.Control := nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USUAR_MODIF.Control := nil;
      Objeto.FH_MODIFICACION.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.ID_PROM_ADMON.Control := nil; // </ EASA4011  09.MAR.2007      Req. Promotor asignado

      Objeto.ContrCred.Acreditado.Persona.Nombre.Control := nil;
      Objeto.ContrCred.Acreditado.Persona.Nombre.Control := nil;
//      Objeto.ContrCred.Acreditado.Persona.Id_Domicilio.Control := edID_DOMICILIO;
      Objeto.Domicilio.IdDomicilio.Control := nil;
      Objeto.Domicilio.CalleNumero.Control := nil;

     //EASA4011  09.MAR.2007      Req. Promotor asignado
     // Objeto.Promotor.PromAsociado.Nombre.Control := edNOMBRE_PROMOTOR;
      Objeto.NOM_PROM_ASO.Control := nil;
      //Objeto.Promotor.Desc_Gpo_Contrat.Control := edNOMBRE_GRUPO;
      Objeto.NOM_GRUPO.Control := nil;
      Objeto.UnNegocio.Desc_Entidad.Control := nil;
      Objeto.NOM_PROM_ADM.Control := nil;
      //END_EASA

   //Objeto
end;

procedure TWCrcttoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcttoc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.Domicilio.IdDomicilio.AsString := Objeto.ContrCred.Acreditado.Persona.Id_Domicilio.AsString;
   Objeto.Domicilio.FindKey([Objeto.ContrCred.Acreditado.Persona.Id_Domicilio.AsString]);
   Objeto.CVE_TIPO_CTA.AsString := 'NO';
   Objeto.CVE_CORRESP.AsString := 'CR';
   Objeto.ID_TITULAR.AsString := Objeto.ContrCred.Acreditado.ID_ACREDITADO.AsString;
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;

//   objeto.Producto.BuscaWhereString := '(PRODUCTO.CVE_TIP_CONTRATO='+ #39 + 'CRED'+ #39 + ')' +
//                                       ' and (PRODUCTO.SIT_PRODUCTO = '+ #39 + 'AC' + #39 +
//                                       ' ) and (Prod_Aut_Empresa.Sit_Prod_Aut = ' + #39 + 'AC' + #39 +')';
//   objeto.Producto.FilterString := '(PRODUCTO.CVE_TIP_CONTRATO=' + #39 + 'CRED' + #39 +
//                                   ') and (PRODUCTO.SIT_PRODUCTO = ' + #39 + 'AC' +#39 + ')';
//   objeto.Concepto.BuscaWhereString:='CVE_CTTE=' + #39 + 'TI' + #39 ;
//   objeto.UnNegocio.BuscaWhereString := 'UN_NEG.CVE_TIPO_ENTIDAD = ' + #39 + 'SUCU' + #39 +
   Objeto.CVE_CONCEP_CTO.AsString := 'T001';
   Objeto.CVE_SEGMENTO.AsString := 'EP';
   objeto.Cve_Tipo_Cta.AsString:='NO';
   Objeto.Domicilio.FindKey([edID_DOMICILIO.text]);

   edNOMBRE_TITULAR.SetFocus;
end;

procedure TWCrcttoc.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.ID_TITULAR.AsString := Objeto.ContrCred.Acreditado.ID_ACREDITADO.AsString;
   Objeto.CVE_USUAR_MODIF.AsString := Objeto.Apli.Usuario;
   Objeto.FH_MODIFICACION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   edNOMBRE_CONTRATO.SetFocus;
end;

procedure TWCrcttoc.btDOMICILIOClick(Sender: TObject);
begin
   Objeto.Domicilio.ShowAll := True;
   if Objeto.Domicilio.Busca then
      InterForma1.NextTab(edID_DOMICILIO);
   //end if
end;

procedure TWCrcttoc.ilDOMICILIOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TWCrcttoc.ilDOMICILIOEjecuta(Sender: TObject);
begin
   if Objeto.Domicilio.FindKey([ilDOMICILIO.Buffer]) then
      InterForma1.NextTab(edID_DOMICILIO);
   //end if
end;

procedure TWCrcttoc.btPROMOTORClick(Sender: TObject);
// </ EASA4011  09.MAR.2007      Req. Promotor asignado
{begin
   Objeto.Promotor.ShowAll := True;
   if Objeto.Promotor.Busca then
   Begin
      ObtenUnidadNegocio;
      Objeto.UnNegocio.FindKey([Objeto.ID_ENTIDAD.AsString]);
      InterForma1.NextTab(btPROMOTOR);
   end;
 END_EASA >/ }
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('CRGPOPROM.IT','I');
      Try
        If T.Execute Then
           Begin
             ID_PERS_ASOCIAD.AsString := T.DameCampo(0);
             NOM_PROM_ASO.AsString := T.DameCampo(1);
             ID_PROM_ADMON.AsString := T.DameCampo(2);
             NOM_PROM_ADM.AsString := T.DameCampo(3);
             ID_GRUPO.AsString := T.DameCampo(4);
             NOM_GRUPO.AsString := T.DameCampo(5);
             ObtenUnidadNegocio;
             Objeto.UnNegocio.FindKey([Objeto.ID_ENTIDAD.AsString]);
             ValidaPromotor;
             InterForma1.NextTab(btPROMOTOR);
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWCrcttoc.ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;
{// </ EASA4011  09.MAR.2007      Req. Promotor asignado
procedure TWCrcttoc.ilPROMOTOREjecuta(Sender: TObject);
Begin
   if Objeto.Promotor.FindKeyNear([ilPROMOTOR.Buffer],['ID_PERS_ASOCIAD']) then
   Begin
      ObtenUnidadNegocio;
      InterForma1.NextTab(edID_PROMOTOR);
   end;
end;
END_EASA >/ }
procedure TWCrcttoc.edNOMBRE_CONTRATOExit(Sender: TObject);
Begin
        InterForma1.ValidaExit(edNOMBRE_CONTRATO,True,'',True);
end;

procedure TWCrcttoc.edID_DOMICILIOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg := '';

   Objeto.ID_DOMICILIO.GetFromControl;
   if Objeto.ID_DOMICILIO.AsString = '' then
   Begin
       VLSalida:= False;
       VLMsg:= 'Favor de indicar el Domicilio';
   end;
   InterForma1.ValidaExit(edID_DOMICILIO,VLSalida,VLMsg,True);
end;

procedure TWCrcttoc.edID_PROMOTORExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg := '';

   Objeto.ID_PERS_ASOCIAD.GetFromControl;
   if Objeto.ID_PERS_ASOCIAD.AsString = '' then
   Begin
       VLSalida:= False;
       VLMsg:= 'Favor de indicar el Promotor';
   End;
   InterForma1.ValidaExit(btPROMOTOR,VLSalida,VLMsg,True);
end;

procedure TWCrcttoc.edUNIDAD_NEGOCIOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg := '';

   Objeto.ID_ENTIDAD.GetFromControl;
   if Objeto.ID_ENTIDAD.AsString = '' then
   Begin
       VLSalida:= False;
       VLMsg:= 'Favor de indicar la Unidad de Negocio';
   End;
   InterForma1.ValidaExit(edUNIDAD_NEGOCIO,VLSalida,VLMsg,True);
end;

procedure TWCrcttoc.cbTIPO_CUENTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbTIPO_CUENTA,True,'',True);
end;

procedure TWCrcttoc.cbCORRESPONDENCIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbCORRESPONDENCIA,True,'',True);
end;

procedure TWCrcttoc.ObtenUnidadNegocio;
var vlsql       : String;
    vlUnidadNeg : String;
    vlEmpresa   : Integer;
begin
   vlUnidadNeg := '';
   vlsql := ' SELECT ID_ENTIDAD FROM UNIDAD_NEGOCIO WHERE ID_ENTIDAD IN ' +
            '(SELECT ID_ENTIDAD FROM EMPLEADO WHERE ID_PERSONA = ' +
            Objeto.ID_PERS_ASOCIAD.AsString + ')';
   GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_ENTIDAD',vlUnidadNeg,False);
   if vlUnidadNeg <> '' then
      Objeto.ID_ENTIDAD.AsString := vlUnidadNeg
   else
   Begin
      ShowMessage('No se encontró Unidad de Negocio del Promotor');
      Objeto.ID_ENTIDAD.AsString := '';
   end;
end;

PROCEDURE TWCrcttoc.ValidaPromotor;
var
// Funcion agregada por David Hernandez Hernandez.
// Octubre 2010

    StpValidaProm :  TStoredProc;
BEGIN

    StpValidaProm := TStoredProc.CREATE(Self);
    try
       WITH StpValidaProm DO
       BEGIN
          StpValidaProm.DatabaseName   := SELF.Objeto.Apli.DatabaseName;
          StpValidaProm.SessionName    := SELF.Objeto.Apli.SessionName;
          StpValidaProm.StoredProcName := 'STPCRVALPROMASOC';

          Params.CLEAR;
          Params.CreateParam(ftFloat ,'PIDPERSPROMASOC',ptInput);
          Params.CreateParam(ftFloat ,'PIDPERSPROMADM' ,ptInput);
          Params.CreateParam(ftFloat ,'PSIDGRUPO'      ,ptOutput);
          Params.CreateParam(ftFloat ,'PSRESULTADO'    ,ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO'  ,ptOutput);
          PREPARE;
          ParamByName('pIdPersPromAsoc').AsString := Objeto.ID_PERS_ASOCIAD.AsString;
          ParamByName('pIdPersPromAdm').AsString  := Objeto.ID_PROM_ADMON.AsString;

          ExecProc;

          IF ParamByName('PSResultado').AsInteger = 0 THEN
          BEGIN
             Objeto.ID_GRUPO.AsFloat := ParamByName('PSIDGRUPO').AsFloat;

             //IF ( ( Modo = moEdit ) OR ( Modo = moAppend ) ) THEN
             //  IF ParamByName('psTxResultado').AsString <> CNULL THEN
             //     MessageDlg(ParamByName('psTxResultado').AsString,mtInformation, [ mbOK ], 0);
          END
          ELSE
          BEGIN
             ShowMessage('PROBLEMAS AL OBTENER EL GRUPO CONTRATO REAL : ' +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          END;
          UnPrepare;
       END;
    finally
       StpValidaProm.Free;
    END;
END;

end.
