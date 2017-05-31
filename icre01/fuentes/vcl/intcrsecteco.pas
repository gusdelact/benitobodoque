// Sistema         : Clase de CR_SECTOR_ECO
// Fecha de Inicio : 13/05/2003
// Función forma   : Clase de CR_SECTOR_ECO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrSectEco;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,Menus, Grids, Aligrid,

//CLASES ADICIONALES
IntParamCre,
IntGenCre,

IntCrcat


;

Type
 TCrSectEco= class;

  TWCrSectorEco=Class(TForm)
    InterForma1             : TInterForma;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    lbCVE_SECTOR_ECO: TLabel;
    edCVE_SECTOR_ECO: TEdit;
    lbDESC_SECTOR_ECO: TLabel;
    edDESC_SECTOR_ECO: TEdit;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
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
    edCVE_TIPO_SECTOR: TEdit;
    lbCVE_TIPO_SECTOR: TLabel;
    Label12: TLabel;
    Bevel4: TBevel;
    Bevel3: TBevel;
    Label7: TLabel;
    SAGta: TStringAlignGrid;
    Label1: TLabel;
    Button1: TButton;
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
    procedure edCVE_SECTOR_ECOExit(Sender: TObject);
    procedure edDESC_SECTOR_ECOExit(Sender: TObject);
    procedure edCVE_TIPO_SECTORExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure Button1Click(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrSectEco;
    Procedure PegaInformacion(pLong : Integer);    
    Function  CargaDatos(var Pcvesec,pdesc, pTipo : string):boolean;
end;
 TCrSectEco= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_SECTOR_ECO           : TInterCampo;
        DESC_SECTOR_ECO          : TInterCampo;
        CVE_TIPO_SECTOR          : TInterCampo;

        //Clases Adicionales
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

constructor TCrSectEco.Create( AOwner : TComponent );
begin Inherited;
      CVE_SECTOR_ECO :=CreaCampo('CVE_SECTOR_ECO',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_ECO.Caption:='Sector Ecoconómico';
      DESC_SECTOR_ECO :=CreaCampo('DESC_SECTOR_ECO',ftString,tsNinguno,tsNinguno,True);
                DESC_SECTOR_ECO.Caption:='Descripción';
      CVE_TIPO_SECTOR :=CreaCampo('CVE_TIPO_SECTOR',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_SECTOR.Caption:='Tipo Sector';
      FKeyFields.Add('CVE_SECTOR_ECO');

      TableName := 'CR_SECTOR_ECO';
      UseQuery := True;
      HelpFile := 'IntCrSectEco.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrSectEco.Destroy;
begin inherited;
end;


function TCrSectEco.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSectorEco;
begin
   W:=TWCrSectorEco.Create(Self);
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


Function TCrSectEco.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSeEc.it','S');
      Try if Active then begin T.Param(0,CVE_SECTOR_ECO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_SECTOR_ECO********************)
(*                                                                              *)
(*  FORMA DE CR_SECTOR_ECO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SECTOR_ECO********************)

procedure TWCrSectorEco.FormShow(Sender: TObject);
begin
     //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_SECTOR_ECO.Control:=edCVE_SECTOR_ECO;
      Objeto.DESC_SECTOR_ECO.Control:=edDESC_SECTOR_ECO;
      Objeto.CVE_TIPO_SECTOR.Control := edCVE_TIPO_SECTOR;
end;

procedure TWCrSectorEco.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SECTOR_ECO.Control:=nil;
      Objeto.DESC_SECTOR_ECO.Control:=nil;
      Objeto.CVE_TIPO_SECTOR.Control := nil;
   //Objeto
end;

procedure TWCrSectorEco.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSectorEco.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_SECTOR_ECO.SetFocus;
end;

procedure TWCrSectorEco.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_SECTOR_ECO.SetFocus;
end;

//Pega los datos de excel al grid
procedure TWCrSectorEco.Pegar1Click(Sender: TObject);
begin
   PegaInformacion(4);
end;

procedure TWCrSectorEco.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
          PegaInformacion(4);
     // if end;
end;

procedure TWCrSectorEco.SAGtaExit(Sender: TObject);
begin
     InterForma1.ValidaExit(SAGta,True,'',True);
end;

(*********************COPIA DE DATOS DE EXCEL AL CATÁLOGO***********************)
Procedure TWCrSectorEco.PegaInformacion(pLong : Integer);

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
   SAGta.ColWidths[1] := 40;
   SAGta.ColWidths[2] := 320;
   SAGta.ColWidths[3] := 100;
   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrSectorEco.CargaDatos(var Pcvesec,pdesc,pTipo : string):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_SECTOR_ECO (CVE_SECTOR_ECO,DESC_SECTOR_ECO,CVE_TIPO_SECTOR) '+
            'VALUES ( '+ #39 + Pcvesec + #39 + ',' + #39 + pdesc + #39 + ',' + #39 + pTipo +#39 + ' ) ';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

(*****************************************************************)
procedure TWCrSectorEco.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLCvesec          : String;
          VLDesc            : String;
          VLTipo            : String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     VLCvesec := '';
     VLDesc   := '';
     VLTipo   := '';
     if RGinformacion.ItemIndex = 0 then //Reemplaza la inofrmación
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin  //Borra datos existentes de la tabla en caso de reemplazar                        //delete cr_tipo_acred
           RunSQL('DELETE CR_SECTOR_ECO',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           Begin
              VLCvesec := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
              VLTipo := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
              If not(CargaDatos(VLCvesec, VLDesc, VLTipo)) then //Carga los datos del grid a la tabla
              Begin  //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'Error Clave : '+ VLCvesec + '    Desc. : '+ VLDesc );
                 if MessageDlg('¿Error en carga. Clave : ' + VLCvesec + MSG_PREG_CONTINUA_PROCES ,
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
        Begin
           VLCvesec := UpperCase(SAGta.Cells[1,VLCtdorLine]);
           VLDesc := UpperCase(VerificaCadena(SAGta.Cells[2,VLCtdorLine]));
           VLTipo := UpperCase(VerificaCadena(SAGta.Cells[3,VLCtdorLine]));
           If not(CargaDatos(VLCvesec, VLDesc, VLTipo)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLCvesec +'    Desc. : '+ VLDesc );
              if MessageDlg('¿Error en carga. Clave : ' + VLCvesec+ MSG_PREG_CONTINUA_PROCES ,
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

procedure TWCrSectorEco.RGinformacionClick(Sender: TObject);
begin
  MErrores.Clear;
end;

procedure TWCrSectorEco.edCVE_SECTOR_ECOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg     := '';
      Objeto.CVE_SECTOR_ECO.GetFromControl;
      if Objeto.CVE_SECTOR_ECO.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_SECTOR_ECO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrSectorEco.edDESC_SECTOR_ECOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_SECTOR_ECO,True,'',True);
end;

procedure TWCrSectorEco.edCVE_TIPO_SECTORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_TIPO_SECTOR,True,'',True);
end;

Procedure TWCrSectorEco.MuestraHints;
Begin
      edDESC_SECTOR_ECO.Hint := Objeto.DESC_SECTOR_ECO.AsString;
      edDESC_SECTOR_ECO.ShowHint := True;
End;

procedure TWCrSectorEco.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrSectorEco.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrSectorEco.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrSectorEco.Button1Click(Sender: TObject);

var  Cat : TCrcat;
begin
        Cat := TCrcat.Create(self);
        try
           Cat.Apli := Objeto.Apli;           Cat.ParamCre:=Objeto.ParamCre;
           Cat.Catalogo;
        finally
           Cat.Free;
        end;

end;

end.
