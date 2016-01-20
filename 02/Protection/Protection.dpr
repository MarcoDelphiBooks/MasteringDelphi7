program Protection;

uses
  Forms,
  ProtForm in 'ProtForm.pas' {Form1},
  TestClass in 'TestClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
