// Sistema         : Clase de CR_FID_FIDECOM
// Fecha de Inicio : 22/07/2005
// Función forma   : Clase de CR_FID_FIDECOM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFidFide;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

IntParamCre,
IntGenCre,
IntSICC
;

const
 CO_CRREFDFI = 'CRREFDFI'; // Fol. Relación de FIDEICOMISO-Fideicomisario

Type
 TCrFidFide= class; 

  TWCrFidFidecom=Class(TForm)
    InterForma1             : TInterForma;
    lbNOM_FIDEICOMISAR : TLabel; 
    edNOM_FIDEICOMISAR : TEdit;
    lbNUM_LUGAR : TLabel;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNUM_LUGAR: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edNOM_FIDEICOMISARExit(Sender: TObject);
    procedure edNUM_LUGARExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TCrFidFide;

    function ExisteRelFideicomisoFideicomisario(peID_FID_FIDECOM : Integer;
                                                peNOM_FIDEICOMISAR : String;
                                                peID_FID_MAESTRO : Integer) : Boolean;

    function EstaOcupadoEseLugar(peID_FID_FIDECOM : Integer;
                                 peNOM_FIDEICOMISAR : String;
                                 peID_FID_MAESTRO : Integer;
                                 peNUM_LUGAR      : Integer;
                                 var psNOM_FIDEICOMISAR_OCUPA : String ) : Boolean;
end;
 TCrFidFide= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre : TParamCre;
        vgID_FID_MAESTRO : Integer;

        ID_FID_FIDECOM           : TInterCampo;
        ID_FID_MAESTRO           : TInterCampo;
        NOM_FIDEICOMISAR         : TInterCampo;
        NUM_LUGAR                : TInterCampo;
        SIT_FID_FIDECOM          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TCrFidFide.Create( AOwner : TComponent );
begin Inherited;
      ID_FID_FIDECOM :=CreaCampo('ID_FID_FIDECOM',ftFloat,tsNinguno,tsNinguno,True);
                ID_FID_FIDECOM.Caption:='Número de Fid Fidecom';
      ID_FID_MAESTRO :=CreaCampo('ID_FID_MAESTRO',ftFloat,tsNinguno,tsNinguno,True);
                ID_FID_MAESTRO.Caption:='Número de Fid Maestro';
      NOM_FIDEICOMISAR :=CreaCampo('NOM_FIDEICOMISAR',ftString,tsNinguno,tsNinguno,True);
                NOM_FIDEICOMISAR.Caption:='Nombre Fideicomisar';
      NUM_LUGAR :=CreaCampo('NUM_LUGAR',ftFloat,tsNinguno,tsNinguno,True);
                NUM_LUGAR.Caption:='Número Lugar';
      SIT_FID_FIDECOM :=CreaCampo('SIT_FID_FIDECOM',ftString,tsNinguno,tsNinguno,True);
                SIT_FID_FIDECOM.Caption:='Situación Fid Fidecom';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('ID_FID_FIDECOM');

      TableName := 'ADMIPROD.CR_FID_FIDECOM'; 
      UseQuery := True; 
      HelpFile := 'IntCrFidFide.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFidFide.Destroy;
begin inherited;
end;

function TCrFidFide.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFidFidecom;
begin
   W:=TWCrFidFidecom.Create(Self);
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

Function TCrFidFide.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiFi.it','F');
      Try if Active then begin T.Param(0,ID_FID_FIDECOM.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_FID_FIDECOM********************)
(*                                                                              *)
(*  FORMA DE CR_FID_FIDECOM                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FID_FIDECOM********************)

procedure TWCrFidFidecom.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   NOM_FIDEICOMISAR.Control := edNOM_FIDEICOMISAR;
   NUM_LUGAR.Control        := edNUM_LUGAR;
   Interforma1.MsgPanel := MsgPanel;
   End;
end;

procedure TWCrFidFidecom.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   NOM_FIDEICOMISAR.Control := Nil;
   NUM_LUGAR.Control        := Nil;
   Interforma1.MsgPanel := Nil;
   End;
end;

procedure TWCrFidFidecom.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFidFidecom.InterForma1DespuesNuevo(Sender: TObject);
begin If edNOM_FIDEICOMISAR.CanFocus Then edNOM_FIDEICOMISAR.SetFocus;
      Objeto.SIT_FID_FIDECOM.AsString := CSIT_AC;
end;

procedure TWCrFidFidecom.InterForma1DespuesModificar(Sender: TObject);
begin If edNOM_FIDEICOMISAR.CanFocus Then edNOM_FIDEICOMISAR.SetFocus;
end;

function TWCrFidFidecom.ExisteRelFideicomisoFideicomisario(peID_FID_FIDECOM : Integer;
                                                           peNOM_FIDEICOMISAR : String;
                                                           peID_FID_MAESTRO : Integer) : Boolean;
var vlstrSQL : String;
    vlnTOTAL : Integer;
