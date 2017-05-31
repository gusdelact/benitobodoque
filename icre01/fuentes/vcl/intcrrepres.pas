// Sistema         : Clase de CR_REPRESENTANTE
// Fecha de Inicio : 08/11/2011
// Función forma   : Clase de CR_REPRESENTANTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Araceli Ramos, Fernando Jimenez Rivera
// Fecha           : Noviembre 2011 / Enero 2012
// Comentarios     :
Unit IntCrRepres;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,                                           
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, Grids,

IntParamCre, IntGenCre,
IntCrCredito,
//IntCrTpoTel,
IntCrAcredit,
IntCrGruCla, IntSGCtrl, InterEdit;

Const
  CoACTIVO = 'AC';
  CoINACTIVO = 'IN';
  CoVERDAD ='V';
  coFALSO = 'F' ;
  CoPREDETERMINADO=CoVERDAD ;


Type
 TCrRepres= class;

  TWCrRepres=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO: TLabel;
    edID_ACREDITADO: TEdit;
    ilID_ACREDITADO: TInterLinkit;
    edACREDITADO: TEdit;
    Label1: TLabel;
    edNOMBRE_REPRESENTANTE: TEdit;
    Label2: TLabel;
    edEMail: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edID_REPRESENTANTE: TEdit;
    rgSIT_REPRESENTANTE: TRadioGroup;
    ChBB_PREDETERMINADO: TCheckBox;
    Panel1: TPanel;
    Shape1: TShape;
    Shape4: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    sgcDatos: TSGCtrl;
    btnEliminaTel: TBitBtn;
    btnAgregaTel: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    bbId_Acreditado: TBitBtn;
    bbTIPO_TELEFONO: TBitBtn;
    illTIPO_TELEFONO: TInterLinkit;
    ilID_REPRESENTANTE: TInterLinkit;
    btnModificaTel: TBitBtn;
    lbUSUA_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbF_MODIF: TLabel;
    edF_MODIF: TEdit;
    edCVE_USUA_MODIF: TEdit;
    edTIPO_TELEFONO: TEdit;
    edNUM_TELEFONO: TEdit;
    edEXTENSION: TEdit;
    CBTipoTel: TComboBox;
    Memo1: TMemo;
    edInt: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure ChBB_PREDETERMINADOExit(Sender: TObject);
    procedure bbId_AcreditadoClick(Sender: TObject);
    procedure bbRepresentanteClick(Sender: TObject);
    procedure bbTIPO_TELEFONOClick(Sender: TObject);
    procedure rgSIT_REPRESENTANTEExit(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_REPRESENTANTEExit(Sender: TObject);
    procedure edID_REPRESENTANTEKeyPress(Sender: TObject; var Key: Char);
    procedure edNOMBRE_REPRESENTANTEExit(Sender: TObject);
    procedure ChBB_PREDETERMINADOClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnAgregaTelClick(Sender: TObject);
    procedure btnModificaTelClick(Sender: TObject);
    procedure btnEliminaTelClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure CBTipoTelChange(Sender: TObject);
    procedure edEMailExit(Sender: TObject);
    procedure edF_ALTAExit(Sender: TObject);
    procedure edCVE_USUA_ALTAExit(Sender: TObject);
    procedure edF_MODIFExit(Sender: TObject);
    procedure edCVE_USUA_MODIFExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private
      vgActualiza : Boolean;
      vgAdvierteCambio: Boolean;
      function CountPredeterminados(Acred : String; Cal: Integer):Integer;
      procedure MuestraDatos ;
      procedure DefinePredeterminado ;
      procedure MensajeAdvierte ;
      function BuscaPredeterminado: Boolean ;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrRepres;
end;
 TCrRepres= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_REPRESENTANTE        : TInterCampo;
        NOMBRE_REPRESENTANTE    : TInterCampo;
        ID_ACREDITADO           : TInterCampo;
        EMAIL                   : TInterCampo;
        SIT_REPRESENTANTE       : TInterCampo;
        B_PREDETERMINADO        : TInterCampo;
        F_ALTA                  : TInterCampo;
        CVE_USU_ALTA            : TInterCampo;
        F_MODIFICA              : TInterCampo;
        CVE_USU_MODIFICA        : TInterCampo;

        ParamCre     : TParamCre;
        Acreditado   : TCrAcredit;
//        TpoTel       : TCrTpoTel;

        iIdAcred  : Integer;
        iIdRepr   : Integer;

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


constructor TCrRepres.Create( AOwner : TComponent );
begin Inherited;

  ID_REPRESENTANTE := CreaCampo( 'ID_REPRESENTANTE', ftInteger, tsNinguno, tsNinguno, True );
  ID_REPRESENTANTE.Caption := 'Id Representante';

  NOMBRE_REPRESENTANTE := CreaCampo( 'NOMBRE_REPRESENTANTE', ftString, tsNinguno, tsNinguno, True );
  NOMBRE_REPRESENTANTE.Caption := 'Representante';

  ID_ACREDITADO := CreaCampo( 'ID_ACREDITADO', ftInteger, tsNinguno, tsNinguno, True );
  ID_ACREDITADO.Caption := 'Id Acreditado';

  EMAIL := CreaCampo( 'EMAIL', ftString, tsNinguno, tsNinguno, True );
  EMAIL.Caption := 'Correo Electrónico';

  SIT_REPRESENTANTE := CreaCampo('SIT_REPRESENTANTE', ftString, tsNinguno, tsNinguno, True) ;

  With SIT_REPRESENTANTE do
  Begin
     Size := 2;
     UseCombo := True;
     ComboLista.Add('0'); ComboDatos.Add(CoACTIVO);
     ComboLista.Add('1'); ComboDatos.Add(CoINACTIVO);
  end;
  SIT_REPRESENTANTE.Caption:='Situacion del Representante';

  B_PREDETERMINADO := CreaCampo('B_PREDETERMINADO', ftString, tsNinguno, tsNinguno, True) ;
  B_PREDETERMINADO.Caption:= 'Predeterminado';

  F_ALTA:= CreaCampo('F_ALTA', ftDate, tsNinguno, tsNinguno, True);
  F_ALTA.Caption:= 'Fecha Alta';
  CVE_USU_ALTA:= CreaCampo('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_ALTA.Caption:= 'Clave de Usu Alta';
  F_MODIFICA:= CreaCampo('F_MODIFICA', ftDateTime, tsNinguno, tsNinguno, True);
  F_MODIFICA.Caption:= 'Fecha Modifica';
  CVE_USU_MODIFICA:= CreaCampo('CVE_USU_MODIFICA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_MODIFICA.Caption:= 'Clave de Usu Modifica';

  Acreditado := TCrAcredit.Create(Self);
  Acreditado.MasterSource:=Self;
  Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

  FKeyFields.Add('ID_REPRESENTANTE');

//  TpoTel := TCrTpoTel.Create(Self);
//  TpoTel.MasterSource:=Self;

  TableName := 'CR_REPRESENTANTE';
  UseQuery  := True;
  HelpFile  := 'IntCrRepres.Hlp';
  ShowMenuReporte:=True;


end;

Destructor TCrRepres.Destroy;
begin
  If Acreditado <> Nil Then
     Acreditado.Free;

//  If TpoTel <> Nil then
//     TpoTel.Free ;

  inherited;
end;


function TCrRepres.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRepres;
begin
   W:=TWCrRepres.Create(Self);
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


Function TCrRepres.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRepres.it','F');
      Try if Active then begin
             T.Param(0,ID_ACREDITADO.AsString);
          end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrRepres.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_REPRESENTANTE********************)
(*                                                                                       *)
(*  FORMA DE CR_REPRESENTANTE                                                            *)
(*                                                                                       *)
(***********************************************FORMA CR_REPRESENTANTE********************)

function TWCrRepres.CountPredeterminados(Acred : String; Cal: integer):Integer;
var vlCount : Integer;
    vlSql, x   : String;
Begin
   If Cal = 1 then
      x := ' COUNT(*)  '
   Else
      x := ' ID_REPRESENTANTE ' ;

   vlsql:=' SELECT '+x+' AS RESULTADO FROM CR_REPRESENTANTE ' +
          ' WHERE  ID_ACREDITADO = ' + Acred +
          ' AND B_PREDETERMINADO = '''+CoVERDAD+'''  ';
   GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'RESULTADO',vlCount,False);
   CountPredeterminados := vlCount;
end;

Function TWCrRepres.BuscaPredeterminado: Boolean;
var vlSql   : String;
    Q       : TQuery;
    vlSalida: Boolean;
    Id      : Integer ;
begin
   vlSalida := False;

   If ChBB_PREDETERMINADO.Checked then
   Begin
      Try
{         vlSql := 'SELECT * FROM CR_REPRESENTANTE WHERE ID_ACREDITADO = '+Objeto.ID_ACREDITADO.AsString+
                  ' AND B_PREDETERMINADO = '''+CoVERDAD+''' ';
         Q := TQuery.Create(Self);
         Q.SessionName := Objeto.SessionName;
         Q.DataBaseName := Objeto.DataBaseName;
         Q.SQL.Clear;
         Q.SQL.Add(vlsql);
         Q.Open;
         //verifiac solo en caso de alta }
         If InterForma1.IsNewData then
         Begin
           Objeto.ID_REPRESENTANTE.GetFromControl;
           Q := TQuery.Create(Self);
           Q.Close ;
           Q.SessionName := Objeto.SessionName;
           Q.DataBaseName := Objeto.DataBaseName;
           Q.Sql.Clear;
           Q.Sql.Add('SELECT * FROM CR_REPRESENTANTE WHERE ID_ACREDITADO = '+Objeto.ID_ACREDITADO.AsString+' '+
                     'AND ID_REPRESENTANTE = '+Objeto.ID_REPRESENTANTE.AsString+' AND B_PREDETERMINADO = '''+CoVERDAD+'''  ') ;
           Q.Open ;
           If Q.RecordCount > 0 then
              begin
                 vgActualiza := False;
                 Exit ;
              end
            Else
                 vgActualiza := True;
{           While Not Q.Eof Do
           Begin
              if ( Q.FieldByName('ID_ACREDITADO').AsString = Objeto.ID_ACREDITADO.AsString) and
                 ( Q.FieldByName('ID_REPRESENTANTE').AsString = Objeto.ID_REPRESENTANTE.AsString ) then //modificar
              Begin
                 ShowMessage('Registro ya existe');
                 Exit;
                 vgActualiza := False;
                 Break;
              end;
              Q.Next;
           End; //end while }
         End;//end if }

         If vgActualiza then
         Begin
            id:= CountPredeterminados(Objeto.ID_ACREDITADO.AsString, 2) ;
            If id <> 0 then
               begin
                  if MessageDlg('Existe un representante predeterminado,' +
                                '¿desea cambiarlo?',
                                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                   begin        // se cambia el registro de representante predeterminado
                      RunSQL('UPDATE CR_REPRESENTANTE SET B_PREDETERMINADO = '''+CoFALSO+''' '+
                             'WHERE ID_REPRESENTANTE = '+IntToStr(Id)+'  ',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
                      vlSalida := True;
                      vgAdvierteCambio:= True ;
                   end
                   else
                   begin
                      vgAdvierteCambio := False ;
                      vlSalida := False;
                   end;
               end ;
        {
            Q.First;
            While Not Q.Eof Do
            Begin
               if (Q.FieldByName('B_PREDETERMINADO').AsString  = CoVERDAD) then
               begin
                   if MessageDlg('Existe un representante predeterminado,' +
                                 '¿desea cambiarlo?',
                                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                    begin        // se cambia el registro de representante predeterminado
                       RunSQL('UPDATE CR_REPRESENTANTE SET B_PREDETERMINADO = '''+CoFALSO+''' '+
                              'WHERE ID_REPRESENTANTE = '+Q.FieldByName('ID_REPRESENTANTE').AsString+'  ',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
                       vlSalida := True;
                       vgAdvierteCambio:= True ;
                       Break;
                    end
                    else
                    begin
                       vgAdvierteCambio := False ;
                       vlSalida := False;
                       break;
                    end;
               end
               else
               begin
                  if (Q.FieldByName('B_PREDETERMINADO').AsString  = CoFALSO) then
                     vlSalida := True
                  else
                     vlSalida := False;
                  vgAdvierteCambio := False ;
               end;
               Q.Next;
            End; //end while  }
         End ;// actualiza
      Finally
        If Assigned(Q) Then
        Begin
           Q.Close;
           Q.Free;
        End;
      End; //end Try finally
   End; //end if checked

   BuscaPredeterminado:= vlSalida;
end ;

procedure TWCrRepres.DefinePredeterminado ;
Begin
//Nuevo
   If InterForma1.IsNewData then
   Begin
      Objeto.ID_ACREDITADO.GetFromControl;
      if CountPredeterminados(Objeto.ID_ACREDITADO.AsString, 1) = 0 then
         ChBB_PREDETERMINADO.Checked := true
      else
         ChBB_PREDETERMINADO.Checked := BuscaPredeterminado ;
   End
   Else
//Modificacion
   Begin
      if CountPredeterminados(Objeto.ID_ACREDITADO.AsString, 1) > 0 then
         ChBB_PREDETERMINADO.Checked := BuscaPredeterminado
      Else
         ChBB_PREDETERMINADO.Checked := true
   End
end;


procedure TWCrRepres.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
  Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
  Objeto.Acreditado.Persona.Nombre.Control := edACREDITADO;
  Objeto.ID_REPRESENTANTE.Control:= edID_REPRESENTANTE;
  Objeto.NOMBRE_REPRESENTANTE.Control := edNOMBRE_REPRESENTANTE;
  Objeto.EMAIL.Control := edEMail;
  Objeto.SIT_REPRESENTANTE.Control:= rgSIT_REPRESENTANTE ;
  Objeto.B_PREDETERMINADO.Control := ChBB_PREDETERMINADO ;
  Objeto.F_ALTA.Control:= edF_ALTA ;
  Objeto.CVE_USU_ALTA.Control:= edCVE_USUA_ALTA ;
  Objeto.F_MODIFICA.Control:= edF_MODIF ;
  Objeto.CVE_USU_MODIFICA.Control:= edCVE_USUA_MODIF ;

   If (Objeto.iIdAcred <> 0) and (Objeto.iIdRepr <> 0) Then
   begin
      If Objeto.Acreditado.FindKey([Objeto.iIdAcred]) and Objeto.FindKey([Objeto.iIdRepr])  then
      begin
         MuestraDatos;
         vgActualiza := true ;
      end;
   end;
end;

procedure TWCrRepres.FormDestroy(Sender: TObject);
begin
  Objeto.ID_ACREDITADO.Control:=nil;
  Objeto.Acreditado.ID_ACREDITADO.Control := nil;
  Objeto.Acreditado.Persona.Nombre.Control := nil;
  Objeto.ID_REPRESENTANTE.Control:= nil;
  Objeto.NOMBRE_REPRESENTANTE.Control := nil;
  Objeto.EMAIL.Control := nil;
  Objeto.SIT_REPRESENTANTE.Control:= nil ;
  Objeto.B_PREDETERMINADO.Control := nil ;
  Objeto.F_ALTA.Control := nil;
  Objeto.CVE_USU_ALTA.Control:= nil;
  Objeto.F_MODIFICA.Control:= nil;
  Objeto.CVE_USU_MODIFICA.Control:= nil;
end;

procedure TWCrRepres.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRepres.InterForma1DespuesNuevo(Sender: TObject);
var SQLText : String ;
          id: Integer ;
begin //<<Control>>.SetFocus;
   id:= 0 ;
   If (Objeto.iIdAcred <> 0)Then Begin
      Objeto.Acreditado.FindKey([Objeto.iIdAcred]);
   End;

   SQLText := 'SELECT SEQ_CR_REPRESENTANTE.NextVal AS NUEVO FROM CR_CREDITO' ;
   GetSQLInt(SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'NUEVO', id, False) ;
   Objeto.ID_REPRESENTANTE.AsInteger:= id ;
   rgSIT_REPRESENTANTE.ItemIndex:= 0 ;
   Objeto.SIT_REPRESENTANTE.AsString := 'AC' ;
   Objeto.F_ALTA.AsDateTime:= Now;
   Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario;
   edNOMBRE_REPRESENTANTE.SetFocus;
   vgActualiza := true ;
   sgcDatos.Clear('NO SE ENCONTRARON DATOS'#30'>C');
end;

procedure TWCrRepres.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
  vgActualiza := true ;
  Objeto.F_MODIFICA.AsDateTime:= Now;
  Objeto.CVE_USU_MODIFICA.AsString:= Objeto.Apli.Usuario;
  MuestraDatos ;
end;

//procedure TWCrRepres.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrRepres.InterForma1DespuesShow(Sender: TObject);
begin
//   If (Objeto.iIdAcred <> 0)Then Begin
//      Objeto.Acreditado.FindKey([Objeto.iIdAcred]);
//   End;
//   MuestraDatos ;
end;

procedure TWCrRepres.ChBB_PREDETERMINADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(ChBB_PREDETERMINADO,True,'',True);
end;

procedure TWCrRepres.bbId_AcreditadoClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWCrRepres.bbRepresentanteClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      InterForma1.NextTab(edID_REPRESENTANTE);
   End;
end;

procedure TWCrRepres.bbTIPO_TELEFONOClick(Sender: TObject);
begin
//   Objeto.TpoTel.ShowAll := True;
//   If Objeto.TpoTel.Busca Then Begin
//      InterForma1.NextTab(edTIPO_TELEFONO);
//   End;
end;

procedure TWCrRepres.MuestraDatos ;
var
   QryTpoTel, vlQry : TQuery;
   sSQL :String;
begin
    CBtipoTel.Items.Clear ;
    sSQL:= 'SELECT * FROM CR_TIPO_TELEFONO ORDER BY ID_TIPO_TELEFONO' ;
    QryTpoTel := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    Try
       If QryTpoTel <> Nil Then
          Begin
             While not QryTpoTel.Eof do begin
                CBTipoTel.Items.Add(Trim(QryTpoTel.Fields[0].AsString)+' - '+Trim(QryTpoTel.Fields[2].AsString) ) ;
                QryTpoTel.Next ;
             end ;
          End
          Else
            ShowMessage('No se encontraron tipos de telefono.') ;
    Finally
       If QryTpoTel <> Nil Then
          QryTpoTel.free;
   End;

   CBTipoTel.ItemIndex:= -1 ;
   edNUM_TELEFONO.Text:= '' ;
   edEXTENSION.Text:= '' ;
   btnAgregaTel.Caption:='Agregar' ;
   btnModificaTel.Caption := 'Modificar' ;
   btnEliminaTel.Caption:='Eliminar' ;
   btnAgregaTel.Visible := (btnAgregaTel.Caption='Agregar') ;
   btnModificaTel.Visible:= (btnModificaTel.Caption='Modificar') ;
   btnEliminaTel.Visible:=(btnEliminaTel.Caption='Eliminar') ;
   Memo1.Visible := not (btnAgregaTel.Caption='Agregar') ;
   Label4.Visible := not (btnAgregaTel.Caption='Agregar') ;
   Label5.visible := not (btnModificaTel.Caption='Modificar') ;
   Label6.Visible := not (btnEliminaTel.Caption='Eliminar') ;
   cbTipoTel.visible := not (btnAgregaTel.Caption='Agregar') ;
   edNUM_TELEFONO.Visible:= not (btnAgregaTel.Caption='Agregar') ;
   edEXTENSION.Visible:= not (btnAgregaTel.Caption='Agregar') ;

   sSQL:='SELECT TIPO_TELEFONO, NUM_TELEFONO, EXTENSION, A.ID_TIPO_TELEFONO '+
         '  FROM CR_REPR_TEL A, CR_TIPO_TELEFONO B '+
         ' WHERE A.ID_TIPO_TELEFONO = B.ID_TIPO_TELEFONO '+
         ' AND ID_REPRESENTANTE = '+ Objeto.ID_REPRESENTANTE.AsString + ' ';

   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('ID_TIPO_TELEFONO').DisplayLabel := '' ;
            vlQry.FieldByName('ID_TIPO_TELEFONO').DisplayWidth := 0 ;
            vlQry.FieldByName('TIPO_TELEFONO').DisplayLabel := 'TIPO TELEFONO' + #30 +'>C';
            vlQry.FieldByName('NUM_TELEFONO').DisplayLabel := 'NUM TELEFONO' + #30 +'>C';
            vlQry.FieldByName('EXTENSION').DisplayLabel := 'EXTENSION' + #30 +'>C';
            vlQry.FieldByName('TIPO_TELEFONO').DisplayWidth := 19;
            vlQry.FieldByName('NUM_TELEFONO').DisplayWidth := 30;
            vlQry.FieldByName('EXTENSION').DisplayWidth := 13;
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

procedure TWCrRepres.rgSIT_REPRESENTANTEExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgSIT_REPRESENTANTE,True,'',True);
end;

procedure TWCrRepres.edID_ACREDITADOExit(Sender: TObject);
var VLMsg: String;
    VlSalida: Boolean;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      If Objeto.ID_ACREDITADO.AsString = '' Then Begin
         VlSalida := False;
         VLMsg    := 'Indique el Acreditado';
      End;
      InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrRepres.edID_REPRESENTANTEExit(Sender: TObject);
var   VLSalida  :  boolean;
      VLMsg, sSQL :  String;
      qyQuery : TQuery;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.ID_REPRESENTANTE.GetFromControl;
      If Objeto.ID_REPRESENTANTE.AsString = '' Then Begin
         VlSalida := False;
         VLMsg := 'Indique la clave numerica del representante.';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQL:= 'SELECT * FROM CR_REPRESENTANTE '+
                   ' WHERE ID_REPRESENTANTE ='+  SQLStr(Objeto.ID_REPRESENTANTE.AsString);
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_REPRESENTANTE').AsString = Objeto.ID_REPRESENTANTE.AsString Then Begin
                  VlSalida   := False;
                  VLMsg := 'Numero ya existente.';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_REPRESENTANTE,VLSalida,VLMsg,True);
   End;

end;

procedure TWCrRepres.edID_REPRESENTANTEKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TWCrRepres.edNOMBRE_REPRESENTANTEExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edNOMBRE_REPRESENTANTE,True,'',True);
end;

procedure TWCrRepres.ChBB_PREDETERMINADOClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
        if CountPredeterminados( Objeto.ID_ACREDITADO.AsString, 1 ) <= 1 then
        Begin
          if ( Objeto.B_PREDETERMINADO.AsString = CoVERDAD ) then
          Begin
             ChBB_PREDETERMINADO.Checked := True;
             vgActualiza:= False;
          end;
        end
   end;
end;

procedure TWCrRepres.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
           DefinePredeterminado;
           Realizado := True;
      end
      else
           Realizado := False;
   end
   else
   Begin
      if ChBB_PREDETERMINADO.Checked then
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if vgActualiza then
           DefinePredeterminado;
         //end if
           Realizado := True;
      end
      else
           Realizado := False;
   end
end;

procedure TWCrRepres.btnAgregaTelClick(Sender: TObject);
var CadenaSQL, Ext : String ;
begin
   If btnAgregaTel.Caption = 'Agregar' then
      begin
         Memo1.Visible := (btnAgregaTel.Caption='Agregar') ;
         Label4.Visible := (btnAgregaTel.Caption='Agregar') ;
         Label5.visible := (btnAgregaTel.Caption='Agregar') ;
         Label6.visible := (btnAgregaTel.Caption='Agregar') ;
         cbTipoTel.visible := (btnAgregaTel.Caption='Agregar') ;
         edNUM_TELEFONO.Visible:= (btnAgregaTel.Caption='Agregar') ;
         edEXTENSION.Visible:= (btnAgregaTel.Caption='Agregar') ;
         btnAgregaTel.Caption:='Aceptar' ;
         btnModificaTel.Visible := false ;
         btnEliminaTel.Caption := 'Cancelar' ;
      end
   Else
      begin
         If (CbTipoTel.Text = '') or (CbTipoTel.ItemIndex < 0 ) then
            begin
               ShowMessage('Determine por favor el tipo de numero telefonico...') ;
               CbTipoTel.SetFocus ;
               Exit ;
            end ;

         edNUM_TELEFONO.Text:= Trim(TrimChar(edNUM_TELEFONO.Text, '$,-./\() ') ) ;

         If (edNUM_TELEFONO.Text = '') or (Length(edNUM_TELEFONO.Text) <> 10) then
            begin
               ShowMessage('Determine por favor los 10 digitos del numero telefonico, incluyendo clave de larga distancia.') ;
               edNUM_TELEFONO.SetFocus ;
               Exit ;
            end ;

         edEXTENSION.Text:= Trim(TrimChar(edEXTENSION.Text, '$,-./\() ') )  ;

         If (edEXTENSION.Text = '') Then
            Ext:= 'NULL'
         Else
            Ext:= edEXTENSION.Text ;

         If MessageDlg('¿Desea agregar el numero telefonico descrito?', mtConfirmation, [mbYes, mbNo], 0)= mrYes then
            begin
               CadenaSQL:= 'INSERT INTO CR_REPR_TEL '+
                           ' VALUES('+Objeto.ID_REPRESENTANTE.AsString+', '+ edInt.Text+', '+edNUM_TELEFONO.Text+', '+Ext+')' ;
               //ShowMessage(CadenaSQL) ;
               RunSQL(CadenaSQL ,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
               btnAgregaTel.Caption:='Agregar';
               MuestraDatos ;
            end ;
      end ;
end;

procedure TWCrRepres.btnModificaTelClick(Sender: TObject);
var T1, T2, T3, SQLText, Ext : String ;
begin
   If btnModificaTel.Caption ='Modificar' then
      begin
         Memo1.Visible := (btnModificaTel.Caption ='Modificar') ;
         Label4.Visible := (btnModificaTel.Caption ='Modificar') ;
         Label5.visible := (btnModificaTel.Caption ='Modificar') ;
         Label6.visible := (btnModificaTel.Caption ='Modificar') ;
         cbTipoTel.visible := (btnModificaTel.Caption ='Modificar') ;
         edNUM_TELEFONO.Visible:= (btnModificaTel.Caption ='Modificar') ;
         edEXTENSION.Visible:= (btnModificaTel.Caption ='Modificar') ;
         btnModificaTel.Caption:='Aceptar' ;
         btnAgregaTel.Visible := false ;
         btnEliminaTel.Caption := 'Cancelar' ;
      end
   Else
      begin
         T1:= ''; T2:=''; T3:= '';

         If Trim(CbTipoTel.Text) <> '' then
            T1:= ' ID_TIPO_TELEFONO = '+edInt.Text+' ';

         If Trim(edNUM_TELEFONO.Text) <> '' then
            T2:= ', NUM_TELEFONO     = '+edNUM_TELEFONO.Text+' ';

         If Trim(edEXTENSION.Text) <> '' then
            T3:= ', EXTENSION        = '+edEXTENSION.Text+' ';

         SQLText:= Trim(T1)+Trim(T2)+Trim(T3) ;
         If Copy(SQLText, 1, 1)= ',' then
            SQLText := Copy(SQLText, 2, Length(SQLText)-1) ;


         If MessageDlg('¿Desea cambiar los valores actuales por los descritos?.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               If sgcDatos.CellStr['EXTENSION',sgcDatos.SG.Row] <> '' then
                  Ext := 'AND EXTENSION = '+sgcDatos.CellStr['EXTENSION',sgcDatos.SG.Row]+'  '
               Else
                  Ext := '' ;
               SQLText:= 'UPDATE CR_REPR_TEL SET '+SQLText  ;
               SQLText := SQLText + ' WHERE ID_REPRESENTANTE = '+Objeto.ID_REPRESENTANTE.AsString+' '+
                                    '   AND ID_TIPO_TELEFONO = '+sgcDatos.CellStr['ID_TIPO_TELEFONO',sgcDatos.SG.Row]+' '+
                                    '   AND NUM_TELEFONO     = '+sgcDatos.CellStr['NUM_TELEFONO',sgcDatos.SG.Row]+' '+
                                    Ext ;
               //ShowMessage(SQLText) ;
               RunSQL(SQLText, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
               MuestraDatos ;
            end ;
      end ;
end;

procedure TWCrRepres.btnEliminaTelClick(Sender: TObject);
var SQLText, Ext : String ;
begin
   If btnEliminaTel.Caption = 'Cancelar' then
      begin
         btnAgregaTel.Visible := (btnEliminaTel.Caption='Cancelar') ;
         btnModificaTel.Visible := (btnEliminaTel.Caption='Cancelar') ;
         MuestraDatos ;
      end
   Else
      begin
         If MessageDlg('¿Desea eliminar el elemento seleccionado?.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               If sgcDatos.CellStr['EXTENSION',sgcDatos.SG.Row] <> '' then
                  Ext:= '   AND EXTENSION        = '+sgcDatos.CellStr['EXTENSION',sgcDatos.SG.Row]+' '
               Else
                  Ext := '' ;

               SQLText:= 'DELETE FROM CR_REPR_TEL '+
                         ' WHERE ID_REPRESENTANTE = '+Objeto.ID_REPRESENTANTE.AsString+' '+
                         '   AND ID_TIPO_TELEFONO = '+sgcDatos.CellStr['ID_TIPO_TELEFONO',sgcDatos.SG.Row]+' '+
                         '   AND NUM_TELEFONO     = '+sgcDatos.CellStr['NUM_TELEFONO',sgcDatos.SG.Row]+' '+
                         Ext  ;
               RunSQL(SQLText, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
               //ShowMessage(SQLText) ;
               MuestraDatos ;
            end ;
      end ;
end;

procedure TWCrRepres.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.InternalBusca then
     MuestraDatos ;
end;

procedure TWCrRepres.CBTipoTelChange(Sender: TObject);
begin
   edInt.Text := Copy(Trim(CBTipoTel.Text), 1, pos('-', CBTipoTel.Text)-1 )  ;
end;

procedure TWCrRepres.MensajeAdvierte ;
begin
   ShowMessage('El representante predeterminado para este acreditado ha sido re-asignado. '+#13+
               'No obstante, este cambio NO sera reflejado en capturas anteriores.');
end ;

procedure TWCrRepres.edEMailExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edEMAIL,True,'',True);
end;

procedure TWCrRepres.edF_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_ALTA,True,'',True);
end;

procedure TWCrRepres.edCVE_USUA_ALTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_USUA_ALTA,True,'',True);
end;

procedure TWCrRepres.edF_MODIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_MODIF,True,'',True);
end;

procedure TWCrRepres.edCVE_USUA_MODIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_USUA_MODIF,True,'',True);
end;

procedure TWCrRepres.InterForma1DespuesAceptar(Sender: TObject);
begin
   If vgAdvierteCambio= True then
   begin
      MensajeAdvierte;
      vgAdvierteCambio := False;
   end;
end;

end.
