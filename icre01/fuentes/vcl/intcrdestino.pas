// Sistema         : Clase de CR_DESTINO
// Fecha de Inicio : 28/05/2003
// Función forma   : Clase de CR_DESTINO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrDestino;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,Menus,

//Unidades Adicionales
IntParamCre, IntGenCre;

Type
 TCrDestino= class;

  TWCrDestino=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    lbDESC_DESTINO: TLabel;
    lbCVE_DESTINO: TLabel;
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
    edCVE_DESTINO: TEdit;
    edDESC_DESTINO: TEdit;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    SAGta: TStringAlignGrid;
    Label12: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    cbxCVE_AGRUPACION: TComboBox;
    Label1: TLabel;
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
    procedure edCVE_DESTINOExit(Sender: TObject);
    procedure edDESC_DESTINOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure cbxCVE_AGRUPACIONExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrDestino;
    Function CargaDatos(var PDestino,pdesc,pTipoCar:String):boolean;
end;
 TCrDestino= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        CVE_DESTINO              : TInterCampo;
        DESC_DESTINO             : TInterCampo;
        CVE_AGRUPACION           : TInterCampo;

        ParamCre                 : TParamCre;
        SAGta                    : TStringAlignGrid;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrDestino.Create( AOwner : TComponent );
begin Inherited;
      CVE_DESTINO :=CreaCampo('CVE_DESTINO',ftString,tsNinguno,tsNinguno,True);
                CVE_DESTINO.Caption:='Cve. Destino';
      DESC_DESTINO :=CreaCampo('DESC_DESTINO',ftString,tsNinguno,tsNinguno,True);
                DESC_DESTINO.Caption:='Descripción';
      CVE_AGRUPACION  :=CreaCampo('CVE_AGRUPACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AGRUPACION .Caption:='Agrupacion';
       With CVE_AGRUPACION do
       Begin Size:=11;
             UseCombo:=True;
             ComboLista.Add('Hipotecario'); ComboDatos.Add('CARTHIPO');
             ComboLista.Add('Comercial');   ComboDatos.Add('CARTCOME');
             ComboLista.Add('Consumo');     ComboDatos.Add('CARTCONS');
             ComboLista.Add('Otros');       ComboDatos.Add('OTROS');
       End;

      FKeyFields.Add('CVE_DESTINO');

      TableName := 'CR_DESTINO';
      UseQuery := True;
      HelpFile := 'IntCrDestino.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrDestino.Destroy;
begin inherited;
end;


function TCrDestino.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrDestino;
begin
   W:=TWCrDestino.Create(Self);
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


Function TCrDestino.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrDesti.it','S');
      Try if Active then begin T.Param(0,CVE_DESTINO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_DESTINO********************)
(*                                                                              *)
(*  FORMA DE CR_DESTINO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_DESTINO********************)

procedure TWCrDestino.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_DESTINO.Control:=edCVE_DESTINO;
      Objeto.DESC_DESTINO.Control:=edDESC_DESTINO;
      Objeto.CVE_AGRUPACION.Control :=cbxCVE_AGRUPACION;
end;

procedure TWCrDestino.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_DESTINO.Control:=nil;
      Objeto.DESC_DESTINO.Control:=nil;
      Objeto.CVE_AGRUPACION.Control:= nil;
   //Objeto
end;

procedure TWCrDestino.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrDestino.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_DESTINO.SetFocus;
end;

procedure TWCrDestino.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_DESTINO.SetFocus;
end;

Function TWCrDestino.CargaDatos(var PDestino,pdesc,pTipoCar:String):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_DESTINO (CVE_DESTINO,DESC_DESTINO,CVE_AGRUPACION) '+
            'VALUES ( '+ #39 + pDestino + #39 + ',' + #39 + pdesc + #39 + ',' + #39 + pTipoCar + #39 +' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrDestino.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLDestino, VLDesc : String;
          VLTipoCart        : String;
          vlMsg             : String;
          vlTermina         : Boolean;
Begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then //Reemplaza Datos de la tabla
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin //Borra la Tabla
           RunSQL('DELETE CR_DESTINO',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLDestino  := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLDesc     := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
              VLTipoCart := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
              If not(CargaDatos(VLDestino, VLDesc,VLTipoCart)) then
              Begin //Muestra los errores que se tuvo en la carga
                 AddLine(MErrores,'Error Clave : '+ VLDestino + '    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLDestino + MSG_PREG_CONTINUA_PROCES ,
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
     else if RGinformacion.ItemIndex = 1 then //Adiciona la Información
     Begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
        For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
           VLDestino := UpperCase(SAGta.Cells[1,VLCtdorLine]);
           VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
           VLTipoCart := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
           If not(CargaDatos(VLDestino, VLDesc,VLTipoCart)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLDestino + '    Desc. : '+ VLDesc );
              if MessageDlg('¿Error en carga. Clave : ' + VLDestino + MSG_PREG_CONTINUA_PROCES ,
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

procedure TWCrDestino.Pegar1Click(Sender: TObject);
begin
    MErrores.Clear;
    PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,6); //Procedimiento extraido de IntGenCre
end;

procedure TWCrDestino.RGinformacionClick(Sender: TObject);
begin
    MErrores.Clear;
end;

procedure TWCrDestino.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
   MErrores.Clear;
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,6); //Procedimiento extraido de IntGenCre
   // if end;
end;

procedure TWCrDestino.edCVE_DESTINOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VlSalida   := True;
      Objeto.CVE_DESTINO.GetFromControl;
      if Objeto.CVE_DESTINO.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_DESTINO,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrDestino.edDESC_DESTINOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_DESTINO,True,'',True);
end;

Procedure TWCrDestino.MuestraHints;
Begin
      edDESC_DESTINO.Hint := Objeto.DESC_DESTINO.AsString;
      edDESC_DESTINO.ShowHint := True;
End;

procedure TWCrDestino.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrDestino.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrDestino.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrDestino.cbxCVE_AGRUPACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxCVE_AGRUPACION,True,'',True);
end;

end.
