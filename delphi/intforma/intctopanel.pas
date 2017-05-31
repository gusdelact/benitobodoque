unit IntCtoPanel;
interface
//-------------------------------------------------------------
// Sistema         :   InterCtoPanel
// Date            :   Junio de 1999
// Fecha de Inicio :   Junio de 1999
// Función forma   :   InterCtoPanel
// Desarrollo por  :   Víctor Martínez Castro MACV.
// Comentarios     :
// Actualizado al  :   10 Junio 1999
// ------------------------------------------------------------


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs,Menus,
  StdCtrls, ExtCtrls, Grids, ComCtrls, ColorGrd, Buttons, Forms, UnSubGen,
  UnGene, IntSGCtrl;


Const TAlto=15; //Alto;

Type
  TInterCtoPanel=Class(TCustomPanel)
                 Protected
                   FFrame    :TBaseInterFrame;
                   FLenguaje : Integer;

                   FSwShowLenguaje : Boolean;
                   FSwShowEnviarEmail:Boolean;

                   FShowLenguaje : Boolean;
                   FShowEnviarEmail:Boolean;

                   //FPopMenu :TPopupMenu;

                   FNotificador:TInterNotificador;
                   FNotificadorFrame:TInterNotificador;
                   FOnCambioLenguaje:TNotifyEvent;
                   PnLeng  :TPanel;
                   PnGpo1  :TPanel;
                   PnGpo2  :TPanel;
                   PnGpo3  :TPanel;

                   PnTodo  :TPanel;

                   PnCto1  :TPanel;
                   PnEmp   :TPanel;

                   PnGpoProm:TPanel;

                   PnLbCto1:TPanel;
                   PnLbCto2:TPanel;
                   PnLbCto3:TPanel;

                   PnNom   :TPanel;
                   PnMon   :TPanel;
                   PnProd  :TPanel;
                   PnFecha :TPanel;

                   PnCtoLiq:TPanel;

                   BtLen   :TSpeedButton;

                   PnProm  :TPanel;
                   PnGpo   :TPanel;
                   PnSegm  :TPanel;

                   PnSendMail:TPanel;

                   BtSendMail:TSpeedButton;
                   FOnEnviarEmail:TNotifyEvent;

                   MaxAlto:Integer;

                  Private
                     Procedure Notification(AComponent: TComponent; Operation: TOperation); override;
                     Procedure SetFrame(eFrame:TBaseInterFrame);
                     Procedure OnNotifica(Sender:TObject; Msg:TMessage);
                     Procedure SetLenguaje(Leng:Integer);
                     PRocedure OnBtnLenguaje(Sender:TObject);
                     Procedure SetShowLenguaje(Show:Boolean);
                     Procedure SetShowEnviarEmail(Show:Boolean);
                     procedure WMSize(var Message: TWMSize); message WM_SIZE;
                     Procedure FOnEnviarEMailClick(Sender:TObject);
                     Procedure Paint; override;
                 Public
                     SGCtrlEMail :TSGCtrl;
                     procedure   SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
                     Constructor Create(AOwner:TComponent); override;
                     Destructor  Destroy; override;
                     Property    Frame : TBaseInterFrame read FFrame Write SetFrame;
                     Procedure   RefrescaInfo;
                     Procedure   ShowOnlyInfo;
                 Published
                     Property    OnCambioLenguaje:TNotifyEvent read FOnCambioLenguaje Write FOnCambioLenguaje;
                     Property    Lenguaje:Integer Read FLenguaje Write SetLenguaje;
                     Property    ShowLenguaje:Boolean Read FShowLenguaje Write SetShowLenguaje;
                     Property    OnEnviarEmail:TNotifyEvent Read FOnEnviarEmail Write FOnEnviarEmail;
                     Property    ShowEnviarEMail:Boolean Read FShowEnviarEmail Write SetShowEnviarEmail;
               end;

procedure Register;

implementation
{$R *.DCR}

Uses InterApl;

procedure Register;
begin RegisterComponents('Inter', [TInterCtoPanel]);
end;



