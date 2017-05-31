// Sistema         : Clase de CR_CAL_AR_DETALL
// Fecha de Inicio : 23/06/2005
// Función forma   : Clase de CR_CAL_AR_DETALL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCaArDe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, InterApl,

IntGenCre,
IntSICC,
IntParamCre,
IntCrCalific,  // Catálogo de Calificadoras
IntCrTRiesgo,  // Catálogo Tipo de Riesgo
IntCrReCaAc,   // Relación Calificadora - Acreditado
IntGrFind
;

const
 CO_COL_CVE_ENTIDAD          = 0;
 CO_COL_DESC_TIPO_ENTIDAD    = 1;
 CO_COL_NOM_ACRED_CALIF      = 2;
 CO_COL_TX_CALIFICACION      = 3;
 CO_COL_CVE_CALIFICACION     = 4;
 CO_COL_ID_ACREDITADO        = 5;
 CO_COL_NOM_ACREDITADO       = 6;


 CO_COL2_ID_ACREDITADO       = 0;
 CO_COL2_NOM_ACREDITADO      = 1;

 Type
 TCrCaArDe= class; 

  TWCrCalArDetall=Class(TForm)
    InterForma1             : TInterForma;
    edNOM_ARCHIVO: TEdit;
    btID_CALIFICADORA1: TBitBtn;
    lbFH_CALIFICACION_CARGA: TLabel;
    edFH_CALIFICACION: TEdit;
    dtpFH_CALIFICACION_CARGA: TInterDateTimePicker;
    lbID_CALIFICADORA1: TLabel;
    edID_CALIFICADORA: TEdit;
    edNOM_CALIFICADORA: TEdit;
    edDESC_TIPO_RIESGO: TEdit;
    edCVE_TIPO_RIESGO: TEdit;
    lbCVE_TIPO_RIESGO1: TLabel;
    btnCancela: TBitBtn;
    rgSIT_CAL_AR_CABE: TRadioGroup;
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
    lbDESC_TIPO_ENTIDAD: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    btnMuestraAcredCalif: TButton;
    pnlCancelado: TPanel;
    Label6: TLabel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label7: TLabel;
    lblAcredFaltantes: TLabel;
    StrGrdListadoCalif: TStringGrid;
    strGrdAcredFaltantes: TStringGrid;
    rgBuscador: TRadioGroup;
    btnRelAcredCalif: TButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btID_CALIFICADORA1Click(Sender: TObject);
    procedure btnMuestraAcredCalifClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure StrGrdListadoCalifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRelAcredCalifClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCaArDe;
    procedure MuestraDatos;
    procedure MuestraAcreditadosFaltantes;
    procedure ActDisplayCancela;
    function StpCancelaArchivoCal( peID_CAL_AR_CABEC     : Integer;
                                   peB_COMMIT            : String;
                                   var psRESULTADO       : Integer;
                                   var psTX_RESULTADO    : String;
                                   pebMuestraError       : Boolean
                                 ) : Boolean;
    function BusquedaRegistro( pestrSearch : String; peStrGridForSearch : TStringGrid;
                               penColStartSearch, penRowStartSearch : Integer ) : Boolean;

end;
 TCrCaArDe= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre  : TParamCre;
        vgNOM_ARCHIVO            : String;
        ID_CAL_AR_CABEC          : TInterCampo;
        NOM_ARCHIVO              : TInterCampo;
        FH_CALIFICACION          : TInterCampo;
        SIT_CAL_AR_CABE          : TInterCampo;

        Calificadora  : TCrCalific;  // Calificadora
        TipoRiesgo    : TCrTRiesgo;  // Tipo de Riesgo

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;

procedure MuestraDetalleArchivo(peNOM_ARCHIVO : String; peParamCre : TParamCre; peApli : TInterApli);

implementation

{$R *.DFM}

