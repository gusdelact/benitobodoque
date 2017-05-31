// Sistema         : Clase de CR_CALIF_ACRED
// Fecha de Inicio : 21/05/2003
// Función forma   : Clase de CR_CALIF_ACRED
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrCalAcr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, Menus,

//Unidades Adicionales
IntParamCre,
IntGenCre;

Type
 TCrCalAcr= class;

  TWCrCalifAcred=Class(TForm)
    InterForma1             : TInterForma;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    lbTotal: TLabel;
    lbTotalReg: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btCarga: TBitBtn;
    RGinformacion: TRadioGroup;
    pbRegistros: TProgressBar;
    lbCVE_CALIFICACION: TLabel;
    edCVE_CALIFICACION: TEdit;
    edDESC_CALIFICA: TEdit;
    rgCVE_PER_JURIDICA: TRadioGroup;
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
    MErrores: TMemo;
    SAGta: TStringAlignGrid;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAGtaExit(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure edCVE_CALIFICACIONExit(Sender: TObject);
    procedure edDESC_CALIFICAExit(Sender: TObject);
    procedure rgCVE_PER_JURIDICAExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCalAcr;
    Procedure PegaInformacion(pLong : Integer);
    Function ValidaPersJuridica(PCve : String; PJuridica : String; PDesc : String): Boolean;
    Function CargaDatos(var Ptipo,pJuridica,pdesc:string):boolean;
end;
 TCrCalAcr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CALIFICACION         : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;
        DESC_CALIFICA            : TInterCampo;

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


constructor TCrCalAcr.Create( AOwner : TComponent );
begin Inherited;
      CVE_CALIFICACION :=CreaCampo('CVE_CALIFICACION',ftString,tsNinguno,tsNinguno,True);
                CVE_CALIFICACION.Caption:='Calificación Acreditado';

      CVE_PER_JURIDICA :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);
          With CVE_PER_JURIDICA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('PF');
                ComboLista.Add('1'); ComboDatos.Add('PM');
          end;
              CVE_PER_JURIDICA.Caption:='Persona Jurídica';

      DESC_CALIFICA :=CreaCampo('DESC_CALIFICA',ftString,tsNinguno,tsNinguno,True);
                DESC_CALIFICA.Caption:='Descripción Califica';
      FKeyFields.Add('CVE_CALIFICACION');
      FKeyFields.Add('CVE_PER_JURIDICA');

      TableName := 'CR_CALIF_ACRED';
      UseQuery := True;
      HelpFile := 'IntCrCalAcr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalAcr.Destroy;
begin inherited;
end;


function TCrCalAcr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalifAcred;
begin
   W:=TWCrCalifAcred.Create(Self);
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


Function TCrCalAcr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCaAc.it','S,S');
      Try if Active then begin T.Param(0,CVE_CALIFICACION.AsString);
                               T.Param(1,CVE_PER_JURIDICA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CALIF_ACRED********************)
(*                                                                              *)
(*  FORMA DE CR_CALIF_ACRED                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CALIF_ACRED********************)

procedure TWCrCalifAcred.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_CALIFICACION.Control:=edCVE_CALIFICACION;
      Objeto.CVE_PER_JURIDICA.Control:=rgCVE_PER_JURIDICA;
      Objeto.DESC_CALIFICA.Control:=edDESC_CALIFICA;
end;

procedure TWCrCalifAcred.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CALIFICACION.Control:=nil;
      Objeto.CVE_PER_JURIDICA.Control:=nil;
      Objeto.DESC_CALIFICA.Control:=nil;
   //Objeto
end;

procedure TWCrCalifAcred.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCalifAcred.InterForma1DespuesNuevo(Sender: TObject);
begin
     Objeto.CVE_PER_JURIDICA.AsString := 'PF';
     MuestraHints;
     edCVE_CALIFICACION.SetFocus;
end;

procedure TWCrCalifAcred.InterForma1DespuesModificar(Sender: TObject);
begin
     edDESC_CALIFICA.SetFocus;
end;

(*********************COPIA DE DATOS DE EXCEL AL CATÁLOGO***********************)
Procedure TWCrCalifAcred.PegaInformacion(pLong : Integer);

var l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en Cve: '+ SAGta.Cells[1,pRow] +
                       'Persona Juridica: '+ SAGta.Cells[2,pRow] +
                       '           Desc.: '+ SAGta.Cells[3,pRow]);
      SAGta.RemoveRow(pRow);
   end;

Procedure DepuraLineas;
   var  l_Ciclo   : Integer;
        vlLong    : Integer;
   Begin
       l_Ciclo := 0;
           while l_Ciclo <= SAGta.RowCount -1 do
           begin
           vlLong := Length(SAGta.Cells[1,l_Ciclo]);
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
           else if not(ValidaPersJuridica(SAGta.Cells[1,l_Ciclo],SAGta.Cells[2,l_Ciclo],
                                          SAGta.Cells[3,l_Ciclo])) then
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

Begin
          lbTotalReg.Caption := '';
          pbRegistros.Max := 0;
          Try
             For l_Ciclo:= 1 to (SAGta.RowCount-1) do
             begin
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
           SAGta.ColWidths[1] := 40;
           SAGta.ColWidths[2] := 85;
           SAGta.ColWidths[3] := 320;
          //Pega Datos
          depuralineas;
          if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
          Begin
           lbTotalReg.Caption := IntToStr(SAGta.RowCount);
           pbRegistros.Max := SAGta.RowCount - 1;
          end;
