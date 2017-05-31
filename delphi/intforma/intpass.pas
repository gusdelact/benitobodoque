unit IntPass;
//-------------------------------------------------------------
// Sistema         :   LanSegu
// Date            :   Junio de 1997
// Fecha de Inicio :   Junio de 1997
// Función forma   :   Forma principal del sistema
// Desarrollo por  :   Víctor Martínez Castro
// Mejorado por    :   Fernando Ramírez Mercado
// Comentarios     :   Forma Estandar para Lanzar de Aplicaciones
// Actualizado al  :   07 Septiembre
//                     15 agosto 2000 ooll753
//                     22 Marzo  2004 RAMF4441
// ------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, dbtables, IntEncry, UnGene, UnSubGen,
  ExtCtrls, InterApl, Buttons;

Const
  vgNoPass : Boolean = True;
  cTextoContactoMesa = 'Comuniquese con Mesa de Ayuda a la ext. 5911';
  cTextoContactoSegu = 'Comuniquese con Pablo Garcia Neri a la ext. 2865 o '+#10#13+
                       'con Francisco Garibay Andrade a la ext. 3524 o '+#10#13+
                       'con Mesa de Ayuda a la ext. 5911';

type
  TfoPass = class(TForm)
    edUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edPassword: TEdit;
    BtnCancelar: TButton;
    BtnIniciar: TButton;
    Label3: TLabel;
    PanelTodo: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Image2: TImage;
    BtnCambiar: TButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCambiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    DataBaseName : String;
    SessionName  : String;
    IdPersona    : LongInt;
    NomUsuario   : String;
    cont         : Integer;
    pedirCambioPassword : boolean;
    Function IsUser(eUserName,eUserPass,DataBaseName,SessionName:String; Var id_Persona:LongInt; Var NomPersona:String):Boolean;
    Function StpEncPass(pUserName,pUserPass,pEvento,pDataBaseName,pSessionName:String):CHAR;
    Function ForzaCambiarPassword(peCveUsuario : String) : Boolean;
    procedure InactivaUsuario(peCveUsuario : String);
    procedure CreaFormaCambiaPassword;
    procedure ApagaBanderaCambioPassword(peCveUsuario : String);
  end;


Function ExecutefoPass(var sUsuario,sPassword, sNomUsuario:String; var sUsuarioID:LongInt; DataBaseName,SessionName:String; Apli:TInterApli):Boolean;

implementation

Uses UnSQL2;

{$R *.DFM}

Function ExecutefoPass(var sUsuario,sPassword,sNomUsuario:String; var sUsuarioID:LongInt; DataBaseName,SessionName:String; Apli:TInterApli):Boolean;
var
  foPass: TfoPass;
  HasPass:Boolean;
begin
  HasPass := False;
  ExecutefoPass := False;
  sUsuarioID := -1;
  Application.CreateForm(TfoPass, foPass);
  Try
    foPass.cont:=0;
    foPass.Label6.Caption := Apli.VersionFecha;
    foPass.Label7.Caption := Apli.Version;
    foPass.Label4.Caption := Apli.VersionInfo;
    foPass.Label5.Caption := Apli.NomAplicacion;
    CargaImg(foPass.Image2,Apli.VersionImagen);
    CargaImg(foPass.Image1,Apli.VersionLogo);

    foPass.DataBaseName := DataBaseName;
    foPass.SessionName  := SessionName;
    if(ParamStr(2)<>'')and((Trim(ParamStr(2))<>',') or (ParamStr(2)<>'/')) then begin
       foPass.edUsuario.Text:=ParamStr(2);
       if(ParamStr(3)<>'')and(vgNoPass)then begin
          foPass.edPassword.Text:=ParamStr(3);
          HasPass:=True;
       end
       else
          foPass.edPassword.Text:=ParamStr(2);
    end
    else begin
       //foPass.edUsuario.Text:=ObtenUsuario;
       //foPass.edPassword.Text:=ObtenUsuario;
       //MAGV
       foPass.edUsuario.Text:='';
       foPass.edPassword.Text:='';
    end;
    if(vgNoPass)and(HasPass)then begin
       if(foPass.IsUser(foPass.edUsuario.Text,foPass.edPassword.Text,
                        DataBaseName,SessionName,foPass.IDPERSONA, foPass.NomUsuario))and
         (not foPass.ForzaCambiarPassword(foPass.edUsuario.Text)) then begin
          sUsuario    := foPass.edUsuario.Text;
          sPassword   := foPass.edPassword.Text;
          sUsuarioID  := foPass.IDPERSONA;
          sNomUsuario := foPass.NomUsuario;
          ExecutefoPass := True;
          vgNoPass := False;
          Exit;
       end;
    end;
    if foPass.ShowModal=mrOK then begin
       sUsuario    := foPass.edUsuario.Text;
       sPassword   := foPass.edPassword.Text;
       sUsuarioID  := foPass.IdPersona;
       sNomUsuario := foPass.NomUsuario;
       ExecutefoPass:=True;
       vgNoPass:=False;
       Exit;
    end;
  Finally
    foPass.Free;
  end;
