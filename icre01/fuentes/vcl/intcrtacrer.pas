// Sistema         : Clase de CR_TIPO_ACRED
// Fecha de Inicio : 18/06/2003
// Función forma   : Clase de CR_TIPO_ACRED
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrTAcreR;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,ActnList, Menus,

//Unidades Adicionales
IntParamCre,
IntGenCre;

Type
 TCrTAcre= class;

  TWCrTAcre=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    lbDESC_TIPO_ACRED: TLabel;
    lbCVE_GRUPO_ECO: TLabel;
    edTIPO_ACRED_REL: TEdit;
    edDESC_TIPO_ACRED: TEdit;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
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
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    Label7: TLabel;
    Bevel3: TBevel;
    Label12: TLabel;
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
    procedure edTIPO_ACRED_RELExit(Sender: TObject);
    procedure edDESC_TIPO_ACREDExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTAcre;
    Function  CargaDatos(var Ptipo,pdesc:string):boolean;

end;
 TCrTAcre= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        TIPO_ACRED_REL           : TInterCampo;
        DESC_TIPO_ACRED          : TInterCampo;

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


constructor TCrTAcre.Create( AOwner : TComponent ); 
begin Inherited; 
      TIPO_ACRED_REL :=CreaCampo('TIPO_ACRED_REL',ftString,tsNinguno,tsNinguno,True);
                TIPO_ACRED_REL.Caption:='Tipo Acred Rel';
      DESC_TIPO_ACRED :=CreaCampo('DESC_TIPO_ACRED',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_ACRED.Caption:='Descripción Tipo Acred';
      FKeyFields.Add('TIPO_ACRED_REL');

      TableName := 'CR_TIPO_ACRED'; 
      UseQuery := True; 
      HelpFile := 'IntCrTAcre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTAcre.Destroy;
begin inherited;
end;


function TCrTAcre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTAcre;
begin
   W:=TWCrTAcre.Create(Self);
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


Function TCrTAcre.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrTAcre.it','S');
      Try if Active then begin T.Param(0,TIPO_ACRED_REL.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TIPO_ACRED********************)
(*                                                                              *)
(*  FORMA DE CR_TIPO_ACRED                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPO_ACRED********************)

procedure TWCrTAcre.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.TIPO_ACRED_REL.Control:=edTIPO_ACRED_REL;
      Objeto.DESC_TIPO_ACRED.Control:=edDESC_TIPO_ACRED;
end;

procedure TWCrTAcre.FormDestroy(Sender: TObject);
begin
      Objeto.TIPO_ACRED_REL.Control:=nil;
      Objeto.DESC_TIPO_ACRED.Control:=nil;
   //Objeto
end;

procedure TWCrTAcre.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTAcre.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edTIPO_ACRED_REL.SetFocus;
end;

procedure TWCrTAcre.InterForma1DespuesModificar(Sender: TObject);
begin  edDESC_TIPO_ACRED.SetFocus;
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrTAcre.CargaDatos(var Ptipo,pdesc:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO cr_tipo_acred (tipo_acred_rel,desc_tipo_acred) '+
            'VALUES ( '+ #39 + ptipo + #39 + ',' + #39 + pdesc + #39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

//Pega los datos de excel al grid
procedure TWCrTAcre.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     MErrores.Clear;
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
          PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,4); //Procedimiento extraido de IntGenCre
     // if end;
end;

procedure TWCrTAcre.SAGtaExit(Sender: TObject);
begin
     InterForma1.ValidaExit(SAGta,True,'',True);
end;

procedure TWCrTAcre.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLTipo, VLDesc    : String;
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
           RunSQL('DELETE CR_TIPO_ACRED',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLTipo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
              If not(CargaDatos(VLTipo, VLDesc)) then //Carga los datos del grid a la tabla
              Begin //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'*** Error la Carga. Clave : '+ VLTipo + '    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLTipo + MSG_PREG_CONTINUA_PROCES ,
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
           VLTipo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
           VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
           If not(CargaDatos(VLTipo, VLDesc)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLTipo + '    Desc. : '+ VLDesc );
              if MessageDlg('¿Error en carga. Clave : ' + VLTipo + MSG_PREG_CONTINUA_PROCES ,
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

procedure TWCrTAcre.Pegar1Click(Sender: TObject);
begin
   MErrores.Clear;
   PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,4); //Procedimiento extraido de IntGenCre
end;

procedure TWCrTAcre.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear;
end;

procedure TWCrTAcre.edTIPO_ACRED_RELExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.TIPO_ACRED_REL.GetFromControl;
      if Objeto.TIPO_ACRED_REL.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edTIPO_ACRED_REL,VLSalida,'',True);
   end;
end;

procedure TWCrTAcre.edDESC_TIPO_ACREDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_TIPO_ACRED,True,'',True);
end;

Procedure TWCrTAcre.MuestraHints;
Begin
      edDESC_TIPO_ACRED.Hint := Objeto.DESC_TIPO_ACRED.AsString;
      edDESC_TIPO_ACRED.ShowHint := True;
End;

procedure TWCrTAcre.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrTAcre.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrTAcre.InterForma1AntesAceptar(Sender: TObject;
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
