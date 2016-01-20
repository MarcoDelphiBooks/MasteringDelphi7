program Mdidemo;

uses
  Forms,
  Frame in 'Frame.pas' {MainForm},
  Child in 'Child.pas' {ChildForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

