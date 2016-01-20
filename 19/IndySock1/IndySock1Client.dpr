program IndySock1Client;

uses
  Forms,
  IndySock1ClientForm in 'IndySock1ClientForm.pas' {FormClient};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormClient, FormClient);
  Application.Run;
end.
