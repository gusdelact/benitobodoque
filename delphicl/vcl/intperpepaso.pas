{*******************************************************************************
 * Sistema         : Clase de PER_PEPS_ASOCIADO
 * Fecha de Inicio : 06/02/2013
 * Función forma   : Catalogo de PEP's Asociados con un IdPersona
 * Desarrollo por  : Abel Alejandro Salazar Carrillo
 * Comentarios     : Version 1.0
 ******************************************************************************}
Unit IntPerPepAso;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, RepPob, InterEdit,  Menus, UnGene,
  ComCtrls,
  IntPob         {Poblacion},
  IntPerParent   {Persona Parentesco};

Type PerPepAsocType = record
      IdPersona  : Integer;
      Id_Registro: Integer;
      Nombre     : String;
      Paterno    : String;
      Materno    : String;
      Funcion    : String;
      CvePobl    : String;
      Relacion   : String;
      CveParent  : String;
      Modifica   : Boolean;
end; 

Type
 TPerPepAso= class; 

  TWPerPepsAsociado=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA : TLabel;
    edID_PERSONA : TEdit;
    lbID_REGISTRO : TLabel; 
    edID_REGISTRO : TEdit;
    lbNOMBRE_PEPS: TLabel;
    edNOMBRE_PEPS: TEdit;
    lbPATERNO_PEPS: TLabel;
    edPATERNO_PEPS: TEdit;
    lbMATERNO_PEPS: TLabel;
    edMATERNO_PEPS: TEdit;
    lbFUNCION_PEPS: TLabel;
    edFUNCION_PEPS: TEdit;
    lbNACIONALIDAD_PEPS: TLabel;
    lbRELACION_PEPS: TLabel;
    edRELACION_PEPS: TEdit;
    edCveNacionalidad: TEdit;
    SpeedButton2: TSpeedButton;
    edNacionalidad: TEdit;
    PopupNacionalidad: TPopupMenu;
    Catlogo2: TMenuItem;
    PopupParentesco1: TPopupMenu;
    CatParentesco: TMenuItem;
    Label1: TLabel;
    edCveParentesco: TEdit;
    SpeedButton1: TSpeedButton;
    edParentesco: TEdit;
    PopupParentesco: TPopupMenu;
    Catalogo1: TMenuItem;
    
    procedure HabilitaPopUpMenu;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edNacionalidadContextPopup(Sender: TObject; MousePos: TPoint;var Handled: Boolean);
    procedure edCveNacionalidadContextPopup(Sender: TObject;MousePos: TPoint; var Handled: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Modificar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edCveParentescoContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure edParentescoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CatParentescoClick(Sender: TObject);
    procedure edCveParentescoExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    

    private
    { Private declarations } 
    public 
    { Public declarations }
    Objeto              : TPerPepAso;


end; 
 TPerPepAso= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        vpIdPersona              : Integer;
        vprgPerJuridica          : Integer;      
        ListPerPerpAsoc          : array[1..20] of PerPepAsocType;
        PerPerpAsocAct           : PerPepAsocType;
        vgIndexPerPepsAsoc       : Integer;
        vgIdRegistro             : Integer;

        IdPersona                : TInterCampo;
        IdRegistro               : TInterCampo;
        Nombre                   : TInterCampo;
        Paterno                  : TInterCampo;
        Materno                  : TInterCampo;
        Funcion                  : TInterCampo;
        Relacion                 : TInterCampo;

        Cve_Nacionalidad         : TInterCampo;
        Nacionalidad             : TInterCampo;

        Cve_Parentesco           : TInterCampo;
        Parentesco               : TInterCampo;

        PobNacionalidad          : TPoblacion;
        PerParentesco            : TPerParent;
        
        procedure   DataBaseChange; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published
       property noRegistros : Integer read  vgIndexPerPepsAsoc write vgIndexPerPepsAsoc;
      end;

const
     fbIdPersona = 1;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TPerPepAso.Create( AOwner : TComponent ); 
begin Inherited;
      IdPersona        := CreaCampo('ID_PERSONA'      ,ftFloat ,tsNinguno,tsNinguno,True);
      IdRegistro       := CreaCampo('ID_REGISTRO'     ,ftFloat ,tsNinguno,tsNinguno,True);
      Nombre           := CreaCampo('NOMBRE_PEPS'     ,ftString,tsNinguno,tsNinguno,True);
      Paterno          := CreaCampo('PATERNO_PEPS'    ,ftString,tsNinguno,tsNinguno,True);
      Materno          := CreaCampo('MATERNO_PEPS'    ,ftString,tsNinguno,tsNinguno,True);
      Funcion          := CreaCampo('FUNCION_PEPS'    ,ftString,tsNinguno,tsNinguno,True);
      Relacion         := CreaCampo('RELACION_PEPS'   ,ftString,tsNinguno,tsNinguno,True);
      Cve_Nacionalidad := CreaCampo('CVE_NACIONALIDAD',ftString,tsNinguno,tsNinguno,False);
      Nacionalidad     := CreaCampo('NACIONALIDAD'    ,ftString,tsNinguno,tsNinguno,False);
      Cve_Parentesco   := CreaCampo('CVE_PARENTESCO ' ,ftString,tsNinguno,tsNinguno,False);
      Parentesco       := CreaCampo('PARENTESCO'      ,ftString,tsNinguno,tsNinguno,False);

      PobNacionalidad                           := TPoblacion.Create(Self);
      PobNacionalidad.MasterSource              := self;
      PobNacionalidad.Cve_Poblacion.MasterField := 'CVE_NACIONALIDAD';
      PobNacionalidad.FilterBy                  := fbTPoblacionPais;

      PerParentesco                            := TPerParent.Create(Self);
      PerParentesco.MasterSource               := self;
      //PerParentesco.CVE_PARENTESCO.MasterField := 'CVE_PARENTESCO';

      FKeyFields.Add('ID_PERSONA');
      FKeyFields.Add('ID_REGISTRO');

      TableName := '';
      UseQuery  := True;
      HelpFile  := 'IntPerPepAso.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPerPepAso.Destroy;
begin inherited;
//if PobNacionalidad <> nil then PobNacionalidad.Free;
end;

procedure TPerPepAso.DataBaseChange;
begin
  inherited;
  PobNacionalidad.GetParams(Self);
  PerParentesco.GetParams(Self);
end;


function TPerPepAso.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPerPepsAsociado;
begin
   W := TWPerPepsAsociado.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame     := Self;
      W.InterForma1.FormaTipo      := FormaTipo;
      W.InterForma1.ShowGrid       := False;
      W.InterForma1.ShowNavigator  := False;
      W.InterForma1.Funcion        := FInterFun;
      W.InterForma1.ShowBtnAyuda   := False;
      W.InterForma1.ShowBtnPreview := False;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TPerPepAso.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA PER_PEPS_ASOCIADO********************)