begin
  vlstrSQL := '  SELECT COUNT(*) AS TOTAL FROM ADMIPROD.CR_FID_FIDECOM'+coCRLF+
              '  WHERE NOM_FIDEICOMISAR = '+SQLStr(peNOM_FIDEICOMISAR)+coCRLF+
              '    AND ID_FID_MAESTRO = '+IntToStr(peID_FID_MAESTRO)+coCRLF+
              '    AND ID_FID_FIDECOM <> '+IntToStr(peID_FID_FIDECOM)+coCRLF+
              '    AND SIT_FID_FIDECOM <> '+SQLStr(CSIT_CA)+coCRLF
              ;
  GetSQLInt(vlstrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TOTAL', vlnTOTAL, True);
  Result := vlnTOTAL > 0;
end;

function TWCrFidFidecom.EstaOcupadoEseLugar(peID_FID_FIDECOM : Integer;
                                            peNOM_FIDEICOMISAR : String;
                                            peID_FID_MAESTRO : Integer;
                                            peNUM_LUGAR      : Integer;
                                            var psNOM_FIDEICOMISAR_OCUPA : String ) : Boolean;
var vlstrSQL : String;
begin
  psNOM_FIDEICOMISAR_OCUPA := '';
  vlstrSQL := '  SELECT NOM_FIDEICOMISAR FROM ADMIPROD.CR_FID_FIDECOM'+coCRLF+
              '  WHERE NOM_FIDEICOMISAR <> '+SQLStr(peNOM_FIDEICOMISAR)+coCRLF+
              '    AND ID_FID_MAESTRO = '+IntToStr(peID_FID_MAESTRO)+coCRLF+
              '    AND ID_FID_FIDECOM <> '+IntToStr(peID_FID_FIDECOM)+coCRLF+
              '    AND SIT_FID_FIDECOM <> '+SQLStr(CSIT_CA)+coCRLF+
              '    AND NUM_LUGAR = '+IntToStr(peNUM_LUGAR)+coCRLF
              ;
  GetSQLStr(vlstrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'NOM_FIDEICOMISAR',
            psNOM_FIDEICOMISAR_OCUPA, True);
  Result := Trim(psNOM_FIDEICOMISAR_OCUPA) <> '';
end;

procedure TWCrFidFidecom.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
    vlNOM_FIDEICOMISAR_OCUPA : String;
begin
 With Objeto Do
   Begin
   Objeto.NOM_FIDEICOMISAR.GetFromControl;
   Objeto.NUM_LUGAR.GetFromControl;
   If (ExisteRelFideicomisoFideicomisario(Objeto.ID_FID_FIDECOM.AsInteger,
                                          Objeto.NOM_FIDEICOMISAR.AsString,
                                          vgID_FID_MAESTRO)) Then
     Begin
     MessageDlg('La relación indicada ya fue dada de alta con anterioridad. Verifique.',
                mtWarning, [mbOk], 0);
     Realizado := False;
     End
   Else If EstaOcupadoEseLugar(Objeto.ID_FID_FIDECOM.AsInteger,
                               Objeto.NOM_FIDEICOMISAR.AsString,
                               vgID_FID_MAESTRO,
                               Objeto.NUM_LUGAR.AsInteger,
                               vlNOM_FIDEICOMISAR_OCUPA )  Then
     Begin
     MessageDlg('El Fideicomisario "'+vlNOM_FIDEICOMISAR_OCUPA+'",'+coCRLF+
                'se encuentra ocupando el '+Objeto.NUM_LUGAR.AsString+'° Lugar. Verifique.',
                mtWarning, [mbOk], 0);
     Realizado := False;
     End
   Else
    Begin
     If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
     Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
     mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
       If (mrResult = mrYes) Then
        Begin
          If (IsNewData) Then
           Begin
           ID_FID_FIDECOM.AsInteger := ObtenFolio(CO_CRREFDFI, 'Problemas al Obtener el folio '+CO_CRREFDFI,Objeto.Apli);
           ID_FID_MAESTRO.AsInteger := vgID_FID_MAESTRO;
           F_ALTA.AsDateTime        := Apli.DameFechaEmpresa;
           CVE_USU_ALTA.AsString    := Apli.Usuario;
           End
          Else
           Begin
           F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
           CVE_USU_MODIFICA.AsString := Apli.Usuario;
           End;
         End;
    Realizado := mrResult = mrYes;
    End;
  End;  
end;

procedure TWCrFidFidecom.edNOM_FIDEICOMISARExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edNOM_FIDEICOMISAR.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNOM_FIDEICOMISAR.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFidFidecom.edNUM_LUGARExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edNUM_LUGAR.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNUM_LUGAR.Caption
   Else If (StrToInt(edNUM_LUGAR.Text) = 0) Then vlstrMsg := 'Favor de indicar el '+lbNUM_LUGAR.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

end.
