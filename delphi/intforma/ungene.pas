unit Ungene;
//-------------------------------------------------------------
// Sistema         :   RegSgCtrl
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

Uses  DbTables, Buttons, Dialogs,Db,SysUtils,Controls,DBCtrls,
		forms,StdCtrls,DBGrids,DBLookup,ExtCtrls, Classes,windows,Wwtable,
		wwDBGrid;

Type TTipoMensaje=(tmError,tmCuidado,tmInformacion,tmPregunta,tmErrorFatal,tmBien,tmMal);



Const
	  toDelphi ='DELP';
	  toSistema='SYS';

	  clAmarillito=$BBFFFF;
	  clAmarillote=$EEEEEE;

Const      MsgOK=MB_OK;

Type TColAlign=(tcLeft, tcRight , TcCenter);

Function FmtFecha(Fecha: TDateTime; Formato:String): String;
Function DirectorioTemporal(Show: Boolean): String;

Function InterMsg(TipoMensaje:TTipoMensaje; ErrOwner:String; ErrNumber:LongInt; Texto:String):Integer; //stdCall; external 'IntMsg.dll';

Type
     str40 = string[40];
     MaxElementos = string[14];
     //Tpfuncion tipo definido para los modos de las aplicaciones.
     TpFuncion = (nulo,alta,baja,modifica,consulta);
     //Tipo para los botones de usuario
     TpBotones = string; //[12];
     //Rutas de elementos de la aplicacion
     TpRutas   = (RButton,RBmp,RDll,RReport,RHelp);
     TdeDonde  = (RTpublic,RTaplic,RToutApl,RToutPub);
     //Typos utilizados para la rutina de escritura al registry
     TregIO = (RegEscribe,RegLee);
Const
     //Botones generales.
     //posibles botones a ser utilizados en las aplicaciones

//   cgImagenes   :array [tsbAlta..tsbAvance] of MaxElementos =

     tsbAlta       : TpBotones = 'alta.bmp';
     tsbAcepta     : TpBotones = 'Aceptar.bmp';
     tsbAyuda      : TpBotones = 'Ayuda.bmp';
     tsbBorra      : TpBotones = 'Borrar.bmp';
     tsbBuscaAprox : TpBotones = 'BuscaApx.bmp';
     tsbBuscaExacto: TpBotones = 'BuscaEx.bmp';
     tsbCancela    : TpBotones = 'Cancela.bmp';
     tsbConsulta   : TpBotones = 'Consulta.bmp';
     tsbModifica   : TpBotones = 'Modifica.bmp';
     tsbSalir      : TpBotones = 'Salir.bmp';
     tsbParticip   : TpBotones = 'Particip.bmp';
     tsbAvance     : TpBotones = 'Avance.bmp';
     tsbImprime    : TpBotones = 'Imprimir.bmp';
     tsbPreview    : TpBotones = 'Preview.bmp';
     tsbPassWord   : TpBotones = 'PassWord.bmp';
     tsbSugerencias: TpBotones = 'Suguiere.bmp';

   //Texto utilizado para las fechas
   cgMsg001 = 'La fecha final debe se mayor o igual a la fecha de inicio';
   cgMsg002 = 'La fecha de inicio debe se mayor o igual a la fecha de inicio del proyecto';

{** Obtiene digito verificador del cheque **}
function Digito_Verif_Cheque(Cod_Seg: Real; Trans: Real;
                             Num_cta: Real; Num_Fol: Real):integer;

{** Obtiene Digito verificador de intercambio **}
function Digito_Verif_Intcam(banco:string; cto:real):integer;

// corta los string muy largos a una constante interna y pone puntos al final
// del string indicando que se corto.
// el segundo para metro es la longitud a la que se cortará
Function fCorta(s : String;maxlongitud:integer):String;

 {Esta funcion busca un registro en acceso directo a la tabla que se le indique}
 {en el parametro, la variable keyValues es el valor de la llave a buscar}
 {la funcion regresa true si el registro fue accesado correctamente}
Function fBuscaRegistro(Var tabla:Ttable; keyValues : array of Const):Boolean;

{Funcion para filtrar el mensaje de error}
{Esta funcion quita las comillas a un string}
function fMensajeError(fpMensaje: String): String;

{manejo del error principalmente cuando se quiere
 grabar un registro donde hay campos requeridos que no
 han sido capturados}
Function fGrabaRegistro(Var tabla:Ttable):Boolean;
Function fGrabaRegistroWW(Var tabla:TWWtable):Boolean;

//este procedimiento cancela el registro que se tenga en el buffer o que se
//capturo recientemente, para cada caso del tipo de cancelacion se tiene
//un dialogo de mensaje para confirmar la cancelacion del registro
//El procedimiento NO borra el registro fisicamente, solo cancela captura.
Procedure pCancelaRegistro(Var tabla:Ttable;Var sbBoton: TSpeedButton);
Procedure pCancelaRegistroWW(Var tabla:TwwTable;Var sbBoton: TSpeedButton);


//Utilizar esta funcion para obtener la ruta del reporte
//el parametro es el nombre del reporte
Function  CargaReporte(nombre : string):string;

//Utiliza esta funcion para obtener la ruta de la imagen
//el parametro splash es para que se le asigne imagen
Procedure CargaImagen( Var splash : TImage;imagen : string);

//Obtiene la imagen y la asigna al boton,
//las imagenes por boton ya estan definidas, esto con la
//finalidad de que no se salgan de estandar
//posibles botones de aplicaciones
//tsbAlta,tsbAcepta,tsbAyuda,
//tsbBorra,tsbBuscaAprox,
//tsbBuscaExacto,tsbCancela,tsbConsulta,
//tsbModifica,tsbSalir,tsbParticip,tsbAvance
Procedure CargaBoton( Var sbBotone : TSpeedButton;imagen   : TpBotones);
Procedure cargaBitBtn( Var sbBotone : TBitBtn;
                           imagen   : TpBotones);

{Se valida que la fecha final debe ser mayor o igual a la fecha inicial}
Procedure validaFechas(fin,inicio:Double;msg:string;Var campo:TDBEdit);

{Esta funcion es general para mover los componentes}
{en atributo de TRUE o FALSE en la propiedad de ReadOnly}
{Si se desea proteger otro tipo de componente, se debe}
{agregar otro if del componente }
//Solo se esta protegiendo a TDBedit, Tedit, TDBgrid
//TDBLookupCombo, TDBLookupComboBox, TDBmemo, TRadioGroup
Procedure ProtegeComponente(Forma : Tform;Bandera : Boolean);

