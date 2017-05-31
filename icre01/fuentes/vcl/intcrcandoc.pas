// Sistema         : Clase de CRCANDOC
// Fecha de Inicio : 23/09/2003
// Función forma   : Clase de CRCANDOC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrCanDoc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,

//Unidades Adicionales
IntParamCre,
IntGenCre,
IntCrDocto,
IntCrCesion, IntLinkit
;

Type
 TCrcandoc= class; 

  TWCrcandoc=Class(TForm)
    InterForma1             : TInterForma;
    edTIT_DOCUMENTO: TEdit;
    edTIT_IMP_NOMINA: TEdit;
    edTIT_TASA_AFORO: TEdit;
    edTIT_IMP_AFORO: TEdit;
    edTIT_TASA_DESC: TEdit;
    edTIT_IMP_COMPRA: TEdit;
    edTIT_SITUACION: TEdit;
    edTIT_CANCELA: TEdit;
    sgcDATOS: TSGCtrl;
    btCANCELA: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbID_CESION: TLabel;
    edID_CESION: TEdit;
    lbID_EMISOR: TLabel;
    edID_DOCUMENTO: TEdit;
    Label10: TLabel;
    btDOCUMENTO: TBitBtn;
    edDESC_DOCUMENTO: TEdit;
    cbB_APLI_DOCTO: TCheckBox;
    btCESION: TBitBtn;
    edTITULAR: TEdit;
    cbB_APLI_CESION: TCheckBox;
    Label12: TLabel;
    ilCESION: TInterLinkit;
    ilDOCTO: TInterLinkit;
    rgSITUACION: TRadioGroup;
    btBUSCA: TBitBtn;
    Edit1: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure btCESIONClick(Sender: TObject);
    procedure ilCESIONEjecuta(Sender: TObject);
    procedure btDOCUMENTOClick(Sender: TObject);
    procedure ilDOCTOEjecuta(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure cbB_APLI_CESIONClick(Sender: TObject);
    procedure cbB_APLI_DOCTOClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations } 
    Objeto : TCrcandoc;
    Function    CadenaSql : String;
    Procedure   MuestraDatos;
end;
 TCrcandoc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vlidcesiondoc   : String;
        ID_CESION       : TInterCampo;
        ID_DOCUMENTO    : TInterCampo;
        SITUACION       : TInterCampo;

        ParamCre        : TParamCre;
        Docto           : TCrDocto;
        Cesion          : TCrCesion;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

const
   coPosSel = 12;

{$R *.DFM}


constructor TCrcandoc.Create( AOwner : TComponent );
begin Inherited;
      ID_CESION :=CreaCampo('ID_CESION',ftString,tsNinguno,tsNinguno,False);
                ID_CESION.Caption:='Disposición / Cesión';
                ID_CESION.Parametro:='ID_CESION';
      ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);
                ID_DOCUMENTO.Caption:='Documento';
                ID_DOCUMENTO.Parametro:='ID_DOCUMENTO';
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
         With SITUACION do
          begin Size:= 2;
                UseCombo:=True;
                ComboLista.Add('0');   ComboDatos.Add(CSIT_NA);
                ComboLista.Add('1');   ComboDatos.Add(CSIT_AC);
                ComboLista.Add('2');   ComboDatos.Add(CSIT_CA);
                ComboLista.Add('3');   ComboDatos.Add(CSIT_TO);
          end;
                SITUACION.Caption:='Situación';
                SITUACION.Parametro:='SITUACION';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCanDoc.Hlp';
      ShowMenuReporte:=True;

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource:=Self;
      Cesion.FieldByName('ID_CESION').MasterField:='ID_CESION';

      Docto:= TCrDocto.Create(Self);
      Docto.MasterSource:=Self;
      Docto.FieldByName('ID_DOCUMENTO').MasterField:='ID_DOCUMENTO';
end;

Destructor TCrcandoc.Destroy;
begin
   if Cesion <> nil then
      Cesion.free;
   //end if
   inherited;
end;


function TCrcandoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcandoc;
begin
   W:=TWCrcandoc.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrcandoc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcando.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CRCANDOC********************)
