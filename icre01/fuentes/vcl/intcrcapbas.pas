unit IntCrCapBas;
interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, DBCtrls, Grids, IntParamCre,
  Aligrid;

const

  NaranjaOscuro = $00DAEAFD;
  VerdeOscuro   = $00DDF1EB;

type
  TCrCapBas  = class;
  TWCrCapBas = class(TForm)
    InterForma1: TInterForma;
    sagCapitalBasico: TStringAlignGrid;
    rgTipo_Entidades: TRadioGroup;
    qCapital_Basico: TQuery;
    btModificar: TBitBtn;
    btAceptar: TBitBtn;
    btCancelar: TBitBtn;
    spUpdCapBas: TStoredProc;
    dtpFecha: TInterDateTimePicker;
    edFecha: TEdit;
    lbFecha: TLabel;
    sagReservas: TStringAlignGrid;
    qReservas: TQuery;
    btAgrega: TBitBtn;
    btElimina: TBitBtn;
    spLimpiaTabla: TStoredProc;
    spAgregaCapBas: TStoredProc;
    spUpdPctCapital: TStoredProc;
    chbModificaPorcentajes: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure rgTipo_EntidadesClick(Sender: TObject);
    procedure pCargaInfoGrid (TipoEntidad : String);    //Carga la informacion para la entidad Seleccionada [FEDERAL, ESTATAL, MUNICIPAL, TODOS]
    procedure pCargaInfoReservas (TipoEntidad : String);    //Carga la informacion para la entidad Seleccionada [FEDERAL, ESTATAL, MUNICIPAL, TODOS]
    procedure btModificarClick(Sender: TObject);
    procedure sagCapitalBasicoValidateEdit(Sender: TObject; col,
      row: Integer; var result: Boolean);
    procedure sagCapitalBasicoSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure btCancelarClick(Sender: TObject);
    procedure pRecalculaPorcentajes (varCapital : Real);
    procedure sagCapitalBasicoAfterEdit(Sender: TObject; col,
      row: Integer);
    procedure btAceptarClick(Sender: TObject);
    procedure dtpFechaChange(Sender: TObject);
    procedure btAgregaClick(Sender: TObject);
    procedure btEliminaClick(Sender: TObject);
    procedure sagCapitalBasicoBeforeEdit(Sender: TObject; col,
      row: Integer);
    procedure chbModificaPorcentajesClick(Sender: TObject);

  private
    { Private }
    B_Modificar : String; //Bandera Modificar
    B_Modifica_Capital :String;
    B_Modifica_Porc :String;
    varCapInicial  : String;
    vTipoEntidad : String;
  public
    { Public declarations }
    Objeto : TCrCapBas;
  end;

  TCrCapBas= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

      ParamCre : TParamCre;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;


      published
      end;


implementation

constructor TCrCapBas.Create( AOwner : TComponent );
begin Inherited;
 DecimalSeparator:= '.';
 Thousandseparator:=',';
end;

Destructor TCrCapBas.Destroy;
begin inherited;
end;

function TCrCapBas.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCapBas;
begin
   W:=TWCrCapBas.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

{$R *.DFM}

procedure TWCrCapBas.FormShow(Sender: TObject);
begin
  DecimalSeparator   := '.';
  Thousandseparator  := ',';
  B_Modificar        := 'F';
  B_Modifica_Capital := 'F';
  B_Modifica_Porc    := 'F';
  rgTipo_EntidadesClick(Self);
  dtpFecha.DateTime := Objeto.Apli.DameFechaEmpresa;
  dtpFechaChange(Self);

end;

procedure TWCrCapBas.rgTipo_EntidadesClick(Sender: TObject);
begin
  sagCapitalBasico.ResetColorRowAll;

  If rgTipo_Entidades.ItemIndex = 0 Then
     begin
       pCargaInfoGrid ('FEDERAL');
       pCargaInfoReservas('FEDERAL');
       vTipoEntidad := 'FEDERAL';
       btModificar.Enabled := True;
     end;

  If rgTipo_Entidades.ItemIndex = 1 Then
     begin
       pCargaInfoGrid ('ESTATAL');
       pCargaInfoReservas('ESTATAL');
       vTipoEntidad := 'ESTATAL';
       btModificar.Enabled := True;
     end;

   If rgTipo_Entidades.ItemIndex = 2 Then
     begin
       pCargaInfoGrid ('MUNICIPAL');
       pCargaInfoReservas('MUNICIPAL');
       vTipoEntidad := 'MUNICIPAL';
       btModificar.Enabled := True;
     end;

   If rgTipo_Entidades.ItemIndex = 3 Then
     begin
       btModificar.Enabled := False;
       pCargaInfoGrid ('TIPO_ENTIDAD');
       vTipoEntidad := '';
       btAgrega.Visible   := False;
       btElimina.Visible  := False;
       btAceptar.Enabled  := False;
       btCancelar.Enabled := False;
       chbModificaPorcentajes.Visible := False;
     end;