//  Esta rutina calcula el porcentaje estimado entre dos valores.
// el primer parametro es el avance
Function ObtenPorcentaje(avance,ini,fin : Real):String;

//Completa un string (s) con el caracter (c) a (i)´posiciones
Function Completa(s:string;i:integer;c : Char):string;

// Obtenemos el usuario de la red.
Function ObtenUsuario:String;

Procedure EncuentraCadena( Var tabla    : TTable;   Var Grid   : TDBGrid;
                           Var Opciones : TComboBox;    Cadena : string;
                           Var next     : Boolean);
Procedure EncuentraCadenaWW( Var tabla    : TWWTable;   Var Grid   : TDBGrid;
                           Var Opciones : TComboBox;    Cadena : string;
                           Var next     : Boolean);
Procedure EncuentraCadenaW2W( Var tabla    : TWWTable;   Var Grid   : TWWDBGrid;
                           Var Opciones : TComboBox;    Cadena : string;
                           Var next     : Boolean);

// Funcion que busca una cadena incompleta en cualquier campo de cualquier
// tabla
//
// PARAMETROS
//
// tabla    nombre de la tabla
// campo    campo sobre el que se hara busqueda secuencial
// cadena   cadena que se desea buscar sobre el campo
// next     variable para controlar el paso al siguiente requistro
Procedure EncuentraCadena2( var tabla : TTable; Campo,Cadena : string;
                            Var next : Boolean);
Procedure EncuentraCadena2WW( var tabla : TWWTable; Campo,Cadena : string;
                            Var next : Boolean);
//Llena las opciones del conbobox con los campos del grid
Procedure LlenaOpciones(Var grid:TDBGrid;Var Opciones:TComboBox);

Procedure QbuscaFechas(Var query : TQuery);
Procedure Frango(criterioA,campoA,criterioB,campoB,campo:string;Var s1,s2:string);

// Esta funcion permite escribir y leer variables a el registry solo para windows 95 y NT
// Funciona sobre HKEY_CURRENT_USER
// y sobre Software\Interacciones
// se debe especificar el sistema que se este utilizando
// y la variable (KEY) para ese sistema.
// El parametro TregIO tiene dominio de [RegEscribe|RegLee]
Procedure Escribe_Registry(sistema,Key:String; Lee_Escribe: TregIO;Var Valor : String	);

//

function NumLetra(NUMERO:real):string;

//Este Procedimiento Captura el Error cuando este se genera,
//requiere ser agregado en la forma principal, al crear el objeto, y se
//requiere un procedimieto Asignado que haga el llamado al mismo.
// en la Forma   Agregar   Procedure EventoError(Sender: TObject; E: Exception);
// y agregar el procedimiento EventoError con el llamado InterError;
// en el Create de la Forma Agregar Application.OnException:=EventoError;
Procedure InterError(Sender: TObject; E: Exception);

Function BonitoStr(S:String):String;

Function ICompStrUp(S1,S2:String):Boolean;
//Regresa el Texto en Mayusculas y Minusculas.
Function BonitoStrEx(S:String):String;
//Regresa el Texto en Mayusculas y Minusculas. Sin En El La


function ProcessExecute(CommandLine:String; cShow:Word; Wait: Boolean):Integer;
//Ejecuta una Aplicación y Permite esperar a que esta termine para despues hacer otra operación.


Function Us_Ascii(S:String):String;

implementation
Uses Registry;

Function ICompStrUp(S1,S2:String):Boolean;
begin Result:=(UpperCase(Trim(S1))=UpperCase(Trim(S2)));
end;



Function InterMsg(TipoMensaje:TTipoMensaje; ErrOwner:String; ErrNumber:LongInt; Texto:String):Integer;
begin
 case TipoMensaje of
 tmError   :InterMsg:=MessageDlg(Texto,mtError,[mbRetry,mbCancel],0);
 tmCuidado :InterMsg:=MessageDlg(Texto,mtError,[mbOK],0);
 tmInformacion:InterMsg:=MessageDlg(Texto,mtInformation,[mbOK],0);
 tmPregunta:InterMsg:=MessageDlg(Texto,mtConfirmation,[mbYes,mbNo],0);
 tmErrorFatal:InterMsg:=MessageDlg(Texto,mtError,[mbOK],0);
 tmBien:InterMsg:=MessageDlg(Texto,mtInformation,[mbOK],0);
 tmMal:InterMsg:=MessageDlg(Texto,mtError,[mbOK],0);
 end;
end;


Function FmtFecha(Fecha: TDateTime; Formato:String): String;
var
	Cont, Indice:Integer;
	fmtDia, fmtMes, fmtAnio: String;
	valorDia, valorMes, valorAnio: String;
	Anio, Mes, Dia: Word;
	FormatoAux: String;
	TipoFormato: Char;
