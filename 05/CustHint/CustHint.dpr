program CustHint;

uses
  Forms,
  HintForm in 'HintForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

