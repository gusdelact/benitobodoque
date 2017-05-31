// Sistema         : Clase de CR_CAL_CRED_EST
// Fecha de Inicio : 28/05/2010
// Función forma   : Clase de CR_CAL_CRED_EST
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Adolfo Rivero Rosales
// Comentarios     :
Unit IntCrCtoEstruc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, InterEdit,
IntLinkit,Ungene,
//Unidades Adicionales
IntParamCre, IntGenCre,
//IntCrCto,
IntCrAcrCon,
IntSICC,
IntCrCalCali,  // Calificacion de calificadoras
IntCrCalific  // Calificadoras
;

Type
 TCrCtoEst= class;

  TWCrCtoEstruc=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CONTRATO: TLabel;
    lbID_ACCIONISTA: TLabel;
    rgSIT_CALIFICA: TRadioGroup;
    btACREDITADO: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    Label9: TLabel;
    Bevel3: TBevel;
    sgCalificaciones: TSGCtrl;
    Label1: TLabel;
    Label2: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    MsgPanel: TPanel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    ilCVE_CALIFICACION: TInterLinkit;
    ilCALIFICADORA: TInterLinkit;
    btCalificacion: TBitBtn;
    Bevel5: TBevel;
    edID_CONTRATO: TEdit;
    edID_CALIFICADORA: TEdit;
    Label17: TLabel;
    edTXT_COMENTARIO: TMemo;
    dtpFH_CALIFICACION: TInterDateTimePicker;
    edF_CALIFICACION: TEdit;
    lbCVE_TIPO_ACCION: TLabel;
    Label13: TLabel;
    edNomCalif: TEdit;
    edCVE_CALIFICACION: TEdit;
    edID_CONTRATO2: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);

    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure sgCalificacionesMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);

    procedure rgSIT_CALIFICAExit(Sender: TObject);

    procedure InterForma1Buscar(Sender: TObject);

    procedure InterForma1DespuesEliminar(Sender: TObject);

    procedure sgCalificacionesCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);

    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edF_CALIFICACIONExit(Sender: TObject);
    procedure edCVE_CALIFICACIONExit(Sender: TObject);
    procedure ilCALIFICADORACapture(Sender: TObject; var Show: Boolean);
    procedure ilCALIFICADORAEjecuta(Sender: TObject);
    procedure ilCVE_CALIFICACIONCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_CALIFICACIONEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btCalificacionClick(Sender: TObject);
    procedure rgSIT_CALIFICAClick(Sender: TObject);
    procedure edTXT_COMENTARIOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure edID_CALIFICADORAExit(Sender: TObject);

    private
       Procedure    MuestraCalificaciones(pContrato : String);

    public
    { Public declarations }
    Objeto : TCrCtoEst;
end;
 TCrCtoEst= class(TInterFrame)
      private
      protected
      public
        { Public declarations }

        {RIRA4281 28-05-2010}
        ID_CONTRATO           : TInterCampo;
        ID_CALIFICADORA       : TInterCampo;
        CVE_CALIFICACION      : TInterCampo;
        F_CALIFICACION        : TInterCampo;
        SIT_CALIFICA          : TInterCampo;
        TXT_COMENTARIO        : TInterCampo;
        F_ALTA                : TInterCampo;
        CVE_USU_ALTA          : TInterCampo;
        F_MODIFICA            : TInterCampo;
        CVE_USU_MODIFICA      : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        //Contrato                 : TCrCto;
        Calificaciones           : TCrCalCali;
        Calificadora             : TCrCalific;


        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
{$R *.DFM}


