unit IntHead;
//-------------------------------------------------------------
// Sistema         :   InterEncabezado
// Date            :   Octubre de 1997
// Fecha de Inicio :   Octubre de 1997
// Función forma   :   Todos!!!
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, QRCtrls, QRPrnTr, UnGene, DBTables, InterApl,
  UnSQL2, db;

type
  TQRMacvHeader = class(TQRPrintable)
  private
    FIdEmpresa:LongInt;
    FApli:TInterApli;
    FOnPrepare:TNotifyEvent;
    FLineas   :TStrings;
    FParametro:TStrings;
    LinNum:Integer;
    StrLinNum:String;
    FEmpresaActual:Integer;
    FQuery:TQuery;
    Imagen:TBitmap;
    FFechaInfor:TDateTime;
    FTitulo1:String;
    FTitulo2:String;
    FTitulo3:String;
    FTitulo4:String;
    FNomReporte:String;
    FNombreEmpresa:String;
  Protected
      procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
      Procedure SetApli(A:TInterApli);
      Procedure SetIdEmpresa(Emp:LongInt);
  public
    constructor Create(AOwner : TComponent); override;
    Destructor Destroy; override;
    procedure Paint; override;
    Procedure SetParent(T:TWinControl); override;
    procedure Print(OfsX, OfsY : integer); override;
    Procedure PintaHeader(eCanvas:TCanvas; X1,Y1,X2,Y2:LongInt);
    Procedure SetBounds(X1,Y1,X2,Y2:Integer); override;
  published
    Property OnPrepare:TNotifyEvent Read FOnPrepare Write FOnPrepare;
    Property Apli:TInterApli Read FApli Write SetAPli;
    Property Titulo1:String Read FTitulo1 Write FTitulo1;
    Property Titulo2:String Read FTitulo2 Write FTitulo2;
    Property Titulo3:String Read FTitulo3 Write FTitulo3;
    Property FechaInfor:TDateTime Read FFechaInfor Write FFechaInfor;
    Property NomReporte:String Read FNomReporte Write FNomReporte;
    property AlignToBand;
    property Color;
    property Font;
    property ParentFont;
    Property IdEmpresa:LongInt Read FIdEmpresa Write SetIdEmpresa Default -1;
  end;
  TQRInterEncabezado=Class(TQRMacvHeader)
  end;

procedure Register;

implementation

{$R *.DCR}

procedure Register;
begin //RegisterComponents('QReport', [TQRMacvHeader]);
      RegisterComponents('Inter',[TQRInterEncabezado]);
end;


Procedure TQRMacvHeader.SetApli(A:TInterApli);
begin FApli:=A;
      Invalidate;
      SetBounds(Left,Top,Width,Height);
end;

Procedure TQRMacvHeader.SetIdEmpresa(Emp:LongInt);
begin FIdEmpresa:=Emp;
      Invalidate;
      SetBounds(Left,Top,Width,Height);
end;


Procedure TQRMacvHeader.SetParent(T:TWinControl);
begin Inherited SetParent(T);
      if (T<>nil) and (T is TQRBand) then
      begin T.Height:=84;
            SetBounds(0,0,TQRBand(T).Width,TQRBand(T).Height);
      end;
end;

constructor TQRMacvHeader.Create(AOwner : TComponent);
begin inherited Create(AOwner);
      Font.Name:='ARIAL';
      Font.Size:=8;
      Font.Style:=[];
      FEmpresaActual:=-1;
      Imagen:=TBitMap.Create;
      SetBounds(0,0,200,84);
      FTitulo1:='';
      FTitulo2:='';
      FTitulo3:='';
      FTitulo4:='';
      FNombreEmpresa:='';
      FNomReporte:='';
      FIdEmpresa:=-1;
      FechaInfor:=0;
end;

Destructor TQRMacvHeader.Destroy;
begin if Imagen<>nil then Imagen.Free; Imagen:=nil;
      Inherited;
end;



