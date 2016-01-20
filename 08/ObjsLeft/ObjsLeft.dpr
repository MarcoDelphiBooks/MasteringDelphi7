program ObjsLeft;

uses
  SimpleMemTest in 'SimpleMemTest.pas',
  Forms,
  ObjsForm in 'ObjsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
