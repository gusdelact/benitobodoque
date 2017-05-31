// Sistema         : Clase de Clasificación
// Fecha de Inicio : 07/07/2004
// Función forma   : Clase de Clasificación
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntMClasific;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, DBGrids, IntMRegistro,
IntGenCre,IntParamCre, IntSGCtrl;

Type
 TMClasific= class; 

  TwMClasific=Class(TForm)
    InterForma1: TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    sgcDATA: TSGCtrl;
    Shape5: TShape;
    Shape6: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    private
    { Private declarations }
      Function ExisteReg(sTabla : String; iIdSolicitud: Integer): Boolean;
      Procedure MuestraCat;
      Function  CadenaSql : String;
      Procedure MuestraDatos;

    public
    { Public declarations }
    Objeto : TMClasific;
end;
 TMClasific= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        NUM_CLASIFICA : TInterCampo;
        { Public declarations }
        Registro    : TMRegistro;
        ParamCre    : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
uses IntMCesion, IntMParApor, IntMDocCob, IntMNaveInd;
{$R *.DFM}


constructor TMClasific.Create( AOwner : TComponent );
begin Inherited;
   NUM_CLASIFICA :=CreaCampo('NUM_CLASIFICA',ftString,tsNinguno,tsNinguno,False);
   With NUM_CLASIFICA Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('BI');
      ComboLista.Add('1'); ComboDatos.Add('BM');
      ComboLista.Add('2'); ComboDatos.Add('PR');
      ComboLista.Add('3'); ComboDatos.Add('PE');
      ComboLista.Add('4'); ComboDatos.Add('CE');
      ComboLista.Add('5'); ComboDatos.Add('PA');
      ComboLista.Add('6'); ComboDatos.Add('SC');
   End;
      NUM_CLASIFICA.Caption:='Tipo de seguro';

   Registro := TMRegistro.Create(Self);
   Registro.MasterSource:=Self;

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMClasific.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMClasific.Destroy;
begin inherited;
end;


function TMClasific.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMClasific;
begin
   W:=TwMClasific.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMClasific.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMClasific.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMClasific.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA Clasificación********************)
(*                                                                              *)
(*  FORMA DE Clasificación                                                            *)
(*                                                                              *)
(***********************************************FORMA Clasificación********************)
Function TwMClasific.CadenaSql : String;
Var
   sSQL : String;
Begin
   sSQL :='';
   sSQL :='SELECT CR_GA_REGISTRO.ID_SOLICITUD, '+
                     '       CR_GA_REGISTRO.CVE_GARANTIA, '+
                     '       CR_GA_GARANTIA.DESC_GARANTIA, '+
                     '		  NVL(CR_GA_CESION.ID_SOLICITUD,0)ID_CESION, '+
                     '		  NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0)ID_APOR, '+
                     '		  NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0)ID_NAVE, '+
                     '		  NVL(CR_GA_DOC_COB.ID_SOLICITUD,0)ID_DOC_COB, '+
                     '       '' '' CESION, '+
                     '       '' '' APOR, '+
                     '       '' '' NAVE, '+
                     '       '' '' DOC_COB '+
                     '  FROM CR_GA_REGISTRO  , CR_GA_CESION   , CR_GA_PAR_APOR,  '+
                     '       CR_GA_GARANTIA, CR_GA_NAVE_IND, CR_GA_DOC_COB '+
                     ' WHERE CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+) '+
                     '   AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+) '+
                     '   AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+) '+
                     '   AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+) '+
                     '   AND CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA '+
                     '   AND CR_GA_REGISTRO.ID_SOLICITUD = '+ Objeto.Registro.ID_SOLICITUD.AsSQL+
                     ' ORDER BY CR_GA_REGISTRO.ID_SOLICITUD';
   CadenaSql := sSQL;
End;

Procedure TwMClasific.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
   i:Integer;
Begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('ID_SOLICITUD').Visible := False;
            vlQry.FieldByName('CVE_GARANTIA').Visible := False;
            vlQry.FieldByName('DESC_GARANTIA').Visible := False;

            vlQry.FieldByName('ID_CESION').Visible := False;
            vlQry.FieldByName('ID_APOR').Visible := False;
            vlQry.FieldByName('ID_NAVE').Visible := False;
            vlQry.FieldByName('ID_DOC_COB').Visible := False;

            vlQry.FieldByName('CESION').DisplayLabel  := 'CESION' + #30 +'>C';
            vlQry.FieldByName('APOR').DisplayLabel  := 'APOR' + #30 +'>C';
            vlQry.FieldByName('NAVE').DisplayLabel  := 'CESION' + #30 +'>C';
            vlQry.FieldByName('DOC_COB').DisplayLabel  := 'APOR' + #30 +'>C';

            vlQry.FieldByName('CESION').DisplayWidth  := 20;
            vlQry.FieldByName('APOR').DisplayWidth  := 20;
            vlQry.FieldByName('NAVE').DisplayWidth  := 20;
            vlQry.FieldByName('DOC_COB').DisplayWidth  := 20;

            sgcDATA.SG.Canvas.Font.Size := 5;
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
            sgcDATA.ColumnByName('CESION').IsCheck := True;
            sgcDATA.ColumnByName('APOR').IsCheck := True;
            sgcDATA.ColumnByName('NAVE').IsCheck := True;
            sgcDATA.ColumnByName('DOC_COB').IsCheck := True;
         End Else Begin
           sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
   For i:=0 To sgcDATA.SG.RowCount Do Begin
      If sgcDATA.CellStr['ID_CESION',i]<>'0' Then
         sgcDATA.CellStr['CESION',i] := 'SI' + #30 + '>C'
      Else
         sgcDATA.CellStr['CESION',i] := '';

      If sgcDATA.CellStr['ID_APOR',i]<>'0' Then
         sgcDATA.CellStr['APOR',i] := 'SI' + #30 + '>C'
      Else
         sgcDATA.CellStr['APOR',i] := '';

      If sgcDATA.CellStr['ID_NAVE',i]<>'0' Then
         sgcDATA.CellStr['NAVE',i] := 'SI' + #30 + '>C'
      Else
         sgcDATA.CellStr['NAVE',i] := '';

      If sgcDATA.CellStr['ID_DOC_COB',i]<>'0' Then
         sgcDATA.CellStr['DOC_COB',i] := 'SI' + #30 + '>C'
      Else
         sgcDATA.CellStr['DOC_COB',i] := '';
   End;

End;

procedure TwMClasific.FormShow(Sender: TObject);
begin
   InterForma1.BtnImprimir.Visible:= False;
   InterForma1.BtnPreview.Visible:= True;
   InterForma1.BtnAyuda.Visible:= False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

procedure TwMClasific.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMClasific.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMClasific.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TwMClasific.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMClasific.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMClasific.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
end;

Procedure TwMClasific.MuestraCat;
Var
   MCesion   : TMCesion;
   MParApor  : TMParApor;
   MDocCob   : TMDocCob;
   MNaveInd  : TMNaveInd;
   Y         : Integer;