procedure MuestraDetalleArchivo(peNOM_ARCHIVO : String; peParamCre : TParamCre; peApli : TInterApli);
var CrCaArDe : TCrCaArDe;
begin
  CrCaArDe := TCrCaArDe.Create(Nil);
  If Assigned(CrCaArDe) Then
    Try
       CrCaArDe.vgNOM_ARCHIVO := peNOM_ARCHIVO;
       CrCaArDe.Apli := peApli;
       CrCaArDe.ParamCre := peParamCre;
       CrCaArDe.Catalogo;
    Finally
       CrCaArDe.Free;
    End;
end;

constructor TCrCaArDe.Create( AOwner : TComponent ); 
begin Inherited;
      vgNOM_ARCHIVO := '';
      ID_CAL_AR_CABEC  := CreaCampo('ID_CAL_AR_CABEC',ftInteger,tsNinguno,tsNinguno,False);
      NOM_ARCHIVO      := CreaCampo('NOM_ARCHIVO',ftString,tsNinguno,tsNinguno,False);
      FH_CALIFICACION  := CreaCampo('FH_CALIFICACION',ftDateTime,tsNinguno,tsNinguno,False);
      SIT_CAL_AR_CABE  := CreaCampo('SIT_CAL_AR_CABE',ftString,tsNinguno,tsNinguno,False);

      With SIT_CAL_AR_CABE do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Calificadora := TCrCalific.Create(Self);
      Calificadora.MasterSource:=Self;

      TipoRiesgo := TCrTRiesgo.Create(Self);
      TipoRiesgo.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntCrCaArDe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCaArDe.Destroy;
begin inherited;
end;

function TCrCaArDe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalArDetall;
    vlQry : TQuery;
    vlstrSQL : String;
