unit IntWSendEMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IntSGCtrl, InterApl, dbtables, UnSql2, IntHTML, UnGene,
  ExtCtrls;

Const WM_DESPUES_SHOW=WM_USER+1;

type
  TWSendEMail = class(TForm)
    edDeNombre: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btSend: TButton;
    Button2: TButton;
    edDeDir: TEdit;
    edPara: TMemo;
    Label4: TLabel;
    edTitulo: TEdit;
    edMsg: TMemo;
    Image1: TImage;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SGCtrl:TSGCtrl;
    Apli  :TInterApli;
    UseAttach  : Boolean;
    FileAttach : String;
    Titulo     : String;
    Mensaje    : String;
    procedure DespuesShow(Var Msg:TMessage); message WM_DESPUES_SHOW;
  end;


var
  WSendEMail: TWSendEMail;

implementation

Uses IntMailSend;

{$R *.DFM}




procedure TWSendEMail.Button2Click(Sender: TObject);
begin ModalResult:=mrCancel;
end;

procedure TWSendEMail.btSendClick(Sender: TObject);
Type TDLLSendEmail=Function(ToAddress,FromAddress,FromName,Subject,Body,HostName:PChar; Tipo:Integer):Boolean; stdcall;
 Var DLLSendEMail:TDLLSendEmail;
     ToAddress,FromAddress,FromName,Subject,Body,HostName:String;
     Handle:THandle;
     Resultado:Boolean;
     HTML:THTP;
     SL:TStringList;
     Total:Integer;
begin Panel1.Caption:='Preparando Envio de Mensaje...';
      Application.ProcessMessages;
 Try
      if Trim(edPara.Lines.Text)='' then begin ShowMessage('Debe Teclear una Dirección Válida para Enviar el Mensaje.');
                                             edPara.SetFocus;
                                             Exit;
                                       end;
     if Trim(edDeNombre.Text)='' then begin ShowMessage('Debe Teclear su Nombre.');
                                       edDeNombre.SetFocus;
                                       Exit;
                                 end;
     if Trim(edDeDir.Text)='' then begin ShowMessage('Debe Teclear Su Dirección Válida.');
                                    edDeDir.SetFocus;
                                    Exit;
                              end;
     IF Not UseAttach
     then begin
    Panel1.Caption:='Preparando Mensaje...';
    Application.ProcessMessages;
    Body:=SGCtrl.GetHTMLBodyText;

    Panel1.Caption:='Mensaje [ '+FormatFloat('###,###,###,###',Length(Body))+' Bytes ] Preparado.';
    Application.ProcessMessages;

    HTML:=THTP.Create;
     Try
        HTML.TextAddress:='';
        if (Trim(edMsg.Lines.Text)<>'')
           then HTML.AddHTML('<P>'+HTPStr(edMsg.Lines.Text)+'<BR>');
        HTML.AddHTML(Body);
        SL:=HTML.PrepareHTML;
        if SL<>nil
        then begin Body:=SL.Text;
                   SL.Free;
             end
        else begin ShowMessage('Imposible Crear Mensaje');
                   Exit;
             end;
     Finally HTML.Free;
     end;
     Panel1.Caption:='Mensaje [ '+FormatFloat('###,###,###,###',Length(Body))+' Bytes ]  Cargando DLL....';
     Application.ProcessMessages;

 Handle := LoadLibrary('SENDEMAIL.DLL');
 if Handle <> 0 then
 begin
  Try
     @DLLSendEMail:=GetProcAddress(Handle, 'ISendEMailEx');
     if @DLLSendEMail<>nil
     then begin Try ToAddress:=Us_Ascii(edPara.Lines.Text);
                    FromAddress:=Us_Ascii(edDeDir.Text);
                    FromName:=Us_Ascii(edDeNombre.Text);
                    Subject:=Us_Ascii(edTitulo.Text);
                    //Body:=
                    HostName:='GFINTER.COM';
                    Panel1.Caption:='Enviando Mensaje [ '+FormatFloat('###,###,###,###',Length(Body))+' Bytes ]...';
                    Application.ProcessMessages;
                    Resultado:=DLLSendEMail(PChar(ToAddress),PChar(FromAddress),PChar(FromName),PChar(Subject),PChar(Body),PChar(HostName),1)
                Except //Nada.
                       ShowMessage('Imposible Enviar el Mensaje');
                end;
                Panel1.Caption:='Mensaje Enviado OK';
                Application.ProcessMessages;
                ModalResult:=mrOK;
          end;
   Finally FreeLibrary(Handle);
   end;
 end
 else ShowMessage('Imposible Localizar DLL (SendEMail.Dll)');

   end
 else begin HostName:='GFINTER.COM';
            ToAddress:=Us_Ascii(edPara.Lines.Text);
            FromAddress:=Us_Ascii(edDeDir.Text);
            FromName:=Us_Ascii(edDeNombre.Text);
            Subject:=Us_Ascii(edTitulo.Text);
            Body:=Us_Ascii(edMSG.Lines.Text);
            if Not SendEMailAttach(HostName,
                                   FromName,
                                   FromAddress,
                                   ToAddress,
                                   Subject,
                                   Body,
                                   FileAttach,
                                   Apli.SysDateTime,
                                   nil)
               then ShowMessage('Imposible Enviar el Mensaje')
               else ModalResult:=mrOK;
      end;
 Finally Panel1.Caption:='';
 end;