(*                                                                              *)
(*  FORMA DE PER_PEPS_ASOCIADO                                                            *)
(*                                                                              *)
(***********************************************FORMA PER_PEPS_ASOCIADO********************)

procedure TWPerPepsAsociado.FormShow(Sender: TObject);
begin
      Objeto.IdPersona.Control                      := edID_PERSONA;
      Objeto.IdRegistro.Control                     := edID_REGISTRO;
      Objeto.Nombre.Control                         := edNOMBRE_PEPS;
      Objeto.Paterno.Control                        := edPATERNO_PEPS;
      Objeto.Materno.Control                        := edMATERNO_PEPS;
      Objeto.Funcion.Control                        := edFUNCION_PEPS;
      Objeto.PobNacionalidad.Desc_Poblacion.Control := edNacionalidad;
      Objeto.Cve_Nacionalidad.Control               := edCveNacionalidad;
      Objeto.Relacion.Control                       := edRELACION_PEPS;
      Objeto.PerParentesco.DESC_PARENTESCO.Control  := edParentesco;
      Objeto.Cve_Parentesco.Control                 := edCveParentesco;
      Objeto.vgIndexPerPepsAsoc                     := 0;
      InterForma1.F.btNuevo.Enabled                 := True;
      InterForma1.F.btModificar.Enabled             := True;
      InterForma1.F.btEliminar.Enabled              := True;
      InterForma1.F.btNuevo.SetFocus;
      Objeto.FilterBy := fbIdPersona ;

      if Objeto.vprgPerJuridica <> 0 then
      begin
         edCveParentesco.Top := -50;
         SpeedButton1.Top    := -50;
         edParentesco.Top    := -50;
         Label1.Visible      := false;
      end;

end;

