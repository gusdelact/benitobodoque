// Sistema         : Clase de CR_ORIGEN_REC
// Fecha de Inicio : 28/05/2003
// Función forma   : Clase de CR_ORIGEN_REC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrOrigRec;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,Menus,

//Unidades Adicionales
IntParamCre,IntGenCre;

Type
 TCrOrigRec= class;

  TWCrOrigenRec=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    lbDESC_DESTINO: TLabel;
    lbCVE_ORIGEN_REC: TLabel;
    edCVE_ORIGEN_REC: TEdit;
    edDESC_ORIGEN_REC: TEdit;
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
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    SAGta: TStringAlignGrid;
    Label12: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
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
    procedure edCVE_ORIGEN_RECExit(Sender: TObject);
    procedure edDESC_ORIGEN_RECExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrOrigRec;
    Function CargaDatos(var POrigen,pdesc:string):boolean;
end;
 TCrOrigRec= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_ORIGEN_REC           : TInterCampo;
        DESC_ORIGEN_REC          : TInterCampo;

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


constructor TCrOrigRec.Create( AOwner : TComponent );
begin Inherited;
      CVE_ORIGEN_REC :=CreaCampo('CVE_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
                CVE_ORIGEN_REC.Caption:='Cve. Origen Recursos';
      DESC_ORIGEN_REC :=CreaCampo('DESC_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
                DESC_ORIGEN_REC.Caption:='Descripción';
      FKeyFields.Add('CVE_ORIGEN_REC');

      TableName := 'CR_ORIGEN_REC';
      UseQuery := True;
      HelpFile := 'IntCrOrigRec.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrOrigRec.Destroy;
begin inherited;
end;


function TCrOrigRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrOrigenRec;
begin
   W:=TWCrOrigenRec.Create(Self);
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

Function TCrOrigRec.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrOrRe.it','S');
      Try if Active then begin T.Param(0,CVE_ORIGEN_REC.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_ORIGEN_REC********************)
(*                                                                              *)
(*  FORMA DE CR_ORIGEN_REC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ORIGEN_REC********************)

procedure TWCrOrigenRec.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_ORIGEN_REC.Control:=edCVE_ORIGEN_REC;
      Objeto.DESC_ORIGEN_REC.Control:=edDESC_ORIGEN_REC;
end;

procedure TWCrOrigenRec.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ORIGEN_REC.Control:=nil;
      Objeto.DESC_ORIGEN_REC.Control:=nil;
   //Objeto
end;

procedure TWCrOrigenRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrOrigenRec.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_ORIGEN_REC.SetFocus;
end;

procedure TWCrOrigenRec.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_ORIGEN_REC.SetFocus;
end;

Function TWCrOrigenRec.CargaDatos(var POrigen,pdesc:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_ORIGEN_REC (CVE_ORIGEN_REC,DESC_ORIGEN_REC) '+
            'VALUES ( '+ #39 + pOrigen + #39 + ',' + #39 + pdesc + #39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrOrigenRec.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLorigen, VLDesc    : String;
          vlMsg             : String;
Begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
       if RGinformacion.ItemIndex = 0 then // Se reemplazan los datos de la Tabla
       Begin
          MErrores.Clear;
          if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin//Borra Tabla
             RunSQL('DELETE CR_ORIGEN_REC',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
             messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
             For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
             Begin
                VLorigen := UpperCase(SAGta.Cells[1,VLCtdorLine]);
                VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
                If not(CargaDatos(VLorigen, VLDesc)) then
                Begin//Muestra errores ocurridos en la carga
                   AddLine(MErrores,'Error Clave : '+ VLorigen + '    Desc. : '+ VLDesc );
                   if MessageDlg('¿Error en carga. Clave : ' + VLorigen + MSG_PREG_CONTINUA_PROCES ,
                       mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                   Begin
                      messageIniFinProceso(MErrores,CFINAL);//envia mensaje final proceso
                      exit;
                   end;
                end;
                pbRegistros.Position :=VLCtdorLine;
             end;
             messageIniFinProceso(MErrores,CFINAL);//envia mensaje final proceso
             ShowMessage(MSG_PROCESO_CARGA_OK);
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
       else if RGinformacion.ItemIndex = 1 then //adiciona Datos
       Begin
          MErrores.Clear;
          messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
          For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
          Begin
             VLorigen := UpperCase(SAGta.Cells[1,VLCtdorLine]);
             VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
             If not(CargaDatos(VLorigen, VLDesc)) then
             Begin
                AddLine(MErrores,'Error Clave : '+ VLorigen +'    Desc. : '+ VLDesc );
                if MessageDlg('¿Error en carga. Clave : ' + VLorigen + MSG_PREG_CONTINUA_PROCES ,
                   mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                Begin
                   messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                   exit;
                end;
             end;
             pbRegistros.Position :=VLCtdorLine;
          end; //end for
          messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
          ShowMessage(MSG_PROCESO_CARGA_OK);
       end;
   END;
end;

procedure TWCrOrigenRec.Pegar1Click(Sender: TObject);
begin
   MErrores.Clear;
   PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,6); //Procedimiento extraido de IntGenCre
end;

procedure TWCrOrigenRec.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear;
end;

procedure TWCrOrigenRec.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MErrores.Clear;
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,6); //Procedimiento extraido de IntGenCre
   // if end;
end;

procedure TWCrOrigenRec.edCVE_ORIGEN_RECExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMesg     := '';
      VlSalida   := True;
      Objeto.CVE_ORIGEN_REC.GetFromControl;
      if Objeto.CVE_ORIGEN_REC.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_ORIGEN_REC,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrOrigenRec.edDESC_ORIGEN_RECExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_ORIGEN_REC,True,'',True);
end;

Procedure TWCrOrigenRec.MuestraHints;
Begin
      edDESC_ORIGEN_REC.Hint := Objeto.DESC_ORIGEN_REC.AsString;
      edDESC_ORIGEN_REC.ShowHint := True;
End;

procedure TWCrOrigenRec.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrOrigenRec.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrOrigenRec.InterForma1AntesAceptar(Sender: TObject;
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

end.