Procedure   TInterCtoPanel.Notification(AComponent: TComponent; Operation: TOperation);
begin Inherited;
      if (AComponent=FFrame) and (Operation=OpRemove)
         then begin FFrame:=nil;
              end;
end;


Procedure TInterCtoPanel.OnNotifica(Sender:TObject; Msg:TMessage);
begin      Case Msg.WParam of
  WM_INTER_APLI_TIME_CHANGE:begin if TDateTime(Pointer(Msg.LParam)^)<>0
                                  then PnFecha.Caption:=FormatDateTime(ToFechaHora,TDateTime(Pointer(Msg.LParam)^))
                                  else PnFecha.Caption:='';
                            end;
   WM_INTER_FRAME_CHANGE   :begin RefrescaInfo;
                            end;
           end;
end;

Constructor TInterCtoPanel.Create(AOwner:TComponent);
var Menu:TMenuItem;

Procedure CreaPanel(Var InPanel:TPanel; X,Y,Ancho,Alto:Integer; Align:TAlign; Padre:TWinControl; BorderType,FontType:Integer; Caption, eHint:String; eAlignment:TAlignment);
var Panel:TPanel;
begin Panel:=TPanel.Create(Padre);
      //Panel.ControlStyle :=Panel.ControlStyle - [csAcceptsControls, csSetCaption] + [csFramed, csOpaque];

      Panel.Align:=Align;
      Panel.SetBounds(X,Y,Ancho,Alto);
      Panel.Parent:=Padre;
      Panel.Caption:='XX';
      Panel.Alignment:=eAlignment;
      InPanel:=Panel;
      Case BorderType of
      0:begin Panel.BevelInner:=bvNone;
              Panel.BevelOuter:=bvNone;
        end;
      1:begin Panel.BevelInner:=bvNone;
              Panel.BevelOuter:=bvLowered; //, bvLowered, bvRaised);
              Panel.Color:=clAmarillito; //InfoBk;
              Panel.BorderWidth:=2;
        end;
      end;

      Case FontType of
      0:begin Panel.Font.Style:=[];
        end;
      1:begin Panel.Font.Style:=[fsBold];
        end;
      end;

      if eHint<>''
      then begin Panel.Hint:=eHint;
                 Panel.ShowHint:=True;
           end;
      Panel.Caption:=Caption;
end;

