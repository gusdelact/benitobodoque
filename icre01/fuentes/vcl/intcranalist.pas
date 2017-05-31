 // Sistema         : Clase de CR_ACCIONISTA
// Fecha de Inicio : 06/05/2004
// Función forma   : Clase de CR_ACCIONISTA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrAnalist;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, InterEdit,
IntLinkit,Ungene,
//Unidades Adicionales
IntParamCre, IntGenCre,
IntCrAcredit,
IntCrAcrCon;

Type
 TCrAnalist= class;

  TWCrAnalista=Class(TForm)
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    edNOMBRE_ACREDITADO: TEdit;
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
    sgVobosAnalistas: TSGCtrl;
    MsgPanel: TPanel;
    ilACREDITADO: TInterLinkit;
    Label1: TLabel;
    InterForma1: TInterForma;
    Bevel1: TBevel;
    Label2: TLabel;
    edID_CONTRATO: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);



    private
    { Private declarations }
       Procedure    MuestraVobosAnalista(pContrato : String);
       Procedure    MuestraHints;
    public
    { Public declarations }
    Objeto : TCrAnalist;
end;
 TCrAnalist= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_ACCIONISTA            : TInterCampo;
        NOMBRE                   : TInterCampo;
        CVE_PUESTO               : TInterCampo;
        PCT_PARTICIPA            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_ACCIONISTA           : TInterCampo;

        // Nuevo Codigo MAMG.
        SIGLAS_RFC               : TInterCampo;
        F_RFC                    : TInterCampo;
        HOMOCLAVE_RFC            : TInterCampo;
        // Termina codigo nuevo

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Puesto                   : TCrAcrCon;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
{$R *.DFM}


constructor TCrAnalist.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,false);
      ID_ACREDITADO.Caption:='Número de Acreditado';

      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Número de Contrato';


      FKeyFields.Add('ID_CONTRATO');


      TableName := 'CR_VOBO_ANALIST';
      UseQuery := True;
      HelpFile := 'IntCrAnalist.Hlp';
      ShowMenuReporte:=True;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
      Acreditado.Persona.BuscaWhereString := '  AND PERSONA.SIT_PERSONA = ' + SQLStr(CSIT_AC);
      Acreditado.Persona.FilterString := Acreditado.Persona.BuscaWhereString;
      Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO =' + SQLStr(CSIT_AC);
      Acreditado.FilterString := Acreditado.BuscaWhereString;

end;

Destructor TCrAnalist.Destroy;
begin
   if Puesto <> nil then
      Puesto.Free;
   //end if
   inherited;
end;


function TCrAnalist.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAnalista;
begin
   W:=TWCrAnalista.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta ; //Para que solo sea de consulta 
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrAnalist.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAccio.it','F,F,S');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString);
                               T.Param(1,ID_ACCIONISTA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

procedure TWCrAnalista.MuestraVobosAnalista(pContrato: String);
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT VOBO.ID_CONTRATO,    ' + coCRLF +
              '        VOBO.CVE_ANALISTA,     ' + coCRLF +
              '        P.NOMBRE,              ' + coCRLF +
              '        VOBO.FH_VOBO           ' + coCRLF +
              ' FROM CR_VOBO_ANALIST VOBO ,PERSONA P , USUARIO USU' + coCRLF +
              ' WHERE VOBO.ID_CONTRATO = '+   pContrato  + coCRLF +
              ' AND VOBO.CVE_ANALISTA = USU.CVE_USUARIO AND USU.ID_PERSONA = P.ID_PERSONA   ' + coCRLF +
              ' ORDER BY VOBO.FH_VOBO DESC' ;

     vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            vlQry.FieldByName('ID_CONTRATO').Visible := False;
            vlQry.FieldByName('CVE_ANALISTA').DisplayWidth := 12;
            vlQry.FieldByName('NOMBRE').DisplayWidth := 43;
            vlQry.FieldByName('FH_VOBO').DisplayWidth := 28;

            sgVobosAnalistas.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
        end
        else
        Begin
           sgVobosAnalistas.Clear('NO HAY REGISTROS'#30'>C');
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrAnalista.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Acreditado.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;


      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);


      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrAnalista.FormDestroy(Sender: TObject);
begin
      Objeto.Acreditado.ID_ACREDITADO.Control:=nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.ID_CONTRATO.Control:=nil;      

end;

procedure TWCrAnalista.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWCrAnalista.InterForma1DespuesShow(Sender: TObject);
begin
   IF Objeto.ID_CONTRATO.AsString <> CNULL then
   Begin
      MuestraVobosAnalista(Objeto.ID_CONTRATO.AsString);
      Objeto.FindKey([ sgVobosAnalistas.CellStr['ID_CONTRATO',sgVobosAnalistas.SG.Row],
                       sgVobosAnalistas.CellStr['ID_ACCIONISTA',sgVobosAnalistas.SG.Row]]);
      MuestraHints;
   end;
end;


procedure TWCrAnalista.MuestraHints;
begin
   edNOMBRE_ACREDITADO.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACREDITADO.ShowHint := True;
end;

end.
