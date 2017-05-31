// Sistema         : Clase de CR_REL_CRED_CHEQ
// Fecha de Inicio : 28/04/2005
// Función forma   : Clase de CR_REL_CRED_CHEQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :

Unit IntCrCartrIm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

//UNIDADES ADICONALES
IntParamCre,
Grids, Aligrid, Menus,
IntSGCtrl,
Ungene,
IntGenCre
;

Type
 TCrCartrIm= class;

  TWCrCartrIm=Class(TForm)
    InterForma1             : TInterForma;
    lbCUENTA_BANCO : TLabel;
    NOM_ACREDITADO: TEdit;
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
    sgcDATOS: TSGCtrl;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    private
    { Private declarations }
       vliAdeudo : Double;
       
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TCrCartrIm;
end;
 TCrCartrIm= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        NOM_ACREDITADO           : TInterCampo;
        ID_PROVEEDOR             : TInterCampo;
        NOM_PROVEEDOR            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        TIPO_CLIENTE             : TInterCampo;


        //Clases Adicionales
        ParamCre                 : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrCartrIm.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      NOM_ACREDITADO :=CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,True);
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftFloat,tsNinguno,tsNinguno,True);
      NOM_PROVEEDOR :=CreaCampo('NOM_PROVEEDOR',ftString,tsNinguno,tsNinguno,True);
      TIPO_CLIENTE :=CreaCampo('TIPO_CLIENTE',ftString,tsNinguno,tsNinguno,True);

      UseQuery := True;
      HelpFile := 'IntCrCartrIm.Hlp';

end;

Destructor TCrCartrIm.Destroy;
begin
   inherited;
end;


function TCrCartrIm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCartrIm;
begin
   W:=TWCrCartrIm.Create(Self);
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

(***********************************************FORMA CR_REL_CRED_CHEQ********************)
(*                                                                              *)
(*  FORMA DE CR_REL_CRED_CHEQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_CRED_CHEQ********************)

procedure TWCrCartrIm.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.NOM_ACREDITADO.Control:=NOM_ACREDITADO;
      vliAdeudo :=0;
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrCartrIm.FormDestroy(Sender: TObject);
begin
      Objeto.NOM_ACREDITADO.Control:=nil;
end;

