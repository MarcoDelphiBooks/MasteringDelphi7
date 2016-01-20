program TryFinally;

uses
  Forms,
  TryForm in 'TryForm.pas' {Form1};

{$R *.res}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