begin
   W:=TWCrCalArDetall.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      If (Trim(vgNOM_ARCHIVO) <> '') Then
        Begin
        vlstrSQL := ' SELECT ID_CAL_AR_CABEC, ID_CALIFICADORA, CVE_TIPO_RIESGO, NOM_ARCHIVO, FH_CALIFICACION, SIT_CAL_AR_CABE '+coCRLF+
                    ' FROM CR_CAL_AR_CABEC WHERE NOM_ARCHIVO = '+SQLStr(ReplaceStr(vgNOM_ARCHIVO,#39,#39#39))+'  AND SIT_CAL_AR_CABE = '+SQLStr(CSIT_AC);
        vlQry := GetSQlQuery(vlstrSQL, DataBaseName, SessionName, True);
        If Assigned(vlQry) Then
          Try
            ID_CAL_AR_CABEC.AsInteger  := vlQry.FieldByName('ID_CAL_AR_CABEC').AsInteger;
            NOM_ARCHIVO.AsString       := vlQry.FieldByName('NOM_ARCHIVO').AsString;
            FH_CALIFICACION.AsDateTime := vlQry.FieldByName('FH_CALIFICACION').AsDateTime;
            SIT_CAL_AR_CABE.AsString   := vlQry.FieldByName('SIT_CAL_AR_CABE').AsString;
            Calificadora.FindKey([vlQry.FieldByName('ID_CALIFICADORA').AsString]);
            TipoRiesgo.FindKey([vlQry.FieldByName('CVE_TIPO_RIESGO').AsString]);
          Finally
           vlQry.Free;
          End;
        End;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrCaArDe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaAD.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CAL_AR_DETALL********************)
(*                                                                              *)
(*  FORMA DE CR_CAL_AR_DETALL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAL_AR_DETALL********************)

procedure TWCrCalArDetall.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   NOM_ARCHIVO.Control      := edNOM_ARCHIVO;
   FH_CALIFICACION.Control  := edFH_CALIFICACION;
   SIT_CAL_AR_CABE.Control  := rgSIT_CAL_AR_CABE;

   Calificadora.ID_CALIFICADORA.Control  := edID_CALIFICADORA;
   Calificadora.Persona.Nombre.Control   := edNOM_CALIFICADORA;

   TipoRiesgo.CVE_TIPO_RIESGO.Control    := edCVE_TIPO_RIESGO;
   TipoRiesgo.DESC_TIPO_RIESGO.Control   := edDESC_TIPO_RIESGO;

   If (Trim(vgNOM_ARCHIVO) <> '') Then
    MuestraDatos;
   End;
end;

procedure TWCrCalArDetall.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   NOM_ARCHIVO.Control      := Nil;
   FH_CALIFICACION.Control  := Nil;
   SIT_CAL_AR_CABE.Control  := Nil;

   Calificadora.ID_CALIFICADORA.Control  := Nil;
   Calificadora.Persona.Nombre.Control   := Nil;

   TipoRiesgo.CVE_TIPO_RIESGO.Control    := Nil;
   TipoRiesgo.DESC_TIPO_RIESGO.Control   := Nil;
   End;
end;

procedure TWCrCalArDetall.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TWCrCalArDetall.StpCancelaArchivoCal( peID_CAL_AR_CABEC     : Integer;
                                               peB_COMMIT            : String;
                                               var psRESULTADO       : Integer;
                                               var psTX_RESULTADO    : String;
                                               pebMuestraError       : Boolean
                                             ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_CANCELA_ARCHIVO_CAL';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_CAL_AR_CABEC' ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_CAL_AR_CABEC').AsInteger         := peID_CAL_AR_CABEC;
       ParamByName('peCVE_USU_MODIFICA').AsString         := Objeto.Apli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime             := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString                 := peB_COMMIT;
       ExecProc;

       psRESULTADO       := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO    := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrCalArDetall.BusquedaRegistro( pestrSearch : String; peStrGridForSearch : TStringGrid;
                                           penColStartSearch, penRowStartSearch : Integer ) : Boolean;

    function BuscaRegistro( pestrSearch : String; peStrGridForSearch : TStringGrid;
                            penColStartSearch, penRowStartSearch : Integer ) : Boolean;
    var vlnCol, vlnRow : Integer;
        vlstrFind : String;
        GridRect : TGridRect;
    begin
         Result := False;
         vlstrFind := '';
          // Obtiene palabra a buscar
          vlstrFind := UpperCaseAcentos(pestrSearch);
          // Busca la palabra en la columna correspondiente
          For vlnCol := penColStartSearch To peStrGridForSearch.ColCount - 1 Do
           For vlnRow := penRowStartSearch To peStrGridForSearch.RowCount - 1 Do
           Begin
           If ( Pos(vlstrFind, UpperCaseAcentos(peStrGridForSearch.Cells[vlnCol, vlnRow])) > 0) Then
             Begin
             peStrGridForSearch.Row := vlnRow;
             GridRect.Top    := vlnRow;
             GridRect.Bottom := vlnRow;
             peStrGridForSearch.Selection := GridRect;
             If peStrGridForSearch.CanFocus Then peStrGridForSearch.SetFocus;
             Result := True;
             Break;
             End;
           End;
    end;

begin
  If Not BuscaRegistro(pestrSearch, peStrGridForSearch, penColStartSearch, penRowStartSearch) Then
    If Not BuscaRegistro(pestrSearch, peStrGridForSearch, 0, 0) Then
      MessageDlg('No se encontró el elemento buscado.', mtWarning, [mbOk], 0);
end;

procedure TWCrCalArDetall.MuestraDatos;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow, vlnTopicRow, vlnTopicTopRow : Integer;
begin
 vlnTopicRow    := StrGrdListadoCalif.Row;
 vlnTopicTopRow := StrGrdListadoCalif.TopRow;
 btnRelAcredCalif.Enabled := True;
 btnMuestraAcredCalif.Enabled := btnRelAcredCalif.Enabled;
 ClearGrid(StrGrdListadoCalif, 0);
 If (Objeto.ID_CAL_AR_CABEC.AsInteger = 0) Then
  Exit;
 vlstrSQL := ' SELECT CCAD.*,'+coCRLF+
             '        CRCA.*,'+coCRLF+
             '        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_ACREDITADO, 2),1,255) AS NOM_ACREDITADO'+coCRLF+
             ' FROM'+coCRLF+
             '       ( SELECT CRCA.ID_CALIFICADORA,'+coCRLF+
             '                CRCA.ID_ACREDITADO,'+coCRLF+
             '                CRCA.CVE_ENTIDAD,'+coCRLF+
             '                CRCA.NOM_ACRED_CALIF'+coCRLF+
             '         FROM CR_REL_CAL_ACRE CRCA,'+coCRLF+
             '              CR_CAL_AR_CABEC CCAC'+coCRLF+
             '         WHERE CCAC.ID_CAL_AR_CABEC = '+Objeto.ID_CAL_AR_CABEC.AsString+coCRLF+
             '           AND CRCA.ID_CALIFICADORA = CCAC.ID_CALIFICADORA'+coCRLF+
             '           AND CRCA.SIT_REL_CAL_ACRE <> '+SQLStr(CSIT_CA)+coCRLF+
             '       ) CRCA,'+coCRLF+
             '       ( SELECT CCAD.ID_CAL_AR_CABEC,'+coCRLF+
             '                CCTE.CVE_ENTIDAD,'+coCRLF+
             '                CCAD.DESC_TIPO_ENTIDAD,'+coCRLF+
             '                CCAD.NOM_ACRED_CALIF,'+coCRLF+
             '                CCAD.CVE_CALIFICACION,'+coCRLF+
             '                CCAD.TX_CALIFICACION'+coCRLF+
             '         FROM CR_CAL_AR_DETALL CCAD,'+coCRLF+
             '              CR_CAL_TIPO_ENT CCTE'+coCRLF+
             '         WHERE CCAD.ID_CAL_AR_CABEC = '+Objeto.ID_CAL_AR_CABEC.AsString+coCRLF+
             '           AND CCAD.DESC_TIPO_ENTIDAD = CCTE.DESC_ENTIDAD'+coCRLF+
             '        ) CCAD'+coCRLF+
             ' WHERE CRCA.CVE_ENTIDAD (+)= CCAD.CVE_ENTIDAD'+coCRLF+
             '   AND CRCA.NOM_ACRED_CALIF (+)= CCAD.NOM_ACRED_CALIF'+coCRLF+
             ' ORDER BY CCAD.DESC_TIPO_ENTIDAD DESC, CCAD.NOM_ACRED_CALIF ASC'+coCRLF
             ;
  vlQry := GetSQlQuery(vlStrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  If Assigned(vlQry) Then
   With vlQry Do
    Try
      Last; If (RecordCount < 2) Then StrGrdListadoCalif.RowCount :=  1 Else StrGrdListadoCalif.RowCount := RecordCount;
      First; vlnRow := 0;
      While Not Eof Do
       Begin
       StrGrdListadoCalif.Cells[CO_COL_CVE_ENTIDAD      , vlnRow] := FieldByName('CVE_ENTIDAD').DisplayText;
       StrGrdListadoCalif.Cells[CO_COL_DESC_TIPO_ENTIDAD, vlnRow] := FieldByName('DESC_TIPO_ENTIDAD').DisplayText;
       StrGrdListadoCalif.Cells[CO_COL_NOM_ACRED_CALIF  , vlnRow] := FieldByName('NOM_ACRED_CALIF').DisplayText;
       StrGrdListadoCalif.Cells[CO_COL_TX_CALIFICACION  , vlnRow] := FieldByName('TX_CALIFICACION').DisplayText;
       StrGrdListadoCalif.Cells[CO_COL_CVE_CALIFICACION , vlnRow] := FieldByName('CVE_CALIFICACION').DisplayText;
       StrGrdListadoCalif.Cells[CO_COL_ID_ACREDITADO    , vlnRow] := FieldByName('ID_ACREDITADO').DisplayText;
       StrGrdListadoCalif.Cells[CO_COL_NOM_ACREDITADO   , vlnRow] := FieldByName('NOM_ACREDITADO').DisplayText;
       Inc(vlnRow);
       Next;
       End;
     btnRelAcredCalif.Enabled := (vlnRow > 0) And (Objeto.SIT_CAL_AR_CABE.AsString <> CSIT_CA);
     btnCancela.Enabled := btnRelAcredCalif.Enabled;
     ActDisplayCancela;
     If btnRelAcredCalif.Enabled Then
      If StrGrdListadoCalif.CanFocus Then StrGrdListadoCalif.SetFocus;
    Finally
     If (vlnTopicRow < StrGrdListadoCalif.RowCount - 1) Then
      StrGrdListadoCalif.Row := vlnTopicRow;
     If (vlnTopicTopRow < StrGrdListadoCalif.RowCount - 1) Then
      StrGrdListadoCalif.TopRow := vlnTopicTopRow;
     Close;
     vlQry.Free;
    End;
    MuestraAcreditadosFaltantes;
    btnMuestraAcredCalif.Enabled := btnRelAcredCalif.Enabled;
end;

procedure TWCrCalArDetall.MuestraAcreditadosFaltantes;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow, vlnTopicRow, vlnTopicTopRow : Integer;
begin
 lblAcredFaltantes.Caption := 'Acreditados Faltantes de Relacionar con la Calificadora "'+
                              Objeto.Calificadora.Persona.Nombre.AsString+'"';
 vlnTopicRow    := strGrdAcredFaltantes.Row;
 vlnTopicTopRow := strGrdAcredFaltantes.TopRow;
 btnRelAcredCalif.Enabled := True;
 ClearGrid(strGrdAcredFaltantes, 0);
 vlstrSQL :=  ' SELECT ACRED_SIN_RELAC.ID_ACREDITADO,'+coCRLF+
              '        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ACRED_SIN_RELAC.ID_ACREDITADO),1,255) AS NOM_ACREDITADO'+coCRLF+
              ' FROM  (-- Acreditados de Gobiernos y Municipios Vigentes'+coCRLF+
              '        SELECT CA.ID_ACREDITADO'+coCRLF+
              '        FROM CONTRATO CTO,'+coCRLF+
              '             CR_CREDITO CC,'+coCRLF+
              '             ( SELECT ID_CREDITO FROM CR_HISTO_CRED'+coCRLF+
              '               WHERE F_CIERRE = '+SQLFecha(Objeto.Apli.DameFechaEmpresa)+' - 1'+coCRLF+
              '             ) CHC,'+coCRLF+
              '             ( SELECT CA.ID_ACREDITADO'+coCRLF+
              '                FROM CR_ACREDITADO CA,'+coCRLF+
              '                     PERSONA P'+coCRLF+
              '                WHERE P.ID_PERSONA = CA.ID_ACREDITADO'+coCRLF+
              '                  AND P.CVE_TIPO_SECTOR = ''13'' -- Sector de Gobiernos y Municipios'+coCRLF+
              '              ) CA'+coCRLF+
              '        WHERE CTO.ID_TITULAR = CA.ID_ACREDITADO'+coCRLF+
              '          AND CC.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
              '          AND CHC.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '        GROUP BY CA.ID_ACREDITADO'+coCRLF+
              '     MINUS'+coCRLF+
              '        -- Acreditados que se encuentran ya vinculados'+coCRLF+
              '        SELECT ID_ACREDITADO'+coCRLF+
              '        FROM CR_REL_CAL_ACRE'+coCRLF+
              '        WHERE ID_CALIFICADORA = '+Objeto.Calificadora.ID_CALIFICADORA.AsString+coCRLF+
              '          AND CVE_ENTIDAD IN (SELECT CVE_ENTIDAD FROM CR_CAL_TIPO_ENT'+coCRLF+
              '                              WHERE DESC_ENTIDAD  IN ( SELECT DESC_TIPO_ENTIDAD'+coCRLF+
              '                                                       FROM CR_CAL_AR_DETALL'+coCRLF+
              '                                                       WHERE ID_CAL_AR_CABEC = '+Objeto.ID_CAL_AR_CABEC.AsString+coCRLF+
              '                                                       GROUP BY DESC_TIPO_ENTIDAD'+coCRLF+
              '                                                    )'+coCRLF+
              '                           )'+coCRLF+
              '          AND SIT_REL_CAL_ACRE <> ''CA'' -- Que no se encuentre Cancelado'+coCRLF+
              '       ) ACRED_SIN_RELAC'+coCRLF+
              ' ORDER BY NOM_ACREDITADO'+coCRLF
              ;
  vlQry := GetSQlQuery(vlStrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  If Assigned(vlQry) Then
    With vlQry Do
     Try
      Last; If (RecordCount < 2) Then strGrdAcredFaltantes.RowCount :=  1 Else strGrdAcredFaltantes.RowCount := RecordCount;
      First; vlnRow := 0;
      While Not Eof Do
       Begin
       strGrdAcredFaltantes.Cells[CO_COL2_ID_ACREDITADO   , vlnRow] := FieldByName('ID_ACREDITADO').DisplayText;
       strGrdAcredFaltantes.Cells[CO_COL2_NOM_ACREDITADO  , vlnRow] := FieldByName('NOM_ACREDITADO').DisplayText;
       Inc(vlnRow);
       Next;
       End;
     Finally
      If (vlnTopicRow < strGrdAcredFaltantes.RowCount - 1) Then
       strGrdAcredFaltantes.Row := vlnTopicRow;
      If (vlnTopicTopRow < strGrdAcredFaltantes.RowCount - 1) Then
       strGrdAcredFaltantes.TopRow := vlnTopicTopRow;
      Close;
      vlQry.Free;
     End;
end;

procedure TWCrCalArDetall.ActDisplayCancela;
begin
 If (Objeto.SIT_CAL_AR_CABE.AsString = CSIT_AC) Then
  Begin
  pnlCancelado.Font.Color := clBlack;
  pnlCancelado.Color := clBtnFace;
  pnlCancelado.Enabled := False;
  End
 Else
  Begin
  pnlCancelado.Font.Color := clWhite;
  pnlCancelado.Color := clRed;
  pnlCancelado.Enabled := True;
  End;
end;

procedure TWCrCalArDetall.btID_CALIFICADORA1Click(Sender: TObject);
var T : TInterFindit;
begin
      // Buscador por Nombre de Archivo
      If (rgBuscador.ItemIndex = 0) Then T := Objeto.CreaBuscador('ICaArDC.it','F,F,F')
      // Buscador por Archivo e Identidad
      Else T := Objeto.CreaBuscador('ICaArDe.it','F,F,F');
      If Assigned(T) Then
        If T.Execute Then
         Try
          Objeto.ID_CAL_AR_CABEC.AsInteger  := StrToInt(T.DameCampo(0));
          Objeto.NOM_ARCHIVO.AsString       := T.DameCampo(3);
          Objeto.FH_CALIFICACION.AsString   := T.DameCampo(4);
          Objeto.SIT_CAL_AR_CABE.AsString   := T.DameCampo(5);
          Objeto.Calificadora.FindKey([T.DameCampo(1)]);
          Objeto.TipoRiesgo.FindKey([T.DameCampo(2)]);
          MuestraDatos;
         Finally
           T.Free;
         End;
end;

procedure TWCrCalArDetall.btnMuestraAcredCalifClick(Sender: TObject);
var CrReCaAc : TCrReCaAc;
    vlnRow : Integer;
    vlCVE_ENTIDAD, vlNOM_ACRED_CALIF, vlID_ACREDITADO : String;
begin
 CrReCaAc := TCrReCaAc.Create(Nil);
 If Assigned(CrReCaAc) Then
  With CrReCaAc Do
   Try
      CrReCaAc.Apli := Objeto.Apli;
      CrReCaAc.ParamCre := Objeto.ParamCre;
      vlnRow := StrGrdListadoCalif.Row;
      vlID_ACREDITADO   := StrGrdListadoCalif.Cells[CO_COL_ID_ACREDITADO    , vlnRow];
      vlCVE_ENTIDAD     := StrGrdListadoCalif.Cells[CO_COL_CVE_ENTIDAD      , vlnRow];
      vlNOM_ACRED_CALIF := StrGrdListadoCalif.Cells[CO_COL_NOM_ACRED_CALIF  , vlnRow];
      If (Trim(vlID_ACREDITADO) <> '') Then
        CrReCaAc.FindKey([vlID_ACREDITADO, Objeto.Calificadora.ID_CALIFICADORA.AsString]);
      CrReCaAc.Catalogo;
   Finally
      CrReCaAc.Free;
      MuestraDatos;
   End;
end;

procedure TWCrCalArDetall.btnRelAcredCalifClick(Sender: TObject);
var CrReCaAc : TCrReCaAc;
    vlnRow : Integer;
    vlCVE_ENTIDAD, vlNOM_ACRED_CALIF, vlID_ACREDITADO : String;
begin
 CrReCaAc := TCrReCaAc.Create(Nil);
 If Assigned(CrReCaAc) Then
  With CrReCaAc Do
   Try
      CrReCaAc.Apli := Objeto.Apli;
      CrReCaAc.ParamCre := Objeto.ParamCre;
      vlnRow := StrGrdListadoCalif.Row;
      vlID_ACREDITADO   := StrGrdListadoCalif.Cells[CO_COL_ID_ACREDITADO    , vlnRow];
      vlCVE_ENTIDAD     := StrGrdListadoCalif.Cells[CO_COL_CVE_ENTIDAD      , vlnRow];
      vlNOM_ACRED_CALIF := StrGrdListadoCalif.Cells[CO_COL_NOM_ACRED_CALIF  , vlnRow];
      vlID_ACREDITADO   := strGrdAcredFaltantes.Cells[CO_COL2_ID_ACREDITADO, strGrdAcredFaltantes.Row];
      If IsInteger(vlID_ACREDITADO) Then
        CrReCaAc.vgID_ACREDITADO := StrToInt(vlID_ACREDITADO);
      CrReCaAc.vgID_CALIFICADORA := Objeto.Calificadora.ID_CALIFICADORA.AsInteger;
      CrReCaAc.vgCVE_ENTIDAD     := vlCVE_ENTIDAD;
      CrReCaAc.vgNOM_ACRED_CALIF := vlNOM_ACRED_CALIF;
      CrReCaAc.Nuevo;
   Finally
      CrReCaAc.Free;
      MuestraDatos;
   End;
end;

procedure TWCrCalArDetall.btnCancelaClick(Sender: TObject);
var vlRESULTADO : Integer;
    vlTX_RESULTADO : String;
begin
  If (Objeto.ID_CAL_AR_CABEC.AsInteger = 0) Then
   Exit;

  If (MessageDlg('¿Desea cancelar las calificaciones cargados en el archivo "'+edNOM_ARCHIVO.Text+'"?',
                 mtConfirmation, [mbYes, mbNo] ,0) = mrYes) Then
     Begin
     If StpCancelaArchivoCal(Objeto.ID_CAL_AR_CABEC.AsInteger,
                             CVERDAD,
                             vlRESULTADO,
                             vlTX_RESULTADO,
                             False
                             ) Then
       Begin
       MessageDlg('Archivo Cancelado', mtInformation, [mbOk], 0);
       Objeto.SIT_CAL_AR_CABE.AsString := CSIT_CA;
       MuestraDatos;
       End
     Else
       MessageDlg(vlTX_RESULTADO, mtError, [mbOk], 0);
     End;                       
end;

procedure TWCrCalArDetall.StrGrdListadoCalifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vlstrBuscar : String;
begin
 If Key = VK_RETURN Then btnMuestraAcredCalifClick(btnMuestraAcredCalif)
 Else If (Key = 114) Or // F3
        ((ssCtrl In Shift) And (Key = 70)) Or // Ctrl + F
           ((ssCtrl In Shift) And (Key = 66)) // Ctrl + B
            Then
  Begin
  vlstrBuscar := MuestraBusqueda;
  If (Trim(vlstrBuscar) <> '') Then
    BusquedaRegistro(vlstrBuscar, (Sender As TStringGrid), (Sender As TStringGrid).Col + 1, (Sender As TStringGrid).Row + 1);
  End;
end;

end.
