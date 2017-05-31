// Sistema         : Clase de MGarCtoPPERD
// Fecha de Inicio : 06/03/2015
// Función forma   : Clase de MGarCtoPPERD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : ROUY4095 ABR 2015
// Comentarios     :
Unit IntCrLiGPPH;        

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntSGCtrl,
IntParamCre,
IntCRBCHLGPP //Bitácora de Cambios Histórico Líneas Garantía Primeras Pérdidas
;

Type
 TCrLiGPPH= class;

  TWCrLiGPPH=Class(TForm)
    InterForma1             : TInterForma;
    edID_SOLICITUD: TEdit;
    Label1: TLabel;
    shp4: TShape;
    Label2: TLabel;
    Shape6: TShape;
    Label9: TLabel;
    Shape4: TShape;
    Label6: TLabel;
    Shape7: TShape;
    Label8: TLabel;
    Shape9: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    sgcDATA: TSGCtrl;
    btEliminar: TBitBtn;
    btContrato: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edID_CONTRATO: TInterEdit;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    Label5: TLabel;
    edPeriodo: TEdit;
    btnBitCambios: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btContratoClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btEliminarClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure btnBitCambiosClick(Sender: TObject);
    private
    { Private declarations }
       Procedure InsertaDato;
       Procedure MuestraDatos;
       Function  CadenaSql : String;

    public
    { Public declarations } 
    Objeto : TCrLiGPPH;
end; 
 TCrLiGPPH= class(TInterFrame) 
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public

        vgIdSolicitud : String;
        vgPeriodo     : String;
        { Public declarations }
        //CAMPO1                   : TInterCampo;
        ID_SOLICITUD   : TInterCampo;
        PERIODO        : TInterCampo;
        ID_CONTRATO    : TInterCampo;
        SIT_GAR_CTO    : TInterCampo;
        F_ALTA         : TInterCampo;
        CVE_USU_ALTA   : TInterCampo;

        ParamCre       : TParamCre;
        BCHLGPP        : TCRBCHLGPP;

        function BuscaContrato : string;

//        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
//        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrLiGPPH.Create( AOwner : TComponent ); 
begin Inherited;
      //CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
      //          CAMPO1.Caption:='Campo1';
      //          CAMPO1.Parametro:='CAMPO1';
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Folio de solicitud de garantía';
      PERIODO :=CreaCampo('PERIODO',ftFloat,tsNinguno,tsNinguno,True);
      PERIODO.Caption:='Periodo de solicitud de garantía';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Folio de contrato';
      SIT_GAR_CTO :=CreaCampo('SIT_GAR_CTO',ftString,tsNinguno,tsNinguno,True);
      SIT_GAR_CTO.Caption:='Situación';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de usuario de alta';


      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'InTCrLiGPPH.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrLiGPPH.Destroy;
begin inherited;
end;


function TCrLiGPPH.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLiGPPH;
begin
   W:=TWCrLiGPPH.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

{
Function TCrLiGPPH.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMgarcto.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;
}

{
function TCrLiGPPH.Reporte:Boolean;
begin //Execute_Reporte();
end;
}

(***********************************************FORMA MGarCtoPPERD********************)
(*                                                                              *)
(*  FORMA DE MGarCtoPPERD                                                            *)
(*                                                                              *)
(***********************************************FORMA MGarCtoPPERD********************)

procedure TWCrLiGPPH.FormShow(Sender: TObject);
begin
//      Objeto.CAMPO1.Control:=edCAMPO1;
   InterForma1.BtnPreview.Visible := False;
   InterForma1.BtnImprimir.Visible := False;
   InterForma1.BtnAyuda.Visible := False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control     := edID_SOLICITUD;
      PERIODO.Control          := edPERIODO;
      ID_CONTRATO.Control      := edID_CONTRATO;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;

      edID_SOLICITUD.Text      := vgIdSolicitud;
      edPERIODO.Text           := vgPeriodo;
   End;
end;

procedure TWCrLiGPPH.FormDestroy(Sender: TObject);
begin
      //Objeto.CAMPO1.Control:=nil;
   //Objeto
   With Objeto Do Begin
      ID_SOLICITUD.Control := Nil;
      PERIODO.Control      := Nil;
      ID_CONTRATO.Control  := Nil;
      F_ALTA.Control       := Nil;
      CVE_USU_ALTA.Control := Nil;
   end;
end;

procedure TWCrLiGPPH.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrLiGPPH.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrLiGPPH.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMGarCtoPPerd.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrLiGPPH.btContratoClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRLIGPPH_AGRLI',True,True) then
   Begin
      Objeto.ID_CONTRATO.AsString := Objeto.BuscaContrato;
      Objeto.ID_SOLICITUD.GetFromControl;
      Objeto.PERIODO.GetFromControl;
      if not Objeto.ID_CONTRATO.IsNull then
          InsertaDato;
      //  InterForma1.NextTab(btContrato);
   end;
end;


Procedure TWCrLiGPPH.InsertaDato;
Var
   STPInserta   : TStoredProc;
   vlError, sSQL, vlCve : String;
   qyQuery : TQuery;
