program dirdemo;

uses
  Forms,
  DirDemoForm in 'DirDemoForm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