Begin
   Y := sgcDATA.SG.Row;
   If Objeto.NUM_CLASIFICA.AsString ='CE' Then Begin
      MCesion := TMCesion.Create(self);
      Try
         MCesion.Apli :=Objeto.Apli;
         MCesion.ParamCre:=Objeto.ParamCre;
         MCesion.MRegistro:=Objeto.Registro;

         If (sgcDATA.CellStr['APOR',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['NAVE',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['DOC_COB',Y] <> 'SI' + #30 + '>C')Then Begin

            If Not ExisteReg('CR_GA_CESION', Objeto.Registro.ID_SOLICITUD.AsInteger) Then Begin
               MCesion.FindKey([Objeto.Registro.ID_SOLICITUD.AsInteger]);
               MCesion.Catalogo;
            End Else
               MCesion.Nuevo;
         End;
      Finally
         MCesion.Free;
      End;
   End Else If Objeto.NUM_CLASIFICA.AsString ='PA' Then Begin
      MParApor:= TMParApor.Create(self);
      Try
         MParApor.Apli :=Objeto.Apli;
         MParApor.ParamCre:=Objeto.ParamCre;
         MParApor.MRegistro:=Objeto.Registro;
         If (sgcDATA.CellStr['CESION',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['NAVE',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['DOC_COB',Y] <> 'SI' + #30 + '>C')Then Begin

            If Not ExisteReg('CR_GA_PAR_APOR', Objeto.Registro.ID_SOLICITUD.AsInteger) Then Begin
               MParApor.FindKey([Objeto.Registro.ID_SOLICITUD.AsInteger]);
               MParApor.Catalogo;
            End Else
               MParApor.Nuevo;
         End;
      Finally
         MParApor.Free;
      End;
   End Else If Objeto.NUM_CLASIFICA.AsString ='NV' Then Begin
      MNaveInd:= TMNaveInd.Create(self);
      Try
         MNaveInd.Apli :=Objeto.Apli;
         MNaveInd.ParamCre:=Objeto.ParamCre;
         MNaveInd.MRegistro:=Objeto.Registro;
         If (sgcDATA.CellStr['CESION',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['APOR',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['DOC_COB',Y] <> 'SI' + #30 + '>C')Then Begin

            If Not ExisteReg('CR_GA_NAVE_IND', Objeto.Registro.ID_SOLICITUD.AsInteger) Then Begin
               MNaveInd.FindKey([Objeto.Registro.ID_SOLICITUD.AsInteger]);
               MNaveInd.Catalogo;
            End Else
               MNaveInd.Nuevo;
         End;
      Finally
         MNaveInd.Free;
      End;
   End Else If Objeto.NUM_CLASIFICA.AsString ='DC' Then Begin
      MDocCob:= TMDocCob.Create(self);
      Try
         MDocCob.Apli :=Objeto.Apli;
         MDocCob.ParamCre:=Objeto.ParamCre;
         MDocCob.MRegistro:=Objeto.Registro;
         If (sgcDATA.CellStr['CESION',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['APOR',Y] <> 'SI' + #30 + '>C')And
            (sgcDATA.CellStr['NAVE',Y] <> 'SI' + #30 + '>C') Then Begin

            If Not ExisteReg('CR_GA_DOC_COB', Objeto.Registro.ID_SOLICITUD.AsInteger) Then Begin
               MDocCob.FindKey([Objeto.Registro.ID_SOLICITUD.AsInteger]);
               MDocCob.Catalogo;
            End Else
               MDocCob.Nuevo;
         End;
      Finally
         MDocCob.Free;
      End;
   End;
   MuestraDatos;
end;

procedure TwMClasific.InterForma1BtnPreviewClick(Sender: TObject);
Begin
   If sgcDATA.SG.Selection.Left = 10 Then Begin
      Objeto.NUM_CLASIFICA.AsString:= 'CE';
   End Else If sgcDATA.SG.Selection.Left = 11  Then Begin
      Objeto.NUM_CLASIFICA.AsString:= 'PA';
   End Else If sgcDATA.SG.Selection.Left = 12  Then Begin
      Objeto.NUM_CLASIFICA.AsString:= 'NV';
   End Else If sgcDATA.SG.Selection.Left = 13  Then Begin
      Objeto.NUM_CLASIFICA.AsString:= 'DC';
   End;
   MuestraCat;
end;
Function TwMClasific.ExisteReg(sTabla : String; iIdSolicitud: Integer): Boolean;
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
   sSQL:='SELECT * FROM '+ sTabla + ' WHERE ID_SOLICITUD = '+ IntToStr(iIdSolicitud);
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = iIdSolicitud Then Begin
         ExisteReg:= False;
      End Else Begin
         ExisteReg:= True;
      End;
      qyQuery.Free;
   End Else Begin
      ExisteReg:= True;
   End;
End;

procedure TwMClasific.sgcDATADblClick(Sender: TObject);
Var
   Y : integer;
   Procedure MarcaCesion(iRen: Integer);
   Begin
     If sgcDATA.CellStr['CESION',iRen] <> 'SI' + #30 + '>C' Then Begin
        sgcDATA.CellStr['CESION',iRen]:= 'SI' + #30 + '>C';
     End;
   End;
   Procedure MarcaApor(iRen: Integer);
   Begin
     If sgcDATA.CellStr['APOR',iRen] <> 'SI' + #30 + '>C' Then Begin
        sgcDATA.CellStr['APOR',iRen]:= 'SI' + #30 + '>C';
     End;
   End;
   Procedure MarcaNave(iRen: Integer);
   Begin
     If sgcDATA.CellStr['NAVE',iRen] <> 'SI' + #30 + '>C' Then Begin
        sgcDATA.CellStr['NAVE',iRen]:= 'SI' + #30 + '>C';
     End;
   End;
   Procedure MarcaDocCob(iRen: Integer);
   Begin
     If sgcDATA.CellStr['DOC_COB',iRen] <> 'SI' + #30 + '>C' Then Begin
        sgcDATA.CellStr['DOC_COB',iRen]:= 'SI' + #30 + '>C';
     End;
   End;
Begin
   Y := sgcDATA.SG.Row;
   If sgcDATA.SG.Selection.Left = 10 Then Begin
      MarcaCesion(Y);
      Objeto.NUM_CLASIFICA.AsString:= 'CE';
   End Else If sgcDATA.SG.Selection.Left = 11  Then Begin
      MarcaApor(Y);
      Objeto.NUM_CLASIFICA.AsString:= 'PA';
   End Else If sgcDATA.SG.Selection.Left = 12  Then Begin
      MarcaNave(Y);
      Objeto.NUM_CLASIFICA.AsString:= 'NV';
   End Else If sgcDATA.SG.Selection.Left = 13  Then Begin
      MarcaDocCob(Y);
      Objeto.NUM_CLASIFICA.AsString:= 'DC';
   End;
   MuestraCat;
end;

end.