end;

 procedure TWCrCapBas.pCargaInfoGrid (TipoEntidad : String);
 var i : Integer;
     B_TraeDatos : String;
 begin
   qCapital_Basico.Close;
   qCapital_Basico.DatabaseName := Objeto.DataBaseName;
   qCapital_Basico.SessionName  := Objeto.SessionName;
   qCapital_Basico.Filtered     := False;

   If TipoEntidad <> 'TIPO_ENTIDAD' Then
   begin
     qCapital_Basico.Filter       := 'Tipo_Entidad =' + QuotedStr(TipoEntidad);
     qCapital_Basico.Filtered     := True;
   end;

   qCapital_Basico.Open;

   //Determina el numero de filas del grid
     if qCapital_Basico.RecordCount <> 0 Then
       begin
        B_TraeDatos := 'V';
        sagCapitalBasico.RowCount := qCapital_Basico.RecordCount + 1;
       end
     else
       begin
         B_TraeDatos := 'F';
         sagCapitalBasico.RowCount := 2;
       end;

      //Inicializa la variable de capital
        varCapInicial :=  qCapital_Basico.FieldByName('Imp_Capital_Basico').AsString;


   If B_TraeDatos = 'V' Then
     begin
    If  TipoEntidad <> 'TIPO_ENTIDAD' Then
      begin
         sagCapitalBasico.ColCount := 3;
         sagCapitalBasico.Width := 201;
         for i:=1 to qCapital_Basico.RecordCount + 1  do
           begin
             sagCapitalBasico.Cells[1,i] := qCapital_Basico.FieldByName('Imp_Capital_Basico').AsString;
             sagCapitalBasico.Cells[2,i] := qCapital_Basico.FieldByName('Pct_Capital').AsString;
             sagCapitalBasico.Cells[4,i] := qCapital_Basico.FieldByName('Pct_Capital').AsString;
             qCapital_Basico.Next;
           end;
         end
         else
           begin
             sagCapitalBasico.ColCount := 4;
             sagCapitalBasico.Width := 270;
             sagCapitalBasico.Cells[3,0] := 'Entidad';
             for i:=1 to qCapital_Basico.RecordCount + 1  do
              begin
                sagCapitalBasico.Cells[1,i] := qCapital_Basico.FieldByName('Imp_Capital_Basico').AsString;
                sagCapitalBasico.Cells[2,i] := qCapital_Basico.FieldByName('Pct_Capital').AsString;
                sagCapitalBasico.Cells[3,i] := qCapital_Basico.FieldByName('Tipo_Entidad').AsString;
                qCapital_Basico.Next;
              end;
           end;
        end
    else
    begin
      sagCapitalBasico.ColCount := 3;
      sagCapitalBasico.RowCount := 2;
      sagCapitalBasico.Cells[1,1] := '';
      sagCapitalBasico.Cells[2,1] := '100';
    end;

 end;

procedure TWCrCapBas.btModificarClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCAPBAS_MODI',True,True) then
   begin
      btAceptar.Enabled  := True;
      btCancelar.Enabled := True;
      sagCapitalBasico.Editable := True;
      chbModificaPorcentajes.Visible := True;
      chbModificaPorcentajes.Checked := False;
      B_Modificar := 'V';
   end;
end;

procedure TWCrCapBas.sagCapitalBasicoValidateEdit(Sender: TObject; col,
  row: Integer; var result: Boolean);
 var
    s: string;
    e: integer;
    i: real;
  begin
    if row in [1] then
    begin
      s := sagCapitalBasico.Cells [col, row];
      val (s, i, e);
      result := e = 0;
      if not result then
        MessageDlg (Format ('[%s] no es un numero válido', [s]), mtError, [mbOk], 0);
    end;
  end;