end;

procedure TfoPass.BtnCancelarClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;//procedure

procedure TfoPass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;//procedure

Function TfoPass.StpEncPass(pUserName,pUserPass,pEvento,pDataBaseName,pSessionName:String):CHAR;
Var
  SPstpEncPass : TStoredProc;
  Res : String;
  vlcRes: CHAR;
begin
  SPstpEncPass := TStoredProc.Create(nil);
  try
    //SPstpEncPass.StoredProcName := 'PKGENCRIP_TEST.STPENCPASS';
    SPstpEncPass.StoredProcName := 'PKGSEGURIDAD.STPENCPASS';
    SPstpEncPass.DatabaseName := pDataBaseName;
    SPstpEncPass.SessionName  := pSessionName;
    {SPstpEncPass.Params.CreateParam(ftString,'pUsuario',ptInput);
    SPstpEncPass.Params.CreateParam(ftString,'pPassword',ptInput);
    SPstpEncPass.Params.CreateParam(ftString,'pEvento',ptInput);
    SPstpEncPass.Params.CreateParam(ftString,'pResultado',ptOutput);}
    SPstpEncPass.Params.CreateParam(ftString,'peCveUsuario',ptInput);
    SPstpEncPass.Params.CreateParam(ftString,'pePassword',ptInput);
    SPstpEncPass.Params.CreateParam(ftString,'peCveEvento',ptInput);
    SPstpEncPass.Params.CreateParam(ftString,'psResultado',ptOutput);
    SPstpEncPass.Params.CreateParam(ftString,'psTxtResultado',ptOutput);
    SPstpEncPass.ParamByName('peCveUsuario').AsString := pUserName;
    SPstpEncPass.ParamByName('pePassword').AsString   := pUserPass;
    SPstpEncPass.ParamByName('peCveEvento').AsString  := pEvento;//}
    {SPstpEncPass.ParamByName('pUsuario').AsString  := UpperCase(pUserName);
    SPstpEncPass.ParamByName('pPassword').AsString := UpperCase(pUserPass);
    SPstpEncPass.ParamByName('pEvento').AsString   := pEvento;}
    SPstpEncPass.Prepare;
    SPstpEncPass.ExecProc;
    res := SPstpEncPass.ParamByName('psResultado').AsString;
    if length(res)>=1 Then begin
       vlcRes := res[1];
       if(vlcRes <> 'V')and(Trim(SPstpEncPass.ParamByName('psTxtResultado').AsString) <> '')then
          Application.MessageBox(PChar(SPstpEncPass.ParamByName('psTxtResultado').AsString),'Error',MB_ICONERROR);//}
    end
    else begin
       vlcRes := 'F';
    end;
    Result := vlcRes;
  Finally
    SPstpEncPass.Free;
  end;
End;//function

Function TfoPass.IsUser(eUserName,eUserPass,DataBaseName,SessionName:String; var id_Persona:LongInt; Var NomPersona:String):Boolean;
// Realiza la busqueda de un Usuario en base al Usuario y Pasword.
// Regresa True si el usuario existe y corresponde el password.
//         False si no existe o no concuerda el usuario.
Var
  qChecaUser:TQuery;
