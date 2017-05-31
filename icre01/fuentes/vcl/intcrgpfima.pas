// Sistema         : Clase de CR_GP_FINAN_MAX
// Fecha de Inicio : 16/03/2012
// Función forma   : Clase de CR_GP_FINAN_MAX
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrGpFiMa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntSGCtrl, Ungene,
IntMCrGpFiMa, Menus
;

const ALTO_COL = 16;
const ALTO_DOBLE = 20;

Type
 TCrGpFiMa= class; 

  TWCrGpFinanMax=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    grdLimites: TSGCtrl;
    btBusca: TBitBtn;
    cbxEntidad: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbxLimite: TComboBox;
    dtFConsulta: TDateTimePicker;
    Label3: TLabel;
    popLimite: TPopupMenu;
    ModificarDatos1: TMenuItem;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure grdLimitesDblClick(Sender: TObject);
    procedure ModificarDatos1Click(Sender: TObject);
    private
    { Private declarations }
      strEntidad, strLimite : string;

      procedure llenaDatos(aConsulta : string);
      function  generaConsulta(aFConsulta : TDateTime; aEntidad, aLimite : string) : String;
      procedure setElementos;

    public
    { Public declarations } 
    Objeto : TCrGpFiMa;
end;


 TCrGpFiMa= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ParamCre                  : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

uses IntDmMain;
//Uses RepMon;

{$R *.DFM}


constructor TCrGpFiMa.Create( AOwner : TComponent ); 
begin Inherited; 
//
end;

Destructor TCrGpFiMa.Destroy;
begin inherited;
end;


function TCrGpFiMa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGpFinanMax;
begin
   W:=TWCrGpFinanMax.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


(***********************************************FORMA CR_GP_FINAN_MAX********************)
(*                                                                              *)
(*  FORMA DE CR_GP_FINAN_MAX                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GP_FINAN_MAX********************)

procedure TWCrGpFinanMax.FormShow(Sender: TObject);
begin
  cbxEntidad.ItemIndex := 3;
  cbxLimite.ItemIndex  := 3;
  llenaDatos(generaConsulta(Now, '', ''));

end;

procedure TWCrGpFinanMax.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrGpFinanMax.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGpFinanMax.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrGpFinanMax.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrGpFinanMax.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrGpFinanMax.FormCreate(Sender: TObject);
begin
  //
  generaConsulta(Now, '','');
end;


function TWCrGpFinanMax.generaConsulta(aFConsulta : TDateTime; aEntidad, aLimite: string): String;
var
  strSQL, strCondicion : String;
