// Sistema         : Clase de DI_NO_CLIENTE
// Fecha de Inicio : 25/09/2007
// Función forma   : Clase de DI_NO_CLIENTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alicia Beatriz Maya Ramirez
// Comentarios     :
Unit IntDiNoClien;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntLDiActEco, IntLinkit;

Type
 TDiNoClien= class; 

  TWDiNoCliente=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_NO_CLIENTE : TLabel; 
    edID_NO_CLIENTE : TEdit;
    lbNOMBRE : TLabel; 
    edNOMBRE : TEdit;
    lbF_NACIMIENTO : TLabel; 
    dtpF_NACIMIENTO : TInterDateTimePicker; 
    edF_NACIMIENTO : TEdit;
    lbTX_CALLE : TLabel; 
    edTX_CALLE : TEdit;
    lbTX_NO_EXT : TLabel; 
    edTX_NO_EXT : TEdit;
    lbTX_NO_INT : TLabel; 
    edTX_NO_INT : TEdit;
    lbTX_COLONIA : TLabel; 
    edTX_COLONIA : TEdit;
    lbTX_COD_POSTAL : TLabel; 
    edTX_COD_POSTAL : TEdit;
    lbTX_DELEGACION : TLabel; 
    edTX_DELEGACION : TEdit;
    lbTX_NACIONALIDAD : TLabel; 
    edTX_NACIONALIDAD : TEdit;
    lbNUM_IDENTIFIC : TLabel; 
    edNUM_IDENTIFIC : TEdit;
    lbTX_CURP : TLabel; 
    edTX_CURP : TEdit;
    lbTX_RFC : TLabel; 
    edTX_RFC : TEdit;
    lbTX_FEA : TLabel; 
    edTX_FEA : TEdit;
    lbCVE_ACTIV_ECO_SITI : TLabel; 
    edCVE_ACTIV_ECO_SITI : TEdit;
    lbF_REGISTRO : TLabel; 
    edF_REGISTRO : TEdit;
    lbCVE_USU_REG : TLabel; 
    edCVE_USU_REG : TEdit;
    lbF_ULT_MOD : TLabel; 
    edF_ULT_MOD : TEdit;
    lbCVE_USU_MOD : TLabel; 
    edCVE_USU_MOD : TEdit;
    edActividad: TEdit;
    sbSiti: TSpeedButton;
    ilActividad: TInterLinkit;
    Panel2: TPanel;
    Label3: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    edCVE_PER_JURIDICA: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edTIPO_IDENTIFIC: TEdit;
    Label5: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilActividadCapture(Sender: TObject; var Show: Boolean);
    procedure ilActividadEjecuta(Sender: TObject);
    procedure sbSitiClick(Sender: TObject);
    procedure edCVE_PER_JURIDICAChange(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TDiNoClien;
end; 
 TDiNoClien= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_NO_CLIENTE            : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;
        NOMBRE                   : TInterCampo;
        F_NACIMIENTO             : TInterCampo;
        TX_CALLE                 : TInterCampo;
        TX_NO_EXT                : TInterCampo;
        TX_NO_INT                : TInterCampo;
        TX_COLONIA               : TInterCampo;
        TX_COD_POSTAL            : TInterCampo;
        TX_DELEGACION            : TInterCampo;
        TX_NACIONALIDAD          : TInterCampo;
        TIPO_IDENTIFIC           : TInterCampo;
        NUM_IDENTIFIC            : TInterCampo;
        TX_CURP                  : TInterCampo;
        TX_RFC                   : TInterCampo;
        TX_FEA                   : TInterCampo;
        CVE_ACTIV_ECO_SITI       : TInterCampo;
        F_REGISTRO               : TInterCampo;
        CVE_USU_REG              : TInterCampo;
        F_ULT_MOD                : TInterCampo;
        CVE_USU_MOD              : TInterCampo;
        Siti : TLdiActEco;
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


constructor TDiNoClien.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_NO_CLIENTE :=CreaCampo('ID_NO_CLIENTE',ftFloat,tsNinguno,tsNinguno,True);
                ID_NO_CLIENTE.Caption:='Número de No Cliente';
      CVE_PER_JURIDICA :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);
                CVE_PER_JURIDICA.Caption:='Persona Juridica';
      NOMBRE :=CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
                NOMBRE.Caption:='Nombre';
      F_NACIMIENTO :=CreaCampo('F_NACIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_NACIMIENTO.Caption:='Fecha Nacimiento';
      TX_CALLE :=CreaCampo('TX_CALLE',ftString,tsNinguno,tsNinguno,True);
                TX_CALLE.Caption:='Calle';
      TX_NO_EXT :=CreaCampo('TX_NO_EXT',ftString,tsNinguno,tsNinguno,True);
                TX_NO_EXT.Caption:='No Ext';
      TX_NO_INT :=CreaCampo('TX_NO_INT',ftString,tsNinguno,tsNinguno,True);
                TX_NO_INT.Caption:='No Int';
      TX_COLONIA :=CreaCampo('TX_COLONIA',ftString,tsNinguno,tsNinguno,True);
                TX_COLONIA.Caption:='Colonia';
      TX_COD_POSTAL :=CreaCampo('TX_COD_POSTAL',ftString,tsNinguno,tsNinguno,True);
                TX_COD_POSTAL.Caption:='Cod Postal';
      TX_DELEGACION :=CreaCampo('TX_DELEGACION',ftString,tsNinguno,tsNinguno,True);
                TX_DELEGACION.Caption:='Delegacion';
      TX_NACIONALIDAD :=CreaCampo('TX_NACIONALIDAD',ftString,tsNinguno,tsNinguno,True);
                TX_NACIONALIDAD.Caption:='Nacionalidad';
      TIPO_IDENTIFIC :=CreaCampo('TIPO_IDENTIFIC',ftString,tsNinguno,tsNinguno,True);
                TIPO_IDENTIFIC.Caption:='Tipo Identific';
      NUM_IDENTIFIC :=CreaCampo('NUM_IDENTIFIC',ftString,tsNinguno,tsNinguno,True);
                NUM_IDENTIFIC.Caption:='Número Identific';
      TX_CURP :=CreaCampo('TX_CURP',ftString,tsNinguno,tsNinguno,True);
                TX_CURP.Caption:='Curp';
      TX_RFC :=CreaCampo('TX_RFC',ftString,tsNinguno,tsNinguno,True);
                TX_RFC.Caption:='Rfc';
      TX_FEA :=CreaCampo('TX_FEA',ftString,tsNinguno,tsNinguno,True);
                TX_FEA.Caption:='Fea';
      CVE_ACTIV_ECO_SITI :=CreaCampo('CVE_ACTIV_ECO_SITI',ftString,tsNinguno,tsNinguno,True);
                CVE_ACTIV_ECO_SITI.Caption:='Clave de Activ Eco Siti';
      F_REGISTRO :=CreaCampo('F_REGISTRO',ftDateTime,tsNinguno,tsNinguno,True);
                F_REGISTRO.Caption:='Fecha Registro';
      CVE_USU_REG :=CreaCampo('CVE_USU_REG',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_REG.Caption:='Clave de Usu Reg';
      F_ULT_MOD :=CreaCampo('F_ULT_MOD',ftDateTime,tsNinguno,tsNinguno,True);
                F_ULT_MOD.Caption:='Fecha Última Mod';
      CVE_USU_MOD :=CreaCampo('CVE_USU_MOD',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MOD.Caption:='Clave de Usu Mod';
      FKeyFields.Add('ID_NO_CLIENTE');

      Siti := TLdiActEco.Create(Self);
      Siti.CVE_ACTIV_ECON.MasterField := 'CVE_ACTIV_ECO_SITI';
      Siti.MasterSource := Self;

      TableName := 'DI_NO_CLIENTE'; 
      UseQuery := True; 
      HelpFile := 'IntDiNoClien.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TDiNoClien.Destroy;
begin if SITI <> nil then SITI.Free;
      inherited;
end;


function TDiNoClien.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDiNoCliente;
begin
   W:=TWDiNoCliente.Create(Self);
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


Function TDiNoClien.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IDiNoCli.it','F');
      Try if Active then begin T.Param(0,ID_NO_CLIENTE.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TDiNoClien.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;

(***********************************************FORMA DI_NO_CLIENTE********************)
(*                                                                              *)
(*  FORMA DE DI_NO_CLIENTE                                                            *)
(*                                                                              *)
(***********************************************FORMA DI_NO_CLIENTE********************)

procedure TWDiNoCliente.FormShow(Sender: TObject);
begin
      Objeto.ID_NO_CLIENTE.Control:=edID_NO_CLIENTE;
      Objeto.CVE_PER_JURIDICA.Control:=edCVE_PER_JURIDICA;
      Objeto.NOMBRE.Control:=edNOMBRE;
      Objeto.F_NACIMIENTO.Control:=edF_NACIMIENTO;
      Objeto.TX_CALLE.Control:=edTX_CALLE;
      Objeto.TX_NO_EXT.Control:=edTX_NO_EXT;
      Objeto.TX_NO_INT.Control:=edTX_NO_INT;
      Objeto.TX_COLONIA.Control:=edTX_COLONIA;
      Objeto.TX_COD_POSTAL.Control:=edTX_COD_POSTAL;
      Objeto.TX_DELEGACION.Control:=edTX_DELEGACION;
      Objeto.TX_NACIONALIDAD.Control:=edTX_NACIONALIDAD;
      Objeto.TIPO_IDENTIFIC.Control:=edTIPO_IDENTIFIC;
      Objeto.NUM_IDENTIFIC.Control:=edNUM_IDENTIFIC;
      Objeto.TX_CURP.Control:=edTX_CURP;
      Objeto.TX_RFC.Control:=edTX_RFC;
      Objeto.TX_FEA.Control:=edTX_FEA;
      Objeto.CVE_ACTIV_ECO_SITI.Control:=edCVE_ACTIV_ECO_SITI;
      Objeto.F_REGISTRO.Control:=edF_REGISTRO;
      Objeto.CVE_USU_REG.Control:=edCVE_USU_REG;
      Objeto.F_ULT_MOD.Control:=edF_ULT_MOD;
      Objeto.CVE_USU_MOD.Control:=edCVE_USU_MOD;

      Objeto.Siti.CVE_ACTIV_ECON.Control:=edCVE_ACTIV_ECO_SITI;
      Objeto.Siti.DESC_ACTIV_ECON.Control:=edACTIVIDAD;
end;

procedure TWDiNoCliente.FormDestroy(Sender: TObject);
begin
      Objeto.ID_NO_CLIENTE.Control:=nil;
      Objeto.CVE_PER_JURIDICA.Control:=nil;
      Objeto.NOMBRE.Control:=nil;
      Objeto.F_NACIMIENTO.Control:=nil;
      Objeto.TX_CALLE.Control:=nil;
      Objeto.TX_NO_EXT.Control:=nil;
      Objeto.TX_NO_INT.Control:=nil;
      Objeto.TX_COLONIA.Control:=nil;
      Objeto.TX_COD_POSTAL.Control:=nil;
      Objeto.TX_DELEGACION.Control:=nil;
      Objeto.TX_NACIONALIDAD.Control:=nil;
      Objeto.TIPO_IDENTIFIC.Control:=nil;
      Objeto.NUM_IDENTIFIC.Control:=nil;
      Objeto.TX_CURP.Control:=nil;
      Objeto.TX_RFC.Control:=nil;
      Objeto.TX_FEA.Control:=nil;
      Objeto.CVE_ACTIV_ECO_SITI.Control:=nil;
      Objeto.F_REGISTRO.Control:=nil;
      Objeto.CVE_USU_REG.Control:=nil;
      Objeto.F_ULT_MOD.Control:=nil;
      Objeto.CVE_USU_MOD.Control:=nil;
      Objeto.Siti.CVE_ACTIV_ECON.Control:=NIL;
      Objeto.Siti.DESC_ACTIV_ECON.Control:=NIL;
   //Objeto
end;

procedure TWDiNoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDiNoCliente.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWDiNoCliente.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWDiNoCliente.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWDiNoCliente.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var bandera:Boolean;
    iNum:Integer;
    sQuery:String;
begin
   bandera:=true;
   Objeto.GetFromControl;
   if (edCVE_PER_JURIDICA.Text <> '0') and (edCVE_PER_JURIDICA.Text <> '1') then
      ShowMessage('Valor no valido para la Persona Jurídica (0 ó 1)'+#13+#13+'Rectifique');
   if (edTIPO_IDENTIFIC.Text <> '1') and (edTIPO_IDENTIFIC.Text <> '2') and
      (edTIPO_IDENTIFIC.Text <> '3') and (edTIPO_IDENTIFIC.Text <> '4') and
      (edTIPO_IDENTIFIC.Text <> '5') and (edTIPO_IDENTIFIC.Text <> '6') then
      ShowMessage('Valor no valido para el Tipo de Identificación (1, 2, 3, 4, 5 ó 6)'+#13+#13+'Rectifique');
   if edCVE_PER_JURIDICA.Text = '0' then
   begin
        if ( trim(edNombre.Text)        = '' )or ( trim(edF_Nacimiento.Text)   = '' ) or
           ( trim(edTX_Calle.Text)      = '' )or ( trim(edTX_NO_Ext.Text)      = '' ) or
           ( trim(edTX_Colonia.Text)    = '' )or ( trim(edTX_COD_POSTAL.Text)  = '' ) or
           ( trim(edTX_Delegacion.Text) = '' )or ( trim(edTX_Nacionalidad.Text)= '' ) or
           ( trim(edTIPO_IDENTIFIC.Text)= '' )or ( trim(edNUM_Identific.Text)  = '' ) then
        begin ShowMessage('Nombre'                 + #13 +  'Fecha de Nacimiento'    + #13 +
                          'Dirección Completa'     + #13 +  'Nacionalidad'           + #13 +
                          'Tipo de Identificación' + #13 +  'No. de Identificación'  + #13#13 +
                          'SON CAMPOS OBLIGATORIOS, Rectifique.');
              bandera:=False;
        end;
   end
   else
   begin
        if ( trim(edNombre.Text)         = '' )or ( trim(edTX_Calle.Text)       = '' ) or
           ( trim(edTX_NO_Ext.Text)      = '' )or ( trim(edTX_Colonia.Text)     = '' ) or
           ( trim(edTX_COD_POSTAL.Text)  = '' )or ( trim(edTX_Delegacion.Text)  = '' ) or
           ( trim(edTX_Nacionalidad.Text)= '' )or ( trim(edTX_RFC.Text)         = '' ) then
        begin ShowMessage('Razón Social'           + #13 +  'Dirección Completa'     + #13 +
                          'Nacionalidad'           + #13 +  'RFC'  + #13#13 +
                          'SON CAMPOS OBLIGATORIOS, Rectifique.');
              bandera:=false;
        end;                                                                
   end;
   if  ( trim(edTX_RFC.Text) <> '' ) and ( Length(trim(edTX_RFC.Text)) <> 13 ) then
   begin ShowMessage('El RFC debe contar con Homoclave, Rectifique.');
         bandera:=false;
   end;
   IF IsNewData then
   begin
     edF_REGISTRO.Text:=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',Objeto.Apli.SysDateTime);
     edCVE_USU_REG.Text:=Objeto.Apli.Usuario;
     getSQLInt('select nvl(max(id_no_cliente)+1,1) numero from di_no_cliente',
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'numero',iNum, True);
     edID_NO_CLIENTE.Text:=IntToStr(inum);
     Objeto.ID_NO_CLIENTE.AsString:=edID_NO_CLIENTE.Text;
     Objeto.F_REGISTRO.AsString:=edF_REGISTRO.Text;
     Objeto.CVE_USU_REG.AsString:=edCVE_USU_REG.Text;
     Realizado:=bandera;     
   end                                                                                                  
   else
   begin
     edF_ULT_MOD.Text:=FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',Objeto.Apli.SysDateTime);
     edCVE_USU_MOD.Text:=Objeto.Apli.Usuario;
     Objeto.F_ULT_MOD.AsString:=EDF_ULT_MOD.Text;
     Objeto.CVE_USU_MOD.AsString:=EDCVE_USU_MOD.Text;
     if objeto.Apli.Apli<> 'DIVISA' then
        begin
          sQuery:=' UPDATE  DI_NO_CLIENTE SET '+
                   ' NOMBRE='''+Objeto.NOMBRE.AsString+''', '+
                   ' CVE_PER_JURIDICA='''+Objeto.CVE_PER_JURIDICA.AsString+''', '+
                   ' F_NACIMIENTO='''+Objeto.F_NACIMIENTO.AsString+''', '+
                   ' TX_CALLE='''+Objeto.TX_CALLE.AsString+''', '+
                   ' TX_NO_EXT='''+Objeto.TX_NO_EXT.AsString+''', '+
                   ' TX_NO_INT='''+Objeto.TX_NO_INT.AsString+''', '+
                   ' TX_COLONIA='''+Objeto.TX_COLONIA.AsString+''', '+
                   ' TX_COD_POSTAL='''+Objeto.TX_COD_POSTAL.AsString+''', '+
                   ' TX_DELEGACION='''+Objeto.TX_DELEGACION.AsString+''', '+
                   ' TX_NACIONALIDAD='''+Objeto.TX_NACIONALIDAD.AsString+''', '+
                   ' TIPO_IDENTIFIC='''+Objeto.TIPO_IDENTIFIC.AsString+''', '+
                   ' TX_CURP='''+Objeto.TX_CURP.AsString+''', '+
                   ' TX_RFC='''+Objeto.TX_RFC.AsString+''', '+
                   ' TX_FEA='''+Objeto.TX_FEA.AsString+''', '+
                   ' CVE_ACTIV_ECO_SITI='''+Objeto.CVE_ACTIV_ECO_SITI.AsString+''', '+
                   ' F_ULT_MOD=sysdate, '+
                   ' CVE_USU_MOD='''+Objeto.CVE_USU_MOD.AsString+''', ';
          if Objeto.NUM_IDENTIFIC.AsString='' 
          then sQuery:=sQuery+ ' NUM_IDENTIFIC=null  where id_no_cliente ='+objeto.id_no_cliente.asstring
          else sQuery:=sQuery+ ' NUM_IDENTIFIC='+Objeto.NUM_IDENTIFIC.AsString+' where id_no_cliente ='+objeto.id_no_cliente.asstring;
             
          runsql(sQuery,objeto.Apli.Databasename,objeto.Apli.sessionName,True);
          InterForma1.Cancelar;
        end
     else REalizado:=true;
   end;

end;

procedure TWDiNoCliente.ilActividadCapture(Sender: TObject;
  var Show: Boolean);
begin
Show:=True;
end;

procedure TWDiNoCliente.ilActividadEjecuta(Sender: TObject);
begin
  Objeto.Siti.FindKey([ilActividad.Buffer]) 
end;

procedure TWDiNoCliente.sbSitiClick(Sender: TObject);
begin
Objeto.Siti.Busca;
end;

procedure TWDiNoCliente.edCVE_PER_JURIDICAChange(Sender: TObject);
begin
  if edCVE_PER_JURIDICA.Text='0' then
  begin
    edF_Nacimiento.Color := clWindow; edF_Nacimiento.Enabled := True; dtpF_NACIMIENTO.Enabled:= True;
    edNum_Identific.Color:= clWindow; edNum_Identific.Enabled:= True;
    edTX_CURP.Color      := clWindow; edTX_CURP.Enabled      := True;

    lbTX_RFC.Caption  := 'RFC*'; lbTX_CURP.Caption := 'CURP*';
  end;
  if edCVE_PER_JURIDICA.Text='1' then
  begin //moral
    edF_Nacimiento.Color := clScrollBar; edF_Nacimiento.Enabled := False; edF_Nacimiento.Text := ''; dtpF_NACIMIENTO.Enabled:= False;
    edNum_Identific.Color:= clScrollBar; edNum_Identific.Enabled:= False; edNum_Identific.Text:= '';
    edTX_CURP.Color      := clScrollBar; edTX_CURP.Enabled      := False; edTX_CURP.Text      := '';

    lbTX_RFC.Caption  := 'RFC'; lbtx_CURP.Caption := 'CURP';
  end;
end;

end.