begin Inherited;
      //ControlStyle :=ControlStyle - [csAcceptsControls, csSetCaption] + [csFramed, csOpaque];

      MaxAlto:=TAlto*2+TAlto;

      FNotificador:=TInterNotificador.Create;
      FNotificador.OnNotifica:=OnNotifica;
      FLenguaje   :=0;

      FNotificadorFrame:=TInterNotificador.Create;
      FNotificadorFrame.OnNotifica:=OnNotifica;

      BevelInner:=bvNone;
      BevelOuter:=bvNone;

      SetBounds(0,0,600,TAlto*2+TAlto);
      Hint:='Información del Contrato';
      ShowHint:=True;
      CreaPanel(PnLeng,  0, 0, 74,150,AlRight   ,Self   , 0 ,0 ,'',   'Información del Contrato', taCenter);
      CreaPanel(PnSendMail,  0, 0,36,150,AlLeft  ,Self   , 0 ,0 ,'',   'Información del Contrato', taCenter);
      CreaPanel(PnTodo,  0, 0,400, TAlto,AlClient  ,Self   , 0 ,0 ,'',   'Información del Contrato', taCenter);

      CreaPanel(PnGpo1, 600,0,320,TAlto,AlTop     ,PnTodo   , 0 ,0 ,'',   'Información del Contrato', taCenter);
      CreaPanel(PnGpo2,  600,0,320,TAlto,AlClient ,PnTodo  , 0 ,0 ,'',   'Información del Contrato',taLeftJustify);
      CreaPanel(PnGpo3,  600,0,320,TAlto,AlBottom ,PnTodo  , 0 ,0 ,'',   'Información del Contrato',taLeftJustify);

      CreaPanel(PnLbCto1,  0,0,70,8,AlLeft       ,PnGpo1    , 0 ,1 ,'Contrato:',                  '', taCenter);
      CreaPanel(PnCto1,  101,0,110,8,AlLeft      ,PnGpo1  , 1 ,1 ,'',         'Número de Contrato',taRightJustify);
      CreaPanel(PnSegm ,  0,0,110,TAlto,AlRight   ,PnGpo1   , 1 ,0 ,'',            'Segmento',taLeftJustify);
      CreaPanel(PnNom ,  0,0,100,TAlto,AlClient  ,PnGpo1    , 1 ,1 ,'','Nombre del Titular/Contrato',taLeftJustify);

      CreaPanel(PnLbCto2,  0,0,70,8,AlLeft       ,PnGpo2   , 0 ,0 ,'',  'Información del Contrato',taLeftJustify);
      CreaPanel(PnGpo ,   101,0,110,TAlto,AlLeft  ,PnGpo2 , 1 ,0 ,'',             'Grupo de Contratos',taLeftJustify);
      CreaPanel(PnFecha,  0,0,110,TAlto,AlRight   ,PnGpo2   , 1 ,0 ,'',          'Fecha del Sistema',taLeftJustify);
      CreaPanel(PnGpoProm,  0,0,70,TAlto,AlRight  ,PnGpo2   , 1 ,0 ,'',          'Grupo/Promotor',taLeftJustify);
      CreaPanel(PnProm,   0,0,100,TAlto,AlClient  ,PnGpo2   , 1 ,0 ,'',            'Segmento',taLeftJustify);

      CreaPanel(PnLbCto3,  0,0,70,8,AlLeft     ,PnGpo3   , 0 ,0 ,'',  'Información del Contrato',taLeftJustify);
      CreaPanel(PnEmp ,   101,0,110,TAlto,AlLeft  ,PnGpo3 , 1 ,0 ,'',                    'Empresa',taLeftJustify);
      CreaPanel(PnMon ,  0,0,110,TAlto,AlRight   ,PnGpo3    , 1 ,0 ,''     ,                'Moneda',taLeftJustify);
      CreaPanel(PnCtoLiq,  0,0,70,TAlto,AlRight   ,PnGpo3   , 1 ,0 ,'',          'Contrato de Liquidación',taLeftJustify);
      CreaPanel(PnProd,   0,0,100,TAlto,AlClient  ,PnGpo3   , 1 ,0 ,'',        'Nombre del Producto',taLeftJustify);


      FShowLenguaje:=True;

      BtLen   :=TSpeedButton.Create(PnLeng);
      BtLen.Parent:=PnLeng;
      BtLen.SetBounds(1,1,70,(TAlto*2+TAlto)-2);
      BtLen.Caption:='';
      BtLen.Flat:=True;
      BtLen.Hint:='Press to Choise English Language';
      BtLen.ShowHint:=True;
      BtLen.OnClick:=OnBtnLenguaje;
      BtLen.Glyph.LoadFromResourceName(HInstance,'BT_INGLES');


      PnSendMail.Visible:=False;
      FShowEnviarEmail:=False;

      //PnSendMail.Color:=clRed;


      BtSendMail :=TSpeedButton.Create(PnSendMail);
      BtSendMail.Parent:=PnSendMail;
      BtSendMail.SetBounds(1,1,35,18);
      BtSendMail.Caption:='';
      BtSendMail.Flat:=True;
      BtSendMail.Hint:='Enviar Información por Correo-Electrónico.';
      BtSendMail.ShowHint:=True;
      //OnEnviarEmail:=FOnEnviarEMailClick;
      BtSendMail.OnClick:=FOnEnviarEMailClick;
      BtSendMail.Glyph.LoadFromResourceName(HInstance,'BT_SENDMAIL');

      PnSendMail.Parent:=Self;

      FSwShowLenguaje   :=True;
      FSwShowEnviarEmail:=True;
      (*
      FPopMenu :=TPopupMenu.Create(Self);
      Menu:=TMenuItem.Create(FPopMenu);
            Menu.Caption :='Enviar E-Mail...';
            Menu.Enabled :=Enabled;
            Menu.OnClick :=FOnEnviarEMailClick;
            Menu.Tag     :=0;
      FPopMenu.Items.Add(Menu);
      PopupMenu:=FPopMenu;
      *)
      //BtEMail :TSpeedButton;
