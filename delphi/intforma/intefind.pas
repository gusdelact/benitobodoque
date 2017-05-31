unit IntEFind;
//-------------------------------------------------------------
// Sistema         :   Editor Findit
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Editor Findit
// Desarrollo por  :   Víctor Martínez Castro MACV.
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls;

Const KTitulo='Findit Editor´s';

type
  TWIntEFind = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Edit4: TEdit;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit2: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    TabSheet3: TTabSheet;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    Edit16: TEdit;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Edit15: TEdit;
    Edit17: TEdit;
    GroupBox9: TGroupBox;
    Label14: TLabel;
    Label18: TLabel;
    Edit14: TEdit;
    Edit18: TEdit;
    BitBtn1: TBitBtn;
    TabSheet6: TTabSheet;
    GroupBox10: TGroupBox;
    Label20: TLabel;
    Edit19: TEdit;
    Edit6: TEdit;
    Label21: TLabel;
    Edit20: TEdit;
    CheckBox2: TCheckBox;
    BitBtn2: TBitBtn;
    Label22: TLabel;
    Edit21: TEdit;
    RadioGroup2: TRadioGroup;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    TabSheet7: TTabSheet;
    Label19: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button7: TButton;
    Button4: TButton;
    Button3: TButton;
    Button8: TButton;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    GroupBox12: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    CheckBox3: TCheckBox;
    TabSheet9: TTabSheet;
    GroupBox13: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    TabSheet10: TTabSheet;
    GroupBox14: TGroupBox;
    Label36: TLabel;
    Edit35: TEdit;
    TabSheet11: TTabSheet;
    GroupBox15: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Edit36: TEdit;
    Edit37: TEdit;
    TabSheet12: TTabSheet;
    GroupBox16: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Edit50: TEdit;
    Edit51: TEdit;
    RadioGroup3: TRadioGroup;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    Label41: TLabel;
    Memo2: TMemo;
    GroupBox17: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Label45: TLabel;
    Edit52: TEdit;
    Label46: TLabel;
    Edit53: TEdit;
    GroupBox18: TGroupBox;
    Edit38: TEdit;
    Button17: TButton;
    BitBtn3: TBitBtn;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Button2: TButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StrSQL:TStringList;
    Archivo:String;
    DataBaseName:String;
    SessionName:String;
    FileName:String;
    FMainDir:String;
    Function DameCaption:string;
    Procedure CargaFile(Name:String);
  end;

var
  WIntEFind: TWIntEFind;

implementation

Uses IntWFind, IniFiles, UnSubGen;

{$R *.DFM}

Function TWIntEFind.DameCaption:string;
var S:string;
begin S:='';
      S:=Edit1.Text+','+Edit19.Text+',';
      if CheckBox1.Checked then S:=S+'SHOW_DETAIL,' else S:=S+',';
      S:=S+Edit4.Text+',';
      if RadioGroup1.ItemIndex=0 then S:=S+',,'
         else S:=S+Edit2.text+','+Edit3.text;
      DameCaption:=S;
end;

procedure TWIntEFind.BitBtn2Click(Sender: TObject);
begin if RadioGroup3.ItemIndex=1
         then begin MessageDlg('Guarde su Archivo y Despues utilice la Opción Ejecutar Multiple.',
                               mtError,[mbOK],0);
                   exit;
              end;
      if DataBaseName='' then
      begin ShowMessage('Debe de Asignar la Propiedad DataBaseName');
      end;
      Edit21.Text:= FinditAuto(
                    DameCaption,
                    Edit6.Text,// Campos
                    Edit7.Text, // Labels
                    Edit8.Text, // Tipos de Datos
                    Edit9.Text, // Forma de Captura
                    Edit20.Text, // Posiciones
                    Edit5.Text, // TablaPrincipal
                    Edit16.Text, // Campos Resultado
                    Edit10.Text, // Campos de Ordenamiento
                    Edit12.Text, // Campos Adicionales no Mostrados
                    Edit11.Text, // Tablas Adicionales
                    Edit13.Text, // Where Adicionales
                    Edit15.Text,
                    Edit17.Text,
                    DataBaseName,SessionName,
                    CheckBox2.Checked,
                    nil,'',0,True,'',False);
