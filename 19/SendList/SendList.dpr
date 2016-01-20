program SendList;

uses
  Forms,
  SendForm in 'SendForm.pas' {MainForm};

{$R *.RES}

begin
  Application.Title := 'SimpleMail';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