procedure TWPerPepsAsociado.FormDestroy(Sender: TObject);
begin
      Objeto.IdPersona.Control        := nil;
      Objeto.IdRegistro.Control       := nil;
      Objeto.Nombre.Control           := nil;
      Objeto.Paterno.Control          := nil;
      Objeto.Materno.Control          := nil;
      Objeto.Funcion.Control          := nil;
      Objeto.Cve_Nacionalidad.Control := nil;
      Objeto.Relacion.Control         := nil;
      Objeto.Cve_Parentesco.Control   := nil;
end;

procedure TWPerPepsAsociado.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPerPepsAsociado.InterForma1DespuesNuevo(Sender: TObject);
begin
     Objeto.vgIndexPerPepsAsoc := Objeto.vgIndexPerPepsAsoc + 1;
     Objeto.vgIdRegistro       := Objeto.vgIdRegistro + 1 ;
     edID_REGISTRO.Text        := IntToStr( Objeto.vgIdRegistro );
end;

procedure TWPerPepsAsociado.InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
var indice : Integer;
sSQL       : String ;
sSET       : String ;
modif      : Boolean;
Qry        : TQuery;
IdReg      : String;
begin
 Realizado := False;
 indice    := Objeto.vgIndexPerPepsAsoc ;

   if InterForma1.IsNewData then
   begin
       Objeto.PerPerpAsocAct.Nombre    := edNOMBRE_PEPS.Text;
       Objeto.PerPerpAsocAct.Paterno   := edPATERNO_PEPS.Text;
       Objeto.PerPerpAsocAct.Materno   := edMATERNO_PEPS.Text;
       Objeto.PerPerpAsocAct.Funcion   := edFUNCION_PEPS.Text;
       Objeto.PerPerpAsocAct.CvePobl   := edCveNacionalidad.Text;
       Objeto.PerPerpAsocAct.Relacion  := edRELACION_PEPS.Text;
       Objeto.PerPerpAsocAct.CveParent := edCveParentesco.Text;

      if Objeto.vpIdPersona = 0 then
      begin
          Objeto.ListPerPerpAsoc[indice].Modifica    := False;
          Objeto.ListPerPerpAsoc[indice].IdPersona   := Objeto.vpIdPersona;
          Objeto.ListPerPerpAsoc[indice].Id_Registro := StrToInt( edID_REGISTRO.Text );
          Objeto.ListPerPerpAsoc[indice].Nombre      := edNOMBRE_PEPS.Text;
          Objeto.ListPerPerpAsoc[indice].Paterno     := edPATERNO_PEPS.Text;
          Objeto.ListPerPerpAsoc[indice].Materno     := edMATERNO_PEPS.Text;
          Objeto.ListPerPerpAsoc[indice].Funcion     := edFUNCION_PEPS.Text;
          Objeto.ListPerPerpAsoc[indice].CvePobl     := edCveNacionalidad.Text;
          Objeto.ListPerPerpAsoc[indice].Relacion    := edRELACION_PEPS.Text;
          Objeto.ListPerPerpAsoc[indice].CveParent   := edCveParentesco.Text;

      end
      else
      begin

         sSQL := 'SELECT MAX(ID_REGISTRO) + 1 AS NUM_PEPS_ASOCIADOS FROM PER_PEPS_ASOCIADO WHERE ID_PERSONA = ' + IntToStr( Objeto.vpIdPersona );
           try
              Qry := GetSQLQuery( sSQL , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

              if Qry <> nil then
              begin
                 IdReg := Qry.FieldByName('NUM_PEPS_ASOCIADOS').AsString;
                 if IdReg= '' then
                 begin
                    edID_REGISTRO.Text := '1' ;
                    IdReg := '1';
                 end
                 else
                    edID_REGISTRO.Text := IdReg;
              end;

           finally
              if Qry <> nil then
                 Qry.Free;
           end;

          RunSQL('INSERT INTO PER_PEPS_ASOCIADO(ID_PERSONA, ID_REGISTRO, NOMBRE_PEPS, PATERNO_PEPS, MATERNO_PEPS, FUNCION_PEPS, CVE_NACIONALIDAD, RELACION_PEPS, CVE_PARENTESCO)' +
            'VALUES (' + IntToStr(Objeto.vpIdPersona) + ', '+ IdReg + '  ,'
                       + chr(39) + edNOMBRE_PEPS.Text        +   chr(39) + ','
                       + chr(39) + edPATERNO_PEPS.Text       +   chr(39) + ','
                       + chr(39) + edMATERNO_PEPS.Text       +   chr(39) + ','
                       + chr(39) + edFUNCION_PEPS.Text       +   chr(39) + ','
                       + chr(39) + edCveNacionalidad.Text    +   chr(39) + ','
                       + chr(39) + edRELACION_PEPS.Text      +   chr(39) + ','
                       + chr(39) + edCveParentesco.Text      +   chr(39) + ')'
            , Objeto.DataBaseName, Objeto.SessionName, True);

           Objeto.vgIdRegistro := 0;
           Objeto.noRegistros := 0;
      end;

        Objeto.Active := False;
   end;

   if (InterForma1.CanEdit) And not( InterForma1.IsNewData) then
   begin
        sSET := '';
        modif := False;

        if Objeto.PerPerpAsocAct.Nombre   <> edNOMBRE_PEPS.Text      then
        begin
           if modif then
              sSET := sSET + ' , ';

           sSET := sSET + ' NOMBRE_PEPS = ' + chr(39) +  edNOMBRE_PEPS.Text   + chr(39) ;
           modif := True;
        end;
        if Objeto.PerPerpAsocAct.Paterno  <> edPATERNO_PEPS.Text     then
        begin
           if modif then
              sSET := sSET + ' , ';
           sSET := sSET + ' PATERNO_PEPS =' + chr(39) +  edPATERNO_PEPS.Text  + chr(39);
           modif := True;
        end;
        if Objeto.PerPerpAsocAct.Materno  <> edMATERNO_PEPS.Text     then
        begin
           if modif then
              sSET := sSET + ' , ';
           sSET := sSET + ' MATERNO_PEPS = ' + chr(39) +  edMATERNO_PEPS.Text + chr(39);
           modif := True;
        end;
        if Objeto.PerPerpAsocAct.Funcion  <> edFUNCION_PEPS.Text     then
        begin
           if modif then
              sSET := sSET + ' , ';
           sSET := sSET + ' FUNCION_PEPS =' + chr(39) +  edFUNCION_PEPS.Text  + chr(39);
           modif := True;
        end;
        if Objeto.PerPerpAsocAct.CvePobl  <> edCveNacionalidad.Text  then
        begin
           if modif then
              sSET := sSET + ' , ';
           sSET := sSET + ' CVE_NACIONALIDAD =' + chr(39) +  edCveNacionalidad.Text  + chr(39);
           modif := True;
        end;
        if Objeto.PerPerpAsocAct.Relacion <> edRELACION_PEPS.Text    then
        begin
           if modif then
              sSET := sSET + ' , ';
           sSET := sSET + ' RELACION_PEPS =' + chr(39) +  edRELACION_PEPS.Text  + chr(39) ;
           modif := True;
        end;

        if Objeto.PerPerpAsocAct.CveParent <> edCveParentesco.Text    then
        begin
           if modif then
              sSET := sSET + ' , ';
           sSET := sSET + ' CVE_PARENTESCO =' + chr(39) +  edCveParentesco.Text  + chr(39) ;
           modif := True;
        end;


        if modif then
        begin
           sSQL := ' UPDATE PER_PEPS_ASOCIADO SET ' +  sSET
                 + ' WHERE ID_PERSONA = ' + IntToStr( Objeto.vpIdPersona )
                 + ' AND ID_REGISTRO =  ' + edID_REGISTRO.Text;

          RunSQL(sSQL , Objeto.DataBaseName, Objeto.SessionName, True);

          Objeto.PerPerpAsocAct.Nombre   := edNOMBRE_PEPS.Text;
          Objeto.PerPerpAsocAct.Paterno  := edPATERNO_PEPS.Text;
          Objeto.PerPerpAsocAct.Materno  := edMATERNO_PEPS.Text;
          Objeto.PerPerpAsocAct.Funcion  := edFUNCION_PEPS.Text;
          Objeto.PerPerpAsocAct.CvePobl  := edCveNacionalidad.Text;
          Objeto.PerPerpAsocAct.CveParent:= edCveParentesco.Text;
          Objeto.PerPerpAsocAct.Relacion := edRELACION_PEPS.Text;

        end;


   end;

      Realizado := True;

end;

procedure TWPerPepsAsociado.InterForma1Cancelar(Sender: TObject;
  var Realizado: Boolean);
var indice : Integer;
begin
    Objeto.Active := False;
    
    if Objeto.vpIdPersona = 0 then
    begin
        //Regresamos el valor del indice
        if Objeto.Active then
        begin
          Objeto.vgIndexPerPepsAsoc := Objeto.vgIndexPerPepsAsoc - 1;
          Objeto.vgIdRegistro := Objeto.vgIdRegistro - 1;
          edID_REGISTRO.Text := '';
        end;
        
          indice := Objeto.vgIndexPerPepsAsoc ;

          edID_REGISTRO.Text     := IntToStr( Objeto.ListPerPerpAsoc[indice].Id_Registro);
          edNOMBRE_PEPS.Text     := Objeto.ListPerPerpAsoc[indice].Nombre;
          edPATERNO_PEPS.Text    := Objeto.ListPerPerpAsoc[indice].Paterno;
          edMATERNO_PEPS.Text    := Objeto.ListPerPerpAsoc[indice].Materno;
          edFUNCION_PEPS.Text    := Objeto.ListPerPerpAsoc[indice].Funcion;
          edCveNacionalidad.Text := Objeto.ListPerPerpAsoc[indice].CvePobl;
          edRELACION_PEPS.Text   := Objeto.ListPerPerpAsoc[indice].Relacion;
          edCveParentesco.Text   := Objeto.ListPerPerpAsoc[indice].CveParent;
          Objeto.PobNacionalidad.FindKey([edCveNacionalidad.Text]);
          Objeto.PerParentesco.FindKey([edCveParentesco.Text]);
    end
    else
    begin 
      edNOMBRE_PEPS.Text     := Objeto.PerPerpAsocAct.Nombre;
      edPATERNO_PEPS.Text    := Objeto.PerPerpAsocAct.Paterno;
      edMATERNO_PEPS.Text    := Objeto.PerPerpAsocAct.Materno;
      edFUNCION_PEPS.Text    := Objeto.PerPerpAsocAct.Funcion;
      edCveNacionalidad.Text := Objeto.PerPerpAsocAct.CvePobl;
      edRELACION_PEPS.Text   := Objeto.PerPerpAsocAct.Relacion;
      edCveParentesco.Text   := Objeto.PerPerpAsocAct.CveParent;
      Objeto.PobNacionalidad.FindKey([edCveNacionalidad.Text]);
      Objeto.PerParentesco.FindKey([edCveParentesco.Text]);
    end;

    InterForma1.F.btNuevo.Enabled                 := True;
    InterForma1.F.btModificar.Enabled             := True;
    InterForma1.F.btEliminar.Enabled              := True;
    Realizado := True;
end;

procedure TWPerPepsAsociado.SpeedButton2Click(Sender: TObject);
begin

    if Objeto.PobNacionalidad.Busca then begin
       Objeto.Cve_Nacionalidad.AsString := Objeto.PobNacionalidad.Cve_Poblacion.AsString;
       Objeto.Nacionalidad.AsString     := Objeto.PobNacionalidad.Desc_Poblacion.AsString;
    end;//if

end;

procedure TWPerPepsAsociado.edNacionalidadContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
        HabilitaPopUpMenu;
end;


procedure TWPerPepsAsociado.HabilitaPopUpMenu;
begin
  PopupNacionalidad.AutoPopup  := InterForma1.BtnAceptar.Enabled;
  PopupParentesco.AutoPopup    := InterForma1.BtnAceptar.Enabled;
end;

procedure TWPerPepsAsociado.edCveNacionalidadContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
HabilitaPopUpMenu;
end;

procedure TWPerPepsAsociado.InterForma1DespuesAceptar(Sender: TObject);
var indice : Integer;
begin

Objeto.Active := False;
    if  Objeto.vpIdPersona = 0 then
    begin
      indice := Objeto.vgIndexPerPepsAsoc ;

      edID_REGISTRO.Text     := IntToStr( Objeto.ListPerPerpAsoc[indice].Id_Registro);
      edNOMBRE_PEPS.Text     := Objeto.ListPerPerpAsoc[indice].Nombre;
      edPATERNO_PEPS.Text    := Objeto.ListPerPerpAsoc[indice].Paterno;
      edMATERNO_PEPS.Text    := Objeto.ListPerPerpAsoc[indice].Materno;
      edFUNCION_PEPS.Text    := Objeto.ListPerPerpAsoc[indice].Funcion;
      edCveNacionalidad.Text := Objeto.ListPerPerpAsoc[indice].CvePobl;
      edRELACION_PEPS.Text   := Objeto.ListPerPerpAsoc[indice].Relacion;
      edCveParentesco.Text   := Objeto.ListPerPerpAsoc[indice].CveParent;
      Objeto.PobNacionalidad.FindKey([edCveNacionalidad.Text]);
      Objeto.PerParentesco.FindKey([edCveParentesco.Text]);
    end
    else
    begin
      edNOMBRE_PEPS.Text     := Objeto.PerPerpAsocAct.Nombre;
      edPATERNO_PEPS.Text    := Objeto.PerPerpAsocAct.Paterno;
      edMATERNO_PEPS.Text    := Objeto.PerPerpAsocAct.Materno;
      edFUNCION_PEPS.Text    := Objeto.PerPerpAsocAct.Funcion;
      edCveNacionalidad.Text := Objeto.PerPerpAsocAct.CvePobl;
      edRELACION_PEPS.Text   := Objeto.PerPerpAsocAct.Relacion;
      edCveParentesco.Text   := Objeto.PerPerpAsocAct.CveParent;
      Objeto.PobNacionalidad.FindKey([edCveNacionalidad.Text]);
      Objeto.PerParentesco.FindKey([edCveParentesco.Text]);
    end;

   InterForma1.F.btNuevo.Enabled                 := True;
   InterForma1.F.btModificar.Enabled             := True;
   InterForma1.F.btEliminar.Enabled              := True;
end;

procedure TWPerPepsAsociado.InterForma1Buscar(Sender: TObject);
Var T:TInterFindit;
 s: string;
begin //InternalBusca := False;
   if Objeto.vpIdPersona <> 0 then
   begin
        T := Objeto.CreaBuscador('IPEPEAS.it','F,F');
         Try
                Case Objeto.FilterBy of
		fbIdPersona:
			Begin
				S:='(PER_PEPS_ASOCIADO.ID_PERSONA =' + IntToStr(Objeto.vpIdPersona) + ' )';
				AddSql (s,Objeto.BuscaWhereString);
			End;
		else s:=Objeto.BuscaWhereString;
		end;

		T.WhereString:=s;
                 if T.Execute then
                 begin
                  edID_REGISTRO.Text      := T.DameCampo(1);
                  edNOMBRE_PEPS.Text      := T.DameCampo(2);
                  edPATERNO_PEPS.Text     := T.DameCampo(3);
                  edMATERNO_PEPS.Text     := T.DameCampo(4);
                  edFUNCION_PEPS.Text     := T.DameCampo(5);
                  edCveNacionalidad.Text  := T.DameCampo(6);
                  edRELACION_PEPS.Text    := T.DameCampo(7);
                  edCveParentesco.Text    := T.DameCampo(8);

                  Objeto.PobNacionalidad.FindKey([edCveNacionalidad.Text]);
                  Objeto.PerParentesco.FindKey([edCveParentesco.Text]);

                 end;

        finally  T.Free;
        end;
   end;

   InterForma1.F.btNuevo.Enabled                 := True;
   InterForma1.F.btModificar.Enabled             := True;
   InterForma1.F.btEliminar.Enabled              := True;
end;

procedure TWPerPepsAsociado.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  if (Objeto.vgIdRegistro + 1) > 20 then
  begin
      InterMsg(tmInformacion,'¡¡¡ Atencion !!!',0,'El numero maximo permitido son 20 PEPs Asociados.');
      Realizado := False;
  end
  else
  begin  
    Realizado := True;
  end;
end;

procedure TWPerPepsAsociado.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado:=True;
end;

procedure TWPerPepsAsociado.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin

  Objeto.PerPerpAsocAct.Nombre   := edNOMBRE_PEPS.Text;
  Objeto.PerPerpAsocAct.Paterno  := edPATERNO_PEPS.Text;
  Objeto.PerPerpAsocAct.Materno  := edMATERNO_PEPS.Text;
  Objeto.PerPerpAsocAct.Funcion  := edFUNCION_PEPS.Text;
  Objeto.PerPerpAsocAct.CvePobl  := edCveNacionalidad.Text;
  Objeto.PerPerpAsocAct.CveParent:= edCveParentesco.Text;
  Objeto.PerPerpAsocAct.Relacion := edRELACION_PEPS.Text;

  Realizado:=True;
end;

procedure TWPerPepsAsociado.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
var
  sSQL   :String;  
begin
  if Objeto.vpIdPersona <> 0 then
   begin
     if InterMsg(tmPregunta, '', 0, '¿Seguro que deseas eliminar este registro?') = mrYes then
     begin
         sSQL := ' DELETE PER_PEPS_ASOCIADO '
                   + ' WHERE ID_PERSONA = ' + IntToStr( Objeto.vpIdPersona )
                   + ' AND ID_REGISTRO =  ' + edID_REGISTRO.Text;

         RunSQL(sSQL , Objeto.DataBaseName, Objeto.SessionName, True);
         edID_REGISTRO.Text      := '';
         edNOMBRE_PEPS.Text      := '';
         edPATERNO_PEPS.Text     := '';
         edMATERNO_PEPS.Text     := '';
         edFUNCION_PEPS.Text     := '';
         edCveNacionalidad.Text  := '';
         edRELACION_PEPS.Text    := '';
         edCveParentesco.Text    := '';
         edNacionalidad.Text     := '';
         
         InterForma1.F.btNuevo.Enabled                 := True;
         InterForma1.F.btModificar.Enabled             := True;
         InterForma1.F.btEliminar.Enabled              := True;
     end;
   end;
   Realizado := True;

end;

procedure TWPerPepsAsociado.SpeedButton1Click(Sender: TObject);
begin
    if Objeto.PerParentesco.Busca then begin
       Objeto.Cve_Parentesco.AsString := Objeto.PerParentesco.CVE_PARENTESCO.AsString;
       Objeto.Parentesco.AsString     := Objeto.PerParentesco.DESC_PARENTESCO.AsString;
    end;//if
end;

procedure TWPerPepsAsociado.edCveParentescoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
HabilitaPopUpMenu;
end;

procedure TWPerPepsAsociado.edParentescoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
HabilitaPopUpMenu;
end;

procedure TWPerPepsAsociado.CatParentescoClick(Sender: TObject);
var
  Parent : TPerParent;
begin
   Parent := TPerParent.Create(Objeto);
   Parent.GetParams(Objeto);
   try
      if edCveParentesco.Text = '' then
           Parent.FindKey([edCveParentesco.Text]);
      Parent.Catalogo;
      if InterForma1.CanEdit then begin
         if Parent.Active then begin
           Objeto.Cve_Parentesco.AsString := Parent.CVE_PARENTESCO.AsString;
           Objeto.Parentesco.AsString     := Parent.DESC_PARENTESCO.AsString;
         end;
      end;
   finally
    Parent.Free;
   end;
end;

procedure TWPerPepsAsociado.edCveParentescoExit(Sender: TObject);
Var
   sSQL,sUnico        : String;
   Qry,Qry2           : TQuery;
   idx,idx2,indice    : Integer;
begin

    if  Objeto.vpIdPersona = 0 then
    begin
       indice := Objeto.vgIndexPerPepsAsoc;

       for  idx := 0 to indice do
       begin
          for  idx2 := 0 to indice do
          begin
            if Objeto.ListPerPerpAsoc[idx].CveParent =Objeto.ListPerPerpAsoc[idx2].CveParent then
            MessageDlg( 'Solo puedes capturar una persona asociada con este perentesco', mtWarning, [mbOk], 0);
            edCveParentesco.Text := '';
            edParentesco.Text    := '';
            exit;
          end; 
       end;

    end
    else
    begin
        sSQL := 'SELECT B_UNICO  FROM PER_PARENTESCO WHERE CVE_PARENTESCO = '
        + chr(39) +  edCveParentesco.Text  + chr(39) ;

        Qry := GetSQLQuery( sSQL , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

        if Qry <> nil then
        begin
            while not Qry.eof do
            begin
                 if Qry.FieldByName('B_UNICO').AsString = 'V' then
                 begin
                    sUnico :=  ' SELECT COUNT(1) AS NUM FROM PER_PEPS_ASOCIADO WHERE ID_PERSONA= ' + IntToStr( Objeto.vpIdPersona )
                             + ' AND CVE_PARENTESCO = ' + chr(39) +  edCveParentesco.Text  + chr(39) ;

                    Qry2 := GetSQLQuery( sUnico , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

                    if Qry2 <> nil then
                    begin
                       while not Qry2.eof do
                       begin
                           if Qry2.FieldByName('NUM').AsInteger >= 1 then
                           begin
                              MessageDlg( 'Solo puedes capturar una persona asociada con este parentesco', mtWarning, [mbOk], 0);
                              edCveParentesco.Text := '';
                              edParentesco.Text    := '';
                           end;
                           Qry2.Next;
                       end;

                    end;
                  Qry.Next;
                 end;
            end
        end;
    end;

end;

procedure TWPerPepsAsociado.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var
   sSQL,sUnico        : String;
   Qry,Qry2           : TQuery;
   idx,idx2,indice    : Integer;
begin

  if trim(edNOMBRE_PEPS.text) = '' then
  begin
    edNOMBRE_PEPS.SetFocus;
    raise EInterFrame.Create('Proporcione el Nombre');
  end;
  if trim(edPATERNO_PEPS.text) = '' then
  begin
    edPATERNO_PEPS.SetFocus;
    raise EInterFrame.Create('Proporcione el Apellido Paterno');
  end;
  if trim(edMATERNO_PEPS.text) = '' then
  begin
    edMATERNO_PEPS.SetFocus;
    raise EInterFrame.Create('Proporcione el Apellido Materno');
  end;

  if trim(edFUNCION_PEPS.text) = '' then
  begin
    edFUNCION_PEPS.SetFocus;
    raise EInterFrame.Create('Proporcione la Función');
  end;

  if trim(edRELACION_PEPS.text) = '' then
  begin
    edRELACION_PEPS.SetFocus;
    raise EInterFrame.Create('Proporcione la Relación');
  end;

  if trim(edCveNacionalidad.text) = '' then
  begin
    edCveNacionalidad.SetFocus;
    raise EInterFrame.Create('Seleccione la Nacionalidad');
  end;

  if Objeto.vprgPerJuridica = 0 then
  begin
      if trim(edCveParentesco.text) = '' then
      begin
        edCveParentesco.SetFocus;
        raise EInterFrame.Create('Seleccione el Parentesco');
      end;

  end;



  if  Objeto.vpIdPersona = 0 then
    begin
       indice := Objeto.vgIndexPerPepsAsoc;

       for  idx := 0 to indice do
       begin
          for  idx2 := 0 to indice do
          begin
            if Objeto.ListPerPerpAsoc[idx].CveParent =Objeto.ListPerPerpAsoc[idx2].CveParent then
            MessageDlg( 'Solo puedes capturar una persona asociada con este perentesco', mtWarning, [mbOk], 0);
            edCveParentesco.SetFocus;
            edCveParentesco.Text := '';
            edParentesco.Text    := '';
            Realizado := False;
            exit;
          end; 
       end;

    end
    else
    begin
        sSQL := 'SELECT B_UNICO  FROM PER_PARENTESCO WHERE CVE_PARENTESCO = '
        + chr(39) +  edCveParentesco.Text  + chr(39) ;

        Qry := GetSQLQuery( sSQL , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

        if Qry <> nil then
        begin
            while not Qry.eof do
            begin
                 if Qry.FieldByName('B_UNICO').AsString = 'V' then
                 begin
                    sUnico :=  ' SELECT COUNT(1) AS NUM FROM PER_PEPS_ASOCIADO WHERE ID_PERSONA= ' + IntToStr( Objeto.vpIdPersona )
                             + ' AND CVE_PARENTESCO = ' + chr(39) +  edCveParentesco.Text  + chr(39) ;

                    Qry2 := GetSQLQuery( sUnico , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

                    if Qry2 <> nil then
                    begin
                       while not Qry2.eof do
                       begin
                           if Qry2.FieldByName('NUM').AsInteger >= 1 then
                           begin
                              MessageDlg( 'Solo puedes capturar una persona asociada con este parentesco', mtWarning, [mbOk], 0);
                              edCveParentesco.SetFocus;
                              edCveParentesco.Text := '';
                              edParentesco.Text    := '';
                              Realizado := False;
                           end;
                           Qry2.Next;
                       end;

                    end;
                 end;
                 Qry.Next;
            end
        end;
    end;
end;

end.