end;


procedure TWIntEFind.BitBtn1Click(Sender: TObject);
begin if Archivo='NINGUNO'
      then begin MessageDlg('Debe de Seleccionar un Nombre de Archivo',mtError,[mbOK],0);
                 exit;
           end;
      ModalResult:=mrOK;
      Close;
end;

procedure TWIntEFind.Button1Click(Sender: TObject);
Var Arr:TArr;
    i,Aux:Integer;
begin Memo1.Clear;
      Memo1.Lines.Add(' // Uses UnFindit;  Agregar esta Unidad ');
      Memo1.Lines.Add(' Var S:String; ');
      Memo1.Lines.Add(' S:=FindForMe('+#39+ExtractFileName(Archivo)+#39+'// Nombre Del Archivo it. ');
      Memo1.Lines.Add('               ,'+#39+#39+' // Lista de Campos Resultado');
      if Edit14.Text=''
 then Memo1.Lines.Add('               ,'+'nil'+' // DataSource ')
 else Memo1.Lines.Add('               ,'+#39+Edit14.Text+#39+' // DataSource ');
      Memo1.Lines.Add('               ,'+#39+Edit18.Text+#39+' // Lista de Campos Actualizables en DataSource');
      Memo1.Lines.Add('               ,'+#39+'<DataBaseName>'+#39+' // DataBaseName');
      Memo1.Lines.Add('               ,'+#39+#39+'); // SessionName');
if RadioGroup2.ItemIndex=0 then
 begin SeparaCampos(Edit16.Text, Arr,Aux,',');
       for i:=0 to Aux do
       begin Memo1.Lines.Add(' <Dato'+IntToStr(i)+'>:=FieldIt(S,'+IntToStr(i)+'); // Campo '+Arr[i]);
       end;
end
else Memo1.Lines.Add(' // Use Campo:=FieldIt(S,#Campo);');

end;






procedure TWIntEFind.Button3Click(Sender: TObject);
Var Ini:TIniFile;
begin SaveDialog1.FileName:=Archivo;
      if (Archivo='NINGUNO')or((Sender Is TButton) and (TButton(Sender).Name='Button8'))
      then begin if not SaveDialog1.Execute then exit;
                 Archivo:=SaveDialog1.FileName;
           end;
      Ini:=TIniFile.Create(Archivo);
      Caption:=KTitulo+'  ['+ExtractFileName(Archivo)+']';
      With Ini do
      begin WriteBool('Findit','SHOWALL',CheckBox2.Checked);
            WriteString('Findit','V_TITULO',Edit1.Text);
            WriteString('Findit','V_ANCHO',Edit19.Text);
            WriteInteger('Findit','V_CENTRADO',RadioGroup1.ItemIndex);
            WriteString('Findit','V_Y',Edit3.Text);
            WriteString('Findit','V_X',Edit2.Text);
            WriteInteger('Findit','MODO',RadioGroup2.ItemIndex);
            WriteString('Findit','DETALLE_ALTO',Edit4.Text);
              WriteBool('Findit','DETALLE_MOSTRAR',CheckBox1.Checked);
            WriteString('Findit','V_TABLA',Edit5.Text);
            WriteString('Findit','V_CAMPOS',Edit6.Text);
            WriteString('Findit','V_ETIQUETAS',Edit7.Text);
            WriteString('Findit','V_TIPOS',Edit8.Text);
            WriteString('Findit','V_CAPTURA',Edit9.Text);
            WriteString('Findit','V_POSICIONES',Edit20.Text);
            WriteString('Findit','V_ORDERBY',Edit10.Text);
            WriteString('Findit','V_ADD_TABLAS',Edit11.Text);
            WriteString('Findit','V_ADD_CAMPOS',Edit12.Text);
            WriteString('Findit','V_ADD_WHERE',Edit13.Text);
            WriteString('Findit','V_RESULTADOS',Edit16.Text);
            WriteString('Findit','V_DEF_VALORES',Edit15.Text);
            WriteString('Findit','V_DEF_TIPOS',Edit17.Text);
            WriteString('Findit','V_DS_TABLA',Edit14.Text);
            WriteString('Findit','V_DS_CAMPOS',Edit18.Text);

           WriteInteger('Findit','MULTI_MODO',RadioGroup3.ItemIndex);
            WriteString('Findit','MULTI_TITULO',Edit50.Text);
            WriteString('Findit','MULTI_ETIQUETAS',Edit51.Text);
            WriteString('Findit','MULTI_ARCHIVOS',Edit52.Text);
            WriteString('Findit','MULTI_RESULTADOS',Edit53.Text);

      end;
      Ini.Free;
end;

procedure TWIntEFind.Button4Click(Sender: TObject);
Var Ini:TIniFile;
begin OpenDialog1.FileName:=Archivo;
      if not OpenDialog1.Execute then exit;
      Archivo:=OpenDialog1.FileName;
      Caption:=KTitulo+'  ['+ExtractFileName(Archivo)+']';
      Ini:=TIniFile.Create(OpenDialog1.FileName);
      With Ini do
      begin CheckBox2.Checked:=ReadBool('Findit','SHOWALL',False);
            Edit1.Text:=ReadString('Findit','V_TITULO','');
            Edit19.Text:=ReadString('Findit','V_ANCHO','');
            RadioGroup1.ItemIndex:=ReadInteger('Findit','V_CENTRADO',0);
            Edit3.Text:=ReadString('Findit','V_Y','');
            Edit2.Text:=ReadString('Findit','V_X','');
            RadioGroup2.ItemIndex:=ReadInteger('Findit','MODO',0);
            Edit4.Text:=ReadString('Findit','DETALLE_ALTO','');
            CheckBox1.Checked:=ReadBool('Findit','DETALLE_MOSTRAR',False);
            Edit5.Text:=ReadString('Findit','V_TABLA','');
            Edit6.Text:=ReadString('Findit','V_CAMPOS','');
            Edit7.Text:=ReadString('Findit','V_ETIQUETAS','');
            Edit8.Text:=ReadString('Findit','V_TIPOS','');
            Edit9.Text:=ReadString('Findit','V_CAPTURA','');
            Edit20.Text:=ReadString('Findit','V_POSICIONES','');
            Edit10.Text:=ReadString('Findit','V_ORDERBY','');
            Edit11.Text:=ReadString('Findit','V_ADD_TABLAS','');
            Edit12.Text:=ReadString('Findit','V_ADD_CAMPOS','');
            Edit13.Text:=ReadString('Findit','V_ADD_WHERE','');
            Edit16.Text:=ReadString('Findit','V_RESULTADOS','');
            Edit15.Text:=ReadString('Findit','V_DEF_VALORES','');
            Edit17.Text:=ReadString('Findit','V_DEF_TIPOS','');
            Edit14.Text:=ReadString('Findit','V_DS_TABLA','');
            Edit18.Text:=ReadString('Findit','V_DS_CAMPOS','');

            RadioGroup3.ItemIndex:=ReadInteger('Findit','MULTI_MODO',0);
            Edit50.Text:=ReadString('Findit','MULTI_TITULO','');
            Edit51.Text:=ReadString('Findit','MULTI_ETIQUETAS','');
            Edit52.Text:=ReadString('Findit','MULTI_ARCHIVOS','');
            Edit53.Text:=ReadString('Findit','MULTI_RESULTADOS','');

      end;
      Ini.Free;
end;

Procedure TWIntEFind.CargaFile(Name:String);
Var Ini:TIniFile;
begin if Not FileExists(Name) then exit;
      Archivo:=Name;
      Caption:=KTitulo+'  ['+ExtractFileName(Name)+']';
      Ini:=TIniFile.Create(Name);
      With Ini do
      begin CheckBox2.Checked:=ReadBool('Findit','SHOWALL',False);
            Edit1.Text:=ReadString('Findit','V_TITULO','');
            Edit19.Text:=ReadString('Findit','V_ANCHO','');
            RadioGroup1.ItemIndex:=ReadInteger('Findit','V_CENTRADO',0);
            Edit3.Text:=ReadString('Findit','V_Y','');
            Edit2.Text:=ReadString('Findit','V_X','');
            RadioGroup2.ItemIndex:=ReadInteger('Findit','MODO',0);
            Edit4.Text:=ReadString('Findit','DETALLE_ALTO','');
            CheckBox1.Checked:=ReadBool('Findit','DETALLE_MOSTRAR',False);
            Edit5.Text:=ReadString('Findit','V_TABLA','');
            Edit6.Text:=ReadString('Findit','V_CAMPOS','');
            Edit7.Text:=ReadString('Findit','V_ETIQUETAS','');
            Edit8.Text:=ReadString('Findit','V_TIPOS','');
            Edit9.Text:=ReadString('Findit','V_CAPTURA','');
            Edit20.Text:=ReadString('Findit','V_POSICIONES','');
            Edit10.Text:=ReadString('Findit','V_ORDERBY','');
            Edit11.Text:=ReadString('Findit','V_ADD_TABLAS','');
            Edit12.Text:=ReadString('Findit','V_ADD_CAMPOS','');
            Edit13.Text:=ReadString('Findit','V_ADD_WHERE','');
            Edit16.Text:=ReadString('Findit','V_RESULTADOS','');
            Edit15.Text:=ReadString('Findit','V_DEF_VALORES','');
            Edit17.Text:=ReadString('Findit','V_DEF_TIPOS','');
            Edit14.Text:=ReadString('Findit','V_DS_TABLA','');
            Edit18.Text:=ReadString('Findit','V_DS_CAMPOS','');

            RadioGroup3.ItemIndex:=ReadInteger('Findit','MULTI_MODO',0);
            Edit50.Text:=ReadString('Findit','MULTI_TITULO','');
            Edit51.Text:=ReadString('Findit','MULTI_ETIQUETAS','');
            Edit52.Text:=ReadString('Findit','MULTI_ARCHIVOS','');
            Edit53.Text:=ReadString('Findit','MULTI_RESULTADOS','');

      end;
      Ini.Free;
end;


procedure TWIntEFind.FormShow(Sender: TObject);
begin if LocalizaArchivo(FileName,'FindIt\')
      then begin Archivo:=FileName; CargaFile(Archivo);
           end;
      ShortDateFormat:=ToFecha;
      Archivo:='NINGUNO';
      PageControl1.ActivePage:=TabSheet7;
      Caption:=FMainDir;
end;

procedure TWIntEFind.Button7Click(Sender: TObject);
begin Caption:=KTitulo+' [NINGUNO]';
      Archivo:='NINGUNO';
      CheckBox1.Checked:=False;
      CheckBox2.Checked:=False;
      RadioGroup1.ItemIndex:=0;
      RadioGroup2.ItemIndex:=0;
      Edit4.Text:='';
      Edit1.Text:='';
      Edit3.Text:='';
      Edit2.Text:='';
      Edit5.Text:='';
      Edit7.Text:='';
      Edit8.Text:='';
      Edit9.Text:='';
      Edit10.Text:='';
      Edit11.Text:='';
      Edit12.Text:='';
      Edit13.Text:='';
      Edit16.Text:='';
      Edit15.Text:='';
      Edit17.Text:='';
      Edit14.Text:='';
      Edit18.Text:='';
      Edit19.Text:='';
      Edit6.Text:='';
      Edit20.Text:='';
      Edit21.Text:='';
end;


procedure TWIntEFind.Button17Click(Sender: TObject);
begin Edit21.Text:=
      FindForMe(Edit38.text,
      '',
      '','',nil,'',DataBaseName,SessionName,'',False,'',False,StrSQL,'','',True,False);
end;




procedure TWIntEFind.BitBtn3Click(Sender: TObject);
begin ModalResult:=mrCancel;
      Close;
end;

end.