(*                                                                              *)
(*  FORMA DE CRCANDOC                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCANDOC********************)

Function TWCrcandoc.CadenaSql : String;
var vlsql: String;
Begin
   Objeto.ID_CESION.GetFromControl;
   Objeto.ID_DOCUMENTO.GetFromControl;
   Objeto.SITUACION.GetFromControl;

   vlsql := ' SELECT D.ID_CESION, ' +
            '        D.ID_DOCUMENTO, ' +
            '        D.NUM_PERIODO_DOC, ' +
            '        D.IMP_NOMINAL, ' +
            '        D.TASA_AFORO, ' +
            '        PKGCRPERIODO.OBTENIMPAFORO(D.IMP_NOMINAL,D.TASA_AFORO) AS IMP_AFORO, ' +
            '        D.TASA_DESCUENTO, ' +
            '        D.IMP_COMPRA, ' +
            '        D.SIT_DOCUMENTO, ' +
                     #39 + ' ' + #39 + ' CAN ' +
            ' FROM CR_DOCUMENTO D, CR_CESION CS' +
            ' WHERE D.ID_CESION =  CS.ID_CESION ';
     if cbB_APLI_CESION.Checked then
        vlsql := vlsql + 'AND D.ID_CESION = ' + Objeto.ID_CESION.AsString;

     if cbB_APLI_DOCTO.Checked then
        vlsql := vlsql + 'AND D.ID_DOCUMENTO = ' + #39 + Objeto.ID_DOCUMENTO.AsString + #39;

     if Objeto.SITUACION.AsString = CSIT_NA then
        vlsql := vlsql + ' AND D.SIT_DOCUMENTO = ' + #39 + CSIT_NA + #39
     else if Objeto.SITUACION.AsString = CSIT_AC then
        vlsql := vlsql + ' AND D.SIT_DOCUMENTO = ' + #39 + CSIT_AC + #39
     else if Objeto.SITUACION.AsString = CSIT_CA then
        vlsql := vlsql + ' AND D.SIT_DOCUMENTO = ' + #39 + CSIT_CA + #39;
   CadenaSql := vlsql;
end;