end;


Destructor  TInterCtoPanel.Destroy;
begin //if FPopMenu<>nil then FPopMenu.Free; FPopMenu:=nil;
      if FNotificador<>nil then FNotificador.Free; FNotificador:=nil;
      if FNotificadorFrame<>nil then FNotificadorFrame.Free; FNotificadorFrame:=nil;
      Inherited;
end;



Procedure TInterCtoPanel.Paint;
begin if (FSwShowEnviarEmail)  and (PnSendMail<>nil)
         then begin PnSendMail.Visible:=Not FShowEnviarEmail;
                    PnSendMail.Visible:=FShowEnviarEmail;
                    FSwShowEnviarEmail:=False;
              end;
      if (FSwShowLenguaje) and (PnLeng<>nil)
         then begin PnLeng.Visible:=Not FShowLenguaje;
                    PnLeng.Visible:=FShowLenguaje;
                    FSwShowLenguaje:=False;
              end;
      Inherited;
end;

Procedure TInterCtoPanel.FOnEnviarEMailClick(Sender:TObject);
begin if Assigned(FOnEnviarEmail)
         then FOnEnviarEMail(Sender)
         else begin if SGCtrlEMail<>nil
                    then begin SGCtrlEMail.SendEmail(SGCtrlEMail.ApliEMail);
                         end;
              end;
end;

procedure TInterCtoPanel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin Inherited SetBounds(ALeft,ATop,AWidth,MaxAlto);
end;


procedure TInterCtoPanel.WMSize(var Message: TWMSize);
begin Inherited;
      SetBounds(Left,Top,Width,MaxAlto);
end;

Procedure TInterCtoPanel.SetShowLenguaje(Show:Boolean);
begin if (PnLeng<>nil)
      then begin PnLeng.Visible:=Show;
           end;
      if Show then PnLeng.Show Else PnLeng.Hide;
      FSwShowLenguaje:=True;
      FShowLenguaje:=Show;
      Invalidate;
end;

Procedure TInterCtoPanel.SetShowEnviarEmail(Show:Boolean);
begin if (PnSendMail<>nil)
      then begin PnSendMail.Visible:=Show;
                 BtSendMail.Visible:=Show;
           end;
      FSwShowEnviarEmail:=True;
      FShowEnviarEMail:=Show;
      Invalidate;
end;




Procedure TInterCtoPanel.SetLenguaje(Leng:Integer);
begin if (Leng in [0, 1])
      then begin if FLenguaje<>Leng
                 then begin FLenguaje:=Leng;
                            Case Leng of
                            0:begin BtLen.Caption:=''; //English';
                                    PnLbCto1.Caption:='Contrato :';
                                    BtLen.Glyph.LoadFromResourceName(HInstance,'BT_INGLES');
                                    BtLen.Hint:='Press to Choise English';
                                    BtLen.ShowHint:=True;
                              end;
                            1:begin BtLen.Caption:=''; //Español';
                                    PnLbCto1.Caption:='Account :';
                                    BtLen.Glyph.LoadFromResourceName(HInstance,'BT_ESPANOL');
                                    BtLen.Hint:='Presione para Seleccionar Información en Español';
                                    BtLen.ShowHint:=True;
                              end;
                            end;
                            if Assigned(FOnCambioLenguaje) then FOnCambioLenguaje(Self);
                      end;
           end;
end;

PRocedure TInterCtoPanel.OnBtnLenguaje(Sender:TObject);
begin if Lenguaje=0 then Lenguaje:=1
                    else Lenguaje:=0;
