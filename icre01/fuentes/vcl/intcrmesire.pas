// Sistema         : Clase de CR_MESES_SIN_REC
// Fecha de Inicio : 28/04/2005
// Función forma   : Clase de CR_MESES_SIN_REC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrMeSiRe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,
//UNIDADES ADICIONALES
        IntParamCre,
        IntGenCre,
        IntBasicCred,
        IntInter;

Type
 TCrMeSiRe= class; 

  TWCrMesesSinRec=Class(TForm)
    InterForma1             : TInterForma;
    edTIT_FECHA: TEdit;
    Edit9: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    sgcDATOS: TSGCtrl;
    edSECUENCIA: TEdit;
    lbSECUENCIA: TLabel;
    edDESC_CREDITO: TEdit;
    edID_CREDITO: TEdit;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    edBANCO: TEdit;
    edNOMBRE_TITULAR: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Edit1: TEdit;
    edF_INI_MES: TEdit;
    dtpF_INI_MES: TInterDateTimePicker;
    edF_FIN_MES: TEdit;
    dtpF_FIN_MES: TInterDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure edF_INI_MESExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATOSMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private 
    { Private declarations }
        Procedure   MuestraDatos;
    public
    { Public declarations }
    Objeto : TCrMeSiRe;
end;
 TCrMeSiRe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations }
        vgNomAcreditado          : String;
        vgNomBanco               : String;
        vgNomTitular             : String;
        vgIdCredito              : String;
        vgCtaBanco               : String;
        vgBanco                  : String;
        vgSecuencia              : String;

        ID_CREDITO               : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        SECUENCIA                : TInterCampo;
        F_INI_MES                : TInterCampo;
        F_FIN_MES                : TInterCampo;
        MES_EXCEP                : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Intermediario        	 : TIntermed;
        BasicCred                : TBasicCred;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrMeSiRe.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Disposición';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,True);
                ID_BANCO_CHQRA.Caption:='Número de Banco Chqra';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
                CUENTA_BANCO.Caption:='Cuenta Banco';
      SECUENCIA :=CreaCampo('SECUENCIA',ftFloat,tsNinguno,tsNinguno,True);
                SECUENCIA.Caption:='Secuencia';
      F_INI_MES :=CreaCampo('F_INI_MES',ftDate,tsNinguno,tsNinguno,True);
                F_INI_MES.Caption:='Fecha Ini Mes';
      F_FIN_MES :=CreaCampo('F_FIN_MES',ftDate,tsNinguno,tsNinguno,True);
                F_FIN_MES.Caption:='Fecha Fin Mes';
      MES_EXCEP :=CreaCampo('MES_EXCEP',ftString,tsNinguno,tsNinguno,False);
        With MES_EXCEP do
        begin
          Size:=2;
          UseCombo:=True;
          ComboLista.Add('0'); ComboDatos.Add('01');
          ComboLista.Add('1'); ComboDatos.Add('02');
          ComboLista.Add('2'); ComboDatos.Add('03');
          ComboLista.Add('3'); ComboDatos.Add('04');
          ComboLista.Add('4'); ComboDatos.Add('05');
          ComboLista.Add('5'); ComboDatos.Add('06');
          ComboLista.Add('6'); ComboDatos.Add('07');
          ComboLista.Add('7'); ComboDatos.Add('08');
          ComboLista.Add('8'); ComboDatos.Add('09');
          ComboLista.Add('9'); ComboDatos.Add('10');
          ComboLista.Add('10'); ComboDatos.Add('11');
          ComboLista.Add('11'); ComboDatos.Add('12');
        end;

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_BANCO_CHQRA');
      FKeyFields.Add('CUENTA_BANCO');
      FKeyFields.Add('SECUENCIA');
      FKeyFields.Add('F_INI_MES');
      FKeyFields.Add('F_FIN_MES');

      TableName := 'CR_MESES_SIN_REC';
      UseQuery := True;
      HelpFile := 'IntCrMeSiRe.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Intermediario:= TIntermed.Create(Self);
      {$WARNINGS ON}
      Intermediario.MasterSource := Self;
      Intermediario.Id_Intermediario.MasterField := 'ID_BANCO_CHQRA';
      Intermediario.BuscaWhereString:= 'Sit_Intermed = ''AC''';

end;

Destructor TCrMeSiRe.Destroy;
begin
   if Intermediario <> nil then
     Intermediario.Free;
   //end if;
   inherited;
end;


function TCrMeSiRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMesesSinRec;
begin
   W:=TWCrMesesSinRec.Create(Self);
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


Function TCrMeSiRe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMeSR.it','F,F,S,F,D,D');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString); 
                               T.Param(1,ID_BANCO_CHQRA.AsString);
                               T.Param(2,CUENTA_BANCO.AsString);
                               T.Param(3,SECUENCIA.AsString);
                               T.Param(4,F_INI_MES.AsString);
                               T.Param(5,F_FIN_MES.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3),T.DameCampo(4),T.DameCampo(5)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_MESES_SIN_REC********************)
(*                                                                              *)
(*  FORMA DE CR_MESES_SIN_REC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MESES_SIN_REC********************)
procedure TWCrMesesSinRec.MuestraDatos;
var vlQry : TQuery;
    vlSql : String;
