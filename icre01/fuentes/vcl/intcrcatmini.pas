// Sistema         : Clase de CR_CAT_MINIMO
// Fecha de Inicio : 28/05/2003
// Función forma   : Clase de CR_CAT_MINIMO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCatMini;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, Menus,

//Unidades Adicionales
IntParamCre, IntGenCre,
IntCrCaCaMi, IntLinkit; //Tipo de Cartera

Type
 TCrCatMini= class;

  TWCrCatMinimo=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    lbCVE_CAT_MIN_VEN: TLabel;
    lbCVE_SITI: TLabel;
    edCVE_SITI: TEdit;
    edCVE_CAT_MIN_VEN: TEdit;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    MErrores: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbCVE_CAT_MINIMO: TLabel;
    edCVE_CAT_MINIMO: TEdit;
    lbDESC_CAT_MINIMO: TLabel;
    edDESC_CAT_MINIMO: TEdit;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    rgCVE_CLASIF_DEST: TRadioGroup;
    rgPERSONA_JURIDICA: TRadioGroup;
    Label7: TLabel;
    Bevel3: TBevel;
    Label12: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    SAGta: TStringAlignGrid;
    Label5: TLabel;
    Label8: TLabel;
    edCVE_OPER_FACT: TEdit;
    Bevel6: TBevel;
    Label9: TLabel;
    lbCVE_CARTERA: TLabel;
    edCVE_CARTERA: TEdit;
    btCVE_CARTERA: TBitBtn;
    edDESC_CARTERA: TEdit;
    ilCVE_CARTERA: TInterLinkit;
    Bevel7: TBevel;
    Label10: TLabel;
    Bevel8: TBevel;
    Label11: TLabel;
    rgSIT_CAT_MINIMO: TRadioGroup;
    QTipoCartera: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCargaClick(Sender: TObject);
    procedure SAGtaExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_CAT_MINIMOExit(Sender: TObject);
    procedure edCVE_CAT_MIN_VENExit(Sender: TObject);
    procedure rgCVE_CLASIF_DESTExit(Sender: TObject);
    procedure edDESC_CAT_MINIMOExit(Sender: TObject);
    procedure edCVE_SITIExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure rgPERSONA_JURIDICAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_OPER_FACTExit(Sender: TObject);
    procedure rgSIT_CAT_MINIMOExit(Sender: TObject);
    procedure edCVE_CARTERAExit(Sender: TObject);
    procedure btCVE_CARTERAClick(Sender: TObject);
    procedure ilCVE_CARTERACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_CARTERAEjecuta(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCatMini;
    Function ValidaClasifica(PCve : String; PClasif,pPersJur : String; PDesc : String; PTipoCart: string; PSit: string): Boolean;
    Procedure PegaInformacion(pLong : Integer);
    Function  CargaDatos(var PMin,pVen,pSiti,pClasDest,pDesc,pPersJur, pCveOper, pTipoCart, pSit:string):boolean;
end;
 TCrCatMini= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CAT_MINIMO           : TInterCampo;
        DESC_CAT_MINIMO          : TInterCampo;
        CVE_CAT_MIN_VEN          : TInterCampo;
        CVE_SITI                 : TInterCampo;
        CVE_CLASIF_DEST          : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;
        //</ RABA > ENE 2012
        CVE_OPER_FACT            : TInterCampo;
        //< RABA />
        SIT_CAT_MINIMO           : TInterCampo;
        CVE_CARTERA              : TInterCampo;

        ClasifCart               : TCrCaCaMi;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrCatMini.Create( AOwner : TComponent );
begin Inherited;
      CVE_CAT_MINIMO :=CreaCampo('CVE_CAT_MINIMO',ftString,tsNinguno,tsNinguno,True);
                CVE_CAT_MINIMO.Caption:='Clave de Cat Minimo';
      DESC_CAT_MINIMO :=CreaCampo('DESC_CAT_MINIMO',ftString,tsNinguno,tsNinguno,True);
                DESC_CAT_MINIMO.Caption:='Descripción Cat Minimo';
      CVE_CAT_MIN_VEN :=CreaCampo('CVE_CAT_MIN_VEN',ftString,tsNinguno,tsNinguno,True);
                CVE_CAT_MIN_VEN.Caption:='Clave de Cat Min Ven';
      CVE_SITI :=CreaCampo('CVE_SITI',ftString,tsNinguno,tsNinguno,True);
                CVE_SITI.Caption:='Clave de Siti';
      CVE_CARTERA :=CreaCampo('CVE_CARTERA',ftString,tsNinguno,tsNinguno,True);
                CVE_CARTERA.Caption:='Tipo de Cartera';
      CVE_CLASIF_DEST :=CreaCampo('CVE_CLASIF_DEST',ftString,tsNinguno,tsNinguno,True);
        with CVE_CLASIF_DEST do
           Begin Size := 2;
                 UseCombo := True;
                 ComboLista.Add('0');   ComboDatos.Add('BC');
                 ComboLista.Add('1');   ComboDatos.Add('FI');
           end;
                CVE_CLASIF_DEST.Caption:='Clave de Clasif Dest';
      CVE_PER_JURIDICA :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);
        with CVE_PER_JURIDICA do
           Begin Size := 2;
                 UseCombo := True;
                 ComboLista.Add('0');   ComboDatos.Add('PM');
                 ComboLista.Add('1');   ComboDatos.Add('PF');
           end;
                CVE_PER_JURIDICA.Caption:='Clave Personalidad Jurídica';
      //</ RABA > ENE 2012
      CVE_OPER_FACT :=CreaCampo('CVE_OPER_FACT',ftString,tsNinguno,tsNinguno,True);
                CVE_OPER_FACT.Caption:='Clave de Operación Facturación';
      //< RABA />

      SIT_CAT_MINIMO :=CreaCampo('SIT_CAT_MINIMO',ftString,tsNinguno,tsNinguno,True);
         With SIT_CAT_MINIMO do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
         end;
                SIT_CAT_MINIMO.Caption:='Situación de Catálogo Mínimo';

      FKeyFields.Add('CVE_CAT_MINIMO');

      TableName := 'CR_CAT_MINIMO';
      UseQuery := True;
      HelpFile := 'IntCrCatMini.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      ClasifCart := TCrCaCaMi.Create(Self);
      {$WARNINGS ON}
      ClasifCart.MasterSource:=Self;
      ClasifCart.FieldByName('CVE_CARTERA').MasterField:='CVE_CARTERA';
