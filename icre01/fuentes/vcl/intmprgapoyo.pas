// Sistema         : Clase de CR_FND_PROGRAMA
// Fecha de Inicio : 16/12/2004
// Función forma   : Clase de CR_FND_PROGRAMA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Modificado por  : Araceli Ramos Baz - Septiembre 2011 - Se agrega campo
//                   que especifica si el programa Provisiona la Garantía.
Unit IntMPrgApoyo;

Interface
                    
Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,Menus, Grids, Aligrid,
//CLASES ADICIONALES
IntParamCre,
IntGenCre,
IntMInstDesc, InterEdit, IntLinkit
;

Const
  //HERJA - TIPOA DE MODALIDAD DE FONDEO
  C_DESCTO = 'DS';
  C_PREST  = 'PR';

// </ RABA > ENE 2012
  C_CAPITAL = 'SC';//CVE_IMP_CALC_INT
  C_VIGENTE = 'SD';//CVE_IMP_CALC_INT
  C_CREDITO = 'MC';//CVE_IMP_CALC_INT
// < RABA />

// </ RABA > OCT 2011
   coCRLF      = #13#10;

   CO_COL_PER_INI   = 0;
   CO_COL_PER_FIN   = CO_COL_PER_INI + 1;
   CO_COL_DIAS_TASA = CO_COL_PER_FIN + 1;
// < RABA />

