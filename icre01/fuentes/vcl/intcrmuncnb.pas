// Sistema         : Clase de CR_MUNICIPIO_CNBV
// Fecha de Inicio : 13/04/2011
// Función forma   : Clase de CR_MUNICIPIO_CNBV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : RUCJ4248
// Comentarios     :
Unit IntCrMunCnb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntGenCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, IntParamCre;

const
  Campo = 'FOLIO';
  Tabla = 'CR_MUNICIPIO_CNBV';

  C_COLCVE_ESTADO     = 0;
  C_COLNOM_ESTADO     = 1;
  C_COLNOM_MUNICIPIO  = 2;
  C_COLCVE_MUNICIPIO  = 3;
  C_COLCOL_MINUCIPIO  = 4;


Type
 TCrMunCnb= class; 

  TWCrMunicipioCnbv=Class(TForm)
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    MErrores: TMemo;
    SAGta: TStringAlignGrid;
    lbFOLIO: TLabel;
    edFOLIO: TEdit;
    lbCVE_ESTADO: TLabel;
    edCVE_ESTADO: TEdit;
    lbNOM_ESTADO: TLabel;
    edNOM_ESTADO: TEdit;
    lbNOM_MUNICIPIO: TLabel;
    edNOM_MUNICIPIO: TEdit;
    lbCVE_MUNICIPIO: TLabel;
    edCVE_MUNICIPIO: TEdit;
    lbCOL_MINUCIPIO: TLabel;
    edCOL_MINUCIPIO: TEdit;
    InterForma1: TInterForma;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCargaClick(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Modificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations }
      Procedure PegaInformacion(pLong : Integer);
      Function CargaDatos(var pFOLIO, pCVE_ESTADO, pNOM_ESTADO, pNOM_MUNICIPIO,
                pCVE_MUNICIPIO, pCOL_MINUCIPIO : string):boolean;
    public
    { Public declarations }
    Objeto : TCrMunCnb;
end;


 TCrMunCnb= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        ParamCre        : TParamCre;
        { Public declarations } 
        FOLIO                    : TInterCampo;
        CVE_ESTADO               : TInterCampo;
        NOM_ESTADO               : TInterCampo;
        NOM_MUNICIPIO            : TInterCampo;
        CVE_MUNICIPIO            : TInterCampo;
        COL_MINUCIPIO            : TInterCampo;
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


