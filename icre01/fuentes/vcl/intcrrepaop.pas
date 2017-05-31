// Sistema         : Clase de CR_REL_PAG_OPRN
// Fecha de Inicio : 15/12/2004
// Función forma   : Clase de CR_REL_PAG_OPRN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrRePaOp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

IntGenCre,
IntParamCre,
IntValidPwd    // Valida el Pasword
;

Type
 TCrRePaOp = class; 

  TWCrRelPagOprn=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_REL_PAG_DISP : TLabel; 
    edID_REL_PAG_DISP : TEdit;
    chB_RENOVAR : TCheckBox; 
    edCVE_IMP_RENOV: TComboBox;
    edDIAS_PLAZO: TInterEdit;
    edPCT_ISR: TInterEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    edIMP_RENOVAR: TInterEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edTASA_NETA: TInterEdit;
    Label23: TLabel;
    Label24: TLabel;
    edF_VENCIMIENTO: TEdit;
    btnTasaInteres: TButton;
    Label5: TLabel;
    Label6: TLabel;
    edTASA_BRUTA: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chB_RENOVARClick(Sender: TObject);
    procedure btnTasaInteresClick(Sender: TObject);
    procedure edTASA_NETAExit(Sender: TObject);
    procedure edIMP_RENOVARExit(Sender: TObject);
    procedure edIMP_RENOVAREnter(Sender: TObject);
    procedure edCVE_IMP_RENOVChange(Sender: TObject);
    procedure edDIAS_PLAZOEnter(Sender: TObject);
    procedure edDIAS_PLAZOExit(Sender: TObject);
    procedure edTASA_NETAEnter(Sender: TObject);
    procedure edTASA_BRUTAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
      procedure AsignaF_Vencimiento(peF_VENCIMIENTO : TDateTime);
      procedure ActualizaValores;
      procedure ActualizaControl;
      procedure ActualizaValorTasa;
      procedure Recalcula;      
    public
    { Public declarations }
    Objeto : TCrRePaOp;
end;
 TCrRePaOp= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgID_CONTRATO              : Integer;
        vgIMP_CAPITAL              : Double;
        vgIMP_NETO_VTO             : Double;
        vgID_REL_PAG_DISP          : Integer;
        vgB_RENOVAR                : String;
        vgTASA_BRUTA               : Double;
        vgTASA_NETA                : Double;
        vgTASA_NETA_ORIG           : Double;
        vgDIAS_PLAZO               : Integer;
        vgCVE_IMP_RENOV            : String;
        vgIMP_RENOVAR              : Double;
        vgPCT_ISR                  : Double;

        vgB_ACTUALIZA              : Boolean;

        vgTMP_TASA_NETA            : Double;
        vgTMP_IMP_RENOVAR          : Double;
        vgTMP_DIAS_PLAZO           : Integer;

        ParamCre        : TParamCre;

        ID_REL_PAG_DISP          : TInterCampo;
        B_RENOVAR                : TInterCampo;
        TASA_NETA                : TInterCampo;
        TASA_BRUTA               : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        CVE_IMP_RENOV            : TInterCampo;
        IMP_RENOVAR              : TInterCampo;
        PCT_ISR                  : TInterCampo;

        procedure   GetDataFromControls;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

implementation

uses IntCrRnvPag;
{$R *.DFM}