Procedure TQRMacvHeader.SetBounds(X1,Y1,X2,Y2:Integer);
begin if (Parent<>nil) and (Parent is TQRBand)
      then Inherited SetBounds(0,0,TQRBand(Parent).Width,TQRBand(Parent).Height);
end;



procedure TQRMacvHeader.Paint;
begin SetBounds(Left,Top,Width,Height);
      //Inherited Paint;
      PintaHeader(Canvas,0,0,Width,Height);
end;

Procedure TQRMacvHeader.PintaHeader(eCanvas:TCanvas; X1,Y1,X2,Y2:LongInt);
Var X,Y:Integer;
    MaxPal:Integer;
    IncX:Integer;
    Hora:TDateTime;
    Emp:LongInt;
    Usr:String;
    FechEmp:TDateTime;
    TextoFecha:String;
    T1,T2,T3:String;

Procedure CargaEmpresa;
begin  if (Apli<>nil) and (FEmpresaActual<>Emp) then
       begin Imagen.Handle:=0;
             FQuery:=GetSqlQuery('SELECT IM_LOGO_EMPRESA,NOMBRE FROM EMPRESA,PERSONA WHERE (ID_EMPRESA='+IntToStr(Emp)+') AND (EMPRESA.ID_EMPRESA=PERSONA.ID_PERSONA)'
                                  ,Apli.SeguDataBaseName,Apli.SeguSessionName,False);
             if FQuery<>nil
             then begin Try Imagen.Assign(FQuery.FieldByName('IM_LOGO_EMPRESA'));
                            FNombreEmpresa:=FQuery.FieldByName('NOMBRE').AsString
                        Finally FQuery.Free;
                        end;
                   end;
             FEmpresaActual:=Emp;
        end;
end;

begin eCanvas.Font.Name:='ARIAL';
      eCanvas.Font.Size:=8;
      eCanvas.Font.Style:=[];
      SetTextAlign(eCanvas.Handle, TA_Left + TA_Top + TA_NoUpdateCP);
      eCanvas.Brush.Style := bsSolid;
      eCanvas.Brush.Color := clWhite; //Color;
      Color:=clWhite;

      if eCanvas.Font.Size <> round(8 * Zoom / 100)
      then eCanvas.Font.Size := round(8 * Zoom / 100);

      IncX:=Abs((Y2-Y1)) div 5;
      eCanvas.Pen.Color:=clBlack;
      eCanvas.Brush.Color:=clWhite;
      eCanvas.Moveto(X1+1,Y1+1);
      eCanvas.LineTo(X2-1,Y1+1);
      eCanvas.LineTo(X2-1,Y2-1);
      eCanvas.LineTo(X1+1,Y2-1);
      eCanvas.LineTo(X1+1,Y1+1);
      //eCanvas.Rectangle(X1+1,Y1+1,X2-1,Y2-1);
      X1:=X1+Round(IncX*0.5);
      Y1:=Y1+Round(IncX*0.1);
      X2:=X2-Round(IncX*0.5);
      Y2:=Y2-Round(IncX*0.1);

      T1:=Titulo3;
      T2:=Titulo1;
      T3:=Titulo2;

      X:=X1; Y:=Y1;
      if (Apli=nil)or(Apli.Active=False) then
         begin //eCanvas.TextOut(X1,Y1,'InterApli sin Asignar');
               Usr:=UnGene.ObtenUsuario;
               if IdEmpresa<>-1 then Emp:=IdEmpresa
                                else Emp:=10;
               FechEmp:=Now;
               Hora:=Now;
               CargaEmpresa;
         end
    else begin if IdEmpresa<>-1
                  then Emp:=IdEmpresa
                  else Emp:=Apli.IdEmpresa;
               Usr:=Apli.Usuario;
               FechEmp:=Apli.DameFechaEmpresa;
               Hora:=Apli.SysDateTime;
               T1:=Apli.NomAplicacion;
               CargaEmpresa;
        end;

      if Assigned(FOnPrepare) then FOnPrepare(Self);
      X:=X1; Y:=Y1;