constructor TCrMunCnb.Create( AOwner : TComponent ); 
begin Inherited; 
      FOLIO :=CreaCampo('FOLIO',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO.Caption:='Folio';
      CVE_ESTADO :=CreaCampo('CVE_ESTADO',ftString,tsNinguno,tsNinguno,True);
                CVE_ESTADO.Caption:='Clave de Estado';
      NOM_ESTADO :=CreaCampo('NOM_ESTADO',ftString,tsNinguno,tsNinguno,True);
                NOM_ESTADO.Caption:='Nombre del Estado';
      NOM_MUNICIPIO :=CreaCampo('NOM_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                NOM_MUNICIPIO.Caption:='Nombre de Municipio';
      CVE_MUNICIPIO :=CreaCampo('CVE_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MUNICIPIO.Caption:='Clave de Municipio';
      COL_MINUCIPIO :=CreaCampo('COL_MINUCIPIO',ftString,tsNinguno,tsNinguno,True);
                COL_MINUCIPIO.Caption:='Colonia Minucipio';
      FKeyFields.Add('FOLIO');

      TableName := 'CR_MUNICIPIO_CNBV'; 
      UseQuery := True; 
      HelpFile := 'IntCrMunCnb.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMunCnb.Destroy;
begin inherited;
end;


function TCrMunCnb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMunicipioCnbv;
begin
   W:=TWCrMunicipioCnbv.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrMunCnb.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrMuCn.it','S');
      Try if Active then
        begin
          T.Param(0,FOLIO.AsString);
        end;
          if T.Execute then
          begin
            InternalBusca := FindKey([T.DameCampo(0)]);
          end;
      finally  T.Free;
      end;
end;

function TCrMunCnb.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MUNICIPIO_CNBV********************)
(*                                                                              *)
(*  FORMA DE CR_MUNICIPIO_CNBV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MUNICIPIO_CNBV********************)

procedure TWCrMunicipioCnbv.FormShow(Sender: TObject);
begin
      Objeto.FOLIO.Control:=edFOLIO;
      Objeto.CVE_ESTADO.Control:=edCVE_ESTADO;
      Objeto.NOM_ESTADO.Control:=edNOM_ESTADO;
      Objeto.NOM_MUNICIPIO.Control:=edNOM_MUNICIPIO;
      Objeto.CVE_MUNICIPIO.Control:=edCVE_MUNICIPIO;
      Objeto.COL_MINUCIPIO.Control:=edCOL_MINUCIPIO;
end;

procedure TWCrMunicipioCnbv.FormDestroy(Sender: TObject);
begin
      Objeto.FOLIO.Control:=nil;
      Objeto.CVE_ESTADO.Control:=nil;
      Objeto.NOM_ESTADO.Control:=nil;
      Objeto.NOM_MUNICIPIO.Control:=nil;
      Objeto.CVE_MUNICIPIO.Control:=nil;
      Objeto.COL_MINUCIPIO.Control:=nil;
   //Objeto
end;

procedure TWCrMunicipioCnbv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

//procedure TWCrMunicipioCnbv.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;

// Funcion para gargar los datos de forma "masiva"
function TWCrMunicipioCnbv.CargaDatos(var pFOLIO, pCVE_ESTADO, pNOM_ESTADO,
  pNOM_MUNICIPIO, pCVE_MUNICIPIO, pCOL_MINUCIPIO: string): boolean;
var Qry : TQuery;
Begin
   Result := False;
   Qry := TQuery.Create(Nil);
   If Assigned(Qry) Then
    With Qry Do
     Try
      DataBaseName := Objeto.Apli.DataBaseName;
      SessionName := Objeto.Apli.SessionName;
      SQL.Clear;
      SQL.Add('INSERT INTO CR_MUNICIPIO_CNBV (FOLIO, CVE_ESTADO, NOM_ESTADO, NOM_MUNICIPIO, CVE_MUNICIPIO, COL_MINUCIPIO) '+
              'VALUES (:pFOLIO, :pCVE_ESTADO, :pNOM_ESTADO, :pNOM_MUNICIPIO, :pCVE_MUNICIPIO, :pCOL_MINUCIPIO) ');
      Params.Clear;
      Params.CreateParam(ftString,'pFOLIO',ptInput);
      Params.CreateParam(ftString,'pCVE_ESTADO',ptInput);
      Params.CreateParam(ftString,'pNOM_ESTADO',ptInput);
      Params.CreateParam(ftString,'pNOM_MUNICIPIO',ptInput);
      Params.CreateParam(ftString,'pCVE_MUNICIPIO',ptInput);
      Params.CreateParam(ftString,'pCOL_MINUCIPIO',ptInput);
      ParamByName('pFOLIO').AsString := pFOLIO;
      ParamByName('pCVE_ESTADO').AsString := pCVE_ESTADO;
      ParamByName('pNOM_ESTADO').AsString := pNOM_ESTADO;
      ParamByName('pNOM_MUNICIPIO').AsString := pNOM_MUNICIPIO;
      ParamByName('pCVE_MUNICIPIO').AsString := pCVE_MUNICIPIO;
      ParamByName('pCOL_MINUCIPIO').AsString := pCOL_MINUCIPIO;
      ExecSQL;

      SQL.Clear; Params.Clear;
      SQL.Add('COMMIT');
      ExecSQL;

      Result := True;
    Finally
      Close;
      Free;
    End;
end;

procedure TWCrMunicipioCnbv.PegaInformacion(pLong: Integer);
var
   l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   begin
      AddLine(MErrores,'Error en Folio: '+ SAGta.Cells[C_COLCVE_ESTADO,  pRow] +
                       '       Nombre Edo.: '+ SAGta.Cells[C_COLNOM_ESTADO, pRow] +
                       '       Nombre Mpio.: '+ SAGta.Cells[C_COLNOM_MUNICIPIO, pRow] +
                       '       Cve. Mpio.: '+ SAGta.Cells[C_COLCVE_MUNICIPIO, pRow] +
                       '       Colonia: '+ SAGta.Cells[C_COLCOL_MINUCIPIO, pRow] +
                       ' Existen Datos Nulos. ');
      SAGta.RemoveRow(pRow);
   end;

   //Depura Lineas
   procedure DepuraLineas;
   var nRow, nRowCountAnt : Integer;
   begin
     nRow := 0;
     with SAGta do
      while (nRow < RowCount) do
       begin
         if (Trim(Cells[C_COLCVE_ESTADO,nRow]) = '') or
            (Trim(Cells[C_COLCVE_MUNICIPIO,nRow]) = '') then
             Begin
             nRowCountAnt := RowCount;
             LimpiaRow(nRow);
             If (nRowCountAnt = 1) Then
              Begin
              ClearGrid(SAGta,0);
              Break;
              End;
             nRow := 0;
             End
         Else
          Inc(nRow);
       End;
   end;

//Inicio Pega Informacion
Begin
   lbTotalReg.Caption := '';
   pbRegistros.Max := 0;
   Try
      For l_Ciclo:= 1 to (SAGta.RowCount-1) do
      Begin
         For l_Tempo:= 0 to (SAGta.ColCount-1) do
         begin
              SAGta.Cells[l_Tempo,l_Ciclo] := '';
         end;
      end;
   //Pega el archivo desde la memoria
   if SAGta.ColCount = 6 then
      SAGta.RemoveCol(0);
   //end if
   SAGta.CopyFromClipboard;
   except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
   end;
   if SAGta.ColCount < 5 then
       SAGta.InsertCol(0)
   else if SAGta.ColCount > 5 then
         SAGta.ColCount := 5;
   //end if

   SAGta.ColWidths[0] := 20;
   SAGta.ColWidths[1] := 115;
   SAGta.ColWidths[2] := 115;
   SAGta.ColWidths[3] := 40;
   SAGta.ColWidths[4] := 315;

   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

procedure TWCrMunicipioCnbv.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssCtrl] ) and (Key = 86)) then
    PegaInformacion(3);
