// Sistema         : Clase de CR_MET_PERSONA
// Fecha de Inicio : 25/02/2013
// Función forma   : Clase de CR_MET_PERSONA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrMetPers;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, IntParamCre,
ImgList;

Type
 TCrMetPers= class; 

  TWCrMetPersona=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    lbTABLA_REFEREN: TLabel;
    rdgDATOS_CARGAR: TRadioGroup;
    sagDATOS_TABLA_REFEREN: TStringAlignGrid;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    bbtnSELEC_TODOS: TBitBtn;
    bbtnDESELECT_TODOS: TBitBtn;
    edTABLA_REFEREN: TEdit;
    btTABLA_REFEREN: TBitBtn;
    ImageList: TImageList;
    bbtnREGISTRAR: TBitBtn;
    bbtnSALIR: TBitBtn;
    bbtnACTIVAR: TBitBtn;
    bbtnDESACTIVAR: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    cmbSEL_COLUMNA: TComboBox;
    Label2: TLabel;
    edTEXTO_BUSCAR: TEdit;
    bbtnBUSCAR: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btTABLA_REFERENClick(Sender: TObject);
    procedure rdgDATOS_CARGARClick(Sender: TObject);
    procedure sagDATOS_TABLA_REFERENDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDATOS_TABLA_REFERENMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bbtnSELEC_TODOSClick(Sender: TObject);
    procedure bbtnDESELECT_TODOSClick(Sender: TObject);
    procedure bbtnREGISTRARClick(Sender: TObject);
    procedure bbtnSALIRClick(Sender: TObject);
    procedure bbtnACTIVARClick(Sender: TObject);
    procedure bbtnDESACTIVARClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure bbtnBUSCARClick(Sender: TObject);
    private 
    { Private declarations }
    ConsultaEnPersona, Columna_Descripcion                       : String;
    NoColLlave                                                   : Integer;
    ColLlave, ColLlaveForan, TablaAnterior                       : String;
    cID1, cID2, cID3, cKey1, cKey2, cKey3, cDate1, cDate2, cDate3: String;
    RegDevueltos                                                 : Boolean;
    procedure CargaDatosTablaRf (NombreTabla: String; EsRecarga: Boolean);
    procedure LimpiaGrid (col, row: Integer);
    procedure Obt_ColPK_ColPkForan;
    function  ReconstConsulCargaDatos (NombreTabla: String; Consulta: String; NoColLlave: Integer; ColLlave: String; ColLlaveForan: String) :String;
    function  ObtNoColumna (NombreCampo: String): Integer;
    function  EjecutaProcStpAltaPersona (row: Integer; Situacion: String; TipoSalvado: Integer): Boolean;
    public
    { Public declarations }
    Objeto : TCrMetPers;
end; 
 TCrMetPers= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_PERSONA               : TInterCampo;
        F_VIGENTE_DESDE          : TInterCampo;
        ID_TABLA_REFEREN         : TInterCampo;
        ID1                      : TInterCampo;
        ID2                      : TInterCampo;
        ID3                      : TInterCampo;
        KEY1                     : TInterCampo;
        KEY2                     : TInterCampo;
        KEY3                     : TInterCampo;
        DATE1                    : TInterCampo;
        DATE2                    : TInterCampo;
        DATE3                    : TInterCampo;
        SIT_PERSONA              : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        ParamCre:   TParamCre;
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


