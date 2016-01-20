program ErrorLog;

uses
  Forms,
  LogForm in 'LogForm.pas' {FormLog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLog, FormLog);
  Application.Run;
end.
