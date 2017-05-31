// Sistema         : Clase de CR_CON_CAT_DATA
// Fecha de Inicio : 27/06/2013
// Función forma   : Clase de CR_CON_CAT_DATA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Comentarios     : Para administrar afectación de claves de operación sobre la relacion CR_CON_CAT_DATA
Unit IntCrBCAfec;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, IntParamCre, ComCtrls, IntDtPk, IntCrOperaci,
  IntLinkit;

Type
 TCrBCAfec= class;

  TWCrBCAfec=Class(TForm)
    InterForma1             : TInterForma;
    edCVE_CLAVE: TEdit;
    Label2: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgCVE_VALOR_ADIC: TRadioGroup;
    bbCveOperacion: TBitBtn;
    ilCVE_OPERACION: TInterLinkit;
    edDESC_C_OPERACION: TEdit;
    cbDESC_CLAVE: TComboBox;
    MsgPanel: TPanel;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_CLAVEExit(Sender: TObject);
    procedure rgCVE_VALOR_ADICExit(Sender: TObject);
    procedure rgCVE_VALOR_ADICClick(Sender: TObject); 
    procedure bbCveOperacionClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure cbDESC_CLAVEExit(Sender: TObject);
    private
    { Private declarations }
    procedure Poblar_Combo;
    public
    { Public declarations }
    Objeto : TCrBCAfec;
end;
 TCrBCAfec= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        CVE_CON_GPO_CAT   :TInterCampo ;
        CVE_CLAVE         :TInterCampo ;
        DESC_CLAVE        :TInterCampo ;
        CVE_VALOR_ADIC    :TInterCampo ;

        ParamCre          :TParamCre ;
        Operacion    : TCrOperaci;

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


constructor TCrBCAfec.Create( AOwner : TComponent ); 
begin Inherited;

      CVE_CON_GPO_CAT:=CreaCampo('CVE_CON_GPO_CAT',ftString,tsNinguno,tsNinguno,True);
                CVE_CON_GPO_CAT.Caption:='Clave de Grupo de Catalogo';
      CVE_CLAVE:=CreaCampo('CVE_CLAVE', ftString, tsNinguno, tsNinguno, True) ;
                CVE_CLAVE.Caption:= 'Clave';
      DESC_CLAVE:=CreaCampo('DESC_CLAVE',ftString,tsNinguno,tsNinguno,True);
                DESC_CLAVE.Caption:='Descripción';
      CVE_VALOR_ADIC:=CreaCampo('CVE_VALOR_ADIC',ftString,tsNinguno,tsNinguno,True);
      With CVE_VALOR_ADIC do
      Begin
         Size := 1;
         UseCombo := True;
         ComboLista.Add('0'); ComboDatos.Add('I');
         ComboLista.Add('1'); ComboDatos.Add('D');
      end;
                CVE_VALOR_ADIC.Caption:='Clave Adicional';

      FKeyFields.Add('CVE_CON_GPO_CAT');
      FKeyFields.Add('CVE_CLAVE');

      Operacion := TCrOperaci.Create(Self);
      Operacion.MasterSource:=Self;
      // FJR 02.01.2014 Comentado para permitir relación CR_OPERACION/CR_CON_CAT_DATA menos restrictiva
      {Operacion.FilterString:= ' CVE_OPERACION IN (SELECT CVE_CLAVE AS CVE_OPERACION '+
                               '                   FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_CVEOPE_CVEN'')  ' ;
      Operacion.BuscaWhereString := Operacion.FilterString ; }

      TableName := 'CR_CON_CAT_DATA';
      UseQuery := True;
      HelpFile := 'ICrBCAfec.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrBCAfec.Destroy;
begin inherited;
end;


function TCrBCAfec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBCAfec;
begin
   W:=TWCrBCAfec.Create(Self);
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

Function TCrBCAfec.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrBCAfec.it','S,S');
      Try
       if Active then
          BEGIN
          T.Param(0,CVE_CON_GPO_CAT.AsString);
          T.Param(1,CVE_CLAVE.AsString);
          END;
       if T.Execute then
          InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrBCAfec.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrBCAfec********************)
(*                                                                              *)
(*  FORMA DE CrBCAfec                                                            *)
(*                                                                              *)
(***********************************************FORMA CrBCAfec********************)
procedure TWCrBCAfec.Poblar_Combo;   // FJR 26.02.2014 Para parametrizar más el manejo de los catálogos de buró.
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := 'SELECT DESCRIPCION   '+
              '  FROM BC_PARAM_BURO '+
              ' WHERE VALOR_PARAMETRO = ''CAT_CONCEPTO'' '+
              ' ORDER BY DESCRIPCION ' ;

     vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        begin
          cbDESC_CLAVE.Items.Clear;
          While not vlQry.eof do begin
            cbDESC_CLAVE.Items.Add(Trim(vlQry.Fields[0].AsString)) ;
            vlQry.Next;
          end;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
     end;
