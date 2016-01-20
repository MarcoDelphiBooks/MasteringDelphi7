program FontBoxDemo;

uses
  Forms,
  FbDemoForm in 'FbDemoForm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