begin
	fmtDia := '';
	fmtMes := '';
	fmtAnio:= '';
	FormatoAux := Formato;

	For Cont:= 1 to 3 do
	begin
		Indice := Pos('@',FormatoAux);
		If Indice <> 0 Then
		Begin
			FormatoAux[Indice] := '0';
			Inc(Indice);
			TipoFormato := UpCase(FormatoAux[Indice]);
			While (Indice <= Length(FormatoAux)) and (UpCase(FormatoAux[Indice]) = TipoFormato) do
			begin
				Case TipoFormato of
					'D': FmtDia := FmtDia + TipoFormato;
					'M': FmtMes := FmtMes + TipoFormato;
					'Y': FmtAnio := FmtAnio + TipoFormato;
				end;
				Inc(Indice);
			end;
		end;
	end;

	fmtDia := '@'+fmtDia;
	fmtMes := '@'+fmtMes;
	fmtAnio := '@'+fmtAnio;

	DecodeDate(Fecha, Anio, Mes, Dia);

	ValorDia:='';
	valorMes:='';
	If fmtDia = '@D' Then ValorDia := IntToStr(Dia)		{VALOR DEL DIA}
	else if fmtDia = '@DD' Then
		begin
			ValorDia := IntToStr(Dia);
			for Cont:=1 to 2-Length(ValorDia) do
				 ValorDia:='0'+ValorDia;
		end
	else fmtDia:= '';


	If fmtMes = '@M' Then ValorMes := IntToStr(Mes)		{VALOR DEL MES}
	else if fmtMes = '@MM' Then
		begin
			ValorMes := IntToStr(Mes);
			for Cont:=1 to 2-Length(ValorMes) do
				 ValorMes:='0'+ ValorMes;
		end
	else If fmtMes = '@MMM' Then
		case Mes of
		  1:  valorMes := 'Ene';
		  2:  valorMes := 'Feb';
		  3:  valorMes := 'Mar';
		  4:  valorMes := 'Abr';
		  5:  valorMes := 'May';
		  6:  valorMes := 'Jun';
		  7:  valorMes := 'Jul';
		  8:  valorMes := 'Ago';
		  9:  valorMes := 'Sep';
		  10: valorMes := 'Oct';
		  11: valorMes := 'Nov';
		  12: valorMes := 'Dic';
		end
	else If fmtMes = '@MMMM' Then
		case Mes of
		  1:  valorMes := 'Enero';
		  2:  valorMes := 'Febrero';
		  3:  valorMes := 'Marzo';
		  4:  valorMes := 'Abril';
		  5:  valorMes := 'Mayo';
		  6:  valorMes := 'Junio';
		  7:  valorMes := 'Julio';
		  8:  valorMes := 'Agosto';
		  9:  valorMes := 'Septiembre';
		  10: valorMes := 'Octubre';
		  11: valorMes := 'Noviembre';
		  12: valorMes := 'Diciembre';
		end
	else fmtMes:= '';


	If fmtAnio = '@YYYY' Then valorAnio := IntToStr(Anio)		{VALOR DEL AÑO}
	else If fmtAnio = '@YY' Then valorAnio := Copy(IntToStr(Anio),3,4)
	else fmtAnio:= '';


	FormatoAux := Formato;					{SUSTITICION DEL FORMATO POR EL VALOR}
	Indice := Pos(fmtDia,UpperCase(FormatoAux));
	If Indice <> 0 Then
		begin
			Delete(FormatoAux,Indice,Length(FmtDia));
			Insert(valorDia,FormatoAux,Indice);
		end;

	Indice := Pos(fmtMes,UpperCase(FormatoAux));
	If Indice <> 0 Then
		begin
			Delete(FormatoAux,Indice,Length(FmtMes));
			Insert(valorMes,FormatoAux,Indice);
		end;

	Indice := Pos(fmtAnio,UpperCase(FormatoAux));
	If Indice <> 0 Then
		begin
			Delete(FormatoAux,Indice,Length(FmtAnio));
			Insert(valorAnio,FormatoAux,Indice);
		end;

	Result := FormatoAux;
end;


Function DirectorioTemporal(Show: Boolean): String;
Var TempDir: String;
	 Longitud: Integer;
Begin
	Result:= '';
	Try
		TempDir:= '';
		For Longitud:= 0 to 301 do
			TempDir:= TempDir + #0;
		Longitud:= GetTempPath(300, PChar(TempDir));
		TempDir:= Copy(TempDir, 1, Longitud);
		Result:= TempDir;

		If (Trim(TempDir) = '') Then Abort;
//			Raise EAbort.Create('Error al localizar el Directorio temporal');

		//If (Trim(TempDir) = '') and (Show) Then Raise EinterFrame.Create('Error al localizar el Directorio temporal');
	Except
		If Show Then
		Begin
			MessageDlg('Error al localizar el Directorio temporal',mtError, [mbOK],0);
			Raise; //EinterFrame.Create('Error al localizar el Directorio temporal');
		end;
	end;
end;





 Function fBuscaRegistro(Var tabla:Ttable; keyValues : array of Const):Boolean;
 Begin
	 fBuscaRegistro := True;
	 Try
		 tabla.FindKey(KeyValues);
		 except on exception do
			 Begin
				 ShowMessage ('No encontro registro');
				  fBuscaRegistro := False;
			 End
	 End  {try}
 End; //BuscaRegistro

function ProcessExecute(CommandLine: String; cShow:Word; Wait: Boolean):Integer;
Var
   Rslt: Boolean;
   StartUpInfo: TStartUpInfo;
   ProcessInfo: TProcessInformation;
   ok: Word;
   Ex :DWord;