end;

Procedure TInterCtoPanel.RefrescaInfo;
var Sit:String;
begin if (FFrame=nil) or ((FFrame<>nil) and (Not FFrame.Active))
      then begin PnCto1  .Caption:='';
                 PnEmp   .Caption:='';
                 PnNom   .Caption:='<Seleccione un Contrato>';
                 PnMon   .Caption:='';
                 PnProd  .Caption:='';
                 PnFecha .Caption:='';
                 PnGpoProm.Caption:='';

                 PnGpo.Caption:='';
                 PnProm.Caption:='';
                 PnSegm.Caption:='';

                 PnLbCto2.Caption:='';
                 PnLbCto2.Color:=clBtnFace;
                 PnLbCto2.Font.Color:=clBtnText;
                 PnLbCto2.BevelOuter:=bvNone;
                 PnLbCto2.BorderWidth:=2;
                 PnLbCto2.Font.Style:=[fsBold];
           end
      else begin PnCto1  .Caption:=BonitoStrEx(FFrame.GetCampo('ID_CONTRATO'));
                 PnCto1  .Hint:='Contrato : '+PnCto1.Caption;

                 PnEmp   .Caption:=BonitoStrEx(IEmpresaCorta(FFrame.GetCampo('EMPNOMBRE')));
                 PnEmp   .Hint:='Empresa : '+PnEmp.Caption;

                 PnNom   .Caption:=BonitoStrEx(FFrame.GetCampo('TITNOMBRE'));
                 PnNom   .Hint:='Cliente : '+PnNom.Caption;

                 PnMon   .Caption:=BonitoStrEx(FFrame.GetCampo('DESC_MONEDA'));
                 PnMon   .Hint:='Moneda : '+PnMon.Caption;

                 PnProd  .Caption:=BonitoStrEx(FFrame.GetCampo('DESC_PRODUCTO'));
                 PnProd  .Hint:='Producto : '+PnProd.Caption;

                 PnCtoLiq.Caption:=BonitoStrEx(FFrame.GetCampo('ID_CTO_LIQ'));
                 PnCtoLiq.Hint:='Cto. de Liquidación : '+PnCtoLiq.Caption;

                 //IntCtoHeader
                 PnGpo.Caption :=BonitoStrEx(FFrame.GetCampo('DESC_GPO_CONTRAT'));
                 PnGpo.Hint:='Grupo Contrato : '+PnGpo.Caption;

                 PnGpoProm.Caption:=BonitoStrEx(FFrame.GetCampo('ID_PERS_ASOCIAD'))+' - '+BonitoStrEx(FFrame.GetCampo('ID_GRUPO'));
                 PnGpoProm.Hint:='Grupo/Promotor : '+PnGpoProm.Caption;

                 PnProm.Caption:=BonitoStrEx(FFrame.GetCampo('PROMNOMBRE'));
                 PnProm.Hint:='Promotor : '+PnProm.Caption;

                 PnSegm.Caption:=BonitoStrEx(FFrame.GetCampo('DESC_SEGMENTO'));
                 PnSegm.Hint:='Segmento : '+PnSegm.Caption;

                 if FFrame.GetLastDateTime=0
                 then PnFecha .Caption:=''
                 else PnFecha .Caption:=FormatDateTime(ToFechaHora,FFrame.GetLastDateTime);
                 PnFecha .Hint:='Fecha '+PnFecha .Caption;

                 Sit:=FFrame.GetCampo('SIT_CONTRATO');
                 if Sit='AC' then
                    begin PnLbCto2.Alignment:=taCenter;
                          PnLbCto2.Caption:='Activo';  PnLbCto2.Color:=clBtnFace;
                          PnLbCto2.BorderWidth:=1;     PnLbCto2.Font.Style:=[fsBold];
                          PnLbCto2.BevelOuter:=bvNone; PnLbCto2.Font.Color:=clBtnText;
                    end;
                 if Sit='IN' then
                    begin PnLbCto2.Alignment:=taCenter;
                          PnLbCto2.Caption:='Inactivo'; PnLbCto2.Color:=clRed;
                          PnLbCto2.BorderWidth:=1;      PnLbCto2.Font.Style:=[fsBold];
                          PnLbCto2.BevelOuter:=bvLowered;  PnLbCto2.Font.Color:=clWhite;
                    end;
                 if Sit='BL' then
                    begin PnLbCto2.Alignment:=taCenter;
                          PnLbCto2.Caption:='Bloqueado'; PnLbCto2.Color:=clRed;
                          PnLbCto2.BorderWidth:=1;      PnLbCto2.Font.Style:=[fsBold];
                          PnLbCto2.BevelOuter:=bvLowered;  PnLbCto2.Font.Color:=clWhite;
                    end;
                 if Sit='CA' then
                    begin PnLbCto2.Alignment:=taCenter;
                          PnLbCto2.Caption:='Cancelado'; PnLbCto2.Color:=clRed;
                          PnLbCto2.BorderWidth:=1;       PnLbCto2.Font.Style:=[fsBold];
                          PnLbCto2.BevelOuter:=bvLowered;  PnLbCto2.Font.Color:=clWhite;
                    end;

           end;