begin

  strCondicion := format('%s,%s,%s', [QuotedStr(DateToStr(aFConsulta)), QuotedStr(aEntidad), QuotedStr(aLimite)]);

  strSQL := '' +
            ' Select NIVEL_FINAN_MAX,                                        ' +
            '        TIPO_ENTIDAD,                                           ' +
            '        Case When TIPO_LIMITE = ''FID'' Then ''Fideicomiso''    ' +
            '             When TIPO_LIMITE = ''MAN'' Then ''Mandato''        ' +
            '             When TIPO_LIMITE = ''SNE'' Then ''Sin Estructura'' ' +
            '             Else ''''                                          ' +
            '         End TIPO_LIMITE,                                       ' +
            '        PCT_PI_INF,                                             ' +
            '        PCT_PI_SUP,                                             ' +
            '        PCT_SP,                                                 ' +
            '        PCT_RES_INF,                                            ' +
            '        PCT_RES_SUP,                                            ' +
            '        PCT_COL_1,                                              ' +
            '        PCT_COL_2,                                              ' +
            '        PCT_COL_3                                               ' +
            '   From Table (PkgCRGPViews.VW_CR_GP_Finan_Max ( ' + strCondicion+ '))';

      {' Select NIVEL_FINAN_MAX, TIPO_ENTIDAD, TIPO_LIMITE, PCT_PI_INF, ' +
      '    PCT_PI_SUP, PCT_SP, PCT_RES_INF, PCT_RES_SUP, PCT_COL_1,  ' +
      '    PCT_COL_2, PCT_COL_3 From Table (PkgCRGPViews.VW_CR_GP_Finan_Max ( ' + strCondicion+ '))';}

  Result := strSQL;
end;

procedure TWCrGpFinanMax.llenaDatos(aConsulta: string);
var
  vlQry : TQuery;
begin
  vlQry := GetSQLQuery(aConsulta,
                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

  grdLimites.BeginGrid;

//  grdLimites.Titulo1 := FormatDateTime('dddddd', dtFConsulta.Date);
  grdLimites.EndCaption;
  //grdLimites.Titulo2 := '.';
  grdLimites.AddTitle('', tcCenter );

  try
    if vlQry <> nil then
    begin
      //vlQry.FieldByName('NIVEL_FINAN_MAX').Visible:= False;

      vlQry.FieldByName('NIVEL_FINAN_MAX').DisplayWidth := 5;
      vlQry.FieldByName('TIPO_ENTIDAD').DisplayWidth := 11;
      vlQry.FieldByName('TIPO_LIMITE').DisplayWidth :=12;
      vlQry.FieldByName('PCT_PI_INF').DisplayWidth := 11;
      vlQry.FieldByName('PCT_PI_SUP').DisplayWidth := 11;
      vlQry.FieldByName('PCT_SP').DisplayWidth := 11;
      vlQry.FieldByName('PCT_RES_INF').DisplayWidth := 16;
      vlQry.FieldByName('PCT_RES_SUP').DisplayWidth := 16;
      vlQry.FieldByName('PCT_COL_1').DisplayWidth := 11;
      vlQry.FieldByName('PCT_COL_2').DisplayWidth := 11;
      vlQry.FieldByName('PCT_COL_2').DisplayWidth := 11;

      vlQry.FieldByName('NIVEL_FINAN_MAX').DisplayLabel := 'Nivel';
      vlQry.FieldByName('TIPO_ENTIDAD')   .DisplayLabel := '    Entidad';
      vlQry.FieldByName('TIPO_LIMITE')    .DisplayLabel := '    Estructura';  //'T Limite';
      vlQry.FieldByName('PCT_PI_INF')     .DisplayLabel := '   PI Inferior';  //'PI Inf';
      vlQry.FieldByName('PCT_PI_SUP')     .DisplayLabel := ' PI Superior';  //'%Sup PI';
      vlQry.FieldByName('PCT_SP')         .DisplayLabel := '      % SP';
      vlQry.FieldByName('PCT_RES_INF')    .DisplayLabel := '  Reservas Inferior';  //'%Reser Inf';
      vlQry.FieldByName('PCT_RES_SUP')    .DisplayLabel := ' Reservas Superior';  //'%Reser Sup';
      vlQry.FieldByName('PCT_COL_1')      .DisplayLabel := '      Lim. 1';
      vlQry.FieldByName('PCT_COL_2')      .DisplayLabel := '      Lim. 2';
      vlQry.FieldByName('PCT_COL_3')      .DisplayLabel := '      Lim. 3';

      TFloatField (vlQry.FieldByName('PCT_PI_INF')) .DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_PI_SUP')) .DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_SP'))     .DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_RES_INF')).DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_RES_SUP')).DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_COL_1'))  .DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_COL_2'))  .DisplayFormat := '###,###,###,###,###.00';
      TFloatField (vlQry.FieldByName('PCT_COL_3'))  .DisplayFormat := '###,###,###,###,###.00';
      //grdLimites.AddQry( vlQry, True,True,0,0,0,False); // AGREGAR QUERY

      vlQry.FieldByName('PCT_PI_INF') .Alignment := taCenter;
      vlQry.FieldByName('PCT_PI_SUP') .Alignment := taCenter;
      vlQry.FieldByName('PCT_SP')     .Alignment := taCenter;
      vlQry.FieldByName('PCT_RES_INF').Alignment := taCenter;
      vlQry.FieldByName('PCT_RES_SUP').Alignment := taCenter;
      vlQry.FieldByName('PCT_COL_1')  .Alignment := taCenter;
      vlQry.FieldByName('PCT_COL_2')  .Alignment := taCenter;
      vlQry.FieldByName('PCT_COL_3')  .Alignment := taCenter;

      grdLimites.AddQry(vlQry, // Query
            True, // Iniciar Grid, Limpiar Lineas Anteriores.
            True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
            -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
            ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
            ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
            True); // ShowTitle


      grdLimites.AddTitle('Total de Registros ' + IntToStr(vlQry.RecordCount), tcCenter );
    end
    else begin
      grdLimites.AddTexto('NO EXISTEN DATOS', tcLeft, -1, ALTO_COL);
      //grdLimites.AddTitle('NO EXISTEN DATOS', TcCenter);
    end;

    grdLimites.ShowTab := true;
    grdLimites.ShowBtnFirst := true;
    grdLimites.ShowBtnLast := true;
    grdLimites.ShowBtnPriorNext := true;
    grdLimites.EndGrid;

 finally
    if vlQry <> nil then
       vlQry.free;
    //end if
  end;
end;

procedure TWCrGpFinanMax.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGPFIMA_BUSCA',True,True) then
   begin
      setElementos;
      llenaDatos(generaConsulta(dtFConsulta.Date, strEntidad, strLimite));
   end;
end;

procedure TWCrGpFinanMax.grdLimitesDblClick(Sender: TObject);
begin
  ModificarDatos1Click(Sender);
end;

procedure TWCrGpFinanMax.setElementos;
begin
  case cbxEntidad.ItemIndex of
    0 : strEntidad := 'ESTATAL';
    1 : strEntidad := 'MUNICIPAL';
    //2 : strEntidad := 'FEDERAL';
    else strEntidad := 'ESTATAL|MUNICIPAL';
  end;

  case cbxLimite.ItemIndex of
    0 : strLimite := 'FID';
    1 : strLimite := 'MAN';
    2 : strLimite := 'SNE';
    else strLimite := '';
  end;
end;

procedure TWCrGpFinanMax.ModificarDatos1Click(Sender: TObject);
var
  MCrGpFiMa : TMCrGpFiMa;
begin
  // EN SEGURIDAD DAR DE ALTA LA FUNCION "CLASE_TMCRGPFIMA" = 'Mantenimiento a Límite de Financiamiento'
  MCrGpFiMa := TMCrGpFiMa.Create(self);
  try
     MCrGpFiMa.Apli := dmMain.apMain;
     MCrGpFiMa.ParamCre := Objeto.ParamCre;
     MCrGpFiMa.FindKey( [
        grdLimites.CellStr['TIPO_ENTIDAD', grdLimites.SG.Selection.Top],
        grdLimites.CellStr['TIPO_LIMITE', grdLimites.SG.Selection.Top],
        grdLimites.CellStr['NIVEL_FINAN_MAX', grdLimites.SG.Selection.Top] ] );
     MCrGpFiMa.Catalogo;
  finally
     MCrGpFiMa.Free;
  end;
  setElementos;
  llenaDatos(generaConsulta(dtFConsulta.Date, strEntidad, strLimite));end;

end.