Procedure TWCrcandoc.MuestraDatos;
var vlQry : TQuery;
begin
  vlQry := GetSQLQuery(CadenaSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('NUM_PERIODO_DOC').Visible := False;

            vlQry.FieldByName('ID_CESION').DisplayLabel := 'ID CESION' + #30 +'>C';
            vlQry.FieldByName('ID_DOCUMENTO').DisplayLabel := 'ID DOCUMENTO' + #30 +'>C';
            vlQry.FieldByName('IMP_NOMINAL').DisplayLabel := 'IMP. NOMINAL' + #30 +'>C';
            vlQry.FieldByName('TASA_AFORO').DisplayLabel := 'TASA AFORO' + #30 +'>C';
            vlQry.FieldByName('IMP_AFORO').DisplayLabel := 'IMP_AFORO' + #30 +'>C';
            vlQry.FieldByName('TASA_DESCUENTO').DisplayLabel := 'TASA_DESCUENTO' + #30 +'>C';
            vlQry.FieldByName('IMP_COMPRA').DisplayLabel := 'IMP_COMPRA' + #30 +'>C';
            vlQry.FieldByName('SIT_DOCUMENTO').DisplayLabel := 'SIT' + #30 +'>C';
            vlQry.FieldByName('CAN').DisplayLabel := 'CAN' + #30 +'>C';

            vlQry.FieldByName('ID_CESION').DisplayWidth := 8;
            vlQry.FieldByName('ID_DOCUMENTO').DisplayWidth := 25;
            vlQry.FieldByName('IMP_NOMINAL').DisplayWidth := 12;
            vlQry.FieldByName('TASA_AFORO').DisplayWidth := 12;
            vlQry.FieldByName('IMP_AFORO').DisplayWidth := 12;
            vlQry.FieldByName('TASA_DESCUENTO').DisplayWidth := 12;
            vlQry.FieldByName('IMP_COMPRA').DisplayWidth := 12;
            vlQry.FieldByName('SIT_DOCUMENTO').DisplayWidth := 3;
            vlQry.FieldByName('CAN').DisplayWidth := 3;

            sgcDATOS.SG.Canvas.Font.Size := 5;

            TNumericField(vlQry.FieldByName('IMP_NOMINAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('TASA_AFORO')).DisplayFormat := '###,##0.0000';
            TNumericField(vlQry.FieldByName('IMP_AFORO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('TASA_DESCUENTO')).DisplayFormat := '###,##0.0000';
            TNumericField(vlQry.FieldByName('IMP_COMPRA')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('CAN').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
        end
        else

           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');

        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCrcandoc.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.ID_CESION.Control := edID_CESION;
     Objeto.Cesion.ID_CESION.Control := edID_CESION;
     Objeto.Cesion.Emisor.Acreditado.Persona.Nombre.Control := edTITULAR;
     Objeto.Cesion.GetParams(Objeto);

     Objeto.ID_DOCUMENTO.Control := edID_DOCUMENTO;
     Objeto.Docto.ID_DOCUMENTO.Control := edID_DOCUMENTO;
     Objeto.Docto.Docto.TipoDocto.DESC_DOCUMENTO.Control := edDESC_DOCUMENTO;
     Objeto.Docto.GetParams(Objeto);

     Objeto.SITUACION.Control := rgSITUACION;

end;

procedure TWCrcandoc.FormDestroy(Sender: TObject);
begin
     Objeto.ID_CESION.Control := nil;
     Objeto.Cesion.ID_CESION.Control := nil;
     Objeto.Cesion.Emisor.Acreditado.Persona.Nombre.Control := nil;

     Objeto.ID_DOCUMENTO.Control := nil;
     Objeto.Docto.ID_DOCUMENTO.Control := nil;
     Objeto.Docto.Docto.TipoDocto.DESC_DOCUMENTO.Control := nil;

     Objeto.SITUACION.Control := nil;
end;

procedure TWCrcandoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcandoc.InterForma1DespuesShow(Sender: TObject);
begin
   if Objeto.ID_CESION.AsString <> '' then
   Begin
      cbB_APLI_CESION.Checked := True;
      cbB_APLI_CESION.Enabled := True;
      Objeto.Cesion.FindKey([Objeto.ID_CESION.AsString]);
   end;
   rgSITUACION.ItemIndex := 0;
   MuestraDatos;
end;

procedure TWCrcandoc.sgcDATOSDblClick(Sender: TObject);
var Y       : integer;
    vlDocto : String;
   procedure MarcaRegistro;
   Begin
     if sgcDATOS.CellStr['CAN',Y] = 'SI' + #30 + '>C' then
        sgcDATOS.CellStr['CAN',Y]:= ''
     else
        sgcDATOS.CellStr['CAN',Y]:= 'SI' + #30 + '>C';
  //end if
   end;
begin
  Y := sgcDATOS.SG.Row;
  if sgcDATOS.SG.Selection.Left = coPosSel then
  Begin
     if (sgcDATOS.CellStr['SIT_DOCUMENTO',Y] <> CSIT_CA) then
        MarcaRegistro;
  end
  else
  Begin
//     Objeto.Docto.FindKey([sgcDATOS.CellStr['ID_CESION',Y],sgcDATOS.CellStr['ID_DOCUMENTO',Y]]);
     Objeto.ID_CESION.AsString := sgcDATOS.CellStr['ID_CESION',Y];
     Objeto.ID_DOCUMENTO.AsString :=sgcDATOS.CellStr['ID_DOCUMENTO',Y];
     Objeto.Docto.Cesion.CreCto.FindKey([Objeto.Docto.credito.ContratoCre.ID_CONTRATO.AsString,'1']);
     InterForma1.BtnSalirClick(self);
  end;

  //end if
end;

procedure TWCrcandoc.btCESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANDOC_DISPO',True,True) then
   begin
     Objeto.Cesion.ShowAll := True;
     if Objeto.Cesion.Busca then
     Begin
        cbB_APLI_CESION.Checked := True;
        cbB_APLI_CESION.Enabled := True;
        MuestraDatos;
        InterForma1.NextTab(edID_CESION);
     end;
   end;
end;

procedure TWCrcandoc.ilCESIONEjecuta(Sender: TObject);
begin
   if Objeto.Cesion.FindKey([ilCESION.Buffer]) then
   Begin
      cbB_APLI_CESION.Checked := True;
      cbB_APLI_CESION.Enabled := True;
      MuestraDatos;
      InterForma1.NextTab(edID_CESION);
   end;
end;

procedure TWCrcandoc.btDOCUMENTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANDOC_DOCTO',True,True) then
   begin
     Objeto.Docto.ShowAll := True;
     if Objeto.Docto.Busca then
     Begin
        cbB_APLI_DOCTO.Checked := True;
        cbB_APLI_DOCTO.Enabled := True;
        MuestraDatos;
        InterForma1.NextTab(edID_DOCUMENTO);
     end;
   end;
end;

procedure TWCrcandoc.ilDOCTOEjecuta(Sender: TObject);
begin
   if Objeto.Docto.FindKey([ilDOCTO.Buffer]) then
   Begin
      cbB_APLI_DOCTO.Checked := True;
      cbB_APLI_DOCTO.Enabled := True;
      MuestraDatos;
      InterForma1.NextTab(edID_DOCUMENTO);
   end;
end;

procedure TWCrcandoc.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrcandoc.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANDOC_BUSCA',True,True) then
      MuestraDatos;
end;

procedure TWCrcandoc.cbB_APLI_CESIONClick(Sender: TObject);
begin
   if not cbB_APLI_CESION.Checked then
   Begin
      Objeto.Cesion.Active := False;
      cbB_APLI_CESION.Checked := False;
      cbB_APLI_CESION.Enabled := False;
      MuestraDatos;
   end;
end;

procedure TWCrcandoc.cbB_APLI_DOCTOClick(Sender: TObject);
begin
   if not cbB_APLI_DOCTO.Checked then
   Begin
      Objeto.Docto.Active := False;
      cbB_APLI_DOCTO.Checked := False;
      cbB_APLI_DOCTO.Enabled := False;
      MuestraDatos;
   end;
end;

procedure TWCrcandoc.btCANCELAClick(Sender: TObject);
var vlIdCesion : String;
    vlIdDocto  : String;
    vlnumPer   : String;
    nRow, i    : Integer;
    countAut   : Integer;
    vlImpAfor  : Double;
begin
   if Objeto.ValidaAccesoEsp('TCRCANDOC_CANC',True,True) then
   begin
     nRow := 0;
     countAut:= 0;
     if CountSelec(sgcDatos,'CAN') > 0 then
     Begin
       if MessageDlg('¿Está seguro de cancelar ' +IntToStr(CountSelec(sgcDatos,'CAN')) + ' documento (s)',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
          For i := 0 To sgcDATOS.SG.RowCount - 1 Do
          Begin
             if (sgcDATOS.CellStr['CAN',nRow] = 'SI' + #30 + '>C') then
             Begin
                vlIdCesion := (sgcDATOS.CellStr['ID_CESION',nRow]);
                vlIdDocto  := (sgcDATOS.CellStr['ID_DOCUMENTO',nRow]);
                vlnumPer   := (sgcDATOS.CellStr['NUM_PERIODO_DOC',nRow]);
                vlImpAfor  := CurrFromFrmFloat(sgcDATOS.CellStr['IMP_AFORO',nRow]);
                if Objeto.Docto.STPCANCELADOCTO( StrToInt(vlIdCesion), vlIdDocto,
                                                 StrToInt(vlnumPer), vlImpAfor ) then
                   countAut := countAut + 1;
             end;
             nRow := nRow + 1;
          end;
          ShowMessage('Se canceló ' + IntToStr(CountAut) + ' documento (s).');
          MuestraDatos;
       end;
     end
     else
        ShowMessage('No hay registros seleccionados para cancelar');
   end;
end;

end.