end;

procedure TWCrMunicipioCnbv.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          vlFOLIO,
          vlCVE_ESTADO,
          vlNOM_ESTADO,
          vlNOM_MUNICIPIO,
          vlCVE_MUNICIPIO,
          vlCOL_MINUCIPIO   : String;
          vlMsg             : String;
          vlTermina         : Boolean;
          Valor             : LongInt;
begin
 if (Trim(SAGta.Cells[0,0]) <> CNULL) and
    (Trim(SAGta.Cells[1,0]) <> CNULL) and
    (Trim(SAGta.Cells[2,0]) <> CNULL) and
    (Trim(SAGta.Cells[3,0]) <> CNULL) and
    (Trim(SAGta.Cells[4,0]) <> CNULL) then
//   if Trim(SAGta.Cells[1,0]) <> CNULL then
   begin
     vlTermina := False;
     vlFOLIO          := '';
     vlCVE_ESTADO     := '';
     vlNOM_ESTADO     := '';
     vlNOM_MUNICIPIO  := '';
     vlCVE_MUNICIPIO  := '';
     vlCOL_MINUCIPIO  := '';

     if RGinformacion.ItemIndex = 0 then //Reemplaza la inofrmación
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin  //Borra datos existentes de la tabla en caso de reemplazar                        //delete cr_tipo_acred
           RunSQL('DELETE CR_MUNICIPIO_CNBV',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           for VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           Begin
              GetSQLInt('SELECT NVL(MAX('+Campo+')+1,1) AS '+CAMPO+' FROM '+Tabla,
                        objeto.Apli.DataBaseName, objeto.Apli.SessionName, Campo, Valor, true);
              vlFOLIO          := FloatToStr(Valor);
              vlCVE_ESTADO     := UpperCase(SAGta.Cells[C_COLCVE_ESTADO   , VLCtdorLine]);
              vlNOM_ESTADO     := UpperCase(SAGta.Cells[C_COLNOM_ESTADO   , VLCtdorLine]);
              vlNOM_MUNICIPIO  := UpperCase(SAGta.Cells[C_COLNOM_MUNICIPIO, VLCtdorLine]);
              vlCVE_MUNICIPIO  := UpperCase(SAGta.Cells[C_COLCVE_MUNICIPIO, VLCtdorLine]);
              vlCOL_MINUCIPIO  := UpperCase(SAGta.Cells[C_COLCOL_MINUCIPIO, VLCtdorLine]);

              if not(CargaDatos(vlFOLIO, vlCVE_ESTADO, vlNOM_ESTADO, vlNOM_MUNICIPIO,
                                vlCVE_MUNICIPIO, vlCOL_MINUCIPIO)) then //Carga los datos del grid a la tabla
              begin  //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'Error Cve. Edo. : '+ vlCVE_ESTADO + '    Cve. Mpio. : '+ vlCVE_MUNICIPIO );
                 if MessageDlg('¿Error en carga de datos : ' + vlCVE_ESTADO + ' ' + vlCVE_MUNICIPIO + MSG_PREG_CONTINUA_PROCES,
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 begin
                    messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                    exit;
                 end;
              end;
              pbRegistros.Position :=VLCtdorLine;
              vlTermina := True;
           end;
           if vlTermina then
              ShowMessage(MSG_PROCESO_CARGA_OK);
           //end if
           messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
        end
        else
        begin
           vlMsg := 'No se realizó el Proceso de carga';
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           AddLine(MErrores,vlMsg);
           messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
           ShowMessage(vlMsg);
           exit;
        end;
     end
     else if RGinformacion.ItemIndex = 1 then //Adiciona datos no existentes en la base, no reemplaza
     begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
        for VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
           GetSQLInt('SELECT NVL(MAX('+Campo+')+1,1) AS '+CAMPO+' FROM '+Tabla,
                        objeto.Apli.DataBaseName, objeto.Apli.SessionName, Campo, Valor, true);
           vlFOLIO          := FloatToStr(Valor);
           vlCVE_ESTADO     := UpperCase(SAGta.Cells[C_COLCVE_ESTADO   , VLCtdorLine]);
           vlNOM_ESTADO     := UpperCase(SAGta.Cells[C_COLNOM_ESTADO   , VLCtdorLine]);
           vlNOM_MUNICIPIO  := UpperCase(SAGta.Cells[C_COLNOM_MUNICIPIO, VLCtdorLine]);
           vlCVE_MUNICIPIO  := UpperCase(SAGta.Cells[C_COLCVE_MUNICIPIO, VLCtdorLine]);
           vlCOL_MINUCIPIO  := UpperCase(SAGta.Cells[C_COLCOL_MINUCIPIO, VLCtdorLine]);

           If not(CargaDatos(vlFOLIO, vlCVE_ESTADO, vlNOM_ESTADO, vlNOM_MUNICIPIO,
                                vlCVE_MUNICIPIO, vlCOL_MINUCIPIO)) then
           begin
             AddLine(MErrores,'Error Cve. Edo. : '+ vlCVE_ESTADO + '    Cve. Mpio. : '+ vlCVE_MUNICIPIO );
             if MessageDlg('¿Error en carga de datos : ' + vlCVE_ESTADO + ' ' + vlCVE_MUNICIPIO + MSG_PREG_CONTINUA_PROCES,
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
             begin
                messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                exit;
             end;
           end;
           pbRegistros.Position :=VLCtdorLine;
           vlTermina := True;
        end; //end for
        if vlTermina then
           ShowMessage(MSG_PROCESO_CARGA_OK);
        //end if
        messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
     end;
   eND;
end;

procedure TWCrMunicipioCnbv.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado := true;
end;

procedure TWCrMunicipioCnbv.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado := true;
end;

procedure TWCrMunicipioCnbv.InterForma1DespuesNuevo(Sender: TObject);
begin
  edCVE_ESTADO.SetFocus;
  edFOLIO.Enabled := false;
end;

procedure TWCrMunicipioCnbv.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
var
  Valor             : LongInt;
begin //<<Control>>.SetFocus;
  GetSQLInt('SELECT NVL(MAX('+Campo+')+1,1) AS '+CAMPO+' FROM '+Tabla,
            objeto.Apli.DataBaseName, objeto.Apli.SessionName, Campo, Valor, true);
  Objeto.FOLIO.SetAsInteger(Valor);
  Realizado := true;
end;

procedure TWCrMunicipioCnbv.InterForma1DespuesModificar(Sender: TObject);
begin
  edCVE_ESTADO.SetFocus;
  edFOLIO.Enabled := false;
end;

procedure TWCrMunicipioCnbv.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

end.
