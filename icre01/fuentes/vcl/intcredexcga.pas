// Sistema         : Clase de CR_GRUPO_ECO
// Fecha de Inicio : 15/05/2003
// Función forma   : Clase de CR_GRUPO_ECO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCredExcGa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,Grids, Aligrid, Menus, InterEdit,

//CLASES ADICIONALES
IntParamCre, //Datos panel
IntGenCre, IntSGCtrl, IntLinkit, //Clase generica
IntCrCto      //CONTRATO
;

Type
 TCredExcGa= class;

  TWCredExcGa=Class(TForm)
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
    SAGta: TStringAlignGrid;
    Bevel3: TBevel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    sgCreditos: TSGCtrl;
    Label3: TLabel;
    btCredito: TBitBtn;
    edID_CREDITO: TInterEdit;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    Bevel5: TBevel;
    Label4: TLabel;
    Bevel6: TBevel;
    Label6: TLabel;
    Label9: TLabel;
    Bevel7: TBevel;
    rgSIT_REGISTRO: TRadioGroup;
    Bevel1: TBevel;
    Label5: TLabel;
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

    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCreditoClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure sgCreditosMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure MuestraRegistros();
    procedure sgCreditosCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCredExcGa;
    Procedure PegaInformacion(pLong : Integer);
    Function  CargaDatos(var PID_CREDITO,pSIT_REGISTRO:String):boolean;
