unit UnRecaptura;

interface

uses SysUtils, InterApl, controls, unSql2;

Type
	TTipoAprox = (taNinguno, taDEFECT, taRPFICV);


Function Execute_Captura(pCaption, pMensaje: String; pImporte: Real; pId_Contrato: Integer; pTipoAprox:TTipoAprox; pApli: TInterApli; Control: TControl): Boolean;

implementation

Uses IntRecaptura;

Function Execute_Captura(pCaption, pMensaje: String; pImporte: Real; pId_Contrato: Integer; pTipoAprox:TTipoAprox; pApli: TInterApli; Control: TControl): Boolean;
Var Forma: TwRecaptura;
Begin
	If pApli <> nil Then
   Begin
   	If GetSql(
      	' SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
         ' WHERE Cve_Funcion = ''' + pApli.LastFuncion + '''' +
         ' and Cve_Usuario = '''+ pApli.Usuario + '''' +
         ' and Cve_Oper_Acc = ''NR''',
      pApli.DataBaseName, pApli.SessionName, False) then
      Begin
      	Result:= True;
         Exit;
      end;
   end;

	Result:= False;
	Forma:= TwRecaptura.Create(nil);
   Try
   	Forma.CambiaColor(Control, False);

   	Forma.FImporte := pImporte;
      Forma.FTipoAprox := pTipoAprox;

      Forma.Aprox.TipoAprox := pTipoAprox;
      Forma.Aprox.Id_Contrato.AsInteger := pId_Contrato;
      Forma.Aprox.Apli := pApli;

      If Trim(pMensaje) <> '' Then Forma.FMensaje:= pMensaje;
      If Trim(pCaption) <> '' Then Forma.Caption := pCaption;

      Forma.ShowModal;
   Finally
          Result:= Forma.FResultado;
      Forma.CambiaColor(Control, True);
      If (Not Forma.FResultado) and (Control <> nil) then Forma.AsignaFoco(Control);
   	If Forma <> nil then Forma.Free;
   end;
end;

end.
