// Sistema         : Clase de CR_PPO_MOV
// Fecha de Inicio : 01/03/2012
// Función forma   : Clase de CR_PPO_MOV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Fecha           : MARZO 2012
// Comentarios     :
Unit IntCrMovPPP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,                                           
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, Grids,

IntParamCre, IntGenCre,
IntCrOperaci, IntSGCtrl,
IntCrGruCla, InterEdit, Wwdatsrc, Wwkeycb, DBCtrls, ComObj;

Const
  CoACTIVO = 'AC';
  CoINACTIVO = 'IN';
  CoVERDAD ='V';
  coFALSO = 'F' ;
  CoPREDETERMINADO=CoVERDAD ;


Type
 TCrMovPPP= class;

  TWCrMovPPP=Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    edDESC_MOV_PPP: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_MOV_PPP: TEdit;
    rgSIT_MOV_PPP: TRadioGroup;
    lbUSUA_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbF_MODIF: TLabel;
    edF_MODIF: TEdit;
    edCVE_USUA_MODIF: TEdit;
    Label2: TLabel;
    Shape5: TShape;
    Label9: TLabel;
    Label8: TLabel;
    Shape3: TShape;
    Label10: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    Shape1: TShape;
    sgcDatos: TSGCtrl;
    edCVE_OPERACION: TEdit;
    bbCveOperacion: TBitBtn;
    ilCVE_OPERACION: TInterLinkit;
    edDESC_C_OPERACION: TEdit;
    chbxB_GENERA_FACTURA: TCheckBox;
    rgCVE_AFECTA_PREMIO: TRadioGroup;
    Label6: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    OpenDialog1: TOpenDialog;
    BtnImportar: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure rgSIT_MOV_PPPExit(Sender: TObject);
    procedure edCVE_MOV_PPPExit(Sender: TObject);
    procedure edDESC_MOV_PPPExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edF_ALTAExit(Sender: TObject);
    procedure edCVE_USUA_ALTAExit(Sender: TObject);
    procedure edF_MODIFExit(Sender: TObject);
    procedure edCVE_USUA_MODIFExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edDESC_MOV_PPPKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_OPERACIONExit(Sender: TObject);
    procedure bbCveOperacionClick(Sender: TObject);
    procedure edDESC_C_OPERACIONExit(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure rgCVE_AFECTA_PREMIOExit(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure chbxB_GENERA_FACTURAExit(Sender: TObject);
    procedure sgcDatosMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    private
      vgActualiza : Boolean;
      function ImportaTransPPP (Accion, Cred: integer; Bruto, Iva, Comision: Currency; Fecha: TDateTime): Boolean;
      procedure MuestraDatos ;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrMovPPP;
end;
 TCrMovPPP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_PPO_MOV             : TInterCampo;
        DESC_PPO_MOV            : TInterCampo;
        B_GENERA_FACTURA        : TInterCampo;
        SIT_PPO_MOV             : TInterCampo;
        F_ALTA                  : TInterCampo;
        CVE_USU_ALTA            : TInterCampo;
        F_MODIFICA              : TInterCampo;
        CVE_USU_MODIFICA        : TInterCampo;
        CVE_AFECTA_PREMIO       : TInterCampo;
        CVE_OPERACION           : TInterCampo;

        ParamCre     : TParamCre;
        Operacion    : TCrOperaci;

        iIdAcred  : Integer;
        iIdRepr   : Integer;
        MenError  : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

var vgCve: String ;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrMovPPP.Create( AOwner : TComponent );
begin Inherited;

  CVE_PPO_MOV := CreaCampo( 'CVE_PPO_MOV', ftString, tsNinguno, tsNinguno, True );
  CVE_PPO_MOV.Caption := 'Clave de movimiento PPO';

  DESC_PPO_MOV := CreaCampo( 'DESC_PPO_MOV', ftString, tsNinguno, tsNinguno, True );
  DESC_PPO_MOV.Caption := 'Descripcion movimiento PPO';

  B_GENERA_FACTURA:= CreaCampo('B_GENERA_FACTURA', ftString, tsNinguno, tsNinguno, True) ;
  B_GENERA_FACTURA.Caption := 'Movimiento que genera factura';

  SIT_PPO_MOV := CreaCampo('SIT_PPO_MOV', ftString, tsNinguno, tsNinguno, True) ;

  With SIT_PPO_MOV do
  Begin
     Size := 2;
     UseCombo := True;
     ComboLista.Add('0'); ComboDatos.Add(CoACTIVO);
     ComboLista.Add('1'); ComboDatos.Add(CoINACTIVO);
  end;
  SIT_PPO_MOV.Caption:='Situacion del movimiento PPO';

  F_ALTA:= CreaCampo('F_ALTA', ftDate, tsNinguno, tsNinguno, True);
  F_ALTA.Caption:= 'Fecha Alta';
  CVE_USU_ALTA:= CreaCampo('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_ALTA.Caption:= 'Clave de Usu Alta';
  F_MODIFICA:= CreaCampo('F_MODIFICA', ftDateTime, tsNinguno, tsNinguno, True);
  F_MODIFICA.Caption:= 'Fecha Modifica';
  CVE_USU_MODIFICA:= CreaCampo('CVE_USU_MODIFICA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_MODIFICA.Caption:= 'Clave de Usu Modifica';

  CVE_AFECTA_PREMIO := CreaCampo('CVE_AFECTA_PREMIO', ftString, tsNinguno, tsNinguno, True) ;

  With CVE_AFECTA_PREMIO do
  Begin
     Size := 1;
     UseCombo := True;
     ComboLista.Add('0'); ComboDatos.Add('I');
     ComboLista.Add('1'); ComboDatos.Add('D');
  end;
  CVE_AFECTA_PREMIO.Caption:='Afectacion del movimiento al premio.';

  CVE_OPERACION:= CreaCampo('CVE_OPERACION', ftString, tsNinguno, tsNinguno, False);

  FKeyFields.Add('CVE_PPO_MOV');

  Operacion := TCrOperaci.Create(Self);
  Operacion.MasterSource:=Self;

  TableName := 'CR_PPO_MOV';
  UseQuery  := True;
  HelpFile  := 'IntCrMovPPP.Hlp';
  ShowMenuReporte:=True;


end;

Destructor TCrMovPPP.Destroy;
begin
  If Operacion <> Nil then
     Operacion.Free ;

  inherited;
end;


function TCrMovPPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMovPPP;
begin
   W:=TWCrMovPPP.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnEliminar:= False ;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrMovPPP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrMovPPP.it','S,S');
      Try if Active then begin T.Param(0,CVE_PPO_MOV.AsString);
                               T.Param(1,CVE_OPERACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end ;
end;

function TCrMovPPP.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_REPRESENTANTE********************)
(*                                                                                       *)
(*  FORMA DE CR_REPRESENTANTE                                                            *)
(*                                                                                       *)
(***********************************************FORMA CR_REPRESENTANTE********************)


Function TWCrMovPPP.ImportaTransPPP(Accion, Cred: integer; Bruto, Iva, Comision: Currency; Fecha: TDateTime): Boolean ;
var STPCargaMasiva: TStoredProc ;
begin
   try
     STPCargaMasiva := TStoredProc.Create(Self);
     with STPCargaMasiva do
     begin
        //Inicia el SPT
        STPCargaMasiva.DatabaseName:= Objeto.Apli.DatabaseName;
        STPCargaMasiva.SessionName:= Objeto.Apli.SessionName;
        STPCargaMasiva.StoredProcName:= 'PKGCRPPO.STPCARGAMASIVAPPO';
        Params.Clear;
        Params.CreateParam(ftFloat,    'peAccion', ptInput);
        Params.CreateParam(ftFloat,    'peIdCredito', ptInput);
        Params.CreateParam(ftDate,    'peFecha', ptInput);
        Params.CreateParam(ftString,   'peTipoPorc', ptInput);
        Params.CreateParam(ftFloat,    'peImpBruto', ptInput);
        Params.CreateParam(ftFloat,    'peImpIva', ptInput);
        Params.CreateParam(ftFloat,    'peImpComisArr', ptInput);
        Params.CreateParam(ftString,    'peBCommit', ptInput);
        Params.CreateParam(ftString,    'peCveUsuAlta', ptInput);
        Params.CreateParam(ftFloat,   'PSResultado',  ptOutput);
        Params.CreateParam(ftString,  'PSTxResultado',ptOutput);
        Prepare;
        ParamByName('peAccion').AsInteger := Accion;
        ParamByName('peIdCredito').AsInteger := Cred;
        ParamByName('peFecha').AsDate := Fecha;
        ParamByName('peTipoPorc').AsString:= '--';
        ParamByName('peImpBruto').AsFloat := Bruto;
        ParamByName('peImpIva').AsFloat := Iva;
        ParamByName('peImpComisArr').AsFloat := Comision;
        ParamByName('peBCommit').AsString := 'V';
        ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
        ExecProc;

        if (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           ImportaTransPPP:=false;

           ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
        end
        else
           ImportaTransPPP:=true;
     end;
   finally
      STPCargaMasiva.Free;
   end;
end ;

procedure TWCrMovPPP.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.CVE_PPO_MOV.Control:=edCVE_MOV_PPP;
  Objeto.DESC_PPO_MOV.Control:= edDESC_MOV_PPP;
  Objeto.B_GENERA_FACTURA.Control := chbxB_GENERA_FACTURA;
  Objeto.SIT_PPO_MOV.Control:= rgSIT_MOV_PPP ;
  Objeto.F_ALTA.Control:= edF_ALTA ;
  Objeto.CVE_USU_ALTA.Control:= edCVE_USUA_ALTA ;
  Objeto.F_MODIFICA.Control:= edF_MODIF ;
  Objeto.CVE_USU_MODIFICA.Control:= edCVE_USUA_MODIF ;
  Objeto.CVE_AFECTA_PREMIO.Control:= rgCVE_AFECTA_PREMIO;

  Objeto.Operacion.CVE_OPERACION.Control:= edCVE_OPERACION ;
  Objeto.Operacion.DESC_C_OPERACION.Control := edDESC_C_OPERACION ;

  edCVE_MOV_PPP.SetFocus ;

end;

procedure TWCrMovPPP.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_PPO_MOV.Control:=nil;
  Objeto.DESC_PPO_MOV.Control:= nil;
  Objeto.B_GENERA_FACTURA.Control:=nil;
  Objeto.SIT_PPO_MOV.Control:= nil ;
  Objeto.F_ALTA.Control:= nil ;
  Objeto.CVE_USU_ALTA.Control:= nil ;
  Objeto.F_MODIFICA.Control:= nil ;
  Objeto.CVE_USU_MODIFICA.Control:= nil ;
  Objeto.CVE_AFECTA_PREMIO.Control:=nil;

  Objeto.Operacion.CVE_OPERACION.Control:=nil;
  Objeto.Operacion.DESC_C_OPERACION.Control:= nil;
end;

procedure TWCrMovPPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMovPPP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   vgActualiza := true ;
   Objeto.F_ALTA.AsDateTime:= Now;
   Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario;
   MuestraDatos ;
   edCVE_MOV_PPP.SetFocus;
end;

procedure TWCrMovPPP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
   vgActualiza := true ;
   Objeto.F_MODIFICA.AsDateTime:= Now;
   Objeto.CVE_USU_MODIFICA.AsString:= Objeto.Apli.Usuario;
   MuestraDatos ;
end;

//procedure TWCrMovPPP.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrMovPPP.InterForma1DespuesShow(Sender: TObject);
begin
   If (Objeto.Active )Then 
      MuestraDatos ;
end;

procedure TWCrMovPPP.MuestraDatos ;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:='SELECT CVE_PPO_MOV, A.CVE_OPERACION, DESC_C_OPERACION '+
         '  FROM CR_PPO_REL_MOV_OPE A, CR_OPERACION B '+
         ' WHERE A.CVE_OPERACION = B.CVE_OPERACION '+
         ' AND CVE_PPO_MOV = '''+ Objeto.CVE_PPO_MOV.AsString +''' ';

   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('CVE_PPO_MOV').DisplayLabel := 'CVE_PPO_MOV' + #30 +'>C';
            vlQry.FieldByName('CVE_OPERACION').DisplayLabel := 'CVE_OPERACION' + #30 +'>C';
            vlQry.FieldByName('DESC_C_OPERACION').DisplayLabel := 'DESC_C_OPERACION' + #30 +'>C';
            vlQry.FieldByName('CVE_PPO_MOV').DisplayWidth := 20;
            vlQry.FieldByName('CVE_OPERACION').DisplayWidth := 20;
            vlQry.FieldByName('DESC_C_OPERACION').DisplayWidth := 50;
            sgcDatos.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDatos.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
end;

procedure TWCrMovPPP.rgSIT_MOV_PPPExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgSIT_MOV_PPP,True,'',True);
end;

procedure TWCrMovPPP.edCVE_MOV_PPPExit(Sender: TObject);
var   VLSalida  :  boolean;
      VLMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.CVE_PPO_MOV.GetFromControl;
      If Objeto.CVE_PPO_MOV.AsString = '' Then Begin
         VlSalida := False;
         VLMsg := 'Indique la clave de movimiento';
      End ;
 {     Else Begin
            sSQL:= 'SELECT CVE_MOV_PPP FROM CR_MOV_PPP WHERE CVE_MOV_PPP = '+ SQLStr(Objeto.CVE_MOV_PPP.AsString)+'  ';
            qy:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qy <> Nil Then Begin
               If qy.RecordCount > 0 Then Begin
                  VlSalida   := False;
                  VLMsg := 'La clave de movimiento '+Objeto.CVE_MOV_PPP.AsString+' YA existe. ';
               End;
               qy.Free;
            End;
      End; }
      InterForma1.ValidaExit(edCVE_MOV_PPP,VLSalida,VLMsg,True);
   end ;
end;

procedure TWCrMovPPP.edDESC_MOV_PPPExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_MOV_PPP,True,'',True);
end;

procedure TWCrMovPPP.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
           //DefinePredeterminado;
           Realizado := True;
      end
      else
           Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?'+#13+'(Se incluira nueva asignacion si cambio la operacion relacionada)',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if vgActualiza then
          // DefinePredeterminado;
         //end if
           Realizado := True;
      end
      else
           Realizado := False;
   end
end;

procedure TWCrMovPPP.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.InternalBusca then
     MuestraDatos ;
end;

procedure TWCrMovPPP.edF_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_ALTA,True,'',True);
end;

procedure TWCrMovPPP.edCVE_USUA_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_USUA_ALTA,True,'',True);
end;

procedure TWCrMovPPP.edF_MODIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_MODIF,True,'',True);
end;

procedure TWCrMovPPP.edCVE_USUA_MODIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_USUA_MODIF,True,'',True);
end;

procedure TWCrMovPPP.InterForma1DespuesAceptar(Sender: TObject);
var sSQL : String ;
    q: TQuery ;
begin
    If InterForma1.IsNewData then begin
       RunSQL('INSERT INTO CR_PPO_REL_MOV_OPE (CVE_PPO_MOV, CVE_OPERACION) '+
              ' VALUES ('+SQLStr(Objeto.CVE_PPO_MOV.AsString)+', '+SQLStr(Objeto.Operacion.CVE_OPERACION.AsString)+') ',
              Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
    end
    else begin
         If Objeto.Operacion.CVE_OPERACION.AsString <> '' then
            Begin
               sSQL:= 'SELECT CVE_PPO_MOV, CVE_OPERACION FROM CR_PPO_REL_MOV_OPE '+
                      ' WHERE CVE_PPO_MOV = '+SQLStr(Objeto.CVE_PPO_MOV.AsString)+' '+
                      ' AND CVE_OPERACION = '+SQLStr(Objeto.Operacion.CVE_OPERACION.AsString)+' ';
               q:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
               If q <> Nil Then
                  Begin
                     RunSQL('UPDATE CR_PPO_REL_MOV_OPE SET CVE_PPO_MOV = '+SQLStr(Objeto.CVE_PPO_MOV.AsString)+' '+
                            'WHERE CVE_PPO_MOV = '+SQLStr(vgCVE)+'  ',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
                  End
               Else
                  Begin
                     RunSQL('INSERT INTO CR_PPO_REL_MOV_OPE (CVEPPO_MOV, CVE_OPERACION, B_AFECTA_CHEQ) '+
                            ' VALUES ('+SQLStr(Objeto.CVE_PPO_MOV.AsString)+', '+SQLStr(Objeto.Operacion.CVE_OPERACION.AsString)+', ''F'') ',
                            Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
                  End;
               q.Free;
         End ;
    end ;
    MuestraDatos;
end;

procedure TWCrMovPPP.edDESC_MOV_PPPKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TWCrMovPPP.edCVE_OPERACIONExit(Sender: TObject);
begin
{   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.Operacion.CVE_OPERACION.GetFromControl ;
      If (Objeto.Operacion.CVE_OPERACION.AsString = '') Then Begin
         VlSalida := False;
         VLMsg := 'Indique la clave de operacion relacionada al movimiento';
      End
      Else Begin
            sSQL:= 'SELECT CVE_MOV_PPP, CVE_OPERACION FROM CR_REL_MOV_OP_PPP '+
                   ' WHERE CVE_MOV_PPP = '+SQLStr(Objeto.CVE_MOV_PPP.AsString)+' '+
                   ' AND CVE_OPERACION = '+SQLStr(Objeto.Operacion.CVE_OPERACION.AsString)+' ';
            qy:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qy <> Nil Then Begin
               If qy.RecordCount > 0 Then Begin
                  VlSalida   := False;
                  VLMsg := 'La asignacion Movimiento '+Objeto.CVE_MOV_PPP.AsString+'/Operacion '+Objeto.Operacion.CVE_OPERACION.AsString+' YA existe ';
               End;
               qy.Free;
            End;
         End; }
      InterForma1.ValidaExit(edCVE_OPERACION,True,'',True);
  // End;
end;

procedure TWCrMovPPP.bbCveOperacionClick(Sender: TObject);
begin
   Objeto.Operacion.FilterString:= ' CVE_ACCESORIO = ''PP'' ' ;
   Objeto.Operacion.BuscaWhereString := Objeto.Operacion.FilterString ;
   Objeto.Operacion.ShowAll := True;
   If Objeto.Operacion.Busca Then Begin
      InterForma1.NextTab(bbCveOperacion);
   End;
end;

procedure TWCrMovPPP.edDESC_C_OPERACIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_C_OPERACION,True,'',True);
end;

procedure TWCrMovPPP.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
   vgCVE:= Objeto.CVE_PPO_MOV.AsString ;
end;

procedure TWCrMovPPP.InterForma1DespuesEliminar(Sender: TObject);
begin
   {RunSQL('DELETE FROM CR_PPO_REL_MOV_OPE WHERE CVE_PPO_MOV = '+SQLStr(vgCVE)+'  ',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False); }
end;

procedure TWCrMovPPP.rgCVE_AFECTA_PREMIOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_AFECTA_PREMIO,True,'',True);
end;

procedure TWCrMovPPP.BtnImportarClick(Sender: TObject);
var Excel: Variant ;
    i, s, n: Integer ;
    cred, bruto, iva, fecha, comis: String ;
begin
if Objeto.ValidaAccesoEsp('TCRMOVPPP_IMPT',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
      Excel:= CreateOleObject('Excel.Application') ;
      Excel.WorkBooks.Open(edNbrArch.Text) ;

      Memo1.Lines.Clear ;

      cred := '' ; bruto:= ''; iva:= ''; fecha:= ''; comis:= '';
      n:= 0; s:= 0;

      Try
        i:= 1 ;
        Memo1.Lines.Add('/**** Importacion de montos de Posible Premio a Otorgar ****/');
        Repeat
           Inc(i) ;
           cred:= Excel.Cells[i, 1].Value ;
           If cred = '' then
              Break ;
           bruto:= TrimChar(Excel.Cells[i, 3].Value, '$%,') ;
           iva  := FloatToStr(StrToFloat(bruto)*0.16) ; // FJR 11.02.2013 Mientras no se indique lo contrario...
           comis:= TrimChar(Excel.Cells[i, 4].Value, '$%,') ;
           fecha:= Excel.Cells[i, 2].Value ; //FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
           try
             if not ImportaTransPPP(2, StrToInt(cred), StrToFloat(TrimChar(bruto, '$%,')), StrToFloat(TrimChar(iva, '$%,')),
                                       StrToFloat(TrimChar(comis, '$%,')) ,StrToDate(Fecha) ) then
                begin
                  Memo1.Lines.Add('') ;
                  Memo1.Lines.Add('No importado! : '+cred+', '+bruto+', '+iva+', '+comis+', '''+fecha+''' ') ;
                  Memo1.Lines.Add('                Consultar informacion de contrato, moneda o credito.') ;
                  Memo1.Lines.Add('                Verificar activacion de transacciones.') ;
                  Inc(n);
                  Continue;
                end
             else
                begin
                  Memo1.Lines.Add('') ;
                  Memo1.Lines.Add(cred+', '+bruto+', '+iva+', '+comis+', '''+fecha+''' correcto! ') ;
                  Inc(s);
                end ;
           except
                Memo1.Lines.Add('') ;
                Memo1.Lines.Add('Error para valores : '+cred+', '+bruto+', '+iva+', '+comis+', '''+fecha+''' ') ;
                Continue;
           end ;
        Until cred = '' ;

        Excel.WorkBooks.Close ;
        Excel.Quit;
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Importacion terminada correctamente...') ;
        Memo1.Lines.Add('Registros leidos: '+IntToStr(s+n)+'     correctos:'+IntToStr(s)+'     incorrectos:'+IntToStr(n)) ;
      Except
        Excel.WorkBooks.Close ;
        Excel.Quit;
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Problema de lectura de archivo...') ;
      end ;

      BtnImportar.Enabled:= False;
  end;
end;

procedure TWCrMovPPP.sbExcelClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRMOVPPP_BUSQ',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     If OpenDialog1.Execute then
        begin
           edNbrArch.Text:= OpenDialog1.FileName ;
           BtnImportar.Enabled := true ;
        end ;
  end;
end;

procedure TWCrMovPPP.chbxB_GENERA_FACTURAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chbxB_GENERA_FACTURA,True,'',True);
end;

procedure TWCrMovPPP.sgcDatosMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   IF sgcDatos.CellStr['CVE_OPERACION',ToIndex] <> CNULL THEN
   Begin
        Objeto.Operacion.FindKey([ sgcDatos.CellStr['CVE_OPERACION',ToIndex]]);
   end
end;

end.