end;

Destructor TCrCatMini.Destroy;
begin
  if ClasifCart <> nil then
     ClasifCart.Free;

  inherited;
end;


function TCrCatMini.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCatMinimo;
begin
   W:=TWCrCatMinimo.Create(Self);
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

Function TCrCatMini.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCaMi.it','S');
      Try if Active then begin T.Param(0,CVE_CAT_MINIMO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CAT_MINIMO********************)
(*                                                                              *)
(*  FORMA DE CR_CAT_MINIMO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAT_MINIMO********************)

procedure TWCrCatMinimo.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_CAT_MINIMO.Control:=edCVE_CAT_MINIMO;
      Objeto.DESC_CAT_MINIMO.Control:=edDESC_CAT_MINIMO;
      Objeto.CVE_CAT_MIN_VEN.Control:=edCVE_CAT_MIN_VEN;
      Objeto.CVE_SITI.Control:=edCVE_SITI;
      Objeto.CVE_CARTERA.Control:=edCVE_CARTERA;
      Objeto.CVE_CLASIF_DEST.Control:=rgCVE_CLASIF_DEST;
      Objeto.CVE_PER_JURIDICA.Control := rgPERSONA_JURIDICA;
      //</ RABA > ENE 2012
      Objeto.CVE_OPER_FACT.Control := edCVE_OPER_FACT;
      //< RABA />
      Objeto.SIT_CAT_MINIMO.Control := rgSIT_CAT_MINIMO;

      Objeto.ClasifCart.DESC_CARTERA.Control := edDESC_CARTERA;
      Objeto.ClasifCart.GetParams(Objeto);
