// Sistema         : Clase de Empresas
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Requisito
// Desarrollo por  : Victor Martinez
// Comentarios     :
unit IntMPers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, IntDtPk;

Const
     fbTMPersonaFisica   = 1;
     fbTMPersonaMoral    = 2;
     fbTMPersonaEmpresa  = 3;
     fbTMPersonaEmpleado = 4;

     // CZR 25-FEB-09
     fbTMProspectoFisica = 5;
     fbTMProspectoMoral  = 6;
type

  TMPersona=class(TInterFrame)
  private
    FRecHumDataBaseName:String;
    RecHumSessionName  :String;
  protected
  public
    ID_Persona  : TInterCampo;
    Nombre      : TInterCampo;
    function    Busca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Function    InternalCatalogo:Boolean; override;
    Function    InternalConsulta:Boolean; override;
    function    Reporte:Boolean; override;
    function    EsClienteAAA : boolean;
    Procedure   SetFilterBy(Filter:Integer); override;
    Procedure   DataBaseChange; override;
    Procedure   BuscaPersona;
  published
    Persona:TInterFrame;
    Procedure DespuesBusca(Sender:TObject);
    function ValidaLocaliza:Boolean; override;
  end;

implementation

Uses IntPers, IntEmpre, IntEmple;

constructor TMPersona.Create( AOwner : TComponent );
begin
  Inherited;
  ID_Persona :=CreaCampo('ID_PERSONA',ftInteger,tsConsulta,tsNinguno,False);
  ID_Persona.Parametro:='PID_PERSONA';
  Nombre     :=CreaCampo('NOMBRE'    ,ftString,tsNinguno,tsConsulta,False);
  Nombre.Parametro:='PNOMBRE';
  FActive := False;
  FKeyFields.Add('ID_PERSONA');
  UseQuery := False;
  StpName:='SPOBTNOMBRE';
  Persona:=nil;
  IsCorp:=True;
end;

Destructor TMPersona.Destroy;
begin
  if Persona<>nil then
     Persona.Free;
  Persona:=nil;
  inherited;
end;

function TMPersona.ValidaLocaliza:Boolean;
var
  ok:Boolean;
begin
  OK:=(Not Nombre.IsNull);
  Case FilterBy of
    fbTMPersonaEmpresa  : if OK then OK:=GetSql('SELECT ID_EMPRESA FROM EMPRESA WHERE ID_EMPRESA='+ID_PERSONA.AsSQL,DataBaseName,SessionName,True);
    fbTMPersonaEmpleado : if OK then OK:=GetSql('SELECT ID_PERSONA FROM EMPLEADO WHERE ID_PERSONA='+ID_PERSONA.AsSQL,DataBaseName,SessionName,True);

    // CZR 25-FEB-09
    //fbTMProspectoFisica : OK:=GetSql('SELECT ID_PROSPECTO ID_PERSONA FROM PR_Prospecto WHERE ID_PROSPECTO='+ID_PERSONA.AsSQL,DataBaseName,SessionName,True); //Luis Hernandez Abr 2013
    //fbTMProspectoMoral  : OK:=GetSql('SELECT ID_PROSPECTO ID_PERSONA FROM PR_Prospecto WHERE ID_PROSPECTO='+ID_PERSONA.AsSQL,DataBaseName,SessionName,True); //Luis Hernandez Abr 2013
    fbTMProspectoFisica : OK:=GetSql('SELECT ID_PROSPECTO ID_PERSONA FROM PLD_PROSPECTO@LCORPOC WHERE ID_PROSPECTO='+ID_PERSONA.AsSQL,DataBaseName,SessionName,True); //Luis Hernandez Abr 2013
    fbTMProspectoMoral  : OK:=GetSql('SELECT ID_PROSPECTO ID_PERSONA FROM PLD_PROSPECTO@LCORPOC WHERE ID_PROSPECTO='+ID_PERSONA.AsSQL,DataBaseName,SessionName,True); //Luis Hernandez Abr 2013
  end;
  Result:=OK;
end;

Procedure TMPersona.DataBaseChange;
begin
  if Persona<>nil then
     Persona.GetParams(Self);
end;

Procedure TMPersona.SetFilterBy(Filter:Integer);
var
   Pa:TComponent;
   I,Nivel:Integer;
begin
  Inherited;
  if Persona<>nil then
     Persona.Free; Persona:=nil;
  Case Filter of
    fbTMPersonaFisica : begin
                          Persona:=TPersona.Create(Self);
                          Persona.GetParams(Self);
                          Persona.FilterBy:=fbTPersonaFisica;
                          Persona.OnDespuesBusca:=DespuesBusca;
                        end;
    fbTMPersonaMoral  : begin
                          Persona:=TPersona.Create(Self);
                          Persona.GetParams(Self);
                          Persona.FilterBy:=fbTPersonaMoral;
                          Persona.OnDespuesBusca:=DespuesBusca;
                        end;
     fbTMPersonaEmpresa : begin
                            Persona:=TEmpresa.Create(Self);
                            Persona.GetParams(Self);
                            Persona.OnDespuesBusca:=DespuesBusca;
                          end;
     fbTMPersonaEmpleado: begin
                            if Persona<>nil then
                               Persona.Free;
                            Persona:=nil;
                          end;

     // CZR 25-FEB-09
     fbTMProspectoFisica : begin
                            Persona := TPersona.Create(Self);
                            Persona.GetParams(Self);
                            Persona.FilterBy := fbTProspectoFisica;
                            Persona.OnDespuesBusca := DespuesBusca;
                            Persona.stpName := 'PKGCORPORATIVO2.CONPROSPECTO';
                            //Persona.stpName := 'PKGCORPORATIVO.CONPROSPECTO'; //Luis Hernandez Abr 2013
                          end;
     fbTMProspectoMoral : begin
                            Persona := TPersona.Create(Self);
                            Persona.GetParams(Self);
                            Persona.FilterBy := fbTProspectoMoral;
                            Persona.OnDespuesBusca := DespuesBusca;
                            Persona.stpName := 'PKGCORPORATIVO2.CONPROSPECTO';
                            //Persona.stpName := 'PKGCORPORATIVO.CONPROSPECTO'; //Luis Hernandez Abr 2013
                          end;

     fbNinguno		:       begin
                            Persona:=TPersona.Create(Self);
                            Persona.GetParams(Self);
                            Persona.OnDespuesBusca:=DespuesBusca;
                          end;
  end;