constructor TCrMetPers.Create( AOwner : TComponent );
begin Inherited;
      ID_PERSONA               := CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
      ID_PERSONA      .Caption := 'Número de Persona';
      F_VIGENTE_DESDE          := CreaCampo('F_VIGENTE_DESDE',ftDate,tsNinguno,tsNinguno,True);
      F_VIGENTE_DESDE .Caption := 'Fecha Vigente Desde';
      ID_TABLA_REFEREN         := CreaCampo('ID_TABLA_REFEREN',ftFloat,tsNinguno,tsNinguno,True);
      ID_TABLA_REFEREN.Caption :='Número de Tabla Referen';
      ID1                      := CreaCampo('ID1',ftFloat,tsNinguno,tsNinguno,True);
      ID1             .Caption := 'Id1';
      ID2                      := CreaCampo('ID2',ftFloat,tsNinguno,tsNinguno,True);
      ID2             .Caption := 'Id2';
      ID3                      := CreaCampo('ID3',ftFloat,tsNinguno,tsNinguno,True);
      ID3             .Caption := 'Id3';
      KEY1                     := CreaCampo('KEY1',ftString,tsNinguno,tsNinguno,True);
      KEY1            .Caption := 'Key1';
      KEY2                     := CreaCampo('KEY2',ftString,tsNinguno,tsNinguno,True);
      KEY2            .Caption := 'Key2';
      KEY3                     := CreaCampo('KEY3',ftString,tsNinguno,tsNinguno,True);
      KEY3            .Caption := 'Key3';
      DATE1                    := CreaCampo('DATE1',ftDate,tsNinguno,tsNinguno,True);
      DATE1           .Caption := 'Date1';
      DATE2                    := CreaCampo('DATE2',ftDate,tsNinguno,tsNinguno,True);
      DATE2           .Caption := 'Date2';
      DATE3                    := CreaCampo('DATE3',ftDate,tsNinguno,tsNinguno,True);
      DATE3           .Caption := 'Date3';
      SIT_PERSONA              := CreaCampo('SIT_PERSONA',ftString,tsNinguno,tsNinguno,True);
      SIT_PERSONA     .Caption := 'Situación Persona';
      CVE_USU_ALTA             := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA    .Caption := 'Clave de Usu Alta';
      FH_ALTA                  := CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
      FH_ALTA         .Caption := 'Fecha y Hora Alta';
      CVE_USU_MODIFICA         := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption := 'Clave de Usu Modifica';
      FH_MODIFICA              := CreaCampo('FH_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      FH_MODIFICA     .Caption := 'Fecha y Hora Modifica';
      FKeyFields.Add('ID_PERSONA');

      TableName := 'CR_MET_PERSONA'; 
      UseQuery := True; 
      HelpFile := 'IntCrMetPers.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMetPers.Destroy;
begin inherited;
end;


function TCrMetPers.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMetPersona;
begin
   W:=TWCrMetPersona.Create(Self);
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


Function TCrMetPers.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMePe.it','F');
      Try if Active then begin T.Param(0,ID_PERSONA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrMetPers.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MET_PERSONA********************)
(*                                                                              *)
(*  FORMA DE CR_MET_PERSONA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MET_PERSONA********************)

procedure TWCrMetPersona.FormShow(Sender: TObject);
begin
  //Oculta los botones de la Interforma
  Interforma1.BtnNuevo    .Visible := False;
  Interforma1.BtnModificar.Visible := False;
  Interforma1.BtnEliminar .Visible := False;
  Interforma1.BtnAceptar  .Visible := False;
  Interforma1.BtnCancelar .Visible := False;
  Interforma1.BtnBuscar   .Visible := False;
  Interforma1.BtnAyuda    .Visible := False;
  Interforma1.BtnSalir    .Visible := False;

  //Deshabilita los botones de Registrar, Activar y Desactivar
  bbtnREGISTRAR .Enabled := False;
  bbtnACTIVAR   .Enabled := False;
  bbtnDESACTIVAR.Enabled := False;

  //Obtiene los datos de los campos informativos que se muestran en el panel inferior de la pantalla
  lbDEmpresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
  lbDFecha  .Caption := Objeto.ParamCre.FECHA  .AsString;
  lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil .Caption := Objeto.ParamCre.PERFIL .AsString;

  //Pone el focus en el primer campo a capturar
  edTABLA_REFEREN.SetFocus;
end;

procedure TWCrMetPersona.FormDestroy(Sender: TObject);
begin
      {Objeto.ID_PERSONA.Control:=nil;
      Objeto.F_VIGENTE_DESDE.Control:=nil;
      Objeto.ID_TABLA_REFEREN.Control:=nil;
      Objeto.ID1.Control:=nil;
      Objeto.ID2.Control:=nil;
      Objeto.ID3.Control:=nil;
      Objeto.KEY1.Control:=nil;
      Objeto.KEY2.Control:=nil;
      Objeto.KEY3.Control:=nil;
      Objeto.DATE1.Control:=nil;
      Objeto.DATE2.Control:=nil;
      Objeto.DATE3.Control:=nil;
      Objeto.SIT_PERSONA.Control:=nil;}
end;

procedure TWCrMetPersona.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMetPersona.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMetPersona.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrMetPersona.btTABLA_REFERENClick(Sender: TObject);
var
  T: TInterFindIt;
begin
  T := Objeto.CreaBuscador('ICrTabRfPer.it', 'S');
  try
    if T.Execute then
    begin
      Objeto.ID_TABLA_REFEREN.AsString := T.DameCampo(0);
      edTABLA_REFEREN.Text             := T.DameCampo(1);
      NoColLlave                       := StrToInt (T.DameCampo(2));
      ColLlave                         := T.DameCampo(3);
      ColLlaveForan                    := T.DameCampo(4);
      ConsultaEnPersona                := T.DameCampo(5);
      Columna_Descripcion              := T.DameCampo(6);
      InterForma1.NextTab (btTABLA_REFEREN);
    end;
  finally
    T.Free;
  end;

  if (edTABLA_REFEREN.Text <> '') and (rdgDATOS_CARGAR.ItemIndex In [0, 1, 2]) then
    CargaDatosTablaRf (edTABLA_REFEREN.Text, False);

  //Activa los botones correspondientes de acuerdo a la opción seleccionada en los radiobuttons
  if RegDevueltos then
  begin
    if rdgDATOS_CARGAR.ItemIndex = 0 then
    begin
      bbtnDESACTIVAR.Enabled := True;
      bbtnREGISTRAR .Enabled := False;
      bbtnACTIVAR   .Enabled := False;
    end
    else if rdgDATOS_CARGAR.ItemIndex = 1 then
    begin
      bbtnACTIVAR   .Enabled := True;
      bbtnREGISTRAR .Enabled := False;
      bbtnDESACTIVAR.Enabled := False;
    end
    else if rdgDATOS_CARGAR.ItemIndex = 2 then
    begin
      bbtnREGISTRAR .Enabled := True;
      bbtnACTIVAR   .Enabled := False;
      bbtnDESACTIVAR.Enabled := False;
    end;
  end
  else
  begin
    bbtnREGISTRAR .Enabled := False;
    bbtnACTIVAR   .Enabled := False;
    bbtnDESACTIVAR.Enabled := False;
  end;
end;

procedure TWCrMetPersona.CargaDatosTablaRf (NombreTabla: String; EsRecarga: Boolean);
var
  vlQry                      : TQuery;
  NoRegistros, NoCampos, n, i: Integer;
  NombresCampos              : TStrings;
  ConsultaCargaDatos         : String;
begin
  RegDevueltos := False;

  //Limpia el grid y/o los campos correspondientes a la búsqueda
  if NombreTabla = TablaAnterior then
    LimpiaGrid (0, 1)
  else
  begin
    cmbSEL_COLUMNA.ItemIndex := -1;
    edTEXTO_BUSCAR.Text      := '';
    LimpiaGrid (0, 0);
  end;

  vlQry              := TQuery.Create (self);
  vlQry.DatabaseName := Objeto.Apli.DataBaseName;
  vlQry.SessionName  := Objeto.Apli.SessionName;
  ConsultaCargaDatos := ReconstConsulCargaDatos (edTABLA_REFEREN.Text, ConsultaEnPersona, NoColLlave, ColLlave, ColLlaveForan);
  vlQry.SQL.Add (ConsultaCargaDatos);
  vlQry.Open;

  //Llena el combo "Seleccionar Columna" con los nombres de los campos obtenidos en la consulta
  if NombreTabla <> TablaAnterior then
    vlQry.GetFieldNames (cmbSEL_COLUMNA.Items);

  if not vlQry.Eof then
  begin
    //Obtiene el número de registros devueltos. Sirve para saber si se van a habilitar o no los botones: Registrar, Activar y Desactivar
    RegDevueltos := True;

    NoCampos := vlQry.FieldCount;

    //Crea un objeto de tipo TStringList para obtener los nombres de los campos de la consulta
    NombresCampos := TStringList.Create;
    vlQry.GetFieldNames (NombresCampos);

    //Obtiene el número de campos generados por la consulta y define el número de columnas del grid
    sagDATOS_TABLA_REFEREN.ColCount := NoCampos + 1;

    //Limpia la fila de encabezado del grid
    For i := 0 to NoCampos do
      sagDATOS_TABLA_REFEREN.Cells [i, 0] := '';

    //Asigna el título correspondiente a la primera columna del grid
    if rdgDATOS_CARGAR.ItemIndex = 0 then
      sagDATOS_TABLA_REFEREN.Cells [0, 0] := 'DESACTIVAR'
    else if rdgDATOS_CARGAR.ItemIndex = 1 then
      sagDATOS_TABLA_REFEREN.Cells [0, 0] := 'ACTIVAR'
    else if rdgDATOS_CARGAR.ItemIndex = 2 then
      sagDATOS_TABLA_REFEREN.Cells [0, 0] := 'REGISTRAR';

    //Carga el grid con los nombres de los campos
    For n := 1 to NoCampos do
      sagDATOS_TABLA_REFEREN.Cells [n, 0] := NombresCampos.Strings[n - 1];

    //Libera el objeto que contiene los nombres de los campos de la consulta
    NombresCampos.Free;

    //Carga los datos obtenidos de la consulta en el grid
    vlQry.First;
    sagDATOS_TABLA_REFEREN.RowCount := 2;
    NoRegistros := 0;

    while not vlQry.Eof do
    begin
      //Limpia las celdas de la fila actual del grid
      For n := 0 to sagDATOS_TABLA_REFEREN.ColCount - 1 do
        sagDATOS_TABLA_REFEREN.Cells [n, sagDATOS_TABLA_REFEREN.RowCount - 1] := '';

      //Asigna el valor del campo a la celda correspondiente del grid
      For n := 0 to sagDATOS_TABLA_REFEREN.ColCount - 1 do
        if n = 0 then
        begin
          sagDATOS_TABLA_REFEREN.Cells [n, sagDATOS_TABLA_REFEREN.RowCount - 1] := 'F';
          sagDATOS_TABLA_REFEREN.AlignCell [n, sagDATOS_TABLA_REFEREN.RowCount - 1] := alCenter;
        end
        else
          sagDATOS_TABLA_REFEREN.Cells [n, sagDATOS_TABLA_REFEREN.RowCount - 1] := vlQry.Fields.Fields[n - 1].AsString;

      sagDATOS_TABLA_REFEREN.RowCount := sagDATOS_TABLA_REFEREN.RowCount + 1;
      NoRegistros := NoRegistros + 1;

      if NoRegistros = 1 then
      begin
        edTABLA_REFEREN       .Tag := 1;
        btTABLA_REFEREN       .Tag := 1;
        rdgDATOS_CARGAR       .Tag := 1;
        bbtnSELEC_TODOS       .Tag := 1;
        bbtnDESELECT_TODOS    .Tag := 1;
        sagDATOS_TABLA_REFEREN.Tag := 1;
        bbtnREGISTRAR         .Tag := 1;
      end;
      
        vlQry.Next;
    end;

    //Quita la última fila que se agregó al grid y que quedó vacia
    sagDATOS_TABLA_REFEREN.RowCount := sagDATOS_TABLA_REFEREN.RowCount - 1;

    //Autoajusta las columnas del grid
    sagDATOS_TABLA_REFEREN.AdjustColWidths;
    //Habilita el botón de Búsqueda
    bbtnBUSCAR.Enabled := True;
    //Libera el componente de la consulta
    vlQry.Free;
  end
  else
  begin
    edTABLA_REFEREN       .Tag := 0;
    btTABLA_REFEREN       .Tag := 0;
    rdgDATOS_CARGAR       .Tag := 0;
    bbtnSELEC_TODOS       .Tag := 0;
    bbtnDESELECT_TODOS    .Tag := 0;
    sagDATOS_TABLA_REFEREN.Tag := 0;
    bbtnREGISTRAR         .Tag := 0;

    RegDevueltos := False;
    //Habilita el botón de Búsqueda
    bbtnBUSCAR.Enabled := False;

    if not EsRecarga then
      MessageDlg ('No se encontraron registros.', mtInformation, [mbOk], 0);
  end;

  TablaAnterior := NombreTabla;
end;

function TWCrMetPersona.ReconstConsulCargaDatos (NombreTabla: String; Consulta: String; NoColLlave: Integer; ColLlave: String; ColLlaveForan: String) :String;
var
  n                                     : Integer;
  ConsultaFinal, Columna_CB, Columna_CMP: String;

begin
  ConsultaFinal := '';

  if rdgDATOS_CARGAR.ItemIndex In [0, 1] then
    ConsultaFinal := 'Select CB.*,'           +
                     '       CMP.ID_Persona' +
                     '  From  '     +
                     '       ('     +
                     Consulta       +
                     '       ) CB '
  else if rdgDATOS_CARGAR.ItemIndex = 2 then
    ConsultaFinal := 'Select CB.*'  +
                     '  From  '     +
                     '       ('     +
                     Consulta       +
                     '       ) CB ';

  if rdgDATOS_CARGAR.ItemIndex In [0, 1] then
  begin
    ConsultaFinal := ConsultaFinal + 'Join CR_Met_Persona CMP On CMP.ID_Tabla_Referen = ' + Objeto.ID_TABLA_REFEREN.AsString + ' And ';

    if rdgDATOS_CARGAR.ItemIndex = 0 then
      ConsultaFinal := ConsultaFinal + 'CMP.Sit_Persona = ''AC'' And'
    else if rdgDATOS_CARGAR.ItemIndex = 1 then
      ConsultaFinal := ConsultaFinal + 'CMP.Sit_Persona = ''IN'' And';
  end
  else if rdgDATOS_CARGAR.ItemIndex = 2 then
  begin
    ConsultaFinal := ConsultaFinal + 'Where Not Exists (Select 1 From CR_Met_Persona CMP Where CMP.ID_Tabla_Referen = ' + Objeto.ID_TABLA_REFEREN.AsString + ' And';
  end;

  if NoColLlave = 1 then
    ConsultaFinal := ConsultaFinal + ' CB.' + ColLlave + ' = CMP.' + ColLlaveForan
  else
  begin
    ColLlave      := ColLlave      + ',';
    ColLlaveForan := ColLlaveForan + ',';

    For n := 1 to NoColLlave do
    begin
      if n > 1 then
        ConsultaFinal := ConsultaFinal + ' And';

      Columna_CB    := Copy   (ColLlave, 1, Pos (',', ColLlave) - 1);
      Delete (ColLlave, 1, Pos (',', ColLlave));

      Columna_CMP   := Copy   (ColLlaveForan, 1, Pos (',', ColLlaveForan) - 1);
      Delete (ColLlaveForan, 1, Pos (',', ColLlaveForan));

      ConsultaFinal := ConsultaFinal + ' CB.' + Columna_CB + ' = CMP.' + Columna_CMP;
    end;
  end;

  if rdgDATOS_CARGAR.ItemIndex = 2 then
    ConsultaFinal := ConsultaFinal + ')';

  result := ConsultaFinal;
end;

procedure TWCrMetPersona.LimpiaGrid (col, row: Integer);
var
  c, r: Integer;
begin
  For r := row to sagDATOS_TABLA_REFEREN.RowCount do
    For c := col to sagDATOS_TABLA_REFEREN.ColCount - 1 do
      sagDATOS_TABLA_REFEREN.Cells [c, r] := '';

  sagDATOS_TABLA_REFEREN.RowCount := 2
end;

procedure TWCrMetPersona.rdgDATOS_CARGARClick(Sender: TObject);
begin

  //Cuando se de clic los datos serán cargados si el usuario proporcionó el nombre de la Tabla Referenciada y el tipo de datos que desea cargar
  if (edTABLA_REFEREN.Text <> '') and (rdgDATOS_CARGAR.ItemIndex In [0, 1, 2]) then
    CargaDatosTablaRf (edTABLA_REFEREN.Text, False);

  //Activa los botones correspondientes de acuerdo a la opción seleccionada en los radiobuttons
  if RegDevueltos then
  begin
    if rdgDATOS_CARGAR.ItemIndex = 0 then
    begin
      bbtnDESACTIVAR.Enabled := True;
      bbtnREGISTRAR .Enabled := False;
      bbtnACTIVAR   .Enabled := False;
    end
    else if rdgDATOS_CARGAR.ItemIndex = 1 then
    begin
      bbtnACTIVAR   .Enabled := True;
      bbtnREGISTRAR .Enabled := False;
      bbtnDESACTIVAR.Enabled := False;
    end
    else if rdgDATOS_CARGAR.ItemIndex = 2 then
    begin
      bbtnREGISTRAR .Enabled := True;
      bbtnACTIVAR   .Enabled := False;
      bbtnDESACTIVAR.Enabled := False;
    end;
  end
  else
  begin
    bbtnREGISTRAR .Enabled := False;
    bbtnACTIVAR   .Enabled := False;
    bbtnDESACTIVAR.Enabled := False;
  end;
end;

procedure TWCrMetPersona.sagDATOS_TABLA_REFERENDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Bmp  : TBitmap;

  function Rect_(ALeft, ARight, ATop, ABottom: Integer): TRect;
  var
    R: TRect;
  begin
    R.Left   := ALeft;
    R.Right  := ARight;
    R.Top    := ATop;
    R.Bottom := ABottom;

    result   := R;
  end;
begin
  with (Sender As TStringGrid) do
  begin
    if (sagDATOS_TABLA_REFEREN.Tag = 1) and (ACol = 0) and (ARow <> 0) then
    begin
      Bmp   := TBitmap.Create;
      if Assigned (Bmp) then
      begin
        if (Cells [ACol, ARow]) = 'V' then
          ImageList.GetBitmap (1, Bmp)
        else
          ImageList.GetBitmap (0, Bmp);

        //Canvas.FillRect (Rect_(Rect.Left - 2, Rect.Top - 2, Rect.Right + 2, Rect.Bottom + 2));
        //Bmp.TransparentColor := $00E7EFF7;
        //Bmp.Transparent      := True;
        if rdgDATOS_CARGAR.ItemIndex = 0 then
          Canvas.Draw (Rect.Left + 24, Rect.Top + 2, Bmp)
        else if rdgDATOS_CARGAR.ItemIndex = 1 then
          Canvas.Draw (Rect.Left + 16, Rect.Top + 2, Bmp)
        else if rdgDATOS_CARGAR.ItemIndex = 2 then
          Canvas.Draw (Rect.Left + 23, Rect.Top + 2, Bmp);
          
        Bmp.FreeImage;
        Canvas.Brush.Color := color;
        Bmp.Free;
      end;
    end;
  end;
end;

procedure TWCrMetPersona.sagDATOS_TABLA_REFERENMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
begin
  sagDATOS_TABLA_REFEREN.MouseToCell (X, Y, ACol, ARow);

  if (edTABLA_REFEREN.Tag = 1) and (ARow > 0) and (ACol = 0) then
  begin
    if sagDATOS_TABLA_REFEREN.Cells [ACol, ARow] = 'V' then
      sagDATOS_TABLA_REFEREN.Cells [ACol, ARow] := 'F'
    else
      sagDATOS_TABLA_REFEREN.Cells [ACol, ARow] := 'V';
  end;
end;

procedure TWCrMetPersona.bbtnSELEC_TODOSClick(Sender: TObject);
var
  row: Integer;
begin
  if bbtnSELEC_TODOS.Tag = 1 then
  begin
    For row := 1 to sagDATOS_TABLA_REFEREN.RowCount do
     sagDATOS_TABLA_REFEREN.Cells [0, row] := 'V';
  end;
end;

procedure TWCrMetPersona.bbtnDESELECT_TODOSClick(Sender: TObject);
var
  row: Integer;
begin
  if bbtnSELEC_TODOS.Tag = 1 then
  begin
    For row := 1 to sagDATOS_TABLA_REFEREN.RowCount do
     sagDATOS_TABLA_REFEREN.Cells [0, row] := 'F';
  end;
end;

procedure TWCrMetPersona.bbtnREGISTRARClick(Sender: TObject);
var
  row             : Integer;
  EstatusSalvado  : Boolean;
begin
  EstatusSalvado := False;
  //Procedimiento que obtiene para cada parámetro ID, Key y Date, el nombre de la columna que contiene el valor
  Obt_ColPK_ColPkForan;

  For row := 1 to sagDATOS_TABLA_REFEREN.RowCount - 1 do
    if sagDATOS_TABLA_REFEREN.Cells [0, row] = 'V' then
      EstatusSalvado := EjecutaProcStpAltaPersona (row, 'AC', 0);

  if EstatusSalvado then
    MessageDlg ('Las entidades seleccionadas fueron registradas como Personas exitosamente!', mtInformation, [mbOk], 0);

  CargaDatosTablaRf (edTABLA_REFEREN.Text, True);
end;

function TWCrMetPersona.EjecutaProcStpAltaPersona (row: Integer; Situacion: String; TipoSalvado: Integer): Boolean;
var
  Stp_Alta_Persona: TStoredProc;
  NumCol          : Integer;
begin
  result := False;

  try
  begin
    //Parámetros para el Strored Procedure
    Stp_Alta_Persona := TStoredProc.Create (Self);
    Stp_Alta_Persona.Close;
    Stp_Alta_Persona.DatabaseName   := Objeto.Apli.DataBaseName;
    Stp_Alta_Persona.SessionName    := Objeto.Apli.SessionName;
    Stp_Alta_Persona.StoredProcName := 'SISTEMAS.PKGCRADMINCOMERCIAL.STP_ALTA_PERSONA';

    //Crea los parámetros
    Stp_Alta_Persona.Params.Clear;
    Stp_Alta_Persona.Params.CreateParam (ftFloat,    'peID_Persona',       ptInputOutput);
    Stp_Alta_Persona.Params.CreateParam (ftFloat,    'peID_Tabla_Referen', ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'peDescripcion',      ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftFloat,    'peID1',              ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftFloat,    'peID2',              ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftFloat,    'peID3',              ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'peKey1',             ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'peKey2',             ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'peKey3',             ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftDate,     'peDate1',            ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftDate,     'peDate2',            ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftDate,     'peDate3',            ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftDate,     'peF_Vigente_Desde',  ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'peSit_Persona',      ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'peCve_Usu_Alta',     ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftDateTime, 'peFH_Alta',          ptInput);
    Stp_Alta_Persona.Params.CreateParam (ftFloat,    'psError',            ptOutput);
    Stp_Alta_Persona.Params.CreateParam (ftString,   'psMsgError',         ptOutput);

    Stp_Alta_Persona.Prepare;

    //Si el Tipo de Salvado es igual a 1 = 'Actualización', entonces se pasa el parámetro ID_Persona
    if TipoSalvado = 1 then
    begin
      NumCol := ObtNoColumna ('ID_PERSONA');
      Stp_Alta_Persona.ParamByName ('peID_Persona').AsFloat := StrToInt (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);
    end;

    //Obtiene el valor para el parámetro "peDescripcion"
    NumCol := ObtNoColumna (Columna_Descripcion);
    if NumCol <> - 1 then
      Stp_Alta_Persona.ParamByName ('peDescripcion').AsString   := sagDATOS_TABLA_REFEREN.Cells [NumCol, row];

    //Obtiene los valores para los parámetros
    Stp_Alta_Persona.ParamByName ('peID_Tabla_Referen').AsFloat := Objeto.ID_TABLA_REFEREN.AsInteger;

    //ID1
    NumCol := ObtNoColumna (cID1);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peID1').AsFloat            := StrToInt (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);
    //ID2
    NumCol := ObtNoColumna (cID2);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peID2').AsFloat            := StrToInt (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);
    //ID3
    NumCol := ObtNoColumna (cID3);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peID3').AsFloat            := StrToInt (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);
    //Key1
    NumCol := ObtNoColumna (cKey1);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peKey1').AsString          := sagDATOS_TABLA_REFEREN.Cells [NumCol, row];
    //Key2
    NumCol := ObtNoColumna (cKey2);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peKey2').AsString          := sagDATOS_TABLA_REFEREN.Cells [NumCol, row];
    //Key3
    NumCol := ObtNoColumna (cKey3);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peKey3').AsString          := sagDATOS_TABLA_REFEREN.Cells [NumCol, row];
    //Date1
    NumCol := ObtNoColumna (cDate1);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peDate1').AsDate           := StrToDate (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);
    //Date2
    NumCol := ObtNoColumna (cDate2);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peDate2').AsDate           := StrToDate (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);
    //Date3
    NumCol := ObtNoColumna (cDate3);
    if NumCol <> -1 then
      Stp_Alta_Persona.ParamByName ('peDate3').AsDate           := StrToDate (sagDATOS_TABLA_REFEREN.Cells [NumCol, row]);

      Stp_Alta_Persona.ParamByName ('peSit_Persona')    .AsString   := Situacion;
      Stp_Alta_Persona.ParamByName ('peCve_Usu_Alta')   .AsString   := Objeto.Apli.Usuario;
      Stp_Alta_Persona.ParamByName ('peFH_Alta')        .AsDateTime := Now;

      Stp_Alta_Persona.ExecProc;

      if Stp_Alta_Persona.ParamByName ('psError').AsInteger = 0 then
        result := True
      else
      begin
        result := False;
        ShowMessage('Error en ' + Stp_Alta_Persona.ParamByName ('psError').AsString + ': ' + Stp_Alta_Persona.ParamByName('psMsgError').AsString);
      end;

      Stp_Alta_Persona.UnPrepare;
  end;
  finally
    Stp_Alta_Persona.Free;
  end;
end;

procedure TWCrMetPersona.Obt_ColPK_ColPkForan;
var
  NomCampo, ColumnasLlaveFor, ColumnasLlave, ColLlaveFor: String;
  n                                                     : Integer;
begin
  cID1   := '';
  cID2   := '';
  cID3   := '';
  cKey1  := '';
  cKey2  := '';
  cKey3  := '';
  cDate1 := '';
  cDate2 := '';
  cDate3 := '';

  ColumnasLlaveFor := ColLlaveForan + ',';
  ColumnasLlave    := ColLlave      + ',';

  For n := 1 to NoColLlave do
  begin
    //Obtiene el nombre del parámetro
    ColLlaveFor := Copy (ColumnasLlaveFor, 1, Pos (',', ColumnasLlaveFor) - 1);
    Delete (ColumnasLlaveFor, 1, Pos (',', ColumnasLlaveFor));

    //Obtiene el nombre del campo que corresponde al parámetro
    NomCampo    := Copy (ColumnasLlave, 1, Pos (',', ColumnasLlave) - 1);
    Delete (ColumnasLlave, 1, Pos (',', ColumnasLlave));

    if ColLlaveFor = 'ID1' then
      cID1   := NomCampo
    else if ColLlaveFor = 'ID2' then
      cID2   := NomCampo
    else if ColLlaveFor = 'ID3' then
      cID3   := NomCampo
    else if ColLlaveFor = 'Key1' then
      cKey1  := NomCampo
    else if ColLlaveFor = 'Key2' then
      cKey2  := NomCampo
    else if ColLlaveFor = 'Key3' then
      cKey3  := NomCampo
    else if ColLlaveFor = 'Date1' then
      cDate1 := NomCampo
    else if ColLlaveFor = 'Date2' then
      cDate2 := NomCampo
    else if ColLlaveFor = 'Date3' then
      cDate3 := NomCampo;
  end;
end;

function TWCrMetPersona.ObtNoColumna (NombreCampo: String): Integer;
var
  c: Integer;
begin
  result := -1;

  if NombreCampo = '' then
    exit;

  //Obtiene el número de columna donde se encuentra el valor correspondiente al parámetro
  For c := 0 to sagDATOS_TABLA_REFEREN.ColCount - 1 do
   if sagDATOS_TABLA_REFEREN.Cells [c, 0] = NombreCampo then
   begin
     result := c;
     exit;
   end;
end;

procedure TWCrMetPersona.bbtnSALIRClick(Sender: TObject);
begin
  Interforma1.Salir;
end;

procedure TWCrMetPersona.bbtnACTIVARClick(Sender: TObject);
var
  row             : Integer;
  EstatusSalvado  : Boolean;
begin
  EstatusSalvado := False;
  //Procedimiento que obtiene para cada parámetro ID, Key y Date, el nombre de la columna que contiene el valor
  Obt_ColPK_ColPkForan;

  For row := 1 to sagDATOS_TABLA_REFEREN.RowCount - 1 do
    if sagDATOS_TABLA_REFEREN.Cells [0, row] = 'V' then
      EstatusSalvado := EjecutaProcStpAltaPersona (row, 'AC', 1);

  if EstatusSalvado then
    MessageDlg ('Las Personas seleccionadas fueron Activadas exitosamente!', mtInformation, [mbOk], 0);

  CargaDatosTablaRf (edTABLA_REFEREN.Text, True);
end;

procedure TWCrMetPersona.bbtnDESACTIVARClick(Sender: TObject);
var
  row             : Integer;
  EstatusSalvado  : Boolean;
begin
  EstatusSalvado := False;
  //Procedimiento que obtiene para cada parámetro ID, Key y Date, el nombre de la columna que contiene el valor
  Obt_ColPK_ColPkForan;

  For row := 1 to sagDATOS_TABLA_REFEREN.RowCount - 1 do
    if sagDATOS_TABLA_REFEREN.Cells [0, row] = 'V' then
      EstatusSalvado := EjecutaProcStpAltaPersona (row, 'IN', 1);

  if EstatusSalvado then
    MessageDlg ('Las Personas seleccionadas fueron Desactivadas exitosamente!', mtInformation, [mbOk], 0);

  CargaDatosTablaRf (edTABLA_REFEREN.Text, True);
end;

procedure TWCrMetPersona.Button1Click(Sender: TObject);
begin
  //Obtiene el número de la columna correspondiente al campo o columna seleccionada en el combo "Seleccionar Columna"
  
end;

procedure TWCrMetPersona.bbtnBUSCARClick(Sender: TObject);
var
  NoColumna, row: Integer;
  NombreColumna : String;
begin
  //Valida que los campos necesarios para la búsqueda no estén vacios
  if (cmbSEL_COLUMNA.ItemIndex = -1) or (edTEXTO_BUSCAR.Text = '') then
  begin
    MessageDlg ('Para realizar la búsqueda es necesario que indique la columna y el valor a buscar.', mtInformation, [mbOk], 0);
    exit;
  end;

  //Obtiene el número de columna correspondiente al nombre de columna o campo seleccionado en el combobox "Seleccionar Columna"
  NombreColumna := cmbSEL_COLUMNA.Items [cmbSEL_COLUMNA.ItemIndex];
  NoColumna     := ObtNoColumna (NombreColumna);

  //Realiza la búsqueda en el grid
  For row := 1 to sagDATOS_TABLA_REFEREN.RowCount - 1 do
  begin
    if Pos (edTEXTO_BUSCAR.Text, sagDATOS_TABLA_REFEREN.Cells [NoColumna, row]) > 0  then
    begin
      sagDATOS_TABLA_REFEREN.Row := row;
      sagDATOS_TABLA_REFEREN.Col := NoColumna;
      exit;
    end;
  end;

  MessageDlg ('No se encontró ningún ' + NombreColumna + ' que corresponda con el valor a buscar.', mtInformation, [mbOk], 0);
end;

end.