end;

procedure TWCrCatMinimo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CAT_MINIMO.Control:=nil;
      Objeto.DESC_CAT_MINIMO.Control:=nil;
      Objeto.CVE_CAT_MIN_VEN.Control:=nil;
      Objeto.CVE_SITI.Control:=nil;
      Objeto.CVE_CARTERA.Control:=nil;
      Objeto.CVE_CLASIF_DEST.Control:=nil;
      Objeto.CVE_PER_JURIDICA.Control := nil;
      //</ RABA > ENE 2012
      Objeto.CVE_OPER_FACT.Control := nil;
      //< RABA /> ENE 2012
      Objeto.SIT_CAT_MINIMO.Control := nil;
   //Objeto

      Objeto.ClasifCart.DESC_CARTERA.Control := nil;
end;

procedure TWCrCatMinimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Function TWCrCatMinimo.ValidaClasifica(PCve : String; PClasif, pPersJur : String; PDesc : String; PTipoCart: string; PSit: string): Boolean;
var     VLLongClas   : Integer;
        vlLongPersJur: Integer;
        vlLongSit    : Integer;
        vlLongTipoCar: Integer;
        VLSalida     : Boolean;
Begin
   VLSalida      := True;
   VLLongClas    := Length(PClasif);
   vlLongPersJur := Length(pPersJur);
   vlLongTipoCar := Length(pTipoCart);
   vlLongSit     := Length(pSit);
   //VALIDA Clasificación
   If ((VLLongClas    <= 1 ) and (vlLongPersJur <=1 )) or
      ((VLLongClas     > 2 ) and (vlLongPersJur > 2 )) or
      ((vlLongTipoCar <> 0 ) and (vlLongTipoCar > 3 )) or
      (vlLongSit      <> 2) then
   Begin
      AddLine(MErrores,'Error en longitud de claves: ' + PCve + ',' + pPersJur + ',' + PTipoCart + ',' + PSit +
                       '       Desc.: '+ PDesc +
   	               '           Clasificación: ' + PClasif);
      VLSalida := False;
   end
   else if VLLongClas = 2 then
   Begin
      if vlLongPersJur = 2 then
      begin
        If (PClasif <>'BC') and ( PCLASIF <>'FI') then
        Begin
           AddLine(MErrores,'Error en Cve: ' + PCve +
                            '       Desc.: '+ PDesc +
                            '           Clasificación: ' + PClasif);
           VLSalida := False;
        end;
        If (pPersJur <>'PM') and ( pPersJur <>'PF') then
        Begin
           AddLine(MErrores,'     Error en Cve: ' + PCve +
                            '            Desc.: ' + PDesc +
                            ' Persona Juridica: ' + pPersJur);
           VLSalida := False;
        end
      end;
   end;
   if (PSit <> 'AC') and (PSit <> 'CA') then
   begin
     AddLine(MErrores,' Error en Cve: ' + PCve +
                      '        Desc.: ' + PDesc +
                      '    Situación: ' + pSit);
     VLSalida := False;
   end;
   if vlLongTipoCar > 0 then
   begin
     QTipoCartera.Close;
     QTipoCartera.DatabaseName := Objeto.Apli.DataBaseName;
     QTipoCartera.SessionName  := Objeto.Apli.SessionName;
     QTipoCartera.ParamByName ('Cve_Cartera').AsString := PTipoCart;
     QTipoCartera.Open;

     if QTipoCartera.Eof or (QTipoCartera.FieldByName ('Total').AsInteger = 0) then
     begin
       AddLine(MErrores,' Error en Cve: ' + PCve +
                        '        Desc.: ' + PDesc +
                        ' Tipo Cartera: ' + PTipoCart);
       VLSalida := False;
     end;
   end;

   ValidaClasifica := VLSalida;
