program ObjDebDemo;

// demo of the use of the Object Debugger

uses
  Forms,
  ObjDebDemoForm in 'ObjDebDemoForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
