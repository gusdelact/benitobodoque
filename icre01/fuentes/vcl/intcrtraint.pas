// Sistema         : Clase de CR_TRAMO_INTER
// Fecha de Inicio : 27/10/2009
// Función forma   : Clase de CR_TRAMO_INTER
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrTraInt;                                              

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Clases Adicionales
        IntParamCre,
        IntCrCredito,
        IntSGCtrl, IntLinkit //Clase Credito
;

const   CNULL = 'NULL';
        CoAC = 'AC';
        CoIN = 'IN';


Type
 TCrTraInt= class; 

  TWCrTramoInter=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbF_REVISION : TLabel; 
    dtpF_REVISION : TInterDateTimePicker; 
    edF_REVISION : TEdit;
    lbSIT_TRAMO_INTER : TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    rgSIT_TRAMO_INTER: TRadioGroup;
    edTE_F_REVISION: TEdit;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    edF_ALTA: TEdit;
    lbF_ALTA: TLabel;
    edF_MODIFICA: TEdit;
    lbF_MODIFICA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    lbCVE_USU_ALTA: TLabel;
    ilCREDITO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure edF_REVISIONExit(Sender: TObject);
    procedure edF_ALTAExit(Sender: TObject);
    procedure edF_MODIFICAExit(Sender: TObject);
    procedure edCVE_USU_ALTAExit(Sender: TObject);
    procedure edCVE_USU_MODIFICAExit(Sender: TObject);
    procedure edSIT_TRAMO_INTERExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure MuestraHints;
    procedure rgSIT_TRAMO_INTERExit(Sender: TObject);
    procedure edDESC_CREDITOExit(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    private
    { Private declarations }

    public 
    { Public declarations }
    Objeto : TCrTraInt;
end; 
 TCrTraInt= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_CREDITO               : TInterCampo;
        F_REVISION               : TInterCampo;
        SIT_TRAMO_INTER          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;

Var     VLSalida        : Boolean;
        VlMsg           : String;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrTraInt.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';

      F_REVISION :=CreaCampo('F_REVISION',ftDate,tsNinguno,tsNinguno,True);
                F_REVISION.Caption:='Fecha Revision';

      SIT_TRAMO_INTER :=CreaCampo('SIT_TRAMO_INTER',ftString,tsNinguno,tsNinguno,True);
      With SIT_TRAMO_INTER do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CoAC);
        ComboLista.Add('1'); ComboDatos.Add(CoIN);
      end;
      SIT_TRAMO_INTER.Caption:='Situación Tramo Inter';

      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';

      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';

      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('F_REVISION');

      TableName := 'CR_TRAMO_INTER';
      UseQuery := True; 
      HelpFile := 'IntCrTraInt.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
end;

Destructor TCrTraInt.Destroy;
begin
   If Credito <> nil then
      Credito.free;

   inherited;
   //end if;
end;


function TCrTraInt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTramoInter;
begin
   W:=TWCrTramoInter.Create(Self);
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


Function TCrTraInt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTrIn.it','F,D');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString); 
                               T.Param(1,F_REVISION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrTraInt.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_TRAMO_INTER********************)
(*                                                                              *)
(*  FORMA DE CR_TRAMO_INTER                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TRAMO_INTER********************)

procedure TWCrTramoInter.FormShow(Sender: TObject);
begin
   With Objeto Do
   Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      InterForma1.BtnEliminar.Visible:=false;

      ID_CREDITO.Control:=edID_CREDITO;
      F_REVISION.Control:=edF_REVISION;
      SIT_TRAMO_INTER.Control:=rgSIT_TRAMO_INTER;
      F_ALTA.Control:=edF_ALTA;
      CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      F_MODIFICA.Control:=edF_MODIFICA;
      CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Credito.ID_CREDITO.Control := edID_CREDITO;
      Credito.ContratoCre.Contrato.TITNombre.Control:= edDESC_CREDITO;
      Credito.GetParams(Objeto);
   end;
end;