end;

procedure TWCrBCAfec.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    InterForma1.MsgPanel:= MsgPanel;

    Objeto.CVE_CLAVE.Control        := edCVE_CLAVE;
    Objeto.DESC_CLAVE.Control       := cbDESC_CLAVE;       // FJR 02.01.2014 Para permitir relación CR_OPERACION/CR_CON_CAT_DATA menos restrictiva
    Objeto.CVE_VALOR_ADIC.Control   := rgCVE_VALOR_ADIC;

    Objeto.Operacion.CVE_OPERACION.Control:= edCVE_CLAVE;
    Objeto.Operacion.DESC_C_OPERACION.Control:= edDESC_C_OPERACION;

    Poblar_Combo;
end;

procedure TWCrBCAfec.FormDestroy(Sender: TObject);
begin
//Objeto
    Objeto.CVE_CLAVE.Control        := nil;
    Objeto.DESC_CLAVE.Control       := nil;        // FJR 02.01.2014 Para permitir relación CR_OPERACION/CR_CON_CAT_DATA menos restrictiva
    Objeto.CVE_VALOR_ADIC.Control   := nil;

    InterForma1.MsgPanel:= nil;

    Objeto.Operacion.CVE_OPERACION.Control:= nil;
    Objeto.Operacion.DESC_C_OPERACION.Control:= nil;
end;

procedure TWCrBCAfec.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrBCAfec.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_CON_GPO_CAT.AsString:= 'CAT_CVEOPE_AFEC';
   //Objeto.DESC_CLAVE.AsString:= 'Op. Afectación BC';   // FJR 02.01.2014 Comentado para permitir relación CR_OPERACION/CR_CON_CAT_DATA menos restrictiva
   rgCVE_VALOR_ADIC.ItemIndex := -1 ;
   edCVE_CLAVE.SetFocus ;
end;

procedure TWCrBCAfec.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrBCAfec.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

procedure TWCrBCAfec.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
           Realizado := True;
      end
      else
           Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else
           Realizado := False;
   end

end;

procedure TWCrBCAfec.edCVE_CLAVEExit(Sender: TObject);
var   vlSalida    :  Boolean;
      vlMsg, sSQL :  String;
                Q : TQuery;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg     := '';
      vlSalida   := True;
      Objeto.CVE_CLAVE.GetFromControl;
      Objeto.CVE_VALOR_ADIC.GetFromControl;
      If Objeto.CVE_CLAVE.AsString = '' Then Begin
         vlSalida := False;
         vlMsg := 'Indique la clave.';
      End
      Else Begin
            sSQL:= 'SELECT CVE_CLAVE FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_CVEOPE_AFEC'' '+
                   'AND CVE_CLAVE = '+ SQLStr(Objeto.CVE_CLAVE.AsString)+' '+
                   'AND CVE_VALOR_ADIC = '+SQLStr(Objeto.CVE_VALOR_ADIC.AsString)+' ';
               Q:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If Q <> Nil Then Begin
               If Q.RecordCount > 0 Then Begin
                  vlSalida   := False;
                  vlMsg := 'La declaración de afectación para '+Objeto.CVE_CLAVE.AsString+' YA existe. ';
               End;
               Q.Free;
            End;
      End;
      InterForma1.ValidaExit(edCVE_CLAVE,vlSalida,vlMsg,True);
   end ;
end;

procedure TWCrBCAfec.rgCVE_VALOR_ADICExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_VALOR_ADIC,True,'',True);
end;

procedure TWCrBCAfec.rgCVE_VALOR_ADICClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Case rgCVE_VALOR_ADIC.ItemIndex of
             0: Objeto.CVE_VALOR_ADIC.AsString := 'I';
             1: Objeto.CVE_VALOR_ADIC.AsString := 'D';
         End ;
      end ;
end;

procedure TWCrBCAfec.bbCveOperacionClick(Sender: TObject);
begin
   Objeto.Operacion.ShowAll := True;
   If Objeto.Operacion.Busca Then Begin
      InterForma1.NextTab(bbCveOperacion);
   End;
end;

procedure TWCrBCAfec.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.InternalBusca then
     Objeto.Operacion.FindKey([Objeto.CVE_CLAVE.AsString]);
end;

procedure TWCrBCAfec.cbDESC_CLAVEExit(Sender: TObject);
var   vlSalida    :  Boolean;
      vlMsg       :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg     := '';
      vlSalida   := True;
      Objeto.CVE_CLAVE.GetFromControl;
      Objeto.DESC_CLAVE.GetFromControl;
      If (Objeto.DESC_CLAVE.AsString = '') and (Objeto.CVE_CLAVE.AsString <> '') Then Begin
         vlSalida := False;
         vlMsg := 'Indique el concepto agrupador.';
      End;
      If vlMsg <> '' then
      InterForma1.ValidaExit(cbDESC_CLAVE,vlSalida,vlMsg,True);
   end ;
end;

end.