//      eCanvas.Rectangle(X1+1,Y1+1,X1+IncX*10-1,Y1+IncX*3-1);
      eCanvas.StretchDraw(Rect(X1,Y1,X1+IncX*10,Y1+IncX*3),Imagen);
      eCanvas.TextOut(X,Y1+IncX*3,'F. REPORTE   ');
      eCanvas.TextOut(X,Y1+IncX*4,'F. INF.      ');
      X:=X+eCanvas.TextWidth('F. REPORTE   ');
      eCanvas.TextOut(X,Y1+IncX*3,FormatDateTime('DD/MM/YYYY',Hora));
      if FechaInfor=0
         then TextoFecha:=FormatDateTime('DD/MM/YYYY',FechEmp)
         else TextoFecha:=FormatDateTime('DD/MM/YYYY',FechaInfor);

      eCanvas.TextOut(X,Y1+IncX*4,TextoFecha);

      X:=X2-eCanvas.TextWidth('MMMMMMMM  MMMMMMMM');
      Y:=Y1+(IncX div 2);
      eCanvas.TextOut(X,Y+IncX*0,'HORA :');
      eCanvas.TextOut(X,Y+IncX*1,'USUARIO :');
      eCanvas.TextOut(X,Y+IncX*2,'PAGINA :');
      eCanvas.TextOut(X,Y1+IncX*4,'['+FNomReporte+']');
      X:=X+eCanvas.TextWidth('MMMMMMMM');
      eCanvas.TextOut(X,Y+IncX*0,FormatDateTime('HH:NN:SS',Hora));
      eCanvas.TextOut(X,Y+IncX*1,Usr);
      eCanvas.TextOut(X,Y+IncX*2,IntToStr(ParentReport.PageNumber));
//    eCanvas.TextOut(X,Y1+IncX*4,'[APLICACION] ');

      X:=(X2+X1) div 2;
      eCanvas.Font.Style:=[fsBold];
      Y:=Y1;
      Y:=Y+IncX+IncX;
      eCanvas.TextOut(X-(eCanvas.TextWidth(T1) div 2),Y,T1);
      Y:=Y+IncX;
      eCanvas.Font.Style:=[];
      eCanvas.TextOut(X-(eCanvas.TextWidth(T2) div 2),Y,T2);
      Y:=Y+IncX;
      eCanvas.TextOut(X-(eCanvas.TextWidth(T3) div 2),Y,T3);

      Font.Size:=11;
      Font.Style:=[fsBold];
      eCanvas.Font.Name:='ARIAL';
      eCanvas.Font.Size:=11;
      eCanvas.Font.Style:=[fsBold];
      if eCanvas.Font.Size <> round(11 * Zoom / 100)
      then eCanvas.Font.Size := round(11 * Zoom / 100);
      Y:=Y1+(IncX div 2);
      eCanvas.TextOut(X-(eCanvas.TextWidth(FNombreEmpresa) div 2),Y,FNombreEmpresa)
end;




procedure TQRMacvHeader.Print(OfsX, OfsY : integer);
var
  CalcLeft,
  CalcTop,
  CalcRight,
  CalcBottom : Longint;
begin
  with ParentReport.QRPrinter do
  begin
    CalcLeft := XPos(OfsX + Size.Left);
    CalcTop := YPos(OfsY + Size.Top);
    CalcRight := XPos(OfsX + Size.Left + Size.Width);
    CalcBottom := YPos(OfsY + Size.Top + Size.Height);
    Alignment := taLeftJustify;
    ParentReport.QRPrinter.Canvas.Pen.Color:=clWhite;
    ParentReport.QRPrinter.Canvas.Brush.Color:=clWhite;
    PintaHeader(ParentReport.QRPrinter.Canvas, CalcLeft, CalcTop, Calcright, CalcBottom);
  end;
end;

procedure TQRMacvHeader.Notification( AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );
  if ( Operation = opRemove ) and ( AComponent = FApli ) then FApli:= nil;
end;



end.


