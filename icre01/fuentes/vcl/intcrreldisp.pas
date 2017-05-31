// Sistema         : Clase de CrRelDisp
// Fecha de Inicio : 09/10/2013
// Función forma   : Clase de CrRelDisp
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrRelDisp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
//UNIDADES ADICIONALES

  IntParamCre,
  IntGenCre,
  IntCrCredito
;

Type
 TCrRelDisp= class;

  TWCrRelDisp=Class(TForm)
    InterForma1             : TInterForma;
    lbNoSolDisp: TLabel;
    edNoSolDisp: TEdit;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edTITULAR: TEdit;
    ilCREDITO: TInterLinkit;
    bbRelacionar: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure bbRelacionarClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrreldisp;
end;
 TCrreldisp= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;

        vgIdSolWeb      : Integer;
        vgIdContratoWeb : Integer;
        vgCveMedio      : String;
        vgImpCredito    : Double;
        vgBConsultaDoc  : String;

        ID_SOLICITUD             : TInterCampo;
        ID_CREDITO               : TInterCampo;

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


constructor TCrreldisp.Create( AOwner : TComponent );
begin Inherited;
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftInteger,tsNinguno,tsNinguno,False);
                ID_SOLICITUD.Caption:='No. Solicitud';

      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption:='Id. Crédito';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource := Self;

      StpName  := '';
      UseQuery := False;
      HelpFile := 'IntCrreldisp.Hlp';
      ShowMenuReporte:=False;
end;

Destructor TCrreldisp.Destroy;
begin
  If Credito <> Nil then
     Credito.Free;
  inherited;
end;


function TCrreldisp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrreldisp;
begin
   W:=TWCrreldisp.Create(Self);
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


Function TCrreldisp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrreldi.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrreldisp.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrRelDisp********************)
(*                                                                              *)
(*  FORMA DE CrRelDisp                                                            *)
(*                                                                              *)
(***********************************************FORMA CrRelDisp********************)

procedure TWCrreldisp.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Objeto.ID_CREDITO.Control:=edID_CREDITO;
    Objeto.Credito.ID_CREDITO.Control:= edID_CREDITO;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edTITULAR;
    Objeto.Credito.GetParams(Objeto);

    Objeto.ID_SOLICITUD.Control := edNoSolDisp;
    Objeto.ID_SOLICITUD.AsInteger := Objeto.vgIdSolWeb;

    If Objeto.vgBConsultaDoc <> 'V' then
       lbID_CREDITO.Caption := 'Disposición'
    else
       lbID_CREDITO.Caption := 'Cesión';
end;

procedure TWCrreldisp.FormDestroy(Sender: TObject);
begin
    Objeto.ID_CREDITO.Control:=nil;
    Objeto.ID_SOLICITUD.Control := nil;

    Objeto.Credito.ID_CREDITO.Control:=nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:=nil;
end;

procedure TWCrreldisp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelDisp.btCREDITOClick(Sender: TObject);
Var
  T1:TInterFindit;
begin
//   if Objeto.ValidaAccesoEsp('TCRMONDISP_DISP',True,True) then
//   begin
        If Objeto.vgBConsultaDoc <> 'V' then
        begin
           Objeto.Credito.ShowAll:= True;
           Objeto.Credito.FilterString := '(CR_CREDITO.ID_SOLICITUD IS NULL OR CR_CREDITO.ID_SOLICITUD = 0) ' +
                                          ' AND CR_CREDITO.SIT_CREDITO = ''NA'' ' +
                                          ' AND CR_CREDITO.IMP_CREDITO = ' + FloatToStr(Objeto.vgImpCredito) +
                                          ' AND CR_CREDITO.ID_CONTRATO = ' + IntToStr(Objeto.vgIdContratoWeb);
           Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString;

           if Objeto.Credito.Busca then
              InterForma1.NextTab(edID_CREDITO);
        end
        else
        begin
          T1 := Objeto.CreaBuscador('ICRCESCRE.IT', 'F');
          T1.WhereString := '(CRE.ID_SOLICITUD IS NULL OR CRE.ID_SOLICITUD = 0) ' +
                            ' AND CR_CESION.SIT_CESION = ''NA'' ' +
                            ' AND CR_CESION.IMP_CESION = ' + FloatToStr(Objeto.vgImpCredito) +
                            ' AND CRE.ID_CONTRATO = ' + IntToStr(Objeto.vgIdContratoWeb);
          Try
            if Active then
            begin
               T1.Param(0,objeto.ID_CREDITO.AsString);
            end;
            if T1.Execute then
            Begin
               Objeto.ID_CREDITO.AsString := T1.DameCampo(0);
               Objeto.Credito.FilterString := '';
               Objeto.Credito.BuscaWhereString :=  '';
               Objeto.Credito.FindKey([T1.DameCampo(0)]);
            end;
          finally
            T1.Free;
          end;
        end;
//   end;

end;

procedure TWCrRelDisp.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
   Begin
      InterForma1.NextTab(edID_CREDITO);
   end;

end;

procedure TWCrRelDisp.bbRelacionarClick(Sender: TObject);
var
  vlsql :String;
begin
  Objeto.ID_CREDITO.GetFromControl;
  If Objeto.ID_CREDITO.IsNull then
     ShowMessage('Favor de indicar una disposición.')
  else
  if MessageDlg('¿Está seguro de relacionar la solicitud ' + Objeto.ID_SOLICITUD.AsString +
                ' con la disposición ' + Objeto.Credito.ID_CREDITO.AsString + '?',
                mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    If not Objeto.Apli.DataBase.InTransaction Then
       Objeto.Apli.DataBase.StartTransaction;
    try
        vlsql := ' UPDATE CR_CREDITO ' +
                 ' SET ID_SOLICITUD = ' + Objeto.ID_SOLICITUD.AsString + ', ' +
                 '     CVE_MEDIO    = ''' + Objeto.vgCveMedio + '''' +
                 ' WHERE ID_CREDITO = ' + Objeto.Credito.ID_CREDITO.AsString + '';
        if not (RunSQL(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False)) then
        begin
           ShowMessage('No fue posible realizar la asociación.');
           If Objeto.Apli.DataBase.InTransaction Then
              Objeto.Apli.DataBase.Rollback;
        end
        else
        begin
           If Objeto.Apli.DataBase.InTransaction Then
              Objeto.Apli.DataBase.commit;
           ShowMessage('La asociación se realizó con éxito.');
        end;
    except
        If Objeto.Apli.DataBase.InTransaction Then
           Objeto.Apli.DataBase.Rollback;
        ShowMessage('Ocurrió un error, no fue posible realizar la asociación. Informe a Sistemas.');
    end;
    InterForma1.Salir;
  end;

end;


end.
