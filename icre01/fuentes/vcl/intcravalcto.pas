// Sistema         : Clase de CR_GRUPO_ECO
// Fecha de Inicio : 15/05/2003
// Función forma   : Clase de CR_GRUPO_ECO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrAvalCto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,Grids, Aligrid, Menus, InterEdit,

//CLASES ADICIONALES
IntParamCre, //Datos panel
IntGenCre, IntSGCtrl, IntLinkit, //Clase generica
IntCrCto      //CONTRATO
;

Type
 TCrAvalCto= class;

  TWCrAvalCto=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    lbDESC_TIPO_ACRED: TLabel;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MErrores: TMemo;
    Label5: TLabel;
    edPORCENTAJE: TInterEdit;
    SAGta: TStringAlignGrid;
    Label12: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    sgContratos: TSGCtrl;
    Label3: TLabel;
    btCONTRATO: TBitBtn;
    edID_CONTRATO: TInterEdit;
    ilIDCONTRATO: TInterLinkit;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    Bevel5: TBevel;
    Label4: TLabel;
    Bevel6: TBevel;
    Label6: TLabel;
    Label9: TLabel;
    Bevel7: TBevel;
    edNOM_AVAL: TEdit;
    edCVE_AVAL: TEdit;
    lbCVE_GRUPO_ECO: TLabel;
    rgTTIPO_AVAL: TRadioGroup;
    Bevel8: TBevel;
    Label10: TLabel;
    Bevel9: TBevel;
    Label11: TLabel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAGtaExit(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure RGinformacionClick(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edPORCENTAJEExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure sgContratosMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure MuestraRegistros(pCVE_AVAL: String);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure sgContratosCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure rgTTIPO_AVALExit(Sender: TObject);
    // --- INICIO --- ASOR --- MAYO 2016 ---
    procedure FormCreate(Sender: TObject);
    procedure pgAltaDatosChange(Sender: TObject);
    Procedure LimpiaDatos(Valor:Integer);
    // --- FIN --- ASOR --- MAYO 2016 ---

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrAvalCto;
    Procedure PegaInformacion(pLong : Integer);
    //Function  CargaDatos(var PCVE_AVAL,pID_CONTRATO, pPORCENTAJE :String):boolean;  // --- ASOR --- MAYO 2016 ---
    Function  CargaDatos(var PCVE_AVAL,pID_CONTRATO, pPORCENTAJE, pTIPOAVAL :String):boolean;    // --- ASOR --- MAYO 2016 ---
end;
 TCrAvalCto= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public

        { Public declarations }
        CVE_AVAL             : TInterCampo;
        NOM_AVAL             : TInterCampo;
        ID_CONTRATO          : TInterCampo;
        FOL_CONTRATO         : TInterCampo;
        PORCENTAJE           : TInterCampo;
        TIPO_AVAL            : TInterCampo;

        F_ALTA               : TInterCampo;
        CVE_USU_ALTA         : TInterCampo;
        F_MODIFICA           : TInterCampo;
        CVE_USU_MODIF        : TInterCampo;

        //
        ParamCre                 : TParamCre;
        SAGta                    : TStringAlignGrid;
        ContratoCre              : TCrCto; //Contrato Crédito
        vgCVE_AVAL           : String;
        vgNOM_AVAL           : String;
        vgTIPOAVAL           : String;   // --- ASOR --- MAYO 2016 ---
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    InternalBusca : Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAvalCto.Create( AOwner : TComponent );
begin Inherited;
      CVE_AVAL :=CreaCampo('CVE_AVAL',ftFloat,tsNinguno,tsNinguno,True);
                CVE_AVAL.Caption:='clave de la entidad descontadora';
      NOM_AVAL :=CreaCampo('NOM_AVAL',ftstring,tsNinguno,tsNinguno,False);
                NOM_AVAL.Caption:='Nombre aval';
      ID_CONTRATO     :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Descripción';
      PORCENTAJE :=CreaCampo('PORCENTAJE',ftFloat,tsNinguno,tsNinguno,True);
                PORCENTAJE.Caption:='Porcentaje';
      TIPO_AVAL :=CreaCampo('TIPO_AVAL',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_AVAL.Caption:='Tipo de Aval';
      With TIPO_AVAL do
      Begin  Size := 2;
             UseCombo := True;
             ComboLista.Add('0'); ComboDatos.Add('1');
             ComboLista.Add('1'); ComboDatos.Add('2');
             ComboLista.Add('2'); ComboDatos.Add('3');
      end;

      F_ALTA  := CreaCampo('F_ALTA',ftDatetime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha alta';
      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='usuario alta';
      F_MODIFICA   := CreaCampo('F_MODIFICA',ftDatetime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='fecha modificacion';
      CVE_USU_MODIF := CreaCampo('CVE_USU_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIF.Caption:='usuario modificacion';

      FKeyFields.Add('CVE_AVAL');
      FKeyFields.Add('ID_CONTRATO');

       FOL_CONTRATO := CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,false);
                FOL_CONTRATO.Caption:='folio del contrato';
      FOL_CONTRATO.AsInteger := 1; //siempre es 1

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      TableName := 'CR_AVAL_LINEA';
      UseQuery := True;
      HelpFile := 'IntCrGrupEco.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAvalCto.Destroy;
begin
   if ContratoCre <> nil then
      ContratoCre.free;
   inherited;
end;


function TCrAvalCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAvalCto;
begin
   W:=TWCrAvalCto.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo ;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrAvalCto.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRAVALLINEA.IT','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA                                                           *)
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TWCrAvalCto.MuestraRegistros(pCVE_AVAL: String);
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT CVE_AVAL,ID_CONTRATO,PORCENTAJE,TIPO_AVAL,CVE_USU_ALTA,F_ALTA,CVE_USU_MODIF,F_MODIFICA ' + coCRLF +
              '   FROM CR_AVAL_LINEA ' + coCRLF +
              '  WHERE CVE_AVAL = ' + pCVE_AVAL + coCRLF +
              ' ORDER BY ID_CONTRATO ' ;

     vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('CVE_AVAL').Visible := False;
            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 12;
            vlQry.FieldByName('PORCENTAJE').DisplayWidth := 8;
            vlQry.FieldByName('TIPO_AVAL').DisplayWidth := 9;
            vlQry.FieldByName('CVE_USU_ALTA').DisplayWidth := 10;
            vlQry.FieldByName('F_ALTA').DisplayWidth := 18;
            vlQry.FieldByName('CVE_USU_MODIF').DisplayWidth := 11;
            vlQry.FieldByName('F_MODIFICA').DisplayWidth := 18;

            sgContratos.AddQry( vlQry, True,True,-1,-1,-1,False);
        end
        else
        Begin
           sgContratos.Clear('NO HAY REGISTROS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
     end;
end;

procedure TWCrAvalCto.FormShow(Sender: TObject);
begin
     //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.CVE_AVAL.Control    := edCVE_AVAL;
     Objeto.ID_CONTRATO.Control := edID_CONTRATO;
     Objeto.NOM_AVAL.Control    := edNOM_AVAL;
     Objeto.PORCENTAJE.Control  := edPORCENTAJE;
     Objeto.TIPO_AVAL.Control   := rgTTIPO_AVAL;

end;

procedure TWCrAvalCto.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AVAL.Control:=nil;
      Objeto.NOM_AVAL.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.PORCENTAJE.Control := nil;
      Objeto.TIPO_AVAL.Control:=nil;
end;

procedure TWCrAvalCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAvalCto.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_AVAL.AsString := Objeto.vgCVE_AVAL;
   Objeto.NOM_AVAL.AsString := Objeto.vgNOM_AVAL;

   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;  ;

   sgContratos.Enabled := False;
   btCONTRATO.Enabled := True;

   edID_CONTRATO.Enabled := True;
   edID_CONTRATO.TabStop := True;
   edID_CONTRATO.SetFocus;

end;

procedure TWCrAvalCto.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIF.AsString := Objeto.Apli.Usuario;

   sgContratos.Enabled := False;

   edID_CONTRATO.Enabled := False;
   edID_CONTRATO.TabStop := False;
   edID_CONTRATO.Color   := clBtnFace;

   btCONTRATO.Enabled := False;
   edPORCENTAJE.SetFocus;
end;

//Pega los datos de excel al grid
procedure TWCrAvalCto.Pegar1Click(Sender: TObject);
begin
   PegaInformacion(10);
end;

procedure TWCrAvalCto.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
      PegaInformacion(4);
end;

procedure TWCrAvalCto.SAGtaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(SAGta,True,'',True);
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrAvalCto.CargaDatos(var PCVE_AVAL,pID_CONTRATO, pPORCENTAJE, pTIPOAVAL :String):boolean;
var VLSalida: Boolean;
    vlsql   : String;
    vlCorrecto : Integer;
Begin
//   vlsql := 'INSERT INTO CR_AVAL_LINEA (CVE_AVAL,ID_CONTRATO, PORCENTAJE,F_ALTA,CVE_USU_ALTA ) '+
//            '         VALUES ( '+ #39 + PCVE_AVAL + #39 + ',' + #39 + pID_CONTRATO + #39+ ',' + pPORCENTAJE + ',SYSDATE,' + #39 + Objeto.Apli.Usuario + #39 +') ';
   //--- INICIO --- ASOR --- MAYO 2016 ---
   vlCorrecto:= 0;
   VLSalida:= True;
   If pTIPOAVAL = '' Then
     begin
          pTIPOAVAL:= 'NULL';
          vlCorrecto:= 1;
     end
   else if  (StrToInt(pTIPOAVAL) > 0) and (StrToInt(pTIPOAVAL) < 4) then
             vlCorrecto:= 1;

   if vlCorrecto = 1 then
     begin
       Try
         vlsql := 'INSERT INTO CR_AVAL_LINEA (CVE_AVAL,ID_CONTRATO, PORCENTAJE, TIPO_AVAL,F_ALTA,CVE_USU_ALTA ) '+
                  '         VALUES ( '+ #39 + PCVE_AVAL + #39 + ',' + #39 + pID_CONTRATO + #39+ ',' + pPORCENTAJE +
                  ',' + pTIPOAVAL + ',SYSDATE,' + #39 + Objeto.Apli.Usuario + #39 +') ';
         VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
         CargaDatos := VLSalida;
       Except
         CargaDatos := False;
       End;
     end
   Else
      CargaDatos := False;
   //--- FIN --- ASOR --- MAYO 2016 ---
end;

(*****************************************************************)
procedure TWCrAvalCto.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLID_CONTRATO     : String;
          vlPORCENTAJE      : String;
          vlCVE_AVAL        : String;
          vlTipoAval        : String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin
 vlCVE_AVAL :=  Objeto.CVE_AVAL.AsString;
 IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[2,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then  //Reemplaza la información
     begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           //Borra datos existentes de la tabla en caso de reemplazar
           RunSQL('DELETE CR_AVAL_LINEA WHERE CVE_AVAL = '+vlCVE_AVAL,objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLID_CONTRATO := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              vlPORCENTAJE := UpperCase(SAGta.Cells[2,VLCtdorLine]);
              vlTipoAval := UpperCase(SAGta.Cells[3,VLCtdorLine]);  // --- ASOR --- MAYO 2016 ---
              //If not(CargaDatos(vlCVE_AVAL, VLID_CONTRATO, vlPORCENTAJE)) then  //Carga los datos del grid a la tabla
              If not(CargaDatos(vlCVE_AVAL, VLID_CONTRATO, vlPORCENTAJE, vlTipoAval)) then  //Carga los datos del grid a la tabla // --- ASOR --- MAYO 2016 ---
              Begin   //Muestra errores que se tienen en la carga
                 //AddLine(MErrores,'Error Clave : '+ VLID_CONTRATO + ' , Porcentaje: '+ vlPORCENTAJE );  // --- ASOR --- MAYO 2016 ---
                 AddLine(MErrores,'Error Clave : '+ VLID_CONTRATO + ', Porcentaje '+ vlPORCENTAJE + ', Tipo de Aval :  ' + vlTipoAval);  // --- ASOR --- MAYO 2016 ---
                 if MessageDlg('¿Error en carga. Clave : ' + VLID_CONTRATO + MSG_PREG_CONTINUA_PROCES ,
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 Begin
                    vlTermina := False;
                    messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                    exit;
                 end;
              end;
              pbRegistros.Position :=VLCtdorLine;
              vlTermina := True;
           end;
           if vlTermina then
              ShowMessage(MSG_PROCESO_CARGA_OK);
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
     else if RGinformacion.ItemIndex = 1 then //Adiciona datos no existentes en la base, no reemplaza
     Begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
        For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
              VLID_CONTRATO := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              vlPORCENTAJE := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
              vlTipoAval := UpperCase(SAGta.Cells[3,VLCtdorLine]);  // --- ASOR --- MAYO 2016 ---
           //If not(CargaDatos(vlCVE_AVAL, VLID_CONTRATO, vlPORCENTAJE)) then  // --- ASOR --- MAYO 2016 ---
           If not(CargaDatos(vlCVE_AVAL, VLID_CONTRATO, vlPORCENTAJE, vlTipoAval)) then  //Carga los datos del grid a la tabla // --- ASOR --- MAYO 2016 ---
           Begin
              //AddLine(MErrores,'Error Clave : '+ VLID_CONTRATO + ', Porcentaje '+ vlPORCENTAJE );  // --- ASOR --- MAYO 2016 ---
              AddLine(MErrores,'Error Clave : '+ VLID_CONTRATO + ', Porcentaje '+ vlPORCENTAJE + ', Tipo de Aval :  ' + vlTipoAval);  // --- ASOR --- MAYO 2016 ---
              if MessageDlg('¿Error en carga. Clave : ' + VLID_CONTRATO + MSG_PREG_CONTINUA_PROCES ,
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

 //damos refresh al grid
 MuestraRegistros(Objeto.CVE_AVAL.AsString);
 if sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row] <> CNULL then
     Objeto.FindKey([ sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row],
                    sgContratos.CellStr['ID_CONTRATO',sgContratos.SG.Row]]);

end;
procedure TWCrAvalCto.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear
end;


procedure TWCrAvalCto.edID_CONTRATOExit(Sender: TObject);
var
        vlMsg :String;
        vlSalida : boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      If edID_CONTRATO.Text = '' then
      Begin
         vlMsg := 'Favor de indicar el Contrato';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edID_CONTRATO,vlSalida,vlMsg,True);
   End;
end;


procedure TWCrAvalCto.PegaInformacion(pLong : Integer);
var l_Tempo, l_Ciclo :Integer;
   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en No. Línea: '+ SAGta.Cells[1,pRow] + ', % : ' + SAGta.Cells[2,pRow] + ', Tipo Aval :  ' + SAGta.Cells[3,pRow]  );
      SAGta.RemoveRow(pRow);
   end;

   //Depura Lineas
   Procedure DepuraLineas;
   var  l_Ciclo   : Integer;
        vlLong    : Integer;
        vlPorcentaje : String;
   Begin
      l_Ciclo := 0;
      while l_Ciclo <= SAGta.RowCount -1 do
      Begin
          vlLong    := Length(SAGta.Cells[1,l_Ciclo]);
          vlPorcentaje := Trim(SAGta.Cells[2,l_Ciclo]);
          //columna en blanco
          SAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);
           if ((trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
               (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))) then
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
           else if not IsFloat(vlPorcentaje) then
           Begin
                    limpiaRow(l_Ciclo);
                    AddLine(MErrores,' en el porcentaje : '+ vlPorcentaje);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else
           begin
                l_Ciclo := l_Ciclo + 1;
           end;
       end;
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
   if SAGta.ColCount = 4 then
      SAGta.RemoveCol(0);
   //end if
   SAGta.CopyFromClipboard;
   except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
   end;
   if SAGta.ColCount < 4 then
      SAGta.InsertCol(0)
   else if SAGta.ColCount > 4 then
        SAGta.ColCount := 4;
   //end if
   SAGta.ColWidths[0] := 60;
   SAGta.ColWidths[1] := 150;
   SAGta.ColWidths[2] := 90;
   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
   try
       SAGta.ColWidths[3] := 110;
   except
   end; 
end;


procedure TWCrAvalCto.edPORCENTAJEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   vlMsg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PORCENTAJE.GetFromControl;
      if Objeto.PORCENTAJE.AsFloat < 0 then
      Begin
         vlMsg:= 'El porcentaje autorizado no debe ser negativo';
         vlSalida   := False;
         ShowMessage(vlMsg);
      end;
   end;
   InterForma1.ValidaExit(edPORCENTAJE,vlSalida,vlMsg,True);
end;

procedure TWCrAvalCto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //--- registro nuevo ----
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
        Realizado := True;
        //valido el contrato
        if   (trim(edID_CONTRATO.Text) = '0') or (trim(edID_CONTRATO.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el Contrato Correspondiente.');
        end;
        //valido el porcentaje
        if   (trim(edPORCENTAJE.Text) = '0') or (trim(edPORCENTAJE.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el porcentaje');
        end;
        //valido el tipo de aval
        if   rgTTIPO_AVAL.ItemIndex = -1 then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el tipo de aval');
         //rgTTIPO_AVAL.ItemIndex:= 0;
        end;
      end
      else Realizado := False;
   end
   else
   Begin
   //--- Modificacion de registro ---
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
           Realizado := True;
           //--- INICIO --- ASOR --- MAYO 2016 ---
           if   rgTTIPO_AVAL.ItemIndex = -1 then
             begin
                Realizado := False;
                ShowMessage('Es necesario ingresar el tipo de aval');
           end;
           //--- FIN --- ASOR --- MAYO 2016 ---
        end
      else Realizado := False;
   end
end;

procedure TWCrAvalCto.btCONTRATOClick(Sender: TObject);
begin
   //BUSCADOR DE LA CLASE CONTRATO CREDITO
   Objeto.ContratoCre.ShowAll := True;
   if Objeto.ContratoCre.Busca then
   begin
      InterForma1.NextTab(btCONTRATO);
   end;
end;

procedure TWCrAvalCto.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then
   begin
      InterForma1.NextTab(edID_CONTRATO);
   end;
end;

procedure TWCrAvalCto.InterForma1DespuesShow(Sender: TObject);
begin
 IF Objeto.CVE_AVAL.AsString <> CNULL then
   Begin
      MuestraRegistros(Objeto.CVE_AVAL.AsString);
      if sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row] <> CNULL then
         Objeto.FindKey([ sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row],
                       sgContratos.CellStr['ID_CONTRATO',sgContratos.SG.Row]]);
   end;
end;

procedure TWCrAvalCto.InterForma1DespuesAceptar(Sender: TObject);
begin
      MuestraRegistros(Objeto.CVE_AVAL.AsString);
      if sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row] <> CNULL then
        Objeto.FindKey([ sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row],
                       sgContratos.CellStr['ID_CONTRATO',sgContratos.SG.Row]]);
      sgContratos.Enabled := True;
end;

procedure TWCrAvalCto.sgContratosMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  IF sgContratos.CellStr['CVE_AVAL',ToIndex] <> CNULL THEN
   Begin
      Objeto.FindKey([ sgContratos.CellStr['CVE_AVAL',ToIndex],
                       sgContratos.CellStr['ID_CONTRATO',ToIndex]]);
   end
end;

procedure TWCrAvalCto.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.CVE_AVAL.AsString := Objeto.vgCVE_AVAL;
   Objeto.NOM_AVAL.AsString := Objeto.vgNOM_AVAL;

     if sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row] <> CNULL then
        MuestraRegistros(Objeto.CVE_AVAL.AsString);
        Objeto.FindKey([ sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row],
                         sgContratos.CellStr['ID_CONTRATO',sgContratos.SG.Row]]);
end;

procedure TWCrAvalCto.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show:=(InterForma1.CanEdit);
end;

procedure TWCrAvalCto.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
        Objeto.vgCVE_AVAL := Objeto.CVE_AVAL.AsString;
        Objeto.vgNOM_AVAL := Objeto.NOM_AVAL.AsString;
        InterForma1.BtnModificar.Enabled:= False;

end;

procedure TWCrAvalCto.sgContratosCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
var  vlCadTotal : String;
begin
    vlCadTotal := '1';
end;

procedure TWCrAvalCto.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
        Objeto.vgCVE_AVAL  := Objeto.CVE_AVAL.AsString;
        Objeto.vgNOM_AVAL := Objeto.NOM_AVAL.AsString;
end;

procedure TWCrAvalCto.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
   Begin
        MuestraRegistros(Objeto.CVE_AVAL.AsString);
        Objeto.FindKey([ sgContratos.CellStr['CVE_AVAL',sgContratos.SG.Row],
                       sgContratos.CellStr['ID_CONTRATO',sgContratos.SG.Row]]);
   End;
end;

procedure TWCrAvalCto.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
        Objeto.vgCVE_AVAL := Objeto.CVE_AVAL.AsString;
        Objeto.vgNOM_AVAL := Objeto.NOM_AVAL.AsString;

        If Objeto.TIPO_AVAL.AsString = '' then
        rgTTIPO_AVAL.ItemIndex:= 0;
end;

procedure TWCrAvalCto.InterForma1DespuesCancelar(Sender: TObject);
begin
    sgContratos.Enabled := true;
end;

procedure TWCrAvalCto.rgTTIPO_AVALExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgTTIPO_AVAL,True,'',True);
end;

procedure TWCrAvalCto.FormCreate(Sender: TObject);
begin
    SAGta.ColWidths[0] := 60;
    SAGta.ColWidths[1] := 150;
    SAGta.ColWidths[2] := 90;
    SAGta.ColWidths[3] := 110;
    pgAltaDatos.ActivePage:= TabSheet1;
end;

procedure TWCrAvalCto.pgAltaDatosChange(Sender: TObject);
begin
     if  pgAltaDatos.ActivePage = TabSheet1 then
         LimpiaDatos(1)
     else
         LimpiaDatos(2);
end;

Procedure TWCrAvalCto.LimpiaDatos(Valor:Integer);
var vli, vli2: integer;
begin
  if Valor = 1 then
    begin
         //--- limpia el Grid ---
        For vli:= 0 to SAGta.RowCount-1 do
           for vli2:= 0 to SAGta.ColCount -1 do
               SAGta.Cells[vli2, vli]:= '';
         //--- limpia componentes de pantalla ---
         MErrores.Clear;
         RGinformacion.ItemIndex:= 0;
         SAGta.RowCount:= 1;
         pbRegistros.Position:= 0;
         lbTotalReg.Caption:= '0';
         InterForma1.BtnNuevo.Enabled:= True;
         InterForma1.BtnBuscar.Enabled:= True;
         InterForma1.BtnEliminar.Enabled:= True;
         InterForma1.BtnModificar.Enabled:= True;
    end
   else
    begin
        InterForma1.BtnNuevo.Enabled:= false;
        InterForma1.BtnModificar.Enabled:= false;
        InterForma1.BtnEliminar.Enabled:= false;
        InterForma1.BtnAceptar.Enabled:= false;
        InterForma1.BtnCancelar.Enabled:= false;
        InterForma1.BtnBuscar.Enabled:= false;
   end;
end;

end.