constructor TCrCtoEst.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Id Contrato';
      ID_CALIFICADORA  :=CreaCampo('ID_CALIFICADORA',ftFloat,tsNinguno,tsNinguno,True);
                ID_CALIFICADORA.Caption:='Id Calificadora';
      CVE_CALIFICACION :=CreaCampo('CVE_CALIFICACION',ftString,tsNinguno,tsNinguno,True);
                CVE_CALIFICACION.Caption:='Clave de la calificacion';
      F_CALIFICACION :=CreaCampo('F_CALIFICACION',ftDateTime,tsNinguno,tsNinguno,True);
                 F_CALIFICACION.Caption:='Fecha de la calificacion';
      SIT_CALIFICA :=CreaCampo('SIT_CALIFICA',ftString,tsNinguno,tsNinguno,True);
         With SIT_CALIFICA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1'); ComboDatos.Add(CSIT_IN);
          end;
                SIT_CALIFICA.Caption:='Situación de la calificación';

      TXT_COMENTARIO  :=CreaCampo('TXT_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TXT_COMENTARIO.Caption:='Comentario de la calificacion';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_CALIFICADORA');

      TableName := 'CR_CAL_CTO_EST';
      UseQuery := True;
      HelpFile := 'IntCrCtoEstruc.Hlp';
      ShowMenuReporte:=True;

      {Contrato := TCrCto.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      }
      Calificadora := TCrCalific.Create(Self);
      Calificadora.MasterSource:=Self;
      Calificadora.FieldByName('ID_CALIFICADORA').MasterField:='ID_CALIFICADORA';

      Calificaciones := TCrCalCali.Create(Self);
      Calificaciones.MasterSource:=Self;
      Calificaciones.FieldByName('ID_CALIFICADORA').MasterField:='ID_CALIFICADORA';


end;

Destructor TCrCtoEst.Destroy;
begin

   if Calificadora <> nil then
      Calificadora.Free;
   if Calificaciones <> nil then
      Calificaciones.Free;


   inherited;
end;