end;

Procedure TWCrCatMinimo.PegaInformacion(pLong : Integer);

var l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en Cve: '+ SAGta.Cells[1,l_Ciclo] +
                       '       Desc.: '+ SAGta.Cells[6,l_Ciclo]);
      SAGta.RemoveRow(l_Ciclo);
   end;

  Procedure DepuraLineas;  //Depura lineas del grid
  var  l_Ciclo   : Integer;
       vlLong    : Integer;
  Begin
     l_Ciclo := 0;
     while l_Ciclo <= SAGta.RowCount -1 do
     begin
           vlLong := Length(SAGta.Cells[1,l_Ciclo]);
        //columna en blanco
        SAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);
           if ((trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[2,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[3,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[4,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[5,l_Ciclo])+'<') = trim('><')) and
// </ RABA > ENE 2012 SE AGREGA EL CAMPO DE CVE_OPER_FACT PARA LA FACTURACIÓN
//               (trim('>'+trim(SAGta.Cells[6,l_Ciclo])+'<') = trim('><'))) then
               (trim('>'+trim(SAGta.Cells[6,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[7,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[8,l_Ciclo])+'<') = trim('><')) and
               (trim('>'+trim(SAGta.Cells[9,l_Ciclo])+'<') = trim('><'))
              ) then
// < RABA />
           Begin
                    limpiaRow(l_Ciclo);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if ((trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
                    (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))) then
           Begin
                    limpiaRow(l_Ciclo);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><')) then
           Begin
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if (trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><')) then
           Begin
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if (( vlLong = 0 ) OR ( vlLong > pLong )) then
           Begin
                    limpiaRow(l_Ciclo);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if not(ValidaClasifica(SAGta.Cells[1,l_Ciclo], SAGta.Cells[4,l_Ciclo],
                                       SAGta.Cells[5,l_Ciclo], SAGta.Cells[6,l_Ciclo],
                                       SAGta.Cells[8,l_Ciclo], SAGta.Cells[9,l_Ciclo])) then
           Begin
                    limpiaRow(l_Ciclo);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else
           begin
                l_Ciclo := l_Ciclo + 1;
           end;
       end;
   end;
//inicio
Begin
   lbTotalReg.Caption := '';
   pbRegistros.Max := 0;
   Try
      For l_Ciclo:= 1 to (SAGta.RowCount-1) do
         For l_Tempo:= 0 to (SAGta.ColCount-1) do
             SAGta.Cells[l_Tempo,l_Ciclo] := '';
         //end for
      //end for

      //Pega el archivo desde la memoria
// </ RABA > ENE 2012
//      if SAGta.ColCount = 7 then
      if SAGta.ColCount = 10 then
// < RABA />
         SAGta.RemoveCol(0);
      //end if
      SAGta.CopyFromClipboard;
   except
      ShowMessage('Problemas con la carga en BLOQUE!!!!');
      EXIT;
   end;//end try
   if SAGta.ColCount < 10 then
      SAGta.InsertCol(0)
   else if SAGta.ColCount > 10 then
        SAGta.ColCount := 10;
   //end if

   SAGta.ColWidths[0] := 25;
   SAGta.ColWidths[1] := 100;
   SAGta.ColWidths[2] := 80;
   SAGta.ColWidths[3] := 60;
   SAGta.ColWidths[4] := 80;
   SAGta.ColWidths[5] := 80;
   SAGta.ColWidths[6] := 130;//DESCR
// </ RABA > ENE 2012
   SAGta.ColWidths[7] := 80;
   SAGta.ColWidths[8] := 80;
// < RABA />
   //Pega Datos
   depuralineas;
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

Function TWCrCatMinimo.CargaDatos(var PMin,pVen,pSiti,pClasDest,pDesc,pPersJur, pCveOper, pTipoCart, pSit:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_CAT_MINIMO ( CVE_CAT_MINIMO,DESC_CAT_MINIMO,CVE_CAT_MIN_VEN,' +
//                                       ' CVE_SITI,CVE_CLASIF_DEST ,CVE_PER_JURIDICA) '+
                                       ' CVE_SITI,CVE_CLASIF_DEST ,CVE_PER_JURIDICA, CVE_OPER_FACT, CVE_CARTERA, SIT_CAT_MINIMO) '+
            'VALUES ( '+ #39 + pMin + #39 + ',' + #39 + pDesc + #39 + ','+ #39 + pVen + #39 + ','
                       + #39 + pSiti + #39 + ',' + #39 + pClasDest + #39 +
//                        ',' + #39 + pPersJur + #39 +' ) ';
                        ',' + #39 + pPersJur + #39 + ',' + #39 + pCveOper + #39 + ',' + #39 + pTipoCart + #39 + ',' + #39 + pSit + #39 + ' ) ';

   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;



procedure TWCrCatMinimo.Pegar1Click(Sender: TObject);
begin
    MErrores.Clear;
    PegaInformacion(20)
end;

procedure TWCrCatMinimo.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MErrores.Clear;
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(20);
   // if end;
end;

procedure TWCrCatMinimo.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLMin, VLVenc     : String;
          VLsiti, VLclasDest: String;
          VLDesc,vlPersJur  : String;
          vlTipoCart        : String;
          vlSituacion       : String;
          vlMsg             : String;
          vlTermina         : Boolean;
// </ RABA > ENE 2012
          vlCveOper         : String;
// < RABA />
begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then //Reempla Datos
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin //Borra Tabla
           RunSQL('DELETE CR_CAT_MINIMO',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLMin      := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLVenc     := UpperCase(SAGta.Cells[2,VLCtdorLine]);
              VLsiti     := UpperCase(SAGta.Cells[3,VLCtdorLine]);
              VLclasDest := UpperCase(SAGta.Cells[4,VLCtdorLine]);
              vlPersJur  := UpperCase(SAGta.Cells[5,VLCtdorLine]);
              VLDesc     := UpperCase(SAGta.Cells[6,VLCtdorLine]);
              vlCveOper  := UpperCase(SAGta.Cells[7,VLCtdorLine]); // RABA
              vlTipoCart := UpperCase(SAGta.Cells[8,VLCtdorLine]);
              vlSituacion:= UpperCase(SAGta.Cells[9,VLCtdorLine]);
//              If not(CargaDatos(VLMin,VLVenc,VLsiti,VLclasDest,VLDesc, vlPersJur)) then
              If not(CargaDatos(VLMin,VLVenc,VLsiti,VLclasDest,VLDesc, vlPersJur, vlCveOper, vlTipoCart, vlSituacion)) then  // RABA
              Begin
                 AddLine(MErrores,'Error Clave : '+ VLMin +'    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLMin + MSG_PREG_CONTINUA_PROCES ,
                    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 Begin
                    vlTermina := False;
                    messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                    exit;
                 end;
              end;
              pbRegistros.Position :=VLCtdorLine;
              vlTermina := True;
           end;//end for
           if vlTermina then
              ShowMessage(MSG_PROCESO_CARGA_OK);
           //end if
           messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
        end
        else
        Begin
           vlMsg := 'No se realizó el Proceso de carga';
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           AddLine(MErrores,vlMsg);
           messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
           ShowMessage(vlMsg);
           exit;
        end;
     end
     else if RGinformacion.ItemIndex = 1 then //se adiciona datos
     Begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
        For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
           VLMin      := UpperCase(SAGta.Cells[1,VLCtdorLine]);
           VLVenc     := UpperCase(SAGta.Cells[2,VLCtdorLine]);
           VLsiti     := UpperCase(SAGta.Cells[3,VLCtdorLine]);
           VLclasDest := UpperCase(SAGta.Cells[4,VLCtdorLine]);
           vlPersJur  := UpperCase(SAGta.Cells[5,VLCtdorLine]);
           VLDesc     := UpperCase(SAGta.Cells[6,VLCtdorLine]);
           vlCveOper  := UpperCase(SAGta.Cells[7,VLCtdorLine]); // RABA
           vlTipoCart := UpperCase(SAGta.Cells[8,VLCtdorLine]);
           vlSituacion:= UpperCase(SAGta.Cells[9,VLCtdorLine]);
//           If not(CargaDatos(VLMin,VLVenc,VLsiti,VLclasDest,VLDesc, vlPersJur)) then
           If not(CargaDatos(VLMin,VLVenc,VLsiti,VLclasDest,VLDesc, vlPersJur, vlCveOper, vlTipoCart, vlSituacion)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLMin + '    Desc. : '+ VLDesc );
              if MessageDlg( '¿Error en carga. Clave : ' + VLMin +  MSG_PREG_CONTINUA_PROCES ,
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
              Begin
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
   END;
end;

procedure TWCrCatMinimo.SAGtaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(SAGta,True,'',True);
end;

procedure TWCrCatMinimo.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgCVE_CLASIF_DEST.ItemIndex :=0;
   rgSIT_CAT_MINIMO.ItemIndex := 0;
   edCVE_CAT_MINIMO.SetFocus;
   MuestraHints;
end;

procedure TWCrCatMinimo.InterForma1DespuesModificar(Sender: TObject);
begin
   edCVE_CAT_MIN_VEN.SetFocus;
end;

procedure TWCrCatMinimo.edCVE_CAT_MINIMOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      Objeto.CVE_CAT_MINIMO.GetFromControl;
      if Objeto.CVE_CAT_MINIMO.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_CAT_MINIMO,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrCatMinimo.edCVE_CAT_MIN_VENExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_CAT_MIN_VEN,True,'',True);
end;

procedure TWCrCatMinimo.rgCVE_CLASIF_DESTExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_CLASIF_DEST,True,'',True);
end;

procedure TWCrCatMinimo.edDESC_CAT_MINIMOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_CAT_MINIMO,True,'',True);
end;

procedure TWCrCatMinimo.edCVE_SITIExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_SITI,True,'',True);
end;

Procedure TWCrCatMinimo.MuestraHints;
Begin
  edDESC_CAT_MINIMO.Hint := Objeto.DESC_CAT_MINIMO.AsString;
  edDESC_CAT_MINIMO.ShowHint := True;

  edDESC_CARTERA.Hint := Objeto.ClasifCart.DESC_CARTERA.AsString;
  edDESC_CARTERA.ShowHint := True;
End;

procedure TWCrCatMinimo.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrCatMinimo.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrCatMinimo.rgPERSONA_JURIDICAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgPERSONA_JURIDICA,True,'',True);
end;

procedure TWCrCatMinimo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrCatMinimo.edCVE_OPER_FACTExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_OPER_FACT,True,'',True);
end;

procedure TWCrCatMinimo.rgSIT_CAT_MINIMOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgSIT_CAT_MINIMO,True,'', True);
end;

procedure TWCrCatMinimo.edCVE_CARTERAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_CARTERA,True,'', True);
end;

procedure TWCrCatMinimo.btCVE_CARTERAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_CARTE',True,True) then
   begin
     Objeto.ClasifCart.ShowAll := True;
     if Objeto.ClasifCart.Busca then
     BEgin
        MuestraHints;
        InterForma1.NextTab(edCVE_CARTERA);
     end;
   end;
end;

procedure TWCrCatMinimo.ilCVE_CARTERACapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrCatMinimo.ilCVE_CARTERAEjecuta(Sender: TObject);
begin
   if Objeto.ClasifCart.FindKey([ilCVE_CARTERA.Buffer]) then
       InterForma1.NextTab(edCVE_CARTERA);
end;

end.

