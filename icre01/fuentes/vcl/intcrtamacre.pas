// Sistema         : Clase de CR_TAM_ACRED
// Fecha de Inicio : 16/05/2003
// Función forma   : Clase de CR_TAM_ACRED
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrTamAcre;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, Grids, Aligrid, IntLinkit,

//CLASES ADICIONALES
IntParamCre, IntGenCre;

Type
 TCrTamAcre= class;

  TWCrTamAcred=Class(TForm)
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
    lbCVE_TAM_ACRED: TLabel;
    edCVE_TAM_ACRED: TEdit;
    lbDESC_TAM_ACRED: TLabel;
    edDESC_TAM_ACRED: TEdit;
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
    SAGta: TStringAlignGrid;
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
    procedure edCVE_TAM_ACREDExit(Sender: TObject);
    procedure edDESC_TAM_ACREDExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTamAcre;
    Function CargaDatos(var Pcvtamacred,pdesc:string):boolean;


end;
 TCrTamAcre= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_TAM_ACRED            : TInterCampo;
        DESC_TAM_ACRED           : TInterCampo;
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


constructor TCrTamAcre.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TAM_ACRED :=CreaCampo('CVE_TAM_ACRED',ftString,tsNinguno,tsNinguno,True);
                CVE_TAM_ACRED.Caption:='Tamaño Acreditado';
      DESC_TAM_ACRED :=CreaCampo('DESC_TAM_ACRED',ftString,tsNinguno,tsNinguno,True);
                DESC_TAM_ACRED.Caption:='Descripción';
      FKeyFields.Add('CVE_TAM_ACRED');

      TableName := 'CR_TAM_ACRED';
      UseQuery := True;
      HelpFile := 'IntCrTamAcre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTamAcre.Destroy;
begin inherited;
end;


function TCrTamAcre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTamAcred;
begin
   W:=TWCrTamAcred.Create(Self);
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


Function TCrTamAcre.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrTaAc.it','S');
      Try if Active then begin T.Param(0,CVE_TAM_ACRED.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TAM_ACRED********************)
(*                                                                              *)
(*  FORMA DE CR_TAM_ACRED                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TAM_ACRED********************)


procedure TWCrTamAcred.FormShow(Sender: TObject);
begin
     //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TAM_ACRED.Control:=edCVE_TAM_ACRED;
      Objeto.DESC_TAM_ACRED.Control:=edDESC_TAM_ACRED;
end;

procedure TWCrTamAcred.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TAM_ACRED.Control:=nil;
      Objeto.DESC_TAM_ACRED.Control:=nil;
   //Objeto
end;

procedure TWCrTamAcred.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTamAcred.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_TAM_ACRED.SetFocus;
end;

procedure TWCrTamAcred.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_TAM_ACRED.SetFocus;
end;

//Pega los datos de excel al grid
procedure TWCrTamAcred.Pegar1Click(Sender: TObject);
begin
   PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,4);//Procedimiento extraido de IntGenCre
end;

procedure TWCrTamAcred.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
          PegaInformacion(SAGta,lbTotalReg,pbRegistros,MErrores,4);//Procedimiento extraido de IntGenCre
     // if end;
end;

procedure TWCrTamAcred.SAGtaExit(Sender: TObject);
begin
     InterForma1.ValidaExit(SAGta,True,'',True);
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrTamAcred.CargaDatos(var Pcvtamacred,pdesc:string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_TAM_ACRED (CVE_TAM_ACRED,DESC_TAM_ACRED) '+
            'VALUES ( '+ #39 + Pcvtamacred + #39 + ',' + #39 + pdesc + #39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

(*****************************************************************)
procedure TWCrTamAcred.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLtamacred, VLDesc: String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     VLtamacred := '';
     VLDesc   := '';
     if RGinformacion.ItemIndex = 0 then //Reemplaza la inofrmación
        begin
           MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 Begin
                    //Borra datos existentes de la tabla en caso de reemplazar
                    RunSQL('DELETE CR_TAM_ACRED',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
                    messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
                    For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
                         begin
                            VLtamacred := UpperCase(SAGta.Cells[1,VLCtdorLine]);
                            VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
                            If not(CargaDatos(VLtamacred, VLDesc)) then //Carga los datos del grid a la tabla
                               Begin //Muestra errores que se tienen en la carga
                                  AddLine(MErrores,'Error Clave : '+ VLtamacred + '    Desc. : '+ VLDesc );
                                  if MessageDlg('¿Error en carga. Clave : ' + VLtamacred + MSG_PREG_CONTINUA_PROCES ,
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
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
              begin
                 VLtamacred := UpperCase(SAGta.Cells[1,VLCtdorLine]);
                 VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
                 If not(CargaDatos(VLtamacred, VLDesc)) then
                    Begin
                       AddLine(MErrores,'Error Clave : '+ VLtamacred + '    Desc. : '+ VLDesc );
                       if MessageDlg('¿Error en carga. Clave : ' + VLtamacred+ MSG_PREG_CONTINUA_PROCES ,
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

procedure TWCrTamAcred.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear;
end;

procedure TWCrTamAcred.edCVE_TAM_ACREDExit(Sender: TObject);
Begin
   InterForma1.ValidaExit(edCVE_TAM_ACRED,True,'',True);
end;

procedure TWCrTamAcred.edDESC_TAM_ACREDExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_TAM_ACRED,True,'',True);
end;

Procedure TWCrTamAcred.MuestraHints;
Begin
      edDESC_TAM_ACRED.Hint := Objeto.DESC_TAM_ACRED.AsString;
      edDESC_TAM_ACRED.ShowHint := True;
End;

procedure TWCrTamAcred.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrTamAcred.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrTamAcred.InterForma1AntesAceptar(Sender: TObject;
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