procedure TWCrCapBas.sagCapitalBasicoSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if Acol In [1,2] Then
  CanSelect := False;

  if (B_Modificar = 'V') Then
  begin
    if ((ARow = 1) And (Acol = 1) ) Then
      CanSelect := True;
      sagCapitalBasico.Options := sagCapitalBasico.Options + [goEditing];

    if ((ARow <>1) And (Acol = 2) ) And (chbModificaPorcentajes.Checked = True) Then
      CanSelect := True;
      sagCapitalBasico.Options := sagCapitalBasico.Options + [goEditing];
    end;

end;

procedure TWCrCapBas.btCancelarClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCAPBAS_CANC',True,True) then
   begin
      sagCapitalBasico.Options := sagCapitalBasico.Options - [goEditing];
      sagCapitalBasico.ResetColorRowAll;
      B_Modificar := 'F';
      FormShow(Self);
      btAceptar.Enabled  := False;
      btCancelar.Enabled := False;
      btAgrega.Visible   := False;
      btElimina.Visible  := False;
      chbModificaPorcentajes.Visible := False;
   end;
end;

 procedure TWCrCapBas.pRecalculaPorcentajes (varCapital : Real);
 var i: Integer;
     Porcentaje : Real;
 begin

    for i:=2 to sagCapitalBasico.RowCount - 1 do
       begin
         Porcentaje := varCapital* (StrToFloat(sagCapitalBasico.Cells[2,i])/100);
         sagCapitalBasico.Cells[1,i] := FloatToStr(Porcentaje);
       end;
 end;

procedure TWCrCapBas.sagCapitalBasicoAfterEdit(Sender: TObject; col,
  row: Integer);
begin
   if (sagCapitalBasico.Cells[3,row] = '') And (sagCapitalBasico.Cells[2,row] <> sagCapitalBasico.Cells[4,row]) then
   begin
     sagCapitalBasico.Cells[3,row] := '3';
     B_Modifica_Porc := 'V';
     sagCapitalBasico.ColorRow [sagCapitalBasico.Row] := clYellow;
     //MessageDlg(sagCapitalBasico.Cells[4,row], mtInformation, [mbOk], 0);
   end
   else
   begin
     sagCapitalBasico.Cells[4,row] := sagCapitalBasico.Cells[2,row];
   end;
   
   pRecalculaPorcentajes(StrToFloat(sagCapitalBasico.Cells[1,1]));
end;