Type
 TMPrgApoyo= Class;

  TwMPrgApoyo=Class(TForm)
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
    edCVE_FND_PROGRAMA: TEdit;
    lbCVE_FND_PROGRAMA: TLabel;
    edDESC_PROGRAMA: TEdit;
    lbDESC_PROGRAMA: TLabel;
    lbCVE_FND_ENT_DES: TLabel;
    btCVE_FND_ENT_DES: TBitBtn;
    edDESC_FND_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    edCVE_FND_ENT_DES: TEdit;
    rgCVE_MOD_FND: TRadioGroup;
    ch_B_PROV_GARANTIA: TCheckBox;
    GB_Conf_TasaComb: TGroupBox;
    Shape6: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    strgrdTasas: TStringGrid;
    btAGREGAR: TBitBtn;
    btMODIFICAR: TBitBtn;
    btELIMINAR: TBitBtn;
    edPERIODO_INI: TInterEdit;
    edPERIODO_FIN: TInterEdit;
    ch_B_CFG_DIAS_TASA: TCheckBox;
    Label8: TLabel;
    edDias: TInterEdit;
    rgCVE_IMP_CALC_INT: TRadioGroup;
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);  
    Procedure InterForma1DespuesNuevo(SEnder: TObject);
    Procedure InterForma1DespuesModificar(SEnder: TObject);
    Procedure edDESC_PROGRAMAExit(SEnder: TObject);
    Procedure MuestraHints;
    Procedure InterForma1Buscar(SEnder: TObject);
    Procedure InterForma1DespuesAceptar(SEnder: TObject);
    Procedure InterForma1AntesAceptar(SEnder: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_FND_PROGRAMAExit(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure edCVE_FND_PROGRAMAKeyPress(Sender: TObject; var Key: Char);
    procedure edDESC_PROGRAMAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_FND_ENT_DESKeyPress(Sender: TObject; var Key: Char);
    procedure rgCVE_MOD_FNDExit(Sender: TObject);
    procedure ch_B_PROV_GARANTIAExit(Sender: TObject);
    procedure ch_B_CFG_DIAS_TASAExit(Sender: TObject);

    // </ RABA > OCT 2011
    procedure Activa_BotonesTasas;
    procedure Desactiva_BotonesTasas;
    procedure ConfGrid( SGrid : TStringGrid );
    procedure MuestraDatos;
    function  ValidaGrid( SGrid : TStringGrid ):string;
    procedure ch_B_CFG_DIAS_TASAClick(Sender: TObject);
    procedure btAGREGARClick(Sender: TObject);
    procedure btMODIFICARClick(Sender: TObject);
    procedure btELIMINARClick(Sender: TObject);
    procedure strgrdTasasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure rgCVE_IMP_CALC_INTExit(Sender: TObject);
    // < RABA />
    Private
    { Private declarations }

    Public
    { Public declarations }
    Objeto : TMPrgApoyo;
End;
 TMPrgApoyo= Class(TInterFrame)
      Private
      Protected
      Public
        { Public declarations }
        CVE_FND_ENT_DES        : TInterCampo;
        CVE_FND_PROGRAMA       : TInterCampo;
        DESC_PROGRAMA          : TInterCampo;

        //HERJA
        CVE_MOD_FND            : TInterCampo;
        // FIN HERJA
        // </ RABA > SEP 2011
        B_PROV_GARANTIA        : TInterCampo;
        // < RABA />

        // </ RABA > OCT 2011
        B_CFG_DIAS_TASA        : TInterCampo;
        // < RABA />

        // </ RABA > ENE 2012
        CVE_IMP_CALC_INT       : TInterCampo;
        // < RABA />

        //Clases Adicionales
        ParamCre               : TParamCre;
        MInstDesc              : TMInstDesc;

        Function    InternalBusca : Boolean; override;
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      Published
      End;

var vltemp : string;
    vlRowSelec, vlColSelec : integer;
    vlValida: String;
    vlRegOrigi : word;

Implementation
{$R *.DFM}

Constructor TMPrgApoyo.Create( AOwner : TComponent );
Begin Inherited;
   CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
      CVE_FND_ENT_DES.Caption:='Tipo Sector';
   CVE_FND_PROGRAMA :=CreaCampo('CVE_FND_PROGRAMA',ftString,tsNinguno,tsNinguno,True);
      CVE_FND_PROGRAMA.Caption:='Sector Ecoconómico';
   DESC_PROGRAMA :=CreaCampo('DESC_PROGRAMA',ftString,tsNinguno,tsNinguno,True);
      DESC_PROGRAMA.Caption:='Descripción';

   //---BEGIN   HERJA - TIPOS DE MODALIDAD DE FONDEO
   CVE_MOD_FND :=CreaCampo('CVE_MOD_FND',ftString,tsNinguno,tsNinguno,True);
   With CVE_MOD_FND do
   Begin
      Size := 3;
      UseCombo := True;
      ComboLista.Add('0'); ComboDatos.Add(C_DESCTO);
      ComboLista.Add('1'); ComboDatos.Add(C_PREST);
   end;
   CVE_MOD_FND.Caption:='Tipo de Modalidad de Fondeo';
   //END

   // </ RABA > SEP 2011
   B_PROV_GARANTIA := CreaCampo('B_PROV_GARANTIA',ftString,tsNinguno,tsNinguno,True);
   B_PROV_GARANTIA.Caption := 'Genera provisión de Garantía';
   // < RABA />

   // </ RABA > OCT 2011
   B_CFG_DIAS_TASA := CreaCampo('B_CFG_DIAS_TASA',ftString,tsNinguno,tsNinguno,True);
   B_CFG_DIAS_TASA.Caption := 'Configuración de días de tasa';
   // < RABA />

   // </ RABA > ENE 2012
   CVE_IMP_CALC_INT :=CreaCampo('CVE_IMP_CALC_INT',ftString,tsNinguno,tsNinguno,True);
         With CVE_IMP_CALC_INT do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(C_CAPITAL );
                ComboLista.Add('1'); ComboDatos.Add(C_VIGENTE);
                ComboLista.Add('2'); ComboDatos.Add(C_CREDITO);
         end;
   CVE_IMP_CALC_INT.Caption:='Cve. Imp. Calc. Interes';
   // < RABA />

   FKeyFields.Add('CVE_FND_ENT_DES');
   FKeyFields.Add('CVE_FND_PROGRAMA');

   TableName := 'CR_FND_PROGRAMA';
   UseQuery := True;
   HelpFile := 'IntMPrgApoyo.Hlp';
   ShowMenuReporte:=True;

   MInstDesc := TMInstDesc.Create(Self);
   MInstDesc.MasterSource:=Self;
   MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

End;

Destructor TMPrgApoyo.Destroy;
Begin
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   Inherited;
End;


Function TMPrgApoyo.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TwMPrgApoyo;
Begin
   W:=TwMPrgApoyo.Create(Self);
   Try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;


Function TMPrgApoyo.InternalBusca:Boolean;
Var
   T:TInterFindit;
Begin
   InternalBusca := False;
   T := CreaBuscador('IMPrgApoyo.it','S,S');
   Try
      If Active Then Begin
         T.Param(0,CVE_FND_ENT_DES.AsString);
         T.Param(1,CVE_FND_PROGRAMA.AsString);
      End;
      If T.Execute Then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   Finally
      T.Free;
   End;
End;

(***********************************************FORMA CR_FND_PROGRAMA********************)
(*                                                                              *)
(*  FORMA DE CR_FND_PROGRAMA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FND_PROGRAMA********************)

Procedure TwMPrgApoyo.FormShow(SEnder: TObject);
Begin
   //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_FND_ENT_DES.Control   := edCVE_FND_ENT_DES;
   Objeto.CVE_FND_PROGRAMA.Control := edCVE_FND_PROGRAMA;
   Objeto.DESC_PROGRAMA.Control    := edDESC_PROGRAMA;
   Objeto.CVE_IMP_CALC_INT.Control := rgCVE_IMP_CALC_INT;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control := edDESC_FND_ENT_DES;   
   Objeto.MInstDesc.GetParams(Objeto);

   //HERJA JULIO 2010
   Objeto.CVE_MOD_FND.Control:= rgCVE_MOD_FND;

   // </ RABA > SEP 2011
   Objeto.B_PROV_GARANTIA.Control := ch_B_PROV_GARANTIA;

   // </ RABA > OCT 2011
   Objeto.B_CFG_DIAS_TASA.Control := ch_B_CFG_DIAS_TASA;

   Desactiva_BotonesTasas;
End;

Procedure TwMPrgApoyo.FormDestroy(SEnder: TObject);
Begin
   Objeto.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.DESC_PROGRAMA.Control    := Nil;
   Objeto.CVE_FND_ENT_DES.Control   := Nil;
   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := Nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control := Nil;

   //HERJA JULIO 2010
   Objeto.CVE_MOD_FND.Control := Nil;

   // </ RABA > SEP 2011
   Objeto.B_PROV_GARANTIA.Control  := Nil;

   // </ RABA > OCT 2011
   Objeto.B_CFG_DIAS_TASA.Control := Nil;
   
   // </ RABA > ENE 2012
   Objeto.CVE_IMP_CALC_INT.Control := Nil;
   // < RABA />
End;

Procedure TwMPrgApoyo.FormClose(SEnder: TObject; var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMPrgApoyo.InterForma1DespuesNuevo(SEnder: TObject);
Begin
   MuestraHints;
   rgCVE_MOD_FND.ItemIndex:=-1;
   edCVE_FND_ENT_DES.SetFocus;

   ClearGrid(strgrdTasas,0);
   ConfGrid(strgrdTasas);
   Activa_BotonesTasas;
End;

Procedure TwMPrgApoyo.InterForma1DespuesModificar(SEnder: TObject);
Begin
   if (Trim(edCVE_FND_PROGRAMA.Text) <> '') and (ch_B_CFG_DIAS_TASA.Checked) then
      Activa_BotonesTasas
   else
      Desactiva_BotonesTasas;
   edDESC_PROGRAMA.SetFocus;
End;

(*****************************************************************)
Procedure TwMPrgApoyo.edDESC_PROGRAMAExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edDESC_PROGRAMA,True,'',True);
End;

Procedure TwMPrgApoyo.MuestraHints;
Begin
   edDESC_PROGRAMA.Hint := Objeto.DESC_PROGRAMA.AsString;
   edDESC_PROGRAMA.ShowHint := True;
End;

Procedure TwMPrgApoyo.InterForma1Buscar(SEnder: TObject);
Begin
   If Objeto.Busca Then
      MuestraHints;
End;

Procedure TwMPrgApoyo.InterForma1DespuesAceptar(SEnder: TObject);
var
    vlQry : TQuery;
    nRow, vlRegTot : Integer;
    vlquery, vlquery2 : string;
begin
   MuestraHints;

   if ch_B_CFG_DIAS_TASA.Checked=true then
   begin
      ShowMessage('Al Periodo Final del Ultimo Registro se actualizara su valor a 9999');
      vlRegOrigi := strgrdTasas.RowCount;
      strgrdTasas.Cells[CO_COL_PER_FIN, vlRegOrigi -1 ]  := '9999';

      vlquery := 'BEGIN '+coCRLF+
                 '   DELETE FROM CR_FND_DIAS_TASA WHERE CVE_FND_ENT_DES = '''+edCVE_FND_ENT_DES.Text+''' '+coCRLF +
                 '                                  AND CVE_FND_PROGRAMA = '''+edCVE_FND_PROGRAMA.Text+'''; '+coCRLF;


      vlquery2:='';
      vlRegTot:=strgrdTasas.RowCount-1;

      With strgrdTasas Do
      Begin
         nRow := 0;
         While (nRow <= vlRegTot) do
         Begin                                                                                                                           
            vlquery2:= vlquery2 + '   INSERT INTO CR_FND_DIAS_TASA (CVE_FND_ENT_DES, CVE_FND_PROGRAMA, NUM_PERIODO_INI, NUM_PERIODO_FIN, DIA_INI_REV_TASA) '+
                                     'VALUES ('''+edCVE_FND_ENT_DES.Text+''', '+''''+edCVE_FND_PROGRAMA.Text+''',' +Cells[CO_COL_PER_INI,nRow]+', '+Cells[CO_COL_PER_FIN,nRow]+', '+Cells[CO_COL_DIAS_TASA,nRow]+'); '+coCRLF;


            Inc(nRow);
            Next;
         End;
      End;

      vlquery:= vlquery + vlquery2 +
                '   COMMIT;'+coCRLF+
                ' END;';

      try
        vlQry := TQuery.Create(Self);
        vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
        vlQry.SessionName   := Objeto.Apli.SessionName;
        vlQry.close;
        vlQry.SQL.Add(vlquery);
        vlQry.SQL.SaveToFile('c:\FNDDIASTASA.txt');
        vlQry.ExecSQL;
      finally
          vlQry.close;
      end;

      Desactiva_BotonesTasas;
   end
   else
   begin
      vlquery := 'BEGIN '+coCRLF+
                 '   DELETE FROM CR_FND_DIAS_TASA WHERE CVE_FND_ENT_DES = '''+edCVE_FND_ENT_DES.Text+''' '+coCRLF+
                 '                                  AND CVE_FND_PROGRAMA = '''+edCVE_FND_PROGRAMA.Text+'''; '+coCRLF+
                 '   COMMIT;'+coCRLF+
                 'END;';
      try
        vlQry := TQuery.Create(Self);
        vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
        vlQry.SessionName   := Objeto.Apli.SessionName;
        vlQry.close;
        vlQry.SQL.Add(vlquery);
        vlQry.SQL.SaveToFile('c:\FNDDIASTASA.txt');
        vlQry.ExecSQL;
      finally
          vlQry.close;
      end;
   end;

   Desactiva_BotonesTasas;
   ClearGrid(strgrdTasas,0);
   ConfGrid(strgrdTasas);
   MuestraDatos;
End;

Procedure TwMPrgApoyo.InterForma1AntesAceptar(SEnder: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Begin
    if ch_B_CFG_DIAS_TASA.Checked=true then
    begin
      vltemp:=strgrdTasas.Cells[CO_COL_PER_INI, 0 ];
      if strgrdTasas.Cells[CO_COL_PER_INI, 0 ] <> '1' then
      begin
         ShowMessage('Debe de existir al menos un periodo valido');
         Realizado:=false;
      end;
    end;

    if Realizado then
    begin
     //nuevo
      If IsNewData Then Begin
        If MessageDlg('¿Desea almacenar los datos capturados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
           Realizado := True;
        End Else Realizado := False;
      End Else Begin
        If MessageDlg('¿Desea guardar los datos modificados?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
           Realizado := True;
        End Else Realizado := False;
      End;
    End;
End;

procedure TwMPrgApoyo.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRGAPOYO_INSTI',True,True) then
   begin
       Objeto.MInstDesc.ShowAll := True;
       If Objeto.MInstDesc.Busca Then Begin
          InterForma1.NextTab(edCVE_FND_ENT_DES);
       End;
   end;
end;

procedure TwMPrgApoyo.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMPrgApoyo.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TwMPrgApoyo.edCVE_FND_PROGRAMAExit(Sender: TObject);
var
   VLSalida  :  boolean;
   VLMsg, sSQL :  String;
   qyQuery : TQuery;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.CVE_FND_PROGRAMA.GetFromControl;
      If Objeto.CVE_FND_PROGRAMA.AsString = '' Then Begin
         VlSalida := False;
         VLMsg := 'Indique la clave del Programa de Apoyo';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQL:= 'SELECT * FROM CR_FND_PROGRAMA '+
                   ' WHERE CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
                   '   AND CVE_FND_PROGRAMA ='+  SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('CVE_FND_PROGRAMA').AsString = Objeto.CVE_FND_PROGRAMA.AsString Then Begin
                  VlSalida   := False;
                  VLMsg := 'El registro ya existe';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_FND_PROGRAMA,VLSalida,VLMsg,True);
   End;
end;

procedure TwMPrgApoyo.edCVE_FND_ENT_DESExit(Sender: TObject);
var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      VLMsg     := '';
      VlSalida   := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         VlSalida := False;
         VLMsg    := 'Indique la Institución o Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMsg,True);
   End;
end;

procedure TwMPrgApoyo.edCVE_FND_PROGRAMAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMPrgApoyo.edDESC_PROGRAMAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMPrgApoyo.edCVE_FND_ENT_DESKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMPrgApoyo.rgCVE_MOD_FNDExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_MOD_FND,True,'',True);
end;

procedure TwMPrgApoyo.ch_B_PROV_GARANTIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(ch_B_PROV_GARANTIA,True,'',True);
end;

procedure TwMPrgApoyo.ch_B_CFG_DIAS_TASAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(ch_B_CFG_DIAS_TASA,True,'',True);
end;




procedure TwMPrgApoyo.Activa_BotonesTasas;
begin
   edPERIODO_INI.Enabled:=True;
   edPERIODO_FIN.Enabled:=True;
   edDias.Enabled := True;
   edPERIODO_INI.Color:=clWindow;
   edPERIODO_FIN.Color:=clWindow;
   edDias.Color   := clWindow;

   btAGREGAR.Enabled:=True;
   btMODIFICAR.Enabled:=True;
   btELIMINAR.Enabled:=True;

   strgrdTasas.Enabled:=True;
end;

procedure TwMPrgApoyo.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 3;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_PER_INI] := 65;
      ColWidths[CO_COL_PER_FIN] := 65;
      ColWidths[CO_COL_DIAS_TASA] := 80;
    End;
end;

procedure TwMPrgApoyo.Desactiva_BotonesTasas;
begin
   edPERIODO_INI.Text:='';
   edPERIODO_FIN.Text:='';
   edDias.Text:='';

   edPERIODO_INI.Enabled:=False;
   edPERIODO_FIN.Enabled:=False;
   edPERIODO_INI.Color:=clBtnFace;
   edPERIODO_FIN.Color:=clBtnFace;
   edDias.Enabled:=False;
   edDias.Color:=clBtnFace;

   btAGREGAR.Enabled:=False;
   btMODIFICAR.Enabled:=False;
   btELIMINAR.Enabled:=False;

   strgrdTasas.Enabled:=False;
   Application.ProcessMessages;
end;

procedure TwMPrgApoyo.MuestraDatos;
var
    vlstrSQLCred : String;
    vlQryCred  : TQuery;
    nRow : Integer;
begin
   ClearGrid(strgrdTasas,0);
   ConfGrid(strgrdTasas);

   vlstrSQLCred :=
                 ' SELECT * '+coCRLF+
                 '   FROM  CR_FND_DIAS_TASA'+coCRLF+
                 '  WHERE  CVE_FND_ENT_DES = '''+edCVE_FND_ENT_DES.Text +''' '+coCRLF+
                 '    AND  CVE_FND_PROGRAMA = '''+edCVE_FND_PROGRAMA.Text +''' '+coCRLF+
                 ' ORDER BY NUM_PERIODO_INI';

   vlQryCred := GetSQLQuery(vlstrSQLCred, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
   If Assigned(vlQryCred) Then
     With vlQryCred Do
     Begin
        nRow := 0;
        While Not Eof Do
        Begin
          strgrdTasas.Cells[CO_COL_PER_INI,nRow]   := FieldByName('NUM_PERIODO_INI').AsString;
          strgrdTasas.Cells[CO_COL_PER_FIN,nRow]   := FieldByName('NUM_PERIODO_FIN').AsString;
          strgrdTasas.Cells[CO_COL_DIAS_TASA,nRow] := FieldByName('DIA_INI_REV_TASA').AsString;

          Inc(nRow);
          Next;
        End;

        If (nRow = 0) Then strgrdTasas.RowCount := 1
        Else strgrdTasas.RowCount := nRow;

        Free;
    End;
end;

function TwMPrgApoyo.ValidaGrid(SGrid: TStringGrid): string;
var nRow, vlRegTot : Integer;
    vlresult : string;

label fin_validacion;

begin
   vlresult:='OK';

   if (Trim(edPERIODO_INI.Text)='') OR (Trim(edPERIODO_FIN.Text)='') then
   begin
      vlresult:='El valor del Periodo Inicial o Final es Nulo';
      goto fin_validacion;
   end;

   if (StrToInt(edPERIODO_INI.Text)=0) OR (StrToInt(edPERIODO_FIN.Text)=0) then
   begin
      vlresult:='El valor del Periodo Inicial o Final debe de ser diferente de CERO';
      goto fin_validacion;
   end;

   if (StrToInt(edPERIODO_INI.Text) > StrToInt(edPERIODO_FIN.Text)) then
   begin
      vlresult:='El valor del Periodo Inicial NO debe de ser MAYOR al del Periodo Final';
      goto fin_validacion;
   end;

   vlRegTot:=SGrid.RowCount-1;

   With SGrid Do
   Begin
      nRow := 0;
      While (nRow <= vlRegTot) do
      Begin
         if nRow = 0 then
         begin
            vltemp:=Cells[CO_COL_PER_INI,nRow];

            if  StrToInt(Cells[CO_COL_PER_INI,nRow]) <> 1 then
            begin
               vlresult:='El valor del Periodo Inicial de la Primera fila debe de ser 1';
               goto fin_validacion;
            end;
         end;

         if nRow > 0 then
         begin
         vltemp:=Cells[CO_COL_PER_INI,nRow];

         vltemp:=Cells[CO_COL_PER_FIN,nRow-1];
            //VALIDA QUE EL PERIODO INICIAL A PARTIR DE LA SEGUNA FILA SEA MAYOR Y AL PERIODO FINAL DE LA FILA ANTERIOR
            if  StrToInt(Cells[CO_COL_PER_INI,nRow]) < StrToInt(Cells[CO_COL_PER_FIN, nRow - 1]) then
            begin
               vlresult:='El valor del Periodo Inicial de la fila '+IntToStr(nRow+1)+' no debe de ser MENOR al Periodo Final de la fila '+IntToStr(nRow);
               goto fin_validacion;
            end;
            //VALIDA QUE EL PERIODO INICIAL SEA CONSECUTIVO AL PERIODO FINAL DE LA FILA ANTERIOR
            if  (StrToInt(Cells[CO_COL_PER_INI,nRow]) - StrToInt(Cells[CO_COL_PER_FIN, nRow - 1])) <> 1 then
            begin
               vlresult:='El valor del Periodo Inicial de la fila '+IntToStr(nRow+1)+' debe de ser CONSECUTIVO al Periodo Final de la fila '+IntToStr(nRow);
               goto fin_validacion;
            end;
         end;
         Inc(nRow);
         Next;
       End;
   End;

   fin_validacion:
   ValidaGrid := vlresult;
end;

procedure TwMPrgApoyo.ch_B_CFG_DIAS_TASAClick(Sender: TObject);
begin
   if ch_B_CFG_DIAS_TASA.Checked = true then
   begin
      MuestraDatos;

      edPERIODO_INI.Text:='';
      edPERIODO_FIN.Text:='';
      edDias.Text:='';

      vlRowSelec:=0;
      Activa_BotonesTasas;
      edPERIODO_INI.SetFocus;
   end
   else
   begin
      ClearGrid(strgrdTasas,0);
      ConfGrid(strgrdTasas);
      Desactiva_BotonesTasas;
   end;

end;

procedure TwMPrgApoyo.btAGREGARClick(Sender: TObject);
var
   bprimero:boolean;
begin
   if Objeto.ValidaAccesoEsp('TMPRGAPOYO_AGRE',True,True) then
   begin
       vlRegOrigi := strgrdTasas.RowCount;

       vltemp:=strgrdTasas.Cells[CO_COL_PER_INI, 0 ];
       if Trim(vltemp)='' then
       begin
          vlRegOrigi:=vlRegOrigi-1;
          bprimero:=true;
       end;

       strgrdTasas.Cells[CO_COL_PER_INI, vlRegOrigi ]  := edPERIODO_INI.Text;
       strgrdTasas.Cells[CO_COL_PER_FIN, vlRegOrigi ]  := edPERIODO_FIN.Text;
       strgrdTasas.Cells[CO_COL_DIAS_TASA,vlRegOrigi ]  := edDias.Text;

       strgrdTasas.RowCount := vlRegOrigi + 1;

       vlValida:=ValidaGrid(strgrdTasas);

       if vlValida = 'OK' then
       begin
          edDias.Text:='';
          edPERIODO_INI.Text:='';
          edPERIODO_FIN.Text:='';
       end
       else
       begin
          ShowMessage(vlValida);
          if bprimero then
          begin
             strgrdTasas.Cells[CO_COL_PER_INI, 0 ]  := '';
             strgrdTasas.Cells[CO_COL_PER_FIN, 0 ]  := '';
             strgrdTasas.Cells[CO_COL_DIAS_TASA,0 ]  := '';
          end
          else
          strgrdTasas.RowCount := vlRegOrigi;
       end;
   end;
end;

procedure TwMPrgApoyo.btMODIFICARClick(Sender: TObject);
var vlperini, vlperfin, vlDias : string;
begin
   if Objeto.ValidaAccesoEsp('TMPRGAPOYO_MODI',True,True) then
   begin
       vlRegOrigi := strgrdTasas.RowCount;

       vlperini  := strgrdTasas.Cells[CO_COL_PER_INI, vlRowSelec ];
       vlperfin  := strgrdTasas.Cells[CO_COL_PER_FIN, vlRowSelec ];
       vlDias    := strgrdTasas.Cells[CO_COL_DIAS_TASA,vlRowSelec ];

       strgrdTasas.Cells[CO_COL_PER_INI, vlRowSelec ]  := edPERIODO_INI.Text;
       strgrdTasas.Cells[CO_COL_PER_FIN, vlRowSelec ]  := edPERIODO_FIN.Text;
       strgrdTasas.Cells[CO_COL_DIAS_TASA,vlRowSelec ]  := edDias.Text;

       vlValida:=ValidaGrid(strgrdTasas);

       if vlValida = 'OK' then
       begin
          edPERIODO_INI.Text:='';
          edPERIODO_FIN.Text:='';
          edDias.Text:='';
       end
       else
       begin
          strgrdTasas.Cells[CO_COL_PER_INI, vlRowSelec ]  := vlperini;
          strgrdTasas.Cells[CO_COL_PER_FIN, vlRowSelec ]  := vlperfin;
          strgrdTasas.Cells[CO_COL_DIAS_TASA,vlRowSelec ] := vlDias;
          strgrdTasas.RowCount := vlRegOrigi;
          ShowMessage(vlValida);
       end;
   end;
end;

procedure TwMPrgApoyo.btELIMINARClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPRGAPOYO_ELIM',True,True) then
   begin
     if MessageDlg('Esta seguro de eliminar este registro?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     Begin
        vlRegOrigi := strgrdTasas.RowCount;
        strgrdTasas.RowCount := vlRegOrigi - 1;
     end;
   end;
end;

procedure TwMPrgApoyo.strgrdTasasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin

      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      if (ACol = CO_COL_PER_INI)or(ACol = CO_COL_PER_FIN)or(ACol = CO_COL_DIAS_TASA) THEN
         Alineacion := taCenter;

    {  if (ACol = CO_COL_PER_INI)or(ACol = CO_COL_PER_FIN)or(ACol = CO_COL_CVE_TASA) THEN
         Alineacion := taRightJustify;

      if (ACol = CO_COL_PER_INI)or(ACol = CO_COL_PER_FIN)or(ACol = CO_COL_CVE_TASA) THEN
         Alineacion := taLeftJustify;
     }

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;
  End;
end;

procedure TwMPrgApoyo.InterForma1DespuesCancelar(Sender: TObject);
begin
   Objeto.FindKey([Objeto.CVE_FND_PROGRAMA.AsString]);

   Desactiva_BotonesTasas;
   ClearGrid(strgrdTasas,0);
   ConfGrid(strgrdTasas);
   MuestraDatos;

end;

procedure TwMPrgApoyo.rgCVE_IMP_CALC_INTExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_IMP_CALC_INT,True,'',True);
end;

End.