end;
 TCredExcGa= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public

        { Public declarations }
        ID_CREDITO           : TInterCampo;
        SIT_REGISTRO         : TInterCampo;

        F_ALTA               : TInterCampo;
        CVE_USU_ALTA         : TInterCampo;
        F_MODIFICA           : TInterCampo;
        CVE_USU_MODIF        : TInterCampo;

        //
        ParamCre                 : TParamCre;
        SAGta                    : TStringAlignGrid;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    InternalBusca : Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCredExcGa.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
               ID_CREDITO.Caption:='Id credito';
      SIT_REGISTRO :=CreaCampo('SIT_REGISTRO',ftstring,tsNinguno,tsNinguno,True);
                SIT_REGISTRO.Caption:='Situacion';
      With SIT_REGISTRO do begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('AC');
        ComboLista.Add('1'); ComboDatos.Add('IN');
      end;


      F_ALTA  := CreaCampo('F_ALTA',ftDatetime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha alta';
      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='usuario alta';
      F_MODIFICA   := CreaCampo('F_MODIFICA',ftDatetime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='fecha modificacion';
      CVE_USU_MODIF := CreaCampo('CVE_USU_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIF.Caption:='usuario modificacion';

      FKeyFields.Add('ID_CREDITO');


      TableName := 'CR_CRED_EXC_GAR';
      UseQuery := True;
      HelpFile := '';
      ShowMenuReporte:=false;
end;

Destructor TCredExcGa.Destroy;
begin inherited;
end;


function TCredExcGa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCredExcGa;
begin
   W:=TWCredExcGa.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo ;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCredExcGa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICREDEXCGA.IT','');
      Try if Active then begin end;
          if T.Execute then
                InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA                                                           *)
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TWCredExcGa.MuestraRegistros();
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT ID_CREDITO,SIT_REGISTRO,CVE_USU_ALTA,F_ALTA,CVE_USU_MODIF,F_MODIFICA' + coCRLF +
              '   FROM CR_CRED_EXC_GAR ' + coCRLF +
              ' ORDER BY ID_CREDITO ' ;

     vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('ID_CREDITO').DisplayWidth := 12;
            vlQry.FieldByName('SIT_REGISTRO').DisplayWidth := 8;
            vlQry.FieldByName('CVE_USU_ALTA').DisplayWidth := 10;
            vlQry.FieldByName('F_ALTA').DisplayWidth := 18;
            vlQry.FieldByName('CVE_USU_MODIF').DisplayWidth := 10;
            vlQry.FieldByName('F_MODIFICA').DisplayWidth := 18;

            sgCreditos.AddQry( vlQry, True,True,-1,-1,-1,False);
        end
        else
        Begin
           sgCreditos.Clear('NO HAY REGISTROS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCredExcGa.FormShow(Sender: TObject);
begin
     //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control    := edID_CREDITO;
      Objeto.SIT_REGISTRO.Control  := rgSIT_REGISTRO;

end;

procedure TWCredExcGa.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control   :=nil;
      Objeto.SIT_REGISTRO.Control :=nil;

end;

procedure TWCredExcGa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCredExcGa.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgSIT_REGISTRO.ItemIndex := 0;
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;  ;

   sgCreditos.Enabled := False;


   edID_CREDITO.SetFocus;

end;

procedure TWCredExcGa.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIF.AsString := Objeto.Apli.Usuario;
   sgCreditos.Enabled := False;
   btCredito.Enabled := False;
   edID_CREDITO.SetFocus;
end;

//Pega los datos de excel al grid
procedure TWCredExcGa.Pegar1Click(Sender: TObject);
begin
   PegaInformacion(10);
end;

procedure TWCredExcGa.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Shift = [ssCtrl] ) and (Key = 86)) then
        PegaInformacion(6);
   // if end;
end;

procedure TWCredExcGa.SAGtaExit(Sender: TObject);
begin
   InterForma1.ValidaExit(SAGta,True,'',True);
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
Function TWCredExcGa.CargaDatos(var PID_CREDITO,pSIT_REGISTRO:String):boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := 'INSERT INTO CR_CRED_EXC_GAR (ID_CREDITO, SIT_REGISTRO, F_ALTA, CVE_USU_ALTA  ) '+
            '         VALUES ( '+ PID_CREDITO + ',' + #39 + pSIT_REGISTRO + #39+ ',SYSDATE,' + #39 + Objeto.Apli.Usuario + #39 +') ';

   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

(*****************************************************************)
procedure TWCredExcGa.btCargaClick(Sender: TObject);
var       VLCtdorLine       : Integer;
          VLID_CREDITO      : String;
          vlSIT_REGISTRO    : String;
          vlMsg             : String;
          vlTermina         : Boolean;
begin

 IF Trim(SAGta.Cells[0,0]) <> CNULL THEN
   IF Trim(SAGta.Cells[1,0]) <> CNULL THEN
   BEGIN
     vlTermina := False;
     if RGinformacion.ItemIndex = 0 then  //Reemplaza la información
     begin
        MErrores.Clear;
        if MessageDlg(MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
           //Borra datos existentes de la tabla en caso de reemplazar
           RunSQL('DELETE CR_CRED_EXC_GAR ',objeto.Apli.DataBaseName,objeto.Apli.SessionName,True);
           messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicia proceso
           For VLCtdorLine := 0 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
           begin
              VLID_CREDITO := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              vlSIT_REGISTRO := 'AC';
              If not(CargaDatos(VLID_CREDITO, vlSIT_REGISTRO)) then  //Carga los datos del grid a la tabla
              Begin   //Muestra errores que se tienen en la carga
                 AddLine(MErrores,'Error Crédito : '+ VLID_CREDITO );
                 if MessageDlg('¿Error en carga de crédito : ' + VLID_CREDITO + MSG_PREG_CONTINUA_PROCES ,
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
              VLID_CREDITO := UpperCase(SAGta.Cells[1,VLCtdorLine]);
              vlSIT_REGISTRO := 'AC';
           If not(CargaDatos(VLID_CREDITO, vlSIT_REGISTRO)) then
           Begin
              AddLine(MErrores,'Error Crédito : '+ VLID_CREDITO  );
              if MessageDlg('¿Error en carga. Clave : ' + VLID_CREDITO  + MSG_PREG_CONTINUA_PROCES ,
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

 //damos refresh al grid
 MuestraRegistros;
 if sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row] <> CNULL then
     Objeto.FindKey([sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row]]);

end;
procedure TWCredExcGa.RGinformacionClick(Sender: TObject);
begin
   MErrores.Clear
end;
       
procedure TWCredExcGa.PegaInformacion(pLong : Integer);
var l_Tempo, l_Ciclo :Integer;
   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en No. Línea: '+ SAGta.Cells[1,pRow]);
      SAGta.RemoveRow(pRow);
   end;

   //Depura Lineas
   Procedure DepuraLineas;
   var  l_Ciclo   : Integer;
        vlLong    : Integer;
        vlCredito : String;
   Begin
      l_Ciclo := 0;
      while l_Ciclo <= SAGta.RowCount -1 do
      Begin
          vlLong    := Length(SAGta.Cells[1,l_Ciclo]);
          vlCredito := Trim(SAGta.Cells[1,l_Ciclo]);
          //columna en blanco
          SAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);
           if (trim('>'+trim(SAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  then
           Begin
                    limpiaRow(l_Ciclo);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if (( vlLong = 0 ) OR ( vlLong > pLong )) then
           Begin
                    limpiaRow(l_Ciclo);
                    SAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (SAGta.RowCount = 1) then  exit
           end
           else if not IsFloat(vlCredito) then
           Begin
                    limpiaRow(l_Ciclo);
                    AddLine(MErrores,' en el credito  : '+ vlCredito);
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

   {if SAGta.ColCount = 3 then
      SAGta.RemoveCol(0);
    }

   SAGta.CopyFromClipboard;
   except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
   end;


   SAGta.InsertCol(0);
   SAGta.ColCount := 2;
   {
   if SAGta.ColCount < 3 then
      SAGta.InsertCol(0)
   else if SAGta.ColCount > 3 then
        SAGta.ColCount := 3;
   //end if
    }

   SAGta.ColWidths[0] := 60;
   SAGta.ColWidths[1] := 150;

   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;


procedure TWCredExcGa.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
        Realizado := True;
        //valido el credito
        if   (trim(edID_CREDITO.Text) = '0') or (trim(edID_CREDITO.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el Crédito Correspondiente.');
        end;
      end  
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
              Realizado := True;
              //valido el credito
              if   (trim(edID_CREDITO.Text) = '0') or (trim(edID_CREDITO.Text) =  '')    then
              begin
                 Realizado := false;
                 ShowMessage('Es necesario ingresar el Crédito Correspondiente.');
              end;
      end
      else Realizado := False;
   end
   // end if
end;

procedure TWCredExcGa.btCreditoClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             ID_CREDITO.AsString := T.DameCampo(0);
           End;
      Finally
        T.Free;
      End;
    End;
end;


procedure TWCredExcGa.InterForma1DespuesShow(Sender: TObject);
begin
//damos refresh al grid
 MuestraRegistros;
 if sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row] <> CNULL then
     Objeto.FindKey([sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row]]);

end;

procedure TWCredExcGa.InterForma1DespuesAceptar(Sender: TObject);
begin
//damos refresh al grid
 MuestraRegistros;
 if sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row] <> CNULL then
     Objeto.FindKey([sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row]]);

      sgCreditos.Enabled := True;

end;

procedure TWCredExcGa.sgCreditosMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  IF sgCreditos.CellStr['ID_CREDITO',ToIndex] <> CNULL THEN
   Begin
      Objeto.FindKey([sgCreditos.CellStr['ID_CREDITO',ToIndex]]);

   end
end;

procedure TWCredExcGa.InterForma1DespuesEliminar(Sender: TObject);
begin
     if sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row] <> CNULL then
        MuestraRegistros;
        Objeto.FindKey([ sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row]]);

end;


procedure TWCredExcGa.sgCreditosCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
var  vlCadTotal : String;
begin
    vlCadTotal := '1';
end;


procedure TWCredExcGa.InterForma1Buscar(Sender: TObject);
begin
Objeto.Busca;
  {if Objeto.Busca then
  Begin
        MuestraRegistros;
        Objeto.FindKey([ sgCreditos.CellStr['ID_CREDITO',sgCreditos.SG.Row]]);
   End;}
end;

procedure TWCredExcGa.InterForma1DespuesCancelar(Sender: TObject);
begin
    sgCreditos.Enabled := true;
end;

end.
