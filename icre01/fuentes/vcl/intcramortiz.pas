// Sistema         : Clase de CR_AMORTIZACION
// Fecha de Inicio : 05/06/2003
// Función forma   : Clase de CR_AMORTIZACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrAmortiz;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,

//Unidades Adicionales
IntParamCre, Menus, IntGenCre;

Type
 TCrAmortiz= class; 

  TWCrAmortizacion=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
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
    lbCVE_AMORTIZACION: TLabel;
    edCVE_AMORTIZACION: TEdit;
    edDESC_AMORTIZA: TEdit;
    lbDESC_AMORTIZA: TLabel;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    Label7: TLabel;
    Bevel3: TBevel;
    Label12: TLabel;
    SAGta: TStringAlignGrid;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCargaClick(Sender: TObject);
    procedure SAGtaExit(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure RGinformacionClick(Sender: TObject);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure edDESC_AMORTIZAExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrAmortiz;
    Function CargaDatos(var Ptipo,pdesc:string):boolean;
end;
 TCrAmortiz= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        CVE_AMORTIZACION         : TInterCampo;
        DESC_AMORTIZA            : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation

{$R *.DFM}


constructor TCrAmortiz.Create( AOwner : TComponent );
begin Inherited;
      CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AMORTIZACION.Caption:='Tipo de Amortización';
      DESC_AMORTIZA :=CreaCampo('DESC_AMORTIZA',ftString,tsNinguno,tsNinguno,True);
                DESC_AMORTIZA.Caption:='Descripción';
      FKeyFields.Add('CVE_AMORTIZACION');

      TableName := 'CR_AMORTIZACION'; 
      UseQuery := True;
      HelpFile := 'IntCrAmortiz.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAmortiz.Destroy;
begin inherited;
end;


function TCrAmortiz.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAmortizacion;
begin
   W:=TWCrAmortizacion.Create(Self);
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


Function TCrAmortiz.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrAmort.it','S');
      Try if Active then begin T.Param(0,CVE_AMORTIZACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_AMORTIZACION********************)
(*                                                                              *)
(*  FORMA DE CR_AMORTIZACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AMORTIZACION********************)

procedure TWCrAmortizacion.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      
      Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.DESC_AMORTIZA.Control:=edDESC_AMORTIZA;
end;

procedure TWCrAmortizacion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AMORTIZACION.Control:=nil;
      Objeto.DESC_AMORTIZA.Control:=nil;
   //Objeto
end;

procedure TWCrAmortizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAmortizacion.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_AMORTIZACION.SetFocus;
end;

procedure TWCrAmortizacion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_AMORTIZA.SetFocus;
end;

(*********************CARGA DE DATOS********************************************)
Function TWCrAmortizacion.CargaDatos(var Ptipo,pdesc:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   VLSalida := False;
   vlsql := 'INSERT INTO CR_AMORTIZACION (CVE_AMORTIZACION,DESC_AMORTIZA) '+
            'VALUES ( '+ #39 + ptipo + #39 + ',' + #39 + pdesc + #39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

(*******************************************************************************)
procedure TWCrAmortizacion.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MErrores.Clear;
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,2); //Procedimiento extraido de IntGenCre
   // if end;
end;

(*******************************************************************************)

procedure TWCrAmortizacion.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLNoRegistros     : Integer;
          VLTipo, VLDesc    : String;
          vlBorraTabla      : Boolean;
          vlMsg             : String;
          vlTermina         : Boolean;
Begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           vlBorraTabla := RunSQL('DELETE CR_AMORTIZACION',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           Begin
              VLTipo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
              If not(CargaDatos(VLTipo, VLDesc)) then
              Begin
                 AddLine(MErrores,'Error Clave : '+ VLTipo + '    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLTipo + MSG_PREG_CONTINUA_PROCES,
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
     else if RGinformacion.ItemIndex = 1 then
     Begin
        MErrores.Clear;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
        For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
        begin
           VLTipo := UpperCase(SAGta.Cells[1,VLCtdorLine]);
           VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
           If not(CargaDatos(VLTipo, VLDesc)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLTipo +'    Desc. : '+ VLDesc );
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
        messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
        ShowMessage(MSG_PROCESO_CARGA_OK);
     end;
   end;
end;

procedure TWCrAmortizacion.SAGtaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(SAGta,True,'',True);
end;

procedure TWCrAmortizacion.Pegar1Click(Sender: TObject);
begin
   MErrores.Clear;
   PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,2); //Procedimiento extraido de IntGenCre
end;

procedure TWCrAmortizacion.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear;
end;

procedure TWCrAmortizacion.edCVE_AMORTIZACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      Objeto.CVE_AMORTIZACION.GetFromControl;
      if Objeto.CVE_AMORTIZACION.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_AMORTIZACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrAmortizacion.edDESC_AMORTIZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_AMORTIZA,True,'',True);
end;

Procedure TWCrAmortizacion.MuestraHints;
Begin
      edDESC_AMORTIZA.Hint := Objeto.DESC_AMORTIZA.AsString;
      edDESC_AMORTIZA.ShowHint := True;
End;

procedure TWCrAmortizacion.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrAmortizacion.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrAmortizacion.InterForma1AntesAceptar(Sender: TObject;
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