begin
  id_Persona := -1;
  NomPersona := '<<SIN ASIGNAR ERROR>>';
  CursorEspera;
  Try
    IsUser:=False;
    qChecaUser:=TQuery.Create(nil);
    Try
      Try
        qChecaUser.DataBaseName := DataBaseName;
        qChecaUser.SessionName  := SessionName;
        qChecaUser.Active:=False;
        qChecaUser.SQL.Clear;
        qChecaUser.SQL.Add('SELECT USUARIO.CVE_USUARIO, USUARIO.ID_PERSONA, PERSONA.NOMBRE ');
        qChecaUser.SQL.Add('  FROM USUARIO, PERSONA ');
        qChecaUser.SQL.Add(' WHERE (USUARIO.CVE_USUARIO = ''' + eUserName + ''') ');
        qChecaUser.SQL.Add('   AND (PERSONA.ID_PERSONA=USUARIO.ID_PERSONA ) ');
        qChecaUser.SQL.Add('   AND (USUARIO.SIT_USUARIO = ''AC'')');
        qChecaUser.Open;
        if(qChecaUser.FindFirst)then begin
           id_Persona := qChecaUser.FieldByName('ID_PERSONA').AsInteger;
           NomPersona := qChecaUser.FieldByName('NOMBRE').AsString;
        end;//if
        qChecaUser.Active:=False; // Cierra el Query.
      Except
        //Nada Solo No Puede Regresa Falso.
      end;
    Finally
      qChecaUser.Free;
    end;//}
    IsUser := STPENCPASS(eUserName,eUserPass,'V',DataBaseName,SessionName) = 'V';
  Finally
    CursorNormal;
  end;
end;

procedure TfoPass.BtnIniciarClick(Sender: TObject);
begin
  if IsUser(edUsuario.Text,edPassword.Text,DataBaseName,SessionName,IDPERSONA,NOMUSUARIO) then begin
     if(not ForzaCambiarPassword(edUsuario.Text))then
        ModalResult := mrOK
     else
        CreaFormaCambiaPassword;
  end//if
  else begin
     Inc(Cont);
     if Cont >= 5 then begin
        InterMsg(tmMal,'',0, 'Password incorrecto, número de intentos agotados. Por seguridad su usuario será inactivado.'+#10#13+cTextoContactoSegu);
        InactivaUsuario(edUsuario.Text);
        ModalResult := mrCancel;
     end;//if
     if Cont < 5 then
        InterMsg(tmInformacion,'',0,'Password incorrecto, intente nuevamente');
  end;//else
end;//procedure

procedure TfoPass.FormShow(Sender: TObject);
begin
  edPassWord.SetFocus;
end;//procedure

procedure TfoPass.BtnCambiarClick(Sender: TObject);
begin
  if Not IsUser(edUsuario.Text,edPassword.Text,DataBaseName,SessionName,IDPERSONA,NOMUSUARIO) then
     Application.MessageBox(PChar('El usuario o password son incorrectos'+#10#13+'Intente nuevamente'),'Error',MB_ICONERROR)
  else
     CreaFormaCambiaPassword;
end;//procedure

procedure TfoPass.CreaFormaCambiaPassword;
Var
  Form : TForm;
  Ed1,Ed2 : TEdit;
  Lab1 : TLabel;
  Bt1,Bt2 : TBitBtn;
  Sale : Boolean;
begin
  Form := TForm.Create(Self);
  Try
    Form.Caption:='Cambio de contraseña';
    Form.FormStyle := fsStayOnTop;
    Form.BorderStyle := bsDialog;

    Lab1:=TLabel.Create(Form);
    Lab1.Parent:=Form;
    Lab1.Caption:='Nueva contraseña';
    Lab1.SetBounds(16,4+36*0,168,24);

    Ed1:=TEdit.Create(Form);
    Ed1.Parent:=Form;
    Ed1.PasswordChar:='*';
    Ed1.CharCase:=ecNormal;
    Ed1.Text:='';
    Ed1.SetBounds(16,20+36*0,168,24);

    Lab1:=TLabel.Create(Form);
    Lab1.Parent:=Form;
    Lab1.Caption:='Verifique nueva contraseña';
    Lab1.SetBounds(16,8+36*1,168,24);

    Ed2:=TEdit.Create(Form);
    Ed2.Parent:=Form;
    Ed2.CharCase:=ecNormal;
    Ed2.PasswordChar:='*';
    Ed2.Text:='';
    Ed2.SetBounds(16,24+36*1,168,24);

    Bt1:=TBitBtn.Create(Form);
    Bt1.Parent:=Form;
    Bt1.Caption:='&Aceptar';
    Bt1.Default:=True;
    Bt1.ModalResult:=mrOK;
    Bt1.SetBounds(16,20+36*2,80,24);

    Bt2:=TBitBtn.Create(Form);
    Bt2.Parent:=Form;
    Bt2.Caption:='&Cancelar';
    Bt2.Cancel:=True;
    Bt2.ModalResult:=mrCancel;
    Bt2.SetBounds(80+16+8,20+36*2,80,24);
    Form.SetBounds(0,0,80+16+8+8+80+16,24*6+8);
    Form.Position:=poScreenCenter;
    Repeat
      Sale:=True;
      Ed1.Text := '';
      Ed2.Text := '';
      if Form.ShowModal = mrOK then begin
         if Trim(Ed1.Text) = '' then begin
            Application.MessageBox('La contraseña no puede estar vacia. Verifique','Error',MB_ICONERROR);
            Sale := False;
         end
         else
         if(Ed1.Text<>Ed2.Text) then begin
            Application.MessageBox('La contraseña y su verificación no corresponden. Verifique','Error',MB_ICONERROR);
            Sale := False;
         end
         else begin
            Try
              if StpEncPass(edUsuario.Text,Ed1.Text,'A',DataBaseName,SessionName) = 'V' then begin
                 if pedirCambioPassword then
                    ApagaBanderaCambioPassword(edUsuario.Text);
                 Application.MessageBox('La clave de acceso ha sido actualizada.','Información',MB_ICONINFORMATION);
                 edPassword.Text := Ed1.Text;
                 Sale := True;
              end//if
              else begin
                 Sale := FALSE;
                 Ed1.Text := '';
                 Ed2.Text := '';
              end;//else
            Except
              Application.MessageBox('Imposible modificar la clave de acceso. Intente más tarde','Error',MB_ICONERROR);
            end;
         end;
      end;
    Until Sale=True;
  Finally
    Form.Free;
  end;
end;//procedure

procedure TfoPass.InactivaUsuario(peCveUsuario : String);
var
  Qry : TQuery;
begin
  Qry := TQuery.Create(nil);
  Try
    Qry.DatabaseName := Self.DataBaseName;
    Qry.SessionName  := Self.SessionName;
    Qry.SQL.Append('UPDATE USUARIO SET SIT_USUARIO = ''IN'' WHERE CVE_USUARIO = '''+peCveUsuario+'''');
    Qry.ExecSQL;
  Finally
    Qry.Close;
    Qry.Free
  end;//try & finally
end;//procedure

Function TfoPass.ForzaCambiarPassword(peCveUsuario : String): boolean;
var
  Qry : TQuery;
  Resultado : Boolean;
begin
  Resultado := FALSE;
  Qry := TQuery.Create(nil);
  Try
    Qry.DatabaseName := Self.DataBaseName;
    Qry.SessionName  := Self.SessionName;
    Qry.SQL.Append('SELECT B_PIDE_NVO_PASS FROM USUARIO WHERE CVE_USUARIO = '''+peCveUsuario+'''');
    Qry.Open;
    if Qry.FindFirst then
       if Qry.FieldByName('B_PIDE_NVO_PASS').AsString = 'V' then
          Resultado := TRUE
       else
          Resultado := FALSE;
  Except
    Resultado := FALSE;
  end;
  Qry.Close;
  Qry.Free;
  pedirCambioPassword := Resultado;
  Result := Resultado;
end;//function

procedure TfoPass.FormCreate(Sender: TObject);
begin
  pedirCambioPassword := FALSE;
end;//procedure

procedure TfoPass.ApagaBanderaCambioPassword(peCveUsuario : String);
var
  Qry : TQuery;
begin
  Qry := TQuery.Create(nil);
  Try
    Qry.DatabaseName := Self.DataBaseName;
    Qry.SessionName  := Self.SessionName;
    Qry.SQL.Append('UPDATE USUARIO SET B_PIDE_NVO_PASS = ''F'' WHERE CVE_USUARIO = '''+peCveUsuario+'''');
    Qry.ExecSQL;
  Finally
    Qry.Close;
    Qry.Free
  end;//try & finally
end;//procedure

end.