procedure TWCrTramoInter.FormDestroy(Sender: TObject);
begin
   With Objeto Do
   Begin
      ID_CREDITO.Control:=nil;
      F_REVISION.Control:=nil;
      SIT_TRAMO_INTER.Control:=nil;
      F_ALTA.Control:=nil;
      CVE_USU_ALTA.Control:=nil;
      F_MODIFICA.Control:=nil;
      CVE_USU_MODIFICA.Control:=nil;

      Credito.ID_CREDITO.Control := nil;
      Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
   end;
   //Objeto
end;

procedure TWCrTramoInter.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTramoInter.InterForma1DespuesNuevo(Sender: TObject);
begin
   //Inicialización de Campos
   with Objeto do
   begin
      ID_CREDITO.AsString:='';
      F_REVISION.AsDateTime:=Apli.DameFechaEmpresaDia('D000');
      SIT_TRAMO_INTER.AsString:=CoAC;
      F_ALTA.AsDateTime:=Apli.DameFechaEmpresaDia('D000');
      CVE_USU_ALTA.AsString:=Apli.Usuario;
//      F_MODIFICA.AsDateTime:=DameFechaEmpresaDia('D000');
//      CVE_USU_MODIFICA.AsString:='';
   end;
   edID_CREDITO.SetFocus;
end;

procedure TWCrTramoInter.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;


procedure TWCrTramoInter.edID_CREDITOExit(Sender: TObject);
begin
  { if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.ID_CREDITO.GetFromControl;
      if Objeto.ID_CREDITO.AsString = CNULL then
      Begin
         VLSalida := False;
         VlMsg :='Debe de indicar el Crédito';
      end;
      InterForma1.ValidaExit(edID_CREDITO,VLSalida,VLMsg,True);
   end;}
   InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TWCrTramoInter.btCREDITOClick(Sender: TObject);
begin
   if Objeto.Credito.Busca then InterForma1.NextTab(edID_CREDITO);
end;