end;


Procedure TInterCtoPanel.ShowOnlyInfo;
begin MaxAlto:=TAlto;
      SetBounds(Left,Top,Width,MaxAlto);
      PnLeng.Visible:=False;
      PnSendMail.Visible:=False;

      PnGpo1.Visible:=True;
      PnGpo2.Visible:=False;
      PnGpo3.Visible:=False;

      PnLbCto2.Parent:=PnGpo2;
      PnLbCto1.Visible:=False;
      PnCto1.Visible:=False;
      //PnSegm.Visible:=False;
      PnNom.Visible:=False;

      PnGpo.Parent:=PnGpo1;
      PnGpo.SetBounds(0,0,PnLbCto2.Width,PnLbCto2.Height);

      PnLbCto2.Parent:=PnGpo1;
      PnLbCto2.SetBounds(-10,0,PnLbCto2.Width,PnLbCto2.Height);

      PnGpoProm.Parent:=PnGpo1;
      PnSegm.Parent:=PnGpo1;

      PnProm.Parent:=PnGpo1;


      //CreaPanel(PnLeng,  0, 0, 74,150,AlRight   ,Self   , 0 ,0 ,'',   'Información del Contrato', taCenter);
      //CreaPanel(PnSendMail,  0, 0,36,150,AlLeft  ,Self   , 0 ,0 ,'',   'Información del Contrato', taCenter);
      //CreaPanel(PnTodo,  0, 0,400, TAlto,AlClient  ,Self   , 0 ,0 ,'',   'Información del Contrato', taCenter);

      //CreaPanel(PnGpo1, 600,0,320,TAlto,AlTop     ,PnTodo   , 0 ,0 ,'',   'Información del Contrato', taCenter);
      //CreaPanel(PnGpo2,  600,0,320,TAlto,AlClient ,PnTodo  , 0 ,0 ,'',   'Información del Contrato',taLeftJustify);
      //CreaPanel(PnGpo3,  600,0,320,TAlto,AlBottom ,PnTodo  , 0 ,0 ,'',   'Información del Contrato',taLeftJustify);

end;



Procedure TInterCtoPanel.SetFrame(eFrame:TBaseInterFrame);
var Apli:TInterApli;
begin //if FFrame<>nil then FNotifica.Notificador.EliminaNotifica(FNotifica);
     FFrame:=eFrame;
     if (FFrame<>nil)
        then begin Apli:=TInterApli(FFrame.GetApApli);
                   if (Apli<>nil)
                      then begin FNotificador.Notificador:=Apli.Notificador;
                           end;
                   FNotificadorFrame.Notificador:=FFrame.Notificador;
             end
        else begin FNotificador.Notificador:=nil;
                   FNotificadorFrame.Notificador:=nil;
             end;
     RefrescaInfo;
end;


end.