end;

Procedure TMPersona.DespuesBusca(Sender:TObject);
begin
  if Assigned(OnDespuesBusca) then OnDespuesBusca(Sender);
end;

Procedure TMPersona.BuscaPersona;
begin
  if Persona = nil then
     exit;
  Case FilterBy of
    fbTMPersonaFisica   : FindKey([Persona.FieldByName('ID_PERSONA').AsString]);
    fbTMPersonaMoral    : FindKey([Persona.FieldByName('ID_PERSONA').AsString]);
    fbTMPersonaEmpresa  : FindKey([Persona.FieldByName('ID_EMPRESA').AsString]);
    fbTMPersonaEmpleado : FindKey([Persona.FieldByName('ID_PERSONA').AsString]);

    // CZR 25-FEB-09
    fbTMProspectoFisica : FindKey([Persona.FieldByName('ID_PERSONA').AsString]);
    fbTMProspectoMoral  : FindKey([Persona.FieldByName('ID_PERSONA').AsString]);

    fbNinguno           : FindKey([Persona.FieldByName('ID_PERSONA').AsString]);
  end;
end;

Function TMPersona.InternalCatalogo:Boolean;
begin
  if FilterBy=fbTMPersonaEmpleado then begin
     if Persona=nil then begin
        Persona:=TEmpleado.Create(Self);
     end;
  end;
  DataBaseChange;
  if (Persona<>nil)and(Active) then
     Persona.FindKey([ID_PERSONA.AsString])
  else
     if (Active=False) and (Persona<>nil) then
        Persona.Active:=False;
     Persona.Catalogo;
     if Persona<>nil then begin
        if Persona.Active then
           BuscaPersona
        else
           Active:=False;
     end
     else Active:=False;
      InternalCatalogo:=True;
end;

Function TMPersona.InternalConsulta:Boolean;
begin
  if FilterBy=fbTMPersonaEmpleado then
    if Persona=nil then
      Persona:=TEmpleado.Create(Self);
  DataBaseChange;
  if (Persona<>nil) and (Active) then
     Persona.FindKey([ID_PERSONA.AsString])
  else
     if (Active=False) and (Persona<>nil) then
        Persona.Active:=False;
  InternalConsulta := Inherited InternalConsulta;
  if Persona<>nil then begin
     if Persona.Active then
        BuscaPersona
     else
        Active:=False;
  end
  else
    Active:=False;
  InternalConsulta:=True;
end;

Function TMPersona.ShowWindow(FormaTipo:TFormaTipo):Integer;
begin
  if Persona<>nil then
     ShowWindow:=Persona.ShowWindow(FormaTipo)
  else
     ShowWindow:=mrCancel;
end;

Function TMPersona.Busca:Boolean;
begin
  if FilterBy=fbTMPersonaEmpleado then begin
     if Persona=nil then begin
        if Persona=nil then begin
           Persona.Free; Persona:=nil;
        end;
        Persona:=TEmpleado.Create(Self);
     end;
  end;
  DataBaseChange;
  if Persona<>nil then begin
     Persona.FindKey([ID_PERSONA.AsString]);
     Persona.BuscaWhereString:=BuscaWhereString;
     if Persona.Busca then
        BuscaPersona
     else
        Busca:=False;
  end;
end;

function TMPersona.Reporte:Boolean;
begin
  if FilterBy=fbTMPersonaEmpleado then begin
     if Persona=nil then begin
        Persona:=TEmpleado.Create(Self);
        DataBaseChange;
     end;
  end;
  if Persona<>nil then
     Persona.Reporte;
end;

function TMPersona.EsClienteAAA : boolean;
var
   STP : TStoredProc;
begin
  Result := FALSE;
  STP := TStoredProc.Create(Self);
  try
    with STP do begin
      StoredProcName := 'STPVERIFICACTEAAA';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam(ftInteger,'PIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PTIPOIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PESCTEAAA', ptOutput);
      Params.ParamByName('PIDENTIFICADOR').AsInteger    := ID_PERSONA.AsInteger;
      Params.ParamByName('PTIPOIDENTIFICADOR').AsString := 'P';
      ExecProc;
      if trim(Params.ParamByName('PESCTEAAA').AsString) = 'V' then
         Result := TRUE
      else
         Result := FALSE;
      Close;
    end;//with
  Finally
    STP.Free;
  end;//Finally
end;//function

end.