procedure TWCrCartrIm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCartrIm.MuestraDatos;
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT CR.ID_CREDITO, CT.ID_CONTRATO, P.NOMBRE, PROV.NOMBRE PROVEEDOR, ' + coCRLF +
              '        ( CR.IMP_CAPITAL_VDO + CR.IMP_MOR_CAPITAL + CR.IMP_IVA_MOR_CAP) CAPITAL, ' +coCRLF +
              '        ( CR.IMP_VDO_FINAN_A + CR.IMP_MOR_FINAN_A + CR.IMP_IVA_MOR_FIN ) FINAN_ADIC,' +coCRLF +
              '        ( CR.IMP_INTERES_VDO + CR.IMP_IVA_INT_VDO ) INTERES,' +coCRLF +
              '        ( CR.IMP_COMISION_VDO + CR.IMP_IVA_COM_VDO + CR.IMP_MOR_COMISION + CR.IMP_IVA_MOR_COM ) COMISION,' +coCRLF +

              '        (CR.IMP_CAPITAL_VDO + CR.IMP_INTERES_VDO + CR.IMP_COMISION_VDO + ' +coCRLF +
              '         CR.IMP_IVA_COM_VDO + CR.IMP_IVA_INT_VDO + CR.IMP_VDO_FINAN_A +' +coCRLF +
              '         CR.IMP_IVA_MOR_CAP + CR.IMP_IVA_MOR_COM + CR.IMP_IVA_MOR_FIN +' +coCRLF +
              '         CR.IMP_MOR_CAPITAL + CR.IMP_MOR_COMISION + CR.IMP_MOR_FINAN_A) ADEUDO' +coCRLF +

              ' FROM CR_CREDITO CR, CONTRATO CT, PERSONA P,' +coCRLF +
              '      ( SELECT ID_CREDITO FROM CR_CAPITAL' +coCRLF +
              ' 	   WHERE SIT_CAPITAL = ''IM''' +coCRLF +
              '      UNION' +coCRLF +
              ' 	   SELECT ID_CREDITO FROM CR_FINAN_ADIC' +coCRLF +
              ' 	   WHERE SIT_FINAN_ADIC = ''IM''' +coCRLF +
              '      UNION' +coCRLF +
              ' 	   SELECT ID_CREDITO FROM CR_INTERES' +coCRLF +
              ' 	   WHERE SIT_INTERES = ''IM''' +coCRLF +
              ' 	 UNION' +coCRLF +
              ' 	   SELECT ID_CREDITO FROM CR_COMISION' +coCRLF +
              ' 	   WHERE SIT_COMISION = ''IM''' +coCRLF +
              ' 	 )IMP,' +coCRLF +
              ' 	 CR_CESION CS, PERSONA PROV' +coCRLF +
              ' WHERE CR.SIT_CREDITO NOT IN ( ''CA'', ''LQ'')' + coCRLF ;

              if Objeto.TIPO_CLIENTE.AsString = 'PR' THEN
                vlsql := vlsql + '   AND CS.ID_PROVEEDOR = ' + Objeto.ID_ACREDITADO.AsString + coCRLF
              ELSE
                vlsql := vlsql + '   AND CT.ID_TITULAR = ' + Objeto.ID_ACREDITADO.AsString + coCRLF ;

     vlsql := vlsql + '   AND CR.ID_CREDITO = IMP.ID_CREDITO' +coCRLF +
              '   AND CT.ID_CONTRATO = CR.ID_CONTRATO' +coCRLF +
              '   AND CT.ID_TITULAR = P.ID_PERSONA' +coCRLF +
              '   AND CR.ID_CREDITO = CS.ID_CESION(+)' +coCRLF +
              '   AND CS.ID_PROVEEDOR = PROV.ID_PERSONA(+)' +coCRLF +
              ' ORDER BY CR.ID_CREDITO';


     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('NOMBRE').Visible := False;

            vlQry.FieldByName('ID_CREDITO').DisplayWidth := 13;
            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 13;
            vlQry.FieldByName('PROVEEDOR').DisplayWidth := 32;
            vlQry.FieldByName('CAPITAL').DisplayWidth := 14;
            vlQry.FieldByName('FINAN_ADIC').DisplayWidth := 14;
            vlQry.FieldByName('INTERES').DisplayWidth := 14;
            vlQry.FieldByName('COMISION').DisplayWidth := 14;
            vlQry.FieldByName('ADEUDO').DisplayWidth := 14;

            TNumericField(vlQry.FieldByName('CAPITAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('FINAN_ADIC')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('INTERES')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('COMISION')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('ADEUDO')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY

        end
        else
        Begin
            sgcDATOS.Clear('EL ACREDITADO NO TIENE CARTERA IMPAGADA'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;

end;

procedure TWCrCartrIm.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrCartrIm.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var vlsTotal : string;
begin
  {Inicializa las variable de total }
  if ( RowCaso = rcQueryBegin ) then
  begin
      vliAdeudo :=0;
  end;//ends_if

  if ( RowCaso = rcRowBegin ) then
     vliAdeudo := vliAdeudo + DataSet.FieldByName('ADEUDO').AsFloat;

  { Valida fin de Query }
  if ( RowCaso = rcQueryEnd ) then
  begin
     vlsTotal:= 'ADEUDO TOTAL' + Format(CFORMAT_DINERO,[ vliAdeudo ] );
     sgcDATOS.AddTexto( vlsTotal, tcRight, clMaroon, 15);
     sgcDATOS.AddTexto('' , tcCenter, clMaroon, 15);
  end;//ends_if
end;

end.