end;

procedure TWSendEMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:=caFree;
end;


procedure TWSendEMail.FormShow(Sender: TObject);
begin PostMessage(Handle,WM_Despues_Show,0,0);
end;

procedure TWSendEMail.DespuesShow(Var Msg:TMessage);
var Q1:TQuery;
begin edTitulo.Text:=titulo;
      edMsg.Lines.Text:=Mensaje;
      if SgCtrl<>nil
      then begin if Trim(SgCtrl.Titulo2)<>''
                 then edTitulo.Text:=SgCtrl.Titulo1+'  '+SgCtrl.Titulo2
                 else edTitulo.Text:=SgCtrl.Titulo1;
           end;
      if Apli<>nil
      then begin if (Apli.UsuarioID>0)and (Apli.UsuarioNombre<>'')
                 then begin edDeNombre.Text:=BonitoStrEx(Us_Ascii(Apli.UsuarioNombre));
                            edDeNombre.Enabled:=False;
                            edDeNombre.Color:=clBtnFace;
                            edDeDir.Text:='<No Tiene Derechos para Enviar Email>';
                            edDeDir.Enabled:=False;
                            edDedir.Color:=clBtnFace;
                            Q1:=GetSqlQuery('SELECT * FROM EMAIL_PERSONA WHERE ID_PERSONA='+IntToStr(Apli.UsuarioID)
                                      ,Apli.SeguDataBaseName,Apli.SeguSessionName,False);
                            if Q1<>nil
                            then begin Try
                                        edDeDir.Text:=Us_Ascii(Q1.FieldByName('E_MAIL').AsString);
                                        if edDeDir.Text<>'' then btSend.Enabled:=True;
                                        edDeDir.Enabled:=False;
                                        edDeDir.Color:=clBtnFace;
                                       Finally Q1.Free;
                                       end;
                                       edPara.SetFocus;
                                 end
                            else begin ShowMessage('Usuario/Email No Existe. No tiene Derechos para Enviar Email.'#13#10'Verifique con el Administrador');
                                       btSend.Enabled:=False;
                                       ModalResult:=mrCancel;
                                 end;
                      end
                 else begin ShowMessage('Usuario No Existe. No tiene Derechos para Enviar Email.'#13#10'Verifique con el Administrador');
                                       btSend.Enabled:=False;
                            ModalResult:=mrCancel;
                      end;
           end;
end;

procedure TWSendEMail.FormCreate(Sender: TObject);
begin UseAttach:=False;
      Titulo:='';
      Mensaje:='';
end;

end.