constructor TCrRePaOp.Create( AOwner : TComponent );
begin Inherited;
      ID_REL_PAG_DISP :=CreaCampo('ID_REL_PAG_DISP',ftFloat,tsNinguno,tsNinguno,True);
                ID_REL_PAG_DISP.Caption:='Número de Rel Pag Disp';
      B_RENOVAR :=CreaCampo('B_RENOVAR',ftString,tsNinguno,tsNinguno,True);
                B_RENOVAR.Caption:='Renovar';
      TASA_NETA :=CreaCampo('TASA_NETA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_NETA.Caption:='Tasa Neta';
      TASA_BRUTA :=CreaCampo('TASA_BRUTA',ftFloat,tsNinguno,tsNinguno,False); // IMPORTANTE DE TRUE A FALSE
                TASA_BRUTA.Caption:='Tasa Bruta';
      DIAS_PLAZO :=CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PLAZO.Caption:='Dias Plazo';
      CVE_IMP_RENOV :=CreaCampo('CVE_IMP_RENOV',ftString,tsNinguno,tsNinguno,True);
                CVE_IMP_RENOV.Caption:='Clave de Imp Renov';
      With CVE_IMP_RENOV Do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Total al vencer'); comboDatos.Add('TO');
        ComboLista.Add('Solo Capital');    comboDatos.Add('CP');
        ComboLista.Add('Importe');         comboDatos.Add('IM');
        ComboLista.Add('No Renovar');      comboDatos.Add('NA');
        End;
      IMP_RENOVAR :=CreaCampo('IMP_RENOVAR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_RENOVAR.Caption:='Imp Renovar';
      PCT_ISR :=CreaCampo('PCT_ISR',ftFloat,tsNinguno,tsNinguno,True);
                PCT_ISR.Caption:='Pct Isr';

      FKeyFields.Add('ID_REL_PAG_DISP');

      TableName := 'CR_REL_PAG_OPRN';
      UseQuery := True;
      HelpFile := 'IntCrRePaOp.Hlp';
      ShowMenuReporte:=True;
end;


Destructor TCrRePaOp.Destroy;
begin inherited;
end;


function TCrRePaOp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelPagOprn;
begin
   W:=TWCrRelPagOprn.Create(Self);
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


Function TCrRePaOp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRePO.it','F');
      Try if Active then begin T.Param(0,ID_REL_PAG_DISP.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_REL_PAG_OPRN********************)
(*                                                                              *)
(*  FORMA DE CR_REL_PAG_OPRN                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_PAG_OPRN********************)

procedure TWCrRelPagOprn.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_REL_PAG_DISP.Control :=edID_REL_PAG_DISP;
  B_RENOVAR.Control       :=chB_RENOVAR;
  TASA_NETA.Control       :=edTASA_NETA;
  TASA_BRUTA.Control      :=edTASA_BRUTA;
  DIAS_PLAZO.Control      :=edDIAS_PLAZO;
  CVE_IMP_RENOV.Control   :=edCVE_IMP_RENOV;
  IMP_RENOVAR.Control     :=edIMP_RENOVAR;
  PCT_ISR.Control         :=edPCT_ISR;

  edF_VENCIMIENTO.Text := FormatDateTime(CFORMAT_FECHA, Objeto.Apli.DameFechaEmpresa + vgDIAS_PLAZO );

  vgB_ACTUALIZA   := True;
  vgTMP_TASA_NETA := vgTASA_NETA;
  End;
end;

procedure TWCrRelPagOprn.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_REL_PAG_DISP.Control:=nil;
  B_RENOVAR.Control:=nil;
  TASA_NETA.Control:=nil;
  TASA_BRUTA.Control:=nil;
  DIAS_PLAZO.Control:=nil;
  CVE_IMP_RENOV.Control:=nil;
  IMP_RENOVAR.Control:=nil;
  PCT_ISR.Control:=nil;
  End;
end;

procedure TWCrRelPagOprn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrRelPagOprn.InterForma1DespuesNuevo(Sender: TObject);
begin
 If edTASA_BRUTA.CanFocus Then edTASA_BRUTA.SetFocus;
 With Objeto Do
  Begin
  ID_REL_PAG_DISP.AsInteger := vgID_REL_PAG_DISP;
  B_RENOVAR.AsString        := vgB_RENOVAR;
  TASA_NETA.AsFloat         := vgTASA_NETA;
  TASA_BRUTA.AsFloat        := vgTASA_BRUTA;
  DIAS_PLAZO.AsInteger      := vgDIAS_PLAZO;
  CVE_IMP_RENOV.AsString    := vgCVE_IMP_RENOV;
  IMP_RENOVAR.AsFloat       := vgIMP_RENOVAR;
  PCT_ISR.AsFloat           := vgPCT_ISR;
  vgTMP_TASA_NETA           := vgTASA_NETA;
  End;
end;

procedure TWCrRelPagOprn.InterForma1DespuesModificar(Sender: TObject);
begin
 If edTASA_BRUTA.CanFocus Then edTASA_BRUTA.SetFocus;
  With Objeto Do
   Begin
   If (Trim(CVE_IMP_RENOV.AsString) = '') Then
      Begin
      B_RENOVAR.AsString     := vgB_RENOVAR;
      TASA_NETA.AsFloat      := vgTASA_NETA;
      TASA_BRUTA.AsFloat     := vgTASA_BRUTA;
      DIAS_PLAZO.AsInteger   := vgDIAS_PLAZO;
      CVE_IMP_RENOV.AsString := vgCVE_IMP_RENOV;
      IMP_RENOVAR.AsFloat    := vgIMP_RENOVAR;
      PCT_ISR.AsFloat        := vgPCT_ISR;
      vgTMP_TASA_NETA        := vgTASA_NETA;
      End
   Else
      Begin
      TASA_NETA.AsFloat      := vgTASA_NETA;
      TASA_BRUTA.AsFloat     := vgTASA_BRUTA;
      vgTMP_TASA_NETA        := vgTASA_NETA;
      End;
   End;
end;

procedure TWCrRelPagOprn.ActualizaValorTasa;
var vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA : Double;
begin
  With Objeto Do
   If ((Modo = moEdit) Or (Modo = moAppend)) And (vgB_ACTUALIZA) Then
    Begin
    // Buscar un disco duro
    GetDataFromControls;
      If ObtenTasasInteres( vgID_CONTRATO,
                            IMP_RENOVAR.AsFloat,
                            DIAS_PLAZO.AsInteger,
                            PCT_ISR.AsFloat, //MARA4356 PARA TASAS BRUTAS
                            StrToDateTime(edF_VENCIMIENTO.TEXT),//MARA4356 PARA TASAS BRUTAS
                            vlTASA_ASIG,
                            vlTASA_COSTO,
                            Apli
                          ) Then
      begin
         //TASA_NETA.AsFloat := vlTASA_ASIG;
         //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE
         //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
         BuscaTasaNeta(Apli, PCT_ISR.AsFloat, vlTASA_ASIG, StrToDateTime(edF_VENCIMIENTO.TEXT), vlTASA_NETA);
         TASA_NETA.AsFloat  := vlTASA_NETA;
         TASA_BRUTA.AsFloat := vlTASA_ASIG;
      end;
   End;
end;

procedure TWCrRelPagOprn.ActualizaValores;
var vlF_NVA_VTO : TDateTime;
    vlIMP_RENOVAR : Double;
    vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA  : Double;
begin
  With Objeto Do
   If (Modo = moEdit) Or (Modo = moAppend) Then
     Begin
     DIAS_PLAZO.GetFromControl;
     CVE_IMP_RENOV.GetFromControl;
     IMP_RENOVAR.GetFromControl;
     // Conforme a la lógica de negocio obtiene los nuevos valores
     LogicaNegocioPagares(vgIMP_CAPITAL,
                          vgIMP_NETO_VTO,
                          IMP_RENOVAR.AsFloat,
                          CVE_IMP_RENOV.AsString,
                          DIAS_PLAZO.AsInteger,
                          vlIMP_RENOVAR,
                          vlF_NVA_VTO,
                          Apli
                         );
     IMP_RENOVAR.AsFloat  := vlIMP_RENOVAR;
     // Si existe Importe a Renovar, entonces...
     If (vlIMP_RENOVAR > 0) Then
      Begin
        // Actualiza la Tasa de Interés
        If ObtenTasasInteres( vgID_CONTRATO,
                              vlIMP_RENOVAR,
                              DIAS_PLAZO.AsInteger,
                              PCT_ISR.AsFloat,//MARA4356 PARA TASAS BRUTAS
                              StrToDateTime(edF_VENCIMIENTO.Text),//MARA4356 PARA TASAS BRUTAS
                              vlTASA_ASIG,
                              vlTASA_COSTO,
                              Apli
                            ) Then
          begin
            //TASA_NETA.AsFloat := vlTASA_ASIG;
            //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE 
            //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
            BuscaTasaNeta(Apli, PCT_ISR.AsFloat, vlTASA_ASIG, StrToDateTime(edF_VENCIMIENTO.TEXT), vlTASA_NETA);
            TASA_NETA.AsFloat := vlTASA_NETA;
          end;
        End;

     // Bandera para evitar doble actualización al Cambiar el valor del Checkbox,
     // pues se dispara el evento OnClick de este
     vgB_ACTUALIZA := False;
     If (CVE_IMP_RENOV.AsString = CO_NO_RENOVAR) Then B_RENOVAR.AsString := CFALSO
     Else B_RENOVAR.AsString := CVERDAD;
     // Bandera para evitar doble actualización
     vgB_ACTUALIZA := True;
     AsignaF_Vencimiento(vlF_NVA_VTO);
     // Apaga Bandera de Cambios de Importe a Renovar
     End;
end;

procedure TWCrRelPagOprn.ActualizaControl;
begin
     // Habilita el Control de Importe a Renovar
     // únicamente cuando la opción se por "Importe Especifico"
     If (Objeto.CVE_IMP_RENOV.AsString = CO_IMPORTE) Then
      Begin
      edIMP_RENOVAR.ReadOnly := False;
      edIMP_RENOVAR.Font.Color := clWindowText;
      End
     Else
      Begin
      edIMP_RENOVAR.ReadOnly := True;
      edIMP_RENOVAR.Font.Color := clGrayText;
      End;
end;

procedure TWCrRelPagOprn.chB_RENOVARClick(Sender: TObject);
var vlIMP_RENOVAR : Double;
    vlF_NVA_VTO : TDateTime;
    vlCVE_IMP_RENOV : String;
    vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA : Double;
begin
  With Objeto Do
   If ((Modo = moEdit) Or (Modo = moAppend)) And (vgB_ACTUALIZA) Then
     Begin
     IMP_RENOVAR.GetFromControl;

     If chB_RENOVAR.Checked Then vlCVE_IMP_RENOV := CO_TOTAL_AL_VENCER // Constante definida en IntCrRnvPag
     Else vlCVE_IMP_RENOV := CO_NO_RENOVAR; // Constante definida en IntCrRnvPag
     // Conforme a la lógica de negocio obtiene los nuevos valores
     LogicaNegocioPagares(vgIMP_CAPITAL,
                          vgIMP_NETO_VTO,
                          IMP_RENOVAR.AsFloat,
                          vlCVE_IMP_RENOV,
                          DIAS_PLAZO.AsInteger,
                          vlIMP_RENOVAR,
                          vlF_NVA_VTO,
                          Apli
                         );
     IMP_RENOVAR.AsFloat    := vlIMP_RENOVAR;
     CVE_IMP_RENOV.AsString := vlCVE_IMP_RENOV;
     If ObtenTasasInteres( vgID_CONTRATO,
                           vlIMP_RENOVAR,
                           DIAS_PLAZO.AsInteger,
                           PCT_ISR.AsFloat,//MARA4356 PARA TASAS BRUTAS
                           StrToDateTime(edF_VENCIMIENTO.Text),//MARA4356 PARA TASAS BRUTAS
                           vlTASA_ASIG,
                           vlTASA_COSTO,
                           Apli
                         ) Then
        begin
            //TASA_NETA.AsFloat := vlTASA_ASIG;
            //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE
            //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
            BuscaTasaNeta(Apli, PCT_ISR.AsFloat, vlTASA_ASIG, StrToDateTime(edF_VENCIMIENTO.TEXT), vlTASA_NETA);
            TASA_NETA.AsFloat := vlTASA_NETA;
        end;
     AsignaF_Vencimiento(vlF_NVA_VTO);
     ActualizaValorTasa;
     ActualizaControl;
     End;
end;

procedure TWCrRelPagOprn.InterForma1DespuesShow(Sender: TObject);
begin
 With Objeto Do
   Begin
   AsignaF_Vencimiento(ObtenNvaFVto(DIAS_PLAZO.AsInteger, Apli));
   ActualizaControl;
   End;
end;

procedure TWCrRelPagOprn.AsignaF_Vencimiento(peF_VENCIMIENTO : TDateTime);
begin
  edF_VENCIMIENTO.Text := FormatDateTime(CFORMAT_FECHA, peF_VENCIMIENTO);
end;

procedure TWCrRelPagOprn.btnTasaInteresClick(Sender: TObject);
begin
  ActualizaValorTasa;
end;

procedure TWCrRelPagOprn.edTASA_NETAEnter(Sender: TObject);
begin
 With Objeto Do
   If ((Modo = moEdit) Or (Modo = moAppend)) And (vgB_ACTUALIZA) Then
    Begin
    GetDataFromControls;
    vgTMP_TASA_NETA := TASA_NETA.AsFloat;
    End;
end;

procedure TWCrRelPagOprn.Recalcula;
var vlTasa_Bruta : Double;
begin
  With Objeto Do
   If ((Modo = moEdit) Or (Modo = moAppend)) And (vgB_ACTUALIZA) Then
     Begin
     // Obtiene los valores de los controles
     GetDataFromControls;
     // Si hubo un cambio de tasa entonces...
     If (TASA_NETA.AsFloat <> vgTMP_TASA_NETA) Then
      Begin
         // Válida que la tasa se encuentre dentro de las Bandas de Mercado y si el usuario NO esta de acuerdo,
         {
         If Not ValidaTasaInteres( vgID_CONTRATO,
                                   IMP_RENOVAR.AsFloat,
                                   DIAS_PLAZO.AsInteger,
                                   PCT_ISR.AsFloat, //MARA4356 PARA TASAS BRUTAS
                                   StrToDateTime(edF_VENCIMIENTO.Text),//MARA4356 PARA TASAS BRUTAS
                                   TASA_NETA.AsFloat,
                                   Apli
                                 ) Then
           Begin
             If ConfirmacionNvaTasaInteres(vgID_CONTRATO, TASA_NETA.AsFloat) Then
               Begin
                 If Not (ValidaPassword(Objeto.Apli.Usuario, Objeto.Apli) = mrYes) Then
                    TASA_NETA.AsFloat := vgTMP_TASA_NETA;
                 // End If ValidaPassword(
               End // End If ConfirmacionNvaTasaInteres(
             Else
               TASA_NETA.AsFloat := vgTMP_TASA_NETA;
         End;
         }
         TASA_NETA.AsFloat := vgTMP_TASA_NETA;

         // Si se modificó; asigna nuevamente la TASA BRUTA
         BuscaTasaBruta(Objeto.Apli,
                        PCT_ISR.AsFloat,
                        TASA_NETA.AsFloat,
                        StrToDateTime(edF_VENCIMIENTO.Text),
                        vlTasa_Bruta
                      );
         TASA_BRUTA.AsFloat := vlTasa_Bruta;
      End; // If (TASA_NETA.AsFloat <> vgTMP_TASA_NETA) Then
     End;
end;

procedure TWCrRelPagOprn.edTASA_NETAExit(Sender: TObject);
begin
  Recalcula;
end;

procedure TWCrRelPagOprn.edCVE_IMP_RENOVChange(Sender: TObject);
begin
  ActualizaValores;
  ActualizaControl;
  ActualizaValorTasa;
end;

procedure TWCrRelPagOprn.edIMP_RENOVAREnter(Sender: TObject);
begin
 With Objeto Do
  If ((Modo = moEdit) Or (Modo = moAppend)) Then
    Begin
    IMP_RENOVAR.GetFromControl;
    vgTMP_IMP_RENOVAR := IMP_RENOVAR.AsFloat;
    End;
end;

procedure TWCrRelPagOprn.edIMP_RENOVARExit(Sender: TObject);
begin
 With Objeto Do
  If ((Modo = moEdit) Or (Modo = moAppend)) Then
    Begin
    IMP_RENOVAR.GetFromControl;
    If (vgTMP_IMP_RENOVAR <> IMP_RENOVAR.AsFloat) Then
      ActualizaValorTasa;
    End;
end;

procedure TWCrRelPagOprn.edDIAS_PLAZOEnter(Sender: TObject);
begin
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) Then
     Begin
     DIAS_PLAZO.GetFromControl;
     vgTMP_DIAS_PLAZO := Objeto.DIAS_PLAZO.AsInteger;
     End;
end;

procedure TWCrRelPagOprn.edDIAS_PLAZOExit(Sender: TObject);
begin
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) Then
     Begin
     DIAS_PLAZO.GetFromControl;
     If (vgTMP_DIAS_PLAZO <> DIAS_PLAZO.AsInteger) Then
      Begin
       If (Objeto.DIAS_PLAZO.AsInteger <= 0) Then
        MessageDlg('El plazo a indicar debe ser mayor a 0 cero.', mtWarning, [mbOk], 0);
       ActualizaValores;
       Recalcula;
      End;
     End;
