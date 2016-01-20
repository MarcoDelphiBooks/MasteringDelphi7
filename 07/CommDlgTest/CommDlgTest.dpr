program CommDlgTest;

uses
  Forms,
  CdlgTest in 'CdlgTest.pas' {CommDlgForm};

{$R *.RES}

begin
  Application.CreateForm(TCommDlgForm, CommDlgForm);
  Application.Run;
end.