procedure TWCrCapBas.btAceptarClick(Sender: TObject);
var
  psResultado, psTxResultado : String;
  j : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCAPBAS_ACEP',True,True) then
   begin
      if varCapInicial <> sagCapitalBasico.Cells[1,1] then
          begin
          spUpdCapBas.DatabaseName   := Objeto.DataBaseName;
          spUpdCapBas.SessionName    := Objeto.SessionName;
          spUpdCapBas.StoredProcName := 'PKGCRPORTCREDITO.STPUPDCAPBAS';
          spUpdCapBas.Params.Clear;

          spUpdCapBas.Params.CreateParam (ftFloat, 'peImp_Capital_Basico' ,ptInput);
          spUpdCapBas.Params.CreateParam (ftString,'peF_Vigente_Desde',ptInput);
          spUpdCapBas.Params.CreateParam (ftString,'peUsuario'        ,ptInput);
          spUpdCapBas.Params.CreateParam (ftString,'psResultado'      ,ptOutput);
          spUpdCapBas.Params.CreateParam (ftString,'psTxResultado'    ,ptOutput);

          spUpdCapBas.ParamByName('peImp_Capital_Basico').AsFloat   := StrToFloat(sagCapitalBasico.Cells[1,1]);
          spUpdCapBas.ParamByName('peF_Vigente_Desde').AsString := edFecha.Text;
          spUpdCapBas.ParamByName('peUsuario').AsString         := Objeto.Apli.Usuario;

          spUpdCapBas.ExecProc;

          psResultado   := spUpdCapBas.ParamByName('psResultado').AsString;
          psTxResultado := spUpdCapBas.ParamByName('psTxResultado').AsString;

          //Verifica que se guardaron correctamente los datos
          if psResultado = '0' then
            begin
              MessageDlg('Se actualizo el capital con exito', mtInformation, [mbOk], 0);
              btAceptar.Enabled  := False;
              btCancelar.Enabled := False;
              btAgrega.Visible   := False;
              btElimina.Visible  := False;
              chbModificaPorcentajes.Visible := False;
              sagCapitalBasico.Editable := False;
              sagCapitalBasico.Options := sagCapitalBasico.Options - [goEditing];
              B_Modificar := 'F';
            end
          else
            begin
              MessageDlg('Hubo un error :  '+ psTxResultado, mtError, [mbOk], 0);
            end;

       end;

      //Declaramos los procedimientos para realizar los cambios en los porcentajes de Capital

      if  (chbModificaPorcentajes.Checked = True) and (B_Modifica_Porc = 'V') then
      begin

      //Definimos el procedimiento para limpiar la tabla en memoria
          spLimpiaTabla.DatabaseName   := Objeto.DataBaseName;
          spLimpiaTabla.SessionName    := Objeto.SessionName;
          spLimpiaTabla.StoredProcName := 'PKGCRPORTCREDITO.STPLIMPIATABLA';
          spLimpiaTabla.Params.Clear;
          spLimpiaTabla.Params.Clear;
          spLimpiaTabla.Params.CreateParam( ftString, 'pDummy',   ptInput);
          spLimpiaTabla.Prepare;

      //Limpia la tabla
          spLimpiaTabla.ExecProc;

      //Procedimiento que inserta los datos en la tabla en memoria
           spAgregaCapBas.DatabaseName   := Objeto.DatabaseName;
           spAgregaCapBas.SessionName    := Objeto.SessionName;
           spAgregaCapBas.StoredProcName := 'PKGCRPORTCREDITO.STPAGREGACAPBAS';
           spAgregaCapBas.Params.Clear;

           spAgregaCapBas.Params.CreateParam( ftString, 'peTipo_Entidad',     ptInput);
           spAgregaCapBas.Params.CreateParam( ftString, 'peB_Del_Ins',        ptInput);
           spAgregaCapBas.Params.CreateParam( ftFloat,  'pePct_Capital',      ptInput);
           spAgregaCapBas.Params.CreateParam( ftFloat,  'pePct_Capital_Ant',  ptInput);
           spAgregaCapBas.Params.CreateParam( ftString,  'peF_Vigente_Desde', ptInput);
           spAgregaCapBas.Params.CreateParam( ftFloat,  'peImp_Capital_Basico',   ptInput);
           spAgregaCapBas.Params.CreateParam( ftString,  'peCve_Usu_Alta',ptInput);


         //Procedimiento que inserta los datos en la tabla Temporal
           spUpdPctCapital.DatabaseName   := Objeto.DatabaseName;
           spUpdPctCapital.SessionName    := Objeto.SessionName;
           spUpdPctCapital.StoredProcName := 'PKGCRPORTCREDITO.STPUPDPCTCAPITAL';
           spUpdPctCapital.Params.Clear;

           spUpdPctCapital.Params.CreateParam (ftInteger, 'psResultado',ptOutput);
           spUpdPctCapital.Params.CreateParam (ftString,'psTxResultado',  ptOutput);

        //Recorremos el grid para insertar los datos en la Tabla Temporal
         for j:=2 to sagCapitalBasico.RowCount - 1  do
            begin
             spAgregaCapBas.ParamByName('peTipo_Entidad').AsString     := vTipoEntidad;
             spAgregaCapBas.ParamByName('peB_Del_Ins').AsString        := sagCapitalBasico.Cells[3,j];
             spAgregaCapBas.ParamByName('pePct_Capital').AsFloat       := StrToFloat(sagCapitalBasico.Cells[2,j]);
             spAgregaCapBas.ParamByName('pePct_Capital_Ant').AsFloat   := StrToFloat(sagCapitalBasico.Cells[4,j]);
             spAgregaCapBas.ParamByName('peF_Vigente_Desde').AsString  := edFecha.Text;
             spAgregaCapBas.ParamByName('peImp_Capital_Basico').AsFloat    := StrToFloat(sagCapitalBasico.Cells[1,j]);
             spAgregaCapBas.ParamByName('peCve_Usu_Alta').AsString := Objeto.Apli.Usuario;
             spAgregaCapBas.ExecProc;
            end;

         //Se recorre la tabla para realizar los cambios
         spUpdPctCapital.ExecProc;

          psResultado   := spUpdPctCapital.ParamByName('psResultado').AsString;
          psTxResultado := spUpdPctCapital.ParamByName('psTxResultado').AsString;

          //Verifica que se guardaron correctamente los datos
          if psResultado = '0' then
            begin
              MessageDlg('Los porcentajes se actualizaron con exito ', mtInformation, [mbOk], 0);
              btAceptar.Enabled  := False;
              btCancelar.Enabled := False;
              chbModificaPorcentajes.Visible := False;
              sagCapitalBasico.Editable := False;
              sagCapitalBasico.Options := sagCapitalBasico.Options - [goEditing];
              B_Modificar := 'F';
              btAgrega.Visible   := False;
              btElimina.Visible  := False;

            end
          else
            begin
              MessageDlg('Hubo un error :  '+ psTxResultado, mtError, [mbOk], 0);
            end;
       end;

       FormShow(Self);
   end;
