// Sistema         : Clase de CR_REL_CRED_CHEQ
// Fecha de Inicio : 28/04/2005
// Función forma   : Clase de CR_REL_CRED_CHEQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :

Unit IntCrDocIMPr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

//UNIDADES ADICONALES
IntParamCre,
IntGenCre,
Grids, Aligrid, Menus,
IntSGCtrl
;

Type
 TCrDocIMPr= class;

  TWCrDocIMPr=Class(TForm)
    InterForma1             : TInterForma;
    lbCUENTA_BANCO : TLabel;
    NOM_PROVEEDOR: TEdit;
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
    Label23: TLabel;
    Label4: TLabel;
    MErrores: TMemo;
    sgcDATOS: TSGCtrl;
    Label1: TLabel;
    Label3: TLabel;
    btAUTORIZA: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    private
    { Private declarations }
       Procedure MuestraDatos;
       Procedure ActSituacion(pIdCesion, pIdDocto, pNewSit : String );
    public
    { Public declarations }
    Objeto : TCrDocIMPr;
end;
 TCrDocIMPr= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_PROVEEDOR             : TInterCampo;
        NOM_PROVEEDOR            : TInterCampo;
        SITUACION                : TInterCampo;


        //Clases Adicionales
        ParamCre                 : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrDocIMPr.Create( AOwner : TComponent );
begin Inherited;
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftFloat,tsNinguno,tsNinguno,True);
      NOM_PROVEEDOR :=CreaCampo('NOM_PROVEEDOR',ftString,tsNinguno,tsNinguno,True);
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,True);

      UseQuery := True;
      HelpFile := 'IntCrDocIMPr.Hlp';

end;

Destructor TCrDocIMPr.Destroy;
begin
   inherited;
end;


function TCrDocIMPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrDocIMPr;
begin
   W:=TWCrDocIMPr.Create(Self);
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

{---------------------------------------------------------------------------------------
                        Actualiza modificaciones
----------------------------------------------------------------------------------------}
Procedure TWCrDocIMPr.ActSituacion(pIdCesion, pIdDocto, pNewSit : String);
var StpActSit  : TStoredProc;
    vlMsgErr         : String;
begin
    StpActSit := TStoredProc.Create(Self);
    try
       with StpActSit do
       begin
          StpActSit.DatabaseName:= Objeto.Apli.DatabaseName;
          StpActSit.SessionName:= Objeto.Apli.SessionName;
          StpActSit.StoredProcName:='PKGCRCREDITO.STPMODFSITDOCTO';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
          Params.CreateParam(ftInteger,'PEIDDOCTO',ptInput);
          Params.CreateParam(ftString,'PENEWSIT',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('PEIDCESION').AsString := pIdCesion;
          ParamByName('PEIDDOCTO').AsString := pIdDocto;
          ParamByName('PENEWSIT').AsString := pNewSit;
          ParamByName('PECVEUSUARIO').AsString := Objeto.Apli.Usuario;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             ShowMessage(ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString);
             MErrores.Lines.Add(ParamByName('psRESULTADO').AsString + ' : ' + ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpActSit.Free;
    end;
end;

procedure TWCrDocIMPr.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.NOM_PROVEEDOR.Control:=NOM_PROVEEDOR;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrDocIMPr.FormDestroy(Sender: TObject);
begin
      Objeto.NOM_PROVEEDOR.Control:=nil;
end;

procedure TWCrDocIMPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrDocIMPr.MuestraDatos;
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql := ' SELECT CE.ID_CESION, P.NOMBRE, CD.ID_DOCUMENTO, CD.SIT_DOCUMENTO ' +
              ' FROM CR_CESION CE,  CR_DOCUMENTO CD, PERSONA P ' +
              ' WHERE CE.SIT_CESION NOT IN ( ''CA'' ) ' +
              '   AND CD.SIT_DOCUMENTO IN ( ''IM'', ''IT'') ' +
              '   AND CE.ID_PROVEEDOR = ' + Objeto.ID_PROVEEDOR.AsString +
              '   AND CD.ID_CESION = CE.ID_CESION ' +
              '   AND CE.ID_EMISOR = P.ID_PERSONA'+
              ' ORDER BY CE.ID_CESION, CD.ID_DOCUMENTO' ;

     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran

            vlQry.FieldByName('ID_CESION').DisplayWidth := 10;
            vlQry.FieldByName('NOMBRE').DisplayWidth := 36;
            vlQry.FieldByName('ID_DOCUMENTO').DisplayWidth := 20;
            vlQry.FieldByName('SIT_DOCUMENTO').DisplayWidth := 3;

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

procedure TWCrDocIMPr.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TWCrDocIMPr.btAUTORIZAClick(Sender: TObject);
Var nRow : Integer;
    vlNewSit : String;
begin
    Merrores.Clear;
    if MessageDlg('¿Esta seguro de modificar las situaciones?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then BEGIN
      AddLine(MErrores,'====================================================');
      AddLine(MErrores,'***         INICIA PROCESO DE AUTORIZACION       ***');
      AddLine(MErrores,'Hora inicio:' + TimeToStr(Time));
      For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do BEGIN
         IF sgcDATOS.CellStr['SIT_DOCUMENTO',nRow] = 'IM' THEN
            vlNewSit:= 'IT'
         ELSE
            vlNewSit:= 'IM';
         //END IF
         ActSituacion(sgcDATOS.CellStr['ID_CESION',nRow], sgcDATOS.CellStr['ID_DOCUMENTO',nRow],vlNewSit);
      END;
      AddLine(MErrores,'Hora fin:' + TimeToStr(Time));
      AddLine(MErrores,'***        TERMINA PROCESO DE AUTORIZACION       ***');
      AddLine(MErrores,'====================================================');
      MuestraDatos;
    END;
end;

end.
