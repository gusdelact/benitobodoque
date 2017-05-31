// Sistema         : Clase de CR_PRODUCTO_GPO
// Fecha de Inicio : 08/10/2004
// Función forma   : Clase de CR_PRODUCTO_GPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProdGpo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, CheckLst;

Type                           
 TMProdGpo= class;

  TwMProdGpo=Class(TForm)
    InterForma1             : TInterForma;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    lbClave: TLabel;
    edDESC_C_PROD_GPO: TEdit;
    lbDescCorta: TLabel;
    edDESC_L_PROD_GPO: TEdit;
    lbDescLarga: TLabel;
    cbxB_APLICA_FONDEO: TCheckBox;
    CL_EntDesc: TCheckListBox;
    lbEntidades: TLabel;
    lbDescontadoras: TLabel;
    Lidentdesc: TListBox;
    cbxB_APLICA_CAT: TCheckBox;
    lbTasaFija: TLabel;
    lbTasaVariable: TLabel;
    edtTasaFija: TEdit;
    edtTasaVariable: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure edDESC_C_PROD_GPOExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edDESC_L_PROD_GPOExit(Sender: TObject);
    procedure cbxB_APLICA_FONDEOExit(Sender: TObject);

    procedure llena_EntDesc(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure cbxB_APLICA_CATExit(Sender: TObject);
    procedure edtTasaFijaExit(Sender: TObject);
    procedure edtTasaVariableExit(Sender: TObject); //HERJA

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMProdGpo;
    end;

 TMProdGpo= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_PRODUCTO_GPO  : TInterCampo;
        DESC_C_PROD_GPO   : TInterCampo;
        DESC_L_PROD_GPO   : TInterCampo;
        B_APLICA_FONDEO   : TInterCampo;
        //</SST250711> CAMPOS NUEVOS PARA CAT
        B_APLICA_CAT      : TInterCampo;
        DESC_CAT_TFIJA    : TInterCampo;
        DESC_CAT_TVARIABLE: TInterCampo;
        //<SST/>
        ParamCre          : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        procedure    StpEntidadDesc(PGpoProd, PEntDesc, PTmov : String);

        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMProdGpo.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_PRODUCTO_GPO:= CreaCampo('CVE_PRODUCTO_GPO', ftString, tsNinguno, tsNinguno, True);
      CVE_PRODUCTO_GPO.Caption:= 'Clave de Contrato';
      CVE_PRODUCTO_GPO.NoCompare:= False;
  DESC_C_PROD_GPO:= CreaCampo('DESC_C_PROD_GPO', ftString, tsNinguno, tsNinguno, True);
      DESC_C_PROD_GPO.Caption:= 'Descripción de Contrato';
      DESC_C_PROD_GPO.NoCompare:= True;
  DESC_L_PROD_GPO:= CreaCampo('DESC_L_PROD_GPO', ftString, tsNinguno, tsNinguno, True);
      DESC_L_PROD_GPO.Caption:= 'Descripción de Contrato';
      DESC_L_PROD_GPO.NoCompare:= True;
  B_APLICA_FONDEO:= CreaCampo('B_APLICA_FONDEO', ftString, tsNinguno, tsNinguno, True);
      B_APLICA_FONDEO.Caption:= 'Aplica Fondeo';
      B_APLICA_FONDEO.NoCompare:= True;
  //</SST250711> CAMPOS NUEVOS PARA CAT
  B_APLICA_CAT:= CreaCampo('B_APLICA_CAT', ftString, tsNinguno, tsNinguno, True);
  B_APLICA_CAT.Caption:= 'Aplica CAT';
  B_APLICA_CAT.NoCompare:= True;
  DESC_CAT_TFIJA:= CreaCampo('DESC_CAT_TFIJA', ftString, tsNinguno, tsNinguno, True);
  DESC_CAT_TFIJA.Caption:= 'Leyenda CAT Tasa Fija';
  DESC_CAT_TFIJA.NoCompare:= True;
  DESC_CAT_TVARIABLE:= CreaCampo('DESC_CAT_TVARIABLE', ftString, tsNinguno, tsNinguno, True);
  DESC_CAT_TVARIABLE.Caption:= 'Leyenda CAT Tasa Variable';
  DESC_CAT_TVARIABLE.NoCompare:= True;
  //<SST250711/>
  FKeyFields.Add('CVE_PRODUCTO_GPO');
  TableName:= 'CR_PRODUCTO_GPO';
  UseQuery:= True;
  HelpFile:= 'IntMProdGpo.Hlp';
  ShowMenuReporte:=True;
end;


Destructor TMProdGpo.Destroy;
begin
   Inherited;
end;

function TMProdGpo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMProdGpo;
begin
   W:=TWMProdGpo.Create(Self);
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

Function TMProdGpo.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMProdGpo.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_PRODUCTO_GPO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMProdGpo.Reporte:Boolean;
begin
   Result := False;
end;

procedure  TMProdGpo.StpEntidadDesc(PGpoProd, PEntDesc, PTmov : String);
var sptEntDesc  : TStoredProc;
    vlResultado : Boolean;
begin
   vlResultado := True;
   try
     sptEntDesc := TStoredProc.Create(Self);
     with sptEntDesc do
     begin
        sptEntDesc.DatabaseName:= Apli.DatabaseName;
        sptEntDesc.SessionName:= Apli.SessionName;
        sptEntDesc.StoredProcName:= 'PKGCRREDESCTO.STPRELGPO_ENT';
        Params.Clear;
        Params.CreateParam(ftString,'PEGPO_PROD',ptInput);
        Params.CreateParam(ftString,'PEENT_DES',ptInput);
        Params.CreateParam(ftString,'PET_MOV',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        //
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEGPO_PROD').AsString := PGpoProd;
        ParamByName('PEENT_DES').AsString := PEntDesc;
        ParamByName('PET_MOV').AsString := PTmov;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;
        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('PSTXRESULTADO').AsString );
        end;
     end;
   finally
     sptEntDesc.Free;
   end;
end;


(***********************************************FORMA CR_PRODUCTO_GPO********************)
(*                                                                              *)
(*  FORMA DE CR_PRODUCTO_GPO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PRODUCTO_GPO********************)

procedure TwMProdGpo.llena_EntDesc(Sender: TObject); //HERJA
var sSQL: String;
    qyQuery: TQuery;
Begin
   CL_EntDesc.Enabled:=true;
   CL_EntDesc.Color := clWindow;
   CL_EntDesc.Clear;
   Lidentdesc.Clear;
   sSQL:='SELECT CVE_FND_ENT_DES, DESC_ENT_DES FROM CR_FND_ENT_DES ORDER BY CVE_FND_ENT_DES ';

   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then
   Begin
      while qyQuery.Eof = false do
      begin
         CL_EntDesc.Items.Add(qyQuery.FieldByName('DESC_ENT_DES').AsString);
         Lidentdesc.Items.Add(qyQuery.FieldByName('CVE_FND_ENT_DES').AsString);
         qyQuery.Next;
      end;
      qyQuery.close;
   End;

   //MARCA LAS CASILLAS EN CASO DE QUE SE ENCUENTREN EN LA TABLA
   if Trim(edCVE_PRODUCTO_GPO.Text)<>'' then
   begin
      sSQL:='SELECT * FROM CR_PROD_FND_ENT ' +
            ' WHERE CVE_PRODUCTO_GPO = '''+edCVE_PRODUCTO_GPO.Text+'''';

     qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
     If qyQuery <> Nil Then
     Begin
        while qyQuery.Eof = false do
        begin
           if Lidentdesc.Items.IndexOf(qyQuery.FieldByName('CVE_FND_ENT_DES').AsString ) <> -1 then
              CL_EntDesc.Checked[Lidentdesc.Items.IndexOf(qyQuery.FieldByName('CVE_FND_ENT_DES').AsString)] := true;
           qyQuery.Next;              
        end;
        qyQuery.close;        
     End;
   end;
end;

procedure TwMProdGpo.FormShow(Sender: TObject);
begin
  lbDempresa.Caption:= Objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption:= Objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption:= Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption:= Objeto.ParamCre.PERFIL.AsString;
  with Objeto do
  begin
    CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
    DESC_C_PROD_GPO.Control:= edDESC_C_PROD_GPO;
    DESC_L_PROD_GPO.Control:= edDESC_L_PROD_GPO;
    B_APLICA_FONDEO.Control:= cbxB_APLICA_FONDEO;
    //</SST250711> CAMPOS NUEVOS PARA CAT
    B_APLICA_CAT.Control:= cbxB_APLICA_CAT;
    DESC_CAT_TFIJA.Control:= edtTasaFija;
    DESC_CAT_TVARIABLE.Control:= edtTasaVariable;
    //<SST/>
    InterForma1.MsgPanel:= PnlMsg;
  end;
  CL_EntDesc.Clear;
end;

procedure TwMProdGpo.FormDestroy(Sender: TObject);
begin
  with Objeto do
  begin
    CVE_PRODUCTO_GPO.Control:= nil;
    DESC_C_PROD_GPO.Control:= nil;
    DESC_L_PROD_GPO.Control:= nil;
    B_APLICA_FONDEO.Control:= nil;
    //</SST250711> CAMPOS NUEVOS PARA CAT
    B_APLICA_CAT.Control:= nil;
    DESC_CAT_TFIJA.Control:= nil;
    DESC_CAT_TVARIABLE.Control:= nil;
    //<SST/>
    InterForma1.MsgPanel:= nil;
  end;
end;

procedure TwMProdGpo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProdGpo.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
   llena_EntDesc(Sender); //HERJA
   CL_EntDesc.Color:= clBtnFace;
   CL_EntDesc.Enabled:=false;
end;

procedure TwMProdGpo.edCVE_PRODUCTO_GPOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveGar  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_PRODUCTO_GPO.GetFromControl;
      If Objeto.CVE_PRODUCTO_GPO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del grupo de producto';
      End Else Begin
         If InterForma1.IsNewData Then Begin
             vlSql := ' SELECT * FROM CR_PRODUCTO_GPO ' +
                      ' WHERE CVE_PRODUCTO_GPO ='+ Objeto.CVE_PRODUCTO_GPO.AsSQL;
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_PRODUCTO_GPO',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del grupo de producto ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProdGpo.edDESC_C_PROD_GPOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_C_PROD_GPO,True,CNULL,True);
end;

procedure TwMProdGpo.InterForma1DespuesNuevo(Sender: TObject);
begin
   llena_EntDesc(Sender); //HERJA
   edCVE_PRODUCTO_GPO.SetFocus;
end;

procedure TwMProdGpo.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   sSQL:='SELECT DISTINCT CVE_PRODUCTO_GPO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO='+ Objeto.CVE_PRODUCTO_GPO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_PRODUCTO_GPO').AsString = Objeto.CVE_PRODUCTO_GPO.AsString Then Begin
         ShowMessage('Ésta clasificación tiene registros relacionados, no puede ser eliminada');
         Realizado:= False;
      End;
      qyQuery.Free;
   End;
end;

procedure TwMProdGpo.edDESC_L_PROD_GPOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_PROD_GPO,True,CNULL,True);
end;

procedure TwMProdGpo.cbxB_APLICA_FONDEOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_APLICA_FONDEO,True,CNULL,True);
end;

procedure TwMProdGpo.InterForma1DespuesModificar(Sender: TObject);
begin
   llena_EntDesc(Sender); //HERJA
end;

procedure TwMProdGpo.InterForma1DespuesAceptar(Sender: TObject);
var i:word;
begin
   Objeto.StpEntidadDesc(edCVE_PRODUCTO_GPO.Text, ' ', 'LIM');
   for i:=0 to CL_EntDesc.Items.Count-1 do
   begin
      if CL_EntDesc.Checked[i]=true then
         Objeto.StpEntidadDesc(edCVE_PRODUCTO_GPO.Text, Lidentdesc.Items.Strings[i], 'INS');
   end;
   CL_EntDesc.Color := clBtnFace;
   CL_EntDesc.Enabled:=false;   
end;

procedure TwMProdGpo.InterForma1DespuesCancelar(Sender: TObject);
begin
   llena_EntDesc(Sender); //HERJA
   CL_EntDesc.Color := clBtnFace;
   CL_EntDesc.Enabled:=false;
end;

procedure TwMProdGpo.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.StpEntidadDesc(edCVE_PRODUCTO_GPO.Text, ' ', 'LIM');
   llena_EntDesc(Sender); //HERJA
   CL_EntDesc.Color := clBtnFace;
   CL_EntDesc.Enabled:=false;
end;

//</SST250711> Valida exit, Campos CAT
procedure TwMProdGpo.cbxB_APLICA_CATExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_APLICA_CAT,True,CNULL,True);
end;

procedure TwMProdGpo.edtTasaFijaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edtTasaFija, True, CNULL, True);
end;

procedure TwMProdGpo.edtTasaVariableExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edtTasaVariable, True, CNULL, True);
end;
//<SST/>
end.