begin
     vlSql := ' SELECT ID_CREDITO,  ' + ' CUENTA_BANCO||'' - ''||' + SQLStr(Objeto.vgNomBanco) + ' CUENTA_BANCO_DESC, ' +
              '        CUENTA_BANCO,ID_BANCO_CHQRA, ' +
              '        SECUENCIA, F_INI_MES,F_FIN_MES, ' +
              '        DECODE(TO_CHAR(F_INI_MES, ''MM''),01,''ENERO'',      02,''FEBRERO'', ' +
              '                                          03,''MARZO'',      04,''ABRIL'', ' +
              '                                          05,''MAYO'',       06,''JUNIO'', ' +
              '                                          07,''JULIO'',      08,''AGOSTO'', ' +
              '                                          09,''SEPTIEMBRE'', 10,''OCTUBRE'', ' +
              '                                          11,''NOVIEMBRE'',  12,''DICIEMBRE'' ) MES, ' +
              '        TO_CHAR(F_INI_MES, ''YYYY'') ANO ' +
              ' FROM CR_MESES_SIN_REC ' +
              ' WHERE ID_CREDITO   =  ' + Objeto.ID_CREDITO.AsString +
              '   AND CUENTA_BANCO =  ' + Objeto.CUENTA_BANCO.AsString+
              '   AND SECUENCIA    =  ' + Objeto.SECUENCIA.AsString;

     vlQry := GetSQLQuery(vlSql,
                       Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('F_INI_MES').Visible := False;
            vlQry.FieldByName('F_FIN_MES').Visible := False;
            vlQry.FieldByName('CUENTA_BANCO').Visible := False;
            vlQry.FieldByName('ID_BANCO_CHQRA').Visible := False;

            vlQry.FieldByName('ID_CREDITO').DisplayWidth := 13;
            vlQry.FieldByName('CUENTA_BANCO_DESC').DisplayWidth := 43;
            vlQry.FieldByName('SECUENCIA').DisplayWidth := 12;
            vlQry.FieldByName('MES').DisplayWidth := 15;
            vlQry.FieldByName('ANO').DisplayWidth := 8;

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;

        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCrMesesSinRec.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
      Objeto.SECUENCIA.Control:=edSECUENCIA;
      Objeto.F_INI_MES.Control:=edF_INI_MES;
      Objeto.F_FIN_MES.Control:=edF_FIN_MES;

      Objeto.Intermediario.Persona.Nombre.Control := edBANCO;
      Objeto.Intermediario.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;

end;

procedure TWCrMesesSinRec.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
      Objeto.SECUENCIA.Control:=nil;
      Objeto.F_INI_MES.Control:=nil;
      Objeto.F_FIN_MES.Control:=nil;
      Objeto.Intermediario.Persona.Nombre.Control := nil;
end;

procedure TWCrMesesSinRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMesesSinRec.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.ID_CREDITO.AsString:= Objeto.BasicCred.ID_CREDITO.AsString;
   Objeto.ID_BANCO_CHQRA.AsString:= Objeto.vgBanco;
   Objeto.CUENTA_BANCO.AsString:= Objeto.vgCtaBanco;
   Objeto.SECUENCIA.AsString := Objeto.vgSecuencia;
   Objeto.F_INI_MES.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FIN_MES.AsDateTime := DameFinMes(Objeto.F_INI_MES.AsDateTime);
end;

procedure TWCrMesesSinRec.edF_INI_MESExit(Sender: TObject);
Var    vlSalida        : Boolean;
       vlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := CNULL;
      vlSalida := True;
      Objeto.F_INI_MES.GetFromControl;
      Objeto.F_FIN_MES.GetFromControl;
      Objeto.F_INI_MES.AsDateTime := DameIniMes( Objeto.F_INI_MES.AsDateTime );
      Objeto.F_FIN_MES.AsDateTime := DameFinMes( Objeto.F_INI_MES.AsDateTime );
      if ( Objeto.F_INI_MES.AsDateTime < Objeto.BasicCred.F_INICIO.AsDateTime) then
      Begin
         vlMsg := 'La fecha no debe ser menor a la fecha de inicio del crédito <' + Objeto.BasicCred.F_INICIO.AsString +'>';
         vlSalida := False;
      end
      else if ( Objeto.F_FIN_MES.AsDateTime > Objeto.BasicCred.F_VENCIMIENTO.AsDateTime) then
      Begin
         vlMsg := 'La fecha no debe ser mayor a la fecha de vencimiento del crédito <' + Objeto.BasicCred.F_VENCIMIENTO.AsString +'>';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edF_INI_MES,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrMesesSinRec.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.ID_CREDITO.AsString:= Objeto.BasicCred.ID_CREDITO.AsString;
   edDESC_CREDITO.Text := Objeto.BasicCred.NOM_ACREDITADO.AsString;
   Objeto.CUENTA_BANCO.AsString := Objeto.vgCtaBanco;
   edNOMBRE_TITULAR.Text := Objeto.vgNomTitular;
   Objeto.SECUENCIA.AsString := Objeto.vgSecuencia;
   MuestraDatos;
end;

procedure TWCrMesesSinRec.sgcDATOSMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   IF sgcDATOS.CellStr['ID_CREDITO',ToIndex] <> CNULL THEN
   Begin
        Objeto.FindKey([ sgcDATOS.CellStr['ID_CREDITO',ToIndex],
                         sgcDATOS.CellStr['ID_BANCO_CHQRA',ToIndex],
                         sgcDATOS.CellStr['CUENTA_BANCO',ToIndex],
                         sgcDATOS.CellStr['SECUENCIA',ToIndex],
                         sgcDATOS.CellStr['F_INI_MES',ToIndex],
                         sgcDATOS.CellStr['F_FIN_MES',ToIndex]
                         ]);
   end
end;

procedure TWCrMesesSinRec.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
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
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end;
end;

procedure TWCrMesesSinRec.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
      MuestraDatos;
   //end if;
end;

procedure TWCrMesesSinRec.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraDatos;
end;

end.
