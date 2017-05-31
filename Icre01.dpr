program ICRE01;

uses
  Forms,
  IntMain in 'icre01\fuentes\vcl\intmain.pas' {wPrincipal},
  IntDmMain in 'icre01\fuentes\vcl\intdmmain.pas' {dmMain: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TwPrincipal, wPrincipal);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