procedure TWCrTramoInter.edF_REVISIONExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.F_REVISION.GetFromControl;
      if Objeto.F_REVISION.AsString = CNULL then
      Begin
         VLSalida := False;
         VlMsg :='Debe de indicar la Fecha de Revision';
      end;
      InterForma1.ValidaExit(edF_REVISION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrTramoInter.edF_ALTAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.F_ALTA.GetFromControl;
      InterForma1.ValidaExit(edF_ALTA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrTramoInter.edF_MODIFICAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.F_MODIFICA.GetFromControl;
      InterForma1.ValidaExit(edF_MODIFICA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrTramoInter.edCVE_USU_ALTAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.CVE_USU_ALTA.GetFromControl;
      InterForma1.ValidaExit(edCVE_USU_ALTA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrTramoInter.edCVE_USU_MODIFICAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.CVE_USU_MODIFICA.GetFromControl;
      InterForma1.ValidaExit(edCVE_USU_MODIFICA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrTramoInter.edSIT_TRAMO_INTERExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := CNULL;
      VLSalida := True;
      Objeto.SIT_TRAMO_INTER.GetFromControl;
      InterForma1.ValidaExit(rgSIT_TRAMO_INTER,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrTramoInter.InterForma1Buscar(Sender: TObject);
begin
   Objeto.InternalBusca;

  { if Objeto.Busca then
   Begin
      InterForma1.NextTab(edID_CREDITO);
   end}
end;

procedure TWCrTramoInter.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var qyAux     : TQuery;
    sCriterio : String;
    F_MIN, F_MAX: TDate;
    B_Fmin, B_Fmax, B_Exist :boolean;
begin
  With Objeto Do
  Begin
     if IsNewData then    //nuevo
     Begin
        if MessageDlg('¿Desea almacenar los datos capturados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        Begin
           B_Exist:=false;
           Try
             qyAux := TQuery.Create(Self);
             qyAux.DatabaseName := Apli.DataBaseName;
             qyAux.SessionName := Apli.SessionName;
             qyAux.Close;
             qyAux.Sql.Clear;

             sCriterio := ' SELECT ID_CREDITO FROM CR_TRAMO_INTER '+
			  ' WHERE ID_CREDITO='+edID_CREDITO.Text +
		          ' AND F_REVISION = TO_DATE('''+edF_REVISION.Text+''',''DD/MM/YYYY'')';
             qyAux.SQL.Text := sCriterio;
             qyAux.Open;
             if Not qyAux.Eof then B_Exist:=true;
             qyAux.Close;
           Finally
             qyAUx.Free;
           End;

           if Not B_Exist then
           begin
              B_Fmin :=false;
              B_Fmax :=false;
              Try
                qyAux := TQuery.Create(Self);
                qyAux.DatabaseName := Apli.DataBaseName;
                qyAux.SessionName := Apli.SessionName;
                qyAux.Close;
                qyAux.Sql.Clear;

                sCriterio := 'SELECT ( SELECT DISTINCT (SELECT MIN(CC.F_VENCIMIENTO) '+
                             '                          FROM CR_CAPITAL CC '+
                             '	                     WHERE CC.ID_CREDITO='+edID_CREDITO.Text+') - CC2.PLAZO '+
                             '	    FROM CR_CAPITAL CC2 '+
  		             '         WHERE CC2.ID_CREDITO='+edID_CREDITO.Text +
		             '         AND CC2.F_VENCIMIENTO=(SELECT MIN(CC.F_VENCIMIENTO) FROM CR_CAPITAL CC WHERE CC.ID_CREDITO='+edID_CREDITO.Text+') '+
 		             ' ) AS F_MIN '+
                             ' FROM DUAL ';
                qyAux.SQL.Text := sCriterio;
                qyAux.Open;
                if Not qyAux.Eof then
                begin
                   F_MIN:= qyAux.FieldByName('F_MIN').AsDateTime;
                   B_Fmin:=true;
                end;
                qyAux.Close;

                sCriterio := 'SELECT DISTINCT ( SELECT MAX(CC1.F_VENCIMIENTO) '+
                             '	             FROM CR_CAPITAL CC1 '+
    		             '                  WHERE CC1.ID_CREDITO='+edID_CREDITO.Text +
 		             ' ) AS F_MAX '+
                             ' FROM DUAL ';
                qyAux.SQL.Text := sCriterio;
                qyAux.Open;
                if Not qyAux.Eof then
                begin
                   F_MAX:= qyAux.FieldByName('F_MAX').AsDateTime;
                   B_Fmax:=true;
                end;
                qyAux.Close;
              Finally
                qyAUx.Free;
              End;

              if (B_Fmin)AND(B_Fmax) then
              begin
                 if (dtpF_REVISION.DateTime >=F_MIN)AND(dtpF_REVISION.DateTime<=F_MAX) then
                 begin
                    CVE_USU_ALTA.AsString  := DameUsuario;
                    F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
                    Realizado := True;
                 end
                 else
                 begin
                    MessageDlg('La Fecha de Revision no se encuentra dentro del las Fechas de Vencimiento del Periodo',mtError,[mbOk], 0);
                    Realizado := False;
                 end;
              end
              else Realizado := False;
           end
           else
           begin
              MessageDlg('La Fecha de Revision ya esta capturada, solo puede modificar su Situacion',mtError,[mbOk], 0);
              Realizado := False;
           end;
        end
        else Realizado := False;
     end



     else
     Begin
        if MessageDlg('¿Desea guardar los datos modificados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        Begin
           CVE_USU_MODIFICA.AsString  := DameUsuario;
           F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
        end
        else Realizado := False;
     end;
  end;   
end;

Procedure TWCrTramoInter.MuestraHints;
Begin
   edDESC_CREDITO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edDESC_CREDITO.ShowHint := True;
End;

procedure TWCrTramoInter.rgSIT_TRAMO_INTERExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_TRAMO_INTER,True,CNULL,True);
end;

procedure TWCrTramoInter.edDESC_CREDITOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_CREDITO,True,'',True);
end;

procedure TWCrTramoInter.ilCREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:={(InterForma1.CanEdit) and} (InterForma1.IsNewData);
end;

procedure TWCrTramoInter.ilCREDITOEjecuta(Sender: TObject);
begin
  if Objeto.Credito.FindKey([ilCREDITO.Buffer])then
      InterForma1.NextTab(edID_CREDITO);
end;

end.
