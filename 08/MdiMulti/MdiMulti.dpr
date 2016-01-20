program MdiMulti;

uses
  Forms,
  Frame in 'Frame.pas' {MainForm},
  Child in 'Child.pas' {CircleChildForm},
  Child2 in 'Child2.pas' {BounceChildForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

