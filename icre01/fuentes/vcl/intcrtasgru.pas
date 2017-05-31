// Sistema         : Clase de CR_TASA_GRUPO
// Fecha de Inicio : 04/05/2004
// Función forma   : Clase de CR_TASA_GRUPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrTasGru;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, InterApl,
IntLinkit,

//CLASES ADICIONALES
IntParamCre,  // Parámetros de Crédito
IntGenCre,    // Unidad Genérica de Créditos
IntTasIndFin  // Catálogo de Tasas
;
const
  C_OPERACION_GPO : Array [0..2] Of String = (C_MENOR, C_MAYOR, C_PROMEDIO);


Type
 TCrTasGru= class; 

  TWCrTasaGrupo=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TASA_INDICAD : TLabel; 
    edCVE_TASA_INDICAD : TEdit;
    Label2: TLabel;
    Label3: TLabel;
    sgcDATOS: TSGCtrl;
    rgCVE_OPERACION: TRadioGroup;
    edDESC_TASA_INDICAD: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btnCVE_TASA_INDIC: TBitBtn;
    ilCVE_TASA_INDICAD: TInterLinkit;
    gbValorTasa: TGroupBox;
    lblValorTasa: TLabel;
    stpCalcTasaRefer: TStoredProc;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btnCVE_TASA_INDICClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure ilCVE_TASA_INDICADCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_TASA_INDICADEjecuta(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    private
    { Private declarations }
     procedure MuestraTasas;
     function Encuentra_Posicion(pstrBusca : String; pArreglo : Array Of String) : Integer;

     function Get_Operacion_Gpo : String;
     procedure Set_Operacion_Gpo(pstrValue : String);
     procedure ObtenValorTasa;
    public
    { Public declarations }
    Objeto : TCrTasGru;

     property  Operacion_Gpo : String Read Get_Operacion_Gpo Write Set_Operacion_Gpo;
end;
 TCrTasGru= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TASA_INDICAD         : TInterCampo;
        CVE_OPERACION            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        vgm_strCVE_TASA_INDICAD  : String;

        ParamCre : TParamCre;
        Tasa     : TTasIndFin;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

procedure Configura_Tasas_Mutliples(pApli : TInterApli; pParamCre : TParamCre; pstrCVE_TASA_INDICAD : String );

implementation
//Uses RepMon;

{$R *.DFM}

procedure Configura_Tasas_Mutliples(pApli : TInterApli; pParamCre : TParamCre; pstrCVE_TASA_INDICAD : String );

 function ExisteTasaGrupo : Boolean;
 var vlQry : TQuery;
 begin
  vlQry := GetSQLQuery('SELECT * FROM CR_TASA_GRUPO WHERE CVE_TASA_INDICAD = '+SQLStr(pstrCVE_TASA_INDICAD),
                       pApli.DatabaseName, pApli.SessionName, False);
  Result := Assigned(vlQry);
  If Assigned(vlQry) Then vlQry.Free;
 end;

var CrTasGru : TCrTasGru;
begin
  CrTasGru := TCrTasGru.Create(Nil);
  With CrTasGru Do
   Begin
   Apli := pApli;
   ParamCre := pParamCre;
   CVE_TASA_INDICAD.AsString := pstrCVE_TASA_INDICAD;

   If ExisteTasaGrupo Then
    Begin
    vgm_strCVE_TASA_INDICAD := '';
    FindKey([pstrCVE_TASA_INDICAD]);
    ShowWindow(ftGrid);
    End
   Else
    Begin
    vgm_strCVE_TASA_INDICAD := pstrCVE_TASA_INDICAD;
    ShowWindow(ftCaptura);
    End;

   End;
end;


constructor TCrTasGru.Create( AOwner : TComponent );
begin Inherited;
      CVE_TASA_INDICAD :=CreaCampo('CVE_TASA_INDICAD',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_INDICAD.Caption:='Clave de Tasa Indicada';
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave de Operación';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usuario de Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usuario Modifica';

      FKeyFields.Add('CVE_TASA_INDICAD');

      Tasa := TTasIndFin.Create(Self);
      Tasa.MasterSource:=Self;
      Tasa.FieldByName('CVE_TASA_INDICAD').MasterField := 'CVE_TASA_INDICAD';
      Tasa.BuscaWhereString := 'TASA_INDIC_FINAN.SIT_TASA_INDIC = '+SQLStr('AC');
      Tasa.FilterString := Tasa.BuscaWhereString;

      TableName := 'CR_TASA_GRUPO';
      UseQuery := True;
      HelpFile := 'IntCrTasGru.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTasGru.Destroy;
begin
 If Assigned(Tasa) Then Tasa.Free;
 inherited;
end;


function TCrTasGru.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTasaGrupo;
begin
   W:=TWCrTasaGrupo.Create(Self);
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


Function TCrTasGru.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrTaGr.it','S');
      Try if Active then begin T.Param(0,CVE_TASA_INDICAD.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_TASA_GRUPO********************)
(*                                                                              *)
(*  FORMA DE CR_TASA_GRUPO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TASA_GRUPO********************)

procedure TWCrTasaGrupo.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CVE_TASA_INDICAD.Control := edCVE_TASA_INDICAD;
  Tasa.DESC_TASA_INDIC.Control := edDESC_TASA_INDICAD;

  stpCalcTasaRefer.DatabaseName:= Apli.DataBaseName;
  stpCalcTasaRefer.SessionName := Apli.SessionName;

  Operacion_Gpo := CVE_OPERACION.AsString;
  MuestraTasas;
  End;
end;

procedure TWCrTasaGrupo.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_TASA_INDICAD.Control := Nil;
  Tasa.DESC_TASA_INDIC.Control := Nil;
  End;
end;

procedure TWCrTasaGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTasaGrupo.InterForma1DespuesNuevo(Sender: TObject);
begin
  If edCVE_TASA_INDICAD.CanFocus Then edCVE_TASA_INDICAD.SetFocus;
  Objeto.Tasa.FindKey([Objeto.vgm_strCVE_TASA_INDICAD]);
end;

procedure TWCrTasaGrupo.InterForma1DespuesModificar(Sender: TObject);
begin If sgcDATOS.CanFocus Then sgcDATOS.SetFocus;
end;

function TWCrTasaGrupo.Encuentra_Posicion(pstrBusca : String; pArreglo : Array Of String) : Integer;
var I : Integer;
begin
 Result := -1;
 For I := 0 To High(pArreglo) Do
  If (pArreglo[I] = pstrBusca) Then
   Begin
   Result := I;
   Break;
   End;
end;

procedure TWCrTasaGrupo.MuestraTasas;
var vlstrQry : String;
    vlQry : TQuery;
begin
 vlQry := Nil;
 With Objeto Do
  Try
    vlstrQry := ' SELECT CTC.CVE_TASA_BASE,'+coCRLF+
                '        TIF.DESC_TASA_INDIC,'+coCRLF+
                '        DECODE(CTC.CVE_OPERACION, '+coCRLF+
                '                                  '+SQLStr(C_MENOR)   +', '+SQlStr('Menor')   +','+coCRLF+
                '                                  '+SQLStr(C_MAYOR)   +', '+SQlStr('Mayor')   +','+coCRLF+
                '                                  '+SQLStr(C_PROMEDIO)+', '+SQlStr('Promedio')+','+coCRLF+
                '                                  '+SQLStr(C_INICIAL) +', '+SQlStr('Inicial') +','+coCRLF+
                '                                  '+SQLStr(C_FINAL)   +', '+SQlStr('Final')   +','+coCRLF+
                '                                  '+SQLStr('Operación no válida')+') AS OPERACION'+coCRLF+
                ' FROM CR_TASA_CONFIG CTC,'+coCRLF+
                '      TASA_INDIC_FINAN TIF'+coCRLF+
                ' WHERE CTC.CVE_TASA_INDICAD = '+SQLStr(CVE_TASA_INDICAD.AsString)+coCRLF+
                '   AND TIF.CVE_TASA_INDICAD = CTC.CVE_TASA_BASE';

    vlQry := GetSQLQuery(vlstrQry,
                         Apli.DataBaseName, Apli.SessionName, True );

    If Assigned(vlQry) Then
     Begin
     vlQry.FieldByName('CVE_TASA_BASE').DisplayWidth := 10;
     vlQry.FieldByName('DESC_TASA_INDIC').DisplayWidth := 75;
     vlQry.FieldByName('OPERACION').DisplayWidth := 16;
     vlQry.FieldByName('OPERACION').Visible := False;

     sgcDATOS.AddQry(vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
     End
    Else
     sgcDATOS.Clear(CERROR_NOEXISTEN);

  Finally
   If Assigned(vlQry) Then vlQry.Free;
  End;

  ObtenValorTasa;
end;

function TWCrTasaGrupo.Get_Operacion_Gpo : String;
begin
  Case rgCVE_OPERACION.ItemIndex Of
    0 : Result := C_MENOR;
    1 : Result := C_MAYOR;
    2 : Result := C_PROMEDIO;
  Else
    Result := '';
  End;
end;

procedure TWCrTasaGrupo.Set_Operacion_Gpo(pstrValue : String);
begin
  rgCVE_OPERACION.ItemIndex := Encuentra_Posicion(pstrValue,C_OPERACION_GPO)
end;

procedure TWCrTasaGrupo.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
   If Busca Then
    Begin
    Tasa.FindKey([ CVE_TASA_INDICAD.AsString ]);
    Operacion_Gpo := CVE_OPERACION.AsString;
    MuestraTasas;
    End;
end;

procedure TWCrTasaGrupo.InterForma1DespuesCancelar(Sender: TObject);
begin
 With Objeto Do
    Begin
    Tasa.FindKey([ CVE_TASA_INDICAD.AsString ]);
    Operacion_Gpo := CVE_OPERACION.AsString;
    MuestraTasas;
    End;
end;

procedure TWCrTasaGrupo.btnCVE_TASA_INDICClick(Sender: TObject);
begin
 Objeto.Tasa.ShowAll := True;
 If Objeto.Tasa.Busca Then
   InterForma1.NextTab(edCVE_TASA_INDICAD);
 MuestraTasas;
end;

procedure TWCrTasaGrupo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  Begin
    Realizado := True;
    If (Operacion_Gpo = '') Then
     Begin
     Realizado := False;
     ShowMessage('Favor de indicar el Tipo de Operación de la Tasa.');
     End
   Else
    Begin
        If (IsNewData) Then
           Begin
           F_ALTA.AsDateTime     := Apli.DameFechaEmpresa;;
           CVE_USU_ALTA.AsString := Apli.Usuario;
           End
        Else
           Begin
           F_MODIFICA.AsDateTime      := Apli.DameFechaEmpresa;
           CVE_USU_MODIFICA.AsString  := Apli.Usuario;
           End;
        CVE_OPERACION.AsString   := Operacion_Gpo;
    End;
  End;
end;

procedure TWCrTasaGrupo.ilCVE_TASA_INDICADCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrTasaGrupo.ilCVE_TASA_INDICADEjecuta(Sender: TObject);
begin
 If Objeto.Tasa.FindKey([ilCVE_TASA_INDICAD.Buffer]) Then
   InterForma1.NextTab(edCVE_TASA_INDICAD);
 MuestraTasas;
end;

procedure TWCrTasaGrupo.InterForma1DespuesEliminar(Sender: TObject);
begin
 MuestraTasas;
end;



procedure TWCrTasaGrupo.ObtenValorTasa;
begin
  gbValorTasa.Caption:= 'Valor de la Tasa:';
  If (Not Objeto.Active) Or ((Objeto.Modo<>moEdit) And (Objeto.Modo<>moBrowse))  Then Begin
    lblValorTasa.Caption:= '';
    Exit;
  End;

  gbValorTasa.Caption:= 'Valor de la Tasa "'+Objeto.CVE_TASA_INDICAD.AsString+'"'+
                        ' al ' + DateTimeToStr(Objeto.Apli.DameFechaEmpresa) + ':' ;

  stpCalcTasaRefer.ParamByName('PECVE_TASA_INDICAD').AsString:= Objeto.CVE_TASA_INDICAD.AsString;
  stpCalcTasaRefer.ParamByName('PEF_CALCULO').AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  stpCalcTasaRefer.ExecProc;

  If stpCalcTasaRefer.ParamByName('PSRESULTADO').AsInteger<>0 Then Begin
    Application.MessageBox(Pchar(stpCalcTasaRefer.ParamByName('PSTX_RESULTADO').AsString),
                           'Error al obtener el valor de la tasa',MB_OK);
    lblValorTasa.Caption:=  stpCalcTasaRefer.ParamByName('PSTX_RESULTADO').AsString;
  End
  Else Begin
    lblValorTasa.Caption:=  FormatFloat('###,###,##0.00',
                            stpCalcTasaRefer.ParamByName('PSVAL_TASA').AsFloat) ;
  End;

End;

end.