end;

(********************* Valida Persona Juridica **********************)
Function TWCrCalifAcred.ValidaPersJuridica(PCve : String; PJuridica : String;
                                          PDesc : String): Boolean;
var     VLLongJ       : Integer;
        VLSalida      : Boolean;
Begin
     VLSalida   := True;
     VLLongJ   :=(Length(PJuridica));
     //VALIDA PERSONA JURIDICA
         If VLLongJ > 2 then
             Begin
                AddLine(MErrores,'Error en Cve: ' + PCve +
                                 '    Persona Juridica: '+ PJuridica +
                                 '       Desc.: '+ PDesc);
                VLSalida := False;
             end
         else if VLLongJ <= 2 then
             Begin
                If (PJuridica <>'PF') and ( PJuridica <>'PM') then
                   Begin
                      AddLine(MErrores,'Error en Cve: ' + PCve +
                                       '    Persona Juridica: '+ PJuridica +
                                       '       Desc.: '+ PDesc);
                      VLSalida := False;
                   end
             end;
      ValidaPersJuridica := VLSalida;
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrCalifAcred.CargaDatos(var Ptipo,pJuridica,pdesc:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_CALIF_ACRED (CVE_CALIFICACION,CVE_PER_JURIDICA,DESC_CALIFICA) '+
            'VALUES ( '+ #39 + ptipo + #39 + ',' + #39 + pJuridica + #39 + ','+
                         #39 + pdesc + #39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;

end;

procedure TWCrCalifAcred.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MErrores.Clear;
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
          PegaInformacion(4);
     // if end;
end;

procedure TWCrCalifAcred.SAGtaExit(Sender: TObject);
begin
     InterForma1.ValidaExit(SAGta,True,'',True);
end;

procedure TWCrCalifAcred.Pegar1Click(Sender: TObject);
begin
    MErrores.Clear;
    PegaInformacion(4);
end;

procedure TWCrCalifAcred.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLTipo, VLDesc    : String;
          VLJurid           : String;
          vlMsg             : String;
          vlTermina         : Boolean;
Begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then //remmplaza información de la tabla
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           RunSQL('DELETE CR_CALIF_ACRED',objeto.Apli.DataBaseName,
                  objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLTipo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLJurid:= UpperCase(SAGta.Cells[2,VLCtdorLine]);
              VLDesc := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
              If not(CargaDatos(VLTipo,VLJurid,VLDesc)) then
              Begin
                 AddLine(MErrores,'Error Clave : '+ VLTipo +
                                  '    Pers. Juridica : ' + VLJurid+
                                  '    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLTipo + MSG_PREG_CONTINUA_PROCES ,
                    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 Begin
                    vlTermina := False;
                    messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                    exit;
                 end;//end if
              end;//end if
              pbRegistros.Position :=VLCtdorLine;
              vlTermina := True;
           end;//end for
           if vlTermina then
              ShowMessage(MSG_PROCESO_CARGA_OK);
           //end if
           messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
        end//end if
        else
           Begin
               vlMsg := 'No se realizó el Proceso de carga';
               messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
               AddLine(MErrores,vlMsg);
               messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
               ShowMessage(vlMsg);
               exit;
           end;
     end//end if
     else if RGinformacion.ItemIndex = 1 then // Adiciona Datos, en lugar de reemplazar
           Begin
              MErrores.Clear;
              messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
              For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
              begin
                    VLTipo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
                    VLJurid:= UpperCase(SAGta.Cells[2,VLCtdorLine]);
                    VLDesc := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
                    If not(CargaDatos(VLTipo,VLJurid,VLDesc)) then
                       Begin
                          AddLine(MErrores,'Error Clave : '+ VLTipo +
                                           '    Pers. Juridica : ' + VLJurid+
                                           '    Desc. : '+ VLDesc );
                          if MessageDlg('¿Error en carga. Clave : ' + VLTipo + MSG_PREG_CONTINUA_PROCES ,
                             mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                             Begin
                                messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                                exit;
                             end;//end if
                          vlTermina := True;
                          pbRegistros.Position :=VLCtdorLine;
                       end;//end if
              end; //end for
              if vlTermina then
                 ShowMessage(MSG_PROCESO_CARGA_OK);
              //end if
              messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
           end;//end if
     END;
end;

procedure TWCrCalifAcred.edCVE_CALIFICACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMesg     := '';
         VLSalida   := True;
         Objeto.CVE_CALIFICACION.GetFromControl;
         if Objeto.CVE_CALIFICACION.AsString = '' then
         Begin
//            ShowMessage('Favor de Indicar la Calificación del Acreditado');
            VlSalida   := False;
         end; // END IF
         InterForma1.ValidaExit(edCVE_CALIFICACION,VLSalida,VLMesg,True);
      end;
end;

procedure TWCrCalifAcred.edDESC_CALIFICAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_CALIFICA,True,'',True);
end;

procedure TWCrCalifAcred.rgCVE_PER_JURIDICAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_PER_JURIDICA,True,'',True);
end;

Procedure TWCrCalifAcred.MuestraHints;
Begin
      edDESC_CALIFICA.Hint := Objeto.DESC_CALIFICA.AsString;
      edDESC_CALIFICA.ShowHint := True;
End;

procedure TWCrCalifAcred.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrCalifAcred.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrCalifAcred.InterForma1AntesAceptar(Sender: TObject;
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
   // end if
end;

end.
