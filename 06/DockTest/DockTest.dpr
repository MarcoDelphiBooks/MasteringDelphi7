program DockTest;

uses
  Forms,
  DockForm in 'DockForm.pas' {Form1},
  DockHost in 'DockHost.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
