// Sistema         : Clase de CR_TIPOS_RELACION
// Fecha de Inicio : 23/05/2005
// Función forma   : Clase de CR_TIPOS_RELACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrTipRel;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,

//Unidades Adicionales
IntParamCre,
IntGenCre, Menus;

Type
 TCrTipRel= class; 

  TWCrTiposRelacion=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    Label12: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    SAGta: TStringAlignGrid;
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
    lbCVE_TIPO_RELAC: TLabel;
    edCVE_TIPO_RELAC: TEdit;
    edDESC_C_TIPO_REL: TEdit;
    lbDESC_L_TIPO_REL: TLabel;
    edDESC_L_TIPO_REL: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAGtaExit(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure RGinformacionClick(Sender: TObject);
    procedure edCVE_TIPO_RELACExit(Sender: TObject);
    procedure edDESC_C_TIPO_RELExit(Sender: TObject);
    procedure edDESC_L_TIPO_RELExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTipRel;
    Function  CargaDatos(var Ptipo,pdescC, pdescL:string):boolean;
    Procedure MuestraHints;
    Procedure PegaInformacion(pLong : Integer);
end;
 TCrTipRel= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TIPO_RELAC           : TInterCampo;
        DESC_C_TIPO_REL          : TInterCampo;
        DESC_L_TIPO_REL          : TInterCampo;
        //CLASES ADICIONALES
        ParamCre                  : TParamCre;
        SAGta                     : TStringAlignGrid;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrTipRel.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIPO_RELAC :=CreaCampo('CVE_TIPO_RELAC',ftFloat,tsNinguno,tsNinguno,True);
                CVE_TIPO_RELAC.Caption:='Cve. Tipo Relación';
      DESC_C_TIPO_REL :=CreaCampo('DESC_C_TIPO_REL',ftString,tsNinguno,tsNinguno,True);
                DESC_C_TIPO_REL.Caption:='Descripción Corta';
      DESC_L_TIPO_REL :=CreaCampo('DESC_L_TIPO_REL',ftString,tsNinguno,tsNinguno,True);
                DESC_L_TIPO_REL.Caption:='Descripción Tipo Rel.';
      FKeyFields.Add('CVE_TIPO_RELAC');

      TableName := 'CR_TIPOS_RELACION'; 
      UseQuery := True; 
      HelpFile := 'IntCrTipRel.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTipRel.Destroy;
begin inherited;
end;


function TCrTipRel.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTiposRelacion;
begin
   W:=TWCrTiposRelacion.Create(Self);
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


Function TCrTipRel.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTiRe.it','F');
      Try if Active then begin T.Param(0,CVE_TIPO_RELAC.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_TIPOS_RELACION********************)
(*                                                                              *)
(*  FORMA DE CR_TIPOS_RELACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPOS_RELACION********************)

procedure TWCrTiposRelacion.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TIPO_RELAC.Control:=edCVE_TIPO_RELAC;
      Objeto.DESC_C_TIPO_REL.Control:=edDESC_C_TIPO_REL;
      Objeto.DESC_L_TIPO_REL.Control:=edDESC_L_TIPO_REL;

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrTiposRelacion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIPO_RELAC.Control:=nil;
      Objeto.DESC_C_TIPO_REL.Control:=nil;
      Objeto.DESC_L_TIPO_REL.Control:=nil;
   //Objeto
end;

procedure TWCrTiposRelacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTiposRelacion.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_TIPO_RELAC.SetFocus;
end;

procedure TWCrTiposRelacion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_C_TIPO_REL.SetFocus;
end;
(******************** CARGA DE DATOS EN BLOQUE *********************************)

function TWCrTiposRelacion.CargaDatos(var Ptipo, pdescC, pdescL: string): boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_TIPOS_RELACION (CVE_TIPO_RELAC,DESC_C_TIPO_REL,DESC_L_TIPO_REL) '+
            'VALUES ( '+ ptipo + ',' + SQLStr(pdescC) + ',' + SQLStr(pdescL) + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrTiposRelacion.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MErrores.Clear;
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(6);
     // if end;
end;

procedure TWCrTiposRelacion.SAGtaExit(Sender: TObject);
begin
     InterForma1.ValidaExit(SAGta,True,'',True);
end;

procedure TWCrTiposRelacion.btCargaClick(Sender: TObject);
var       vlCtdorLine       : Integer;
          vlTipo,vlDescC,vlDescL : String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then //Reemplaza la inofrmación
     begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin  //Borra datos existentes de la tabla en caso de reemplazar
           RunSQL('DELETE CR_TIPOS_RELACION',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              vlTipo  := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              vlDescC := UpperCase(VerificaCadena(SAGta.Cells[2,vlCtdorLine]));
              vlDescL := UpperCase(VerificaCadena(SAGta.Cells[3,vlCtdorLine]));
              If not(CargaDatos(vlTipo, vlDescC, vlDescL)) then //Carga los datos del grid a la tabla
              Begin //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'*** Error la Carga. Clave : '+ vlTipo + '    Desc. : '+ vlDescC );
                 if MessageDlg('¿Error en carga. Clave : ' + vlTipo + MSG_PREG_CONTINUA_PROCES ,
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 Begin
                    vlTermina := False;
                    messageIniFinProceso(MErrores,CFINAL);//Envia mensaje de fin de proceso
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
     else if RGinformacion.ItemIndex = 1 then //Adiciona datos no existentes en la base, no reemplaza
     Begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
        For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
           vlTipo  := UpperCase(SAGta.Cells[1,vlCtdorLine]);
           vlDescC := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
           vlDescL := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
           If not(CargaDatos(vlTipo, vlDescC, vlDescL)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ vlTipo + '    Desc. : '+ vlDescC );
              if MessageDlg('¿Error en carga. Clave : ' + vlTipo + MSG_PREG_CONTINUA_PROCES ,
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
              Begin
                 messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                 exit;
              end;
           end;
           pbRegistros.Position := vlCtdorLine;
           vlTermina := True;
        end; //end for
        if vlTermina then
           ShowMessage(MSG_PROCESO_CARGA_OK);
        //end if
        messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
     end;
   END;
end;

procedure TWCrTiposRelacion.Pegar1Click(Sender: TObject);
begin
   MErrores.Clear;
   PegaInformacion(6);
end;

procedure TWCrTiposRelacion.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear;
end;

procedure TWCrTiposRelacion.edCVE_TIPO_RELACExit(Sender: TObject);
var  vlSalida  : boolean;
     vlMsg     : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg     := '';
      Objeto.CVE_TIPO_RELAC.GetFromControl;
      if Objeto.CVE_TIPO_RELAC.AsString = '' then
      Begin
         vlSalida   := False;
         vlMsg := 'Favor de ingresar la clave de Tipo de Relación';
      end; //end if
      InterForma1.ValidaExit(edCVE_TIPO_RELAC,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrTiposRelacion.edDESC_C_TIPO_RELExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_C_TIPO_REL,True,'',True);
end;

procedure TWCrTiposRelacion.edDESC_L_TIPO_RELExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_TIPO_REL,True,'',True);
end;

procedure TWCrTiposRelacion.MuestraHints;
begin
      edDESC_C_TIPO_REL.Hint := Objeto.DESC_C_TIPO_REL.AsString;
      edDESC_C_TIPO_REL.ShowHint := True;
      edDESC_L_TIPO_REL.Hint := Objeto.DESC_L_TIPO_REL.AsString;
      edDESC_L_TIPO_REL.ShowHint := True;
end;

procedure TWCrTiposRelacion.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrTiposRelacion.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrTiposRelacion.PegaInformacion(pLong: Integer);
var l_Tempo, l_Ciclo :Integer;
   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en Cve: '+ SAGta.Cells[1,pRow] +
                       '       Desc.: '+ SAGta.Cells[2,pRow]);
      SAGta.RemoveRow(pRow);
   end;

   //Depura Lineas
   Procedure DepuraLineas;
   var  l_Ciclo   : Integer;
        vlLong    : Integer;
   Begin
      l_Ciclo := 0;
      while l_Ciclo <= SAGta.RowCount -1 do
      Begin
          vlLong    := Length(SAGta.Cells[1,l_Ciclo]);
          //columna en blanco
          SAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);
           if ((trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
               (trim('>'+trim(SAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))  and
               (trim('>'+trim(SAGta.Cells[2,l_Ciclo])+'<')  = trim('><'))  and
               (trim('>'+trim(SAGta.Cells[3,l_Ciclo])+'<')  = trim('><'))) then
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
   SAGta.ColWidths[0] := 20;
   SAGta.ColWidths[1] := 50;
   SAGta.ColWidths[2] := 250;
   SAGta.ColWidths[3] := 300;
   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

procedure TWCrTiposRelacion.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   // end if
end;

end.