Begin
   FillChar(StartupInfo, SizeOf(TStartupInfo),0);
   FillChar(ProcessInfo, SizeOf(TProcessInformation),0);
   With StartUpInfo do begin
      cb:= SizeOf(TStartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
      wShowWindow := cShow
   end;
   Rslt := CreateProcess(nil,PChar(CommandLine), nil, nil, False,
           NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
   If Rslt then
      with ProcessInfo do begin
         If wait=True then
         ok:=WaitforSingleobject(hProcess,INFINITE);
         //WaitForInputIdle(hProcess, INFINITE);
         CloseHandle(hThread);
         CloseHandle(hProcess);
         Rslt:=GetExitCodeProcess(hProcess,Ex);
         if Rslt then Result :=Ex
                 else Result := 0;
      end
   else Result := GetLastError;
End;


Function BonitoStr(S:String):String;
var Res:String;
    Up:Boolean;
    i:Integer;
begin Up:=True; Res:='';
      For i:=1 to Length(S) do
      begin if Up then Res:=Res+UpperCase(S[i]) else Res:=Res+LowerCase(S[i]);
            if (S[i] in [' ','.',',',':']) then Up:=True else Up:=False;
      end;
      BonitoStr:=Res;
end;

Function BonitoStrEx(S:String):String;
var Res,Word:String;
    Up:Boolean;
    i:Integer;
    Primera:Boolean;

Function  VUpperCase(S:String):String;
begin      if S='ñ' then Result:='Ñ'
      else if S='á' then Result:='Á'
      else if S='é' then Result:='É'
      else if S='í' then Result:='Í'
      else if S='ó' then Result:='Ó'
      else if S='ú' then Result:='Ú'
      else if S='ü' then Result:='Ü'
      else Result:=UpperCase(S);
end;

Function  VLowerCase(S:String):String;
begin      if S='Ñ' then Result:='ñ'
      else if S='Á' then Result:='á'
      else if S='É' then Result:='é'
      else if S='Í' then Result:='í'
      else if S='Ó' then Result:='ó'
      else if S='Ú' then Result:='ú'
      else if S='Ü' then Result:='ü'
      else Result:=LowerCase(S);
end;


Function Analiza(S:String):String;
begin if Primera
      then Analiza:=S
      else begin if S='En' then S:='en';
                 if S='El' then S:='el';
                 if S='De' then S:='de';
                 if S='A' then S:='a';
                 if S='Por' then S:='por';
                 if S='La' then S:='la';
                 if S='PF' then S:='PF';
                 if S='PM' then S:='PM';
                 Analiza:=S;
           end;
end;

begin Up:=True; Res:='';
      Primera:=True;
      Word:='';
      For i:=1 to Length(S) do
      begin if (S[i] in [' ','.',',',':'])
               then begin Up:=True;
                          if S[i]='.' then Primera:=True;
                          Res:=Res+Analiza(Word);
                          Res:=Res+S[i];
                          Word:='';
                          Primera:=False;
                    end
               else begin if Up then Word:=Word+VUpperCase(S[i])
                                else Word:=Word+VLowerCase(S[i]);
                          Up:=False;
                    end;
      end;
      Res:=Res+Analiza(Word);
      BonitoStrEx:=Res;
end;

Function Us_Ascii(S:String):String;

Function  Usa_Case(S:String):String;
begin      if S='ñ' then Result:='N'
      else if S='á' then Result:='a'
      else if S='é' then Result:='e'
      else if S='í' then Result:='i'
      else if S='ó' then Result:='o'
      else if S='ú' then Result:='u'
      else if S='ü' then Result:='u'
      else if S='Ñ' then Result:='N'
      else if S='Á' then Result:='A'
      else if S='É' then Result:='E'
      else if S='Í' then Result:='I'
      else if S='Ó' then Result:='O'
      else if S='Ú' then Result:='U'
      else if S='Ü' then Result:='U'
      else Result:=S;
end;

var i:Integer;
    SS:String;
begin SS:='';
      for i:=1 to length(S) do
      begin SS:=SS+Usa_Case(S[i]);
      end;
      Result:=SS;
end;




function fMensajeError(fpMensaje: String): String;
Const Comillas : String[1] = '''';
begin
    Delete(fpMensaje,Pos(Comillas, fpMensaje),length(comillas));
    Delete(fpMensaje,Pos(Comillas, fpMensaje),length(comillas));
    fMensajeError := fpMensaje;
end; //fMensajeError

Function fGrabaRegistro(Var tabla:Ttable):Boolean;
Var
   numero : Integer;
   s : string;
begin
   fGrabaRegistro := True;
   try tabla.Post;
      except
         on E: EDatabaseError do Begin
{             Raise EDatabaseError.Create('El campo '+fMensajeError(E.Message)+
                                         ' es necesario');}
             Raise EDatabaseError.Create(fMensajeError(E.Message));
             Raise EDatabaseError.CreateRes(numero);
             s:='???';
             str(numero,s);
             MessageDlg('Error atrapado # '+s, mtInformation,[mbOk], 0);
             fGrabaRegistro := False;
         End;
   end; //tyr tabla.post
end; //tGrabaRegistro

Function fGrabaRegistroWW(Var tabla:TWWtable):Boolean;
Var
   numero : Integer;
   s : string;
begin
   fGrabaRegistroWW := True;
   try tabla.Post;
      except
         on E: EDatabaseError do Begin
{             Raise EDatabaseError.Create('El campo '+fMensajeError(E.Message)+
                                         ' es necesario');}
             Raise EDatabaseError.Create(fMensajeError(E.Message));
             Raise EDatabaseError.CreateRes(numero);
             s:='???';
             str(numero,s);
             MessageDlg('Error atrapado # '+s, mtInformation,[mbOk], 0);
             fGrabaRegistroWW := False;
         End;
   end; //tyr tabla.post
end; //tGrabaRegistroWW

Procedure pCancelaRegistro(Var tabla:ttable;Var sbBoton: TSpeedButton);
Begin
   Case tabla.State of
      dsInsert:
         begin
           if MessageDlg('Cancela el registro actual ?',
              mtConfirmation, mbYesNoCancel, 0) = mrYes then
              begin
                 tabla.Cancel;
                 tabla.Insert;
              end;
         end;

      dsEdit:
           if MessageDlg('Cancela los cambios ?',
              mtConfirmation, mbYesNoCancel, 0) = mrYes then
                 {bBoton.Click;}tabla.cancel;
{     dsBrowse: sbBoton.Click;}
   end
End; //pCancelaRegistro

Procedure pCancelaRegistroWW(Var tabla:tWWtable;Var sbBoton: TSpeedButton);
Begin
   Case tabla.State of
      dsInsert:
         begin
           if MessageDlg('Cancela el registro actual ?',
              mtConfirmation, mbYesNoCancel, 0) = mrYes then
              begin
                 tabla.Cancel;
                 tabla.Insert;
              end;
         end;

      dsEdit:
           if MessageDlg('Cancela los cambios ?',
              mtConfirmation, mbYesNoCancel, 0) = mrYes then
                 {bBoton.Click;}tabla.cancel;
{     dsBrowse: sbBoton.Click;}
   end
End; //pCancelaRegistroWW

//Funcion para obtener las rutas de los diferentes
//elementos de las aplicaciones.
Function rutas(cual : TpRutas;deDonde:TdeDonde):String;
Var RutaDeAcceso : String;
   i : Integer;
Const
   cgButton     : str40 = 'buttons\';
   cgBMP        : str40 = 'bmps\';
   cgdll        : str40 = 'dlls\';
   cgHelp       : str40 = 'Helps\';
   cgReport     : str40 = 'Reports\';
   cgPublic     : str40 = 'Public\';
Begin
   RutaDeAcceso := ExtractFilePath(Application.ExeName);
   Case DeDonde Of
      RTpublic : Begin
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\' + cgPublic;
                 End;
   RToutApl    : Begin
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\';
                 End;
   RToutPub    : Begin
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\';
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\' + cgPublic;
                 End;
   End;
   Case cual Of
      RButton  : rutas := RutaDeAcceso+cgButton;
      RBmp     : rutas := RutaDeAcceso+cgBMP;
      RDll     : rutas := RutaDeAcceso+cgDLL;
      RHelp    : rutas := RutaDeAcceso+cgHelp;
      RReport  : rutas := RutaDeAcceso+cgReport;
   End;
End;

Function CargaReporte(nombre : string):string;
begin
   if FileExists(rutas(RReport,RTaplic) + nombre) then
      CargaReporte := rutas(RReport,RtAplic) + nombre
   else if FileExists(rutas(RReport,RTpublic) + nombre) then
           CargaReporte := rutas(RReport,RTpublic) + nombre
   else
   if FileExists(rutas(RReport,RToutApl) + nombre) then
      CargaReporte := rutas(RReport,RToutApl) + nombre
   else if FileExists(rutas(RReport,RToutPub) + nombre) then
           CargaReporte := rutas(RReport,RToutPub) + nombre
        else CargaReporte := '';
End;

Procedure CargaImagen( Var splash : TImage;
                           imagen : string);
Begin
   if FileExists(rutas(RBMP,RTaplic) + imagen) then
      splash.Picture.LoadFromFile(rutas(RBMP,RtAplic) + imagen)
   else if FileExists(rutas(RBMP,RTpublic) + imagen) then
           splash.Picture.LoadFromFile(rutas(RBMP,RTpublic ) + imagen)
   else
      if FileExists(rutas(RBMP,RToutApl) + imagen) then
      splash.Picture.LoadFromFile(rutas(RBMP,RToutApl) + imagen)
   else if FileExists(rutas(RBMP,RToutPub) + imagen) then
           splash.Picture.LoadFromFile(rutas(RBMP,RToutPub ) + imagen)

{        else splash.Picture := foGene.ImEquis.Picture;}
End; {CargaImagen}

Procedure CargaBoton( Var sbBotone : TSpeedButton;
                           imagen   : TpBotones);
   Procedure uno_dos;
      Begin
         sbBotone.NumGlyphs := 2;
         if FileExists(rutas(RButton,RTaplic) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RtAplic) + imagen)
         else if FileExists(rutas(RButton,RTpublic) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RTpublic ) + imagen)
         else
         if FileExists(rutas(RButton,RToutApl) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RToutApl) + imagen)
         else if FileExists(rutas(RButton,RToutPub) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RToutPub ) + imagen)
      End;
Begin
   uno_dos;

   {        else sbBotone.Glyph := foGene.ImEquis.picture.bitmap;}
End; {CargaBoton}


Procedure cargaBitBtn( Var sbBotone : TBitBtn;
                           imagen   : TpBotones);
   Procedure uno_dos;
      Begin
         sbBotone.NumGlyphs := 2;
         if FileExists(rutas(RButton,RTaplic) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RtAplic) + imagen)
         else if FileExists(rutas(RButton,RTpublic) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RTpublic ) + imagen)
         else
         if FileExists(rutas(RButton,RToutApl) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RToutApl) + imagen)
         else if FileExists(rutas(RButton,RToutPub) + imagen) then
            sbBotone.Glyph.LoadFromFile(rutas(RButton,RToutPub ) + imagen)
      End;
Begin
   uno_dos;

   {        else sbBotone.Glyph := foGene.ImEquis.picture.bitmap;}
End; {cargaBitBtn}


Function fCorta(s : String;maxlongitud:integer):String;
Const
   puntos : string = '...';
Begin  {fCorta}
   if length(s) >= MaxLongitud Then
      s := copy(s,1,MaxLongitud-length(puntos))+ puntos;
   //end if
   fCorta := s;
End;   {fCorta}

Procedure validaFechas(fin,inicio:Double;msg:string;Var campo:TDBEdit);
Function MayorIgual(a,b :double;msg:string):Boolean;
Begin
   If a >= b Then
      result := True
   Else Begin
      MessageDlg(msg,mtInformation,[mbOk], 0);
      result := False
   End;
End; {MayorIgual}
Begin {ValidaFechas}
   if (inicio <> 0) And (fin <> 0) Then
      If (Not MayorIgual(fin,inicio,msg)) Then Begin
          campo.Clear;
          campo.SetFocus;
      End;
End; {ValidaFechas}


Procedure ProtegeComponente(Forma : Tform;Bandera : Boolean);
var I: Integer;
begin
  for I := 0 to Forma.ComponentCount -1 do Begin
  {TDBedit}         if Forma.Components[I] is TDBedit then
                       TDBedit(Forma.Components[I]).ReadOnly        := bandera;
  {Tedit}           if Forma.Components[I] is Tedit then
                       Tedit(Forma.Components[I]).ReadOnly          := bandera;
  {TDBgrid}         if Forma.Components[I] is TDBgrid then
                       TDBgrid(Forma.Components[I]).ReadOnly        := bandera;
  {TDBLookupCombo}  if Forma.Components[I] is TDBLookupCombo then
                       TDBLookupCombo(Forma.Components[I]).ReadOnly := bandera;
 {TDBLookupComboBox}if Forma.Components[I] is TDBLookupComboBox then
                       TDBLookupComboBox(Forma.Components[I]).ReadOnly:=bandera;
  {TDBmemo}         if Forma.Components[I] is TDBmemo then
                       TDBmemo(Forma.Components[I]).ReadOnly        := bandera;
  {TRadioGroup}     if Forma.Components[I] is TRadioGroup then
                       TRadioGroup(Forma.Components[I]).Enabled     := Not bandera;
  End;
End;

Function ObtenPorcentaje(avance,ini,fin : Real):String;
Var
   porcentaje : integer;
   s : string;
begin
if fin+ini = 0   Then porcentaje :=   0 else
if fin     = ini Then porcentaje := 100 else
if avance >= fin Then porcentaje := 100 else
   porcentaje := Round((( AVANCE-INI)/(FIN-INI))*100);
str(porcentaje,s);
ObtenPorcentaje := s;
End;

Procedure EncuentraCadena2 ( var tabla : TTable; Campo,Cadena : string;
                          Var next : Boolean);
Begin
   if Cadena = '' then
       MessageDlg('No has especificado texto a buscar', mtError, [mbOK], 0)
    Else Begin if (not Tabla.eof) and Next Then tabla.next;
    While (not tabla.eof) And (pos(cadena,tabla.FieldByName(campo).value)=0) Do tabla.next;
    If pos(cadena,tabla.FieldByName(campo).value)<>0 Then Next := True Else Begin
    Next := False;
    MessageDlg('No hay coincidencias', mtInformation, [mbOK], 0)
    End;
   //end if
   End;
End; //EncuentraCadena2
Procedure EncuentraCadena( Var tabla    : TTable;   Var Grid   : TDBGrid;
                           Var Opciones : TComboBox;    Cadena : string;
                           Var next     : Boolean);
Var campo : string;
Begin
   Campo := Grid.Fields[Opciones.ItemIndex].FieldName;
   EncuentraCadena2( tabla,Campo,Cadena,next);
End; //EncuentraCadena

Procedure EncuentraCadena2WW ( var tabla : TWWTable; Campo,Cadena : string;
                          Var next : Boolean);
Begin
   if Cadena = '' then
       MessageDlg('No has especificado texto a buscar', mtError, [mbOK], 0)
    Else Begin if (not Tabla.eof) and Next Then tabla.next;
    While (not tabla.eof) And (pos(cadena,tabla.FieldByName(campo).value)=0) Do tabla.next;
    If pos(cadena,tabla.FieldByName(campo).value)<>0 Then Next := True Else Begin
    Next := False;
    MessageDlg('No hay coincidencias', mtInformation, [mbOK], 0)
    End;
   //end if
   End;
End; //EncuentraCadena2WW
Procedure EncuentraCadenaWW( Var tabla    : TWWTable;   Var Grid   : TDBGrid;
                           Var Opciones : TComboBox;    Cadena : string;
                           Var next     : Boolean);
Var campo : string;
Begin
   Campo := Grid.Fields[Opciones.ItemIndex].FieldName;
   EncuentraCadena2WW( tabla,Campo,Cadena,next);
End; //EncuentraCadenaWW

Procedure EncuentraCadenaW2W( Var tabla    : TWWTable;   Var Grid   : TWWDBGrid;
                           Var Opciones : TComboBox;    Cadena : string;
                           Var next     : Boolean);
Var campo : string;
Begin
   Campo := Grid.Fields[Opciones.ItemIndex].FieldName;
   EncuentraCadena2WW( tabla,Campo,Cadena,next);
End; //EncuentraCadenaW2W

Function ObtenUsuario:String;
Var
  lpBuffer: lpstr;
  success: Boolean;
  nSize: DWord;
Begin
  nSize := 255;
  Result := '';
  GetMem(lpBuffer, 255);
  try
    success := GetUserName(lpBuffer, nSize);
    if not success then
    MessageDlg('Ocurrio un error al obtener el USUARIO', mtInformation, [mbOK], 0);
    Result := UpperCase(StrPas(lpBuffer));
  finally
    FreeMem(lpBuffer);
  end;
End;

Procedure LlenaOpciones(Var grid:TDBGrid;Var Opciones:TComboBox);
Var i : Integer;
Begin
Opciones.items.clear;
for i := 0 to grid.FieldCount - 1 do
     with grid.Fields[i] do
       if DisplayLabel <> '' then Opciones.Items.Add(DisplayLabel);
End;

Function Completa(s:string;i:integer;c : Char):string;
Var s1 : string;
    j : integer;
Begin {Completa}
   If Length(s) > i Then Begin
      copy(s,1,i);
      i := length(s);
   End;
   s1 := '';
   For j:= 1 to i-length(s) Do s1 := s1 + c;
   completa := s1 + s;
End; {Completa}

//
//
//
Procedure QbuscaFechas(Var query : TQuery);
Var
   dia,mes,ano,izq,s,fecha : string;
   p,i : integer;
Const
   formato =  #39+'YY-MM-DD'+#39;
Begin
   For i := 0 To Query.SQL.Count-1 Do Begin
       s:= Query.SQL.strings[i];
       p := Pos('/',s);
       if (p>0) And (p+7<=length(s)) And (s[p+3] = '/') Then Begin
       dia := completa(trimleft(TrimRight(copy(s,p-2,2))),2,'0');
       mes := completa(trimleft(TrimRight(copy(s,p+1,2))),2,'0');
       ano := completa(trimleft(TrimRight(copy(s,p+4,2))),2,'0');
       izq := copy(s,1,p-4);
       fecha := #39 +ano+'-'+mes+'-'+dia+ #39;
       s := izq +'TO_DATE('+ fecha +','+FORMATO+'))';
       Query.SQL.strings[i] := s;
       End;
   End;
End;

Procedure Frango(criterioA,campoA,criterioB,campoB,campo:string;Var s1,s2:string);
Const FechaVacia = '  /  /  ';
Procedure Fvalor;
Begin
   s1 := 'AND (' + campo+' '+ criterioA + #39+ campoA +#39 +')';
   s2 := 'AND (' + campo+' '+ criterioB + #39+ campoB +#39 +')';
End;

Procedure Fexacto;
Begin
   if (campoA <> FechaVacia) Then s1:= 'AND (' + campo +' '+ criterioA + #39 + campoA + #39+')';
   if (campoB <> FechaVacia) Then s2:= 'AND (' + campo +' '+ criterioB + #39 + campoB + #39+')';
End;

Begin
   s1 := '';
   s2 := '';
        If (campoA <> FechaVacia) And (campoB <> FechaVacia) Then Fvalor
   else If (campoA <> FechaVacia) Or  (campoB<>FechaVacia)   Then Fexacto;
End;

//
//
//
//
//
Procedure Escribe_Registry(sistema,Key:String; Lee_Escribe: TregIO;Var Valor : String	);
Var RegW95_NT : TRegistry;
Begin
   { Create the registry object }
   RegW95_NT := TRegistry.Create;
   RegW95_NT.RootKey :=  HKEY_CURRENT_USER;
   RegW95_NT.OpenKey('Software\Interacciones\' + sistema,True);
   If Lee_Escribe = regEscribe Then RegW95_NT.WriteString(Key,Valor)
   else 
    Try
      Valor := RegW95_NT.ReadString(Key);
      except on exception do Begin
         Valor := 'KeyError';
         RegW95_NT.WriteString(Key,valor)
      End;
    End;  {try}
   { Free the registry object }
   RegW95_NT.Free;
End;


/////////////////
function NumLetra(NUMERO:real):string;
Var
   ult_pos: integer;
   Numero_triadas: integer;
   Parcial:   string;
   Numero_char: string;
   Res_Final: string;
   ciclo:integer;

 function Reg_Parcial(parcial:string; TRIADA_ACT:integer;
                     NUMERO_TRIADAS:integer):string;
 type
   digito= array[1..9] of string;
   triad= array[1..7] of string;
 Const
   triada:  triad = ('','MIL','MILLON','MIL','BILLON','MIL','MILLON');
   centena: digito = ('CIENTO','DOSCIENTOS','TRESCIENTOS','CUATROCIENTOS',
                       'QUINIENTOS', 'SEISCIENTOS','SETECIENTOS', 'OCHOCIENTOS',
                       'NOVECIENTOS');
   decena: digito = ('DIECI','VEINTI','TREINTA','CUARENTA',
                     'CINCUENTA', 'SESENTA','SETENTA', 'OCHENTA',
                     'NOVENTA');
   unidad: digito = ('UN','DOS','TRES','CUATRO',
                     'CINC0', 'SEIS','SIETE', 'OCHO',
                     'NUEVE');

 Var
   num_str:string;
   decena_previa:string;
   unidad_previa:string;
   completo:boolean;
Begin
  parcial:=formatfloat('000',strtofloat(parcial));
  if parcial[1] <> '0' then
     begin
     num_str:= centena[strtoint(parcial[1])]+ ' ';
     if parcial='100' then
        num_str:='CIEN ';
     end;
  completo:=false;
  if parcial[2] <> '0' then
     begin
     decena_previa:=decena[strtoint(parcial[2])];
     if strtoint(copy(parcial,2,2)) = 10 then
        begin
        decena_previa:='DIEZ';
        completo:=true;
        end;
     if strtoint(copy(parcial,2,2)) = 11 then
        begin
        decena_previa:='ONCE';
        completo:=true;
        end;
     if strtoint(copy(parcial,2,2)) = 12 then
        begin
        decena_previa:='DOCE';
        completo:=true;
        end;
     if strtoint(copy(parcial,2,2)) = 13 then
        begin
        decena_previa:='TRECE';
        completo:=true;
        end;
     if strtoint(copy(parcial,2,2)) = 14 then
        begin
        decena_previa:='CATORCE';
        completo:=true;
        end;
     if strtoint(copy(parcial,2,2)) = 15 then
        begin
        decena_previa:='QUINCE';
        completo:=true;
        end;
     if strtoint(copy(parcial,2,2)) = 20 then
        begin
        decena_previa:='VEINTE';
        completo:=true;
        end;
     num_str:=num_str + decena_previa;
     end;

  if (parcial[3] <> '0') and (completo=FALSE) then
     begin
     unidad_previa:=unidad[strtoint(parcial[3])];
     if (parcial[2] <> '1') and (parcial[2] <> '2') and
        (parcial[2] <> '0')then
        num_str:=num_str + ' Y ' + unidad_previa
     else
        num_str:=num_str + unidad_previa;
     end;
  if (parcial='000') and (Numero_triadas=1) then num_str:='CERO';
  if ((parcial<>'000') or ( ((TRIADA_ACT / 2) <> TRUNC(TRIADA_ACT / 2)) and
       ((NUMERO_TRIADAS) < (TRIADA_ACT + 2)) )) then
     begin
     Num_Str:=num_str + ' ' + TRIADA[TRIADA_ACT];
     if ((TRIADA_ACT / 2) <> TRUNC(TRIADA_ACT / 2)) and (TRIADA_ACT > 1) and
        (parcial <> '001') then
        Num_Str:= Num_Str + 'ES';
     Num_Str:=Num_Str + ' ';
     end;
  Reg_Parcial:=Num_Str;
End;


BEGIN
  IF NUMERO < 0 THEN
  BEGIN
     NUMERO := ABS(NUMERO);
  END;
  NUMERO_CHAR  := FormatFloat('###,###,###,###,###,###,###,000.00' ,NUMERO);
  NUMERO_TRIADAS := 1;
  While (pos(',',NUMERO_CHAR))> 0 do
    begin
    numero_triadas:=numero_triadas + 1;
    NUMERO_CHAR[pos(',',NUMERO_CHAR)]:='S';
    end;
  ult_pos:=0;
  for ciclo:=numero_triadas downto 1 do
      begin
      if pos('S',NUMERO_CHAR)<>0 then
         Parcial:=copy(NUMERO_CHAR,ult_pos + 1,pos('S',NUMERO_CHAR)- ult_pos -1)
      else
         Parcial:=copy(NUMERO_CHAR,pos('.',NUMERO_CHAR)-3,3);
      Res_Final:=Res_Final + Reg_Parcial(Parcial,ciclo,numero_triadas);
      ult_pos:=pos('S',NUMERO_CHAR);
      NUMERO_CHAR[pos('S',NUMERO_CHAR)]:='P';
      end;
  Res_Final:=Res_Final + 'PESOS ' + copy(NUMERO_CHAR,
                        pos('.',NUMERO_CHAR) + 1,2) +'/100 M.N.';
  NumLetra:=Res_Final;
END;


Procedure InterError(Sender: TObject; E: Exception);
var i:Integer;
Var sAux:String;
    Salir:Boolean;

Function EnComillas(S:String):string;
var es:String; i:Integer;
    Dentro:Boolean;
begin Dentro:=False;
      Es:='';
      For i:=1 to Length(S) do
      if (Dentro)
      then begin if S[i]<>#39
                 then begin es:=Es+S[i];
                      end
                 else Dentro:=False;
           end
      else if S[i]=#39 then Dentro:=True;
      if es=''
      then EnComillas:=s
      else EnComillas:=es;
end;

Function SinOra(S:String):string;
var es,Tok,SS:String; i:Integer;
begin es:=''; Tok:='';
      For i:=1 to Length(S) do
      begin if S[i]=#30 then //NADA
            else
            if S[i] in [':',',',' ','.',#13,#10]
            then begin SS:=S[i];
                       if Tok<>''
                       then begin if Pos('ORA-',Tok)<>1
                                  then begin Es:=Es+Tok;
                                       end
                                  else begin if (Copy(S,i+1,1)=':') and (S[i]=' ')
                                             then begin SS:=''; S[i+1]:=#30;
                                                  end;
                                             IF s[I]=':' THEN ss:='';
                                             if (Copy(S,i+1,1)=' ')
                                             then begin S[i+1]:=#30;
                                                  end;
                                       end;
                            end;
                       Es:=Es+SS;
                       Tok:='';
                 end
            else Tok:=Tok+S[i];
      end;
      if Tok<>'' then Es:=Es+Tok;
      if es=''
      then SinOra:=S
      else SinOra:=es;
end;


Procedure AddMsg(Var sAux:String; S:String; Cat,ErrCode,SubCode,Native:LongInt; Tipo:Integer; AddMsg:String);
Var SS:String;
begin //SS:='['+Application.Title+']';
      SS:='';
      if sAux='' then sAux:=SS+' '+S else sAux:=sAux+#13+#10+SS+' '+S;
end;


Procedure Msg(S:String; Tipo:Integer);
Var SS:String;
begin //SS:='['+Application.Title+']';
      SS:='';
      Case Tipo of
      0:MessageDlg(SS+' '+S,mtError,[mbOK],0);
      1:MessageDlg(S,mtError,[mbOK],0);
      end;
end;

begin Salir:=False;
      if E is EDBEngineError then
         begin With E As EDBEngineError do
               begin sAux:='';
                     For i:=0 to ErrorCount-1 do
                     if Salir=False then
                     With Errors[i] do
                     begin Case NativeError of
                           0:begin Case ErrorCode of
                                    9732:AddMsg(sAux,'Información Requerida.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   10036:AddMsg(sAux,'Imposible Conectar al '+Message,Category,ErrorCode,SubCode,NativeError,1,Message);
                                    9729:AddMsg(sAux,'Información Duplicada.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   11830:AddMsg(sAux,'Falto cerrar comilla en la sentencia SQL.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   13059:AddMsg(sAux,'Error General SQL.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   10038:AddMsg(sAux,'Nombre de campo Invalido.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   else  AddMsg(sAux,'Mensaje DBEng.:'+Message+#13+#10+
                                                     'categoria     :'+IntToStr(Category)+#13+#10+
                                                     'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                                                     'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                                                     'Native Error  :'+IntToStr(NativeError)+#13+#10
                                                     ,Category,ErrorCode,SubCode,NativeError,1,Message);
                                   end; //Case
                              end; // 0 Native Error
                           1:begin Case ErrorCode of
                                   13059:AddMsg(sAux,'Imposible Validar Restricción de Información No Duplicada. Verifique.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   end;
                             end;
                       6550:begin Case ErrorCode of
                                   13059:begin sAux:='';
                                               AddMsg(sAux,'No Existe el Objeto '+EnComillas(Message), Category,ErrorCode,SubCode,NativeError,1,Message);
                                               Salir:=True;
                                         end;
                                   end;
                             end;
                        1400:begin Case ErrorCode of
                                   13059:AddMsg(sAux,'Imposible Validar Restricción de Información Requerida. Verifique.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   end;
                             end;

                        1407:begin Case ErrorCode of
                                   13059:AddMsg(sAux,'Imposible Validar Restricción de Información Requerida. Verifique.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   end;
                             end;
                           1017:AddMsg(sAux,'Usuario o Password Invalido.',Category,ErrorCode,SubCode,NativeError,1,Message);
                            942:AddMsg(sAux,'La Tabla o Vista seleccionada no Existe.',Category,ErrorCode,SubCode,NativeError,1,Message);
                            904:AddMsg(sAux,'Nombre de Columna Invalido.',Category,ErrorCode,SubCode,NativeError,1,Message);
                            923:AddMsg(sAux,'La palabra FROM no se encuentra donde se esperaba. Error de sintaxis sentencia SQL',Category,ErrorCode,SubCode,NativeError,1,Message);
                           else begin
                               if ErrorCode=13059
                                  then begin AddMsg(sAux,SinOra(Message)
                                                    //'categoria     :'+IntToStr(Category)+#13+#10+
                                                    //'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                                                   // 'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                                                   // 'Native Error  :'+IntToStr(NativeError)+#13+#10
                                                    ,Category,ErrorCode,SubCode,NativeError,1,Message);
                                       end
                                  else begin
                                AddMsg(sAux,'Server Mensaje:'+Message+#13+#10+
                                                  'categoria     :'+IntToStr(Category)+#13+#10+
                                                  'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                                                  'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                                                  'Native Error  :'+IntToStr(NativeError)+#13+#10
                                                  ,Category,ErrorCode,SubCode,NativeError,1,Message);
                                       end;
                                end;
                           end;
                     end;
                     Msg(sAux,1);
               end;
         end
    else if E is EDataBaseError  then Msg(EDataBaseError(E).Message,0)
    else if E is EDivByZero then Msg('Ocurrio una División por Cero en el Programa.',0)
    else if E is EZeroDivide  then Msg('Ocurrio una División por Cero en el Programa.',0)
    else begin if Copy(E.Message,1,1)=#30
               then Msg(#13+#10+Copy(E.Message,2,Length(E.Message)),0)
               else Msg('Error de Sistema.'+#13+#10+E.Message,0);
         end;
end;



{** Obtiene digito verificador del cheque **}
function Digito_Verif_Cheque(Cod_Seg: Real; Trans: Real;
                             Num_cta: Real; Num_Fol: Real):integer;
Var
   Suma: Real;
   Operador1 : Real;
   Residuo:integer;

Begin
   Suma      := Cod_Seg + Trans + Num_cta + Num_Fol;
   Operador1 := Trunc(Suma/9);
   Residuo   := Trunc(Suma - (Operador1 * 9));
   Digito_Verif_Cheque := 9 - Residuo;
End;


{** Obtiene Digito verificador de intercambio **}
function Digito_Verif_Intcam(banco:string; cto:real):integer;
Var
   llave_Intcam:string[14];
   control:integer;
   ciclo:integer;
   res_prod:integer;
   suma_prod:integer;

   function elimina_decimal(num:integer):integer;
   begin
      while num >= 10 do
         begin
         num:= num - 10;
         end;
      elimina_decimal:=num;
   end;

begin
   llave_Intcam:= banco + formatfloat('00000000000',cto);
   control:=3;
   suma_prod:=0;
   For ciclo:=1 to length(llave_IntCam) do
      begin
      res_prod:=elimina_decimal(strtoint(llave_Intcam[ciclo])* control);
      suma_prod:=suma_prod + res_prod;
      if control=3 then
         control:=7
      else
         if control=7 then
            control:=1
         else
            if control=1 then
               control:=3;
      end;
   suma_prod:=elimina_decimal(suma_prod);
   if suma_prod=0 then suma_prod:=10;
      Digito_Verif_Intcam:= Trunc(10 - suma_prod);
end;



//begin
end.






























