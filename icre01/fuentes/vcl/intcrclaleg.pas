// Sistema         : Clase de CR_CLAS_LEGAL
// Fecha de Inicio : 28/05/2003
// Función forma   : Clase de CR_CLAS_LEGAL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrClaLeg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, Menus,

//Unidades Adicionales
IntParamCre, IntGenCre;

Type
 TCrClaLeg= class;

  TWCrClasLegal=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    lbDESC_TIPO_ACRED: TLabel;
    lbCVE_GRUPO_ECO: TLabel;
    edCVE_CLAS_LEGAL: TEdit;
    edDESC_CLAS_LEGAL: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    chbB_EXCLUYE_CAT: TCheckBox;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    Label12: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    SAGta: TStringAlignGrid;
    MErrores: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure RGinformacionClick(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure edCVE_CLAS_LEGALExit(Sender: TObject);
    procedure edDESC_CLAS_LEGALExit(Sender: TObject);
    procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
              var Realizado: Boolean);
    // --- INICIO --- ASOR --- MAYO 2016 ---
    procedure chbB_EXCLUYE_CATExit(Sender: TObject);
    procedure PegaInformacion(PPSAGta: TStringAlignGrid; PPTotalReg : Tlabel; PPRegistros : TProgressBar;
                              PMErrores: TMemo; pLong : Integer);
    procedure pgAltaDatosChange(Sender: TObject);
    procedure LimpiaDatos(Valor:Integer);
    procedure FormCreate(Sender: TObject);
    // --- FIN --- ASOR --- MAYO 2016 ---
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrClaLeg;
    Function CargaDatos(var PClasif, pdesc, PBExcCAT:string):boolean; // ASOR -- MAYO 2016 --
end;
 TCrClaLeg= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CLAS_LEGAL           : TInterCampo;
        DESC_CLAS_LEGAL          : TInterCampo;
        B_EXCLUYE_CAT            : TInterCampo;      // --- ASOR --- MAYO 2016 ---

        ParamCre                 : TParamCre;
        SAGta                    : TStringAlignGrid;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;
implementation
//Uses RepMon;

{$R *.DFM}
constructor TCrClaLeg.Create( AOwner : TComponent );
begin Inherited;
      CVE_CLAS_LEGAL :=   CreaCampo('CVE_CLAS_LEGAL',ftString,tsNinguno,tsNinguno,True);
      CVE_CLAS_LEGAL.Caption:=      'Cve. Clas. Legal';
      DESC_CLAS_LEGAL :=  CreaCampo('DESC_CLAS_LEGAL',ftString,tsNinguno,tsNinguno,True);
      DESC_CLAS_LEGAL.Caption:=     'Descripción Clas Legal';
      //-- INICIO --- ASOR --- MAYO 2016 ----
      B_EXCLUYE_CAT:=     CreaCampo('B_EXCLUYE_CAT', ftString, tsNinguno, tsNinguno, True);
      B_EXCLUYE_CAT.Caption:=       'Excluye CAT R04C';
      //-- FIN --- ASOR --- MAYO 2016 ----

      FKeyFields.Add('CVE_CLAS_LEGAL');

      TableName := 'CR_CLAS_LEGAL';
      UseQuery := True;
      HelpFile := 'IntCrClaLeg.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCrClaLeg.Destroy;
begin inherited;
end;

function TCrClaLeg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrClasLegal;
begin
   W:=TWCrClasLegal.Create(Self);
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

Function TCrClaLeg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrClLe.it','S');
      Try if Active then begin T.Param(0,CVE_CLAS_LEGAL.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CLAS_LEGAL********************)
(*                                                                              *)
(*  FORMA DE CR_CLAS_LEGAL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CLAS_LEGAL********************)

