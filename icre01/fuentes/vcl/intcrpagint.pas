// Sistema         : Clase de CR_PAGO_INTERES
// Fecha de Inicio : 05/06/2003
// Función forma   : Clase de CR_PAGO_INTERES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrPagInt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,

//Unidades Adicionales
IntParamCre, Menus, IntGenCre;

Type
 TCrPagInt= class; 

  TWCrPagoInteres=Class(TForm)
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
    lbCVE_PAG_INTERES: TLabel;
    edCVE_PAG_INTERES: TEdit;
    lbDESC_PAG_INTERES: TLabel;
    edDESC_PAG_INTERES: TEdit;
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
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAGtaExit(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure RGinformacionClick(Sender: TObject);
    procedure edCVE_PAG_INTERESExit(Sender: TObject);
    procedure edDESC_PAG_INTERESExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPagInt;
    Function CargaDatos(var Ptipo,pdesc:string):boolean;
end;
 TCrPagInt= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations } 
        CVE_PAG_INTERES          : TInterCampo;
        DESC_PAG_INTERES         : TInterCampo;

        ParamCre                 : TParamCre;
        
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 

      published
      end;



implementation

{$R *.DFM}


constructor TCrPagInt.Create( AOwner : TComponent );
begin Inherited;
      CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
                CVE_PAG_INTERES.Caption:='Tipo de Pago Interés';
      DESC_PAG_INTERES :=CreaCampo('DESC_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
                DESC_PAG_INTERES.Caption:='Descripción';
      FKeyFields.Add('CVE_PAG_INTERES');

      TableName := 'CR_PAGO_INTERES'; 
      UseQuery := True; 
      HelpFile := 'IntCrPagInt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrPagInt.Destroy;
begin inherited;
end;


function TCrPagInt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPagoInteres;
begin
   W:=TWCrPagoInteres.Create(Self);
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


Function TCrPagInt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrPaIn.it','S');
      Try if Active then begin T.Param(0,CVE_PAG_INTERES.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_PAGO_INTERES********************)
(*                                                                              *)
(*  FORMA DE CR_PAGO_INTERES                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PAGO_INTERES********************)

procedure TWCrPagoInteres.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      
      Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
      Objeto.DESC_PAG_INTERES.Control:=edDESC_PAG_INTERES;
end;

procedure TWCrPagoInteres.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PAG_INTERES.Control:=nil;
      Objeto.DESC_PAG_INTERES.Control:=nil;
   //Objeto
end;

procedure TWCrPagoInteres.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPagoInteres.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_PAG_INTERES.SetFocus;
end;

procedure TWCrPagoInteres.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_PAG_INTERES.SetFocus;
end;

(*********************CARGA DE DATOS********************************************)
Function TWCrPagoInteres.CargaDatos(var Ptipo,pdesc:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_PAGO_INTERES (CVE_PAG_INTERES,DESC_PAG_INTERES) '+
            'VALUES ( '+ #39 + ptipo + #39 + ',' + #39 + pdesc + #39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrPagoInteres.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MErrores.Clear;
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,2); //Procedimiento extraido de IntGenCre
   // if end;
end;

procedure TWCrPagoInteres.SAGtaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(SAGta,True,'',True);
end;

procedure TWCrPagoInteres.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
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
           RunSQL('DELETE CR_PAGO_INTERES',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
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
        if vlTermina then
           ShowMessage(MSG_PROCESO_CARGA_OK);
        //end if
        messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
     end;
   END;
end;

procedure TWCrPagoInteres.Pegar1Click(Sender: TObject);
begin
   MErrores.Clear;
   PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,2); //Procedimiento extraido de IntGenCre
end;

procedure TWCrPagoInteres.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear;
end;

procedure TWCrPagoInteres.edCVE_PAG_INTERESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg     := '';
      Objeto.CVE_PAG_INTERES.GetFromControl;
      if Objeto.CVE_PAG_INTERES.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_PAG_INTERES,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrPagoInteres.edDESC_PAG_INTERESExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_PAG_INTERES,True,'',True);
end;

Procedure TWCrPagoInteres.MuestraHints;
Begin
      edDESC_PAG_INTERES.Hint := Objeto.DESC_PAG_INTERES.AsString;
      edDESC_PAG_INTERES.ShowHint := True;
End;

procedure TWCrPagoInteres.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrPagoInteres.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrPagoInteres.InterForma1AntesAceptar(Sender: TObject;
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
