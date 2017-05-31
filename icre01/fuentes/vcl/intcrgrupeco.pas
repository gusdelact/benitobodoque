// Sistema         : Clase de CR_GRUPO_ECO
// Fecha de Inicio : 15/05/2003
// Función forma   : Clase de CR_GRUPO_ECO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrGrupEco;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,Grids, Aligrid, Menus, InterEdit,

//CLASES ADICIONALES
IntParamCre, //Datos panel
IntGenCre //Clase generica
;

Type
 TCrGrupEco= class;

  TWCrGrupoEco=Class(TForm)
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
    lbCVE_GRUPO_ECO: TLabel;
    edCVE_GRUPO_ECO: TEdit;
    edDESC_AGRUPO_ECO: TEdit;
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
    edIMP_MAX_OPERA: TInterEdit;
    SAGta: TStringAlignGrid;
    Label1: TLabel;
    Bevel4: TBevel;
    Label12: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
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
    procedure edCVE_GRUPO_ECOExit(Sender: TObject);
    procedure edDESC_AGRUPO_ECOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edIMP_MAX_OPERAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrGrupEco;
    Procedure PegaInformacion(pLong : Integer);
    Function  CargaDatos(var Pcvegpo,pdesc, pImpMaxAutor:string):boolean;
end;
 TCrGrupEco= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_GRUPO_ECO            : TInterCampo;
        DESC_AGRUPO_ECO          : TInterCampo;
        IMP_MAX_AUTOR            : TInterCampo;
        //
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