procedure TWCrClasLegal.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_CLAS_LEGAL.Control:=edCVE_CLAS_LEGAL;
      Objeto.DESC_CLAS_LEGAL.Control:=edDESC_CLAS_LEGAL;
      Objeto.B_EXCLUYE_CAT.Control:=chbB_EXCLUYE_CAT; //--- ASOR --- MAYO 2016 ---
      InterForma1.BtnNuevo.Enabled:= true;
      InterForma1.BtnModificar.Enabled:= False;
      
end;

procedure TWCrClasLegal.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CLAS_LEGAL.Control:=nil;
      Objeto.DESC_CLAS_LEGAL.Control:=nil;
      Objeto.B_EXCLUYE_CAT.Control:=nil;  // --- ASOR --- MAYO 2016 ---
end;

procedure TWCrClasLegal.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrClasLegal.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_CLAS_LEGAL.SetFocus;
end;

procedure TWCrClasLegal.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_CLAS_LEGAL.SetFocus;
end;

Function TWCrClasLegal.CargaDatos(var PClasif, pdesc, PBExcCAT:string):boolean;
var VLSalida: Boolean;
    vlsql : String;
Begin
   //--- INICIO --- ASOR --- MAYO 2016 ----
//   vlsql := 'INSERT INTO CR_CLAS_LEGAL (CVE_CLAS_LEGAL,DESC_CLAS_LEGAL) '+
//            'VALUES ( '+ #39 + pClasif + #39 + ',' + #39 + pdesc + #39 + ') ';
   vlsql := 'INSERT INTO CR_CLAS_LEGAL (CVE_CLAS_LEGAL,DESC_CLAS_LEGAL, B_EXCLUYE_CAT) '+
            'VALUES ( '+ #39 + pClasif + #39 + ',' + #39 + pdesc + #39 + ', ''' + PBExcCAT +''' ) ';
   //--- FIN --- ASOR --- MAYO 2016 ----
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrClasLegal.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLClasif, VLDesc, VLBExcCAT  : String;
          vlMsg             : String;
          vlTermina         : Boolean;
Begin
   //--- INICIO --- ASOR --- MAYO 2016 ----
// IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
//   IF Trim(SAGta.Cells[2,0]) <> CNULL THEN
 IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[2,0]) <> CNULL THEN
     IF Trim(SAGta.Cells[3,0]) <> CNULL THEN
   //--- FIN --- ASOR --- MAYO 2016 ----
       BEGIN
          vlTermina := False;
          if RGinformacion.ItemIndex = 0 then //Se reemplazan los datos
          Begin
             MErrores.Clear;
             if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
             Begin//Se borran los datos de la tabla
                RunSQL('DELETE CR_CLAS_LEGAL',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
                messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
                For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
                Begin
                   VLClasif := UpperCase(SAGta.Cells[1,VLCtdorLine]);
                   VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
                   VLBExcCAT := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine])); //--- ASOR --- MAYO 2016 ---
                   If not(CargaDatos(VLClasif, VLDesc, VLBExcCAT)) then
                   Begin//Muestra los errores que tuvo la carga
                      //AddLine(MErrores,'Error Clave : '+ VLClasif + '    Desc. : '+ VLDesc );
                      AddLine(MErrores,'Error Clave : '+ VLClasif + '    Desc. : '+ VLDesc + '   Excluye del CAT de contratos : ''' + VLBExcCAT + ''' '); //--- ASOR --- MAYO 2016 ---
                      if MessageDlg('¿Error en carga. Clave : ' + VLClasif + MSG_PREG_CONTINUA_PROCES ,
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
          else if RGinformacion.ItemIndex = 1 then//se adicionan datos extras, no reemplaza
          Begin
             MErrores.Clear;
             messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
             For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
             Begin
                VLClasif := UpperCase(SAGta.Cells[1,VLCtdorLine]);
                VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
                VLBExcCAT := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine])); //--- ASOR --- MAYO 2016 ---
                If not(CargaDatos(VLClasif, VLDesc, VLBExcCAT)) then
                Begin
                   //AddLine(MErrores,'Error Clave : '+ VLClasif + '    Desc. : '+ VLDesc);
                   AddLine(MErrores,'Error Clave : '+ VLClasif + '    Desc. : '+ VLDesc + '   Excluye del CAT de contratos : ''' + VLBExcCAT + ''' ');    //--- ASOR --- MAYO 2016 ---
                   if MessageDlg('¿Error en carga. Clave : ' + VLClasif + MSG_PREG_CONTINUA_PROCES ,
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
     LimpiaDatos(2);
end;

procedure TWCrClasLegal.Pegar1Click(Sender: TObject);
begin
    MErrores.Clear;
    // --- INICIO --- ASOR --- MAYO 2016 ---
    //PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,2); //Procedimiento extraido de IntGenCre
    PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,4); //Procedimiento extraido de IntGenCre
    // --- FIN --- ASOR --- MAYO 2016 ---
end;

procedure TWCrClasLegal.RGinformacionClick(Sender: TObject);
begin
    MErrores.Clear;
end;

procedure TWCrClasLegal.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MErrores.Clear;
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
          // --- INICIO --- ASOR --- MAYO 2016 ---
          //PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,2); //Procedimiento extraido de IntGenCre
          PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,4); //Procedimiento extraido de IntGenCre
          // --- FIN --- ASOR --- MAYO 2016 ---

end;

procedure TWCrClasLegal.edCVE_CLAS_LEGALExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMesg     := '';
      Objeto.CVE_CLAS_LEGAL.GetFromControl;
      if Objeto.CVE_CLAS_LEGAL.AsString = '' then
         VlSalida   := False;

      InterForma1.ValidaExit(edCVE_CLAS_LEGAL,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrClasLegal.edDESC_CLAS_LEGALExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_CLAS_LEGAL,True,'',True);
end;

Procedure TWCrClasLegal.MuestraHints;
Begin
      edDESC_CLAS_LEGAL.Hint := Objeto.DESC_CLAS_LEGAL.AsString;
      edDESC_CLAS_LEGAL.ShowHint := True;
      // --- INICIO --- ASOR --- MAYO 2016 ---
      chbB_EXCLUYE_CAT.Hint:= Objeto.B_EXCLUYE_CAT.AsString;
      chbB_EXCLUYE_CAT.ShowHint := True;
      // --- FIN --- ASOR --- MAYO 2016 ---
End;

procedure TWCrClasLegal.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrClasLegal.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;

 // --- INICIO --- ASOR --- MAYO 2106 ---
 if edCVE_CLAS_LEGAL.Text <> '' then
   begin
        InterForma1.BtnNuevo.Enabled:= true;
        InterForma1.BtnModificar.Enabled:= true;
 end
 else
 begin
        InterForma1.BtnNuevo.Enabled:= true;
        InterForma1.BtnModificar.Enabled:= False;
 end;
 // --- INICIO --- ASOR --- MAYO 2106 ---


end;

procedure TWCrClasLegal.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   // -- Nuevo Registro ---
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
   // -- Modifica Registro ---
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrClasLegal.chbB_EXCLUYE_CATExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chbB_EXCLUYE_CAT,True,'',True); // --- ASOR --- MAYO 2016 ---
end;

// ------------ COPIA DE DATOS DE EXCEL AL GRID -----------------------
Procedure TWCrClasLegal.PegaInformacion(PPSAGta: TStringAlignGrid; PPTotalReg : Tlabel; PPRegistros : TProgressBar;
                                        PMErrores: TMemo; pLong : Integer);
var l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   Begin
      PMErrores.Lines.Add('Error en Cve: ' + PPSAGta.Cells[1,pRow] +
                          ',       Desc.: ' + PPSAGta.Cells[2,pRow] +
                          ', Excluye CAT de contrato: ' + PPSAGta.Cells[3,pRow] ); // --- ASOR --- MAYO 2016 ---
      PPSAGta.RemoveRow(l_Ciclo);
   end;

   Procedure DepuraLineas;
   var  l_Ciclo   : Integer;
        vlLong    : Integer;
   Begin
       l_Ciclo := 0;
       while l_Ciclo <= PPSAGta.RowCount -1 do
         begin
           vlLong := Length(PPSAGta.Cells[1,l_Ciclo]);
           //columna en blanco
           PPSAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);

           if ((trim('>'+trim(PPSAGta.Cells[0,l_Ciclo])+'<') = trim('><'))  and
               (trim('>'+trim(PPSAGta.Cells[1,l_Ciclo])+'<') = trim('><'))  and
               (trim('>'+trim(PPSAGta.Cells[2,l_Ciclo])+'<') = trim('><'))) then
           Begin
                    limpiaRow(l_Ciclo);
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if ((trim('>'+trim(PPSAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
                    (trim('>'+trim(PPSAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))) then
           Begin
                    limpiaRow(l_Ciclo);
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if (trim('>'+Trim(PPSAGta.Cells[1,l_Ciclo])+'<')  = trim('><')) then
           Begin
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if (trim('>'+trim(PPSAGta.Cells[0,l_Ciclo])+'<')  = trim('><')) then
           Begin
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if (( vlLong = 0 ) OR ( vlLong > pLong )) then
                Begin
                    limpiaRow(l_Ciclo);
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
                end
                else
                  begin
                     l_Ciclo := l_Ciclo + 1;
                end;
       end;
   end;

Begin
       PPTotalReg.Caption := '';
       Try
         For l_Ciclo:= 1 to (PPSAGta.RowCount-1) do
           begin
              For l_Tempo:= 0 to (PPSAGta.ColCount-1) do
                 begin
                    PPSAGta.Cells[l_Tempo,l_Ciclo] := '';
              end;
         end;
         // ---  ASOR --- MAYO 2016 --- SE LIMITA EL GRID A ColCount A 4 COLUMNAS, LA PRIMERA COLUMNA ES EL NUMERO DE REGISTRO ---
         if PPSAGta.ColCount = 4 then
            PPSAGta.RemoveCol(0);

         PPSAGta.CopyFromClipboard;
       except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
       end;

       if PPSAGta.ColCount < 4 then
          PPSAGta.InsertCol(0)
       else if PPSAGta.ColCount > 4 then
              PPSAGta.ColCount := 4;

       PPSAGta.ColWidths[0] := 40;
       PPSAGta.ColWidths[1] := 40;
       PPSAGta.ColWidths[2] := 350;
       PPSAGta.ColWidths[3] := 80;
       depuralineas;

       if (PPSAGta.Cells[0,0] <> '') and ( PPSAGta.RowCount >= 1 ) then
          Begin
            PPTotalReg.Caption := IntToStr(PPSAGta.RowCount);
            PPRegistros.Max := PPSAGta.RowCount - 1;
       end;
end;

procedure TWCrClasLegal.pgAltaDatosChange(Sender: TObject);
begin
     if  pgAltaDatos.ActivePage = TabSheet1 then
         LimpiaDatos(1)
     else
         LimpiaDatos(2);
end;

Procedure TWCrClasLegal.LimpiaDatos(Valor:Integer);
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
         if edCVE_CLAS_LEGAL.Text <> '' then InterForma1.BtnModificar.Enabled:= True;
    end
   else
    begin
        InterForma1.BtnNuevo.Enabled:= false;
        InterForma1.BtnModificar.Enabled:= false;
        InterForma1.BtnAceptar.Enabled:= false;
        InterForma1.BtnCancelar.Enabled:= false;
        InterForma1.BtnBuscar.Enabled:= false;
   end;
end;

procedure TWCrClasLegal.FormCreate(Sender: TObject);
begin
      pgAltaDatos.ActivePage:= TabSheet1;
end;

end.
