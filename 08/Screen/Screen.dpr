program Screen;

uses
  Forms,
  ScreenF in 'ScreenF.pas' {MainForm},
  SecondF in 'SecondF.pas' {SecondForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
