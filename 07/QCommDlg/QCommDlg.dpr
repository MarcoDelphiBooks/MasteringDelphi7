program QCommDlg;

uses
  QForms,
  CdlgTest in 'CdlgTest.pas' {CommDlgForm};

{$R *.res}

begin
  Application.CreateForm(TCommDlgForm, CommDlgForm);
  Application.Run;
end.