end;

procedure TWCrRelPagOprn.edTASA_BRUTAExit(Sender: TObject);
var vlTASA_NETA : Double;
begin
  With Objeto Do
     Begin
     GetDataFromControls;
     vgTMP_TASA_NETA := TASA_NETA.AsFloat;
     BuscaTasaNeta(Apli,
                   PCT_ISR.AsFloat,
                   TASA_BRUTA.AsFloat,
                   StrToDateTime(edF_VENCIMIENTO.Text),
                   vlTASA_NETA
                  );
     TASA_NETA.AsFloat := vlTASA_NETA;
     End;
end;

procedure TCrRePaOp.GetDataFromControls;
begin
  ID_REL_PAG_DISP.GetFromControl;
  B_RENOVAR.GetFromControl;
  TASA_NETA.GetFromControl;
  TASA_BRUTA.GetFromControl;
  DIAS_PLAZO.GetFromControl;
  CVE_IMP_RENOV.GetFromControl;
  IMP_RENOVAR.GetFromControl;
  PCT_ISR.GetFromControl;
end;

procedure TWCrRelPagOprn.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  With Objeto Do
    Begin
         Realizado := True;
         If Not ValidaTasaInteres( vgID_CONTRATO,
                                   IMP_RENOVAR.AsFloat,
                                   DIAS_PLAZO.AsInteger,
                                   PCT_ISR.AsFloat, //MARA4356 PARA TASAS BRUTAS
                                   StrToDateTime(edF_VENCIMIENTO.Text),//MARA4356 PARA TASAS BRUTAS
                                   TASA_NETA.AsFloat,
                                   Apli
                                 ) Then
           Begin
             If ConfirmacionNvaTasaInteres(vgID_CONTRATO, TASA_NETA.AsFloat) Then
               Begin
                 If Not (ValidaPassword(Objeto.Apli.Usuario, Objeto.Apli) = mrYes) Then
                    Realizado := False;
                 // End If ValidaPassword(
               End // End If ConfirmacionNvaTasaInteres(
             Else
               Realizado := False;
           End;
   End;      
end;

end.
