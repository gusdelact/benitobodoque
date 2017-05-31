// Sistema         : Clase de CR_CT_DETALLE
// Fecha de Inicio : 21/05/2004
// Función forma   : Clase de CR_CT_DETALLE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCatDet;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre;

Type
 TMCatDet= class;

  TWMCatDet=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_EXCEPCION : TLabel;
    edDESC_L_BLOQUE: TEdit;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_DETALLE: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSIT_DETALLE: TRadioGroup;
    Label2: TLabel;
    edTX_DETALLE: TMemo;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_DETALLEExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_DETALLEExit(Sender: TObject);
    procedure edDESC_L_BLOQUEExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edTX_DETALLEExit(Sender: TObject);
    procedure edCVE_DETALLEKeyPress(Sender: TObject; var Key: Char);
    procedure edDESC_L_BLOQUEKeyPress(Sender: TObject; var Key: Char);
    procedure edTX_DETALLEKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);

    private
      Procedure EscribirACampo(sTableName:String; sCveDet:String; sCampoBlob:String);
      Procedure LeerCampo(sTableName:String; sCveDet:String; sCampoBlob:String);
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMCatDet;
    end;

 TMCatDet= class(TInterFrame)
      private
         sDetalle: String;
         msBufEnt,msBufSal: TMemoryStream;
         iSizeEnt: Integer;
         yy: Integer;
         pApuntadorEnt: Pointer;

      protected
      public
        { Public declarations }
        CVE_DETALLE         : TInterCampo;
        DESC_L_BLOQUE       : TInterCampo;
        TX_DETALLE          : TInterCampo;
        SIT_DETALLE         : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        F_MODIFICA          : TInterCampo;

        ParamCre                 : TParamCre;
        function    InternalBusca : Boolean; override;
        Function    InternalPost:Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMCatDet.Create( AOwner : TComponent );
begin Inherited;
   CVE_DETALLE :=CreaCampo('CVE_DETALLE',ftString,tsNinguno,tsNinguno,True);
      CVE_DETALLE.Caption:='Clave de Detalle';
      CVE_DETALLE.NoCompare:= False;
   DESC_L_BLOQUE :=CreaCampo('DESC_L_BLOQUE',ftString,tsNinguno,tsNinguno,True);
      DESC_L_BLOQUE.Caption:='Descripción de Detalle';
      DESC_L_BLOQUE.NoCompare:= True;
   TX_DETALLE :=CreaCampo('TX_DETALLE',ftMemo,tsNinguno,tsNinguno,True);
      TX_DETALLE.Caption:='Nombre del reporte';
      TX_DETALLE.IsLongData:=True;
      TX_DETALLE.NoCompare:= True;
   SIT_DETALLE :=CreaCampo('SIT_DETALLE',ftString,tsNinguno,tsNinguno,True);
      SIT_DETALLE.NoCompare:= True;
   With SIT_DETALLE do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_DETALLE.Caption:='Situación de Detalle';

   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFICA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:= True;

   FKeyFields.Add('CVE_DETALLE');
   TableName := 'CR_CT_DETALLE';
   UseQuery := True;
   HelpFile := 'IntMCatDet.Hlp';
   ShowMenuReporte:=True;

end;


Destructor TMCatDet.Destroy;
begin
   Inherited;
end;

function TMCatDet.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCatDet;
begin
   W:=TWMCatDet.Create(Self);
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

Function TMCatDet.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMCatDet.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_DETALLE.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMCatDet.Reporte:Boolean;
begin
   Result := False;
end;

Function TMCatDet.InternalPost : Boolean;
Var    stpInserta : TStoredProc;
       VLSalida : Boolean;
       sNuevo : String;
