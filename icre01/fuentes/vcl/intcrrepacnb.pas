// Sistema         : Clase de CR_LOCAL_CNBV
// Fecha de Inicio : 29/01/2004
// Función forma   : Clase de CR_LOCAL_CNBV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrRePaCnb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
Menus, IntGenCre;

const
  C_COLCVE  = 0;
  C_COLDESC = 1;

Type
 TCrRePaCnb= class;

  TWCrRePaCnb=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    Label12: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    MErrores: TMemo;
    SAGta: TStringAlignGrid;
    lbCVE_LOCAL_CNBV: TLabel;
    edCVE_LOCAL_CNBV: TEdit;
    lbDESC_LOCAL_CNBV: TLabel;
    edDESC_LOCAL_CNBV: TEdit;
    PopupMenu1: TPopupMenu;
    Pegar1: TMenuItem;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure SAGtaExit(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGinformacionClick(Sender: TObject);
    procedure edCVE_LOCAL_CNBVExit(Sender: TObject);
    procedure edDESC_LOCAL_CNBVExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    private 
    { Private declarations }
      Procedure PegaInformacion(pLong : Integer);
      Function CargaDatos(var pCVE_LOCAL_CNBV, pDESC_LOCAL_CNBV : string):boolean; 
    public 
    { Public declarations } 
    Objeto : TCrRePaCnb;
end; 
 TCrRePaCnb= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        
        ParamCre                 : TParamCre;
        CVE_LOCAL_CNBV           : TInterCampo;
        DESC_LOCAL_CNBV          : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrRePaCnb.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_LOCAL_CNBV :=CreaCampo('CVE_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
                CVE_LOCAL_CNBV.Caption:='Clave de Local Cnbv';
      DESC_LOCAL_CNBV :=CreaCampo('DESC_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
                DESC_LOCAL_CNBV.Caption:='Descripción Local Cnbv';
      FKeyFields.Add('CVE_LOCAL_CNBV');

      TableName := 'CR_LOCAL_CNBV'; 
      UseQuery := True; 
      HelpFile := 'IntCrRePaCnb.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrRePaCnb.Destroy;
begin inherited;
end;


function TCrRePaCnb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRePaCnb;
begin
   W:=TWCrRePaCnb.Create(Self);
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


Function TCrRePaCnb.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrLoCn.it','S');
      Try if Active then begin T.Param(0,CVE_LOCAL_CNBV.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrRePaCnb.Reporte:Boolean; 
begin Result := True; 
end;


(***********************************************FORMA CR_LOCAL_CNBV********************)
(*                                                                              *)
(*  FORMA DE CR_LOCAL_CNBV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_LOCAL_CNBV********************)

procedure TWCrRePaCnb.FormShow(Sender: TObject);
begin
      Objeto.CVE_LOCAL_CNBV.Control:=edCVE_LOCAL_CNBV;
      Objeto.DESC_LOCAL_CNBV.Control:=edDESC_LOCAL_CNBV;

     //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
     With Objeto Do
      Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
      End;
end;

procedure TWCrRePaCnb.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_LOCAL_CNBV.Control:=nil;
      Objeto.DESC_LOCAL_CNBV.Control:=nil;
   //Objeto
end;

procedure TWCrRePaCnb.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRePaCnb.InterForma1DespuesNuevo(Sender: TObject);
begin    MuestraHints;
   edCVE_LOCAL_CNBV.SetFocus;
end;

procedure TWCrRePaCnb.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_LOCAL_CNBV.SetFocus;
end;

procedure TWCrRePaCnb.Pegar1Click(Sender: TObject);
begin
   PegaInformacion(3);
end;


procedure TWCrRePaCnb.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((Shift = [ssCtrl] ) and (Key = 86)) then
          PegaInformacion(3);
     // if end;
end;

procedure TWCrRePaCnb.SAGtaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(SAGta,True,'',True);
end;

(*********************COPIA DE DATOS DE EXCEL AL CATÁLOGO***********************)
Procedure TWCrRePaCnb.PegaInformacion(pLong : Integer);

var l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en Cve: '+ SAGta.Cells[C_COLCVE,  pRow] +
                       '       Desc.: '+ SAGta.Cells[C_COLDESC, pRow] + ' es nula. ');
      SAGta.RemoveRow(pRow);
   end;

   //Depura Lineas
   Procedure DepuraLineas;
   var nRow, nRowCountAnt : Integer;
   Begin
     nRow := 0;
     With SAGta Do
      While (nRow < RowCount) Do
       Begin
         If (Trim(Cells[C_COLCVE,nRow]) = '') Or
            (Trim(Cells[C_COLDESC,nRow]) = '') Then
             Begin
             nRowCountAnt := RowCount;
             LimpiaRow(nRow);
             If (nRowCountAnt = 1) Then
              Begin
              ClearGrid(SAGta,0);
              Break;
              End;
             nRow := 0;
             End
         Else
          Inc(nRow);
       End;
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
   if SAGta.ColCount = 2 then
      SAGta.RemoveCol(0);
   //end if
   SAGta.CopyFromClipboard;
   except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
   end;
   if SAGta.ColCount < 2 then
       SAGta.InsertCol(0)
   else if SAGta.ColCount > 2 then
         SAGta.ColCount := 2;
   //end if

   SAGta.ColWidths[0] := 80;
   SAGta.ColWidths[1] := 415;

   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCrRePaCnb.CargaDatos(var pCVE_LOCAL_CNBV, pDESC_LOCAL_CNBV : string):boolean;
var Qry : TQuery;
Begin
   Result := False;
   Qry := TQuery.Create(Nil);
   If Assigned(Qry) Then
    With Qry Do
     Try
      DataBaseName := Objeto.Apli.DataBaseName;
      SessionName := Objeto.Apli.SessionName;
      SQL.Clear;
      SQL.Add('INSERT INTO CR_LOCAL_CNBV (CVE_LOCAL_CNBV, DESC_LOCAL_CNBV) '+
              'VALUES (:PCVE_LOCAL_CNBV, :PDESC_LOCAL_CNBV) ');
      Params.Clear;
      Params.CreateParam(ftString,'PCVE_LOCAL_CNBV',ptInput);
      Params.CreateParam(ftString,'PDESC_LOCAL_CNBV',ptInput);
      ParamByName('PCVE_LOCAL_CNBV').AsString := pCVE_LOCAL_CNBV;
      ParamByName('PDESC_LOCAL_CNBV').AsString := pDESC_LOCAL_CNBV;
      ExecSQL;

      SQL.Clear; Params.Clear;
      SQL.Add('COMMIT');
      ExecSQL;

      Result := True;
    Finally
      Close;
      Free;
    End;
end;

procedure TWCrRePaCnb.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLCVE_LOCAL_CNBV  : String;
          VLDESC_LOCAL_CNBV : String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin
 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     VLCVE_LOCAL_CNBV  := '';
     VLDESC_LOCAL_CNBV := '';
     if RGinformacion.ItemIndex = 0 then //Reemplaza la inofrmación
     Begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin  //Borra datos existentes de la tabla en caso de reemplazar                        //delete cr_tipo_acred
           RunSQL('DELETE CR_LOCAL_CNBV',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           Begin
              VLCVE_LOCAL_CNBV := UpperCase(SAGta.Cells[C_COLCVE, VLCtdorLine]);
              VLDESC_LOCAL_CNBV := UpperCase(SAGta.Cells[C_COLDESC, VLCtdorLine]);
              If not(CargaDatos(VLCVE_LOCAL_CNBV, VLDESC_LOCAL_CNBV)) then //Carga los datos del grid a la tabla
              Begin  //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'Error Clave : '+ VLCVE_LOCAL_CNBV + '    Desc. : '+ VLDESC_LOCAL_CNBV );
                 if MessageDlg('¿Error en carga. Clave : ' + VLCVE_LOCAL_CNBV + MSG_PREG_CONTINUA_PROCES ,
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                 Begin
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
           VLCVE_LOCAL_CNBV := UpperCase(SAGta.Cells[C_COLCVE, VLCtdorLine]);
           VLDESC_LOCAL_CNBV := UpperCase(SAGta.Cells[C_COLDESC, VLCtdorLine]);
           If not(CargaDatos(VLCVE_LOCAL_CNBV, VLDESC_LOCAL_CNBV)) then
           Begin
              AddLine(MErrores,'Error Clave : '+ VLCVE_LOCAL_CNBV +'    Desc. : '+ VLDESC_LOCAL_CNBV );
              if MessageDlg('¿Error en carga. Clave : ' + VLCVE_LOCAL_CNBV+ MSG_PREG_CONTINUA_PROCES ,
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

procedure TWCrRePaCnb.RGinformacionClick(Sender: TObject);
begin
  MErrores.Clear;
end;

procedure TWCrRePaCnb.edCVE_LOCAL_CNBVExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg     := '';
      Objeto.CVE_LOCAL_CNBV.GetFromControl;
      if Objeto.CVE_LOCAL_CNBV.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_LOCAL_CNBV,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrRePaCnb.edDESC_LOCAL_CNBVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_LOCAL_CNBV,True,'',True);
end;

Procedure TWCrRePaCnb.MuestraHints;
Begin
      edDESC_LOCAL_CNBV.Hint := Objeto.DESC_LOCAL_CNBV.AsString;
      edDESC_LOCAL_CNBV.ShowHint := True;
End;

procedure TWCrRePaCnb.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if    
end;

procedure TWCrRePaCnb.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrRePaCnb.InterForma1AntesAceptar(Sender: TObject;
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
