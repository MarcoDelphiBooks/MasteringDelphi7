program BrokDebug;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  BrokDemoForm in 'BrokDemoForm.pas' {Form1},
  BrokWm in 'BrokWm.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