end;

procedure TWCrCapBas.dtpFechaChange(Sender: TObject);
begin
  edFecha.Text := FormatDateTime('DD/MM/YYYY',dtpFecha.DateTime);
end;

procedure TWCrCapBas.pCargaInfoReservas (TipoEntidad : String);
 var i : Integer;
 var vPctAnterior, B_TraeDatos : String;
 begin
   vPctAnterior := '.01';

   qReservas.Close;
   qReservas.DatabaseName := Objeto.DataBaseName;
   qReservas.SessionName  := Objeto.SessionName;
   qReservas.Filtered     := False;

   If TipoEntidad <> 'TIPO_ENTIDAD' Then
   begin
     qReservas.Filter       := 'Tipo_Entidad =' + QuotedStr(TipoEntidad);
     qReservas.Filtered     := True;
   end;

   qReservas.Open;

   //Determina el numero de filas del grid
     if qReservas.RecordCount <> 0 Then
       begin
        sagReservas.RowCount := qReservas.RecordCount + 1;
        B_TraeDatos := 'V';
       end
     else
      begin
       B_TraeDatos := 'F';
       sagReservas.RowCount := 2;
       sagReservas.Cells[0,1] := '';
       sagReservas.Cells[1,1] := '';
      end;

     if B_TraeDatos = 'V' then
     begin
       for i:=1 to qReservas.RecordCount + 1  do
         begin
           sagReservas.Cells[0,i] := qReservas.FieldByName('Calificacion').AsString;
           sagReservas.Cells[1,i] := vPctAnterior + '%' + ' a '+ qReservas.FieldByName('PCT_Reserva_Sup').AsString + '%';
           vPctAnterior := FloatToStr((strToFloat(qReservas.FieldByName('PCT_Reserva_Sup').AsString)+ 0.01 ));
           qReservas.Next;
         end;
     end;
 end;

procedure TWCrCapBas.btAgregaClick(Sender: TObject);
begin
  if (sagCapitalBasico.Cells[2,sagCapitalBasico.Row] <> '') and (sagCapitalBasico.Cells[1,sagCapitalBasico.Row] <> '')  Then
     begin
       sagCapitalBasico.InsertRow(sagCapitalBasico.Row + 1 );
       sagCapitalBasico.ColorRow [sagCapitalBasico.Row +1] := VerdeOscuro;
       sagCapitalBasico.Cells[3,sagCapitalBasico.Row +1] := '1';
       B_Modifica_Porc := 'V';
     end;
end;

procedure TWCrCapBas.btEliminaClick(Sender: TObject);
begin
if sagCapitalBasico.Row <> 1 Then
  begin
    sagCapitalBasico.ColorRow [sagCapitalBasico.Row] := NaranjaOscuro;
    sagCapitalBasico.Cells[3,sagCapitalBasico.Row] := '2';
    B_Modifica_Porc := 'V';
  end;
end;

procedure TWCrCapBas.sagCapitalBasicoBeforeEdit(Sender: TObject; col,
  row: Integer);
begin
     sagCapitalBasico.Cells[4,row]  :=   sagCapitalBasico.Cells[2,row];
end;

procedure TWCrCapBas.chbModificaPorcentajesClick(Sender: TObject);
begin
  if chbModificaPorcentajes.Checked = True then
    begin
      btAgrega.Visible   := True;
      btElimina.Visible  := True;
    end
  else
    begin
      btAgrega.Visible   := False;
      btElimina.Visible  := False;
    end;

end;

end.