Begin
   InternalPost := False;
   VLSalida := False;
   sNuevo:= 'T';
   If Modo=moEdit Then Begin
      sNuevo:= 'F';
   End;
   If Modo=moAppEnd Then Begin
      sNuevo:= 'T';
   End;
      stpInserta:=TStoredProc.Create(Nil);
      try
         Try
            stpInserta.DatabaseName:=DataBaseName;
            stpInserta.SessionName:=SessionName;
            stpInserta.Active:=False;
            stpInserta.Params.Clear;
            stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTADETALLE';
            stpInserta.Params.CreateParam(ftString,'PE_CVE_DETALLE',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_DESC_L_BLOQUE',ptInput);
            stpInserta.Params.CreateParam(ftMemo,'PE_TX_DETALLE',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_SIT_DETALLE',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_NUEVO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            stpInserta.ParamByName('PE_CVE_DETALLE').AsString := CVE_DETALLE.AsString;
            stpInserta.ParamByName('PE_DESC_L_BLOQUE').AsString := DESC_L_BLOQUE.AsString;
            stpInserta.ParamByName('PE_TX_DETALLE').AsMemo := ' ';
            stpInserta.ParamByName('PE_SIT_DETALLE').AsString := SIT_DETALLE.AsString;
            stpInserta.ParamByName('PE_CVE_USU_ALTA').AsString := CVE_USU_ALTA.AsString;
            If F_ALTA.AsDateTime <>0 Then
               stpInserta.ParamByName('PE_F_ALTA').AsDateTime := F_ALTA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_ALTA').Clear;

            stpInserta.ParamByName('PE_CVE_USU_MODIFICA').AsString := CVE_USU_MODIFICA.AsString;
            If F_MODIFICA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_MODIFICA').AsDateTime := F_MODIFICA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_MODIFICA').Clear;

            stpInserta.ParamByName('PE_NUEVO').AsString := sNuevo;
            stpInserta.ExecProc;
            If stpInserta.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
               VLSalida:= True;
            End Else Begin
                ShowMessage('ERROR EN ALTA DE DETALLE: ' +  IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                            stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;
         Except
             ShowMessage('Problemas con el Alta del Detalle. Avise Urgentemente a Sistemas');
         End;
      Finally
          If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
          End;
      End;
      AutoRefresh := True;
      InternalPost := VLSalida
   //End;
End;
(***********************************************FORMA CR_CT_DETALLE********************)
(*                                                                              *)
(*  FORMA DE CR_CT_DETALLE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CT_DETALLE********************)

procedure TWMCatDet.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_DETALLE.Control      := edCVE_DETALLE;
      DESC_L_BLOQUE.Control    := edDESC_L_BLOQUE;
      TX_DETALLE.Control       := edTX_DETALLE;
      SIT_DETALLE.Control      := rgSIT_DETALLE;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      F_MODIFICA.Control       := edF_MODIFICA;
      InterForma1.MsgPanel     := PnlMsg;
   End;
   Objeto.msBufEnt := TMemoryStream.Create;
   Objeto.msBufSal := TMemoryStream.Create;
   Objeto.sDetalle:='';
end;

procedure TWMCatDet.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_DETALLE.Control      := Nil;
      DESC_L_BLOQUE.Control    := Nil;
      TX_DETALLE.Control       := Nil;
      SIT_DETALLE.Control      := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
   Objeto.msBufEnt.Free;
   Objeto.msBufSal.Free;
end;

procedure TWMCatDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMCatDet.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
   If Realizado = True Then Begin
      Objeto.iSizeEnt := 0;
      Objeto.sDetalle:='';
      Objeto.pApuntadorEnt:= nil;
      Objeto.msBufEnt.Clear;

      Objeto.sDetalle:= edTX_DETALLE.Lines.Text;
      Objeto.iSizeEnt := length(Objeto.sDetalle);
      Objeto.pApuntadorEnt:= PChar(edTX_DETALLE.Lines.Text);
      Objeto.yy:= Objeto.msBufEnt.Write(Objeto.pApuntadorEnt^, Objeto.iSizeEnt);
      Objeto.msBufEnt.Position:=0;
   End;
end;

procedure TWMCatDet.InterForma1Buscar(Sender: TObject);
begin
   Objeto.InternalBusca;
   LeerCampo('CR_CT_DETALLE', Objeto.CVE_DETALLE.AsString, 'TX_DETALLE');
end;

procedure TWMCatDet.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_DETALLE.ItemIndex:= 0;
   edCVE_DETALLE.SetFocus;
end;

procedure TWMCatDet.rgSIT_DETALLEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_DETALLE,True,CNULL,True);
end;

procedure TWMCatDet.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   LeerCampo('CR_CT_DETALLE', Objeto.CVE_DETALLE.AsString, 'TX_DETALLE');   
end;

procedure TWMCatDet.edCVE_DETALLEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveDoc  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_DETALLE.GetFromControl;

      If Objeto.CVE_DETALLE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Detalle';
      End Else Begin
         vlSql := ' SELECT * FROM CR_CT_DETALLE ' +
                  ' WHERE CVE_DETALLE='+ Objeto.CVE_DETALLE.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_DETALLE',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del Detalle ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_DETALLE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCatDet.edDESC_L_BLOQUEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_BLOQUE,True,CNULL,True);
end;

procedure TWMCatDet.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT * FROM CR_CT_CONTRATO_C '+
         '  WHERE CVE_DETALLE ='+ Objeto.CVE_DETALLE.AsSQL ;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      ShowMessage('El Detalle '''+ Objeto.CVE_DETALLE.AsString+
                  ''' tiene registros asociados, No puede ser eliminado');
      qyQuery.Free;
      Realizado:=False;
   End Else
      Realizado:=True;
end;

procedure TWMCatDet.edTX_DETALLEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TX_DETALLE.GetFromControl;
      If Objeto.TX_DETALLE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el Detalle';
      End;
      InterForma1.ValidaExit(edTX_DETALLE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCatDet.edCVE_DETALLEKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TWMCatDet.edDESC_L_BLOQUEKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TWMCatDet.edTX_DETALLEKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

Procedure TWMCatDet.EscribirACampo(sTableName:String; sCveDet:String; sCampoBlob:String);
Var
   tDetalle:   TTable;
Begin
   Try
      tDetalle := TTable.Create(Nil);
      tDetalle.DatabaseName := Objeto.Apli.DataBaseName;
      tDetalle.TableName := sTableName;
      tDetalle.Active := True;
      If tDetalle.FindKey([sCveDet]) Then Begin
         tDetalle.Edit;
         Objeto.msBufEnt.Position:=0;
         TMemoField(tDetalle.FindField(sCampoBlob)).LoadFromStream(Objeto.msBufEnt);
         tDetalle.Post;
      End Else Begin
         tDetalle.Edit;
         tDetalle.Insert;
         tDetalle.FindField('CVE_DETALLE').AsString := sCveDet;
         Objeto.msBufEnt.Position:=0;
         TMemoField(tDetalle.FindField(sCampoBlob)).LoadFromStream(Objeto.msBufEnt);
         tDetalle.Post;
      End;
   Finally
      tDetalle.Close;
      tDetalle.Free;
   End;
End;

Procedure TWMCatDet.LeerCampo(sTableName:String; sCveDet:String; sCampoBlob:String);
Var
   tDetalleCam:   TTable;
   slLista: TStringList;
Begin
   Try
       slLista:= TStringList.Create;
       tDetalleCam := TTable.Create(Nil);
       tDetalleCam.DatabaseName := Objeto.Apli.DataBaseName;
       tDetalleCam.TableName := sTableName;
       tDetalleCam.Active := True;
       If tDetalleCam.FindKey([sCveDet]) Then Begin
           tDetalleCam.Edit;
           Objeto.msBufSal.Clear;
           edTX_DETALLE.Lines.Text:=' ';

           TMemoField(tDetalleCam.FindField(sCampoBlob)).SaveToStream(Objeto.msBufSal);
           Objeto.msBufSal.Position:=0;
           slLista.Clear;
           slLista.LoadFromStream(Objeto.msBufSal);
           slLista.Count;
           edTX_DETALLE.Lines.AddStrings(slLista);
           tDetalleCam.Post;
       End;
   Finally
      slLista.Free;
      tDetalleCam.Close;
      tDetalleCam.Free;
   End;
End;

procedure TWMCatDet.InterForma1DespuesAceptar(Sender: TObject);
begin
   EscribirACampo('CR_CT_DETALLE', Objeto.CVE_DETALLE.AsString, 'TX_DETALLE');
   Objeto.FindKey([Objeto.CVE_DETALLE.AsString]);
   LeerCampo('CR_CT_DETALLE', Objeto.CVE_DETALLE.AsString, 'TX_DETALLE');
end;

procedure TWMCatDet.InterForma1DespuesCancelar(Sender: TObject);
begin
   LeerCampo('CR_CT_DETALLE', Objeto.CVE_DETALLE.AsString, 'TX_DETALLE');
end;

end.