function TCrCtoEst.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCtoEstruc;
begin
   W:=TWCrCtoEstruc.Create(Self);
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
(***********************************************FORMA CR_CAL_CTO_EST********************)
(*                                                                              *)
(*  FORMA DE CR_CAL_CTO_EST                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAL_CTO_EST********************)
procedure TWCrCtoEstruc.MuestraCalificaciones(pContrato: String);
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := '   SELECT CCCE.ID_CONTRATO,' + coCRLF +
              ' 	 CCCE.ID_CALIFICADORA,' + coCRLF +
              '          P.NOMBRE AS NOM_CALIFICADORA,' + coCRLF +
              '          CCCE.CVE_CALIFICACION,' + coCRLF +
              '          CCCE.F_CALIFICACION,  ' + coCRLF +
              '          CCCE.SIT_CALIFICA,     ' + coCRLF +
              '          CCCE.TXT_COMENTARIO,   ' + coCRLF +
              '          CCCE.F_ALTA,           ' + coCRLF +
              '          CCCE.CVE_USU_ALTA,     ' + coCRLF +
              '          CCCE.F_MODIFICA,       ' + coCRLF +
              '          CCCE.CVE_USU_MODIFICA ' + coCRLF +
              ' FROM CR_CAL_CTO_EST CCCE, PERSONA P' + coCRLF +
              ' WHERE CCCE.ID_CONTRATO = '+   pContrato   + coCRLF +
              ' AND   P.ID_PERSONA =  CCCE.ID_CALIFICADORA    ' + coCRLF +
              ' ORDER BY CCCE.ID_CONTRATO,CCCE.ID_CALIFICADORA' ;

     vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('ID_CONTRATO').Visible := False;

            vlQry.FieldByName('ID_CALIFICADORA').DisplayWidth := 12;
            vlQry.FieldByName('NOM_CALIFICADORA').DisplayWidth := 40;
            vlQry.FieldByName('CVE_CALIFICACION').DisplayWidth :=20;
            vlQry.FieldByName('F_CALIFICACION').DisplayWidth := 25;
            vlQry.FieldByName('SIT_CALIFICA').DisplayWidth := 5;

            vlQry.FieldByName('TXT_COMENTARIO').Visible := False;
            vlQry.FieldByName('F_ALTA').Visible := False;
            vlQry.FieldByName('CVE_USU_ALTA').Visible := False;
            vlQry.FieldByName('F_MODIFICA').Visible := False;
            vlQry.FieldByName('CVE_USU_MODIFICA').Visible := False;
            sgCalificaciones.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
           sgCalificaciones.Clear('NO HAY REGISTROS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrCtoEstruc.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


      Objeto.ID_CONTRATO.Control     := edID_CONTRATO2;
      Objeto.ID_CALIFICADORA.Control  := edID_CALIFICADORA;
      Objeto.CVE_CALIFICACION.Control := edCVE_CALIFICACION;
      Objeto.F_CALIFICACION.Control   := edF_CALIFICACION;
      Objeto.SIT_CALIFICA.Control     := rgSIT_CALIFICA;
      Objeto.TXT_COMENTARIO.Control   := edTXT_COMENTARIO;
      Objeto.F_ALTA.Control           := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control     := edCVE_USU_ALTA  ;
      Objeto.F_MODIFICA.Control       := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;

      Objeto.Calificadora.Persona.Nombre.control := edNomCalif;

       Interforma1.MsgPanel := MsgPanel;
      edID_CONTRATO.Text :=  Objeto.ID_CONTRATO.AsString;

end;

procedure TWCrCtoEstruc.FormDestroy(Sender: TObject);
begin

      Objeto.ID_CONTRATO.Control      := nil;
      Objeto.ID_CALIFICADORA.Control  := nil;
      Objeto.CVE_CALIFICACION.Control := nil;
      Objeto.F_CALIFICACION.Control   := nil;
      Objeto.SIT_CALIFICA.Control     := nil;
      Objeto.TXT_COMENTARIO.Control   :=  nil;
      Objeto.F_ALTA.Control           :=  nil;
      Objeto.CVE_USU_ALTA.Control     :=  nil;
      Objeto.F_MODIFICA.Control       :=  nil;
      Objeto.CVE_USU_MODIFICA.Control :=  nil;


end;

procedure TWCrCtoEstruc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCtoEstruc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
//   Objeto.ID_CONTRATO.AsString := Objeto.Contrato.ID_CONTRATO.AsString;
   rgSIT_CALIFICA.ItemIndex := 0;

   sgCalificaciones.Enabled := False;   
   btACREDITADO.Enabled := True;

   edID_CALIFICADORA.Enabled := True;
   edID_CALIFICADORA.TabStop := True;
   edID_CALIFICADORA.SetFocus;
   
   edID_CONTRATO.Enabled := False;
   edID_CONTRATO.TabStop := False;
   edID_CONTRATO.Color   := clBtnFace;

end;

procedure TWCrCtoEstruc.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;

   sgCalificaciones.Enabled := False;

   edID_CONTRATO.Enabled := False;
   edID_CONTRATO.TabStop := False;
   edID_CONTRATO.Color   := clBtnFace;

   edID_CALIFICADORA.Enabled := False;
   edID_CALIFICADORA.TabStop := False;
   edID_CALIFICADORA.Color   := clBtnFace;

   btACREDITADO.Enabled := False;
   edCVE_CALIFICACION.SetFocus;
end;

procedure TWCrCtoEstruc.InterForma1DespuesShow(Sender: TObject);
begin
   IF Objeto.ID_CONTRATO.AsString <> CNULL then
   Begin
      MuestraCalificaciones(Objeto.ID_CONTRATO.AsString);
      rgSIT_CALIFICA.ItemIndex := 0;
      Objeto.FindKey([ sgCalificaciones.CellStr['ID_CONTRATO',sgCalificaciones.SG.Row],
                       sgCalificaciones.CellStr['ID_CALIFICADORA',sgCalificaciones.SG.Row]]);
      Objeto.Calificaciones.FindKey([Objeto.ID_CALIFICADORA.AsString,'RIESGO',Objeto.CVE_CALIFICACION.AsString]);
   end;
end;

procedure TWCrCtoEstruc.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
Objeto.CVE_CALIFICACION.AsString := Objeto.Calificaciones.CVE_CALIFICACION.AsString;
Objeto.ID_CONTRATO.AsString := edID_CONTRATO.Text;
   //nuevo
  if IsNewData then   // trae el estado del boton nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
        Realizado := true;
        // valida que este el contrato
        if   (trim(edID_CONTRATO.Text) = '0') or (trim(edID_CONTRATO.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el Contrato Correspondiente.');
        end;

        // valida que se tenga la calificadora
        if   (trim(edID_CALIFICADORA.Text) = '0') or (trim(edID_CALIFICADORA.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el ID de la calificadora');
        end;

        // valida la cve de la calificacion
        if   (trim(edCVE_CALIFICACION.Text) = '0') or (trim(edCVE_CALIFICACION.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar la calificación');
        end;


        // valida la fecha de la calificacion
        if   (trim(edF_CALIFICACION.Text) = '0') or (trim(edF_CALIFICACION.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar la fecha de la calificación.');
        end;

      end
      else
      begin
      Realizado := false;
      end;
   end
   else  // Entra con el estado del boton modificar
   begin
     if  MessageDlg('¿Desea Guardar los datos Modificados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
        Realizado := true;
        // valida que este el contrato
        if   (trim(edID_CONTRATO.Text) = '0') or (trim(edID_CONTRATO.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el Contrato Correspondiente.');
        end;

        // valida que se tenga la calificadora
        if   (trim(edID_CALIFICADORA.Text) = '0') or (trim(edID_CALIFICADORA.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar el ID de la calificadora');
        end;

        // valida la cve de la calificacion
        if   (trim(edCVE_CALIFICACION.Text) = '0') or (trim(edCVE_CALIFICACION.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar la calificación');
        end;


        // valida la fecha de la calificacion
        if   (trim(edF_CALIFICACION.Text) = '0') or (trim(edF_CALIFICACION.Text) =  '')    then
        begin
         Realizado := false;
         ShowMessage('Es necesario ingresar la fecha de la calificación.');
        end
           else
           begin
           Realizado := true;
           end;
       end
     else
     begin
        Realizado := false;
     end;
   end
end;

procedure TWCrCtoEstruc.InterForma1DespuesAceptar(Sender: TObject);
begin
      MuestraCalificaciones(edID_CONTRATO.Text);
      Objeto.FindKey([ sgCalificaciones.CellStr['ID_CONTRATO',sgCalificaciones.SG.Row],
                       sgCalificaciones.CellStr['ID_CALIFICADORA',sgCalificaciones.SG.Row]]);

      Objeto.Calificaciones.FindKey([Objeto.ID_CALIFICADORA.AsString,'RIESGO',Objeto.CVE_CALIFICACION.AsString]);
      sgCalificaciones.Enabled := True;      

end;

procedure TWCrCtoEstruc.sgCalificacionesMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   IF sgCalificaciones.CellStr['ID_CONTRATO',ToIndex] <> CNULL THEN
   Begin
        Objeto.FindKey([ sgCalificaciones.CellStr['ID_CONTRATO',ToIndex],
                         sgCalificaciones.CellStr['ID_CALIFICADORA',ToIndex]]);
        Objeto.Calificaciones.FindKey([Objeto.ID_CALIFICADORA.AsString,'RIESGO',Objeto.CVE_CALIFICACION.AsString]);
   end
end;

procedure TWCrCtoEstruc.rgSIT_CALIFICAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CALIFICA,True,'',True);
end;

procedure TWCrCtoEstruc.InterForma1Buscar(Sender: TObject);
begin
           ShowMessage('No se permite buscar en esta pantalla');
end;

procedure TWCrCtoEstruc.InterForma1DespuesEliminar(Sender: TObject);
begin
  MuestraCalificaciones(edID_CONTRATO.Text);
  Objeto.FindKey([ sgCalificaciones.CellStr['ID_CONTRATO',sgCalificaciones.SG.Row],
                   sgCalificaciones.CellStr['ID_CALIFICADORA',sgCalificaciones.SG.Row]]);

  Objeto.Calificaciones.FindKey([Objeto.ID_CALIFICADORA.AsString,'RIESGO',Objeto.CVE_CALIFICACION.AsString])
end;



procedure TWCrCtoEstruc.sgCalificacionesCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
var  vlCadTotal : String;
begin
    vlCadTotal := '1';
end;

procedure TWCrCtoEstruc.edID_CONTRATOExit(Sender: TObject);
var   vlSalida    : Boolean;
      vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      If edID_CONTRATO.Text = '' then
      Begin
         vlMsg := 'Favor de indicar el Contrato';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edID_CONTRATO,vlSalida,vlMsg,True);
   End;

end;




procedure TWCrCtoEstruc.edF_CALIFICACIONExit(Sender: TObject);
var vlstrMsg : String;
    vlF_CALIFICACION : Double;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edF_CALIFICACION.Text) = '') Then vlstrMsg := 'Favor de indicar la Fecha de la calificaión'
   Else If (Not SICC_IsDate(edF_CALIFICACION.Text, vlF_CALIFICACION)) Then vlstrMsg := 'La fecha no es válida ó falta indicar la hora en que se calificó.';
   InterForma1.ValidaExit(edF_CALIFICACION, (vlstrMsg = ''), vlstrMsg,True);
   End;

end;


procedure TWCrCtoEstruc.edCVE_CALIFICACIONExit(Sender: TObject);
var   vlSalida    : Boolean;
      vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.Calificaciones.CVE_CALIFICACION.GetFromControl;
      If Objeto.Calificaciones.CVE_CALIFICACION.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la calificación correspondiente';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edCVE_CALIFICACION,vlSalida,vlMsg,True);
   End;


end;

procedure TWCrCtoEstruc.ilCALIFICADORACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit);
end;

procedure TWCrCtoEstruc.ilCALIFICADORAEjecuta(Sender: TObject);
begin
if Objeto.Calificadora.FindKey([ilCALIFICADORA.Buffer]) then
      InterForma1.NextTab(edID_CALIFICADORA);

end;

procedure TWCrCtoEstruc.ilCVE_CALIFICACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit);
end;

procedure TWCrCtoEstruc.ilCVE_CALIFICACIONEjecuta(Sender: TObject);
begin
if Objeto.Calificaciones.FindKey([Objeto.Calificadora.ID_CALIFICADORA.AsString,'RIESGO',ilCVE_CALIFICACION.Buffer]) then
      InterForma1.NextTab(edCVE_CALIFICACION);
Objeto.CVE_CALIFICACION.AsString := Objeto.Calificaciones.CVE_CALIFICACION.AsString;
end;

procedure TWCrCtoEstruc.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Calificadora.ShowAll := True;
   if Objeto.Calificadora.Busca then
   Begin
      InterForma1.NextTab(edID_CALIFICADORA);
      edNomCalif.Text := Objeto.Calificadora.Persona.Nombre.AsString;
   End
end;

procedure TWCrCtoEstruc.btCalificacionClick(Sender: TObject);
begin
   If Objeto.ID_CALIFICADORA.Asstring <> '' then
   Begin
      Objeto.Calificaciones.BuscaWhereString := ' ID_CALIFICADORA  =' + Objeto.ID_CALIFICADORA.Asstring;
      if Objeto.Calificaciones.Busca then
         InterForma1.NextTab(edCVE_CALIFICACION);
      Objeto.CVE_CALIFICACION.AsString := Objeto.Calificaciones.CVE_CALIFICACION.AsString;   
    end
    Else
       ShowMessage('Debe Seleccionar una Calificadora antes de seleccionar la calificación');


end;

procedure TWCrCtoEstruc.rgSIT_CALIFICAClick(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CALIFICA,True,'',True);
end;

procedure TWCrCtoEstruc.edTXT_COMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTXT_COMENTARIO,True,'',True);
end;

procedure TWCrCtoEstruc.InterForma1DespuesCancelar(Sender: TObject);
begin
      sgCalificaciones.Enabled := True;
end;

procedure TWCrCtoEstruc.edID_CALIFICADORAExit(Sender: TObject);
var   vlSalida    : Boolean;
      vlMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.ID_CALIFICADORA.GetFromControl;
      If Objeto.ID_CALIFICADORA.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la calificadora';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edID_CALIFICADORA,vlSalida,vlMsg,True);
   End;
end;


end.
