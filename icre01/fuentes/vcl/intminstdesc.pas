// Sistema         : Clase de CR_FND_ENT_DES
// Fecha de Inicio : 08/02/2005
// Función forma   : Clase de CR_FND_ENT_DES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntMInstDesc;

interface                           
           
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, InterEdit;

Const
  //HERJA - TIPOA DE TASAS
  C_ACTIVA     = 'V';
  C_PASIVA     = 'F';
  C_REVOCABLE    = 'RE';
  C_IRREVOCABLE  = 'IR';

Type
  TMInstDesc= class;

  TwMInstDesc=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_FND_ENT_DES : TLabel; 
    edCVE_FND_ENT_DES : TEdit;
    lbDESC_ENT_DES : TLabel; 
    edDESC_ENT_DES : TEdit;
    lbB_CONTABILIZA : TLabel; 
    chB_CONTABILIZA : TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgB_TASA_ACTIVA: TRadioGroup;
    edIMP_LIMITE: TInterEdit;
    Label1: TLabel;
    rgCVE_TIPO_LINEA: TRadioGroup;
    Label2: TLabel;
    edDESC_GARANTIA: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure rgB_TASA_ACTIVAExit(Sender: TObject);
    procedure edIMP_LIMITEExit(Sender: TObject);
    procedure rgCVE_TIPO_LINEAExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TMInstDesc;
end;
 TMInstDesc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        DESC_ENT_DES             : TInterCampo;
        B_CONTABILIZA            : TInterCampo;
        {HERJA 19/03/2010 SE ANEXA EL TIPO DE TASA CON EL QUE SE CAPITALIZARA Y CAMPO DE LIMITE DE OPERACION}
        B_TASA_ACTIVA          : TInterCampo;
        IMP_LIMITE               : TInterCampo;
        {/HERJA}

        DESC_GARANTIA            : TInterCampo;
        CVE_TIPO_LINEA           : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMInstDesc.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      DESC_ENT_DES :=CreaCampo('DESC_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                DESC_ENT_DES.Caption:='Descripción Ent Des';
      B_CONTABILIZA :=CreaCampo('B_CONTABILIZA',ftString,tsNinguno,tsNinguno,True);
                B_CONTABILIZA.Caption:='Contabiliza';

      //---BEGIN   HERJA - TIPOS DE TASA
      B_TASA_ACTIVA :=CreaCampo('B_TASA_ACTIVA',ftString,tsNinguno,tsNinguno,True);
      With B_TASA_ACTIVA do
      Begin
         Size := 3;
         UseCombo := True;
         ComboLista.Add('0'); ComboDatos.Add(C_ACTIVA);
         ComboLista.Add('1'); ComboDatos.Add(C_PASIVA);
      end;
      B_TASA_ACTIVA.Caption:='Tipo de Capitalizacion de Credito';

      IMP_LIMITE := CreaCampo('IMP_LIMITE',ftFloat,tsNinguno,tsNinguno,True);
      IMP_LIMITE.Caption := 'Importe Limite de Operacion';
      //END

      DESC_GARANTIA :=CreaCampo('DESC_GARANTIA',ftString,tsNinguno,tsNinguno,True);
                DESC_ENT_DES.Caption:='Garantías';

      CVE_TIPO_LINEA :=CreaCampo('CVE_TIPO_LINEA',ftString,tsNinguno,tsNinguno,True);
      With CVE_TIPO_LINEA do
      Begin
         Size := 3;
         UseCombo := True;
         ComboLista.Add('0'); ComboDatos.Add(C_REVOCABLE);
         ComboLista.Add('1'); ComboDatos.Add(C_IRREVOCABLE);
      end;
      CVE_TIPO_LINEA.Caption:='Tipo de Línea';

      FKeyFields.Add('CVE_FND_ENT_DES');

      TableName := 'CR_FND_ENT_DES';
      UseQuery := True;
      HelpFile := 'InTMInstDesc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMInstDesc.Destroy;
begin inherited;
end;


function TMInstDesc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMInstDesc;
begin
   W:=TWMInstDesc.Create(Self);
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


Function TMInstDesc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMInstDesc.it','S');
      Try if Active then begin T.Param(0,CVE_FND_ENT_DES.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TMInstDesc.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_FND_ENT_DES********************)
(*                                                                              *)
(*  FORMA DE CR_FND_ENT_DES                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FND_ENT_DES********************)

procedure TwMInstDesc.FormShow(Sender: TObject);
begin
   //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
   Objeto.DESC_ENT_DES.Control:=edDESC_ENT_DES;
   Objeto.B_CONTABILIZA.Control:=chB_CONTABILIZA;

   //HERJA MARZO 2010
   Objeto.B_TASA_ACTIVA.Control:= rgB_TASA_ACTIVA;
   Objeto.IMP_LIMITE.Control  := edIMP_LIMITE;

   Objeto.DESC_GARANTIA.Control:=edDESC_GARANTIA;
   Objeto.CVE_TIPO_LINEA.Control:= rgCVE_TIPO_LINEA;
end;

procedure TwMInstDesc.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.DESC_ENT_DES.Control:=nil;
      Objeto.B_CONTABILIZA.Control:=nil;

      //HERJA MARZO 2010
      Objeto.B_TASA_ACTIVA.Control:= nil;
      Objeto.IMP_LIMITE.Control  := Nil;

      Objeto.DESC_GARANTIA.Control:=nil;
      Objeto.CVE_TIPO_LINEA.Control:= nil;
   //Objeto
end;

procedure TwMInstDesc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMInstDesc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   rgB_TASA_ACTIVA.ItemIndex:=-1;  //HERJA MARZO 2010
   rgCVE_TIPO_LINEA.ItemIndex:=-1;
end;

procedure TwMInstDesc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrFndEntDes.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TwMInstDesc.rgB_TASA_ACTIVAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgB_TASA_ACTIVA,True,'',True);
end;

procedure TwMInstDesc.edIMP_LIMITEExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.IMP_LIMITE.GetFromControl;
      If Objeto.IMP_LIMITE.AsFloat < 0 Then Begin
         VLMsg := 'Favor de Indicar un Importe mayor o igual a Cero';
         VlSalida   := False;
      End;
      InterForma1.ValidaExit(edIMP_LIMITE,VLSalida,VLMsg,True);
   End;
end;

procedure TwMInstDesc.rgCVE_TIPO_LINEAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_TIPO_LINEA,True,'',True);
end;

end.