constructor TCrGrupEco.Create( AOwner : TComponent );
begin Inherited;
      CVE_GRUPO_ECO :=CreaCampo('CVE_GRUPO_ECO',ftString,tsNinguno,tsNinguno,True);
                CVE_GRUPO_ECO.Caption:='Grupo Económico';
      DESC_AGRUPO_ECO :=CreaCampo('DESC_GRUPO_ECO',ftString,tsNinguno,tsNinguno,True);
                DESC_AGRUPO_ECO.Caption:='Descripción';
      IMP_MAX_AUTOR :=CreaCampo('IMP_MAX_AUTOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_AUTOR.Caption:='Imp. Máximo Autorizado';
      FKeyFields.Add('CVE_GRUPO_ECO');

      TableName := 'CR_GRUPO_ECO';
      UseQuery := True;
      HelpFile := 'IntCrGrupEco.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGrupEco.Destroy;
begin inherited;
end;


function TCrGrupEco.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGrupoEco;
begin
   W:=TWCrGrupoEco.Create(Self);
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


Function TCrGrupEco.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGrEc.it','S');
      Try if Active then begin T.Param(0,CVE_GRUPO_ECO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_GRUPO_ECO********************)
(*                                                                              *)
(*  FORMA DE CR_GRUPO_ECO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GRUPO_ECO********************)

procedure TWCrGrupoEco.FormShow(Sender: TObject);
begin
     //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_GRUPO_ECO.Control:=edCVE_GRUPO_ECO;
      Objeto.DESC_AGRUPO_ECO.Control:=edDESC_AGRUPO_ECO;
      Objeto.IMP_MAX_AUTOR.Control := edIMP_MAX_OPERA;
end;

procedure TWCrGrupoEco.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GRUPO_ECO.Control:=nil;
      Objeto.DESC_AGRUPO_ECO.Control:=nil;
      Objeto.IMP_MAX_AUTOR.Control := nil;
   //Objeto
end;

procedure TWCrGrupoEco.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGrupoEco.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_GRUPO_ECO.SetFocus;
end;

procedure TWCrGrupoEco.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_AGRUPO_ECO.SetFocus;
end;

//Pega los datos de excel al grid
procedure TWCrGrupoEco.Pegar1Click(Sender: TObject);
begin
   PegaInformacion(6);
end;

procedure TWCrGrupoEco.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(6);
   // if end;
end;

procedure TWCrGrupoEco.SAGtaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(SAGta,True,'',True);
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrGrupoEco.CargaDatos(var Pcvegpo,pdesc, pImpMaxAutor :string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_GRUPO_ECO (CVE_GRUPO_ECO,   DESC_GRUPO_ECO, IMP_MAX_AUTOR ) '+
            '         VALUES ( '+ #39 + pcvegpo + #39 + ',' + #39 + pdesc + #39+ ',' + pImpMaxAutor + ') ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

(*****************************************************************)
procedure TWCrGrupoEco.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLCvegpo, VLDesc  : String;
          vlImpMaxAutor     : String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     VLCvegpo := '';
     VLDesc   := '';
     if RGinformacion.ItemIndex = 0 then  //Reemplaza la información
     begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           //Borra datos existentes de la tabla en caso de reemplazar
           RunSQL('DELETE CR_GRUPO_ECO',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLCvegpo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
              vlImpMaxAutor := SAGta.Cells[3,VLCtdorLine];
              If not(CargaDatos(VLCvegpo, VLDesc, vlImpMaxAutor)) then  //Carga los datos del grid a la tabla
              Begin   //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'Error Clave : '+ VLCvegpo + '    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLCvegpo + MSG_PREG_CONTINUA_PROCES ,
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
     else if RGinformacion.ItemIndex = 1 then //Adiciona datos no existentes en la base, no reemplaza
     Begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
        For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
           VLCvegpo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
           VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
           vlImpMaxAutor :=SAGta.Cells[3,VLCtdorLine];
           If not(CargaDatos(VLCvegpo, VLDesc,vlImpMaxAutor)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLCvegpo + '    Desc. : '+ VLDesc );
              if MessageDlg('¿Error en carga. Clave : ' + VLCvegpo+ MSG_PREG_CONTINUA_PROCES ,
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
procedure TWCrGrupoEco.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear
end;

procedure TWCrGrupoEco.edCVE_GRUPO_ECOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      Objeto.CVE_GRUPO_ECO.GetFromControl;
      if Objeto.CVE_GRUPO_ECO.AsString = '' then
      Begin
//         ShowMessage('Favor de Indicar la Clave del Grupo Económico');
         VlSalida   := False;
      end; //end if
      InterForma1.ValidaExit(edCVE_GRUPO_ECO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrGrupoEco.edDESC_AGRUPO_ECOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_AGRUPO_ECO,True,'',True);
end;

Procedure TWCrGrupoEco.MuestraHints;
Begin
      edDESC_AGRUPO_ECO.Hint := Objeto.DESC_AGRUPO_ECO.AsString;
      edDESC_AGRUPO_ECO.ShowHint := True;
End;

procedure TWCrGrupoEco.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrGrupoEco.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrGrupoEco.PegaInformacion(pLong : Integer);
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
        vlImporte : String;
   Begin
      l_Ciclo := 0;
      while l_Ciclo <= SAGta.RowCount -1 do
      Begin
          vlLong    := Length(SAGta.Cells[1,l_Ciclo]);
          vlImporte := Trim(SAGta.Cells[3,l_Ciclo]);
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
           else if not IsFloat(vlImporte) then
           Begin
                    limpiaRow(l_Ciclo);
                    AddLine(MErrores,'    en el importe: '+ vlImporte);
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
   SAGta.ColWidths[0] := 40;
   SAGta.ColWidths[1] := 50;
   SAGta.ColWidths[2] := 300;
   SAGta.ColWidths[3] := 100;
   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

procedure TWCrGrupoEco.edIMP_MAX_OPERAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg     := '';
      vlSalida := True;
      Objeto.IMP_MAX_AUTOR.GetFromControl;
      if Objeto.IMP_MAX_AUTOR.AsFloat < 0 then
      Begin
         ShowMessage('El importe máximo autorizado no debe ser negativo');
         vlSalida   := False;
      end; //end if
      InterForma1.ValidaExit(edIMP_MAX_OPERA,VLSalida,'',True);
   end;
end;

procedure TWCrGrupoEco.InterForma1AntesAceptar(Sender: TObject;
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