Begin
   sSQL:='SELECT ID_SOLICITUD, PERIODO, ID_CONTRATO FROM CR_GA_GAR_CTO_PP_HIS '+
         ' WHERE ID_SOLICITUD='+ Objeto.ID_SOLICITUD.AsSQL +
         '   AND PERIODO='+  Objeto.PERIODO.AsSQL +
         '   AND ID_CONTRATO='+  Objeto.ID_CONTRATO.AsSQL;
   GetSQLStr(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_CONTRATO',vlCve,False);
   If (vlCve = '' ) Then Begin
      STPInserta := TStoredProc.Create(Self);
      Try
         With STPInserta Do Begin
            STPInserta.DatabaseName:= Objeto.Apli.DatabaseName;
            STPInserta.SessionName:= Objeto.Apli.SessionName;
            STPInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_INSERTA_GARCTO_HISTO';
            Params.Clear;
            Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
            Params.CreateParam(ftFloat,'PE_PERIODO',ptInput);
            Params.CreateParam(ftFloat,'PE_ID_CONTRATO',ptInput);
            Params.CreateParam(ftString,'PE_SIT_GAR_CTO',ptInput);
            Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
            Params.CreateParam(ftString,'PE_INSERTA',ptInput);
            Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
            ParamByName('PE_PERIODO').AsFloat      := Objeto.PERIODO.AsFloat;
            ParamByName('PE_ID_CONTRATO').AsFloat  := Objeto.ID_CONTRATO.AsFloat;
            ParamByName('PE_SIT_GAR_CTO').AsString := 'AC';
            ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.SysDateTime;
            ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
            ParamByName('PE_INSERTA').AsString := 'AC';
            Prepare;
            ExecProc;

            If (STPInserta.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
               ShowMessage( 'PROBLEMAS AL OBTENER INSERTAR DATOS: '+ STPInserta.ParamByName('PS_RESULTADO').AsString +
                          ' : '+  STPInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;
         End;
      Finally
         STPInserta.Free;
      End;
      MuestraDatos;
   End Else Begin
      ShowMessage('La relación Garantía - Contrato ya existe');
   End;
End;

procedure TWCrLiGPPH.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.ID_SOLICITUD.GetFromControl;
   Objeto.PERIODO.GetFromControl;
   Objeto.ID_CONTRATO.GetFromControl;
   MuestraDatos;
end;


// RUCJ4248: Se genero la función para no depender de la clase de contrato
function TCrLiGPPH.BuscaContrato: string;
var
  strResultado : string;
  T            : TInterFindit;
begin
  strResultado := '';
      T := CreaBuscador('ICrCto.it','F,F');
      try
          if T.Execute then
          Begin
             strResultado := T.DameCampo(0);
          end;
      finally
        T.Free;
      end;
   Result := strResultado;
end;

procedure TWCrLiGPPH.btEliminarClick(Sender: TObject);
Var
   STPInserta   : TStoredProc;
   vlError, sSQL : String;
   qyQuery : TQuery;
Begin
   If Objeto.ValidaAccesoEsp('TCRLIGPPH_ELILI',True,True) then
   Begin
       Objeto.ID_SOLICITUD.GetFromControl;
       Objeto.PERIODO.GetFromControl;
       Objeto.ID_CONTRATO.GetFromControl;
       If Objeto.ID_CONTRATO.AsFloat <> 0 Then Begin
          If MessageDlg('¿Está seguro de eliminar el registro?',
             mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
             STPInserta := TStoredProc.Create(Self);
             Try
                With STPInserta Do Begin
                   STPInserta.DatabaseName:= Objeto.Apli.DatabaseName;
                   STPInserta.SessionName:= Objeto.Apli.SessionName;
                   STPInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_INSERTA_GARCTO_HISTO';
                   Params.Clear;
                   Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
                   Params.CreateParam(ftFloat,'PE_PERIODO',ptInput);
                   Params.CreateParam(ftFloat,'PE_ID_CONTRATO',ptInput);
                   Params.CreateParam(ftString,'PE_SIT_GAR_CTO',ptInput);
                   Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
                   Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
                   Params.CreateParam(ftString,'PE_INSERTA',ptInput);
                   Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
                   Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

                   ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
                   ParamByName('PE_PERIODO').AsFloat      := Objeto.PERIODO.AsFloat;
                   ParamByName('PE_ID_CONTRATO').AsFloat  := Objeto.ID_CONTRATO.AsFloat;
                   ParamByName('PE_SIT_GAR_CTO').AsString := 'AC';
                   ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.SysDateTime;
                   ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
                   ParamByName('PE_INSERTA').AsString := 'IN';
                   ExecProc;

                   If (STPInserta.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
                      vlError := 'PROBLEMAS AL OBTENER INSERTAR DATOS: '+ STPInserta.ParamByName('PS_RESULTADO').AsString +
                                 ' : '+  STPInserta.ParamByName('PS_TX_RESULTADO').AsString;
                   End;
                End;
             Finally
                STPInserta.Free;
             End;
             MuestraDatos;
          End;
       End;
   end;
End;

Procedure TWCrLiGPPH.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_CONTRATO').DisplayLabel := 'ID_CONTRATO' + #30 +'>C';
            vlQry.FieldByName('FOL_CONTRATO').DisplayLabel := 'FOL_CONTRATO' + #30 +'>C';
            vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayLabel := 'CVE_PRODUCTO_CRE' + #30 +'>C';
            vlQry.FieldByName('DESC_C_PRODUCTO').DisplayLabel := 'DESC_C_PRODUCTO' + #30 +'>C';
            vlQry.FieldByName('F_VENCIMIENTO').DisplayLabel := 'F_VENCIMIENTO' + #30 +'>C';
            vlQry.FieldByName('SIT_LINEA').DisplayLabel := 'SIT_LINEA' + #30 +'>C';
            vlQry.FieldByName('F_ALTA').Visible := False;
            vlQry.FieldByName('CVE_USU_ALTA').Visible := False;

            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 12;
            vlQry.FieldByName('FOL_CONTRATO').DisplayWidth := 8;
            vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayWidth := 12;
            vlQry.FieldByName('DESC_C_PRODUCTO').DisplayWidth := 28;
            vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth := 12;
            vlQry.FieldByName('SIT_LINEA').DisplayWidth := 5;

            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);

            //Obliga a sincronizar el registro del grid con el campo
            sgcDATA.GotoLast; //para corregir defecto de MoveRow, que no se ejecuta la 1a vez después de Agregar /Eliminar
            edF_ALTA.Text:= sgcDATA.CellStr['F_ALTA',sgcDATA.SG.Row];
            edCVE_USU_ALTA.Text:= sgcDATA.CellStr['CVE_USU_ALTA',sgcDATA.SG.Row];
            edID_CONTRATO.Text:= sgcDATA.CellStr['ID_CONTRATO',sgcDATA.SG.Row];
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
end;

Function TWCrLiGPPH.CadenaSql : String;
var
   vlsql : String;
Begin
   If Objeto.ID_SOLICITUD.AsInteger <> 0 Then Begin
      vlSql:='SELECT CR_GA_GAR_CTO_PP_HIS.ID_CONTRATO, '+
             '       CR_CONTRATO.FOL_CONTRATO, '+
             '       CR_CONTRATO.CVE_PRODUCTO_CRE, '+
             '       CR_PRODUCTO.DESC_C_PRODUCTO, '+
             '       CR_CONTRATO.F_VENCIMIENTO, '+
             '       CR_CONTRATO.SIT_LINEA, '+
             '       CR_GA_GAR_CTO_PP_HIS.F_ALTA, '+
             '       CR_GA_GAR_CTO_PP_HIS.CVE_USU_ALTA '+
             '  FROM CR_GA_GAR_CTO_PP_HIS, CR_CONTRATO, CR_PRODUCTO '+
             ' WHERE CR_GA_GAR_CTO_PP_HIS.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
             '   AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
             '   AND CR_GA_GAR_CTO_PP_HIS.ID_SOLICITUD ='+ Objeto.ID_SOLICITUD.AsString +
             '   AND CR_GA_GAR_CTO_PP_HIS.PERIODO ='+ Objeto.PERIODO.AsString +
             ' ORDER BY CR_CONTRATO.ID_CONTRATO';
   End;
   CadenaSql := vlSql;
end;


procedure TWCrLiGPPH.InterForma1Buscar(Sender: TObject);
begin
  Self.Objeto.Busca;
end;

procedure TWCrLiGPPH.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   edF_ALTA.Text:= sgcDATA.CellStr['F_ALTA',ToIndex];
   edCVE_USU_ALTA.Text:= sgcDATA.CellStr['CVE_USU_ALTA',ToIndex];
   Objeto.ID_CONTRATO.AsString := sgcDATA.CellStr['ID_CONTRATO',ToIndex];
   edID_CONTRATO.Text:= sgcDATA.CellStr['ID_CONTRATO',ToIndex];
end;

procedure TWCrLiGPPH.btnBitCambiosClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRLIGPPH_BITCA',True,True) then
   Begin
     if (Objeto.ID_SOLICITUD.AsString <> '') then
     Begin
         {$WARNINGS OFF}
         Objeto.BCHLGPP := TCRBCHLGPP.Create(Self);
         {$WARNINGS ON}
         try
            Objeto.BCHLGPP.Apli:=Objeto.Apli;
            Objeto.BCHLGPP.ParamCre:=Objeto.ParamCre;
            Objeto.BCHLGPP.vgIdSolicitud:= Objeto.ID_SOLICITUD.AsString;
            Objeto.BCHLGPP.vgPeriodo:= Objeto.PERIODO.AsString;
            Objeto.BCHLGPP.Catalogo;
         finally
               if Objeto.BCHLGPP <> nil then
                  Objeto.BCHLGPP.Free;
               //end if
         end;
     end
     else ShowMessage('No existe registro Activo');
   end;
end;

end.


